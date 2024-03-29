	page 0
;;;
;;; Universal Monitor 8086
;;;   Copyright (C) 2020 Haruo Asano
;;;

	CPU	8086

TARGET:	EQU	"8088"

;;;
;;; Memory
;;;

ROMSEG:	EQU	00000H		; CSEG
ROM_B:	EQU	08000H

RAMSEG:	EQU	0000H		; DSEG & SSEG

WORK_B:	EQU	400H	; unimon work area 400h - 500h
STACK:	EQU	600H	; unimon stack area 600h - 680h
U_STACK	EQU	STACK+100H	; 700H
BUFLEN:	EQU	24
VECSIZ:	EQU	256		; Number of vectors to be initialized

int21vec:	equ	21H * 4 ; INT 21H Vector table offset
intFFvec:	equ	0ffH *4 ; 8251 Vector table offset
;;;
;;; Options
;;;

USE_IDENT = 1			; CPU Identification
	
;;;
;;; Intel 8251
;;;

USARTD:	EQU	00H
USARTC:	EQU	01H
	
;;; Constants
CR:	EQU	0DH
LF:	EQU	0AH
BS:	EQU	08H
DEL:	EQU	7FH

XON  	equ	11h		; code DC1
XOFF	equ	13h		; code DC3
BUFSIZ	equ	240
FULSIZ	equ	BUFSIZ-192	;Buffer almost full
RBLOW	equ	10

F_bitSize	equ	16
f_msk_bit	equ	0000111111010101b

Tbit_ON_	equ	0000000100000000b
Tbit_OFF	equ	0000111011010101b

INIT_FL_	equ	0000001000000000b		; init user FL value
IBIT_OFF	equ	0000110111010101b

	ASSUME	CS:CODE, DS:DATA, SS:DATA, ES:NOTHING

;;;
;;; ROM area
;;;

	SEGMENT	CODE
	
	ORG	ROM_B

CSTART:
	MOV	AX,RAMSEG
	MOV	DS,AX
	MOV	SS,AX
	MOV	SP,STACK

	;; 
	
	CALL	INIT

	MOV	AX,RAMSEG
	MOV	[CURSEG],AX
	IF RAMSEG = 0
	MOV	AX,VECSIZ*4
	ELSE
	XOR	AX,AX
	ENDIF
	MOV	[DSADDR],AX
	MOV	[GADDR],AX
	MOV	[SADDR],AX
	MOV	AL,'I'
	MOV	[HEXMOD],AL
	XOR	AL,AL
	MOV	[PSPEC],AL

	; init break point
	mov	[bflg], al	; clear break flag
	nop
	;; Initialize register value
	XOR	AX,AX
	MOV	BX,REG_B
	MOV	CX,(REG_E - REG_B)/2
IR0:
	MOV	[BX],AX
	INC	BX
	INC	BX
	DEC	CX
	JNE	IR0

	mov	ax, ROMSEG
	mov	[REGCS], ax
	; init break point segment
	mov	[brkcs], ax

	mov	ax, U_STACK
	mov	[REGIP], ax
	; init break point ip
	mov	[brkip], ax

	MOV	AX,RAMSEG
	MOV	[REGDS],AX
	MOV	[REGSS],AX
	MOV	AX,U_STACK
	MOV	[REGSP],AX

	; init user FL : set interrupt (sti)
	mov	ax, INIT_FL_
	mov	[REGF], ax

	;; Initialize vector
	XOR	AX,AX
	MOV	ES,AX
	MOV	SI,INIVEC
	MOV	DI,AX
	MOV	CX,VECSIZ*2
INI0:	
	MOV	AX,CS:[SI]
	INC	SI
	INC	SI
	MOV	ES:[DI],AX
	INC	DI
	INC	DI
	DEC	CX
	JZ	INI2
	CMP	SI,INIVECE
	JNZ	INI0
	MOV	AX,INTDMY
	MOV	BX,ROMSEG
INI1:
	MOV	ES:[DI],AX
	INC	DI
	INC	DI
	MOV	ES:[DI],BX
	INC	DI
	INC	DI
	DEC	CX
	DEC	CX
	JNZ	INI1
INI2:
	; init INT 21H
	mov	di, int21vec
	mov	ax, INTFNC
	mov	[di], ax

	
	; init INT FFH (8251 RXD)

	mov	di, intFFvec
	mov	ax, intsr
	mov	[di], ax

	mov	byte ptr [tsh], FULSIZ
	sti	; enable interrupt

	;; Opening message
	MOV	BX,OPNMSG
	CALL	MSGOUT

	IF USE_IDENT

	PUSHF			; Begin: (from Application Note 485)
	POP	AX
	MOV	CX,AX
	AND	AX,0FFFH
	PUSH	AX
	POPF
	PUSHF
	POP	AX
	AND	AX,0F000H
	CMP	AX,0F000H
	JNE	ID_286

	PUSH	SP
	POP	DX
	CMP	DX,SP
	JE	ID_UNK		; End:

	MOV	AX,0100H
	DB	0D5H,00H	; AAD 00H
	OR	AL,AL
	JNE	ID_V30
	;; 8086/80186
	MOV	AL,11H
	MOV	BX,IM86
	JMP	IDE
ID_V30:
	;; V30
	MOV	AL,14H
	MOV	BX,IMV30
	JMP	IDE
