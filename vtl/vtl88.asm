	ifndef	??version
?debug	macro
	endm
	endif
	?debug	S "vtl88.c"
_TEXT	segment	byte public 'CODE'
DGROUP	group	_DATA,_BSS
	assume	cs:_TEXT,ds:DGROUP,ss:DGROUP
_TEXT	ends
_DATA	segment word public 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public 'BSS'
b@	label	byte
b@w	label	word
	?debug	C E9187565560776746C38382E63
_BSS	ends
_TEXT	segment	byte public 'CODE'
;	?debug	L 59
_breakCheck	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
;	?debug	L 63
	call	near ptr _c_kbhit
	or	al,al
	je	@2
;	?debug	L 64
	call	near ptr _c_getch
	mov	byte ptr [bp-1],al
;	?debug	L 65
	cmp	byte ptr [bp-1],3
	jne	@3
	call	near ptr _warm_boot
@3:
@2:
@1:
;	?debug	L 67
	mov	sp,bp
	pop	bp
	ret	
_breakCheck	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_DATA	ends
_TEXT	segment	byte public 'CODE'
;	?debug	L 69
_main	proc	near
	push	bp
	mov	bp,sp
	sub	sp,14
;	?debug	L 74
	mov	word ptr DGROUP:_Lct+88,32767
;	?debug	L 75
	mov	word ptr DGROUP:_Lct+80,264
;	?debug	L 77
	mov	ax,1458
	push	ax
	call	near ptr _srand
	pop	cx
;	?debug	L 78
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr putstr
	pop	cx
@7:
;	?debug	L 81
	mov	ax,offset DGROUP:s@+27
	push	ax
	call	near ptr putstr
	pop	cx
@8:
;	?debug	L 83
	mov	word ptr [bp-4],138
;	?debug	L 84
	push	word ptr [bp-4]
	call	near ptr getln
	pop	cx
;	?debug	L 85
	lea	ax,word ptr [bp-2]
	push	ax
	lea	ax,word ptr [bp-4]
	push	ax
	call	near ptr getnm
	pop	cx
	pop	cx
	or	ax,ax
	je	@44
	jmp	@9
@44:
;	?debug	L 88
	mov	word ptr [bp-6],136
;	?debug	L 89
	mov	bx,word ptr [bp-6]
	mov	word ptr DGROUP:_Lct[bx],0
;	?debug	L 90
	mov	word ptr DGROUP:_Lct+74,0
@12:
;	?debug	L 92
	call	near ptr _breakCheck
;	?debug	L 93
	push	word ptr [bp-4]
	call	near ptr ordr
	pop	cx
;	?debug	L 94
	cmp	word ptr DGROUP:_Lct+74,0
	je	@14
	mov	bx,word ptr [bp-6]
	mov	ax,word ptr DGROUP:_Lct[bx]
	cmp	ax,word ptr DGROUP:_Lct+74
	jne	@13
@14:
;	?debug	L 96
	cmp	word ptr [bp-6],136
	jne	@15
	jmp	short @10
@15:
;	?debug	L 97
	push	word ptr [bp-6]
	call	near ptr nxtln
	pop	cx
	mov	word ptr [bp-6],ax
;	?debug	L 98
	mov	ax,word ptr [bp-6]
	cmp	ax,word ptr DGROUP:_Lct+80
	jne	@16
	jmp	short @10
@16:
;	?debug	L 99
	jmp	short @17
@13:
;	?debug	L 101
	mov	bx,word ptr [bp-6]
	mov	ax,word ptr DGROUP:_Lct[bx]
	inc	ax
	mov	word ptr DGROUP:_Lct+70,ax
;	?debug	L 102
	lea	ax,word ptr [bp-6]
	push	ax
	call	near ptr fndln
	pop	cx
	or	ax,ax
	je	@18
	jmp	short @10
@18:
@17:
;	?debug	L 104
	mov	bx,word ptr [bp-6]
	mov	ax,word ptr DGROUP:_Lct[bx]
	mov	word ptr DGROUP:_Lct+74,ax
