	ifndef	??version
?debug	macro
	endm
	endif
	?debug	S ".\gm88.c"
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
	?debug	C E9C4515C56082E5C676D38382E63
_BSS	ends
_TEXT	segment	byte public 'CODE'
;	?debug	L 49
_c_puts	proc	near
	push	bp
	mov	bp,sp
	jmp	short @2
@4:
	mov	bx,word ptr [bp+4]
	inc	word ptr [bp+4]
	mov	al,byte ptr [bx]
	cbw	
	push	ax
	call	near ptr _c_putch
	pop	cx
@2:
	mov	bx,word ptr [bp+4]
	cmp	byte ptr [bx],0
	jne	@4
@3:
@1:
	pop	bp
	ret	
_c_puts	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_open_msg	label	word
	dw	DGROUP:DGROUP:s@
_rdy_msg	label	word
	dw	DGROUP:DGROUP:s@+31
_t_lock	label	word
	dw	DGROUP:DGROUP:s@+40
_DATA	ends
_TEXT	segment	byte public 'CODE'
;	?debug	L 67
_main	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
	push	si
	push	di
;	?debug	L 71
	cmp	byte ptr [bp+4],0
	jne	@6
;	?debug	L 72
	mov	ax,5678
	push	ax
	call	near ptr _srand
	pop	cx
;	?debug	L 73
	mov	ax,offset DGROUP:_text_buf
	mov	word ptr DGROUP:_var+122,ax
;	?debug	L 74
	mov	word ptr DGROUP:_var+84,32767
;	?debug	L 75
	call	near ptr _newText1
;	?debug	L 76
	push	word ptr DGROUP:_open_msg
	call	near ptr _c_puts
	pop	cx
@6:
;	?debug	L 78
	push	word ptr DGROUP:_rdy_msg
	call	near ptr _c_puts
	pop	cx
@9:
;	?debug	L 81
	mov	word ptr DGROUP:_sp,-1
;	?debug	L 82
	mov	word ptr DGROUP:_lno,0
;	?debug	L 83
	mov	ax,offset DGROUP:_lin
	push	ax
	call	near ptr _c_gets
	pop	cx
	mov	di,ax
;	?debug	L 85
	mov	byte ptr DGROUP:_lin[di+1],-128
;	?debug	L 86
	mov	word ptr DGROUP:_pc,offset DGROUP:_lin
;	?debug	L 87
	call	near ptr _skipBlank
;	?debug	L 88
	lea	ax,word ptr [bp-2]
	push	ax
	call	near ptr _getNum
	pop	cx
	mov	si,ax
;	?debug	L 89
	cmp	word ptr [bp-2],0
	jne	@10
;	?debug	L 90
	call	near ptr _exqt
;	?debug	L 91
	call	near ptr _newline
;	?debug	L 92
	push	word ptr DGROUP:_rdy_msg
	call	near ptr _c_puts
	pop	cx
;	?debug	L 93
	jmp	short @11
@10:
;	?debug	L 94
	push	si
	call	near ptr _edit
	pop	cx
@11:
@8:
	jmp	short @9
@7:
@5:
;	?debug	L 96
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_main	endp
;	?debug	L 98
_skipLine	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
	jmp	short @16
@15:
;	?debug	L 102
	inc	si
@14:
@16:
;	?debug	L 101
	cmp	byte ptr [si],0
	jne	@15
@13:
;	?debug	L 103
	mov	ax,si
	inc	ax
	jmp	short @12
@12:
;	?debug	L 104
	pop	si
	pop	bp
	ret	
_skipLine	endp
;	?debug	L 106
_searchLine	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
;	?debug	L 113
	mov	si,word ptr DGROUP:_var+122
	jmp	short @21
@20:
;	?debug	L 114
	mov	al,byte ptr [si]
	mov	ah,0
	mov	di,ax
	mov	cl,8
	shl	di,cl
	mov	al,byte ptr [si+1]
	mov	ah,0
	or	di,ax
;	?debug	L 115
	mov	ax,word ptr [bp+4]
	cmp	ax,di
	jne	@22
	mov	bx,word ptr [bp+6]
	mov	word ptr [bx],1
	mov	ax,si
	jmp	short @17
@22:
;	?debug	L 116
	mov	ax,word ptr [bp+4]
	cmp	ax,di
	jge	@23
	mov	bx,word ptr [bp+6]
	mov	word ptr [bx],0
	mov	ax,si
	jmp	short @17
@23:
;	?debug	L 117
	mov	ax,si
	inc	ax
	inc	ax
	push	ax
	call	near ptr _skipLine
	pop	cx
	mov	si,ax
@19:
@21:
	test	byte ptr [si],128
	je	@20
@18:
;	?debug	L 119
	mov	bx,word ptr [bp+6]
	mov	word ptr [bx],0
;	?debug	L 120
	mov	ax,si
	jmp	short @17
@17:
;	?debug	L 121
	pop	di
	pop	si
	pop	bp
	ret	
_searchLine	endp
;	?debug	L 124
_edit	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
	push	si
	push	di
	mov	di,word ptr [bp+4]
;	?debug	L 130
	or	di,di
	jne	@25
;	?debug	L 131
	push	word ptr DGROUP:_var+122
	call	near ptr _dispList
	pop	cx
;	?debug	L 132
	xor	ax,ax
	push	ax
	call	near ptr _w_boot
	pop	cx
@25:
;	?debug	L 135
	lea	ax,word ptr [bp-2]
	push	ax
	push	di
	call	near ptr _searchLine
	pop	cx
	pop	cx
	mov	si,ax
;	?debug	L 137
	mov	bx,word ptr DGROUP:_pc
	cmp	byte ptr [bx],47
	jne	@26
;	?debug	L 138
	push	si
	call	near ptr _dispList
	pop	cx
;	?debug	L 139
	xor	ax,ax
	push	ax
	call	near ptr _w_boot
	pop	cx
;	?debug	L 140
	jmp	short @27
@26:
;	?debug	L 142
	mov	bx,word ptr DGROUP:_var+76
	cmp	byte ptr [bx],255
	je	@28
;	?debug	L 143
	push	word ptr DGROUP:_t_lock
	call	near ptr _er_boot
	pop	cx
@28:
;	?debug	L 145
	cmp	word ptr [bp-2],0
	je	@29
	push	si
	call	near ptr _deleteLine
	pop	cx
@29:
;	?debug	L 146
	mov	bx,word ptr DGROUP:_pc
	cmp	byte ptr [bx],0
	jne	@30
	xor	ax,ax
	jmp	short @24
@30:
;	?debug	L 147
	push	word ptr DGROUP:_pc
	push	si
	push	di
	call	near ptr _addLine
	add	sp,6
@27:
;	?debug	L 149
	xor	ax,ax
	jmp	short @24
@24:
;	?debug	L 150
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_edit	endp
;	?debug	L 152
_addLine	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	si,word ptr [bp+6]
;	?debug	L 157
	push	word ptr [bp+8]
	call	near ptr _strlen
	pop	cx
	mov	di,ax
	add	di,3
;	?debug	L 158
	mov	ax,word ptr DGROUP:_var+76
	sub	ax,si
	inc	ax
	push	ax
	push	si
	mov	ax,si
	add	ax,di
	push	ax
	call	near ptr _memmove
	add	sp,6
;	?debug	L 159
	mov	ax,word ptr [bp+4]
	mov	cl,8
	sar	ax,cl
	mov	byte ptr [si],al
;	?debug	L 160
	mov	al,byte ptr [bp+4]
	mov	byte ptr [si+1],al
;	?debug	L 161
	push	word ptr [bp+8]
	mov	ax,si
	inc	ax
	inc	ax
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
;	?debug	L 162
	add	word ptr DGROUP:_var+76,di
@31:
;	?debug	L 163
	pop	di
	pop	si
	pop	bp
	ret	
