	.arch armv8-a
	.file	"rsa_33bit_opt.c"
	.text
	.align	2
	.p2align 5,,15
	.global	MMM
	.type	MMM, %function
MMM:
.LFB11:
	.cfi_startproc
	mov	x6, 0
	cbz	w3, .L2
	mov	w7, 0
	.p2align 5,,15
.L3:
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
	bne	.L3
.L2:
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
	udiv	x8, x0, x2
	msub	x8, x8, x2, x0
	cbz	w3, .L8
	mov	w9, 0
	mov	x7, 0
	.p2align 5,,15
.L9:
	and	x6, x8, 1
	and	x0, x7, 1
	and	x10, x5, x6
	neg	x6, x6
	eor	x0, x0, x10
	and	x6, x5, x6
	neg	x0, x0
	add	x6, x6, x7
	and	x0, x0, x2
	add	w9, w9, 1
	add	x0, x0, x6
	lsr	x8, x8, 1
	lsr	x7, x0, 1
	cmp	w3, w9
	bne	.L9
	sub	x7, x7, x2
	and	x0, x2, x7, asr 63
	add	x0, x0, x7
	cbz	x1, .L13
.L11:
	lsr	x10, x1, 1
	tbnz	x1, 0, .L36
	cbz	w3, .L15
	.p2align 5,,15
.L17:
	mov	x7, x0
	mov	w8, 0
	mov	x6, 0
	.p2align 5,,15
.L19:
	and	x5, x7, 1
	and	x1, x6, 1
	and	x9, x5, x0
	neg	x5, x5
	eor	x1, x1, x9
	and	x5, x5, x0
	neg	x1, x1
	add	x5, x5, x6
	and	x1, x1, x2
	add	w8, w8, 1
	add	x1, x1, x5
	lsr	x7, x7, 1
	lsr	x6, x1, 1
	cmp	w3, w8
	bne	.L19
	sub	x6, x6, x2
	and	x1, x10, 1
	lsr	x10, x10, 1
	and	x0, x2, x6, asr 63
	add	x0, x0, x6
	cbz	x1, .L17
.L20:
	mov	w7, 0
	mov	x6, 0
	.p2align 5,,15
.L16:
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
	bne	.L16
	sub	x6, x6, x2
	and	x4, x2, x6, asr 63
	add	x4, x4, x6
	cbnz	x10, .L17
.L13:
	mov	w6, 0
	mov	x5, 0
	.p2align 5,,15
.L21:
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
	bne	.L21
	sub	x5, x5, x2
	and	x0, x2, x5, asr 63
	add	x0, x0, x5
	ret
.L36:
	cbnz	w3, .L20
.L15:
	neg	x0, x2
	and	x0, x2, x0, asr 63
	sub	x0, x0, x2
	ret
.L8:
	neg	x0, x2
	and	x0, x2, x0, asr 63
	sub	x0, x0, x2
	cbnz	x1, .L11
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
	ble	.L40
	mov	x2, x0
	mov	x0, 0
	add	x3, x2, w1, sxtw
	.p2align 5,,15
.L39:
	ldrb	w1, [x2], 1
	orr	x0, x1, x0, lsl 8
	cmp	x3, x2
	bne	.L39
	ret
	.p2align 2,,3
.L40:
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
	bmi	.L42
	sxtw	x2, w2
	.p2align 5,,15
.L44:
	strb	w0, [x1, x2]
	lsr	x0, x0, 8
	sub	x2, x2, #1
	tbz	w2, #31, .L44
.L42:
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
	cbz	x0, .L59
	adrp	x1, .LC3
	add	x1, x1, :lo12:.LC3
	mov	x0, x21
	bl	strcspn
	mov	x1, x0
	mov	x0, x21
	strb	wzr, [x21, x1]
	bl	strlen
	mov	x6, x0
	cbz	x0, .L48
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
.L50:
	cmp	w6, 4
	csel	w4, w6, w8, le
	mov	x0, 0
	mov	x1, 0
	.p2align 5,,15
.L49:
	ldrb	w2, [x3, x0]
	add	x0, x0, 1
	orr	x1, x2, x1, lsl 8
	cmp	w4, w0
	bgt	.L49
	add	x2, x25, x5, lsl 3
	add	x0, x20, x5, lsl 2
	add	x5, x5, 1
	sub	w6, w6, #4
	add	x3, x3, 4
	str	x1, [x2, -8]
	str	w4, [x0, -4]
	cmp	x5, x7
	bne	.L50
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
.L53:
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
	bgt	.L53
	add	x22, sp, 592
	mov	w12, 0
	mov	x11, 1
	.p2align 5,,15
.L56:
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
	bmi	.L54
	sxtw	x1, w1
	.p2align 5,,15
.L55:
	strb	w0, [x2, x1]
	lsr	x0, x0, 8
	sub	x1, x1, #1
	tbz	w1, #31, .L55
.L54:
	add	x11, x11, 1
	add	w12, w12, w3
	sub	w0, w11, #2
	cmp	w0, w19
	blt	.L56
	ldp	x19, x20, [sp, 16]
	.cfi_restore 20
	.cfi_restore 19
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
	ldr	x25, [sp, 64]
	.cfi_restore 25
.L52:
	mov	x1, x22
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	strb	wzr, [x22, w12, sxtw]
	bl	printf
	mov	x1, x22
	mov	x0, x21
	bl	strcmp
	cbnz	w0, .L57
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	bl	puts
.L58:
	mov	w0, 0
.L46:
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
.L57:
	.cfi_restore_state
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	puts
	b	.L58
.L59:
	mov	w0, 1
	b	.L46
.L48:
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
	b	.L52
	.cfi_endproc
.LFE15:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