;	?debug	L 105
	mov	ax,word ptr [bp-6]
	add	ax,3
	mov	word ptr [bp-4],ax
@11:
	jmp	@12
@10:
;	?debug	L 107
	jmp	@19
@9:
;	?debug	L 108
	cmp	word ptr [bp-2],0
	jne	@20
;	?debug	L 110
	mov	word ptr [bp-4],264
	jmp	short @24
@23:
;	?debug	L 111
	call	near ptr _breakCheck
;	?debug	L 112
	mov	bx,word ptr [bp-4]
	push	word ptr DGROUP:_Lct[bx]
	call	near ptr putnm
	pop	cx
;	?debug	L 113
	add	word ptr [bp-4],2
;	?debug	L 114
	mov	al,0
	push	ax
	lea	ax,word ptr [bp-4]
	push	ax
	call	near ptr putl
	pop	cx
	pop	cx
;	?debug	L 115
	call	near ptr crlf
@22:
@24:
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr DGROUP:_Lct+80
	jne	@23
@21:
;	?debug	L 117
	jmp	@25
@20:
;	?debug	L 122
	mov	ax,word ptr [bp-2]
	mov	word ptr DGROUP:_Lct+74,ax
;	?debug	L 123
	lea	ax,word ptr [bp-14]
	push	ax
	call	near ptr fndln
	pop	cx
	or	ax,ax
	jne	@26
	mov	bx,word ptr [bp-14]
	mov	ax,word ptr DGROUP:_Lct[bx]
	cmp	ax,word ptr [bp-2]
	jne	@26
;	?debug	L 124
	push	word ptr [bp-14]
	call	near ptr nxtln
	pop	cx
	mov	word ptr [bp-12],ax
;	?debug	L 125
	mov	ax,word ptr [bp-14]
	mov	word ptr [bp-10],ax
	jmp	short @30
@29:
@28:
	mov	bx,word ptr [bp-12]
	mov	al,byte ptr DGROUP:_Lct[bx]
	mov	bx,word ptr [bp-10]
	mov	byte ptr DGROUP:_Lct[bx],al
	inc	word ptr [bp-12]
	inc	word ptr [bp-10]
@30:
	mov	ax,word ptr [bp-12]
	cmp	ax,word ptr DGROUP:_Lct+80
	jne	@29
@27:
;	?debug	L 126
	mov	ax,word ptr [bp-10]
	mov	word ptr DGROUP:_Lct+80,ax
@26:
;	?debug	L 129
	mov	bx,word ptr [bp-4]
	cmp	byte ptr DGROUP:_Lct[bx],0
	jne	@31
	jmp	@8
@31:
;	?debug	L 130
	mov	word ptr [bp-6],3
	mov	ax,word ptr [bp-4]
	mov	word ptr [bp-8],ax
	jmp	short @35
@34:
@33:
	inc	word ptr [bp-6]
	inc	word ptr [bp-8]
@35:
	mov	bx,word ptr [bp-8]
	cmp	byte ptr DGROUP:_Lct[bx],0
	jne	@34
@32:
;	?debug	L 131
	mov	ax,word ptr DGROUP:_Lct+80
	add	ax,word ptr [bp-6]
	cmp	ax,word ptr DGROUP:_Lct+88
	jae	@36
;	?debug	L 132
	mov	ax,word ptr DGROUP:_Lct+80
	mov	word ptr [bp-12],ax
;	?debug	L 133
	mov	ax,word ptr DGROUP:_Lct+80
	add	ax,word ptr [bp-6]
	mov	word ptr DGROUP:_Lct+80,ax
;	?debug	L 134
	mov	ax,word ptr DGROUP:_Lct+80
	mov	word ptr [bp-10],ax
	jmp	short @40
@39:
@38:
	dec	word ptr [bp-10]
	dec	word ptr [bp-12]
	mov	bx,word ptr [bp-12]
	mov	al,byte ptr DGROUP:_Lct[bx]
	mov	bx,word ptr [bp-10]
	mov	byte ptr DGROUP:_Lct[bx],al