_addLine	endp
;	?debug	L 165
_deleteLine	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
;	?debug	L 170
	mov	ax,di
	inc	ax
	inc	ax
	push	ax
	call	near ptr _strlen
	pop	cx
	mov	si,ax
	add	si,3
;	?debug	L 171
	mov	ax,word ptr DGROUP:_var+76
	sub	ax,di
	sub	ax,si
	inc	ax
	push	ax
	mov	ax,di
	add	ax,si
	push	ax
	push	di
	call	near ptr _memmove
	add	sp,6
;	?debug	L 172
	sub	word ptr DGROUP:_var+76,si
@32:
;	?debug	L 173
	pop	di
	pop	si
	pop	bp
	ret	
_deleteLine	endp
;	?debug	L 175
_g_decStr	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	si,word ptr [bp+6]
;	?debug	L 179
	xor	di,di
@36:
;	?debug	L 181
	mov	ax,si
	mov	bx,10
	xor	dx,dx
	div	bx
	or	dl,48
	mov	bx,word ptr [bp+4]
	mov	byte ptr [bx],dl
	inc	word ptr [bp+4]
;	?debug	L 182
	mov	ax,si
	mov	bx,10
	xor	dx,dx
	div	bx
	mov	si,ax
;	?debug	L 183
	inc	di
@34:
;	?debug	L 184
	or	si,si
	ja	@36
@35:
;	?debug	L 185
	mov	bx,word ptr [bp+4]
	mov	byte ptr [bx],0
;	?debug	L 186
	mov	ax,di
	jmp	short @33
@33:
;	?debug	L 187
	pop	di
	pop	si
	pop	bp
	ret	
_g_decStr	endp
;	?debug	L 189
_mk_dStr	proc	near
	push	bp
	mov	bp,sp
	sub	sp,12
	push	si
	push	di
;	?debug	L 193
	mov	word ptr [bp-2],0
;	?debug	L 194
	test	word ptr [bp+6],-32768
	je	@38
;	?debug	L 195
	mov	word ptr [bp-2],1
;	?debug	L 196
	mov	ax,word ptr [bp+6]
	not	ax
	inc	ax
	mov	word ptr [bp+6],ax
@38:
;	?debug	L 199
	push	word ptr [bp+6]
	lea	ax,word ptr [bp-12]
	push	ax
	call	near ptr _g_decStr
	pop	cx
	pop	cx
	mov	word ptr [bp-4],ax
;	?debug	L 200
	mov	di,word ptr [bp-4]
;	?debug	L 201
	cmp	word ptr [bp-2],0
	je	@39
	inc	word ptr [bp-4]
@39:
;	?debug	L 203
	xor	si,si
	jmp	short @40
@42:
;	?debug	L 205
	mov	bx,word ptr [bp+4]
	mov	byte ptr [bx+si],32
	inc	si
;	?debug	L 206
	dec	word ptr [bp+8]
@40:
;	?debug	L 204
	mov	ax,word ptr [bp+8]
	cmp	ax,word ptr [bp-4]
	jg	@42
@41:
;	?debug	L 208
	cmp	word ptr [bp-2],0
	je	@43
	mov	bx,word ptr [bp+4]
	mov	byte ptr [bx+si],45
	inc	si
@43:
	jmp	short @44
@46:
;	?debug	L 211
	mov	al,byte ptr [bp+di-13]
	mov	bx,word ptr [bp+4]
	mov	byte ptr [bx+si],al
	inc	si
;	?debug	L 212
	dec	di
@44:
;	?debug	L 210
	or	di,di
	jne	@46
@45:
;	?debug	L 214
	mov	bx,word ptr [bp+4]
	mov	byte ptr [bx+si],0
@37:
;	?debug	L 215
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_mk_dStr	endp
;	?debug	L 217
_g_hexStr	proc	near
	push	bp
	mov	bp,sp
	sub	sp,6
	push	si
	mov	si,word ptr [bp+4]
;	?debug	L 223
	cmp	word ptr [bp+8],4
	jne	@48
	mov	word ptr [bp-2],-4096
	jmp	short @49
@48:
;	?debug	L 224
	mov	word ptr [bp-2],240
@49:
;	?debug	L 226
	mov	ax,word ptr [bp+8]
	dec	ax
	shl	ax,1
	shl	ax,1
	mov	word ptr [bp-6],ax
@52:
;	?debug	L 229
	mov	ax,word ptr [bp+6]
	and	ax,word ptr [bp-2]
	mov	cl,byte ptr [bp-6]
	shr	ax,cl
	mov	byte ptr [bp-3],al
;	?debug	L 230
	mov	ax,word ptr [bp-2]
	mov	cl,4
	shr	ax,cl
	mov	word ptr [bp-2],ax
;	?debug	L 231
	cmp	byte ptr [bp-3],9
	jle	@53
	add	byte ptr [bp-3],55
	jmp	short @54
@53:
;	?debug	L 232
	add	byte ptr [bp-3],48
@54:
;	?debug	L 233
	mov	al,byte ptr [bp-3]
	mov	byte ptr [si],al
	inc	si
;	?debug	L 234
	sub	word ptr [bp-6],4
@50:
;	?debug	L 235
	cmp	word ptr [bp-6],0
	jge	@52
@51:
;	?debug	L 236
	mov	byte ptr [si],0
@47:
;	?debug	L 237
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_g_hexStr	endp
;	?debug	L 240
_dispLine	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
	push	di
	mov	si,word ptr [bp+4]
;	?debug	L 246
	mov	al,byte ptr [si]
	mov	ah,0
	mov	di,ax
	mov	cl,8
	shl	di,cl
	mov	al,byte ptr [si+1]
	mov	ah,0
	or	di,ax
	inc	si
	inc	si
;	?debug	L 247
	mov	ax,5
	push	ax
	push	di
	lea	ax,word ptr [bp-8]
	push	ax
	call	near ptr _mk_dStr
	add	sp,6
;	?debug	L 248
	lea	ax,word ptr [bp-8]
	push	ax
	call	near ptr _c_puts
	pop	cx
	jmp	short @59
@58:
;	?debug	L 249
	mov	bx,si
	inc	si
	mov	al,byte ptr [bx]
	mov	ah,0
	push	ax
	call	near ptr _c_putch
	pop	cx
@57:
@59:
	cmp	byte ptr [si],0
	jne	@58
@56:
;	?debug	L 250
	call	near ptr _newline
;	?debug	L 251
	mov	ax,si
	inc	ax
	jmp	short @55
@55:
;	?debug	L 252
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_dispLine	endp
;	?debug	L 254
_dispList	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
	jmp	short @64
@63:
;	?debug	L 258
	call	near ptr _breakCheck
;	?debug	L 259
	push	si
	call	near ptr _dispLine
	pop	cx
	mov	si,ax
@62:
@64:
;	?debug	L 257
	test	byte ptr [si],128
	je	@63
@61:
@60:
;	?debug	L 261
	pop	si
	pop	bp
	ret	
_dispList	endp
;	?debug	L 263
_skipBlank	proc	near
@68:
;	?debug	L 266
	mov	bx,word ptr DGROUP:_pc
	cmp	byte ptr [bx],32
	je	@69
	jmp	short @65
@69:
;	?debug	L 267
	inc	word ptr DGROUP:_pc
@67:
	jmp	short @68
@66:
@65:
;	?debug	L 269
	ret	
_skipBlank	endp
;	?debug	L 271
_skipAlpha	proc	near
	push	si
@73:
;	?debug	L 274
	mov	bx,word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	mov	si,ax
;	?debug	L 275
	cmp	si,65
	jl	@75
	cmp	si,122
	jg	@75
	cmp	si,90
	jle	@74
	cmp	si,97
	jge	@74
@75:
	mov	ax,si
	jmp	short @70
