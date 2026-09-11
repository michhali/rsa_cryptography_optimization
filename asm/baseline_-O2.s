	.arch armv8-a
	.file	"rsa_33bit_baseline.c"
	.text
	.align	2
	.p2align 5,,15
	.global	MMM
	.type	MMM, %function
MMM:
.LFB11:
	.cfi_startproc
	mov	x8, x0
	mov	x0, 0
	cbz	w3, .L10
	mov	w5, 0
	.p2align 5,,15
.L4:
	lsr	x4, x8, x5
	and	x6, x4, 1
	sbfx	x4, x4, 0, 1
	and	x7, x0, 1
	and	x4, x1, x4
	and	x6, x1, x6
	add	x0, x4, x0
	cmp	x7, x6
	add	x4, x0, x2
	add	w5, w5, 1
	csel	x0, x4, x0, ne
	lsr	x0, x0, 1
	cmp	w3, w5
	bne	.L4
	cmp	x2, x0
	bhi	.L12
	.p2align 5,,15
.L6:
	sub	x0, x0, x2
.L10:
	cmp	x2, x0
	bls	.L6
.L12:
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
	udiv	x10, x0, x2
	mov	x6, 0
	msub	x10, x10, x2, x0
	cbz	w3, .L14
	mov	w7, 0
	.p2align 5,,15
.L16:
	lsr	x0, x10, x7
	and	x8, x0, 1
	sbfx	x0, x0, 0, 1
	and	x9, x6, 1
	and	x0, x5, x0
	and	x8, x5, x8
	add	x6, x0, x6
	cmp	x9, x8
	add	x0, x6, x2
	add	w7, w7, 1
	csel	x6, x0, x6, ne
	lsr	x6, x6, 1
	cmp	w3, w7
	bne	.L16
	cmp	x2, x6
	bhi	.L80
	.p2align 5,,15
.L21:
	sub	x6, x6, x2
	cmp	x2, x6
	bls	.L21
	cbz	x1, .L22
.L18:
	lsr	x0, x1, 1
	tbnz	x1, 0, .L81
	.p2align 5,,15
.L23:
	cbz	w3, .L34
.L32:
	mov	x1, 0
	mov	w7, 0
	.p2align 5,,15
.L36:
	lsr	x5, x6, x7
	and	x8, x5, 1
	sbfx	x5, x5, 0, 1
	and	x9, x1, 1
	and	x5, x5, x6
	and	x8, x8, x6
	add	x1, x5, x1
	cmp	x8, x9
	add	x5, x1, x2
	add	w7, w7, 1
	csel	x1, x5, x1, ne
	lsr	x1, x1, 1
	cmp	w3, w7
	bhi	.L36
	cmp	x2, x1
	bhi	.L82
	.p2align 5,,15
.L38:
	sub	x1, x1, x2
	cmp	x2, x1
	bls	.L38
.L82:
	and	x5, x0, 1
	mov	x6, x1
	lsr	x0, x0, 1
	cbz	x5, .L23
.L39:
	mov	x5, 0
	mov	w7, 0
	.p2align 5,,15
.L26:
	lsr	x6, x4, x7
	and	x8, x6, 1
	sbfx	x6, x6, 0, 1
	and	x9, x5, 1
	and	x6, x6, x1
	and	x8, x8, x1
	add	x5, x6, x5
	cmp	x9, x8
	add	x6, x5, x2
	add	w7, w7, 1
	csel	x5, x6, x5, ne
	lsr	x5, x5, 1
	cmp	w3, w7
	bne	.L26
	cmp	x2, x5
	bhi	.L83
	.p2align 5,,15
.L30:
	sub	x5, x5, x2
	cmp	x2, x5
	bls	.L30
.L83:
	mov	x6, x1
	mov	x4, x5
	cbnz	x0, .L32
.L19:
	mov	x0, 0
	mov	w5, 0
	.p2align 5,,15
.L41:
	and	x6, x0, 1
	lsr	x1, x4, x5
	and	x1, x1, 1
	add	w5, w5, 1
	cmp	x6, x1
	add	x1, x1, x0
	csel	x0, x2, xzr, ne
	add	x1, x1, x0
	lsr	x0, x1, 1
	cmp	w3, w5
	bhi	.L41
	cmp	x2, x0
	bhi	.L13
	.p2align 5,,15
.L42:
	sub	x0, x0, x2
	cmp	x2, x0
	bls	.L42
.L13:
	ret
	.p2align 2,,3
.L34:
	and	x1, x0, 1
	lsr	x0, x0, 1
	cbz	x1, .L34
.L43:
	cbz	x0, .L13
	lsr	x1, x0, 1
	tbnz	x0, 0, .L28
	lsr	x0, x0, 2
	tbz	x1, 0, .L34
	mov	x1, x0
.L28:
	mov	x0, x1
	b	.L43
.L22:
	cbnz	w3, .L19
	mov	x0, 0
.L84:
	ret
.L81:
	cbz	w3, .L43
	mov	x1, x6
	b	.L39
.L14:
	cbz	x2, .L21
	cbnz	x1, .L18
	mov	x0, 0
	b	.L84
	.p2align 2,,3
.L80:
	cbnz	x1, .L18
	b	.L19
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
	ble	.L88
	mov	x2, x0
	mov	x0, 0
	add	x3, x2, w1, sxtw
	.p2align 5,,15
