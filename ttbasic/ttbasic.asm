	ifndef	??version
?debug	macro
	endm
	endif
	?debug	S ".\ttbasic.c"
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
	?debug	C E945555C560B2E5C747462617369632E63
_BSS	ends
_TEXT	segment	byte public 'CODE'
;	?debug	L 25
_main	proc	near
;	?debug	L 27
	mov	ax,1234
	push	ax
	call	near ptr _srand
	pop	cx
;	?debug	L 28
	call	near ptr _basic
;	?debug	L 29
	xor	ax,ax
	jmp	short @1
@1:
;	?debug	L 30
	ret	
_main	endp
;	?debug	L 62
_newline	proc	near
;	?debug	L 63
	mov	al,13
	push	ax
	call	near ptr _c_putch
	pop	cx
;	?debug	L 64
	mov	al,10
	push	ax
	call	near ptr _c_putch
	pop	cx
@2:
;	?debug	L 65
	ret	
_newline	endp
;	?debug	L 68
_getrnd	proc	near
	push	bp
	mov	bp,sp
;	?debug	L 69
	call	near ptr _rand
	cwd	
	idiv	word ptr [bp+4]
	mov	ax,dx
	inc	ax
	jmp	short @3
@3:
;	?debug	L 70
	pop	bp
	ret	
_getrnd	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_kwtbl	label	word
	dw	DGROUP:DGROUP:s@
	dw	DGROUP:DGROUP:s@+5
	dw	DGROUP:DGROUP:s@+11
	dw	DGROUP:DGROUP:s@+18
	dw	DGROUP:DGROUP:s@+22
	dw	DGROUP:DGROUP:s@+25
	dw	DGROUP:DGROUP:s@+30
	dw	DGROUP:DGROUP:s@+35
	dw	DGROUP:DGROUP:s@+38
	dw	DGROUP:DGROUP:s@+42
	dw	DGROUP:DGROUP:s@+47
	dw	DGROUP:DGROUP:s@+53
	dw	DGROUP:DGROUP:s@+59
	dw	DGROUP:DGROUP:s@+63
	dw	DGROUP:DGROUP:s@+65
	dw	DGROUP:DGROUP:s@+67
	dw	DGROUP:DGROUP:s@+69
	dw	DGROUP:DGROUP:s@+71
	dw	DGROUP:DGROUP:s@+73
	dw	DGROUP:DGROUP:s@+75
	dw	DGROUP:DGROUP:s@+77
	dw	DGROUP:DGROUP:s@+79
	dw	DGROUP:DGROUP:s@+82
	dw	DGROUP:DGROUP:s@+84
	dw	DGROUP:DGROUP:s@+86
	dw	DGROUP:DGROUP:s@+88
	dw	DGROUP:DGROUP:s@+91
	dw	DGROUP:DGROUP:s@+93
	dw	DGROUP:DGROUP:s@+95
	dw	DGROUP:DGROUP:s@+99
	dw	DGROUP:DGROUP:s@+103
	dw	DGROUP:DGROUP:s@+108
	dw	DGROUP:DGROUP:s@+113
	dw	DGROUP:DGROUP:s@+117
	dw	DGROUP:DGROUP:s@+121
_i_nsa	label	byte
	db	2
	db	9
	db	13
	db	15
	db	16
	db	17
	db	18
	db	19
	db	20
	db	21
	db	22
	db	23
	db	24
	db	25
	db	26
	db	27
	db	28
	db	29
	db	30
_i_nsb	label	byte
	db	15
	db	16
	db	17
	db	18
	db	19
	db	20
	db	21
	db	22
	db	23
	db	24
	db	25
	db	26
	db	13
	db	14
	db	38
_DATA	ends
_TEXT	segment	byte public 'CODE'
;	?debug	L 123
_sstyle	proc	near
	push	bp
	mov	bp,sp
	jmp	short @5
@7:
;	?debug	L 125
	mov	al,byte ptr [bp+8]
	mov	ah,0
	mov	bx,ax
	add	bx,word ptr [bp+6]
	mov	al,byte ptr [bx]
	cmp	al,byte ptr [bp+4]
	jne	@8
	mov	al,1
	jmp	short @4
@8:
@5:
;	?debug	L 124
	mov	al,byte ptr [bp+8]
	dec	byte ptr [bp+8]
	or	al,al
	jne	@7
@6:
;	?debug	L 127
	mov	al,0
	jmp	short @4
@4:
;	?debug	L 128
	pop	bp
	ret	
_sstyle	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_errmsg	label	word
	dw	DGROUP:DGROUP:s@+128
	dw	DGROUP:DGROUP:s@+131
	dw	DGROUP:DGROUP:s@+148
	dw	DGROUP:DGROUP:s@+157
	dw	DGROUP:DGROUP:s@+180
	dw	DGROUP:DGROUP:s@+198
	dw	DGROUP:DGROUP:s@+208
	dw	DGROUP:DGROUP:s@+230
	dw	DGROUP:DGROUP:s@+253
	dw	DGROUP:DGROUP:s@+273
	dw	DGROUP:DGROUP:s@+290
	dw	DGROUP:DGROUP:s@+311
	dw	DGROUP:DGROUP:s@+329
	dw	DGROUP:DGROUP:s@+350
	dw	DGROUP:DGROUP:s@+365
	dw	DGROUP:DGROUP:s@+386
	dw	DGROUP:DGROUP:s@+407
	dw	DGROUP:DGROUP:s@+429
	dw	DGROUP:DGROUP:s@+449
	dw	DGROUP:DGROUP:s@+462
	dw	DGROUP:DGROUP:s@+478
	dw	DGROUP:DGROUP:s@+491
	dw	DGROUP:DGROUP:s@+506
_DATA	ends
_TEXT	segment	byte public 'CODE'
;	?debug	L 195
_c_toupper	proc	near
	push	bp
	mov	bp,sp
	cmp	byte ptr [bp+4],122
	jg	@11
	cmp	byte ptr [bp+4],97
	jl	@11
	mov	al,byte ptr [bp+4]
	add	al,-32
	jmp	short @10
@11:
	mov	al,byte ptr [bp+4]
@10:
	jmp	short @9
@9:
	pop	bp
	ret	
_c_toupper	endp
;	?debug	L 196
_c_isprint	proc	near
	push	bp
	mov	bp,sp
	cmp	byte ptr [bp+4],32
	jl	@14
	cmp	byte ptr [bp+4],126
	jg	@14
	mov	ax,1
	jmp	short @13
@14:
	xor	ax,ax
@13:
	jmp	short @12
@12:
	pop	bp
	ret	
_c_isprint	endp
;	?debug	L 197
_c_isspace	proc	near
	push	bp
	mov	bp,sp
	cmp	byte ptr [bp+4],32
	je	@18
	cmp	byte ptr [bp+4],13
	jg	@17
	cmp	byte ptr [bp+4],9
	jl	@17
@18:
	mov	ax,1
	jmp	short @16
@17:
	xor	ax,ax
@16:
	jmp	short @15
@15:
	pop	bp
	ret	
_c_isspace	endp
;	?debug	L 198
_c_isdigit	proc	near
	push	bp
	mov	bp,sp
	cmp	byte ptr [bp+4],57
	jg	@21
	cmp	byte ptr [bp+4],48
	jl	@21
	mov	ax,1
	jmp	short @20
@21:
	xor	ax,ax
@20:
	jmp	short @19
@19:
	pop	bp
	ret	
_c_isdigit	endp
;	?debug	L 199
_c_isalpha	proc	near
	push	bp
	mov	bp,sp
	cmp	byte ptr [bp+4],122
	jg	@26
	cmp	byte ptr [bp+4],97
	jge	@25
@26:
	cmp	byte ptr [bp+4],90
	jg	@24
	cmp	byte ptr [bp+4],65
	jl	@24
@25:
	mov	ax,1
	jmp	short @23
@24:
	xor	ax,ax
@23:
	jmp	short @22
@22:
	pop	bp
	ret	
_c_isalpha	endp
;	?debug	L 200
_c_puts	proc	near
	push	bp
	mov	bp,sp
	jmp	short @28
@30:
	mov	bx,word ptr [bp+4]
	inc	word ptr [bp+4]
	push	word ptr [bx]
	call	near ptr _c_putch
	pop	cx
@28:
	mov	bx,word ptr [bp+4]
	cmp	byte ptr [bx],0
	jne	@30
@29:
@27:
	pop	bp
	ret	
_c_puts	endp
;	?debug	L 201
_c_gets	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
;	?debug	L 205
	mov	byte ptr [bp-1],0
	jmp	short @32
@34:
;	?debug	L 207
	cmp	byte ptr [bp-2],9
	jne	@35
	mov	byte ptr [bp-2],32
@35:
;	?debug	L 208
	cmp	byte ptr [bp-2],8
	je	@37
	cmp	byte ptr [bp-2],127
	jne	@36
@37:
	cmp	byte ptr [bp-1],0
	jbe	@36
;	?debug	L 209
	dec	byte ptr [bp-1]
;	?debug	L 210
	mov	al,8
	push	ax
	call	near ptr _c_putch
	pop	cx
	mov	al,32
	push	ax
	call	near ptr _c_putch
	pop	cx
	mov	al,8
	push	ax
	call	near ptr _c_putch
	pop	cx
;	?debug	L 211
	jmp	short @38
@36:
;	?debug	L 212
	push	word ptr [bp-2]
	call	near ptr _c_isprint
	pop	cx
	or	al,al
	je	@39
	cmp	byte ptr [bp-1],159
	jae	@39
;	?debug	L 213
	mov	al,byte ptr [bp-2]
	mov	dl,byte ptr [bp-1]
	mov	dh,0
	mov	bx,dx
	mov	byte ptr DGROUP:_lbuf[bx],al
	inc	byte ptr [bp-1]
;	?debug	L 214
	push	word ptr [bp-2]
	call	near ptr _c_putch
	pop	cx
@39:
@38:
@32:
;	?debug	L 206
	call	near ptr _c_getch
	mov	byte ptr [bp-2],al
	cmp	al,13
	jne	@34
@33:
;	?debug	L 217
	call	near ptr _newline
;	?debug	L 218
	mov	al,byte ptr [bp-1]
	mov	ah,0
	mov	bx,ax
	mov	byte ptr DGROUP:_lbuf[bx],0
;	?debug	L 220
	cmp	byte ptr [bp-1],0
	jbe	@40
;	?debug	L 221
	jmp	short @41
@43:
@41:
	dec	byte ptr [bp-1]
	mov	al,byte ptr [bp-1]
	mov	ah,0
	mov	bx,ax
	push	word ptr DGROUP:_lbuf[bx]
	call	near ptr _c_isspace
	pop	cx
	or	al,al
	jne	@43
@42:
;	?debug	L 222
	inc	byte ptr [bp-1]
	mov	al,byte ptr [bp-1]
	mov	ah,0
	mov	bx,ax
	mov	byte ptr DGROUP:_lbuf[bx],0
@40:
@31:
;	?debug	L 224
	mov	sp,bp
	pop	bp
	ret	
_c_gets	endp
;	?debug	L 227
_putnum	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
;	?debug	L 231
	cmp	word ptr [bp+4],0
	jge	@45
;	?debug	L 232
	mov	byte ptr [bp-1],1
;	?debug	L 233
	mov	ax,word ptr [bp+4]
	neg	ax
	mov	word ptr [bp+4],ax
;	?debug	L 234
	jmp	short @46
@45:
;	?debug	L 235
	mov	byte ptr [bp-1],0
@46:
;	?debug	L 238
	mov	byte ptr DGROUP:_lbuf+6,0
;	?debug	L 239
	mov	byte ptr [bp-2],6
@49:
;	?debug	L 241
	dec	byte ptr [bp-2]
	mov	ax,word ptr [bp+4]
	mov	bx,10
	cwd	
	idiv	bx
	add	dl,48
	mov	al,byte ptr [bp-2]
	mov	ah,0
	mov	bx,ax
	mov	byte ptr DGROUP:_lbuf[bx],dl
;	?debug	L 242
	mov	ax,word ptr [bp+4]
	mov	bx,10
	cwd	
	idiv	bx
	mov	word ptr [bp+4],ax
@47:
;	?debug	L 243
	cmp	word ptr [bp+4],0
	jg	@49
@48:
;	?debug	L 245
	cmp	byte ptr [bp-1],0
	je	@50
;	?debug	L 246
	dec	byte ptr [bp-2]
	mov	al,byte ptr [bp-2]
	mov	ah,0
	mov	bx,ax
	mov	byte ptr DGROUP:_lbuf[bx],45
