	.arch armv8-a
	.file	"rsa_33bit_opt.c"
	.text
	.align	2
	.global	MMM
	.type	MMM, %function
MMM:
.LFB0:
	.cfi_startproc
	sub	sp, sp, #96
	.cfi_def_cfa_offset 96
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	str	x2, [sp, 8]
	str	w3, [sp, 4]
	str	xzr, [sp, 80]
	ldr	x0, [sp, 16]
	and	x0, x0, 1
	str	x0, [sp, 72]
	str	wzr, [sp, 92]
	b	.L2
.L3:
	ldr	x0, [sp, 24]
	and	x0, x0, 1
	str	x0, [sp, 48]
	ldr	x0, [sp, 80]
	and	x1, x0, 1
	ldr	x2, [sp, 48]
	ldr	x0, [sp, 72]
	and	x0, x2, x0
	eor	x0, x1, x0
	str	x0, [sp, 40]
	ldr	x0, [sp, 48]
	neg	x1, x0
	ldr	x0, [sp, 16]
	and	x1, x1, x0
	ldr	x0, [sp, 80]
	add	x1, x1, x0
	ldr	x0, [sp, 40]
	neg	x2, x0
	ldr	x0, [sp, 8]
	and	x0, x2, x0
	add	x0, x1, x0
	lsr	x0, x0, 1
	str	x0, [sp, 80]
	ldr	x0, [sp, 24]
	lsr	x0, x0, 1
	str	x0, [sp, 24]
	ldr	w0, [sp, 92]
	add	w0, w0, 1
	str	w0, [sp, 92]
.L2:
	ldr	w1, [sp, 92]
	ldr	w0, [sp, 4]
	cmp	w1, w0
	bcc	.L3
	ldr	x1, [sp, 80]
	ldr	x0, [sp, 8]
	sub	x0, x1, x0
	str	x0, [sp, 64]
	ldr	x0, [sp, 64]
	asr	x0, x0, 63
	str	x0, [sp, 56]
	ldr	x1, [sp, 8]
	ldr	x0, [sp, 56]
	and	x1, x1, x0
	ldr	x0, [sp, 64]
	add	x0, x1, x0
	add	sp, sp, 96
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	MMM, .-MMM
	.align	2
	.global	mod_exp_montgomery
	.type	mod_exp_montgomery, %function
mod_exp_montgomery:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	str	x0, [sp, 56]
	str	x1, [sp, 48]
	str	x2, [sp, 40]
	str	w3, [sp, 36]
	str	x4, [sp, 24]
	str	x5, [sp, 16]
	ldr	x0, [sp, 56]
	ldr	x1, [sp, 40]
	udiv	x2, x0, x1
	ldr	x1, [sp, 40]
	mul	x1, x2, x1
	sub	x0, x0, x1
	str	x0, [sp, 56]
	ldr	w3, [sp, 36]
	ldr	x2, [sp, 40]
	ldr	x1, [sp, 16]
	ldr	x0, [sp, 56]
	bl	MMM
	str	x0, [sp, 72]
	ldr	x0, [sp, 24]
	str	x0, [sp, 64]
	b	.L6
.L8:
	ldr	x0, [sp, 48]
	and	x0, x0, 1
	cmp	x0, 0
	beq	.L7
	ldr	w3, [sp, 36]
	ldr	x2, [sp, 40]
	ldr	x1, [sp, 72]
	ldr	x0, [sp, 64]
	bl	MMM
	str	x0, [sp, 64]
.L7:
	ldr	x0, [sp, 48]
	lsr	x0, x0, 1
	str	x0, [sp, 48]
	ldr	x0, [sp, 48]
	cmp	x0, 0
	beq	.L6
	ldr	w3, [sp, 36]
	ldr	x2, [sp, 40]
	ldr	x1, [sp, 72]
	ldr	x0, [sp, 72]
	bl	MMM
	str	x0, [sp, 72]
.L6:
	ldr	x0, [sp, 48]
	cmp	x0, 0
	bne	.L8
	ldr	w3, [sp, 36]
	ldr	x2, [sp, 40]
	mov	x1, 1
	ldr	x0, [sp, 64]
	bl	MMM
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	mod_exp_montgomery, .-mod_exp_montgomery
	.align	2
	.global	pack_chunk
	.type	pack_chunk, %function
