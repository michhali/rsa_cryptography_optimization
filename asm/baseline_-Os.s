	.arch armv8-a
	.file	"rsa_33bit_baseline.c"
	.text
	.align	2
	.global	MMM
	.type	MMM, %function
MMM:
.LFB0:
	.cfi_startproc
	mov	x6, x0
	mov	w5, 0
	mov	x0, 0
.L2:
	cmp	w5, w3
	bne	.L5
.L6:
	cmp	x0, x2
	bcs	.L7
	ret
.L5:
	lsr	x4, x6, x5
	ands	x4, x4, 1
	and	x7, x0, 1
	and	x8, x1, x4
	csel	x4, x4, x1, eq
	cmp	x8, x7
	add	x4, x0, x4
	csel	x7, x2, xzr, ne
	add	x4, x4, x7
	add	w5, w5, 1
	lsr	x0, x4, 1
	b	.L2
.L7:
	sub	x0, x0, x2
	b	.L6
	.cfi_endproc
.LFE0:
	.size	MMM, .-MMM
	.align	2
	.global	mod_exp_montgomery
	.type	mod_exp_montgomery, %function
mod_exp_montgomery:
.LFB1:
	.cfi_startproc
	mov	x9, x4
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x11, x1
	udiv	x4, x0, x2
	mov	x29, sp
	mov	x10, x2
	mov	w12, w3
	mov	x1, x5
	msub	x0, x4, x2, x0
	bl	MMM
	cbz	x11, .L12
.L25:
	mov	x1, x0
	and	x0, x11, 1
	lsr	x11, x11, 1
	cbz	x0, .L13
	mov	x0, x9
	mov	w3, w12
	mov	x2, x10
	bl	MMM
	mov	x9, x0
	cbz	x11, .L12
.L13:
	mov	w3, w12
	mov	x2, x10
	mov	x0, x1
	bl	MMM
	b	.L25
.L12:
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	mov	w3, w12
	mov	x2, x10
	mov	x0, x9
	mov	x1, 1
	b	MMM
	.cfi_endproc
.LFE1:
	.size	mod_exp_montgomery, .-mod_exp_montgomery
	.align	2
	.global	pack_chunk
	.type	pack_chunk, %function
pack_chunk:
.LFB2:
	.cfi_startproc
	mov	x3, x0
	mov	x2, 0
	mov	x0, 0
.L27:
	cmp	w1, w2
	bgt	.L28
	ret
.L28:
	ldrb	w4, [x3, x2]
	add	x2, x2, 1
	orr	x0, x4, x0, lsl 8
	b	.L27
	.cfi_endproc
.LFE2:
	.size	pack_chunk, .-pack_chunk
	.align	2
	.global	unpack_chunk
	.type	unpack_chunk, %function
unpack_chunk:
.LFB3:
	.cfi_startproc
	sub	w2, w2, #1
	sxtw	x2, w2
.L30:
	tbz	w2, #31, .L31
	ret
.L31:
	strb	w0, [x1, x2]
	lsr	x0, x0, 8
	sub	x2, x2, #1
	b	.L30
	.cfi_endproc
.LFE3:
	.size	unpack_chunk, .-unpack_chunk
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"33-bit RSA using Montgomery Multiplication"
.LC1:
	.string	"-----------------------------------------\n"
.LC2:
	.string	"Enter a message: "
.LC3:
	.string	"\n"
.LC4:
	.string	"\nOriginal message: %s\n"
.LC5:
	.string	"Number of chunks: %d\n\n"
.LC6:
	.string	"Chunk %d: plaintext = %lu, ciphertext = %lu\n"
.LC7:
	.string	"\nRecovered message: %s\n\n"
.LC8:
	.string	"PASS: decrypted message matches original message"
.LC9:
	.string	"FAIL: decrypted message does not match original message"
	.section	.text.startup,"ax",@progbits
	.align	2
	.global	main
	.type	main, %function