@74:
;	?debug	L 276
	inc	word ptr DGROUP:_pc
@72:
	jmp	short @73
@71:
@70:
;	?debug	L 278
	pop	si
	ret	
_skipAlpha	endp
;	?debug	L 282
_exqt	proc	near
@79:
;	?debug	L 286
	call	near ptr _skipBlank
;	?debug	L 287
	call	near ptr _do_cmd
@78:
	jmp	short @79
@77:
@76:
;	?debug	L 289
	ret	
_exqt	endp
;	?debug	L 291
_topOfLine	proc	near
	push	si
@81:
;	?debug	L 296
	mov	bx,word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	mov	si,ax
	inc	word ptr DGROUP:_pc
;	?debug	L 297
	test	si,128
	je	@82
	xor	ax,ax
	push	ax
	call	near ptr _w_boot
	pop	cx
@82:
;	?debug	L 299
	mov	ax,si
	mov	cl,8
	shl	ax,cl
	mov	bx,word ptr DGROUP:_pc
	mov	dl,byte ptr [bx]
	mov	dh,0
	or	ax,dx
	mov	word ptr DGROUP:_lno,ax
	inc	word ptr DGROUP:_pc
;	?debug	L 301
	mov	bx,word ptr DGROUP:_pc
	cmp	byte ptr [bx],32
	je	@83
;	?debug	L 302
	push	word ptr DGROUP:_pc
	call	near ptr _skipLine
	pop	cx
	mov	word ptr DGROUP:_pc,ax
;	?debug	L 303
	jmp	short @81
@83:
@80:
;	?debug	L 305
	pop	si
	ret	
_topOfLine	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_bk_msg	label	word
	dw	DGROUP:DGROUP:s@+42
_DATA	ends
_TEXT	segment	byte public 'CODE'
;	?debug	L 309
_breakCheck	proc	near
	push	si
;	?debug	L 313
	call	near ptr _c_kbhit
	or	al,al
	je	@85
;	?debug	L 314
	call	near ptr _c_getch
	cbw	
	mov	si,ax
;	?debug	L 315
	cmp	si,3
	jne	@86
	push	word ptr DGROUP:_bk_msg
	call	near ptr _w_boot
	pop	cx
@86:
;	?debug	L 316
	cmp	si,19
	jne	@87
	call	near ptr _c_getch
@87:
@85:
@84:
;	?debug	L 318
	pop	si
	ret	
_breakCheck	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_DATA	ends
_TEXT	segment	byte public 'CODE'
;	?debug	L 320
_do_cmd	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
	push	di
;	?debug	L 324
	call	near ptr _breakCheck
;	?debug	L 325
	mov	bx,word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	mov	si,ax
	inc	word ptr DGROUP:_pc
;	?debug	L 326
	mov	bx,word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	mov	word ptr [bp-8],ax
;	?debug	L 327
	mov	ax,si
	mov	cx,7
	mov	bx,offset @117
@119:
	cmp	cs:[bx],ax
	je	@118
	inc	bx
	inc	bx
	loop	@119
	jmp	@98
@118:
	jmp	word ptr cs:[bx+14]
@117:
	dw	0
	dw	34
	dw	47
	dw	63
	dw	64
	dw	92
	dw	93
	dw	@90
	dw	@92
	dw	@93
	dw	@96
	dw	@94
	dw	@97
	dw	@91
@90:
;	?debug	L 329
	call	near ptr _topOfLine
;	?debug	L 330
	mov	ax,1
	jmp	@88
@91:
;	?debug	L 332
	call	near ptr _pop
	mov	word ptr DGROUP:_pc,ax
;	?debug	L 333
	xor	ax,ax
	jmp	@88
@92:
;	?debug	L 335
	call	near ptr _do_pr
;	?debug	L 336
	xor	ax,ax
	jmp	@88
@93:
;	?debug	L 338
	call	near ptr _newline
;	?debug	L 339
	xor	ax,ax
	jmp	@88
@94:
;	?debug	L 341
	cmp	word ptr [bp-8],61
	jne	@95
;	?debug	L 342
	mov	bx,word ptr DGROUP:_pc
	mov	al,byte ptr [bx+1]
	mov	ah,0
	mov	word ptr [bp-6],ax
;	?debug	L 343
	call	near ptr _operand
	mov	word ptr [bp-4],ax
;	?debug	L 344
	push	word ptr [bp-6]
	push	word ptr [bp-4]
	call	near ptr _do_until
	pop	cx
	pop	cx
;	?debug	L 345
	xor	ax,ax
	jmp	@88
@95:
;	?debug	L 347
	call	near ptr _do_do
;	?debug	L 348
	xor	ax,ax
	jmp	@88
@96:
;	?debug	L 350
	push	word ptr [bp-8]
	call	near ptr _do_prNum
	pop	cx
;	?debug	L 351
	xor	ax,ax
	jmp	@88
@97:
;	?debug	L 353
	call	near ptr _mach_fin
@98:
@89:
;	?debug	L 356
	cmp	word ptr [bp-8],61
	je	@123
	jmp	@99
@123:
;	?debug	L 357
	mov	ax,si
	mov	cx,7
	mov	bx,offset @120
@122:
	cmp	cs:[bx],ax
	je	@121
	inc	bx
	inc	bx
	loop	@122
	jmp	@109
@121:
	jmp	word ptr cs:[bx+14]
@120:
	dw	33
	dw	35
	dw	36
	dw	38
	dw	39
	dw	46
	dw	59
	dw	@102
	dw	@101
	dw	@103
	dw	@107
	dw	@106
	dw	@104
	dw	@105
@101:
;	?debug	L 359
	call	near ptr _operand
	mov	word ptr [bp-4],ax
	push	word ptr [bp-4]
	call	near ptr _do_goto
	pop	cx
	xor	ax,ax
	jmp	@88
@102:
;	?debug	L 361
	call	near ptr _operand
	mov	word ptr [bp-4],ax
	push	word ptr [bp-4]
	call	near ptr _do_gosub
	pop	cx
	xor	ax,ax
	jmp	@88
@103:
;	?debug	L 363
	call	near ptr _operand
	mov	word ptr [bp-4],ax
	push	word ptr [bp-4]
	call	near ptr _c_putch
	pop	cx
	xor	ax,ax
	jmp	@88
@104:
;	?debug	L 365
	call	near ptr _operand
	mov	word ptr [bp-4],ax
	push	word ptr [bp-4]
	call	near ptr _do_prSpc
	pop	cx
	xor	ax,ax
	jmp	@88
@105:
;	?debug	L 367
	call	near ptr _operand
	mov	word ptr [bp-4],ax
	push	word ptr [bp-4]
	call	near ptr _do_if
	pop	cx
	xor	ax,ax
	jmp	@88
@106:
;	?debug	L 369
	call	near ptr _operand
	mov	word ptr [bp-4],ax
	push	word ptr [bp-4]
	call	near ptr _srand
	pop	cx
	xor	ax,ax
	jmp	@88
@107:
;	?debug	L 375
	call	near ptr _operand
	mov	word ptr [bp-4],ax
;	?debug	L 376
	cmp	word ptr [bp-4],0
	jne	@108
	call	near ptr _newText
@108:
;	?debug	L 377
	xor	ax,ax
	jmp	@88
@109:
@100:
@99:
;	?debug	L 380
	call	near ptr _skipAlpha
	mov	di,ax
;	?debug	L 381
	cmp	di,58
	je	@111
	cmp	di,40
	jne	@110
@111:
;	?debug	L 382
	inc	word ptr DGROUP:_pc
;	?debug	L 383
	mov	bx,word ptr DGROUP:_pc
	inc	word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	push	ax
	call	near ptr _expr
	pop	cx
	mov	word ptr [bp-2],ax