pack_chunk:
.LFB2:
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, 8]
	str	w1, [sp, 4]
	str	xzr, [sp, 24]
	str	wzr, [sp, 20]
	b	.L11
.L12:
	ldr	x0, [sp, 24]
	lsl	x1, x0, 8
	ldrsw	x0, [sp, 20]
	ldr	x2, [sp, 8]
	add	x0, x2, x0
	ldrb	w0, [x0]
	and	x0, x0, 255
	orr	x0, x1, x0
	str	x0, [sp, 24]
	ldr	w0, [sp, 20]
	add	w0, w0, 1
	str	w0, [sp, 20]
.L11:
	ldr	w1, [sp, 20]
	ldr	w0, [sp, 4]
	cmp	w1, w0
	blt	.L12
	ldr	x0, [sp, 24]
	add	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2:
	.size	pack_chunk, .-pack_chunk
	.align	2
	.global	unpack_chunk
	.type	unpack_chunk, %function
unpack_chunk:
.LFB3:
	.cfi_startproc
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	str	w2, [sp, 12]
	ldr	w0, [sp, 12]
	sub	w0, w0, #1
	str	w0, [sp, 44]
	b	.L15
.L16:
	ldrsw	x0, [sp, 44]
	ldr	x1, [sp, 16]
	add	x0, x1, x0
	ldr	x1, [sp, 24]
	and	w1, w1, 255
	strb	w1, [x0]
	ldr	x0, [sp, 24]
	lsr	x0, x0, 8
	str	x0, [sp, 24]
	ldr	w0, [sp, 44]
	sub	w0, w0, #1
	str	w0, [sp, 44]
.L15:
	ldr	w0, [sp, 44]
	cmp	w0, 0
	bge	.L16
	nop
	nop
	add	sp, sp, 48
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3:
	.size	unpack_chunk, .-unpack_chunk
	.section	.rodata
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
.LFB4:
	.cfi_startproc
	sub	sp, sp, #2432
	.cfi_def_cfa_offset 2432
	stp	x29, x30, [sp]
	.cfi_offset 29, -2432
	.cfi_offset 30, -2424
	mov	x29, sp
	mov	x0, 14485
	movk	x0, 0x1, lsl 16
	str	x0, [sp, 2400]
	mov	x0, 24465
	movk	x0, 0x1, lsl 16
	str	x0, [sp, 2392]
	mov	x0, 22373
	movk	x0, 0xad45, lsl 16
	movk	x0, 0x1, lsl 32
	str	x0, [sp, 2384]
	mov	w0, 65537
	str	x0, [sp, 2376]
	mov	x0, 24897
	movk	x0, 0x6211, lsl 16
	movk	x0, 0x1, lsl 32
	str	x0, [sp, 2368]
	mov	w0, 33
	str	w0, [sp, 2364]
	mov	x0, 43163
	movk	x0, 0x52ba, lsl 16
	str	x0, [sp, 2352]
	mov	x0, 39658
	movk	x0, 0x5e3e, lsl 16
	str	x0, [sp, 2344]
	str	wzr, [sp, 2428]
	str	wzr, [sp, 2424]
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
	ldr	x1, [x0]
	add	x0, sp, 2072
	mov	x2, x1
	mov	w1, 256
	bl	fgets
	cmp	x0, 0
	bne	.L18
	mov	w0, 1
	b	.L28
.L18:
	add	x2, sp, 2072
	adrp	x0, .LC3
	add	x1, x0, :lo12:.LC3
	mov	x0, x2
	bl	strcspn
	mov	x1, x0
	add	x0, sp, 2072
	strb	wzr, [x0, x1]
	add	x0, sp, 2072
	bl	strlen
	str	w0, [sp, 2340]
	str	wzr, [sp, 2420]
	b	.L20
.L21:
	ldr	w1, [sp, 2340]
	ldr	w0, [sp, 2420]
	sub	w0, w1, w0
	str	w0, [sp, 2336]
	ldr	w2, [sp, 2336]
	ldr	w1, [sp, 2336]
	mov	w0, 4
	cmp	w2, 4
	csel	w0, w1, w0, le
	str	w0, [sp, 2332]
	add	x1, sp, 2072
	ldrsw	x0, [sp, 2420]
	add	x0, x1, x0
	ldr	w1, [sp, 2332]
	bl	pack_chunk
	mov	x2, x0
	ldrsw	x0, [sp, 2428]
	lsl	x0, x0, 3
	add	x1, sp, 1560
	str	x2, [x1, x0]
	ldrsw	x0, [sp, 2428]
	lsl	x0, x0, 2
	add	x1, sp, 280
	ldr	w2, [sp, 2332]
	str	w2, [x1, x0]
	ldr	w0, [sp, 2428]
	add	w0, w0, 1
	str	w0, [sp, 2428]
	ldr	w0, [sp, 2420]
	add	w0, w0, 4
	str	w0, [sp, 2420]