@50:
	jmp	short @51
@53:
;	?debug	L 250
	mov	al,32
	push	ax
	call	near ptr _c_putch
	pop	cx
;	?debug	L 251
	dec	word ptr [bp+6]
@51:
;	?debug	L 249
	mov	al,byte ptr [bp-2]
	mov	ah,0
	mov	dx,6
	sub	dx,ax
	cmp	dx,word ptr [bp+6]
	jl	@53
@52:
;	?debug	L 253
	mov	al,byte ptr [bp-2]
	mov	ah,0
	add	ax,offset DGROUP:_lbuf
	push	ax
	call	near ptr _c_puts
	pop	cx
@44:
;	?debug	L 254
	mov	sp,bp
	pop	bp
	ret	
_putnum	endp
;	?debug	L 258
_getnum	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
;	?debug	L 264
	mov	byte ptr [bp-2],0
	jmp	@55
@57:
;	?debug	L 266
	cmp	byte ptr [bp-3],8
	je	@59
	cmp	byte ptr [bp-3],127
	jne	@58
@59:
	cmp	byte ptr [bp-2],0
	jbe	@58
;	?debug	L 267
	dec	byte ptr [bp-2]
;	?debug	L 268
	mov	al,8
	push	ax
	call	near ptr _c_putch
	pop	cx
	mov	al,32
	push	ax
	call	near ptr _c_putch
	pop	cx
	mov	al,8
	push	ax
	call	near ptr _c_putch
	pop	cx
;	?debug	L 269
	jmp	short @60
@58:
;	?debug	L 270
;	?debug	L 271
	cmp	byte ptr [bp-2],0
	jne	@63
	cmp	byte ptr [bp-3],43
	je	@62
	cmp	byte ptr [bp-3],45
	je	@62
@63:
	cmp	byte ptr [bp-2],6
	jae	@61
	push	word ptr [bp-3]
	call	near ptr _c_isdigit
	pop	cx
	or	al,al
	je	@61
@62:
;	?debug	L 272
	mov	al,byte ptr [bp-3]
	mov	dl,byte ptr [bp-2]
	mov	dh,0
	mov	bx,dx
	mov	byte ptr DGROUP:_lbuf[bx],al
	inc	byte ptr [bp-2]
;	?debug	L 273
	push	word ptr [bp-3]
	call	near ptr _c_putch
	pop	cx
@61:
@60:
@55:
;	?debug	L 265
	call	near ptr _c_getch
	mov	byte ptr [bp-3],al
	cmp	al,13
	je	@73
	jmp	@57
@73:
@56:
;	?debug	L 276
	call	near ptr _newline
;	?debug	L 277
	mov	al,byte ptr [bp-2]
	mov	ah,0
	mov	bx,ax
	mov	byte ptr DGROUP:_lbuf[bx],0
;	?debug	L 279
	mov	al,byte ptr DGROUP:_lbuf
	cbw	
	cmp	ax,43
	je	@66
	cmp	ax,45
	je	@65
	jmp	short @67
@65:
;	?debug	L 281
	mov	byte ptr [bp-1],1
;	?debug	L 282
	mov	byte ptr [bp-2],1
;	?debug	L 283
	jmp	short @64
@66:
;	?debug	L 285
	mov	byte ptr [bp-1],0
;	?debug	L 286
	mov	byte ptr [bp-2],1
;	?debug	L 287
	jmp	short @64
@67:
;	?debug	L 289
	mov	byte ptr [bp-1],0
;	?debug	L 290
	mov	byte ptr [bp-2],0
;	?debug	L 291
	jmp	short @64
@64:
;	?debug	L 294
	mov	word ptr [bp-8],0
;	?debug	L 295
	mov	word ptr [bp-6],0
	jmp	short @68
@70:
;	?debug	L 297
	mov	ax,word ptr [bp-8]
	mov	dx,10
	mul	dx
	mov	dl,byte ptr [bp-2]
	mov	dh,0
	mov	bx,dx
	push	ax
	mov	al,byte ptr DGROUP:_lbuf[bx]
	cbw	
	pop	dx
	add	dx,ax
	add	dx,-48
	mov	word ptr [bp-6],dx
	inc	byte ptr [bp-2]
;	?debug	L 298
	mov	ax,word ptr [bp-8]
	cmp	ax,word ptr [bp-6]
	jle	@71
;	?debug	L 299
	mov	byte ptr DGROUP:_err,2
@71:
;	?debug	L 301
	mov	ax,word ptr [bp-6]
	mov	word ptr [bp-8],ax
@68:
;	?debug	L 296
	mov	al,byte ptr [bp-2]
	mov	ah,0
	mov	bx,ax
	cmp	byte ptr DGROUP:_lbuf[bx],0
	jne	@70
@69:
;	?debug	L 303
	cmp	byte ptr [bp-1],0
	je	@72
;	?debug	L 304
	mov	ax,word ptr [bp-8]
	neg	ax
	jmp	short @54
@72:
;	?debug	L 305
	mov	ax,word ptr [bp-8]
	jmp	short @54
@54:
;	?debug	L 306
	mov	sp,bp
	pop	bp
	ret	
_getnum	endp
;	?debug	L 310
_toktoi	proc	near
	push	bp
	mov	bp,sp
	sub	sp,10
	push	si
	push	di
;	?debug	L 312
	mov	byte ptr [bp-9],0
;	?debug	L 313
	mov	word ptr [bp-8],0
;	?debug	L 315
	mov	si,offset DGROUP:_lbuf
	jmp	@75
@77:
;	?debug	L 321
	jmp	short @78
@80:
	inc	si
@78:
	push	word ptr [si]
	call	near ptr _c_isspace
	pop	cx
	or	al,al
	jne	@80
@79:
;	?debug	L 324
	mov	byte ptr [bp-10],0
	jmp	short @84
@83:
;	?debug	L 325
	mov	al,byte ptr [bp-10]
	mov	ah,0
	mov	bx,ax
	shl	bx,1
	mov	ax,word ptr DGROUP:_kwtbl[bx]
	mov	word ptr [bp-8],ax
;	?debug	L 326
	mov	di,si
	jmp	short @85
@87:
;	?debug	L 330
	inc	word ptr [bp-8]
;	?debug	L 331
	inc	di
@85:
;	?debug	L 329
	mov	bx,word ptr [bp-8]
	cmp	byte ptr [bx],0
	je	@88
	push	word ptr [di]
	call	near ptr _c_toupper
	pop	cx
	mov	bx,word ptr [bp-8]
	cmp	al,byte ptr [bx]
	je	@87
@88:
@86:
;	?debug	L 334
	mov	bx,word ptr [bp-8]
	cmp	byte ptr [bx],0
	jne	@89
;	?debug	L 336
	cmp	byte ptr [bp-9],159
	jb	@90
;	?debug	L 337
	mov	byte ptr DGROUP:_err,4
;	?debug	L 338
	mov	al,0
	jmp	@74
@90:
;	?debug	L 342
	mov	al,byte ptr [bp-10]
	mov	dl,byte ptr [bp-9]
	mov	dh,0
	mov	bx,dx
	mov	byte ptr DGROUP:_ibuf[bx],al
	inc	byte ptr [bp-9]
;	?debug	L 343
	mov	si,di
;	?debug	L 344
	jmp	short @81
@89:
@82:
	inc	byte ptr [bp-10]
@84:
	cmp	byte ptr [bp-10],35
	jb	@83
@81:
;	?debug	L 349
	cmp	byte ptr [bp-10],8
	je	@128
	jmp	@91
@128:
;	?debug	L 350
	jmp	short @92
@94:
	inc	si
@92:
	push	word ptr [si]
	call	near ptr _c_isspace
	pop	cx
	or	al,al
	jne	@94
@93:
;	?debug	L 351
	mov	di,si
;	?debug	L 352
	mov	byte ptr [bp-10],0
	jmp	short @98
@97:
@96:
	inc	byte ptr [bp-10]
@98:
	mov	bx,di
	inc	di
	cmp	byte ptr [bx],0
	jne	@97
@95:
;	?debug	L 353
	mov	al,byte ptr [bp-9]
	mov	ah,0
	mov	dl,byte ptr [bp-10]
	mov	dh,0
	mov	bx,158
	sub	bx,dx
	cmp	ax,bx
	jl	@99
;	?debug	L 354
	mov	byte ptr DGROUP:_err,4
;	?debug	L 355
	mov	al,0
	jmp	@74
@99:
;	?debug	L 357
	mov	al,byte ptr [bp-10]
	mov	dl,byte ptr [bp-9]
	mov	dh,0
	mov	bx,dx
	mov	byte ptr DGROUP:_ibuf[bx],al
	inc	byte ptr [bp-9]
	jmp	short @100
@102:
;	?debug	L 359
	mov	al,byte ptr [si]
	mov	dl,byte ptr [bp-9]
	mov	dh,0
	mov	bx,dx
	mov	byte ptr DGROUP:_ibuf[bx],al
	inc	si
	inc	byte ptr [bp-9]
@100:
;	?debug	L 358
	mov	al,byte ptr [bp-10]
	dec	byte ptr [bp-10]
	or	al,al
	jne	@102
@101:
;	?debug	L 361
	jmp	@76
@91:
;	?debug	L 364
	mov	bx,word ptr [bp-8]
	cmp	byte ptr [bx],0
	jne	@103
;	?debug	L 365
	jmp	@75
@103:
;	?debug	L 367
	mov	di,si
;	?debug	L 370
	push	word ptr [di]
	call	near ptr _c_isdigit
	pop	cx
	or	al,al
	jne	@129
	jmp	@104
@129:
;	?debug	L 371
	mov	word ptr [bp-4],0
;	?debug	L 372
	mov	word ptr [bp-2],0
@107:
;	?debug	L 374
	mov	ax,word ptr [bp-4]
	mov	dx,10
	mul	dx
	push	ax
	mov	al,byte ptr [di]
	cbw	
	pop	dx
	add	dx,ax
	add	dx,-48
	mov	word ptr [bp-2],dx
	inc	di
;	?debug	L 375
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-2]
	jle	@108
;	?debug	L 376
	mov	byte ptr DGROUP:_err,2
;	?debug	L 377
	mov	al,0
	jmp	@74
@108:
;	?debug	L 379
	mov	ax,word ptr [bp-2]
	mov	word ptr [bp-4],ax
@105:
;	?debug	L 380
	push	word ptr [di]
	call	near ptr _c_isdigit
	pop	cx
	or	al,al
	jne	@107
@106:
;	?debug	L 382
	cmp	byte ptr [bp-9],157
	jb	@109
;	?debug	L 383
	mov	byte ptr DGROUP:_err,4
;	?debug	L 384
	mov	al,0
	jmp	@74
@109:
;	?debug	L 386
	mov	al,byte ptr [bp-9]
	mov	ah,0
	mov	bx,ax
	mov	byte ptr DGROUP:_ibuf[bx],35
	inc	byte ptr [bp-9]
;	?debug	L 387
	mov	al,byte ptr [bp-4]
	and	al,255
	mov	dl,byte ptr [bp-9]
	mov	dh,0
	mov	bx,dx
	mov	byte ptr DGROUP:_ibuf[bx],al
	inc	byte ptr [bp-9]
;	?debug	L 388
	mov	ax,word ptr [bp-4]
	mov	cl,8
	sar	ax,cl
	mov	dl,byte ptr [bp-9]
	mov	dh,0
	mov	bx,dx
	mov	byte ptr DGROUP:_ibuf[bx],al
	inc	byte ptr [bp-9]
;	?debug	L 389
	mov	si,di
;	?debug	L 390
	jmp	@110
@104:
;	?debug	L 394
	cmp	byte ptr [si],34
	je	@112
	cmp	byte ptr [si],39
	je	@130
	jmp	@111
@130:
@112:
;	?debug	L 395
	mov	al,byte ptr [si]
	mov	byte ptr [bp-5],al
	inc	si
;	?debug	L 396
	mov	di,si
;	?debug	L 397
	mov	byte ptr [bp-10],0
	jmp	short @116
@115:
;	?debug	L 398
	inc	di
@114:
	inc	byte ptr [bp-10]
@116:
	mov	al,byte ptr [di]
	cmp	al,byte ptr [bp-5]
	je	@117
	push	word ptr [di]
	call	near ptr _c_isprint
	pop	cx
	or	al,al
	jne	@115
