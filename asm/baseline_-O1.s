	.arch armv8-a
	.file	"rsa_33bit_baseline.c"
	.text
	.align	2
	.global	MMM
	.type	MMM, %function
MMM:
.LFB11:
	.cfi_startproc
	mov	x8, x0
	cbz	w3, .L8
	mov	x0, 0
	mov	w5, 0
	mov	x9, 0
.L5:
	lsr	x4, x8, x5
	ands	x4, x4, 1
	and	x6, x0, 1
	and	x7, x1, x4
	csel	x4, x4, x1, eq
	cmp	x7, x6
	csel	x6, x2, x9, ne
	add	x4, x4, x0
	add	x4, x4, x6
	lsr	x0, x4, 1
	add	w5, w5, 1
	cmp	w3, w5
	bne	.L5
.L2:
	cmp	x2, x0
	bhi	.L1
.L7:
	sub	x0, x0, x2
	cmp	x2, x0
	bls	.L7
.L1:
	ret
.L8:
	mov	x0, 0
	b	.L2
	.cfi_endproc
.LFE11:
	.size	MMM, .-MMM
	.align	2
	.global	mod_exp_montgomery
	.type	mod_exp_montgomery, %function
mod_exp_montgomery:
.LFB12:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	.cfi_offset 23, -16
	mov	x20, x1
	mov	x21, x2
	mov	w23, w3
	mov	x22, x4
	mov	x1, x5
	udiv	x4, x0, x2
	msub	x0, x4, x2, x0
	bl	MMM
	mov	x19, x0
	cbnz	x20, .L15
.L13:
	mov	w3, w23
	mov	x2, x21
	mov	x1, 1
	mov	x0, x22
	bl	MMM
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L19:
	.cfi_restore_state
	mov	w3, w23
	mov	x2, x21
	mov	x1, x19
	mov	x0, x22
	bl	MMM
	mov	x22, x0
	lsr	x20, x20, 1
	cbz	x20, .L13
.L16:
	mov	w3, w23
	mov	x2, x21
	mov	x1, x19
	mov	x0, x19
	bl	MMM
	mov	x19, x0
.L15:
	tbnz	x20, 0, .L19
	lsr	x20, x20, 1
	b	.L16
	.cfi_endproc
.LFE12:
	.size	mod_exp_montgomery, .-mod_exp_montgomery
	.align	2
	.global	pack_chunk
	.type	pack_chunk, %function
pack_chunk:
.LFB13:
	.cfi_startproc
	cmp	w1, 0
	ble	.L23
	mov	x2, x0
	add	x3, x0, w1, sxtw
	mov	x0, 0
.L22:
	ldrb	w1, [x2], 1
	orr	x0, x1, x0, lsl 8
	cmp	x2, x3
	bne	.L22
.L20:
	ret
.L23:
	mov	x0, 0
	b	.L20
	.cfi_endproc
.LFE13:
	.size	pack_chunk, .-pack_chunk
	.align	2
	.global	unpack_chunk
	.type	unpack_chunk, %function
unpack_chunk:
.LFB14:
	.cfi_startproc
	subs	w2, w2, #1
	bmi	.L25
	sxtw	x2, w2
.L27:
	strb	w0, [x1, x2]
	lsr	x0, x0, 8
	sub	x2, x2, #1
	tbz	w2, #31, .L27
.L25:
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
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB15:
	.cfi_startproc
	sub	sp, sp, #1888
	.cfi_def_cfa_offset 1888
	stp	x29, x30, [sp]
	.cfi_offset 29, -1888
	.cfi_offset 30, -1880
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -1872
	.cfi_offset 20, -1864
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	puts
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	puts
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
	adrp	x0, :got:stdin;ldr	x0, [x0, :got_lo12:stdin]
	ldr	x2, [x0]
	mov	w1, 256
	add	x0, sp, 1632
	bl	fgets
	cbz	x0, .L37
	add	x19, sp, 1632
	adrp	x1, .LC3
	add	x1, x1, :lo12:.LC3
	mov	x0, x19
	bl	strcspn
	strb	wzr, [x19, x0]
	mov	x0, x19
	bl	strlen
	cmp	w0, 0
	ble	.L31
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -1848
	.cfi_offset 21, -1856
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -1832
	.cfi_offset 23, -1840
	stp	x25, x26, [sp, 64]
	.cfi_offset 26, -1816
	.cfi_offset 25, -1824
	str	x27, [sp, 80]
	.cfi_offset 27, -1808
	mov	w20, w0
	mov	x22, x19
	sub	w0, w0, #1
	lsr	w21, w0, 2
	add	w24, w21, 2
	uxtw	x24, w24
	mov	x19, 1
	mov	w27, 4
	add	x26, sp, 1120
	add	x25, sp, 352