@40:
	mov	ax,word ptr [bp-12]
	cmp	ax,word ptr [bp-14]
	jne	@39
@37:
;	?debug	L 135
	mov	ax,word ptr [bp-2]
	mov	bx,word ptr [bp-12]
	mov	word ptr DGROUP:_Lct[bx],ax
;	?debug	L 136
	add	word ptr [bp-12],2
;	?debug	L 137
	jmp	short @41
@43:
@41:
	mov	ax,word ptr [bp-4]
	inc	word ptr [bp-4]
	mov	bx,ax
	mov	al,byte ptr DGROUP:_Lct[bx]
	mov	dx,word ptr [bp-12]
	inc	word ptr [bp-12]
	mov	bx,dx
	mov	byte ptr DGROUP:_Lct[bx],al
	or	al,al
	jne	@43
@42:
;	?debug	L 138
	jmp	@8
@36:
@25:
@19:
@6:
	jmp	@7
@5:
@4:
;	?debug	L 145
	mov	sp,bp
	pop	bp
	ret	
_main	endp
;	?debug	L 152
fndln	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
;	?debug	L 153
	mov	word ptr [si],264
	jmp	short @49
@48:
;	?debug	L 154
	mov	bx,word ptr [si]
	mov	ax,word ptr DGROUP:_Lct[bx]
	cmp	ax,word ptr DGROUP:_Lct+74
	jb	@50
	xor	ax,ax
	jmp	short @45
@50:
@47:
	push	word ptr [si]
	call	near ptr nxtln
	pop	cx
	mov	word ptr [si],ax
@49:
	mov	ax,word ptr [si]
	cmp	ax,word ptr DGROUP:_Lct+80
	jne	@48
@46:
;	?debug	L 156
	mov	ax,1
	jmp	short @45
@45:
;	?debug	L 157
	pop	si
	pop	bp
	ret	
fndln	endp
;	?debug	L 163
nxtln	proc	near
	push	bp
	mov	bp,sp
;	?debug	L 164
	add	word ptr [bp+4],2
	jmp	short @55
@54:
@53:
@55:
	mov	ax,word ptr [bp+4]
	inc	word ptr [bp+4]
	mov	bx,ax
	cmp	byte ptr DGROUP:_Lct[bx],0
	jne	@54
@52:
;	?debug	L 165
	mov	ax,word ptr [bp+4]
	jmp	short @51
@51:
;	?debug	L 166
	pop	bp
	ret	
nxtln	endp
;	?debug	L 172
getln	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
	push	si
;	?debug	L 176
	xor	si,si
@59:
;	?debug	L 177
	call	near ptr _getchr
	mov	byte ptr [bp-1],al
;	?debug	L 178
	cmp	byte ptr [bp-1],8
	jne	@60
;	?debug	L 179
	or	si,si
	jle	@61
	dec	si
@61:
;	?debug	L 180
	jmp	short @62
@60:
	cmp	byte ptr [bp-1],13
	jne	@63
;	?debug	L 181
	mov	bx,word ptr [bp+4]
	add	bx,si
	mov	byte ptr DGROUP:_Lct[bx],0
;	?debug	L 182
	mov	al,10
	push	ax
	call	near ptr _putchr
	pop	cx
	jmp	short @56
;	?debug	L 184
	jmp	short @64
@63:
	cmp	byte ptr [bp-1],21
	je	@66
	mov	ax,si
	inc	ax
	cmp	ax,74
	jne	@65
@66:
;	?debug	L 185
	call	near ptr crlf
;	?debug	L 186
	xor	si,si
;	?debug	L 187
	jmp	short @67
@65:
	cmp	byte ptr [bp-1],31
	ja	@68
;	?debug	L 188
	jmp	short @69
@68:
;	?debug	L 189
	mov	al,byte ptr [bp-1]
	mov	bx,si
	add	bx,word ptr [bp+4]
	mov	byte ptr DGROUP:_Lct[bx],al
	inc	si