@117:
@113:
;	?debug	L 399
	mov	al,byte ptr [bp-9]
	mov	ah,0
	mov	dl,byte ptr [bp-10]
	mov	dh,0
	mov	bx,159
	sub	bx,dx
	cmp	ax,bx
	jl	@118
;	?debug	L 400
	mov	byte ptr DGROUP:_err,4
;	?debug	L 401
	mov	al,0
	jmp	@74
@118:
;	?debug	L 403
	mov	al,byte ptr [bp-9]
	mov	ah,0
	mov	bx,ax
	mov	byte ptr DGROUP:_ibuf[bx],37
	inc	byte ptr [bp-9]
;	?debug	L 404
	mov	al,byte ptr [bp-10]
	mov	dl,byte ptr [bp-9]
	mov	dh,0
	mov	bx,dx
	mov	byte ptr DGROUP:_ibuf[bx],al
	inc	byte ptr [bp-9]
	jmp	short @119
@121:
;	?debug	L 406
	mov	al,byte ptr [si]
	mov	dl,byte ptr [bp-9]
	mov	dh,0
	mov	bx,dx
	mov	byte ptr DGROUP:_ibuf[bx],al
	inc	si
	inc	byte ptr [bp-9]
@119:
;	?debug	L 405
	mov	al,byte ptr [bp-10]
	dec	byte ptr [bp-10]
	or	al,al
	jne	@121
@120:
;	?debug	L 408
	mov	al,byte ptr [si]
	cmp	al,byte ptr [bp-5]
	jne	@122
	inc	si
@122:
;	?debug	L 409
	jmp	@123
@111:
;	?debug	L 413
	push	word ptr [di]
	call	near ptr _c_isalpha
	pop	cx
	or	al,al
	je	@124
;	?debug	L 414
	cmp	byte ptr [bp-9],158
	jb	@125
;	?debug	L 415
	mov	byte ptr DGROUP:_err,4
;	?debug	L 416
	mov	al,0
	jmp	@74
@125:
;	?debug	L 418
	cmp	byte ptr [bp-9],4
	jb	@126
	mov	al,byte ptr [bp-9]
	mov	ah,0
	mov	bx,ax
	cmp	byte ptr DGROUP:_ibuf[bx-2],36
	jne	@126
	mov	al,byte ptr [bp-9]
	mov	ah,0
	mov	bx,ax
	cmp	byte ptr DGROUP:_ibuf[bx-4],36
	jne	@126
;	?debug	L 419
	mov	byte ptr DGROUP:_err,20
;	?debug	L 420
	mov	al,0
	jmp	short @74
@126:
;	?debug	L 422
	mov	al,byte ptr [bp-9]
	mov	ah,0
	mov	bx,ax
	mov	byte ptr DGROUP:_ibuf[bx],36
	inc	byte ptr [bp-9]
;	?debug	L 423
	push	word ptr [di]
	call	near ptr _c_toupper
	pop	cx
	add	al,191
	mov	dl,byte ptr [bp-9]
	mov	dh,0
	mov	bx,dx
	mov	byte ptr DGROUP:_ibuf[bx],al
	inc	byte ptr [bp-9]
;	?debug	L 424
	inc	si
;	?debug	L 425
	jmp	short @127
@124:
;	?debug	L 430
	mov	byte ptr DGROUP:_err,20
;	?debug	L 431
	mov	al,0
	jmp	short @74
@127:
@123:
@110:
@75:
;	?debug	L 320
	cmp	byte ptr [si],0
	je	@131
	jmp	@77
@131:
@76:
;	?debug	L 434
	mov	al,byte ptr [bp-9]
	mov	ah,0
	mov	bx,ax
	mov	byte ptr DGROUP:_ibuf[bx],38
	inc	byte ptr [bp-9]
;	?debug	L 435
	mov	al,byte ptr [bp-9]
	jmp	short @74
@74:
;	?debug	L 436
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_toktoi	endp
;	?debug	L 439
_getlineno	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
;	?debug	L 440
	cmp	byte ptr [si],0
	jne	@133
;	?debug	L 441
	mov	ax,32767
	jmp	short @132
@133:
;	?debug	L 442
	mov	al,byte ptr [si+2]
	mov	ah,0
	mov	cl,8
	shl	ax,cl
	mov	dl,byte ptr [si+1]
	mov	dh,0
	or	ax,dx
	jmp	short @132
@132:
;	?debug	L 443
	pop	si
	pop	bp
	ret	
_getlineno	endp
;	?debug	L 446
_getlp	proc	near
	push	bp
	mov	bp,sp
	push	si
;	?debug	L 449
	mov	si,offset DGROUP:_listbuf
	jmp	short @138
@137:
;	?debug	L 450
	push	si
	call	near ptr _getlineno
	pop	cx
	cmp	ax,word ptr [bp+4]
	jl	@139
;	?debug	L 451
	jmp	short @135
@139:
@136:
	mov	al,byte ptr [si]
	mov	ah,0
	add	si,ax
@138:
	cmp	byte ptr [si],0
	jne	@137
@135:
;	?debug	L 452
	mov	ax,si
	jmp	short @134
@134:
;	?debug	L 453
	pop	si
	pop	bp
	ret	
_getlp	endp
;	?debug	L 456
_getsize	proc	near
	push	si
;	?debug	L 459
	mov	si,offset DGROUP:_listbuf
	jmp	short @144
@143:
@142:
	mov	al,byte ptr [si]
	mov	ah,0
	add	si,ax
@144:
	cmp	byte ptr [si],0
	jne	@143
@141:
;	?debug	L 460
	mov	ax,offset DGROUP:_listbuf+30592
	sub	ax,si
	dec	ax
	jmp	short @140
@140:
;	?debug	L 461
	pop	si
	ret	
_getsize	endp
;	?debug	L 465
_inslist	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
;	?debug	L 470
	call	near ptr _getsize
	mov	dl,byte ptr DGROUP:_ibuf
	mov	dh,0
	cmp	ax,dx
	jge	@146
;	?debug	L 471
	mov	byte ptr DGROUP:_err,5
	jmp	@145
@146:
;	?debug	L 475
	mov	ax,offset DGROUP:_ibuf
	push	ax
	call	near ptr _getlineno
	pop	cx
	push	ax
	call	near ptr _getlp
	pop	cx
	mov	word ptr [bp-4],ax
;	?debug	L 477
	push	word ptr [bp-4]
	call	near ptr _getlineno
	pop	cx
	push	ax
	mov	ax,offset DGROUP:_ibuf
	push	ax
	call	near ptr _getlineno
	pop	cx
	pop	dx
	cmp	dx,ax
	jne	@147
;	?debug	L 478
	mov	si,word ptr [bp-4]
;	?debug	L 479
	mov	al,byte ptr [si]
	mov	ah,0
	mov	di,ax
	add	di,si
	jmp	short @148
@150:
	jmp	short @151
@153:
;	?debug	L 482
	mov	al,byte ptr [di]
	mov	byte ptr [si],al
	inc	di
	inc	si
@151:
;	?debug	L 481
	mov	ax,word ptr [bp-2]
	dec	word ptr [bp-2]
	or	ax,ax
	jne	@153
@152:
@148:
;	?debug	L 480
	mov	al,byte ptr [di]
	mov	ah,0
	mov	word ptr [bp-2],ax
	or	ax,ax
	jne	@150
@149:
;	?debug	L 485
	mov	byte ptr [si],0
@147:
;	?debug	L 489
	cmp	byte ptr DGROUP:_ibuf,4
	jne	@154
	jmp	short @145
@154:
;	?debug	L 493
	mov	si,word ptr [bp-4]
	jmp	short @158
@157:
@156:
	mov	al,byte ptr [si]
	mov	ah,0
	add	si,ax
@158:
	cmp	byte ptr [si],0
	jne	@157
@155:
;	?debug	L 494
	mov	ax,si
	sub	ax,word ptr [bp-4]
	inc	ax
	mov	word ptr [bp-2],ax
;	?debug	L 495
	mov	al,byte ptr DGROUP:_ibuf
	mov	ah,0
	mov	di,ax
	add	di,si
	jmp	short @159
@161:
;	?debug	L 497
	mov	al,byte ptr [si]
	mov	byte ptr [di],al
	dec	si
	dec	di
@159:
;	?debug	L 496
	mov	ax,word ptr [bp-2]
	dec	word ptr [bp-2]
	or	ax,ax
	jne	@161
@160:
;	?debug	L 500
	mov	al,byte ptr DGROUP:_ibuf
	mov	ah,0
	mov	word ptr [bp-2],ax
;	?debug	L 501
	mov	si,word ptr [bp-4]
;	?debug	L 502
	mov	di,offset DGROUP:_ibuf
	jmp	short @162
@164:
;	?debug	L 504
	mov	al,byte ptr [di]
	mov	byte ptr [si],al
	inc	di
	inc	si
@162:
;	?debug	L 503
	mov	ax,word ptr [bp-2]
	dec	word ptr [bp-2]
	or	ax,ax
	jne	@164
@163:
@145:
;	?debug	L 505
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_inslist	endp
;	?debug	L 508
_putlist	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
	push	si
	mov	si,word ptr [bp+4]
	jmp	@166
@168:
;	?debug	L 513
	cmp	byte ptr [si],35
	jae	@169
;	?debug	L 514
	mov	al,byte ptr [si]
	mov	ah,0
	mov	bx,ax
	shl	bx,1
	push	word ptr DGROUP:_kwtbl[bx]
	call	near ptr _c_puts
	pop	cx
;	?debug	L 515
	mov	al,19
	push	ax
	mov	ax,offset DGROUP:_i_nsa
	push	ax
	push	word ptr [si]
	call	near ptr _sstyle
	add	sp,6
	or	al,al
	jne	@170
;	?debug	L 516
	mov	al,32
	push	ax
	call	near ptr _c_putch
	pop	cx
@170:
;	?debug	L 517
	cmp	byte ptr [si],8
	jne	@171
;	?debug	L 518
	inc	si
;	?debug	L 519
	mov	al,byte ptr [si]
	mov	byte ptr [bp-1],al
	inc	si
	jmp	short @172
@174:
;	?debug	L 521
	mov	bx,si
	inc	si
	push	word ptr [bx]
	call	near ptr _c_putch
	pop	cx
@172:
;	?debug	L 520
	mov	al,byte ptr [bp-1]
	dec	byte ptr [bp-1]
	or	al,al
	jne	@174
@173:
	jmp	@165
@171:
;	?debug	L 525
	inc	si
;	?debug	L 526
	jmp	@175
@169:
;	?debug	L 530
	cmp	byte ptr [si],35
	jne	@176
;	?debug	L 531
	inc	si
;	?debug	L 532
	xor	ax,ax
	push	ax
	mov	al,byte ptr [si+1]
	mov	ah,0
	mov	cl,8
	shl	ax,cl
	mov	dl,byte ptr [si]
	mov	dh,0
	or	ax,dx
	push	ax
	call	near ptr _putnum
	pop	cx
	pop	cx
;	?debug	L 533
	inc	si
	inc	si
;	?debug	L 534
	mov	al,15
	push	ax
	mov	ax,offset DGROUP:_i_nsb
	push	ax
	push	word ptr [si]
	call	near ptr _sstyle
	add	sp,6
	or	al,al
	jne	@177
	mov	al,32
	push	ax
	call	near ptr _c_putch
	pop	cx
@177:
;	?debug	L 535
	jmp	@178
@176:
;	?debug	L 539
	cmp	byte ptr [si],36
	jne	@179
;	?debug	L 540
	inc	si
;	?debug	L 541
	mov	bx,si
	inc	si
	mov	al,byte ptr [bx]
	add	al,65
	push	ax
	call	near ptr _c_putch
	pop	cx
;	?debug	L 542
	mov	al,15
	push	ax
	mov	ax,offset DGROUP:_i_nsb
	push	ax
	push	word ptr [si]
	call	near ptr _sstyle
	add	sp,6
	or	al,al
	jne	@180
	mov	al,32
	push	ax
	call	near ptr _c_putch
	pop	cx
@180:
;	?debug	L 543
	jmp	@181
@179:
;	?debug	L 547
	cmp	byte ptr [si],37
	jne	@182
;	?debug	L 550
	mov	byte ptr [bp-2],34
;	?debug	L 551
	inc	si
;	?debug	L 552
	mov	al,byte ptr [si]
	mov	byte ptr [bp-1],al
	jmp	short @186
@185:
;	?debug	L 553
	mov	al,byte ptr [bp-1]
	mov	ah,0
	mov	bx,ax
	cmp	byte ptr [bx+si],34
	jne	@187