;	?debug	L 384
	mov	bx,word ptr DGROUP:_pc
	cmp	byte ptr [bx-1],41
	je	@112
	mov	ax,offset DGROUP:s@+50
	push	ax
	call	near ptr _er_boot
	pop	cx
@112:
;	?debug	L 385
	call	near ptr _operand
	mov	word ptr [bp-4],ax
;	?debug	L 386
	cmp	di,58
	jne	@113
	mov	al,byte ptr [bp-4]
	mov	bx,si
	shl	bx,1
	mov	bx,word ptr DGROUP:_var[bx]
	add	bx,word ptr [bp-2]
	mov	byte ptr [bx],al
	jmp	short @114
@113:
;	?debug	L 387
	cmp	di,40
	jne	@115
	mov	ax,word ptr [bp-4]
	mov	bx,si
	shl	bx,1
	mov	bx,word ptr DGROUP:_var[bx]
	mov	dx,word ptr [bp-2]
	shl	dx,1
	add	bx,dx
	mov	word ptr [bx],ax
@115:
@114:
;	?debug	L 388
	xor	ax,ax
	jmp	short @88
@110:
;	?debug	L 390
	call	near ptr _operand
	mov	word ptr [bp-4],ax
;	?debug	L 391
	mov	ax,word ptr [bp-4]
	mov	bx,si
	shl	bx,1
	mov	word ptr DGROUP:_var[bx],ax
;	?debug	L 393
	mov	bx,word ptr DGROUP:_pc
	cmp	byte ptr [bx-1],44
	jne	@116
;	?debug	L 394
	mov	bx,word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	mov	si,ax
	inc	word ptr DGROUP:_pc
;	?debug	L 395
	push	si
	call	near ptr _expr
	pop	cx
	mov	word ptr [bp-4],ax
;	?debug	L 396
	push	word ptr DGROUP:_pc
	call	near ptr _push
	pop	cx
;	?debug	L 397
	push	word ptr [bp-4]
	call	near ptr _push
	pop	cx
@116:
;	?debug	L 399
	xor	ax,ax
	jmp	short @88
@88:
;	?debug	L 400
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_do_cmd	endp
;	?debug	L 402
_do_until	proc	near
	push	bp
	mov	bp,sp
;	?debug	L 404
	mov	ax,word ptr [bp+4]
	mov	bx,word ptr [bp+6]
	shl	bx,1
	mov	word ptr DGROUP:_var[bx],ax
;	?debug	L 405
	mov	bx,word ptr DGROUP:_sp
	shl	bx,1
	mov	ax,word ptr DGROUP:_stack[bx]
	cmp	ax,word ptr [bp+4]
	jge	@125
;	?debug	L 406
	sub	word ptr DGROUP:_sp,2
	jmp	short @124
@125:
;	?debug	L 410
	mov	bx,word ptr DGROUP:_sp
	dec	bx
	shl	bx,1
	mov	ax,word ptr DGROUP:_stack[bx]
	mov	word ptr DGROUP:_pc,ax
	jmp	short @124
@124:
;	?debug	L 412
	pop	bp
	ret	
_do_until	endp
;	?debug	L 414
_do_do	proc	near
;	?debug	L 416
	push	word ptr DGROUP:_pc
	call	near ptr _push
	pop	cx
;	?debug	L 417
	xor	ax,ax
	push	ax
	call	near ptr _push
	pop	cx
@126:
;	?debug	L 418
	ret	
_do_do	endp
;	?debug	L 420
_do_if	proc	near
	push	bp
	mov	bp,sp
;	?debug	L 422
	cmp	word ptr [bp+4],0
	jne	@128
;	?debug	L 423
	push	word ptr DGROUP:_pc
	call	near ptr _skipLine
	pop	cx
	mov	word ptr DGROUP:_pc,ax
;	?debug	L 424
	call	near ptr _topOfLine
@128:
@127:
;	?debug	L 426
	pop	bp
	ret	
_do_if	endp
;	?debug	L 428
_do_goto	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
	push	si
;	?debug	L 433
	cmp	word ptr [bp+4],-1
	jne	@130
	xor	ax,ax
	push	ax
	call	near ptr _w_boot
	pop	cx
@130:
;	?debug	L 435
	lea	ax,word ptr [bp-2]
	push	ax
	push	word ptr [bp+4]
	call	near ptr _searchLine
	pop	cx
	pop	cx
	mov	si,ax
;	?debug	L 436
	mov	word ptr DGROUP:_pc,si
;	?debug	L 437
	call	near ptr _topOfLine
@129:
;	?debug	L 438
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_do_goto	endp
;	?debug	L 440
_do_gosub	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
	push	si
;	?debug	L 445
	lea	ax,word ptr [bp-2]
	push	ax
	push	word ptr [bp+4]
	call	near ptr _searchLine
	pop	cx
	pop	cx
	mov	si,ax
;	?debug	L 446
	push	word ptr DGROUP:_pc
	call	near ptr _push
	pop	cx
;	?debug	L 447
	mov	word ptr DGROUP:_pc,si
;	?debug	L 448
	call	near ptr _topOfLine
@131:
;	?debug	L 449
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_do_gosub	endp
;	?debug	L 451
_do_prSpc	proc	near
	push	bp
	mov	bp,sp
	push	si
;	?debug	L 454
	xor	si,si
	jmp	short @136
@135:
	mov	ax,32
	push	ax
	call	near ptr _c_putch
	pop	cx
@134:
	inc	si
@136:
	cmp	si,word ptr [bp+4]
	jl	@135
@133:
@132:
;	?debug	L 455
	pop	si
	pop	bp
	ret	
_do_prSpc	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_DATA	ends
_TEXT	segment	byte public 'CODE'
;	?debug	L 457
_do_prNum	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
	push	si
	push	di
	mov	di,word ptr [bp+4]
;	?debug	L 461
	cmp	di,40
	jne	@138
;	?debug	L 462
	inc	word ptr DGROUP:_pc
;	?debug	L 463
	push	di
	call	near ptr _term
	pop	cx
	mov	word ptr [bp-2],ax
;	?debug	L 464
	call	near ptr _operand
	mov	si,ax
;	?debug	L 466
	push	word ptr [bp-2]
	push	si
	mov	ax,offset DGROUP:_lky_buf
	push	ax
	call	near ptr _mk_dStr
	add	sp,6
;	?debug	L 467
	mov	ax,offset DGROUP:_lky_buf
	push	ax
	call	near ptr _c_puts
	pop	cx
	jmp	short @137
@138:
;	?debug	L 471
	call	near ptr _operand
	mov	si,ax
;	?debug	L 472
	mov	ax,di
	cmp	ax,36
	je	@141
	cmp	ax,61
	je	@142
	cmp	ax,63
	je	@140
	jmp	short @143
@140:
;	?debug	L 474
	mov	ax,4
	push	ax
	push	si
	mov	ax,offset DGROUP:_lky_buf
	push	ax
	call	near ptr _g_hexStr
	add	sp,6
;	?debug	L 475
	jmp	short @139
@141:
;	?debug	L 477
	mov	ax,2
	push	ax
	push	si
	mov	ax,offset DGROUP:_lky_buf
	push	ax
	call	near ptr _g_hexStr
	add	sp,6
;	?debug	L 478
	jmp	short @139
@142:
;	?debug	L 480
	mov	ax,1
	push	ax
	push	si
	mov	ax,offset DGROUP:_lky_buf
	push	ax
	call	near ptr _mk_dStr
	add	sp,6
;	?debug	L 481
	jmp	short @139
@143:
;	?debug	L 483
	mov	ax,offset DGROUP:s@+52
	push	ax
	call	near ptr _er_boot
	pop	cx
@139:
;	?debug	L 485
	mov	ax,offset DGROUP:_lky_buf
	push	ax
	call	near ptr _c_puts
	pop	cx