@69:
@67:
@64:
@62:
@58:
	jmp	short @59
@57:
@56:
;	?debug	L 192
	pop	si
	mov	sp,bp
	pop	bp
	ret	
getln	endp
;	?debug	L 200
getnm	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	si,word ptr [bp+6]
	mov	di,word ptr [bp+4]
;	?debug	L 201
	push	word ptr [di]
	call	near ptr num
	pop	cx
	or	ax,ax
	jne	@71
	xor	ax,ax
	jmp	short @70
@71:
;	?debug	L 202
	mov	word ptr [si],0
@74:
;	?debug	L 204
	mov	ax,word ptr [si]
	mov	dx,10
	mul	dx
	mov	word ptr [si],ax
;	?debug	L 205
	mov	ax,word ptr [di]
	inc	word ptr [di]
	mov	bx,ax
	mov	al,byte ptr DGROUP:_Lct[bx]
	mov	ah,0
	add	ax,-48
	add	word ptr [si],ax
@72:
;	?debug	L 206
	push	word ptr [di]
	call	near ptr num
	pop	cx
	or	ax,ax
	jne	@74
@73:
;	?debug	L 207
	mov	ax,1
	jmp	short @70
@70:
;	?debug	L 208
	pop	di
	pop	si
	pop	bp
	ret	
getnm	endp
;	?debug	L 214
num	proc	near
	push	bp
	mov	bp,sp
;	?debug	L 215
	mov	bx,word ptr [bp+4]
	cmp	byte ptr DGROUP:_Lct[bx],48
	jb	@77
	mov	bx,word ptr [bp+4]
	cmp	byte ptr DGROUP:_Lct[bx],57
	ja	@77
	mov	ax,1
	jmp	short @76
@77:
	xor	ax,ax
@76:
	jmp	short @75
@75:
;	?debug	L 216
	pop	bp
	ret	
num	endp
;	?debug	L 222
ordr	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
;	?debug	L 226
	lea	ax,word ptr [bp-2]
	push	ax
	lea	ax,word ptr [bp-3]
	push	ax
	lea	ax,word ptr [bp+4]
	push	ax
	call	near ptr getvr
	add	sp,6
;	?debug	L 227
	inc	word ptr [bp+4]
;	?debug	L 229
	mov	bx,word ptr [bp+4]
	cmp	byte ptr DGROUP:_Lct[bx],34
	jne	@79
;	?debug	L 230
	inc	word ptr [bp+4]
;	?debug	L 231
	mov	al,34
	push	ax
	lea	ax,word ptr [bp+4]
	push	ax
	call	near ptr putl
	pop	cx
	pop	cx
;	?debug	L 232
	mov	bx,word ptr [bp+4]
	cmp	byte ptr DGROUP:_Lct[bx],59
	je	@80
	call	near ptr crlf
@80:
;	?debug	L 233
	jmp	short @81
@79:
;	?debug	L 236
	lea	ax,word ptr [bp-6]
	push	ax
	lea	ax,word ptr [bp+4]
	push	ax
	call	near ptr expr
	pop	cx
	pop	cx
;	?debug	L 238
	cmp	byte ptr [bp-3],36
	jne	@82
;	?debug	L 239
	mov	al,byte ptr [bp-6]
	and	al,255
	push	ax
	call	near ptr _putchr
	pop	cx
;	?debug	L 240
	jmp	short @83
@82:
	sub	byte ptr [bp-3],63
	mov	al,byte ptr [bp-3]
	or	al,al
	jne	@84
;	?debug	L 241
	push	word ptr [bp-6]
	call	near ptr putnm
	pop	cx
;	?debug	L 242
	jmp	short @85
@84:
;	?debug	L 245
	mov	ax,word ptr [bp-6]
	mov	bx,word ptr [bp-2]
	mov	word ptr DGROUP:_Lct[bx],ax
;	?debug	L 253
	call	near ptr _rand
	mov	word ptr [bp-8],ax
;	?debug	L 255
	mov	ax,word ptr [bp-8]
	mov	word ptr DGROUP:_Lct+82,ax
