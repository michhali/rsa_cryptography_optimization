	.arch armv8-a
	.file	"rsa_33bit_opt.c"
	.text
	.align	2
	.p2align 5,,15
	.type	mod_exp_montgomery.constprop.0, %function
mod_exp_montgomery.constprop.0:
.LFB16:
	.cfi_startproc
	mov	x3, 22373
	mov	w7, 39658
	movk	x3, 0xad45, lsl 16
	mov	x2, 0
	movk	x3, 0x1, lsl 32
	mov	w6, 33
	movk	w7, 0x5e3e, lsl 16
	udiv	x4, x0, x3
	msub	x0, x4, x3, x0
	.p2align 5,,15
.L2:
	sbfx	x5, x2, 0, 1
	and	x4, x0, 1
	and	x5, x5, x3
	subs	w6, w6, #1
	lsr	x0, x0, 1
	umaddl	x4, w4, w7, x5
	add	x2, x4, x2
	lsr	x2, x2, 1
	bne	.L2
	sub	x2, x2, x3
	mov	x4, 43163
	movk	x4, 0x52ba, lsl 16
	and	x3, x3, x2, asr 63
	add	x3, x3, x2
	cbz	x1, .L3
	mov	x8, 22373
	and	x0, x1, 1
	movk	x8, 0xad45, lsl 16
	lsr	x1, x1, 1
	movk	x8, 0x1, lsl 32
	cbnz	x0, .L21
	.p2align 5,,15
.L4:
	mov	x7, x3
	mov	x5, 0
	mov	w6, 33
	.p2align 5,,15
.L6:
	and	x2, x7, 1
	and	x0, x5, 1
	and	x9, x2, x3
	neg	x2, x2
	eor	x0, x0, x9
	and	x2, x2, x3
	neg	x0, x0
	add	x2, x2, x5
	and	x0, x0, x8
	subs	w6, w6, #1
	add	x0, x0, x2
	lsr	x7, x7, 1
	lsr	x5, x0, 1
	bne	.L6
	sub	x5, x5, x8
	and	x0, x1, 1
	lsr	x1, x1, 1
	and	x3, x8, x5, asr 63
	add	x3, x3, x5
	cbz	x0, .L4
.L21:
	mov	x5, 0
	mov	w6, 33
	.p2align 5,,15
.L5:
	and	x2, x4, 1
	and	x0, x5, 1
	and	x7, x2, x3
	neg	x2, x2
	eor	x0, x0, x7
	and	x2, x2, x3
	neg	x0, x0
	add	x2, x2, x5
	and	x0, x0, x8
	subs	w6, w6, #1
	add	x0, x0, x2
	lsr	x4, x4, 1
	lsr	x5, x0, 1
	bne	.L5
	sub	x5, x5, x8
	and	x4, x8, x5, asr 63
	add	x4, x4, x5
	cbnz	x1, .L4
.L3:
	mov	x5, 22373
	mov	x0, 0
	movk	x5, 0xad45, lsl 16
	mov	w3, 33
	movk	x5, 0x1, lsl 32
	.p2align 5,,15
.L8:
	eor	x1, x4, x0
	and	x2, x4, 1
	add	x2, x2, x0
	subs	w3, w3, #1
	sbfx	x1, x1, 0, 1
	lsr	x4, x4, 1
	and	x1, x1, x5
	add	x1, x1, x2
	lsr	x0, x1, 1
	bne	.L8
	sub	x0, x0, x5
	and	x5, x5, x0, asr 63
	add	x0, x5, x0
	ret
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
	mov	x6, 0
	cbz	w3, .L23
	mov	w7, 0
	.p2align 5,,15
.L24:
	and	x5, x0, 1
	and	x4, x6, 1
	and	x8, x1, x5
	neg	x5, x5
	eor	x4, x4, x8
	and	x5, x1, x5
	neg	x4, x4
	add	x5, x5, x6
	and	x4, x4, x2
	add	w7, w7, 1
	add	x4, x4, x5
	lsr	x0, x0, 1
	lsr	x6, x4, 1
	cmp	w3, w7
	bne	.L24
.L23:
	sub	x6, x6, x2
	and	x0, x2, x6, asr 63
	add	x0, x0, x6
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
	cbz	w3, .L28
	mov	w9, 0
	mov	x8, 0
	.p2align 5,,15