;	?debug	L 554
	mov	byte ptr [bp-2],39
;	?debug	L 555
	jmp	short @183
@187:
@184:
	dec	byte ptr [bp-1]
@186:
	cmp	byte ptr [bp-1],0
	jne	@185
@183:
;	?debug	L 558
	push	word ptr [bp-2]
	call	near ptr _c_putch
	pop	cx
;	?debug	L 559
	mov	al,byte ptr [si]
	mov	byte ptr [bp-1],al
	inc	si
	jmp	short @188
@190:
;	?debug	L 561
	mov	bx,si
	inc	si
	push	word ptr [bx]
	call	near ptr _c_putch
	pop	cx
@188:
;	?debug	L 560
	mov	al,byte ptr [bp-1]
	dec	byte ptr [bp-1]
	or	al,al
	jne	@190
@189:
;	?debug	L 563
	push	word ptr [bp-2]
	call	near ptr _c_putch
	pop	cx
;	?debug	L 564
	cmp	byte ptr [si],36
	jne	@191
;	?debug	L 565
	mov	al,32
	push	ax
	call	near ptr _c_putch
	pop	cx
@191:
;	?debug	L 566
	jmp	short @192
@182:
;	?debug	L 570
	mov	byte ptr DGROUP:_err,21
	jmp	short @165
@192:
@181:
@178:
@175:
@166:
;	?debug	L 511
	cmp	byte ptr [si],38
	je	@193
	jmp	@168
@193:
@167:
@165:
;	?debug	L 574
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_putlist	endp
;	?debug	L 577
_getparam	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
;	?debug	L 580
	mov	bx,word ptr DGROUP:_cip
	cmp	byte ptr [bx],19
	je	@195
;	?debug	L 581
	mov	byte ptr DGROUP:_err,17
;	?debug	L 582
	xor	ax,ax
	jmp	short @194
@195:
;	?debug	L 584
	inc	word ptr DGROUP:_cip
;	?debug	L 585
	call	near ptr _iexp
	mov	word ptr [bp-2],ax
;	?debug	L 586
	cmp	byte ptr DGROUP:_err,0
	je	@196
	xor	ax,ax
	jmp	short @194
@196:
;	?debug	L 588
	mov	bx,word ptr DGROUP:_cip
	cmp	byte ptr [bx],20
	je	@197
;	?debug	L 589
	mov	byte ptr DGROUP:_err,17
;	?debug	L 590
	xor	ax,ax
	jmp	short @194
@197:
;	?debug	L 592
	inc	word ptr DGROUP:_cip
;	?debug	L 594
	mov	ax,word ptr [bp-2]
	jmp	short @194
@194:
;	?debug	L 595
	mov	sp,bp
	pop	bp
	ret	
_getparam	endp
;	?debug	L 598
_ivalue	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
;	?debug	L 601
	mov	bx,word ptr DGROUP:_cip
	mov	al,byte ptr [bx]
	mov	ah,0
	sub	ax,15
	cmp	ax,21
	jbe	@218
	jmp	@216
@218:
	mov	bx,ax
	shl	bx,1
	jmp	word ptr cs:@217[bx]
@217	label	word
	dw	@202
	dw	@201
	dw	@216
	dw	@216
	dw	@204
	dw	@216
	dw	@216
	dw	@216
	dw	@216
	dw	@216
	dw	@216
	dw	@216
	dw	@205
	dw	@208
	dw	@210
	dw	@213
	dw	@216
	dw	@216
	dw	@216
	dw	@216
	dw	@200
	dw	@203
@200:
;	?debug	L 603
	inc	word ptr DGROUP:_cip
;	?debug	L 604
	mov	bx,word ptr DGROUP:_cip
	mov	al,byte ptr [bx+1]
	mov	ah,0
	mov	cl,8
	shl	ax,cl
	mov	bx,word ptr DGROUP:_cip
	mov	dl,byte ptr [bx]
	mov	dh,0
	or	ax,dx
	mov	word ptr [bp-2],ax
;	?debug	L 605
	add	word ptr DGROUP:_cip,2
;	?debug	L 606
	jmp	@199
@201:
;	?debug	L 608
	inc	word ptr DGROUP:_cip
;	?debug	L 609
	call	near ptr _ivalue
	mov	word ptr [bp-2],ax
;	?debug	L 610
	jmp	@199
@202:
;	?debug	L 612
	inc	word ptr DGROUP:_cip
;	?debug	L 613
	call	near ptr _ivalue
	xor	dx,dx
	sub	dx,ax
	mov	word ptr [bp-2],dx
;	?debug	L 614
	jmp	@199
@203:
;	?debug	L 616
	inc	word ptr DGROUP:_cip
;	?debug	L 617
	mov	bx,word ptr DGROUP:_cip
	mov	al,byte ptr [bx]
	mov	ah,0
	mov	bx,ax
	shl	bx,1
	mov	ax,word ptr DGROUP:_var[bx]
	mov	word ptr [bp-2],ax
	inc	word ptr DGROUP:_cip
;	?debug	L 618
	jmp	@199
@204:
;	?debug	L 620
	call	near ptr _getparam
	mov	word ptr [bp-2],ax
;	?debug	L 621
	jmp	@199
@205:
;	?debug	L 623
	inc	word ptr DGROUP:_cip
;	?debug	L 624
	call	near ptr _getparam
	mov	word ptr [bp-2],ax
;	?debug	L 625
	cmp	byte ptr DGROUP:_err,0
	je	@206
;	?debug	L 626
	jmp	@199
@206:
;	?debug	L 627
	cmp	word ptr [bp-2],64
	jl	@207
;	?debug	L 628
	mov	byte ptr DGROUP:_err,3
;	?debug	L 629
	jmp	@199
@207:
;	?debug	L 631
	mov	bx,word ptr [bp-2]
	shl	bx,1
	mov	ax,word ptr DGROUP:_arr[bx]
	mov	word ptr [bp-2],ax
;	?debug	L 632
	jmp	@199
@208:
;	?debug	L 634
	inc	word ptr DGROUP:_cip
;	?debug	L 635
	call	near ptr _getparam
	mov	word ptr [bp-2],ax
;	?debug	L 636
	cmp	byte ptr DGROUP:_err,0
	je	@209
;	?debug	L 637
	jmp	short @199
@209:
;	?debug	L 638
	push	word ptr [bp-2]
	call	near ptr _getrnd
	pop	cx
	mov	word ptr [bp-2],ax
;	?debug	L 639
	jmp	short @199
@210:
;	?debug	L 641
	inc	word ptr DGROUP:_cip
;	?debug	L 642
	call	near ptr _getparam
	mov	word ptr [bp-2],ax
;	?debug	L 643
	cmp	byte ptr DGROUP:_err,0
	je	@211
;	?debug	L 644
	jmp	short @199
@211:
;	?debug	L 645
	cmp	word ptr [bp-2],0
	jge	@212
;	?debug	L 646
	mov	ax,word ptr [bp-2]
	mov	dx,-1
	mul	dx
	mov	word ptr [bp-2],ax
@212:
;	?debug	L 647
	jmp	short @199
@213:
;	?debug	L 649
	inc	word ptr DGROUP:_cip
;	?debug	L 650
	mov	bx,word ptr DGROUP:_cip
	cmp	byte ptr [bx],19
	jne	@215
	mov	bx,word ptr DGROUP:_cip
	cmp	byte ptr [bx+1],20
	je	@214
@215:
;	?debug	L 651
	mov	byte ptr DGROUP:_err,17
;	?debug	L 652
	jmp	short @199
@214:
;	?debug	L 654
	add	word ptr DGROUP:_cip,2
;	?debug	L 655
	call	near ptr _getsize
	mov	word ptr [bp-2],ax
;	?debug	L 656
	jmp	short @199
@216:
;	?debug	L 659
	mov	byte ptr DGROUP:_err,20
;	?debug	L 660
	jmp	short @199
@199:
;	?debug	L 662
	mov	ax,word ptr [bp-2]
	jmp	short @198
@198:
;	?debug	L 663
	mov	sp,bp
	pop	bp
	ret	
_ivalue	endp
;	?debug	L 666
_imul	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
;	?debug	L 669
	call	near ptr _ivalue
	mov	word ptr [bp-4],ax
;	?debug	L 670
	cmp	byte ptr DGROUP:_err,0
	je	@220
;	?debug	L 671
	mov	ax,-1
	jmp	short @219
@220:
	jmp	short @221
@223:
;	?debug	L 674
	mov	bx,word ptr DGROUP:_cip
	mov	al,byte ptr [bx]
	mov	ah,0
	cmp	ax,17
	je	@225
	cmp	ax,18
	je	@226
	jmp	short @228
@225:
;	?debug	L 676
	inc	word ptr DGROUP:_cip
;	?debug	L 677
	call	near ptr _ivalue
	mov	word ptr [bp-2],ax
;	?debug	L 678
	mov	ax,word ptr [bp-4]
	mul	word ptr [bp-2]
	mov	word ptr [bp-4],ax
;	?debug	L 679
	jmp	short @224
@226:
;	?debug	L 681
	inc	word ptr DGROUP:_cip
;	?debug	L 682
	call	near ptr _ivalue
	mov	word ptr [bp-2],ax
;	?debug	L 683
	cmp	word ptr [bp-2],0
	jne	@227
;	?debug	L 684
	mov	byte ptr DGROUP:_err,1
;	?debug	L 685
	mov	ax,-1
	jmp	short @219
@227:
;	?debug	L 687
	mov	ax,word ptr [bp-4]
	cwd	
	idiv	word ptr [bp-2]
	mov	word ptr [bp-4],ax
;	?debug	L 688
	jmp	short @224
@228:
;	?debug	L 690
	mov	ax,word ptr [bp-4]
	jmp	short @219
@224:
@221:
;	?debug	L 673
	jmp	short @223
@222:
@219:
;	?debug	L 692
	mov	sp,bp
	pop	bp
	ret	
_imul	endp
;	?debug	L 695
_iplus	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
;	?debug	L 698
	call	near ptr _imul
	mov	word ptr [bp-4],ax
;	?debug	L 699
	cmp	byte ptr DGROUP:_err,0
	je	@230
;	?debug	L 700
	mov	ax,-1
	jmp	short @229
@230:
	jmp	short @231
@233:
;	?debug	L 703
	mov	bx,word ptr DGROUP:_cip
	mov	al,byte ptr [bx]
	mov	ah,0
	cmp	ax,15
	je	@236
	cmp	ax,16
	je	@235
	jmp	short @237
@235:
;	?debug	L 705
	inc	word ptr DGROUP:_cip
;	?debug	L 706
	call	near ptr _imul
	mov	word ptr [bp-2],ax
;	?debug	L 707
	mov	ax,word ptr [bp-2]
	add	word ptr [bp-4],ax
;	?debug	L 708
	jmp	short @234
@236:
;	?debug	L 710
	inc	word ptr DGROUP:_cip
;	?debug	L 711
	call	near ptr _imul
	mov	word ptr [bp-2],ax
;	?debug	L 712
	mov	ax,word ptr [bp-2]
	sub	word ptr [bp-4],ax
;	?debug	L 713
	jmp	short @234
@237:
;	?debug	L 715
	mov	ax,word ptr [bp-4]
	jmp	short @229
@234:
@231:
;	?debug	L 702
	jmp	short @233
@232:
@229:
;	?debug	L 717
	mov	sp,bp
	pop	bp
	ret	
_iplus	endp
;	?debug	L 720
_iexp	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
;	?debug	L 723
	call	near ptr _iplus
	mov	word ptr [bp-4],ax
;	?debug	L 724
	cmp	byte ptr DGROUP:_err,0
	je	@239
;	?debug	L 725
	mov	ax,-1
	jmp	@238
@239:
	jmp	@240
@242:
;	?debug	L 729
	mov	bx,word ptr DGROUP:_cip
	mov	al,byte ptr [bx]
	mov	ah,0
	sub	ax,21
	cmp	ax,5
	jbe	@264
	jmp	@250
@264:
	mov	bx,ax
	shl	bx,1
	jmp	word ptr cs:@251[bx]
@251	label	word
	dw	@249
	dw	@245
	dw	@248
	dw	@244
	dw	@247
	dw	@246
@244:
;	?debug	L 731
	inc	word ptr DGROUP:_cip
;	?debug	L 732
	call	near ptr _iplus
	mov	word ptr [bp-2],ax
;	?debug	L 733
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-2]
	jne	@253
	mov	ax,1
	jmp	short @252
@253:
	xor	ax,ax