@85:
@83:
@81:
	jmp	short @78
@78:
;	?debug	L 259
	mov	sp,bp
	pop	bp
	ret	
ordr	endp
;	?debug	L 265
expr	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
	push	si
	mov	si,word ptr [bp+4]
;	?debug	L 268
	push	word ptr [bp+6]
	push	si
	call	near ptr factr
	pop	cx
	pop	cx
	jmp	short @87
@89:
;	?debug	L 270
	push	word ptr [bp+6]
	push	si
	call	near ptr term
	pop	cx
	pop	cx
@87:
;	?debug	L 269
	mov	bx,word ptr [si]
	mov	al,byte ptr DGROUP:_Lct[bx]
	mov	byte ptr [bp-1],al
	or	al,al
	je	@90
	cmp	byte ptr [bp-1],41
	jne	@89
@90:
@88:
;	?debug	L 272
	inc	word ptr [si]
	jmp	short @86
@86:
;	?debug	L 274
	pop	si
	mov	sp,bp
	pop	bp
	ret	
expr	endp
;	?debug	L 280
factr	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
	mov	di,word ptr [bp+6]
	mov	si,word ptr [bp+4]
;	?debug	L 283
	mov	bx,word ptr [si]
	cmp	byte ptr DGROUP:_Lct[bx],0
	jne	@92
;	?debug	L 284
	mov	word ptr [di],0
	jmp	@91
@92:
;	?debug	L 288
	push	di
	push	si
	call	near ptr getnm
	pop	cx
	pop	cx
	or	ax,ax
	je	@93
	jmp	short @91
@93:
;	?debug	L 290
	mov	ax,word ptr [si]
	inc	word ptr [si]
	mov	bx,ax
	mov	al,byte ptr DGROUP:_Lct[bx]
	mov	byte ptr [bp-1],al
;	?debug	L 291
	cmp	byte ptr [bp-1],63
	jne	@94
;	?debug	L 294
	mov	word ptr [bp-4],136
;	?debug	L 295
	push	word ptr [bp-4]
	call	near ptr getln
	pop	cx
;	?debug	L 296
	push	di
	lea	ax,word ptr [bp-4]
	push	ax
	call	near ptr expr
	pop	cx
	pop	cx
;	?debug	L 297
	jmp	short @95
@94:
	cmp	byte ptr [bp-1],36
	jne	@96
;	?debug	L 298
	call	near ptr _getchr
	mov	ah,0
	mov	word ptr [di],ax
;	?debug	L 299
	jmp	short @97
@96:
	cmp	byte ptr [bp-1],40
	jne	@98
;	?debug	L 300
	push	di
	push	si
	call	near ptr expr
	pop	cx
	pop	cx
;	?debug	L 301
	jmp	short @99
@98:
;	?debug	L 304
	dec	word ptr [si]
;	?debug	L 305
	lea	ax,word ptr [bp-4]
	push	ax
	lea	ax,word ptr [bp-1]
	push	ax
	push	si
	call	near ptr getvr
	add	sp,6
;	?debug	L 306
	mov	bx,word ptr [bp-4]
	mov	ax,word ptr DGROUP:_Lct[bx]
	mov	word ptr [di],ax
@99:
@97:
@95:
	jmp	short @91
@91:
;	?debug	L 309
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
factr	endp
;	?debug	L 315
term	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	mov	si,word ptr [bp+6]
;	?debug	L 319
	mov	bx,word ptr [bp+4]
	mov	ax,word ptr [bx]
	inc	word ptr [bx]
	mov	bx,ax
	mov	al,byte ptr DGROUP:_Lct[bx]
	mov	byte ptr [bp-3],al
;	?debug	L 320
	lea	ax,word ptr [bp-2]
	push	ax
	push	word ptr [bp+4]
	call	near ptr factr
	pop	cx
	pop	cx
;	?debug	L 321
	cmp	byte ptr [bp-3],42
	jne	@101