ID_286:
	OR	CX,0F000H	; Begin: (from Application Note 485)
	PUSH	CX
	POPF
	PUSHF
	POP	AX
	AND	AX,0F000H
	JNE	ID_386		; End
	;; 80286
	MOV	AL,31H
	MOV	BX,IM286
	JMP	IDE
ID_386:
	;; 80386
	MOV	AL,71H
	MOV	BX,IM386
	JMP	IDE
	;; Unknown
ID_UNK:
	XOR	AL,AL
	MOV	BX,IMUNK
IDE:
	MOV	[PSPEC],AL
	push	bx
	mov	bx, cpum
	CALL	MSGOUT
	pop	bx
	CALL	MSGOUT
	
	ENDIF
	
WSTART:
	MOV	BX,PROMPT
	CALL	MSGOUT
	CALL	GETLIN
	MOV	BX,INBUF
	CALL	SKIPSP
	CALL	UPPER
	AND	AL,AL
	JZ	WSTART

	CMP	AL,'D'
	JNE	M00
	JMP	DUMP
M00:	
	CMP	AL,'G'
	JNE	M01
	JMP	GO
M01:
	CMP	AL,'S'
	JNE	M02
	JMP	SETM

M02:	
	CMP	AL,'L'
	JNE	M03
	JMP	LOADH
M03:

	CMP	AL,'R'
	JNE	M05
	JMP	REG

M05:
	CMP	AL,'T'
	JNE	M06
	JMP	Trace

M06:
ERR:
	MOV	BX,ERRMSG
	CALL	MSGOUT
	JMP	WSTART

;;;
;;; DUMP memory
;;;

DUMP:
	INC	BX
	CALL	RDHEX
	OR	CL,CL
	JNZ	DP0
	;; No arg.
	CALL	SKIPSP
	OR	AL,AL
	JNZ	ERR

	MOV	DX,[DSADDR]
	ADD	DX,128
	MOV	[DEADDR],DX
	JMP	DPM

	;; 1st arg. found
DP0:
	MOV	AL,[BX]
	CMP	AL,':'
	JNZ	DP01
	MOV	[CURSEG],DX
	INC	BX
	CALL	RDHEX
	OR	CL,CL
	JZ	ERR
DP01:	
	MOV	[DSADDR],DX
	MOV	AL,[BX]
	CMP	AL,','
	JZ	DP1
	OR	AL,AL
	JNZ	ERR
	;; No 2nd arg.
	ADD	DX,128
	MOV	[DEADDR],DX
	JMP	DPM
DP1:
	INC	BX
	CALL	RDHEX
	CALL	SKIPSP
	OR	CL,CL
	JZ	ERR
	MOV	AL,[BX]
	OR	AL,AL
	JNZ	ERR
	INC	DX
	MOV	[DEADDR],DX
DPM:
	;; DUMP main
	MOV	ES,[CURSEG]
	MOV	SI,[DSADDR]
	AND	SI,0FFF0H
	XOR	AL,AL
	MOV	[DSTATE],AL
DPM0:
	CALL	DPL
	CALL	CONST
	JNZ	DPM1
	MOV	AL,[DSTATE]
	CMP	AL,2
	JC	DPM0
	MOV	BX,[DEADDR]
	MOV	[DSADDR],BX
	JMP	WSTART
DPM1:
	MOV	[DSADDR],SI
	CALL	CONIN
	JMP	WSTART

DPL:
	;; DUMP	line
	MOV	AX,[CURSEG]
	CALL	HEXOUT4
	MOV	AL,':'
	CALL	CONOUT
	MOV	AX,SI
	CALL	HEXOUT4
	MOV	BX,DSEP0
	CALL	MSGOUT
	MOV	DI,INBUF
	MOV	CX,16
DPL0:
	CALL	DPB
	LOOP	DPL0

	MOV	BX,DSEP1
	CALL	MSGOUT

	MOV	DI,INBUF
	MOV	CX,16
DPL1:
	MOV	AL,[DI]
	INC	DI
	CMP	AL,' '
	JC	DPL2
	CMP	AL,7FH
	JNC	DPL2
	CALL	CONOUT
	JMP	DPL3
DPL2:
	MOV	AL,'.'
	CALL	CONOUT
DPL3:
	LOOP	DPL1
	JMP	CRLF

DPB:
	;; DUMP byte
	MOV	AL,' '
	CALL	CONOUT
	MOV	AL,[DSTATE]
	OR	AL,AL
	JNZ	DPB2
	;; State 0
	CMP	SI,[DSADDR]
	JZ	DPB1
DPB0:
	;; Still 0 or 2
	MOV	AL,' '
	MOV	[DI],AL
	CALL	CONOUT
	MOV	AL,' '
	CALL	CONOUT
	INC	SI
	INC	DI
	RET
DPB1:
	;; Found start address
	MOV	AL,1
	MOV	[DSTATE],AL
DPB2:
	MOV	AL,[DSTATE]
	CMP	AL,1
	JNZ	DPB0		; state 2
	;; DUMP state 1
	MOV	AL,ES:[SI]
	MOV	[DI],AL
	CALL	HEXOUT2
	INC	SI
	INC	DI

	CMP	SI,[DEADDR]
	JNZ	DPB3
	;; Found end address
	MOV	AL,2
	MOV	[DSTATE],AL
DPB3:
	RET

;;;
;;; GO address
;;; 