.L20:
	ldr	w1, [sp, 2420]
	ldr	w0, [sp, 2340]
	cmp	w1, w0
	blt	.L21
	add	x0, sp, 2072
	mov	x1, x0
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	printf
	ldr	w1, [sp, 2428]
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	printf
	str	wzr, [sp, 2416]
	b	.L22
.L23:
	ldrsw	x0, [sp, 2416]
	lsl	x0, x0, 3
	add	x1, sp, 1560
	ldr	x0, [x1, x0]
	ldr	x5, [sp, 2344]
	ldr	x4, [sp, 2352]
	ldr	w3, [sp, 2364]
	ldr	x2, [sp, 2384]
	ldr	x1, [sp, 2376]
	bl	mod_exp_montgomery
	mov	x2, x0
	ldrsw	x0, [sp, 2416]
	lsl	x0, x0, 3
	add	x1, sp, 1048
	str	x2, [x1, x0]
	ldrsw	x0, [sp, 2416]
	lsl	x0, x0, 3
	add	x1, sp, 1560
	ldr	x2, [x1, x0]
	ldrsw	x0, [sp, 2416]
	lsl	x0, x0, 3
	add	x1, sp, 1048
	ldr	x0, [x1, x0]
	mov	x3, x0
	ldr	w1, [sp, 2416]
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	printf
	ldr	w0, [sp, 2416]
	add	w0, w0, 1
	str	w0, [sp, 2416]
.L22:
	ldr	w1, [sp, 2416]
	ldr	w0, [sp, 2428]
	cmp	w1, w0
	blt	.L23
	str	wzr, [sp, 2412]
	b	.L24
.L25:
	ldrsw	x0, [sp, 2412]
	lsl	x0, x0, 3
	add	x1, sp, 1048
	ldr	x0, [x1, x0]
	ldr	x5, [sp, 2344]
	ldr	x4, [sp, 2352]
	ldr	w3, [sp, 2364]
	ldr	x2, [sp, 2384]
	ldr	x1, [sp, 2368]
	bl	mod_exp_montgomery
	mov	x2, x0
	ldrsw	x0, [sp, 2412]
	lsl	x0, x0, 3
	add	x1, sp, 536
	str	x2, [x1, x0]
	ldrsw	x0, [sp, 2412]
	lsl	x0, x0, 3
	add	x1, sp, 536
	ldr	x3, [x1, x0]
	add	x1, sp, 24
	ldrsw	x0, [sp, 2424]
	add	x4, x1, x0
	ldrsw	x0, [sp, 2412]
	lsl	x0, x0, 2
	add	x1, sp, 280
	ldr	w0, [x1, x0]
	mov	w2, w0
	mov	x1, x4
	mov	x0, x3
	bl	unpack_chunk
	ldrsw	x0, [sp, 2412]
	lsl	x0, x0, 2
	add	x1, sp, 280
	ldr	w0, [x1, x0]
	ldr	w1, [sp, 2424]
	add	w0, w1, w0
	str	w0, [sp, 2424]
	ldr	w0, [sp, 2412]
	add	w0, w0, 1
	str	w0, [sp, 2412]
.L24:
	ldr	w1, [sp, 2412]
	ldr	w0, [sp, 2428]
	cmp	w1, w0
	blt	.L25
	ldrsw	x0, [sp, 2424]
	add	x1, sp, 24
	strb	wzr, [x1, x0]
	add	x0, sp, 24
	mov	x1, x0
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	printf
	add	x1, sp, 24
	add	x0, sp, 2072
	bl	strcmp
	cmp	w0, 0
	bne	.L26
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	bl	puts
	b	.L27
.L26:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	puts
.L27:
	mov	w0, 0
.L28:
	ldp	x29, x30, [sp]
	add	sp, sp, 2432
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