;	?debug	L 322
	mov	ax,word ptr [si]
	mul	word ptr [bp-2]
	mov	word ptr [si],ax
;	?debug	L 323
	jmp	@102
@101:
	cmp	byte ptr [bp-3],43
	jne	@103
;	?debug	L 324
	mov	ax,word ptr [bp-2]
	add	word ptr [si],ax
;	?debug	L 325
	jmp	@104
@103:
	cmp	byte ptr [bp-3],45
	jne	@105
;	?debug	L 326
	mov	ax,word ptr [bp-2]
	sub	word ptr [si],ax
;	?debug	L 327
	jmp	short @106
@105:
	cmp	byte ptr [bp-3],47
	jne	@107
;	?debug	L 328
	mov	ax,word ptr [si]
	xor	dx,dx
	div	word ptr [bp-2]
	mov	word ptr DGROUP:_Lct+78,dx
;	?debug	L 329
	mov	ax,word ptr [si]
	xor	dx,dx
	div	word ptr [bp-2]
	mov	word ptr [si],ax
;	?debug	L 330
	jmp	short @108
@107:
	cmp	byte ptr [bp-3],61
	jne	@109
;	?debug	L 331
	mov	ax,word ptr [si]
	cmp	ax,word ptr [bp-2]
	jne	@114
	mov	ax,1
	jmp	short @113
@114:
	xor	ax,ax
@113:
	mov	word ptr [si],ax
;	?debug	L 332
	jmp	short @110
@109:
	cmp	byte ptr [bp-3],62
	jne	@111
;	?debug	L 333
	mov	ax,word ptr [si]
	cmp	ax,word ptr [bp-2]
	jb	@116
	mov	ax,1
	jmp	short @115
@116:
	xor	ax,ax
@115:
	mov	word ptr [si],ax
;	?debug	L 334
	jmp	short @112
@111:
;	?debug	L 335
	mov	ax,word ptr [si]
	cmp	ax,word ptr [bp-2]
	jae	@118
	mov	ax,1
	jmp	short @117
@118:
	xor	ax,ax
@117:
	mov	word ptr [si],ax
@112:
@110:
@108:
@106:
@104:
@102:
	jmp	short @100
@100:
;	?debug	L 338
	pop	si
	mov	sp,bp
	pop	bp
	ret	
term	endp
;	?debug	L 344
getvr	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
	push	si
	mov	si,word ptr [bp+6]
;	?debug	L 348
	mov	bx,word ptr [bp+4]
	mov	ax,word ptr [bx]
	inc	word ptr [bx]
	mov	bx,ax
	mov	al,byte ptr DGROUP:_Lct[bx]
	mov	byte ptr [si],al
;	?debug	L 349
	cmp	byte ptr [si],58
	jne	@120
;	?debug	L 350
	lea	ax,word ptr [bp-2]
	push	ax
	push	word ptr [bp+4]
	call	near ptr expr
	pop	cx
	pop	cx
;	?debug	L 351
	mov	ax,word ptr [bp-2]
	shl	ax,1
	add	ax,word ptr DGROUP:_Lct+80
	mov	bx,word ptr [bp+8]
	mov	word ptr [bx],ax
;	?debug	L 352
	jmp	short @121
@120:
;	?debug	L 353
	cmp	byte ptr [si],127
	jne	@122
	call	near ptr _mach_fin
	jmp	short @123
@122:
;	?debug	L 354
	mov	al,byte ptr [si]
	mov	ah,0
	and	ax,63
	inc	ax
	inc	ax
	shl	ax,1
	mov	bx,word ptr [bp+8]
	mov	word ptr [bx],ax
@123:
@121:
	jmp	short @119
@119:
;	?debug	L 356
	pop	si
	mov	sp,bp
	pop	bp
	ret	
getvr	endp
;	?debug	L 362
putl	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
;	?debug	L 363
	jmp	short @125
@127:
	mov	ax,word ptr [si]
	inc	word ptr [si]
	mov	bx,ax
	push	word ptr DGROUP:_Lct[bx]
	call	near ptr _putchr
	pop	cx