GO:
	xor 	al, al
	mov	[bflg], al

	INC	BX
	CALL	RDHEX
	OR	CL,CL
	JZ	G1
	MOV	AL,[BX]
	CMP	AL,':'
	JNE	G0

	MOV	[REGCS],DX
	INC	BX
	CALL	RDHEX
	OR	CL,CL
	JZ	GE
G0:
	MOV	[REGIP],DX
	CALL	SKIPSP
G1:
	MOV	AL,[BX]
	or	al, al
	je	go_go

	CMP	AL,','
	JNZ	GE

	INC	BX
	CALL	RDHEX
	OR	CL,CL
	jnz	g2
GE:
	JMP	ERR

g2:
	MOV	AL,[BX]
	CMP	AL,':'
	JNE	G0_0

	MOV	[brkcs],DX
	INC	BX
	CALL	RDHEX
	OR	CL,CL
	JZ	GE

G0_0:
	MOV	[brkip],DX
	CALL	SKIPSP
	OR	AL,AL
	JNZ	GE

	mov	al, 1
	mov	[bflg], al

go_go:
	mov	al, [bflg]
	or	al, al
	je	go_anywhere

; set break point

	mov	ax, [brkcs]
	mov	es, ax
	mov	si, [brkip]
	mov	al, es:[si]	; get a code at break point
	mov	[bp_code], al
	mov	al, 0CCH	; int 03h code
	mov	es:[si], al	; set break point

go_anywhere:
	MOV	SS,[REGSS]
	MOV	SP,[REGSP]
	
	MOV	AX,[REGF]
	PUSH	AX
	MOV	AX,[REGCS]
	PUSH	AX
	MOV	AX,[REGIP]
	PUSH	AX

	MOV	AX,[REGAX]
	MOV	BX,[REGBX]
	MOV	CX,[REGCX]
	MOV	DX,[REGDX]
	MOV	BP,[REGBP]
	MOV	SI,[REGSI]
	MOV	DI,[REGDI]
	MOV	ES,[REGES]
	MOV	DS,[REGDS]
	IRET

;;;
;;; SET memory
;;;

SETM:
	INC	BX
	CALL	RDHEX
	OR	CL,CL
	JZ	SM1
	MOV	AL,[BX]
	CMP	AL,':'
	JNE	SM0
	MOV	[CURSEG],DX
	INC	BX
	CALL	RDHEX
	OR	CL,CL
	JZ	SME
SM0:
	MOV	[SADDR],DX
	CALL	SKIPSP
	MOV	AL,[BX]
	OR	AL,AL
	JNZ	SME
SM1:
	MOV	AX,[CURSEG]
	MOV	ES,AX
	CALL	HEXOUT4
	MOV	AL,':'
	CALL	CONOUT
	MOV	SI,[SADDR]
	MOV	AX,SI
	CALL	HEXOUT4
	MOV	BX,DSEP1
	CALL	MSGOUT
	MOV	AL,ES:[SI]
	CALL	HEXOUT2
	MOV	AL,' '
	CALL	CONOUT
	CALL	GETLIN
	MOV	BX,INBUF
	CALL	SKIPSP
	MOV	AL,[BX]
	OR	AL,AL
	JNZ	SM2
	;; Empty (Increment address)
	INC	SI
	MOV	[SADDR],SI
	JMP	SM1
SM2:
	CMP	AL,'-'
	JNZ	SM3
	;; '-' (Decrement address)
	DEC	SI
	MOV	[SADDR],SI
	JMP	SM1
SM3:
	CMP	AL,'.'
	JNZ	SM4
	;; '.' (Quit)
	JMP	WSTART
SM4:
	CALL	RDHEX
	OR	CL,CL
	JZ	SME
	MOV	ES:[SI],DL
	INC	SI
	MOV	[SADDR],SI
	JMP	SM1
SME:
	JMP	ERR

;;;
;;; LOAD HEX file
;;;

LOADH:
	INC	BX
	CALL	RDHEX
	OR	CL,CL
	JZ	LH0
	MOV	AL,[BX]
	CMP	AL,':'
	JNE	LH1
	MOV	[CURSEG],DX
	INC	BX
	CALL	RDHEX
	OR	CL,CL
	JZ	LHE
	JMP	LH1
LH0:
	XOR	DX,DX
LH1:
	MOV	AL,[BX]
	OR	AL,AL
	JNZ	LHE
	MOV	SI,DX
	MOV	ES,[CURSEG]

LH2:	
	mov	al, '.'
	call	CONOUT
	
	CALL	CONIN
	CALL	UPPER
	CMP	AL,'S'
	JE	LHS0
	CMP	AL,':'
	JE	LHI0
LH3:
	;; Skip to EOL
	CMP	AL,CR
	JE	LH2
	CMP	AL,LF
	JE	LH2
	CALL	CONIN
	JMP	LH3
LHE:
	JMP	ERR

LHI0:
	CALL	HEXIN
	MOV	CL,AL		; Checksum
	MOV	BL,AL		; Length

	CALL	HEXIN
	MOV	DH,AL		; Address H
	ADD	CL,AL		; Checksum

	CALL	HEXIN
	MOV	DL,AL		; Address L
	ADD	CL,AL		; Checksum

	MOV	DI,DX
	ADD	DI,SI		; Add offset

	CALL	HEXIN
	MOV	[RECTYP],AL	; Record Type
	ADD	CL,AL		; Checksum

	OR	BL,BL		; Check length
	JZ	LHI3