.L29:
	and	x7, x0, 1
	and	x6, x8, 1
	and	x10, x5, x7
	neg	x7, x7
	eor	x6, x6, x10
	and	x7, x5, x7
	neg	x6, x6
	add	x7, x7, x8
	and	x6, x6, x2
	add	w9, w9, 1
	add	x6, x6, x7
	lsr	x0, x0, 1
	lsr	x8, x6, 1
	cmp	w3, w9
	bne	.L29
	sub	x8, x8, x2
	and	x0, x2, x8, asr 63
	add	x0, x0, x8
	cbz	x1, .L33
.L31:
	lsr	x9, x1, 1
	tbnz	x1, 0, .L67
	cbz	w3, .L38
	.p2align 5,,15
.L40:
	mov	x7, x0
	mov	w8, 0
	mov	x6, 0
	.p2align 5,,15
.L44:
	and	x5, x7, 1
	and	x1, x6, 1
	and	x10, x5, x0
	neg	x5, x5
	eor	x1, x1, x10
	and	x5, x5, x0
	neg	x1, x1
	add	x5, x5, x6
	and	x1, x1, x2
	add	w8, w8, 1
	add	x1, x1, x5
	lsr	x7, x7, 1
	lsr	x6, x1, 1
	cmp	w3, w8
	bne	.L44
	sub	x6, x6, x2
	and	x1, x9, 1
	lsr	x9, x9, 1
	and	x0, x2, x6, asr 63
	add	x0, x0, x6
	cbz	x1, .L40
.L45:
	mov	w7, 0
	mov	x6, 0
	.p2align 5,,15
.L36:
	and	x5, x4, 1
	and	x1, x6, 1
	and	x8, x5, x0
	neg	x5, x5
	eor	x1, x1, x8
	and	x5, x5, x0
	neg	x1, x1
	add	x5, x5, x6
	and	x1, x1, x2
	add	w7, w7, 1
	add	x1, x1, x5
	lsr	x4, x4, 1
	lsr	x6, x1, 1
	cmp	w3, w7
	bne	.L36
	sub	x6, x6, x2
	and	x4, x2, x6, asr 63
	add	x4, x4, x6
	cbnz	x9, .L40
.L33:
	mov	w6, 0
	mov	x5, 0
	.p2align 5,,15
.L47:
	eor	x0, x4, x5
	and	x1, x4, 1
	add	x1, x1, x5
	add	w6, w6, 1
	sbfx	x0, x0, 0, 1
	lsr	x4, x4, 1
	and	x0, x0, x2
	add	x0, x0, x1
	lsr	x5, x0, 1
	cmp	w3, w6
	bne	.L47
	sub	x5, x5, x2
	and	x0, x2, x5, asr 63
	add	x0, x0, x5
.L27:
	ret
	.p2align 2,,3
.L67:
	cbnz	w3, .L45
.L46:
	neg	x0, x2
	and	x0, x2, x0, asr 63
	sub	x0, x0, x2
	cbz	x9, .L27
.L38:
	and	x0, x9, 1
	lsr	x9, x9, 1
	cbnz	x0, .L46
	and	x0, x9, 1
	lsr	x9, x9, 1
	cbz	x0, .L38
	b	.L46
.L28:
	neg	x0, x2
	and	x0, x2, x0, asr 63
	sub	x0, x0, x2
	cbnz	x1, .L31
	ret
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
	ble	.L71
	mov	x2, x0
	mov	x0, 0
	add	x3, x2, w1, sxtw
	.p2align 5,,15
.L70:
	ldrb	w1, [x2], 1
	orr	x0, x1, x0, lsl 8
	cmp	x3, x2
	bne	.L70
	ret
	.p2align 2,,3
.L71:
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
	bmi	.L73
	sxtw	x2, w2
	.p2align 5,,15
.L75:
	strb	w0, [x1, x2]
	lsr	x0, x0, 8
	sub	x2, x2, #1
	tbz	w2, #31, .L75
.L73:
	ret
	.cfi_endproc
.LFE14:
	.size	unpack_chunk, .-unpack_chunk
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"33-bit RSA using Montgomery Multiplication"
	.align	3
.LC1:
	.string	"-----------------------------------------\n"
	.align	3
.LC2:
	.string	"Enter a message: "
	.align	3
.LC3:
	.string	"\n"
	.align	3
.LC4:
	.string	"\nOriginal message: %s\n"
	.align	3
.LC5:
	.string	"Number of chunks: %d\n\n"
	.align	3