main:
.LFB4:
	.cfi_startproc
	sub	sp, sp, #1840
	.cfi_def_cfa_offset 1840
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	stp	x29, x30, [sp]
	.cfi_offset 29, -1840
	.cfi_offset 30, -1832
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -1824
	.cfi_offset 20, -1816
	add	x20, sp, 48
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -1808
	.cfi_offset 22, -1800
	bl	puts
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	puts
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
	adrp	x0, :got:stdin;ldr	x0, [x0, :got_lo12:stdin]
	mov	w1, 256
	ldr	x2, [x0]
	mov	x0, x20
	bl	fgets
	cbz	x0, .L42
	adrp	x1, .LC3
	add	x1, x1, :lo12:.LC3
	mov	x0, x20
	bl	strcspn
	strb	wzr, [x20, x0]
	mov	x0, x20
	bl	strlen
	mov	x19, x0
	mov	w6, w0
	add	x8, sp, 816
	add	x9, sp, 304
	mov	x5, 0
	mov	w7, 4
.L34:
	cmp	w6, w5
	bgt	.L35
	add	w19, w19, 3
	adrp	x22, .LC6
	add	x22, x22, :lo12:.LC6
	mov	x21, 0
	mov	x1, x20
	lsr	w19, w19, 2
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	printf
	mov	w1, w19
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	printf
.L36:
	cmp	w19, w21
	bgt	.L37
	add	x21, sp, 560
	mov	x13, 0
	mov	w14, 0
.L38:
	cmp	w19, w13
	sxtw	x15, w14
	bgt	.L39
	mov	x1, x21
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	strb	wzr, [x21, x15]
	bl	printf
	mov	x1, x21
	mov	x0, x20
	bl	strcmp
	cbnz	w0, .L40
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
.L44:
	bl	puts
	mov	w0, 0
.L32:
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	add	sp, sp, 1840
	.cfi_remember_state
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
.L35:
	.cfi_restore_state
	sub	w1, w19, w5
	add	x0, x20, x5
	cmp	w1, 4
	csel	w1, w1, w7, le
	bl	pack_chunk
	str	w1, [x5, x9]
	ubfiz	x2, x5, 1, 32
	add	x5, x5, 4
	str	x0, [x8, x2]
	b	.L34
.L37:
	add	x0, sp, 816
	mov	x2, 22373
	mov	x5, 39658
	mov	x4, 43163
	movk	x2, 0xad45, lsl 16
	movk	x5, 0x5e3e, lsl 16
	ldr	x13, [x0, x21, lsl 3]
	movk	x4, 0x52ba, lsl 16
	mov	w3, 33
	movk	x2, 0x1, lsl 32
	mov	x0, x13
	mov	w1, 65537
	bl	mod_exp_montgomery
	mov	x3, x0
	add	x0, sp, 1328
	mov	w1, w21
	mov	x2, x13
	str	x3, [x0, x21, lsl 3]
	mov	x0, x22
	add	x21, x21, 1
	bl	printf
	b	.L36
.L39:
	add	x0, sp, 1328
	mov	x2, 22373
	mov	x1, 24897
	mov	x5, 39658
	mov	x4, 43163
	movk	x2, 0xad45, lsl 16
	ldr	x0, [x0, x13, lsl 3]
	movk	x1, 0x6211, lsl 16
	mov	w3, 33
	movk	x2, 0x1, lsl 32
	movk	x1, 0x1, lsl 32
	movk	x5, 0x5e3e, lsl 16
	movk	x4, 0x52ba, lsl 16
	bl	mod_exp_montgomery
	add	x1, sp, 304
	ldr	w3, [x1, x13, lsl 2]
	add	x1, x21, x15
	add	x13, x13, 1
	mov	w2, w3
	add	w14, w14, w3
	bl	unpack_chunk
	b	.L38
.L40:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	b	.L44
.L42:
	mov	w0, 1
	b	.L32
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