LHI1:
	CALL	HEXIN
	ADD	CL,AL		; Checksum

	MOV	BH,[RECTYP]
	OR	BH,BH
	JNZ	LHI2

	MOV	ES:[DI],AL
	INC	DI
LHI2:
	DEC	BL
	JNZ	LHI1
LHI3:
	CALL	HEXIN
	ADD	AL,CL
	JNZ	LHIE		; Checksum error
	MOV	AL,[RECTYP]
	OR	AL,AL
	JZ	LH3

LHSR:
	call	CRLF
	JMP	WSTART
LHIE:
	MOV	BX,IHEMSG
	CALL	MSGOUT
	JMP	WSTART

LHS0:
	CALL	CONIN
	MOV	[RECTYP],AL

	CALL	HEXIN
	MOV	BL,AL		; Length+3
	MOV	CL,AL		; Checksum

	CALL	HEXIN
	MOV	DH,AL		; Address H
	ADD	CL,AL		; Checksum
	
	CALL	HEXIN
	MOV	DL,AL		; Address L
	ADD	CL,AL		; Checksum

	MOV	DI,DX
	ADD	DI,SI		; Add offset

	SUB	BL,3
	JC	LHSE		; Length error
	JZ	LHS3
LHS1:
	CALL	HEXIN
	ADD	CL,AL		; Checksum

	MOV	BH,[RECTYP]
	CMP	BH,'1'
	JNZ	LHS2

	MOV	ES:[DI],AL
	INC	DI
LHS2:
	DEC	BL
	JNZ	LHS1
LHS3:
	CALL	HEXIN
	ADD	AL,CL
	CMP	AL,0FFH
	JNE	LHSE		; Checksum error

	MOV	AL,[RECTYP]
	CMP	AL,'9'
	JZ	LHSR
	JMP	LH3
LHSE:
	MOV	BX,SHEMSG
	CALL	MSGOUT
	JMP	WSTART

;;;
;;; Register
;;; 
REG:
	INC	BX
	CALL	SKIPSP
	CALL	UPPER
	OR	AL,AL
	JNE	RG0
	CALL	RDUMP
	JMP	WSTART
RG0:
	MOV	SI,RNTAB
RG1:
	CMP	AL,CS:[SI]
	JE	RG2		; Character match
	MOV	CL,CS:1[SI]
	OR	CL,CL
	JE	RGE
	ADD	SI,6
	JMP	RG1
RG2:
	MOV	AL,CS:1[SI]
	CMP	AL,0FH
	JNE	RG3
	;; Next table
	MOV	SI,CS:2[SI]
	INC	BX
	MOV	AL,[BX]
	CALL	UPPER
	JMP	RG1
RG3:	
	OR	AL,AL		; Found end mark
	JE	RGE

	MOV	CL,CS:1[SI]
	MOV	BX,CS:4[SI]
	CALL	MSGOUT
	MOV	AL,'='
	CALL	CONOUT
	MOV	BX,CS:2[SI]
	AND	CL,07H
	PUSH	BX
	PUSH	CX
	CMP	CL,1
	JNE	RG4
	;; 8 bit register
	MOV	AL,[BX]
	CALL	HEXOUT2
	JMP	RG5
RG4:
	;; 16 bit register
	MOV	AX,[BX]
	CALL	HEXOUT4
RG5:
	MOV	AL,' '
	CALL	CONOUT
	CALL	GETLIN
	MOV	BX,INBUF
	CALL	RDHEX
	OR	CL,CL
	JE	RGR
	POP	CX
	POP	BX
	CMP	CL,1
	JNE	RG6
	;; 8 bit register
	MOV	[BX],DL
	JMP	RG7
RG6:
	;; 16 bit register
	MOV	[BX],DX
RG7:
RGR:
	JMP	WSTART
RGE:
	JMP	ERR
	
RDUMP:
	MOV	SI,RDTAB
RD0:	
	MOV	BX,CS:[SI]
	OR	BX,BX
	JZ	RD1
	CALL	MSGOUT
	INC	SI
	INC	SI
	MOV	BX,CS:[SI]
	MOV	AX,[BX]
	CALL	HEXOUT4
	INC	SI
	INC	SI
	JMP	RD0
RD1:	
; Flag bit image

	mov	bx, FLGB
	CALL	MSGOUT		;" FLb="

	mov	di, F_bit
	mov	bx, Fbiton
	mov	cl, 16
	mov	ax, [REGF]
	and	ax, f_msk_bit

fb_loop:
	shl	ax, 1
	jc	rdf1

	mov	byte ptr [di], '.'
	jmp	rdf2

rdf1:
	mov	ch, [bx]
	mov	[di], ch
rdf2:
	inc	bx
	inc	di
	dec	cl
	jnz	fb_loop

	mov	byte ptr [di],0
	mov	bx, F_bit
	CALL	MSGOUT		;"....ODITSZ.A.P.C"
	
	JMP	CRLF
	
;;;
;;; T address
;;; 

Trace:
	INC	BX
	CALL	RDHEX
	OR	CL,CL
	JZ	T1
	MOV	AL,[BX]
	CMP	AL,':'
	JNE	T0

	MOV	[REGCS],DX
	INC	BX
	CALL	RDHEX
	OR	CL,CL
	JZ	TE
T0:
	MOV	[REGIP],DX
	CALL	SKIPSP
T1:
	MOV	AL,[BX]
	or	al, al
	je	To_go

TE:
	JMP	ERR