.L32:
	cmp	w20, 4
	csel	w23, w20, w27, le
	mov	w1, w23
	mov	x0, x22
	bl	pack_chunk
	add	x1, x26, x19, lsl 3
	str	x0, [x1, -8]
	add	x0, x25, x19, lsl 2
	str	w23, [x0, -4]
	add	x19, x19, 1
	sub	w20, w20, #4
	add	x22, x22, 4
	cmp	x19, x24
	bne	.L32
	add	x1, sp, 1632
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	printf
	add	w1, w21, 1
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	printf
	mov	x19, 1
	add	x27, sp, 1120
	mov	x26, 39658
	movk	x26, 0x5e3e, lsl 16
	mov	x25, 43163
	movk	x25, 0x52ba, lsl 16
	mov	x24, 22373
	movk	x24, 0xad45, lsl 16
	movk	x24, 0x1, lsl 32
	adrp	x23, .LC6
	add	x23, x23, :lo12:.LC6
.L33:
	lsl	x20, x19, 3
	add	x0, x27, x19, lsl 3
	ldr	x22, [x0, -8]
	mov	x5, x26
	mov	x4, x25
	mov	w3, 33
	mov	x2, x24
	mov	w1, 65537
	mov	x0, x22
	bl	mod_exp_montgomery
	mov	x3, x0
	add	x0, sp, 608
	add	x20, x20, x0
	str	x3, [x20, -8]
	mov	x2, x22
	sub	w1, w19, #1
	mov	x0, x23
	bl	printf
	add	x19, x19, 1
	sub	w0, w19, #2
	cmp	w21, w0
	bgt	.L33
	mov	x19, 1
	mov	w20, 0
	mov	x26, 39658
	movk	x26, 0x5e3e, lsl 16
	mov	x25, 43163
	movk	x25, 0x52ba, lsl 16
	mov	x24, 22373
	movk	x24, 0xad45, lsl 16
	movk	x24, 0x1, lsl 32
	mov	x23, 24897
	movk	x23, 0x6211, lsl 16
	movk	x23, 0x1, lsl 32
	add	x22, sp, 608
.L34:
	add	x0, x22, x19, lsl 3
	mov	x5, x26
	mov	x4, x25
	mov	w3, 33
	mov	x2, x24
	mov	x1, x23
	ldr	x0, [x0, -8]
	bl	mod_exp_montgomery
	add	x1, sp, 352
	add	x1, x1, x19, lsl 2
	ldr	w27, [x1, -4]
	mov	w2, w27
	add	x1, sp, 96
	add	x1, x1, w20, sxtw
	bl	unpack_chunk
	add	w20, w20, w27
	add	x19, x19, 1
	sub	w0, w19, #2
	cmp	w21, w0
	bgt	.L34
	ldp	x21, x22, [sp, 32]
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
	ldp	x25, x26, [sp, 64]
	.cfi_restore 26
	.cfi_restore 25
	ldr	x27, [sp, 80]
	.cfi_restore 27
.L36:
	add	x19, sp, 96
	strb	wzr, [x19, w20, sxtw]
	mov	x1, x19
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	printf
	mov	x1, x19
	add	x0, sp, 1632
	bl	strcmp
	mov	w19, w0
	cbnz	w0, .L35
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	bl	puts
.L29:
	mov	w0, w19
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	add	sp, sp, 1888
	.cfi_remember_state
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
.L35:
	.cfi_restore_state
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	puts
	mov	w19, 0
	b	.L29
.L37:
	mov	w19, 1
	b	.L29
.L31:
	add	x1, sp, 1632
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	printf
	mov	w1, 0
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	printf
	mov	w20, 0
	b	.L36
	.cfi_endproc
.LFE15:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