.LC6:
	.string	"Chunk %d: plaintext = %lu, ciphertext = %lu\n"
	.align	3
.LC7:
	.string	"\nRecovered message: %s\n\n"
	.align	3
.LC8:
	.string	"PASS: decrypted message matches original message"
	.align	3
.LC9:
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
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	stp	x29, x30, [sp]
	.cfi_offset 29, -1872
	.cfi_offset 30, -1864
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -1856
	.cfi_offset 20, -1848
	bl	puts
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	puts
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
	add	x20, sp, 80
	adrp	x2, :got:stdin;ldr	x2, [x2, :got_lo12:stdin]
	mov	x0, x20
	mov	w1, 256
	ldr	x2, [x2]
	bl	fgets
	cbz	x0, .L90
	adrp	x1, .LC3
	add	x1, x1, :lo12:.LC3
	mov	x0, x20
	bl	strcspn
	mov	x1, x0
	mov	x0, x20
	strb	wzr, [x20, x1]
	bl	strlen
	cbz	x0, .L79
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
.L81:
	cmp	w0, 4
	add	x6, x25, x2, lsl 3
	add	x4, x22, x2, lsl 2
	ldrb	w1, [x3]
	add	x2, x2, 1
	csel	w5, w0, w9, le
	cmp	w0, 1
	beq	.L80
	ldrb	w7, [x3, 1]
	orr	x1, x7, x1, lsl 8
	cmp	w0, 2
	beq	.L80
	ldrb	w7, [x3, 2]
	orr	x1, x7, x1, lsl 8
	cmp	w0, 3
	beq	.L80
	ldrb	w7, [x3, 3]
	orr	x1, x7, x1, lsl 8
.L80:
	str	x1, [x6, -8]
	sub	w0, w0, #4
	str	w5, [x4, -4]
	add	x3, x3, 4
	cmp	x2, x8
	bne	.L81
	adrp	x24, .LC6
	add	x23, sp, 1360
	add	x24, x24, :lo12:.LC6
	mov	x19, 1
	mov	x1, x20
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	printf
	add	w1, w21, 1
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	printf
	.p2align 5,,15
.L84:
	add	x0, x25, x19, lsl 3
	lsl	x10, x19, 3
	add	x10, x23, x10
	mov	w1, 65537
	ldr	x11, [x0, -8]
	mov	x0, x11
	bl	mod_exp_montgomery.constprop.0
	sub	w1, w19, #1
	mov	x3, x0
	mov	x2, x11
	mov	x0, x24
	add	x19, x19, 1
	str	x3, [x10, -8]
	bl	printf
	sub	w0, w19, #2
	cmp	w0, w21
	blt	.L84
	add	x19, sp, 592
	mov	w11, 0
	mov	x10, 1
	.p2align 5,,15
.L87:
	add	x0, x23, x10, lsl 3
	mov	x1, 24897
	movk	x1, 0x6211, lsl 16
	movk	x1, 0x1, lsl 32
	ldr	x0, [x0, -8]
	bl	mod_exp_montgomery.constprop.0
	add	x1, x22, x10, lsl 2
	add	x2, x19, w11, sxtw
	ldr	w3, [x1, -4]
	subs	w1, w3, #1
	bmi	.L85
	sxtw	x1, w1
	.p2align 5,,15
.L86:
	strb	w0, [x2, x1]
	lsr	x0, x0, 8
	sub	x1, x1, #1
	tbz	w1, #31, .L86
.L85:
	add	x10, x10, 1
	add	w11, w11, w3
	sub	w0, w10, #2
	cmp	w0, w21
	blt	.L87
	ldp	x21, x22, [sp, 32]
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
	ldr	x25, [sp, 64]
	.cfi_restore 25
.L83:
	mov	x1, x19
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	strb	wzr, [x19, w11, sxtw]
	bl	printf
	mov	x1, x19
	mov	x0, x20
	bl	strcmp
	cbnz	w0, .L88
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	bl	puts
.L89:
	mov	w0, 0
.L77:
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
.L88:
	.cfi_restore_state
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	puts
	b	.L89
.L90:
	mov	w0, 1
	b	.L77
.L79:
	mov	x1, x20
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	printf
	adrp	x0, .LC5
	mov	w1, 0
	add	x0, x0, :lo12:.LC5
	bl	printf
	add	x19, sp, 592
	mov	w11, 0
	b	.L83
	.cfi_endproc
.LFE15:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