To_go:
	MOV	SS,[REGSS]
	MOV	SP,[REGSP]
	
	MOV	AX,[REGF]
	or	ax, Tbit_ON_
;	and	ax, IBIT_OFF

	PUSH	AX
	MOV	AX,[REGCS]
	PUSH	AX
	MOV	AX,[REGIP]
	PUSH	AX

	MOV	AX,[REGAX]
	MOV	BX,[REGBX]
	MOV	CX,[REGCX]
	MOV	DX,[REGDX]
	MOV	BP,[REGBP]
	MOV	SI,[REGSI]
	MOV	DI,[REGDI]
	MOV	ES,[REGES]
	MOV	DS,[REGDS]
	IRET

;;;
;;; Other support routines
;;;

MSGOUT:
	MOV	AL,CS:[BX]
	AND	AL,AL
	JZ	MSGOE
	CALL	CONOUT
	INC	BX
	JMP	MSGOUT
MSGOE:
	RET

STROUT:
	MOV	AL,[BX]
	AND	AL,AL
	JZ	STROE
	CALL	CONOUT
	INC	BX
	JMP	STROUT
STROE:
	RET

HEXOUT4:
	PUSH	AX
	MOV	AL,AH
	CALL	HEXOUT2
	POP	AX
HEXOUT2:
	PUSH	AX
	SHR	AL,1
	SHR	AL,1
	SHR	AL,1
	SHR	AL,1
	CALL	HEXOUT1
	POP	AX
HEXOUT1:
	AND	AL,0FH
	ADD	AL,'0'
	CMP	AL,'9'+1
	JC	HO10
	ADD	AL,'A'-'9'-1
HO10:
	JMP	CONOUT

HEXIN:
	XOR	AL,AL
	CALL	HI0
	SHL	AL,1
	SHL	AL,1
	SHL	AL,1
	SHL	AL,1
HI0:
	MOV	CH,AL
	CALL	CONIN
	CALL	UPPER
	CMP	AL,'0'
	JC	HIR
	CMP	AL,'9'+1
	JC	HI1
	CMP	AL,'A'
	JC	HIR
	CMP	AL,'F'+1
	JNC	HIR
	SUB	AL,'A'-'9'-1
HI1:
	SUB	AL,'0'
	OR	AL,CH
HIR:
	RET

CRLF:
	MOV	AL,CR
	CALL	CONOUT
	MOV	AL,LF
	JMP	CONOUT

GETLIN:
	MOV	BX,INBUF
	XOR	CL,CL
GL0:
	CALL	CONIN
	CMP	AL,CR
	JZ	GLE
	CMP	AL,LF
	JZ	GLE
	CMP	AL,BS
	JZ	GLB
	CMP	AL,DEL
	JZ	GLB
	CMP	AL,' '
	JC	GL0
	CMP	AL,80H
	JNC	GL0
	CMP	CL,BUFLEN-1
	JNC	GL0		; Too long
	MOV	[BX],AL
	CALL	CONOUT
	INC	BX
	INC	CL
	JMP	GL0
GLB:
	AND	CL,CL
	JZ	GL0
	DEC	BX
	DEC	CL
	MOV	AL,BS
	CALL	CONOUT
	MOV	AL,' '
	CALL	CONOUT
	MOV	AL,BS
	CALL	CONOUT
	JMP	GL0
GLE:
	CALL	CRLF
	MOV	AL,00H
	MOV	[BX],AL
	RET
	
SKIPSP:
	MOV	AL,[BX]
	CMP	AL,' '
	JNE	SSR
	INC	BX
	JMP	SKIPSP
SSR:
	RET

UPPER:
	CMP	AL,'a'
	JC	UPR
	CMP	AL,'z'+1
	JNC	UPR
	ADD	AL,'A'-'a'
UPR:
	RET

RDHEX:
	CALL	SKIPSP
	XOR	CL,CL
	XOR	DX,DX
RH0:
	MOV	AL,[BX]
	CALL	UPPER
	CMP	AL,'0'
	JC	RHE
	CMP	AL,'9'+1
	JC	RH1
	CMP	AL,'A'
	JC	RHE
	CMP	AL,'F'+1
	JNC	RHE
	SUB	AL,'A'-'9'-1
RH1:
	SUB	AL,'0'
	SHL	DX,1
	SHL	DX,1
	SHL	DX,1
	SHL	DX,1
	OR	DL,AL
	INC	BX
	INC	CL
	JMP	RH0
RHE:
	RET

;-----------------------
; INT 21H function call 
;-----------------------
INTFNC:
	; get a charactor : AH = 7
	; return AL : charactor

	push	bp
	mov	bp, sp
	push	[bp+6]
	popf		; get user FL condition
	pop	bp

	cmp	ah, 7
	jnz	nfnc1
	call	CONIN
	iret
nfnc1:
	; put a charactor : AH = 2
	; input : DL : charactor
	cmp	ah, 2
	jnz	nfnc2		; no support function
	mov	al, dl
	call	CONOUT
	iret

nfnc2:
	; check key status : AH = 0BH
	; OUTPUT : AL : 0     ( key is not exist )
	;             : 0FFH  ( key is exist )
	cmp	ah, 0BH
	jnz	nfnc3		; no support function
	call	CONST
	jz	nfnc4
	mov	al, 0FFH
nfnc4:
	iret

nfnc3:
	; warm boot check
	; ah=0 : warm boot
	cmp	ah, 0
	jnz	nfnc4

	MOV	AX,RAMSEG
	MOV	DS,AX
	MOV	SS,AX
	MOV	SP,STACK