@252:
	mov	word ptr [bp-4],ax
;	?debug	L 734
	jmp	@243
@245:
;	?debug	L 736
	inc	word ptr DGROUP:_cip
;	?debug	L 737
	call	near ptr _iplus
	mov	word ptr [bp-2],ax
;	?debug	L 738
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-2]
	je	@255
	mov	ax,1
	jmp	short @254
@255:
	xor	ax,ax
@254:
	mov	word ptr [bp-4],ax
;	?debug	L 739
	jmp	@243
@246:
;	?debug	L 741
	inc	word ptr DGROUP:_cip
;	?debug	L 742
	call	near ptr _iplus
	mov	word ptr [bp-2],ax
;	?debug	L 743
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-2]
	jge	@257
	mov	ax,1
	jmp	short @256
@257:
	xor	ax,ax
@256:
	mov	word ptr [bp-4],ax
;	?debug	L 744
	jmp	short @243
@247:
;	?debug	L 746
	inc	word ptr DGROUP:_cip
;	?debug	L 747
	call	near ptr _iplus
	mov	word ptr [bp-2],ax
;	?debug	L 748
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-2]
	jg	@259
	mov	ax,1
	jmp	short @258
@259:
	xor	ax,ax
@258:
	mov	word ptr [bp-4],ax
;	?debug	L 749
	jmp	short @243
@248:
;	?debug	L 751
	inc	word ptr DGROUP:_cip
;	?debug	L 752
	call	near ptr _iplus
	mov	word ptr [bp-2],ax
;	?debug	L 753
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-2]
	jle	@261
	mov	ax,1
	jmp	short @260
@261:
	xor	ax,ax
@260:
	mov	word ptr [bp-4],ax
;	?debug	L 754
	jmp	short @243
@249:
;	?debug	L 756
	inc	word ptr DGROUP:_cip
;	?debug	L 757
	call	near ptr _iplus
	mov	word ptr [bp-2],ax
;	?debug	L 758
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-2]
	jl	@263
	mov	ax,1
	jmp	short @262
@263:
	xor	ax,ax
@262:
	mov	word ptr [bp-4],ax
;	?debug	L 759
	jmp	short @243
@250:
;	?debug	L 761
	mov	ax,word ptr [bp-4]
	jmp	short @238
@243:
@240:
;	?debug	L 728
	jmp	@242
@241:
@238:
;	?debug	L 763
	mov	sp,bp
	pop	bp
	ret	
_iexp	endp
;	?debug	L 766
_iprint	proc	near
	push	bp
	mov	bp,sp
	sub	sp,6
;	?debug	L 771
	mov	word ptr [bp-4],0
	jmp	@266
@268:
;	?debug	L 773
	mov	bx,word ptr DGROUP:_cip
	mov	al,byte ptr [bx]
	mov	ah,0
	cmp	ax,22
	je	@274
	cmp	ax,37
	je	@270
	jmp	short @276
@270:
;	?debug	L 775
	inc	word ptr DGROUP:_cip
;	?debug	L 776
	mov	bx,word ptr DGROUP:_cip
	mov	al,byte ptr [bx]
	mov	byte ptr [bp-1],al
	inc	word ptr DGROUP:_cip
	jmp	short @271
@273:
;	?debug	L 778
	mov	bx,word ptr DGROUP:_cip
	inc	word ptr DGROUP:_cip
	push	word ptr [bx]
	call	near ptr _c_putch
	pop	cx
@271:
;	?debug	L 777
	mov	al,byte ptr [bp-1]
	dec	byte ptr [bp-1]
	or	al,al
	jne	@273
@272:
;	?debug	L 779
	jmp	short @269
@274:
;	?debug	L 781
	inc	word ptr DGROUP:_cip
;	?debug	L 782
	call	near ptr _iexp
	mov	word ptr [bp-4],ax
;	?debug	L 783
	cmp	byte ptr DGROUP:_err,0
	je	@275
	jmp	@265
@275:
;	?debug	L 785
	jmp	short @269
@276:
;	?debug	L 787
	call	near ptr _iexp
	mov	word ptr [bp-6],ax
;	?debug	L 788
	cmp	byte ptr DGROUP:_err,0
	je	@277
	jmp	short @265
@277:
;	?debug	L 790
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	call	near ptr _putnum
	pop	cx
	pop	cx
;	?debug	L 791
	jmp	short @269
@269:
;	?debug	L 794
	mov	bx,word ptr DGROUP:_cip
	cmp	byte ptr [bx],13
	jne	@278
;	?debug	L 795
	inc	word ptr DGROUP:_cip
;	?debug	L 796
	mov	bx,word ptr DGROUP:_cip
	cmp	byte ptr [bx],14
	je	@280
	mov	bx,word ptr DGROUP:_cip
	cmp	byte ptr [bx],38
	jne	@279
@280:
	jmp	short @265
@279:
;	?debug	L 798
	jmp	short @281
@278:
;	?debug	L 800
	mov	bx,word ptr DGROUP:_cip
	cmp	byte ptr [bx],14
	je	@282
	mov	bx,word ptr DGROUP:_cip
	cmp	byte ptr [bx],38
	je	@282
;	?debug	L 801
	mov	byte ptr DGROUP:_err,20
	jmp	short @265
@282:
@281:
@266:
;	?debug	L 772
	mov	bx,word ptr DGROUP:_cip
	cmp	byte ptr [bx],14
	je	@283
	mov	bx,word ptr DGROUP:_cip
	cmp	byte ptr [bx],38
	je	@284
	jmp	@268
@284:
@283:
@267:
;	?debug	L 806
	call	near ptr _newline
@265:
;	?debug	L 807
	mov	sp,bp
	pop	bp
	ret	
_iprint	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_DATA	ends
_TEXT	segment	byte public 'CODE'
;	?debug	L 810
_iinput	proc	near
	push	bp
	mov	bp,sp
	sub	sp,6
	jmp	@286
@288:
;	?debug	L 817
	mov	byte ptr [bp-1],1
;	?debug	L 819
	mov	bx,word ptr DGROUP:_cip
	cmp	byte ptr [bx],37
	jne	@289
;	?debug	L 820
	inc	word ptr DGROUP:_cip
;	?debug	L 821
	mov	bx,word ptr DGROUP:_cip
	mov	al,byte ptr [bx]
	mov	byte ptr [bp-2],al
	inc	word ptr DGROUP:_cip
	jmp	short @290
@292:
;	?debug	L 823
	mov	bx,word ptr DGROUP:_cip
	inc	word ptr DGROUP:_cip
	push	word ptr [bx]
	call	near ptr _c_putch
	pop	cx
@290:
;	?debug	L 822
	mov	al,byte ptr [bp-2]
	dec	byte ptr [bp-2]
	or	al,al
	jne	@292
@291:
;	?debug	L 824
	mov	byte ptr [bp-1],0
@289:
;	?debug	L 827
	mov	bx,word ptr DGROUP:_cip
	mov	al,byte ptr [bx]
	mov	ah,0
	cmp	ax,27
	je	@297
	cmp	ax,36
	je	@294
	jmp	@302
@294:
;	?debug	L 829
	inc	word ptr DGROUP:_cip
;	?debug	L 830
	cmp	byte ptr [bp-1],0
	je	@295
;	?debug	L 831
	mov	bx,word ptr DGROUP:_cip
	mov	al,byte ptr [bx]
	add	al,65
	push	ax
	call	near ptr _c_putch
	pop	cx
;	?debug	L 832
	mov	al,58
	push	ax
	call	near ptr _c_putch
	pop	cx
@295:
;	?debug	L 834
	call	near ptr _getnum
	mov	word ptr [bp-6],ax
;	?debug	L 835
	cmp	byte ptr DGROUP:_err,0
	je	@296
	jmp	@285
@296:
;	?debug	L 837
	mov	ax,word ptr [bp-6]
	mov	bx,word ptr DGROUP:_cip
	mov	dl,byte ptr [bx]
	mov	dh,0
	mov	bx,dx
	shl	bx,1
	mov	word ptr DGROUP:_var[bx],ax
	inc	word ptr DGROUP:_cip
;	?debug	L 838
	jmp	short @293
@297:
;	?debug	L 840
	inc	word ptr DGROUP:_cip
;	?debug	L 841
	call	near ptr _getparam
	mov	word ptr [bp-4],ax
;	?debug	L 842
	cmp	byte ptr DGROUP:_err,0
	je	@298
	jmp	@285
@298:
;	?debug	L 844
	cmp	word ptr [bp-4],64
	jl	@299
;	?debug	L 845
	mov	byte ptr DGROUP:_err,3
	jmp	@285
@299:
;	?debug	L 848
	cmp	byte ptr [bp-1],0
	je	@300
;	?debug	L 849
	mov	ax,offset DGROUP:s@+521
	push	ax
	call	near ptr _c_puts
	pop	cx
;	?debug	L 850
	xor	ax,ax
	push	ax
	push	word ptr [bp-4]
	call	near ptr _putnum
	pop	cx
	pop	cx
;	?debug	L 851
	mov	ax,offset DGROUP:s@+524
	push	ax
	call	near ptr _c_puts
	pop	cx
@300:
;	?debug	L 853
	call	near ptr _getnum
	mov	word ptr [bp-6],ax
;	?debug	L 854
	cmp	byte ptr DGROUP:_err,0
	je	@301
	jmp	short @285
@301:
;	?debug	L 856
	mov	ax,word ptr [bp-6]
	mov	bx,word ptr [bp-4]
	shl	bx,1
	mov	word ptr DGROUP:_arr[bx],ax
;	?debug	L 857
	jmp	short @293
@302:
;	?debug	L 859
	mov	byte ptr DGROUP:_err,20
	jmp	short @285
@293:
;	?debug	L 863
	mov	bx,word ptr DGROUP:_cip
	mov	al,byte ptr [bx]
	mov	ah,0
	cmp	ax,13
	je	@304
	cmp	ax,14
	je	@305
	cmp	ax,38
	je	@306
	jmp	short @307
@304:
;	?debug	L 865
	inc	word ptr DGROUP:_cip
;	?debug	L 866
	jmp	short @303
@305:
@306:
	jmp	short @285
@307:
;	?debug	L 871
	mov	byte ptr DGROUP:_err,20
	jmp	short @285
@303:
@286:
;	?debug	L 816
	jmp	@288
@287:
@285:
;	?debug	L 875
	mov	sp,bp
	pop	bp
	ret	
_iinput	endp
;	?debug	L 878
_ivar	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
;	?debug	L 882
	mov	bx,word ptr DGROUP:_cip
	mov	al,byte ptr [bx]
	mov	ah,0
	mov	word ptr [bp-2],ax
	inc	word ptr DGROUP:_cip
;	?debug	L 883
	mov	bx,word ptr DGROUP:_cip
	cmp	byte ptr [bx],24
	je	@309
;	?debug	L 884
	mov	byte ptr DGROUP:_err,18
	jmp	short @308
@309:
;	?debug	L 887
	inc	word ptr DGROUP:_cip
;	?debug	L 889
	call	near ptr _iexp
	mov	word ptr [bp-4],ax
;	?debug	L 890
	cmp	byte ptr DGROUP:_err,0
	je	@310
	jmp	short @308
@310:
;	?debug	L 893
	mov	ax,word ptr [bp-4]
	mov	bx,word ptr [bp-2]
	shl	bx,1
	mov	word ptr DGROUP:_var[bx],ax
@308:
;	?debug	L 894
	mov	sp,bp
	pop	bp
	ret	
_ivar	endp
;	?debug	L 897
_iarray	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
;	?debug	L 901
	call	near ptr _getparam
	mov	word ptr [bp-2],ax
;	?debug	L 902
	cmp	byte ptr DGROUP:_err,0
	je	@312
	jmp	short @311
@312:
;	?debug	L 905
	cmp	word ptr [bp-2],64
	jl	@313
;	?debug	L 906
	mov	byte ptr DGROUP:_err,3
	jmp	short @311
@313:
;	?debug	L 910
	mov	bx,word ptr DGROUP:_cip
	cmp	byte ptr [bx],24
	je	@314
;	?debug	L 911
	mov	byte ptr DGROUP:_err,18
	jmp	short @311
@314:
;	?debug	L 914
	inc	word ptr DGROUP:_cip
;	?debug	L 916
	call	near ptr _iexp
	mov	word ptr [bp-4],ax
;	?debug	L 917
	cmp	byte ptr DGROUP:_err,0
	je	@315
	jmp	short @311