@137:
;	?debug	L 486
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_do_prNum	endp
;	?debug	L 488
_do_pr	proc	near
	push	si
@147:
;	?debug	L 493
	mov	bx,word ptr DGROUP:_pc
	inc	word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	mov	si,ax
	mov	ax,si
	cmp	ax,34
	jne	@148
	jmp	short @145
@148:
;	?debug	L 494
	or	si,si
	jne	@149
	dec	word ptr DGROUP:_pc
	jmp	short @145
@149:
;	?debug	L 495
	push	si
	call	near ptr _c_putch
	pop	cx
@146:
	jmp	short @147
@145:
@144:
;	?debug	L 497
	pop	si
	ret	
_do_pr	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_DATA	ends
_TEXT	segment	byte public 'CODE'
;	?debug	L 499
_pop	proc	near
;	?debug	L 501
	cmp	word ptr DGROUP:_sp,0
	jge	@151
	mov	ax,offset DGROUP:s@+54
	push	ax
	call	near ptr _er_boot
	pop	cx
@151:
;	?debug	L 502
	mov	ax,word ptr DGROUP:_sp
	dec	word ptr DGROUP:_sp
	mov	bx,ax
	shl	bx,1
	mov	ax,word ptr DGROUP:_stack[bx]
	jmp	short @150
@150:
;	?debug	L 503
	ret	
_pop	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_DATA	ends
_TEXT	segment	byte public 'CODE'
;	?debug	L 505
_push	proc	near
	push	bp
	mov	bp,sp
;	?debug	L 507
	cmp	word ptr DGROUP:_sp,99
	jl	@153
	mov	ax,offset DGROUP:s@+56
	push	ax
	call	near ptr _er_boot
	pop	cx
@153:
;	?debug	L 508
	mov	ax,word ptr [bp+4]
	inc	word ptr DGROUP:_sp
	mov	bx,word ptr DGROUP:_sp
	shl	bx,1
	mov	word ptr DGROUP:_stack[bx],ax
	jmp	short @152
@152:
;	?debug	L 509
	pop	bp
	ret	
_push	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_DATA	ends
_TEXT	segment	byte public 'CODE'
;	?debug	L 511
_operand	proc	near
	push	si
	push	di
@157:
;	?debug	L 516
	mov	bx,word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	mov	si,ax
	inc	word ptr DGROUP:_pc
;	?debug	L 517
	cmp	si,61
	jne	@158
	jmp	short @155
@158:
;	?debug	L 518
	test	si,223
	jne	@159
	mov	ax,offset DGROUP:s@+58
	push	ax
	call	near ptr _errMsg
	pop	cx
@159:
@156:
	jmp	short @157
@155:
;	?debug	L 520
	mov	bx,word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	mov	si,ax
	inc	word ptr DGROUP:_pc
;	?debug	L 521
	push	si
	call	near ptr _expr
	pop	cx
	mov	di,ax
;	?debug	L 522
	mov	ax,di
	jmp	short @154
@154:
;	?debug	L 523
	pop	di
	pop	si
	ret	
_operand	endp
;	?debug	L 527
_expr	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
;	?debug	L 532
	push	word ptr [bp+4]
	call	near ptr _term
	pop	cx
	mov	si,ax
@163:
;	?debug	L 535
	mov	bx,word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	mov	word ptr [bp-4],ax
	inc	word ptr DGROUP:_pc
;	?debug	L 536
	mov	ax,word ptr [bp-4]
	mov	cx,11
	mov	bx,offset @184
@186:
	cmp	cs:[bx],ax
	je	@185
	inc	bx
	inc	bx
	loop	@186
	jmp	@183
@185:
	jmp	word ptr cs:[bx+22]
@184:
	dw	0
	dw	32
	dw	41
	dw	42
	dw	43
	dw	44
	dw	45
	dw	47
	dw	60
	dw	61
	dw	62
	dw	@165
	dw	@166
	dw	@167
	dw	@180
	dw	@178
	dw	@168
	dw	@179
	dw	@181
	dw	@169
	dw	@182
	dw	@174
@165:
;	?debug	L 538
	dec	word ptr DGROUP:_pc
@166:
@167:
@168:
;	?debug	L 542
	mov	ax,si
	jmp	@160
@169:
;	?debug	L 544
	mov	bx,word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	mov	word ptr [bp-2],ax
	inc	word ptr DGROUP:_pc
;	?debug	L 545
	mov	ax,word ptr [bp-2]
	cmp	ax,61
	je	@172
	cmp	ax,62
	je	@171
	jmp	short @173
@171:
;	?debug	L 547
	mov	bx,word ptr DGROUP:_pc
	inc	word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	push	ax
	call	near ptr _term
	pop	cx
	mov	di,ax
;	?debug	L 548
	cmp	si,di
	je	@188
	mov	ax,1
	jmp	short @187
@188:
	xor	ax,ax
@187:
	mov	si,ax
;	?debug	L 549
	jmp	@162
@172:
;	?debug	L 551
	mov	bx,word ptr DGROUP:_pc
	inc	word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	push	ax
	call	near ptr _term
	pop	cx
	mov	di,ax
;	?debug	L 552
	cmp	si,di
	jg	@190
	mov	ax,1
	jmp	short @189
@190:
	xor	ax,ax
@189:
	mov	si,ax
;	?debug	L 553
	jmp	@162
@173:
;	?debug	L 555
	push	word ptr [bp-2]
	call	near ptr _term
	pop	cx
	mov	di,ax
;	?debug	L 556
	cmp	si,di
	jge	@192
	mov	ax,1
	jmp	short @191
@192:
	xor	ax,ax
@191:
	mov	si,ax
;	?debug	L 557
	jmp	@162
@170:
@174:
;	?debug	L 560
	mov	bx,word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	mov	word ptr [bp-2],ax
	inc	word ptr DGROUP:_pc
;	?debug	L 561
	mov	ax,word ptr [bp-2]
	cmp	ax,61
	je	@176
	jmp	short @177
@176:
;	?debug	L 563
	mov	bx,word ptr DGROUP:_pc
	inc	word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	push	ax
	call	near ptr _term
	pop	cx
	mov	di,ax
;	?debug	L 564
	cmp	si,di
	jl	@194
	mov	ax,1
	jmp	short @193
@194:
	xor	ax,ax
@193:
	mov	si,ax
;	?debug	L 565
	jmp	@162
@177:
;	?debug	L 567
	push	word ptr [bp-2]
	call	near ptr _term
	pop	cx
	mov	di,ax
;	?debug	L 568
	cmp	si,di
	jle	@196
	mov	ax,1
	jmp	short @195
@196:
	xor	ax,ax
@195:
	mov	si,ax
;	?debug	L 569
	jmp	@162
@175:
@178:
;	?debug	L 571
	mov	bx,word ptr DGROUP:_pc
	inc	word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	push	ax
	call	near ptr _term
	pop	cx
	mov	di,ax
	mov	ax,si
	add	ax,di
	mov	si,ax
	jmp	@164
@179:
;	?debug	L 572
	mov	bx,word ptr DGROUP:_pc
	inc	word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	push	ax
	call	near ptr _term
	pop	cx
	mov	di,ax
	mov	ax,si
	sub	ax,di
	mov	si,ax
	jmp	@164
@180:
;	?debug	L 573
	mov	bx,word ptr DGROUP:_pc
	inc	word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	push	ax
	call	near ptr _term
	pop	cx
	mov	di,ax
	mov	ax,si
	mul	di
	mov	si,ax
	jmp	short @164
@181:
;	?debug	L 574
	mov	bx,word ptr DGROUP:_pc
	inc	word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	push	ax
	call	near ptr _term
	pop	cx
	mov	di,ax
	mov	ax,si
	cwd	
	idiv	di
	mov	word ptr DGROUP:_var+74,dx
	mov	ax,si
	cwd	
	idiv	di
	mov	si,ax
	jmp	short @164
