	.arch armv8-a
	.file	"rsa_33bit_baseline.c"
	.text
	.align	2
	.p2align 5,,15
	.type	mod_exp_montgomery.constprop.0, %function
mod_exp_montgomery.constprop.0:
.LFB16:
	.cfi_startproc
	mov	x4, 22373
	mov	w7, 39658
	movk	x4, 0xad45, lsl 16
	mov	x2, 0
	movk	x4, 0x1, lsl 32
	mov	w5, 0
	movk	w7, 0x5e3e, lsl 16
	udiv	x3, x0, x4
	msub	x0, x3, x4, x0
	.p2align 5,,15
.L2:
	lsr	x3, x0, x5
	and	x3, x3, 1
	sbfx	x6, x2, 0, 1
	add	w5, w5, 1
	and	x6, x6, x4
	umaddl	x2, w3, w7, x2
	add	x2, x2, x6
	lsr	x2, x2, 1
	cmp	w5, 33
	bne	.L2
	mov	x0, 22372
	movk	x0, 0xad45, lsl 16
	movk	x0, 0x1, lsl 32
	cmp	x2, x0
	bls	.L3
	mov	x3, 16973
	sub	x4, x2, x4
	movk	x3, 0xe383, lsl 16
	movk	x3, 0xc365, lsl 32
	movk	x3, 0x262a, lsl 48
	smulh	x3, x4, x3
	asr	x3, x3, 30
	sub	x3, x3, x4, asr 63
	add	x3, x3, 1
	cmp	x4, x0
	bls	.L4
	adrp	x5, .LC0
	fmov	d31, x2
	mov	w0, 0
	ldr	q30, [x5, #:lo12:.LC0]
	ins	v31.d[1], x4
	ubfx	x4, x3, 1, 32
	.p2align 5,,15
.L5:
	mov	v29.16b, v31.16b
	add	w0, w0, 1
	add	v31.2d, v31.2d, v30.2d
	cmp	w0, w4
	bne	.L5
	tbz	x3, 0, .L7
	mov	x0, -22373
	and	x3, x3, -2
	movk	x0, 0x52ba, lsl 16
	movk	x0, 0xfffe, lsl 32
	madd	x2, x3, x0, x2
.L4:
	mov	x0, -22373
	movk	x0, 0x52ba, lsl 16
	movk	x0, 0xfffe, lsl 32
	add	x2, x2, x0
.L3:
	cbz	x1, .L38
.L64:
	adrp	x0, .LC0
	mov	x6, 22373
	mov	x10, 16973
	movk	x6, 0xad45, lsl 16
	mov	x8, -22373
	movk	x10, 0xe383, lsl 16
	ldr	q30, [x0, #:lo12:.LC0]
	movk	x6, 0x1, lsl 32
	mov	x11, 43163
	movk	x8, 0x52ba, lsl 16
	movk	x10, 0xc365, lsl 32
	sub	x9, x6, #1
	movk	x11, 0x52ba, lsl 16
	movk	x8, 0xfffe, lsl 32
	movk	x10, 0x262a, lsl 48
.L27:
	and	x0, x1, 1
	lsr	x1, x1, 1
	cbnz	x0, .L61
.L10:
	mov	x0, 0
	mov	w4, 0
	.p2align 5,,15
.L20:
	lsr	x3, x2, x4
	and	x5, x3, 1
	sbfx	x3, x3, 0, 1
	and	x7, x0, 1
	and	x3, x3, x2
	and	x5, x5, x2
	add	x0, x3, x0
	cmp	x5, x7
	add	x3, x0, x6
	add	w4, w4, 1
	csel	x0, x3, x0, ne
	lsr	x0, x0, 1
	cmp	w4, 33
	bne	.L20
	cmp	x0, x9
	bls	.L39
	add	x2, x0, x8
	smulh	x3, x2, x10
	asr	x3, x3, 30
	sub	x3, x3, x2, asr 63
	add	x3, x3, 1
	cmp	x2, x9
	bls	.L22
	fmov	d31, x0
	ubfx	x4, x3, 1, 32
	ins	v31.d[1], x2
	mov	w2, 0
	.p2align 5,,15
.L23:
	mov	v29.16b, v31.16b
	add	w2, w2, 1
	add	v31.2d, v31.2d, v30.2d
	cmp	w2, w4
	bne	.L23
	tbz	x3, 0, .L25
	and	x3, x3, -2
	madd	x0, x3, x8, x0
.L22:
	add	x2, x0, x8
	and	x0, x1, 1
	lsr	x1, x1, 1
	cbz	x0, .L10
	.p2align 5,,15
.L61:
	mov	x3, 0
	mov	w4, 0
	.p2align 5,,15
.L12:
	lsr	x0, x11, x4
	and	x5, x0, 1
	sbfx	x0, x0, 0, 1
	and	x7, x3, 1
	and	x0, x0, x2
	and	x5, x5, x2
	add	x0, x0, x3
	cmp	x7, x5
	add	x3, x0, x6
	add	w4, w4, 1
	csel	x0, x3, x0, ne
	lsr	x3, x0, 1
	cmp	w4, 33
	bne	.L12
	cmp	x3, x9
	bls	.L13
	add	x0, x3, x8
	smulh	x4, x0, x10
	asr	x4, x4, 30
	sub	x4, x4, x0, asr 63
	add	x4, x4, 1
	cmp	x0, x9
	bls	.L14
	fmov	d31, x3
	ubfx	x5, x4, 1, 32
	ins	v31.d[1], x0
	mov	w0, 0
	.p2align 5,,15
.L15:
	mov	v29.16b, v31.16b
	add	w0, w0, 1
	add	v31.2d, v31.2d, v30.2d
	cmp	w5, w0
	bne	.L15
	tbz	x4, 0, .L17
	and	x4, x4, -2
	madd	x3, x4, x8, x3
.L14:
	add	x3, x3, x8
.L13:
	cbnz	x1, .L62
.L9:
	mov	x6, 22373
	mov	x0, 0
	movk	x6, 0xad45, lsl 16
	mov	w2, 0
	movk	x6, 0x1, lsl 32
	.p2align 5,,15
.L31:
	lsr	x1, x3, x2
	and	x5, x0, 1
	and	x1, x1, 1
	add	x4, x1, x0
	cmp	x5, x1
	beq	.L63
	add	x4, x4, x6
	add	w2, w2, 1
	lsr	x0, x4, 1
	cmp	w2, 33
	bne	.L31
.L30:
	mov	x3, 22372
	movk	x3, 0xad45, lsl 16
	movk	x3, 0x1, lsl 32
	cmp	x0, x3
	bls	.L1
	mov	x1, -22373
	mov	x2, 16973
	movk	x1, 0x52ba, lsl 16
	movk	x2, 0xe383, lsl 16
	movk	x1, 0xfffe, lsl 32
	movk	x2, 0xc365, lsl 32
	add	x1, x0, x1
	movk	x2, 0x262a, lsl 48
	smulh	x2, x1, x2
	asr	x2, x2, 30
	sub	x2, x2, x1, asr 63
	add	x2, x2, 1
	cmp	x1, x3
	bls	.L33
	adrp	x4, .LC0
	fmov	d31, x0
	ubfx	x3, x2, 1, 32
	ldr	q30, [x4, #:lo12:.LC0]
	ins	v31.d[1], x1
	mov	w1, 0
	.p2align 5,,15
.L34:
	mov	v29.16b, v31.16b
	add	w1, w1, 1
	add	v31.2d, v31.2d, v30.2d
	cmp	w3, w1
	bne	.L34
	tbz	x2, 0, .L36
	mov	x1, -22373
	and	x2, x2, -2
	movk	x1, 0x52ba, lsl 16
	movk	x1, 0xfffe, lsl 32
	madd	x0, x2, x1, x0
.L33:
	mov	x1, -22373
	movk	x1, 0x52ba, lsl 16
	movk	x1, 0xfffe, lsl 32
	add	x0, x0, x1
.L1:
	ret
	.p2align 2,,3
.L63:
	add	x0, x5, x0
	add	w2, w2, 1
	lsr	x0, x0, 1
	cmp	w2, 33
	bne	.L31
	b	.L30
	.p2align 2,,3
.L17:
	adrp	x0, .LC1
	ldr	q31, [x0, #:lo12:.LC1]
	add	v29.2d, v29.2d, v31.2d
	umov	x3, v29.d[1]
	cbz	x1, .L9
.L62:
	mov	x11, x3
	b	.L10
	.p2align 2,,3
.L25:
	adrp	x0, .LC1
	ldr	q31, [x0, #:lo12:.LC1]
	add	v29.2d, v29.2d, v31.2d
	umov	x2, v29.d[1]
	b	.L27
	.p2align 2,,3
.L7:
	adrp	x0, .LC1
	ldr	q31, [x0, #:lo12:.LC1]
	add	v29.2d, v29.2d, v31.2d
	umov	x2, v29.d[1]
	cbnz	x1, .L64
.L38:
	mov	x3, 43163
	movk	x3, 0x52ba, lsl 16
	b	.L9
	.p2align 2,,3
.L36:
	adrp	x0, .LC1
	ldr	q31, [x0, #:lo12:.LC1]
	add	v29.2d, v29.2d, v31.2d
	umov	x0, v29.d[1]
	ret
	.p2align 2,,3
.L39:
	mov	x2, x0
	b	.L27
	.cfi_endproc
.LFE16:
	.size	mod_exp_montgomery.constprop.0, .-mod_exp_montgomery.constprop.0
	.align	2
	.p2align 5,,15
	.global	MMM
	.type	MMM, %function
MMM:
.LFB11:
	.cfi_startproc
	mov	x8, x0
	mov	x0, 0
	cbz	w3, .L74
	mov	w5, 0
	.p2align 5,,15
.L68:
	lsr	x4, x8, x5
	and	x6, x4, 1
	sbfx	x4, x4, 0, 1
	and	x7, x0, 1
	and	x4, x4, x1
	and	x6, x6, x1
	add	x0, x4, x0
	cmp	x6, x7
	add	x4, x0, x2
	add	w5, w5, 1
	csel	x0, x4, x0, ne
	lsr	x0, x0, 1
	cmp	w3, w5
	bne	.L68
	cmp	x2, x0
	bhi	.L75
	.p2align 5,,15
.L70:
	sub	x0, x0, x2
.L74:
	cmp	x2, x0
	bls	.L70
.L75:
	ret
	.cfi_endproc
.LFE11:
	.size	MMM, .-MMM
	.align	2
	.p2align 5,,15
	.global	mod_exp_montgomery
	.type	mod_exp_montgomery, %function
mod_exp_montgomery:
.LFB12:
	.cfi_startproc
	udiv	x6, x0, x2
	msub	x0, x6, x2, x0
	cbz	w3, .L77
	mov	w8, 0
	mov	x6, 0
	.p2align 5,,15
.L79:
	lsr	x7, x0, x8
	and	x9, x7, 1
	sbfx	x7, x7, 0, 1
	and	x10, x6, 1
	and	x7, x5, x7
	and	x9, x5, x9
	add	x6, x7, x6
	cmp	x9, x10
	add	x7, x6, x2
	add	w8, w8, 1
	csel	x6, x7, x6, ne
	lsr	x6, x6, 1
	cmp	w3, w8
	bne	.L79
	cmp	x2, x6
	bhi	.L139
	.p2align 5,,15
.L84:
	sub	x6, x6, x2
	cmp	x2, x6
	bls	.L84
	cbz	x1, .L85
.L81:
	lsr	x0, x1, 1
	tbnz	x1, 0, .L140
	.p2align 5,,15
.L86:
	cbz	w3, .L97
.L95:
	mov	x1, 0
	mov	w7, 0
	.p2align 5,,15
.L99:
	lsr	x5, x6, x7
	and	x8, x5, 1
	sbfx	x5, x5, 0, 1
	and	x9, x1, 1
	and	x5, x6, x5
	and	x8, x6, x8
	add	x1, x5, x1
	cmp	x8, x9
	add	x5, x1, x2
	add	w7, w7, 1
	csel	x1, x5, x1, ne
	lsr	x1, x1, 1
	cmp	w3, w7
	bhi	.L99
	mov	x6, x1
	cmp	x2, x1
	bhi	.L100
	.p2align 5,,15
.L101:
	sub	x6, x6, x2
	cmp	x2, x6
	bls	.L101
.L100:
	and	x1, x0, 1
	lsr	x0, x0, 1
	cbz	x1, .L86
.L102:
	mov	x1, 0
	mov	w7, 0
	.p2align 5,,15
.L89:
	lsr	x5, x4, x7
	and	x8, x5, 1
	sbfx	x5, x5, 0, 1
	and	x9, x1, 1
	and	x5, x6, x5
	and	x8, x6, x8
	add	x1, x5, x1
	cmp	x8, x9
	add	x5, x1, x2
	add	w7, w7, 1
	csel	x1, x5, x1, ne
	lsr	x1, x1, 1
	cmp	w3, w7
	bne	.L89
	cmp	x2, x1
	bhi	.L141
	.p2align 5,,15
.L93:
	sub	x1, x1, x2
	cmp	x2, x1
	bls	.L93
.L141:
	cbnz	x0, .L142
.L82:
	mov	x0, 0
	mov	w5, 0
	.p2align 5,,15
.L106:
	lsr	x4, x1, x5
	and	x6, x0, 1
	and	x4, x4, 1
	add	x7, x4, x0
	cmp	x6, x4
	beq	.L103
	add	x7, x7, x2
	add	w5, w5, 1
	lsr	x0, x7, 1
	cmp	w3, w5
	bhi	.L106
.L105:
	cmp	x2, x0
	bhi	.L76
	.p2align 5,,15
.L107:
	sub	x0, x0, x2
	cmp	x2, x0
	bls	.L107
.L76:
	ret
	.p2align 2,,3
.L140:
	cbnz	w3, .L102
.L108:
	cbz	x0, .L76
	and	x6, x0, 1
	lsr	x0, x0, 1
	cbnz	x6, .L108
	.p2align 5,,15
.L97:
	and	x1, x0, 1
	lsr	x0, x0, 1
	cbnz	x1, .L108
	and	x1, x0, 1
	lsr	x0, x0, 1
	cbz	x1, .L97
	b	.L108
	.p2align 2,,3
.L103:
	add	x6, x6, x0
	add	w5, w5, 1
	lsr	x0, x6, 1
	cmp	w3, w5
	bhi	.L106
	b	.L105
.L142:
	mov	x4, x1
	b	.L95
.L77:
	mov	x6, 0
	cbz	x2, .L84
	cbnz	x1, .L81
.L114:
	mov	x0, 0
	ret
	.p2align 2,,3
.L139:
	cbnz	x1, .L81
	mov	x1, x4
	b	.L82
.L85:
	cbz	w3, .L114
	mov	x1, x4
	b	.L82
	.cfi_endproc
.LFE12:
	.size	mod_exp_montgomery, .-mod_exp_montgomery
	.align	2
	.p2align 5,,15
	.global	pack_chunk
	.type	pack_chunk, %function
pack_chunk:
.LFB13:
	.cfi_startproc
	cmp	w1, 0
	ble	.L146
	mov	x2, x0
	mov	x0, 0
	add	x3, x2, w1, sxtw
	.p2align 5,,15
.L145:
	ldrb	w1, [x2], 1
	orr	x0, x1, x0, lsl 8
	cmp	x3, x2
	bne	.L145
	ret
	.p2align 2,,3
.L146:
	mov	x0, 0
	ret
	.cfi_endproc
.LFE13:
	.size	pack_chunk, .-pack_chunk
	.align	2
	.p2align 5,,15
	.global	unpack_chunk
	.type	unpack_chunk, %function
unpack_chunk:
.LFB14:
	.cfi_startproc
	subs	w2, w2, #1
	bmi	.L148
	sxtw	x2, w2
	.p2align 5,,15
.L150:
	strb	w0, [x1, x2]
	lsr	x0, x0, 8
	sub	x2, x2, #1
	tbz	w2, #31, .L150
.L148:
	ret
	.cfi_endproc
.LFE14:
	.size	unpack_chunk, .-unpack_chunk
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC2:
	.string	"33-bit RSA using Montgomery Multiplication"
	.align	3
.LC3:
	.string	"-----------------------------------------\n"
	.align	3
.LC4:
	.string	"Enter a message: "
	.align	3
.LC5:
	.string	"\n"
	.align	3
.LC6:
	.string	"\nOriginal message: %s\n"
	.align	3
.LC7:
	.string	"Number of chunks: %d\n\n"
	.align	3
.LC8:
	.string	"Chunk %d: plaintext = %lu, ciphertext = %lu\n"
	.align	3
.LC9:
	.string	"\nRecovered message: %s\n\n"
	.align	3
.LC10:
	.string	"PASS: decrypted message matches original message"
	.align	3
.LC11:
	.string	"FAIL: decrypted message does not match original message"
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 5,,15
	.global	main
	.type	main, %function
main:
.LFB15:
	.cfi_startproc
	sub	sp, sp, #1872
	.cfi_def_cfa_offset 1872
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	stp	x29, x30, [sp]
	.cfi_offset 29, -1872
	.cfi_offset 30, -1864
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -1856
	.cfi_offset 20, -1848
	bl	puts
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	puts
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	printf
	add	x20, sp, 80
	adrp	x2, :got:stdin;ldr	x2, [x2, :got_lo12:stdin]
	mov	x0, x20
	mov	w1, 256
	ldr	x2, [x2]
	bl	fgets
	cbz	x0, .L165
	adrp	x1, .LC5
	add	x1, x1, :lo12:.LC5
	mov	x0, x20
	bl	strcspn
	mov	x1, x0
	mov	x0, x20
	strb	wzr, [x20, x1]
	bl	strlen
	cbz	x0, .L154
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -1832
	.cfi_offset 21, -1840
	sub	w21, w0, #1
	mov	x3, x20
	lsr	w21, w21, 2
	add	x22, sp, 336
	add	w8, w21, 2
	str	x25, [sp, 64]
	.cfi_offset 25, -1808
	add	x25, sp, 848
	mov	x2, 1
	mov	w9, 4
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -1816
	.cfi_offset 23, -1824
	.p2align 5,,15
.L156:
	cmp	w0, 4
	add	x6, x25, x2, lsl 3
	add	x4, x22, x2, lsl 2
	ldrb	w1, [x3]
	add	x2, x2, 1
	csel	w5, w0, w9, le
	cmp	w0, 1
	beq	.L155
	ldrb	w7, [x3, 1]
	orr	x1, x7, x1, lsl 8
	cmp	w0, 2
	beq	.L155
	ldrb	w7, [x3, 2]
	orr	x1, x7, x1, lsl 8
	cmp	w0, 3
	beq	.L155
	ldrb	w7, [x3, 3]
	orr	x1, x7, x1, lsl 8
.L155:
	str	x1, [x6, -8]
	sub	w0, w0, #4
	str	w5, [x4, -4]
	add	x3, x3, 4
	cmp	x2, x8
	bne	.L156
	adrp	x24, .LC8
	add	x23, sp, 1360
	add	x24, x24, :lo12:.LC8
	mov	x19, 1
	mov	x1, x20
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	printf
	add	w1, w21, 1
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	printf
	.p2align 5,,15
.L159:
	add	x0, x25, x19, lsl 3
	lsl	x12, x19, 3
	add	x12, x23, x12
	mov	w1, 65537
	ldr	x13, [x0, -8]
	mov	x0, x13
	bl	mod_exp_montgomery.constprop.0
	sub	w1, w19, #1
	mov	x3, x0
	mov	x2, x13
	mov	x0, x24
	add	x19, x19, 1
	str	x3, [x12, -8]
	bl	printf
	sub	w0, w19, #2
	cmp	w0, w21
	blt	.L159
	add	x19, sp, 592
	mov	w13, 0
	mov	x12, 1
	.p2align 5,,15
.L162:
	add	x0, x23, x12, lsl 3
	mov	x1, 24897
	movk	x1, 0x6211, lsl 16
	movk	x1, 0x1, lsl 32
	ldr	x0, [x0, -8]
	bl	mod_exp_montgomery.constprop.0
	add	x1, x22, x12, lsl 2
	add	x2, x19, w13, sxtw
	ldr	w3, [x1, -4]
	subs	w1, w3, #1
	bmi	.L160
	sxtw	x1, w1
	.p2align 5,,15
.L161:
	strb	w0, [x2, x1]
	lsr	x0, x0, 8
	sub	x1, x1, #1
	tbz	w1, #31, .L161
.L160:
	add	x12, x12, 1
	add	w13, w13, w3
	sub	w0, w12, #2
	cmp	w0, w21
	blt	.L162
	ldp	x21, x22, [sp, 32]
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
	ldr	x25, [sp, 64]
	.cfi_restore 25
.L158:
	mov	x1, x19
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	strb	wzr, [x19, w13, sxtw]
	bl	printf
	mov	x1, x19
	mov	x0, x20
	bl	strcmp
	cbnz	w0, .L163
	adrp	x0, .LC10
	add	x0, x0, :lo12:.LC10
	bl	puts
.L164:
	mov	w0, 0
.L152:
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	add	sp, sp, 1872
	.cfi_remember_state
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
.L163:
	.cfi_restore_state
	adrp	x0, .LC11
	add	x0, x0, :lo12:.LC11
	bl	puts
	b	.L164
.L165:
	mov	w0, 1
	b	.L152
.L154:
	mov	x1, x20
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	printf
	adrp	x0, .LC7
	mov	w1, 0
	add	x0, x0, :lo12:.LC7
	bl	printf
	add	x19, sp, 592
	mov	w13, 0
	b	.L158
	.cfi_endproc
.LFE15:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align	4
.LC0:
	.xword	-14403940042
	.xword	-14403940042
	.align	4
.LC1:
	.xword	-7201970021
	.xword	-7201970021
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