nfnc31:
	mov	al, XON
	mov	[rx_xflg], al
	call	CONOUT
	jmp	chk_bpt

;;;
;;; Interrupt Handler
;;;

	;; Divide error (INT 00H)
INTDIV:
	PUSH	AX
	PUSH	DS
	MOV	AX,RAMSEG
	MOV	DS,AX
	MOV	[REGBX],BX
	MOV	[REGCX],CX
	MOV	BX,DIVMSG
	XOR	CX,CX		; IP adjustment
	JMP	INT0
	
	;; Single step (INT 01H)
INTSTP:
	PUSH	AX
	PUSH	DS
	MOV	AX,RAMSEG
	MOV	DS,AX
	MOV	[REGBX],BX
	MOV	[REGCX],CX
	MOV	BX,STPMSG
	XOR	CX,CX		; IP adjustment
	JMP	INT0
	
	;; Break (INT 03H)
INTBRK:
	PUSH	AX
	PUSH	DS
	MOV	AX,RAMSEG
	MOV	DS,AX
	MOV	[REGBX],BX
	MOV	[REGCX],CX
	MOV	BX,BRKMSG
	MOV	CX,1		; IP adjustment
	JMP	INT0
	
	;; Overflow (INT 04H)
INTOVF:
	PUSH	AX
	PUSH	DS
	MOV	AX,RAMSEG
	MOV	DS,AX
	MOV	[REGBX],BX
	MOV	[REGCX],CX
	MOV	BX,OVFMSG
	XOR	CX,CX		; IP adjustment
INT0:
	POP	AX
	MOV	[REGDS],AX
	POP	AX
	MOV	[REGAX],AX
	MOV	[REGDX],DX

	MOV	[REGBP],BP
	MOV	[REGSI],SI
	MOV	[REGDI],DI
	MOV	[REGES],ES

	POP	AX
	SUB	AX,CX
	MOV	[REGIP],AX
	POP	AX
	MOV	[REGCS],AX
	POP	AX
	and	ax,Tbit_OFF	; trace mode off
;	or	ax, INIT_FL_	; int flag on

	MOV	[REGF],AX

	MOV	[REGSP],SP
	MOV	[REGSS],SS

	CALL	MSGOUT
	CALL	RDUMP

; check break point

chk_bpt:
	mov	al, [bflg]
	or	al, al
	je	nobrkp

; restore a original code at break point

	mov	ax, [brkcs]
	mov	es, ax
	mov	si, [brkip]
	mov	al, [bp_code]
	mov	es:[si], al	; restore a original code
	xor	al, al
	mov	[bflg], al	; clear break flag

nobrkp:
	sti
	JMP	WSTART

	;; Dummy
INTDMY:
	IRET
	
OPNMSG:
	DB	CR,LF,"Universal Monitor 8086",CR,LF
	db	"SBCV20 Edition. Rev.01",CR,LF,00H

PROMPT:
	DB	"] ",00H

IHEMSG:
	DB	"Error ihex",CR,LF,00H
SHEMSG:
	DB	"Error srec",CR,LF,00H
ERRMSG:
	DB	"Error",CR,LF,00H

DSEP0:
	DB	" :",00H
DSEP1:
	DB	" : ",00H
IHEXER:
        DB	":00000001FF",CR,LF,00H
SRECER:
        DB	"S9030000FC",CR,LF,00H

INIVEC:
	DW	INTDIV, ROMSEG	; 00H Divide error
	DW	INTSTP, ROMSEG	; 01H Single step
	DW	INTDMY, ROMSEG	; 02H NMI
	DW	INTBRK, ROMSEG	; 03H Breakpoint
	DW	INTOVF, ROMSEG	; 04H Overflow
INIVECE:

	IF USE_IDENT

cpum:	db	"CPU : ", 00h
IM86:	DB	"8086/8088",CR,LF,00H
IM186:	DB	"80186/80188",CR,LF,00H
IMV30:	DB	"V30/V20",CR,LF,00H
IM286:	DB	"80286",CR,LF,00H
IM386:	DB	"80386",CR,LF,00H
IMUNK:	DB	"Unknown",CR,LF,00H

	ENDIF
	
DIVMSG:	DB	"Divide error",CR,LF,00H
STPMSG:	DB	"Step",CR,LF,00H
NMIMSG:	DB	"NMI",CR,LF,00H
BRKMSG:	DB	"Break",CR,LF,00H
OVFMSG:	DB	"Overflow",CR,LF,00H

RDTAB:	DW	RDSAX, REGAX
	DW	RDSBX, REGBX
	DW	RDSCX, REGCX
	DW	RDSDX, REGDX
	DW	RDSF,  REGF
	DW	RDSCS, REGCS
	DW	RDSDS, REGDS
	DW	RDSSS, REGSS
	DW	RDSES, REGES
	DW	RDSSP, REGSP
	DW	RDSBP, REGBP
	DW	RDSSI, REGSI
	DW	RDSDI, REGDI
	DW	RDSIP, REGIP
	
	DW	0000H, 0000H