@182:
;	?debug	L 575
	mov	bx,word ptr DGROUP:_pc
	inc	word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	push	ax
	call	near ptr _term
	pop	cx
	mov	di,ax
	cmp	si,di
	jne	@198
	mov	ax,1
	jmp	short @197
@198:
	xor	ax,ax
@197:
	mov	si,ax
	jmp	short @164
@183:
;	?debug	L 577
	mov	byte ptr DGROUP:_mm,32
	mov	al,byte ptr [bp-4]
	mov	byte ptr DGROUP:_mm+1,al
	mov	byte ptr DGROUP:_mm+2,63
	mov	byte ptr DGROUP:_mm+3,0
;	?debug	L 578
	mov	ax,offset DGROUP:_mm
	push	ax
	call	near ptr _errMsg
	pop	cx
@164:
@162:
	jmp	@163
@161:
@160:
;	?debug	L 581
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_expr	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_DATA	ends
_TEXT	segment	byte public 'CODE'
;	?debug	L 583
_term	proc	near
	push	bp
	mov	bp,sp
	sub	sp,6
	push	si
	push	di
	mov	di,word ptr [bp+4]
;	?debug	L 585
	mov	word ptr [bp-6],0
;	?debug	L 588
	mov	ax,di
	mov	cx,9
	mov	bx,offset @222
@224:
	cmp	cs:[bx],ax
	je	@223
	inc	bx
	inc	bx
	loop	@224
	jmp	@213
@223:
	jmp	word ptr cs:[bx+18]
@222:
	dw	34
	dw	35
	dw	36
	dw	37
	dw	39
	dw	40
	dw	43
	dw	45
	dw	63
	dw	@211
	dw	@207
	dw	@201
	dw	@209
	dw	@208
	dw	@203
	dw	@205
	dw	@206
	dw	@210
@201:
;	?debug	L 590
	lea	ax,word ptr [bp-6]
	push	ax
	call	near ptr _getHex
	pop	cx
	mov	si,ax
;	?debug	L 591
	cmp	word ptr [bp-6],0
	jne	@202
	call	near ptr _c_getch
	cbw	
	jmp	@199
@202:
;	?debug	L 592
	mov	ax,si
	jmp	@199
@203:
;	?debug	L 595
	mov	bx,word ptr DGROUP:_pc
	inc	word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	push	ax
	call	near ptr _expr
	pop	cx
	mov	si,ax
;	?debug	L 596
	mov	bx,word ptr DGROUP:_pc
	cmp	byte ptr [bx-1],41
	je	@204
	mov	ax,offset DGROUP:s@+61
	push	ax
	call	near ptr _errMsg
	pop	cx
@204:
;	?debug	L 597
	mov	ax,si
	jmp	@199
@205:
;	?debug	L 600
	mov	bx,word ptr DGROUP:_pc
	inc	word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	push	ax
	call	near ptr _term
	pop	cx
	mov	si,ax
;	?debug	L 601
	or	si,si
	jge	@226
	mov	ax,si
	neg	ax
	jmp	short @225
@226:
	mov	ax,si
@225:
	jmp	@199
@206:
;	?debug	L 604
	mov	bx,word ptr DGROUP:_pc
	inc	word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	push	ax
	call	near ptr _term
	pop	cx
	neg	ax
	jmp	@199
@207:
;	?debug	L 607
	mov	bx,word ptr DGROUP:_pc
	inc	word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	push	ax
	call	near ptr _term
	pop	cx
	neg	ax
	sbb	ax,ax
	inc	ax
	jmp	@199
@208:
;	?debug	L 610
	call	near ptr _rand
	push	ax
	mov	bx,word ptr DGROUP:_pc
	inc	word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	push	ax
	call	near ptr _term
	pop	cx
	mov	bx,ax
	pop	ax
	cwd	
	idiv	bx
	mov	ax,dx
	inc	ax
	jmp	@199
@209:
;	?debug	L 613
	mov	bx,word ptr DGROUP:_pc
	inc	word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	push	ax
	call	near ptr _term
	pop	cx
	mov	si,ax
;	?debug	L 614
	mov	ax,word ptr DGROUP:_var+74
	jmp	@199
@210:
;	?debug	L 617
	mov	ax,offset DGROUP:_lky_buf
	push	ax
	call	near ptr _c_gets
	pop	cx
;	?debug	L 618
	mov	ax,word ptr DGROUP:_pc
	mov	word ptr [bp-2],ax
;	?debug	L 619
	mov	word ptr DGROUP:_pc,offset DGROUP:_lky_buf
;	?debug	L 620
	mov	bx,word ptr DGROUP:_pc
	inc	word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	push	ax
	call	near ptr _expr
	pop	cx
	mov	si,ax
;	?debug	L 621
	mov	ax,word ptr [bp-2]
	mov	word ptr DGROUP:_pc,ax
;	?debug	L 622
	mov	ax,si
	jmp	@199
@211:
;	?debug	L 625
	mov	bx,word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	mov	si,ax
	inc	word ptr DGROUP:_pc
;	?debug	L 626
	mov	bx,word ptr DGROUP:_pc
	inc	word ptr DGROUP:_pc
	cmp	byte ptr [bx],34
	je	@212
	mov	ax,offset DGROUP:s@+65
	push	ax
	call	near ptr _errMsg
	pop	cx
@212:
;	?debug	L 627
	mov	ax,si
	jmp	@199
@213:
@200:
;	?debug	L 629
	cmp	di,48
	jl	@214
	cmp	di,57
	jg	@214
;	?debug	L 630
	dec	word ptr DGROUP:_pc
	lea	ax,word ptr [bp-6]
	push	ax
	call	near ptr _getNum
	pop	cx
	mov	si,ax
;	?debug	L 631
	mov	ax,si
	jmp	@199
@214:
;	?debug	L 634
	call	near ptr _skipAlpha
	mov	word ptr [bp-4],ax
;	?debug	L 635
	cmp	word ptr [bp-4],58
	je	@216
	cmp	word ptr [bp-4],40
	jne	@215
@216:
;	?debug	L 636
	inc	word ptr DGROUP:_pc
;	?debug	L 637
	mov	bx,word ptr DGROUP:_pc
	inc	word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	push	ax
	call	near ptr _expr
	pop	cx
	mov	si,ax
;	?debug	L 639
	mov	bx,word ptr DGROUP:_pc
	cmp	byte ptr [bx-1],41
	je	@217
	mov	ax,offset DGROUP:s@+69
	push	ax
	call	near ptr _errMsg
	pop	cx
@217:
;	?debug	L 641
	mov	ax,word ptr [bp-4]
	cmp	ax,40
	je	@220
	cmp	ax,58
	je	@219
	jmp	short @221
@219:
;	?debug	L 642
	mov	bx,di
	shl	bx,1
	mov	bx,word ptr DGROUP:_var[bx]
	mov	al,byte ptr [bx+si]
	mov	ah,0
	jmp	short @199
@220:
;	?debug	L 643
	mov	bx,di
	shl	bx,1
	mov	bx,word ptr DGROUP:_var[bx]
	mov	ax,si
	shl	ax,1
	add	bx,ax
	mov	ax,word ptr [bx]
	jmp	short @199
@221:
@218:
@215:
;	?debug	L 646
	mov	bx,di
	shl	bx,1
	mov	ax,word ptr DGROUP:_var[bx]
	jmp	short @199
@199:
;	?debug	L 647
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_term	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_DATA	ends
_TEXT	segment	byte public 'CODE'
;	?debug	L 649
_errMsg	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
;	?debug	L 654
	mov	ax,offset DGROUP:s@+73
	push	ax
	call	near ptr _c_puts
	pop	cx