@315:
;	?debug	L 920
	mov	ax,word ptr [bp-4]
	mov	bx,word ptr [bp-2]
	shl	bx,1
	mov	word ptr DGROUP:_arr[bx],ax
@311:
;	?debug	L 921
	mov	sp,bp
	pop	bp
	ret	
_iarray	endp
;	?debug	L 924
_ilet	proc	near
;	?debug	L 925
	mov	bx,word ptr DGROUP:_cip
	mov	al,byte ptr [bx]
	mov	ah,0
	cmp	ax,27
	je	@319
	cmp	ax,36
	je	@318
	jmp	short @320
@318:
;	?debug	L 927
	inc	word ptr DGROUP:_cip
;	?debug	L 928
	call	near ptr _ivar
;	?debug	L 929
	jmp	short @317
@319:
;	?debug	L 931
	inc	word ptr DGROUP:_cip
;	?debug	L 932
	call	near ptr _iarray
;	?debug	L 933
	jmp	short @317
@320:
;	?debug	L 935
	mov	byte ptr DGROUP:_err,14
;	?debug	L 936
	jmp	short @317
@317:
@316:
;	?debug	L 938
	ret	
_ilet	endp
;	?debug	L 941
_iexe	proc	near
	push	bp
	mov	bp,sp
	sub	sp,10
	push	si
	jmp	@322
@324:
;	?debug	L 949
	call	near ptr _c_kbhit
	or	al,al
	je	@325
;	?debug	L 950
	call	near ptr _c_getch
	cmp	al,27
	jne	@326
;	?debug	L 951
	mov	byte ptr DGROUP:_err,22
;	?debug	L 952
	xor	ax,ax
	jmp	@321
@326:
@325:
;	?debug	L 955
	mov	bx,word ptr DGROUP:_cip
	mov	al,byte ptr [bx]
	mov	ah,0
	cmp	ax,36
	jbe	@378
	jmp	@375
@378:
	mov	bx,ax
	shl	bx,1
	jmp	word ptr cs:@377[bx]
@377	label	word
	dw	@328
	dw	@331
	dw	@335
	dw	@337
	dw	@375
	dw	@375
	dw	@348
	dw	@355
	dw	@358
	dw	@362
	dw	@370
	dw	@369
	dw	@368
	dw	@375
	dw	@371
	dw	@375
	dw	@375
	dw	@375
	dw	@375
	dw	@375
	dw	@375
	dw	@375
	dw	@375
	dw	@375
	dw	@375
	dw	@375
	dw	@375
	dw	@367
	dw	@375
	dw	@375
	dw	@375
	dw	@372
	dw	@374
	dw	@373
	dw	@375
	dw	@375
	dw	@366
@328:
;	?debug	L 958
	inc	word ptr DGROUP:_cip
;	?debug	L 959
	call	near ptr _iexp
	mov	word ptr [bp-10],ax
;	?debug	L 960
	cmp	byte ptr DGROUP:_err,0
	je	@329
;	?debug	L 961
	jmp	@327
@329:
;	?debug	L 962
	push	word ptr [bp-10]
	call	near ptr _getlp
	pop	cx
	mov	si,ax
;	?debug	L 963
	push	si
	call	near ptr _getlineno
	pop	cx
	cmp	ax,word ptr [bp-10]
	je	@330
;	?debug	L 964
	mov	byte ptr DGROUP:_err,16
;	?debug	L 965
	jmp	@327
@330:
;	?debug	L 968
	mov	word ptr DGROUP:_clp,si
;	?debug	L 969
	mov	ax,word ptr DGROUP:_clp
	add	ax,3
	mov	word ptr DGROUP:_cip,ax
;	?debug	L 970
	jmp	@327
@331:
;	?debug	L 973
	inc	word ptr DGROUP:_cip
;	?debug	L 974
	call	near ptr _iexp
	mov	word ptr [bp-10],ax
;	?debug	L 975
	cmp	byte ptr DGROUP:_err,0
	je	@332
;	?debug	L 976
	jmp	@327
@332:
;	?debug	L 977
	push	word ptr [bp-10]
	call	near ptr _getlp
	pop	cx
	mov	si,ax
;	?debug	L 978
	push	si
	call	near ptr _getlineno
	pop	cx
	cmp	ax,word ptr [bp-10]
	je	@333
;	?debug	L 979
	mov	byte ptr DGROUP:_err,16
;	?debug	L 980
	jmp	@327
@333:
;	?debug	L 985
	cmp	byte ptr DGROUP:_gstki,6
	jb	@334
;	?debug	L 986
	mov	byte ptr DGROUP:_err,6
;	?debug	L 987
	jmp	@327
@334:
;	?debug	L 989
	mov	ax,word ptr DGROUP:_clp
	mov	dl,byte ptr DGROUP:_gstki
	mov	dh,0
	mov	bx,dx
	shl	bx,1
	mov	word ptr DGROUP:_gstk[bx],ax
	inc	byte ptr DGROUP:_gstki
;	?debug	L 990
	mov	ax,word ptr DGROUP:_cip
	mov	dl,byte ptr DGROUP:_gstki
	mov	dh,0
	mov	bx,dx
	shl	bx,1
	mov	word ptr DGROUP:_gstk[bx],ax
	inc	byte ptr DGROUP:_gstki
;	?debug	L 992
	mov	al,byte ptr DGROUP:_lstki
	mov	ah,0
	mov	dl,byte ptr DGROUP:_gstki
	mov	dh,0
	mov	bx,dx
	shl	bx,1
	mov	word ptr DGROUP:_gstk[bx],ax
	inc	byte ptr DGROUP:_gstki
;	?debug	L 994
	mov	word ptr DGROUP:_clp,si
;	?debug	L 995
	mov	ax,word ptr DGROUP:_clp
	add	ax,3
	mov	word ptr DGROUP:_cip,ax
;	?debug	L 996
	jmp	@327
@335:
;	?debug	L 1000
	cmp	byte ptr DGROUP:_gstki,3
	jae	@336
;	?debug	L 1001
	mov	byte ptr DGROUP:_err,7
;	?debug	L 1002
	jmp	@327
@336:
;	?debug	L 1005
	dec	byte ptr DGROUP:_gstki
	mov	al,byte ptr DGROUP:_gstki
	mov	ah,0
	mov	bx,ax
	shl	bx,1
	mov	al,byte ptr DGROUP:_gstk[bx]
	mov	byte ptr DGROUP:_lstki,al
;	?debug	L 1007
	dec	byte ptr DGROUP:_gstki
	mov	al,byte ptr DGROUP:_gstki
	mov	ah,0
	mov	bx,ax
	shl	bx,1
	mov	ax,word ptr DGROUP:_gstk[bx]
	mov	word ptr DGROUP:_cip,ax
;	?debug	L 1008
	dec	byte ptr DGROUP:_gstki
	mov	al,byte ptr DGROUP:_gstki
	mov	ah,0
	mov	bx,ax
	shl	bx,1
	mov	ax,word ptr DGROUP:_gstk[bx]
	mov	word ptr DGROUP:_clp,ax
;	?debug	L 1009
	jmp	@327
@337:
;	?debug	L 1012
	inc	word ptr DGROUP:_cip
;	?debug	L 1014
	mov	bx,word ptr DGROUP:_cip
	inc	word ptr DGROUP:_cip
	cmp	byte ptr [bx],36
	je	@338
;	?debug	L 1015
	mov	byte ptr DGROUP:_err,12
;	?debug	L 1016
	jmp	@327
@338:
;	?debug	L 1019
	mov	bx,word ptr DGROUP:_cip
	mov	al,byte ptr [bx]
	mov	ah,0
	mov	word ptr [bp-8],ax
;	?debug	L 1020
	call	near ptr _ivar
;	?debug	L 1021
	cmp	byte ptr DGROUP:_err,0
	je	@339
;	?debug	L 1022
	jmp	@327
@339:
;	?debug	L 1024
	mov	bx,word ptr DGROUP:_cip
	cmp	byte ptr [bx],4
	jne	@340
;	?debug	L 1025
	inc	word ptr DGROUP:_cip
;	?debug	L 1026
	call	near ptr _iexp
	mov	word ptr [bp-6],ax
;	?debug	L 1027
	jmp	short @341
@340:
;	?debug	L 1029
	mov	byte ptr DGROUP:_err,13
;	?debug	L 1030
	jmp	@327
@341:
;	?debug	L 1033
	mov	bx,word ptr DGROUP:_cip
	cmp	byte ptr [bx],5
	jne	@342
;	?debug	L 1034
	inc	word ptr DGROUP:_cip
;	?debug	L 1035
	call	near ptr _iexp
	mov	word ptr [bp-4],ax
;	?debug	L 1036
	jmp	short @343
@342:
;	?debug	L 1038
	mov	word ptr [bp-4],1
@343:
;	?debug	L 1041
;	?debug	L 1042
	cmp	word ptr [bp-4],0
	jge	@346
	mov	ax,-32767
	sub	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-6]
	jg	@345
@346:
	cmp	word ptr [bp-4],0
	jle	@344
	mov	ax,32767
	sub	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-6]
	jge	@344
@345:
;	?debug	L 1043
	mov	byte ptr DGROUP:_err,2
;	?debug	L 1044
	jmp	@327
@344:
;	?debug	L 1048
	cmp	byte ptr DGROUP:_lstki,10
	jb	@347
;	?debug	L 1049
	mov	byte ptr DGROUP:_err,8
;	?debug	L 1050
	jmp	@327
@347:
;	?debug	L 1052
	mov	ax,word ptr DGROUP:_clp
	mov	dl,byte ptr DGROUP:_lstki
	mov	dh,0
	mov	bx,dx
	shl	bx,1
	mov	word ptr DGROUP:_lstk[bx],ax
	inc	byte ptr DGROUP:_lstki
;	?debug	L 1053
	mov	ax,word ptr DGROUP:_cip
	mov	dl,byte ptr DGROUP:_lstki
	mov	dh,0
	mov	bx,dx
	shl	bx,1
	mov	word ptr DGROUP:_lstk[bx],ax
	inc	byte ptr DGROUP:_lstki
;	?debug	L 1055
	mov	ax,word ptr [bp-6]
	mov	dl,byte ptr DGROUP:_lstki
	mov	dh,0
	mov	bx,dx
	shl	bx,1
	mov	word ptr DGROUP:_lstk[bx],ax
	inc	byte ptr DGROUP:_lstki
;	?debug	L 1056
	mov	ax,word ptr [bp-4]
	mov	dl,byte ptr DGROUP:_lstki
	mov	dh,0
	mov	bx,dx
	shl	bx,1
	mov	word ptr DGROUP:_lstk[bx],ax
	inc	byte ptr DGROUP:_lstki
;	?debug	L 1057
	mov	ax,word ptr [bp-8]
	mov	dl,byte ptr DGROUP:_lstki
	mov	dh,0
	mov	bx,dx
	shl	bx,1
	mov	word ptr DGROUP:_lstk[bx],ax
	inc	byte ptr DGROUP:_lstki
;	?debug	L 1058
	jmp	@327
@348:
;	?debug	L 1061
	inc	word ptr DGROUP:_cip
;	?debug	L 1063
	cmp	byte ptr DGROUP:_lstki,5
	jae	@349
;	?debug	L 1064
	mov	byte ptr DGROUP:_err,9
;	?debug	L 1065
	jmp	@327
@349:
;	?debug	L 1068
	mov	al,byte ptr DGROUP:_lstki
	mov	ah,0
	mov	bx,ax
	dec	bx
	shl	bx,1
	mov	ax,word ptr DGROUP:_lstk[bx]
	mov	word ptr [bp-8],ax
;	?debug	L 1069
	mov	bx,word ptr DGROUP:_cip
	inc	word ptr DGROUP:_cip
	cmp	byte ptr [bx],36
	je	@350
;	?debug	L 1070
	mov	byte ptr DGROUP:_err,10
;	?debug	L 1071
	jmp	@327
@350:
;	?debug	L 1073
	mov	bx,word ptr DGROUP:_cip
	inc	word ptr DGROUP:_cip
	mov	al,byte ptr [bx]
	mov	ah,0
	cmp	ax,word ptr [bp-8]
	je	@351
;	?debug	L 1074
	mov	byte ptr DGROUP:_err,11
;	?debug	L 1075
	jmp	@327
@351:
;	?debug	L 1078
	mov	al,byte ptr DGROUP:_lstki
	mov	ah,0
	mov	bx,ax
	add	bx,-2
	shl	bx,1
	mov	ax,word ptr DGROUP:_lstk[bx]
	mov	word ptr [bp-4],ax