RDSAX:	DB	"AX=",00H
RDSBX:	DB	" BX=",00H
RDSCX:	DB	" CX=",00H
RDSDX:	DB	" DX=",00H
RDSF:	DB	" FL=",00H
RDSCS:	DB	" CS=",00H
RDSDS:	DB	" DS=",00H
RDSSS:	DB	" SS=",00H
RDSES:	DB	" ES=",00H
RDSSP:	DB	CR,LF,"SP=",00H
RDSBP:	DB	" BP=",00H
RDSSI:	DB	" SI=",00H
RDSDI:	DB	" DI=",00H
RDSIP:	DB	" IP=",00H

FLGB:	db	" FLb=",00h
Fbiton:	db	"....ODITSZ.A.P.C"


RNTAB:
	DB	'A',0FH		; "A?"
	DW	RNTABA,0
	DB	'B',0FH		; "B?"
	DW	RNTABB,0
	DB	'C',0FH		; "C?"
	DW	RNTABC,0
	DB	'D',0FH		; "D?"
	DW	RNTABD,0
	DB	'E',0FH		; "E?"
	DW	RNTABD,0
	DB	'F',2		; "F"
	DW	REGF,RNF
	DB	'I',0FH		; "I?"
	DW	RNTABI,0
	DB	'S',0FH		; "S?"
	DW	RNTABS,0

	DB	00H,0		; End mark
	DW	0,0
	
RNTABA:
	DB	'X',2		; "AX"
	DW	REGAX,RNAX
	DB	'H',1		; "AH"
	DW	REGAX+1,RNAH
	DB	'L',1		; "AL"
	DW	REGAX,RNAL

	DB	00H,0		; End mark
	DW	0,0

RNTABB:
	DB	'X',2		; "BX"
	DW	REGBX,RNBX
	DB	'H',1		; "BH"
	DW	REGBX+1,RNBH
	DB	'L',1		; "BL"
	DW	REGBX,RNBL
	DB	'P',2		; "BP"
	DW	REGBP,RNBP
	
	DB	00H,0		; End mark
	DW	0,0

RNTABC:
	DB	'X',2		; "CX"
	DW	REGCX,RNCX
	DB	'H',1		; "CH"
	DW	REGCX+1,RNCH
	DB	'L',1		; "CL"
	DW	REGCX,RNCL
	DB	'S',2		; "CS"
	DW	REGCS,RNCS
	
	DB	00H,0		; End mark
	DW	0,0
	
RNTABD:
	DB	'X',2		; "DX"
	DW	REGDX,RNDX
	DB	'H',1		; "DH"
	DW	REGDX+1,RNDH
	DB	'L',1		; "DL"
	DW	REGDX,RNDL
	DB	'I',2		; "DI"
	DW	REGDI,RNDI
	DB	'S',2		; "DS"
	DW	REGDS,RNDS
	
	DB	00H,0		; End mark
	DW	0,0

RNTABE:
	DB	'S',2		; "ES"
	DW	REGES,RNES
	
	DB	00H,0		; End mark
	DW	0,0
	
RNTABI:
	DB	'P',2		; "IP"
	DW	REGIP,RNIP
	
	DB	00H,0		; End mark
	DW	0,0
	
RNTABS:
	DB	'I',2		; "SI"
	DW	REGSI,RNSI
	DB	'P',2		; "SP"
	DW	REGSP,RNSP
	DB	'S',2		; "SS"
	DW	REGSS,RNSS
	
	DB	00H,0		; End mark
	DW	0,0
	
RNAX:	DB	"AX",00H
RNAH:	DB	"AH",00H
RNAL:	DB	"AL",00H
RNBX:	DB	"BX",00H
RNBH:	DB	"BH",00H
RNBL:	DB	"BL",00H
RNBP:	DB	"BP",00H
RNCX:	DB	"CX",00H
RNCH:	DB	"CH",00H
RNCL:	DB	"CL",00H
RNCS:	DB	"CS",00H
RNDX:	DB	"DX",00H
RNDH:	DB	"DH",00H
RNDL:	DB	"DL",00H
RNDI:	DB	"DI",00H
RNDS:	DB	"DS",00H
RNES:	DB	"ES",00H
RNF:	DB	"F",00H
RNIP:	DB	"IP",00H
RNSI:	DB	"SI",00H
RNSP:	DB	"SP",00H
RNSS:	DB	"SS",00H

;;;
;;; 	8251 Console Driver
;;;
INIT:
	;; Reset USART
	MOV	AL,00H
	OUT	USARTC,AL
	NOP
	NOP
	MOV	AL,00H
	OUT	USARTC,AL
	NOP
	NOP
	MOV	AL,00H
	OUT	USARTC,AL
	NOP
	NOP
	MOV	AL,40H
	OUT	USARTC,AL
	NOP
	NOP
	
	;;
	MOV	AL,4EH
	OUT	USARTC,AL
	NOP
	NOP

	;;
	MOV	AL,37H
	OUT	USARTC,AL
;
;	Buffer initialize
	xor	ax, ax			;Clear al
	mov	[RBFCNT], al		;Set count of chars
	mov	[RBFRDP], ax		;Set read point
	mov	[RBFWTP], ax		;Set write point
	mov	[tx_xflg], al
	mov	[MAXCNT], al
	mov	[LOSTC], ax
	mov	al, XON
	mov	[rx_xflg], al
	jmp	CONOUT

;
; input charctor to console
; outputt al : char
;
CONIN:
	push	bx
	push	cx
;
gcst1:	mov	al, [RBFCNT]
	or	al, al			;Buffer enpty?
	je	gcst1

	cli
	mov	ah, [RBFCNT]
	dec	ah
	mov	[RBFCNT], ah	; update