;	?debug	L 655
	push	word ptr [bp+4]
	call	near ptr _c_puts
	pop	cx
;	?debug	L 656
	cmp	word ptr DGROUP:_lno,0
	je	@228
;	?debug	L 657
	mov	ax,offset DGROUP:s@+79
	push	ax
	call	near ptr _c_puts
	pop	cx
;	?debug	L 659
	mov	ax,1
	push	ax
	push	word ptr DGROUP:_lno
	lea	ax,word ptr [bp-8]
	push	ax
	call	near ptr _mk_dStr
	add	sp,6
;	?debug	L 660
	lea	ax,word ptr [bp-8]
	push	ax
	call	near ptr _c_puts
	pop	cx
@228:
;	?debug	L 662
	xor	ax,ax
	push	ax
	call	near ptr _w_boot
	pop	cx
@227:
;	?debug	L 663
	mov	sp,bp
	pop	bp
	ret	
_errMsg	endp
;	?debug	L 665
_w_boot	proc	near
	push	bp
	mov	bp,sp
;	?debug	L 667
	cmp	word ptr [bp+4],0
	je	@230
	push	word ptr [bp+4]
	call	near ptr _c_puts
	pop	cx
@230:
;	?debug	L 668
	call	near ptr _warm_boot
@229:
;	?debug	L 669
	pop	bp
	ret	
_w_boot	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_DATA	ends
_TEXT	segment	byte public 'CODE'
;	?debug	L 671
_er_boot	proc	near
	push	bp
	mov	bp,sp
;	?debug	L 673
	mov	ax,offset DGROUP:s@+84
	push	ax
	call	near ptr _c_puts
	pop	cx
;	?debug	L 674
	cmp	word ptr [bp+4],0
	je	@232
	push	word ptr [bp+4]
	call	near ptr _c_puts
	pop	cx
@232:
;	?debug	L 675
	call	near ptr _warm_boot
@231:
;	?debug	L 676
	pop	bp
	ret	
_er_boot	endp
;	?debug	L 678
_c_isprint	proc	near
	push	bp
	mov	bp,sp
	cmp	byte ptr [bp+4],32
	jl	@235
	cmp	byte ptr [bp+4],126
	jg	@235
	mov	ax,1
	jmp	short @234
@235:
	xor	ax,ax
@234:
	jmp	short @233
@233:
	pop	bp
	ret	
_c_isprint	endp
;	?debug	L 679
_c_isspace	proc	near
	push	bp
	mov	bp,sp
	cmp	byte ptr [bp+4],32
	je	@239
	cmp	byte ptr [bp+4],13
	jg	@238
	cmp	byte ptr [bp+4],9
	jl	@238
@239:
	mov	ax,1
	jmp	short @237
@238:
	xor	ax,ax
@237:
	jmp	short @236
@236:
	pop	bp
	ret	
_c_isspace	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_DATA	ends
_TEXT	segment	byte public 'CODE'
;	?debug	L 681
_newline	proc	near
	push	si
;	?debug	L 682
	mov	si,offset DGROUP:s@+90
;	?debug	L 684
	push	si
	call	near ptr _c_puts
	pop	cx
@240:
;	?debug	L 685
	pop	si
	ret	
_newline	endp
;	?debug	L 687
_c_gets	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	mov	si,word ptr [bp+4]
;	?debug	L 691
	mov	word ptr [bp-2],0
	jmp	short @242
@244:
;	?debug	L 693
	cmp	byte ptr [bp-3],9
	jne	@245
	mov	byte ptr [bp-3],32
@245:
;	?debug	L 694
	cmp	byte ptr [bp-3],8
	je	@247
	cmp	byte ptr [bp-3],127
	jne	@246
@247:
	cmp	word ptr [bp-2],0
	jbe	@246
;	?debug	L 695
	dec	word ptr [bp-2]
;	?debug	L 696
	mov	ax,8
	push	ax
	call	near ptr _c_putch
	pop	cx
	mov	ax,32
	push	ax
	call	near ptr _c_putch
	pop	cx
	mov	ax,8
	push	ax
	call	near ptr _c_putch
	pop	cx
;	?debug	L 697
	jmp	short @248
@246:
;	?debug	L 698
	push	word ptr [bp-3]
	call	near ptr _c_isprint
	pop	cx
	or	al,al
	je	@249
	cmp	word ptr [bp-2],159
	jae	@249
;	?debug	L 699
	mov	al,byte ptr [bp-3]
	mov	bx,word ptr [bp-2]
	mov	byte ptr [bx+si],al
	inc	word ptr [bp-2]
;	?debug	L 700
	mov	al,byte ptr [bp-3]
	cbw	
	push	ax
	call	near ptr _c_putch
	pop	cx
@249:
@248:
@242:
;	?debug	L 692
	call	near ptr _c_getch
	mov	byte ptr [bp-3],al
	cmp	al,13
	jne	@244
@243:
;	?debug	L 703
	call	near ptr _newline
;	?debug	L 704
	mov	bx,word ptr [bp-2]
	mov	byte ptr [bx+si],0
;	?debug	L 706
	cmp	word ptr [bp-2],0
	jbe	@250
@253:
;	?debug	L 708
	dec	word ptr [bp-2]
@251:
;	?debug	L 709
	mov	bx,word ptr [bp-2]
	push	word ptr [bx+si]
	call	near ptr _c_isspace
	pop	cx
	or	al,al
	jne	@253
@252:
;	?debug	L 710
	inc	word ptr [bp-2]
;	?debug	L 711
	mov	bx,word ptr [bp-2]
	mov	byte ptr [bx+si],0
@250:
;	?debug	L 713
	mov	ax,word ptr [bp-2]
	jmp	short @241
@241:
;	?debug	L 714
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_c_gets	endp
;	?debug	L 716
_memmove	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
;	?debug	L 721
	mov	ax,word ptr [bp+4]
	cmp	ax,word ptr [bp+6]
	ja	@255
;	?debug	L 722
	mov	si,word ptr [bp+4]
;	?debug	L 723
	mov	di,word ptr [bp+6]
	jmp	short @256
@258:
;	?debug	L 726
	mov	al,byte ptr [di]
	mov	byte ptr [si],al
	inc	di
	inc	si
@256:
;	?debug	L 725
	mov	ax,word ptr [bp+8]
	dec	word ptr [bp+8]
	or	ax,ax
	jne	@258
@257:
;	?debug	L 728
	jmp	short @259
@255:
;	?debug	L 729
	mov	si,word ptr [bp+4]
;	?debug	L 730
	add	si,word ptr [bp+8]
;	?debug	L 731
	mov	di,word ptr [bp+6]
;	?debug	L 732
	add	di,word ptr [bp+8]
	jmp	short @260
@262:
;	?debug	L 735
	dec	si
	dec	di
	mov	al,byte ptr [di]
	mov	byte ptr [si],al
@260:
;	?debug	L 734
	mov	ax,word ptr [bp+8]
	dec	word ptr [bp+8]
	or	ax,ax
	jne	@262
@261:
@259:
@254:
;	?debug	L 738
	pop	di
	pop	si
	pop	bp
	ret	
_memmove	endp
;	?debug	L 740
_strcpy	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
	push	si
	mov	si,word ptr [bp+4]
;	?debug	L 746
	mov	byte ptr [bp-1],0
	jmp	short @264
@266:
;	?debug	L 748
	cmp	byte ptr [bp-2],34
	jne	@267
	xor	byte ptr [bp-1],1
@267:
;	?debug	L 749
	cmp	byte ptr [bp-2],97
	jl	@268
	cmp	byte ptr [bp-2],122
	jg	@268
	cmp	byte ptr [bp-1],0
	jne	@268
	and	byte ptr [bp-2],-33
@268:
;	?debug	L 750
	mov	al,byte ptr [bp-2]
	mov	byte ptr [si],al
	inc	si