@125:
	mov	bx,word ptr [si]
	mov	al,byte ptr DGROUP:_Lct[bx]
	cmp	al,byte ptr [bp+6]
	jne	@127
@126:
;	?debug	L 364
	inc	word ptr [si]
	jmp	short @124
@124:
;	?debug	L 366
	pop	si
	pop	bp
	ret	
putl	endp
;	?debug	L 372
crlf	proc	near
;	?debug	L 373
	mov	al,13
	push	ax
	call	near ptr _putchr
	pop	cx
;	?debug	L 374
	mov	al,10
	push	ax
	call	near ptr _putchr
	pop	cx
	jmp	short @128
@128:
;	?debug	L 376
	ret	
crlf	endp
;	?debug	L 382
putnm	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
;	?debug	L 386
	mov	word ptr [bp-4],135
;	?debug	L 387
	mov	bx,word ptr [bp-4]
	mov	byte ptr DGROUP:_Lct[bx],0
@132:
;	?debug	L 389
	mov	ax,word ptr [bp+4]
	mov	bx,10
	xor	dx,dx
	div	bx
	mov	byte ptr [bp-1],dl
;	?debug	L 390
	mov	ax,word ptr [bp+4]
	mov	bx,10
	xor	dx,dx
	div	bx
	mov	word ptr [bp+4],ax
;	?debug	L 391
	dec	word ptr [bp-4]
	mov	al,byte ptr [bp-1]
	add	al,48
	mov	bx,word ptr [bp-4]
	mov	byte ptr DGROUP:_Lct[bx],al
@130:
;	?debug	L 392
	cmp	word ptr [bp+4],0
	jne	@132
@131:
;	?debug	L 393
	mov	al,0
	push	ax
	lea	ax,word ptr [bp-4]
	push	ax
	call	near ptr putl
	pop	cx
	pop	cx
	jmp	short @129
@129:
;	?debug	L 395
	mov	sp,bp
	pop	bp
	ret	
putnm	endp
;	?debug	L 401
putstr	proc	near
	push	bp
	mov	bp,sp
;	?debug	L 402
	jmp	short @134
@136:
	mov	bx,word ptr [bp+4]
	inc	word ptr [bp+4]
	push	word ptr [bx]
	call	near ptr _putchr
	pop	cx
@134:
	mov	bx,word ptr [bp+4]
	cmp	byte ptr [bx],0
	jne	@136
@135:
;	?debug	L 403
	call	near ptr crlf
	jmp	short @133
@133:
;	?debug	L 405
	pop	bp
	ret	
putstr	endp
_TEXT	ends
_BSS	segment word public 'BSS'
_Lct	label	byte
	db	30720 dup (?)
_BSS	ends
	?debug	C E9
_DATA	segment word public 'DATA'
s@	label	byte
	db	86
	db	84
	db	76
	db	45
	db	67
	db	32
	db	83
	db	66
	db	67
	db	86
	db	50
	db	48
	db	47
	db	56
	db	48
	db	56
	db	56
	db	32
	db	101
	db	100
	db	105
	db	116
	db	105
	db	111
	db	110
	db	46
	db	0
	db	13
	db	10
	db	79
	db	75
	db	0
_DATA	ends
_TEXT	segment	byte public 'CODE'
	extrn	_warm_boot:near
	extrn	_mach_fin:near
	extrn	_c_kbhit:near
	extrn	_putchr:near
	extrn	_getchr:near
	extrn	_c_getch:near
	extrn	_srand:near
	extrn	_rand:near
_TEXT	ends
	public	_breakCheck
_putstr	equ	putstr
_getvr	equ	getvr
_factr	equ	factr
_nxtln	equ	nxtln
_putnm	equ	putnm
_getln	equ	getln
_fndln	equ	fndln
_getnm	equ	getnm
_ordr	equ	ordr
_expr	equ	expr
_term	equ	term
	public	_main
_putl	equ	putl
_num	equ	num
	public	_Lct
_crlf	equ	crlf
	end