;
	mov	bl, [RBFRDP]	;Get read point
	mov	bh, 0
	mov	al, [bx+RECBUF]	;Read char from buffer
;
	inc	bl		;Next read point
	cmp	bl, BUFSIZ
	jnz	sv_rdptr
	xor	bl, bl		;Wrap
;	and	bl,BUFSIZ-1	;Wrap
sv_rdptr:
	mov	[RBFRDP] ,bl	;Update
	sti

	mov	cl, al		; save a char
	xor	ah, ah		; make XON base digit

	cmp	byte ptr [rx_xflg], XOFF	; XOFF?
	jne	chk_xon

	; XOFF state is here
	cmp	byte ptr [RBFCNT], RBLOW	; need XON action?
	jbe	need_xon
	;
gcst5:	; get a char to al
	mov	al, cl
	pop	cx
	pop	bx
	ret

	; XON state is here
chk_xon:

	mov	al, [tsh]			; get threshold value
	cmp	[RBFCNT], al			; need XOFF action?
	jb	gcst5				; return if char buffering state
	mov	ah, XOFF-XON			; set XOFF base digit
need_xon:
	add	ah, XON		; make XON or XOFF

gcst2:
	IN	AL,USARTC
	AND	AL,01H
	JZ	gcst2

	mov	al, ah		; set XON or XOFF
	OUT	USARTD,AL
	mov	[rx_xflg], al	; update xon/xoff flag
	jmp	gcst5

;
; check console
; outputt al : key
;
CONST:
	mov	al, [RBFCNT]	;Get count of char
	or	al, al
	RET

;
; output charctor to console
; input al : char
;
CONOUT:
	mov	ah, al		; save char
cnout1:
	cmp	byte ptr [tx_xflg], 0
	jne	cnout1

COUT0:
	IN	AL,USARTC
	AND	AL,01H
	JZ	COUT0

	mov	al, ah		; restore char
	OUT	USARTD,AL
	RET
;
;	8251 -> buffer by interrupt
;
intsr:	push	ax	;Save ax
	push	bx	;Save bx

	in	al, USARTD	; Get char

	cmp	al, XOFF	; get XOFF for tx side from console
	jne	intsr1

	mov	[tx_xflg], al	; set tx stop request
	jmp	isext		; exit
	
intsr1:
	cmp	al, XON
	jne	intsr2

	xor	al, al
	mov	[tx_xflg], al	; clear tx stop request
	jmp	isext		; exit

intsr2:
	mov	ah, [RBFCNT]
	cmp	ah, BUFSIZ
	je	isext1		;If yes, ignore

	inc	ah
	mov	[RBFCNT], ah	;Update

	cmp	ah, [MAXCNT]
	jbe	rec1
	mov	[MAXCNT], ah	; update max count
rec1:
	mov	bl, [RBFWTP]
	mov	bh, 0
	mov	[bx+RECBUF], al	;Write char into buffer

	inc	bl		;Next write point
	cmp	bl, BUFSIZ
	jnz	sv_wtptr
	xor	bl, bl		;Wrap
;	and	bl,BUFSIZ-1	;Wrap
sv_wtptr:
	mov	[RBFWTP], bl	;Update

isext:
	pop	bx	;Restore bx
	pop	ax	;Restore ax
	iret

isext1:
	inc	word ptr [LOSTC]
	jmp	isext

	db	($ & 0FF00H)+100H-$ dup(0FFH)

	;;
	;; Reset entry point
	;;
	
;	ORG	( 0FFFF0H - ROMSEG * 16 )
	ORG	0FFF0H

	JMPF	ROMSEG:CSTART
	
;;;
;;; RAM area
;;;

	SEGMENT	DATA

	;;
	;; Work area
	;;

	ORG	WORK_B

;
;	Receive buffer
MAXCNT	ds	1
tsh	ds	1
LOSTC	ds	2
RBFRDP	ds	1	;Read address
RBFWTP	ds	1	;Write address
RBFCNT	ds	1	;Count of chars
rx_xflg	ds	1
tx_xflg	ds	1
RECBUF	ds	BUFSIZ	;Buffer


INBUF:	DS	BUFLEN	; Line input buffer
CURSEG:	DS	2	; Current segment
DSADDR:	DS	2	; DUMP start address
DEADDR:	DS	2	; DUMP end address
DSTATE:	DS	1	; DUMP state
	ALIGN	2
GADDR:	DS	2	; GO address
SADDR:	DS	2	; SET address
HEXMOD:	DS	1	; HEX file mode
PSPEC:	DS	1	; Processor spec.

RECTYP:	DS	1	; Record type

	ALIGN	2
REG_B:	
REGAX:	DS	2
REGBX:	DS	2
REGCX:	DS	2
REGDX:	DS	2
REGF:	DS	2
REGSP:	DS	2		; Stack Pointer SP
REGBP:	DS	2		; Base Pointer BP
REGSI:	DS	2		; Source Index SI
REGDI:	DS	2		; Destination Index DI
REGIP:	DS	2		; Instruction Pointer IP
REGCS:	DS	2		; Code Segment CS
REGDS:	DS	2		; Data Segment DS
REGSS:	DS	2		; Stack Segment SS
REGES:	DS	2		; Extra Segment ES
REG_E:	

; break point
bflg	ds	1
bp_code	ds	1
brkcs	ds	2
brkip	ds	2

; Frag register bit image string buffer
F_bit:		ds	F_bitSize+1

	END
	