@264:
;	?debug	L 747
	mov	bx,word ptr [bp+6]
	inc	word ptr [bp+6]
	mov	al,byte ptr [bx]
	mov	byte ptr [bp-2],al
	or	al,al
	jne	@266
@265:
;	?debug	L 752
	mov	byte ptr [si],0
@263:
;	?debug	L 753
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_strcpy	endp
;	?debug	L 755
_strlen	proc	near
	push	bp
	mov	bp,sp
	push	si
;	?debug	L 757
	xor	si,si
	jmp	short @270
@272:
;	?debug	L 760
	inc	si
@270:
;	?debug	L 759
	mov	bx,word ptr [bp+4]
	inc	word ptr [bp+4]
	cmp	byte ptr [bx],0
	jne	@272
@271:
;	?debug	L 763
	mov	ax,si
	jmp	short @269
@269:
;	?debug	L 764
	pop	si
	pop	bp
	ret	
_strlen	endp
;	?debug	L 766
_getNum	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
	push	si
;	?debug	L 770
	xor	si,si
;	?debug	L 771
	mov	bx,word ptr [bp+4]
	mov	word ptr [bx],0
;	?debug	L 773
	mov	bx,word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	byte ptr [bp-1],al
	jmp	short @274
@276:
;	?debug	L 775
	mov	ax,si
	mov	dx,10
	mul	dx
	mov	dl,byte ptr [bp-1]
	mov	dh,0
	add	ax,dx
	add	ax,-48
	mov	si,ax
;	?debug	L 776
	inc	word ptr DGROUP:_pc
;	?debug	L 777
	mov	bx,word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	byte ptr [bp-1],al
;	?debug	L 778
	mov	bx,word ptr [bp+4]
	mov	word ptr [bx],1
@274:
;	?debug	L 774
	cmp	byte ptr [bp-1],48
	jb	@277
	cmp	byte ptr [bp-1],57
	jbe	@276
@277:
@275:
;	?debug	L 780
	mov	ax,si
	jmp	short @273
@273:
;	?debug	L 782
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_getNum	endp
;	?debug	L 784
_getHex	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
;	?debug	L 788
	xor	di,di
;	?debug	L 789
	mov	bx,word ptr [bp+4]
	mov	word ptr [bx],0
;	?debug	L 791
	mov	bx,word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	mov	si,ax
	jmp	short @279
@281:
;	?debug	L 793
	mov	ax,di
	mov	cl,4
	shl	ax,cl
	push	ax
	cmp	si,65
	jge	@286
	mov	ax,si
	add	ax,-48
	jmp	short @285
@286:
	cmp	si,97
	jge	@288
	mov	ax,si
	add	ax,-65
	jmp	short @287
@288:
	mov	ax,si
	add	ax,-97
@287:
	add	ax,10
@285:
	pop	dx
	add	dx,ax
	mov	di,dx
;	?debug	L 794
	inc	word ptr DGROUP:_pc
;	?debug	L 795
	mov	bx,word ptr DGROUP:_pc
	mov	al,byte ptr [bx]
	mov	ah,0
	mov	si,ax
;	?debug	L 796
	mov	bx,word ptr [bp+4]
	mov	word ptr [bx],1
@279:
;	?debug	L 792
	cmp	si,48
	jl	@282
	cmp	si,57
	jle	@281
@282:
	cmp	si,65
	jl	@283
	cmp	si,70
	jle	@281
@283:
	cmp	si,97
	jl	@284
	cmp	si,102
	jle	@281
@284:
@280:
;	?debug	L 798
	mov	ax,di
	jmp	short @278
@278:
;	?debug	L 799
	pop	di
	pop	si
	pop	bp
	ret	
_getHex	endp
;	?debug	L 801
_newText	proc	near
;	?debug	L 803
	mov	bx,word ptr DGROUP:_var+76
	cmp	byte ptr [bx],255
	je	@290
	push	word ptr DGROUP:_t_lock
	call	near ptr _er_boot
	pop	cx
@290:
;	?debug	L 804
	call	near ptr _newText1
@289:
;	?debug	L 805
	ret	
_newText	endp
;	?debug	L 807
_newText1	proc	near
;	?debug	L 809
	mov	ax,word ptr DGROUP:_var+122
	mov	word ptr DGROUP:_var+76,ax
;	?debug	L 810
	mov	bx,word ptr DGROUP:_var+76
	mov	byte ptr [bx],255
@291:
;	?debug	L 811
	ret	
_newText1	endp
_TEXT	ends
_BSS	segment word public 'BSS'
_pc	label	word
	db	2 dup (?)
_mm	label	byte
	db	4 dup (?)
_sp	label	word
	db	2 dup (?)
_lin	label	byte
	db	160 dup (?)
_lno	label	word
	db	2 dup (?)
_var	label	word
	db	256 dup (?)
_stack	label	word
	db	200 dup (?)
_lky_buf	label	byte
	db	160 dup (?)
_text_buf	label	byte
	db	23808 dup (?)
_BSS	ends
	?debug	C E9
_DATA	segment word public 'DATA'
s@	label	byte
	db	71
	db	65
	db	77
	db	69
	db	56
	db	54
	db	13
	db	10
	db	83
	db	66
	db	67
	db	45
	db	86
	db	50
	db	48
	db	47
	db	56
	db	48
	db	56
	db	56
	db	32
	db	69
	db	100
	db	105
	db	116
	db	105
	db	111
	db	110
	db	13
	db	10
	db	0
	db	42
	db	82
	db	69
	db	65
	db	68
	db	89
	db	13
	db	10
	db	0
	db	49
	db	0
	db	13
	db	10
	db	83
	db	116
	db	111
	db	112
	db	33
	db	0
	db	50
	db	0
	db	51
	db	0
	db	52
	db	0
	db	53
	db	0
	db	32
	db	63
	db	0
	db	32
	db	41
	db	63
	db	0
	db	32
	db	34
	db	63
	db	0
	db	32
	db	41
	db	63
	db	0
	db	13
	db	10
	db	69
	db	114
	db	114
	db	0
	db	32
	db	105
	db	110
	db	32
	db	0
	db	13
	db	10
	db	69
	db	114
	db	114
	db	0
	db	13
	db	10
	db	0
_DATA	ends
_TEXT	segment	byte public 'CODE'
	extrn	_warm_boot:near
	extrn	_mach_fin:near
	extrn	_c_kbhit:near
	extrn	_c_putch:near
	extrn	_c_getch:near
	extrn	_srand:near
	extrn	_rand:near
_TEXT	ends
	public	_c_isprint
	public	_breakCheck
	public	_searchLine
	public	_skipBlank
	public	_deleteLine
	public	_dispList
	public	_g_hexStr
	public	_g_decStr
	public	_topOfLine
	public	_newText
	public	_do_prNum
	public	_c_isspace
	public	_skipAlpha
	public	_strcpy
	public	_mk_dStr
	public	_er_boot
	public	_do_until
	public	_text_buf
	public	_open_msg
	public	_getHex
	public	_w_boot
	public	_skipLine
	public	_do_goto
	public	_dispLine
	public	_do_prSpc
	public	_c_gets
	public	_c_puts
	public	_rdy_msg
	public	_do_gosub
	public	_strlen
	public	_lky_buf
	public	_newline
	public	_memmove
	public	_t_lock
	public	_operand
	public	_getNum
	public	_addLine
	public	_do_pr
	public	_errMsg
	public	_do_do
	public	_stack
	public	_bk_msg
	public	_edit
	public	_exqt
	public	_do_cmd
	public	_expr
	public	_term
	public	_main
	public	_var
	public	_do_if
	public	_push
	public	_pop
	public	_lno
	public	_lin
	public	_sp
	public	_mm
	public	_pc
	public	_newText1
	end