;	?debug	L 1079
	mov	ax,word ptr [bp-4]
	mov	bx,word ptr [bp-8]
	shl	bx,1
	add	word ptr DGROUP:_var[bx],ax
;	?debug	L 1080
	mov	al,byte ptr DGROUP:_lstki
	mov	ah,0
	mov	bx,ax
	add	bx,-3
	shl	bx,1
	mov	ax,word ptr DGROUP:_lstk[bx]
	mov	word ptr [bp-6],ax
;	?debug	L 1083
;	?debug	L 1084
	cmp	word ptr [bp-4],0
	jge	@354
	mov	bx,word ptr [bp-8]
	shl	bx,1
	mov	ax,word ptr DGROUP:_var[bx]
	cmp	ax,word ptr [bp-6]
	jl	@353
@354:
	cmp	word ptr [bp-4],0
	jle	@352
	mov	bx,word ptr [bp-8]
	shl	bx,1
	mov	ax,word ptr DGROUP:_var[bx]
	cmp	ax,word ptr [bp-6]
	jle	@352
@353:
;	?debug	L 1085
	sub	byte ptr DGROUP:_lstki,5
;	?debug	L 1086
	jmp	@327
@352:
;	?debug	L 1090
	mov	al,byte ptr DGROUP:_lstki
	mov	ah,0
	mov	bx,ax
	add	bx,-4
	shl	bx,1
	mov	ax,word ptr DGROUP:_lstk[bx]
	mov	word ptr DGROUP:_cip,ax
;	?debug	L 1091
	mov	al,byte ptr DGROUP:_lstki
	mov	ah,0
	mov	bx,ax
	add	bx,-5
	shl	bx,1
	mov	ax,word ptr DGROUP:_lstk[bx]
	mov	word ptr DGROUP:_clp,ax
;	?debug	L 1092
	jmp	@327
@355:
;	?debug	L 1095
	inc	word ptr DGROUP:_cip
;	?debug	L 1096
	call	near ptr _iexp
	mov	word ptr [bp-2],ax
;	?debug	L 1097
	cmp	byte ptr DGROUP:_err,0
	je	@356
;	?debug	L 1098
	mov	byte ptr DGROUP:_err,15
;	?debug	L 1099
	jmp	@327
@356:
;	?debug	L 1101
	cmp	word ptr [bp-2],0
	je	@357
;	?debug	L 1102
	jmp	@327
@357:
@358:
	jmp	short @359
@361:
;	?debug	L 1109
	inc	word ptr DGROUP:_cip
@359:
;	?debug	L 1108
	mov	bx,word ptr DGROUP:_cip
	cmp	byte ptr [bx],38
	jne	@361
@360:
;	?debug	L 1110
	jmp	short @327
@362:
	jmp	short @363
@365:
;	?debug	L 1114
	mov	bx,word ptr DGROUP:_clp
	mov	al,byte ptr [bx]
	mov	ah,0
	add	word ptr DGROUP:_clp,ax
@363:
;	?debug	L 1113
	mov	bx,word ptr DGROUP:_clp
	cmp	byte ptr [bx],0
	jne	@365
@364:
;	?debug	L 1115
	mov	ax,word ptr DGROUP:_clp
	jmp	short @321
@366:
;	?debug	L 1118
	inc	word ptr DGROUP:_cip
;	?debug	L 1119
	call	near ptr _ivar
;	?debug	L 1120
	jmp	short @327
@367:
;	?debug	L 1122
	inc	word ptr DGROUP:_cip
;	?debug	L 1123
	call	near ptr _iarray
;	?debug	L 1124
	jmp	short @327
@368:
;	?debug	L 1126
	inc	word ptr DGROUP:_cip
;	?debug	L 1127
	call	near ptr _ilet
;	?debug	L 1128
	jmp	short @327
@369:
;	?debug	L 1130
	inc	word ptr DGROUP:_cip
;	?debug	L 1131
	call	near ptr _iprint
;	?debug	L 1132
	jmp	short @327
@370:
;	?debug	L 1134
	inc	word ptr DGROUP:_cip
;	?debug	L 1135
	call	near ptr _iinput
;	?debug	L 1136
	jmp	short @327
@371:
;	?debug	L 1139
	inc	word ptr DGROUP:_cip
;	?debug	L 1140
	jmp	short @327
@372:
@373:
@374:
;	?debug	L 1145
	mov	byte ptr DGROUP:_err,19
;	?debug	L 1146
	jmp	short @327
@375:
;	?debug	L 1149
	mov	byte ptr DGROUP:_err,20
;	?debug	L 1150
	jmp	short @327
@327:
;	?debug	L 1153
	cmp	byte ptr DGROUP:_err,0
	je	@376
;	?debug	L 1154
	xor	ax,ax
	jmp	short @321
@376:
@322:
;	?debug	L 947
	mov	bx,word ptr DGROUP:_cip
	cmp	byte ptr [bx],38
	je	@379
	jmp	@324
@379:
@323:
;	?debug	L 1156
	mov	bx,word ptr DGROUP:_clp
	mov	al,byte ptr [bx]
	mov	ah,0
	add	ax,word ptr DGROUP:_clp
	jmp	short @321
@321:
;	?debug	L 1157
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_iexe	endp
;	?debug	L 1160
_irun	proc	near
	push	si
;	?debug	L 1163
	mov	byte ptr DGROUP:_gstki,0
;	?debug	L 1164
	mov	byte ptr DGROUP:_lstki,0
;	?debug	L 1165
	mov	word ptr DGROUP:_clp,offset DGROUP:_listbuf
	jmp	short @381
@383:
;	?debug	L 1168
	mov	ax,word ptr DGROUP:_clp
	add	ax,3
	mov	word ptr DGROUP:_cip,ax
;	?debug	L 1169
	call	near ptr _iexe
	mov	si,ax
;	?debug	L 1170
	cmp	byte ptr DGROUP:_err,0
	je	@384
	jmp	short @380
@384:
;	?debug	L 1172
	mov	word ptr DGROUP:_clp,si
@381:
;	?debug	L 1167
	mov	bx,word ptr DGROUP:_clp
	cmp	byte ptr [bx],0
	jne	@383
@382:
@380:
;	?debug	L 1174
	pop	si
	ret	
_irun	endp
;	?debug	L 1177
_ilist	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
;	?debug	L 1180
	mov	bx,word ptr DGROUP:_cip
	cmp	byte ptr [bx],35
	jne	@396
	push	word ptr DGROUP:_cip
	call	near ptr _getlineno
	pop	cx
	jmp	short @395
@396:
	xor	ax,ax
@395:
	mov	word ptr [bp-2],ax
;	?debug	L 1182
	mov	word ptr DGROUP:_clp,offset DGROUP:_listbuf
	jmp	short @389
@388:
@387:
;	?debug	L 1184
	mov	bx,word ptr DGROUP:_clp
	mov	al,byte ptr [bx]
	mov	ah,0
	add	word ptr DGROUP:_clp,ax
@389:
;	?debug	L 1183
	mov	bx,word ptr DGROUP:_clp
	cmp	byte ptr [bx],0
	je	@390
	push	word ptr DGROUP:_clp
	call	near ptr _getlineno
	pop	cx
	cmp	ax,word ptr [bp-2]
	jl	@388
@390:
@386:
	jmp	short @391
@393:
;	?debug	L 1187
	xor	ax,ax
	push	ax
	push	word ptr DGROUP:_clp
	call	near ptr _getlineno
	pop	cx
	push	ax
	call	near ptr _putnum
	pop	cx
	pop	cx
;	?debug	L 1188
	mov	al,32
	push	ax
	call	near ptr _c_putch
	pop	cx
;	?debug	L 1189
	mov	ax,word ptr DGROUP:_clp
	add	ax,3
	push	ax
	call	near ptr _putlist
	pop	cx
;	?debug	L 1190
	cmp	byte ptr DGROUP:_err,0
	je	@394
;	?debug	L 1191
	jmp	short @392
@394:
;	?debug	L 1192
	call	near ptr _newline
;	?debug	L 1193
	mov	bx,word ptr DGROUP:_clp
	mov	al,byte ptr [bx]
	mov	ah,0
	add	word ptr DGROUP:_clp,ax
@391:
;	?debug	L 1186
	mov	bx,word ptr DGROUP:_clp
	cmp	byte ptr [bx],0
	jne	@393
@392:
@385:
;	?debug	L 1195
	mov	sp,bp
	pop	bp
	ret	
_ilist	endp
;	?debug	L 1198
_inew	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
;	?debug	L 1201
	mov	byte ptr [bp-1],0
	jmp	short @401
@400:
;	?debug	L 1202
	mov	al,byte ptr [bp-1]
	mov	ah,0
	mov	bx,ax
	shl	bx,1
	mov	word ptr DGROUP:_var[bx],0
@399:
	inc	byte ptr [bp-1]
@401:
	cmp	byte ptr [bp-1],26
	jb	@400
@398:
;	?debug	L 1203
	mov	byte ptr [bp-1],0
	jmp	short @405
@404:
;	?debug	L 1204
	mov	al,byte ptr [bp-1]
	mov	ah,0
	mov	bx,ax
	shl	bx,1
	mov	word ptr DGROUP:_arr[bx],0
@403:
	inc	byte ptr [bp-1]
@405:
	cmp	byte ptr [bp-1],64
	jb	@404
@402:
;	?debug	L 1205
	mov	byte ptr DGROUP:_gstki,0
;	?debug	L 1206
	mov	byte ptr DGROUP:_lstki,0
;	?debug	L 1207
	mov	byte ptr DGROUP:_listbuf,0
;	?debug	L 1208
	mov	word ptr DGROUP:_clp,offset DGROUP:_listbuf
@397:
;	?debug	L 1209
	mov	sp,bp
	pop	bp
	ret	
_inew	endp
;	?debug	L 1212
_icom	proc	near
;	?debug	L 1213
	mov	word ptr DGROUP:_cip,offset DGROUP:_ibuf
;	?debug	L 1214
	mov	bx,word ptr DGROUP:_cip
	mov	al,byte ptr [bx]
	mov	ah,0
	cmp	ax,31
	je	@411
	cmp	ax,32
	je	@415
	cmp	ax,33
	je	@408
	jmp	short @416
@408:
;	?debug	L 1216
	inc	word ptr DGROUP:_cip
;	?debug	L 1217
	mov	bx,word ptr DGROUP:_cip
	cmp	byte ptr [bx],38
	jne	@409
;	?debug	L 1218
	call	near ptr _inew
	jmp	short @410
@409:
;	?debug	L 1220
	mov	byte ptr DGROUP:_err,20
@410:
;	?debug	L 1221
	jmp	short @407
@411:
;	?debug	L 1223
	inc	word ptr DGROUP:_cip
;	?debug	L 1224
	mov	bx,word ptr DGROUP:_cip
	cmp	byte ptr [bx],38
	je	@413
	mov	bx,word ptr DGROUP:_cip
	cmp	byte ptr [bx+3],38
	jne	@412
@413:
;	?debug	L 1225
	call	near ptr _ilist
	jmp	short @414
@412:
;	?debug	L 1227
	mov	byte ptr DGROUP:_err,20
@414:
;	?debug	L 1228
	jmp	short @407
@415:
;	?debug	L 1230
	inc	word ptr DGROUP:_cip
;	?debug	L 1231
	call	near ptr _irun
;	?debug	L 1232
	jmp	short @407
@416:
;	?debug	L 1234
	call	near ptr _iexe
;	?debug	L 1235
	jmp	short @407
@407:
@406:
;	?debug	L 1237
	ret	
_icom	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_DATA	ends
_TEXT	segment	byte public 'CODE'
;	?debug	L 1240
_error	proc	near
;	?debug	L 1241
	cmp	byte ptr DGROUP:_err,0
	je	@418
;	?debug	L 1242
	cmp	word ptr DGROUP:_cip,offset DGROUP:_listbuf
	jb	@419
	cmp	word ptr DGROUP:_cip,offset DGROUP:_listbuf+30592
	jae	@419
	mov	bx,word ptr DGROUP:_clp
	cmp	byte ptr [bx],0
	je	@419
;	?debug	L 1244
	call	near ptr _newline
;	?debug	L 1245
	mov	ax,offset DGROUP:s@+527
	push	ax
	call	near ptr _c_puts
	pop	cx
;	?debug	L 1246
	xor	ax,ax
	push	ax
	push	word ptr DGROUP:_clp
	call	near ptr _getlineno
	pop	cx
	push	ax
	call	near ptr _putnum
	pop	cx
	pop	cx