.L87:
	ldrb	w1, [x2], 1
	orr	x0, x1, x0, lsl 8
	cmp	x3, x2
	bne	.L87
	ret
	.p2align 2,,3
.L88:
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
	bmi	.L90
	sxtw	x2, w2
	.p2align 5,,15
.L92:
	strb	w0, [x1, x2]
	lsr	x0, x0, 8
	sub	x2, x2, #1
	tbz	w2, #31, .L92
.L90:
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
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -1840
	.cfi_offset 22, -1832
	bl	puts
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	puts
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
	add	x21, sp, 80
	adrp	x2, :got:stdin;ldr	x2, [x2, :got_lo12:stdin]
	mov	x0, x21
	mov	w1, 256
	ldr	x2, [x2]
	bl	fgets
	cbz	x0, .L107
	adrp	x1, .LC3
	add	x1, x1, :lo12:.LC3
	mov	x0, x21
	bl	strcspn
	mov	x1, x0
	mov	x0, x21
	strb	wzr, [x21, x1]
	bl	strlen
	mov	x6, x0
	cbz	x0, .L96
	stp	x19, x20, [sp, 16]
	.cfi_offset 20, -1848
	.cfi_offset 19, -1856
	sub	w19, w0, #1
	mov	x3, x21
	lsr	w19, w19, 2
	add	x20, sp, 336
	add	w7, w19, 2
	str	x25, [sp, 64]
	.cfi_offset 25, -1808
	add	x25, sp, 848
	mov	x5, 1
	mov	w8, 4
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -1816
	.cfi_offset 23, -1824
	.p2align 5,,15
.L98:
	cmp	w6, 4
	csel	w4, w6, w8, le
	mov	x0, 0
	mov	x1, 0
	.p2align 5,,15
.L97:
	ldrb	w2, [x3, x0]
	add	x0, x0, 1
	orr	x1, x2, x1, lsl 8
	cmp	w4, w0
	bgt	.L97
	add	x2, x25, x5, lsl 3
	add	x0, x20, x5, lsl 2
	add	x5, x5, 1
	sub	w6, w6, #4
	add	x3, x3, 4
	str	x1, [x2, -8]
	str	w4, [x0, -4]
	cmp	x5, x7
	bne	.L98
	add	x23, sp, 1360
	mov	x22, 1
	adrp	x24, .LC6
	mov	x1, x21
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	printf
	add	w1, w19, 1
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	printf
	.p2align 5,,15
.L101:
	add	x0, x25, x22, lsl 3
	lsl	x11, x22, 3
	add	x11, x23, x11
	mov	x5, 39658
	mov	x4, 43163
	mov	x2, 22373
	ldr	x12, [x0, -8]
	movk	x5, 0x5e3e, lsl 16
	movk	x4, 0x52ba, lsl 16
	movk	x2, 0xad45, lsl 16
	mov	x0, x12
	mov	w3, 33
	movk	x2, 0x1, lsl 32
	mov	w1, 65537
	bl	mod_exp_montgomery
	mov	x2, x12
	mov	x3, x0
	sub	w1, w22, #1
	add	x0, x24, :lo12:.LC6
	add	x22, x22, 1
	str	x3, [x11, -8]
	bl	printf
	sub	w0, w22, #2
	cmp	w19, w0
	bgt	.L101
	add	x22, sp, 592
	mov	w12, 0
	mov	x11, 1
	.p2align 5,,15
.L104:
	add	x0, x23, x11, lsl 3
	mov	x2, 22373
	mov	x1, 24897
	mov	x5, 39658
	mov	x4, 43163
	movk	x2, 0xad45, lsl 16
	ldr	x0, [x0, -8]
	movk	x1, 0x6211, lsl 16
	mov	w3, 33
	movk	x2, 0x1, lsl 32
	movk	x1, 0x1, lsl 32
	movk	x5, 0x5e3e, lsl 16
	movk	x4, 0x52ba, lsl 16
	bl	mod_exp_montgomery
	add	x1, x20, x11, lsl 2
	add	x2, x22, w12, sxtw
	ldr	w3, [x1, -4]
	subs	w1, w3, #1
	bmi	.L102
	sxtw	x1, w1
	.p2align 5,,15
.L103:
	strb	w0, [x2, x1]
	lsr	x0, x0, 8
	sub	x1, x1, #1
	tbz	w1, #31, .L103
.L102:
	add	x11, x11, 1
	add	w12, w12, w3
	sub	w0, w11, #2
	cmp	w0, w19
	blt	.L104
	ldp	x19, x20, [sp, 16]
	.cfi_restore 20
	.cfi_restore 19
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
	ldr	x25, [sp, 64]
	.cfi_restore 25
.L100:
	mov	x1, x22
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	strb	wzr, [x22, w12, sxtw]
	bl	printf
	mov	x1, x22
	mov	x0, x21
	bl	strcmp
	cbnz	w0, .L105
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	bl	puts
.L106:
	mov	w0, 0
.L94:
	ldp	x29, x30, [sp]
	ldp	x21, x22, [sp, 32]
	add	sp, sp, 1872
	.cfi_remember_state
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
.L105:
	.cfi_restore_state
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	puts
	b	.L106
.L107:
	mov	w0, 1
	b	.L94
.L96:
	mov	x1, x21
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	printf
	adrp	x0, .LC5
	mov	w1, 0
	add	x0, x0, :lo12:.LC5
	bl	printf
	add	x22, sp, 592
	mov	w12, 0
	b	.L100
	.cfi_endproc
.LFE15:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