;	?debug	L 1247
	mov	al,32
	push	ax
	call	near ptr _c_putch
	pop	cx
;	?debug	L 1248
	mov	ax,word ptr DGROUP:_clp
	add	ax,3
	push	ax
	call	near ptr _putlist
	pop	cx
;	?debug	L 1249
	jmp	short @420
@419:
;	?debug	L 1252
	call	near ptr _newline
;	?debug	L 1253
	mov	ax,offset DGROUP:s@+533
	push	ax
	call	near ptr _c_puts
	pop	cx
;	?debug	L 1254
	mov	ax,offset DGROUP:_lbuf
	push	ax
	call	near ptr _c_puts
	pop	cx
@420:
@418:
;	?debug	L 1258
	call	near ptr _newline
;	?debug	L 1259
	mov	al,byte ptr DGROUP:_err
	mov	ah,0
	mov	bx,ax
	shl	bx,1
	push	word ptr DGROUP:_errmsg[bx]
	call	near ptr _c_puts
	pop	cx
;	?debug	L 1260
	call	near ptr _newline
;	?debug	L 1261
	mov	byte ptr DGROUP:_err,0
@417:
;	?debug	L 1262
	ret	
_error	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_DATA	ends
_TEXT	segment	byte public 'CODE'
;	?debug	L 1268
_basic	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
;	?debug	L 1271
	call	near ptr _inew
;	?debug	L 1272
	mov	ax,offset DGROUP:s@+544
	push	ax
	call	near ptr _c_puts
	pop	cx
	call	near ptr _newline
;	?debug	L 1273
	mov	ax,offset DGROUP:s@+565
	push	ax
	call	near ptr _c_puts
	pop	cx
;	?debug	L 1274
	mov	ax,offset DGROUP:s@+577
	push	ax
	call	near ptr _c_puts
	pop	cx
	call	near ptr _newline
;	?debug	L 1275
	call	near ptr _error
	jmp	short @422
@424:
;	?debug	L 1279
	mov	al,62
	push	ax
	call	near ptr _c_putch
	pop	cx
;	?debug	L 1280
	call	near ptr _c_gets
;	?debug	L 1281
	call	near ptr _toktoi
	mov	byte ptr [bp-1],al
;	?debug	L 1282
	cmp	byte ptr DGROUP:_err,0
	je	@425
;	?debug	L 1283
	call	near ptr _error
;	?debug	L 1284
	jmp	short @422
@425:
;	?debug	L 1287
	cmp	byte ptr DGROUP:_ibuf,34
	jne	@426
	jmp	short @421
@426:
;	?debug	L 1291
	cmp	byte ptr DGROUP:_ibuf,35
	jne	@427
;	?debug	L 1292
	mov	al,byte ptr [bp-1]
	mov	byte ptr DGROUP:_ibuf,al
;	?debug	L 1293
	call	near ptr _inslist
;	?debug	L 1294
	cmp	byte ptr DGROUP:_err,0
	je	@428
;	?debug	L 1295
	call	near ptr _error
@428:
;	?debug	L 1296
	jmp	short @422
@427:
;	?debug	L 1299
	call	near ptr _icom
;	?debug	L 1300
	call	near ptr _error
@422:
;	?debug	L 1278
	jmp	short @424
@423:
@421:
;	?debug	L 1302
	mov	sp,bp
	pop	bp
	ret	
_basic	endp
_TEXT	ends
_BSS	segment word public 'BSS'
_ibuf	label	byte
	db	160 dup (?)
_clp	label	word
	db	2 dup (?)
_cip	label	word
	db	2 dup (?)
_lbuf	label	byte
	db	160 dup (?)
_arr	label	word
	db	128 dup (?)
_err	label	byte
	db	1 dup (?)
_gstk	label	word
	db	18 dup (?)
_lstk	label	word
	db	30 dup (?)
_var	label	word
	db	52 dup (?)
_gstki	label	byte
	db	1 dup (?)
_lstki	label	byte
	db	1 dup (?)
_listbuf	label	byte
	db	30592 dup (?)
_BSS	ends
	?debug	C E9
_DATA	segment word public 'DATA'
s@	label	byte
	db	71
	db	79
	db	84
	db	79
	db	0
	db	71
	db	79
	db	83
	db	85
	db	66
	db	0
	db	82
	db	69
	db	84
	db	85
	db	82
	db	78
	db	0
	db	70
	db	79
	db	82
	db	0
	db	84
	db	79
	db	0
	db	83
	db	84
	db	69
	db	80
	db	0
	db	78
	db	69
	db	88
	db	84
	db	0
	db	73
	db	70
	db	0
	db	82
	db	69
	db	77
	db	0
	db	83
	db	84
	db	79
	db	80
	db	0
	db	73
	db	78
	db	80
	db	85
	db	84
	db	0
	db	80
	db	82
	db	73
	db	78
	db	84
	db	0
	db	76
	db	69
	db	84
	db	0
	db	44
	db	0
	db	59
	db	0
	db	45
	db	0
	db	43
	db	0
	db	42
	db	0
	db	47
	db	0
	db	40
	db	0
	db	41
	db	0
	db	62
	db	61
	db	0
	db	35
	db	0
	db	62
	db	0
	db	61
	db	0
	db	60
	db	61
	db	0
	db	60
	db	0
	db	64
	db	0
	db	82
	db	78
	db	68
	db	0
	db	65
	db	66
	db	83
	db	0
	db	83
	db	73
	db	90
	db	69
	db	0
	db	76
	db	73
	db	83
	db	84
	db	0
	db	82
	db	85
	db	78
	db	0
	db	78
	db	69
	db	87
	db	0
	db	83
	db	89
	db	83
	db	84
	db	69
	db	77
	db	0
	db	79
	db	75
	db	0
	db	68
	db	101
	db	118
	db	105
	db	115
	db	105
	db	111
	db	110
	db	32
	db	98
	db	121
	db	32
	db	122
	db	101
	db	114
	db	111
	db	0
	db	79
	db	118
	db	101
	db	114
	db	102
	db	108
	db	111
	db	119
	db	0
	db	83
	db	117
	db	98
	db	115
	db	99
	db	114
	db	105
	db	112
	db	116
	db	32
	db	111
	db	117
	db	116
	db	32
	db	111
	db	102
	db	32
	db	114
	db	97
	db	110
	db	103
	db	101
	db	0
	db	73
	db	99
	db	111
	db	100
	db	101
	db	32
	db	98
	db	117
	db	102
	db	102
	db	101
	db	114
	db	32
	db	102
	db	117
	db	108
	db	108
	db	0
	db	76
	db	105
	db	115
	db	116
	db	32
	db	102
	db	117
	db	108
	db	108
	db	0
	db	71
	db	79
	db	83
	db	85
	db	66
	db	32
	db	116
	db	111
	db	111
	db	32
	db	109
	db	97
	db	110
	db	121
	db	32
	db	110
	db	101
	db	115
	db	116
	db	101
	db	100
	db	0
	db	82
	db	69
	db	84
	db	85
	db	82
	db	78
	db	32
	db	115
	db	116
	db	97
	db	99
	db	107
	db	32
	db	117
	db	110
	db	100
	db	101
	db	114
	db	102
	db	108
	db	111
	db	119
	db	0
	db	70
	db	79
	db	82
	db	32
	db	116
	db	111
	db	111
	db	32
	db	109
	db	97
	db	110
	db	121
	db	32
	db	110
	db	101
	db	115
	db	116
	db	101
	db	100
	db	0
	db	78
	db	69
	db	88
	db	84
	db	32
	db	119
	db	105
	db	116
	db	104
	db	111
	db	117
	db	116
	db	32
	db	70
	db	79
	db	82
	db	0
	db	78
	db	69
	db	88
	db	84
	db	32
	db	119
	db	105
	db	116
	db	104
	db	111
	db	117
	db	116
	db	32
	db	99
	db	111
	db	117
	db	110
	db	116
	db	101
	db	114
	db	0
	db	78
	db	69
	db	88
	db	84
	db	32
	db	109
	db	105
	db	115
	db	109
	db	97
	db	116
	db	99
	db	104
	db	32
	db	70
	db	79
	db	82
	db	0
	db	70
	db	79
	db	82
	db	32
	db	119
	db	105
	db	116
	db	104
	db	111
	db	117
	db	116
	db	32
	db	118
	db	97
	db	114
	db	105
	db	97
	db	98
	db	108
	db	101
	db	0
	db	70
	db	79
	db	82
	db	32
	db	119
	db	105
	db	116
	db	104
	db	111
	db	117
	db	116
	db	32
	db	84
	db	79
	db	0
	db	76
	db	69
	db	84
	db	32
	db	119
	db	105
	db	116
	db	104
	db	111
	db	117
	db	116
	db	32
	db	118
	db	97
	db	114
	db	105
	db	97
	db	98
	db	108
	db	101
	db	0
	db	73
	db	70
	db	32
	db	119
	db	105
	db	116
	db	104
	db	111
	db	117
	db	116
	db	32
	db	99
	db	111
	db	110
	db	100
	db	105
	db	116
	db	105
	db	111
	db	110
	db	0
	db	85
	db	110
	db	100
	db	101
	db	102
	db	105
	db	110
	db	101
	db	100
	db	32
	db	108
	db	105
	db	110
	db	101
	db	32
	db	110
	db	117
	db	109
	db	98
	db	101
	db	114
	db	0
	db	39
	db	40
	db	39
	db	32
	db	111
	db	114
	db	32
	db	39
	db	41
	db	39
	db	32
	db	101
	db	120
	db	112
	db	101
	db	99
	db	116
	db	101
	db	100
	db	0
	db	39
	db	61
	db	39
	db	32
	db	101
	db	120
	db	112
	db	101
	db	99
	db	116
	db	101
	db	100
	db	0
	db	73
	db	108
	db	108
	db	101
	db	103
	db	97
	db	108
	db	32
	db	99
	db	111
	db	109
	db	109
	db	97
	db	110
	db	100
	db	0
	db	83
	db	121
	db	110
	db	116
	db	97
	db	120
	db	32
	db	101
	db	114
	db	114
	db	111
	db	114
	db	0
	db	73
	db	110
	db	116
	db	101
	db	114
	db	110
	db	97
	db	108
	db	32
	db	101
	db	114
	db	114
	db	111
	db	114
	db	0
	db	65
	db	98
	db	111
	db	114
	db	116
	db	32
	db	98
	db	121
	db	32
	db	91
	db	69
	db	83
	db	67
	db	93
	db	0
	db	64
	db	40
	db	0
	db	41
	db	58
	db	0
	db	76
	db	73
	db	78
	db	69
	db	58
	db	0
	db	89
	db	79
	db	85
	db	32
	db	84
	db	89
	db	80
	db	69
	db	58
	db	32
	db	0
	db	84
	db	79
	db	89
	db	79
	db	83
	db	72
	db	73
	db	75
	db	73
	db	32
	db	84
	db	73
	db	78
	db	89
	db	32
	db	66
	db	65
	db	83
	db	73
	db	67
	db	0
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
	db	0
	db	32
	db	69
	db	68
	db	73
	db	84
	db	73
	db	79
	db	78
	db	0
_DATA	ends
_TEXT	segment	byte public 'CODE'
	extrn	_c_kbhit:near
	extrn	_c_putch:near
	extrn	_c_getch:near
	extrn	_srand:near
	extrn	_rand:near
_TEXT	ends
	public	_c_isdigit
	public	_c_isprint
	public	_c_toupper
	public	_getlineno
	public	_putlist
	public	_getparam
	public	_inslist
	public	_c_isspace
	public	_iarray
	public	_c_isalpha
	public	_iinput
	public	_iprint
	public	_c_gets
	public	_c_puts
	public	_putnum
	public	_listbuf
	public	_newline
	public	_getsize
	public	_getnum
	public	_ilist
	public	_toktoi
	public	_iplus
	public	_error
	public	_getlp
	public	_sstyle
	public	_inew
	public	_errmsg
	public	_ivalue
	public	_kwtbl
	public	_ilet
	public	_getrnd
	public	_ivar
	public	_lstki
	public	_gstki
	public	_iexp
	public	_main
	public	_irun
	public	_var
	public	_icom
	public	_imul
	public	_lstk
	public	_gstk
	public	_i_nsb
	public	_basic
	public	_err
	public	_i_nsa
	public	_arr
	public	_lbuf
	public	_cip
	public	_clp
	public	_ibuf
	public	_iexe
	end
