	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"test.c"
	.text
	.global	__aeabi_idiv
	.align	2
	.global	main
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	mov	r3, #108
	str	r3, [fp, #-28]
	mov	r3, #4
	str	r3, [fp, #-32]
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L2
.L9:
	mov	r3, #1
	str	r3, [fp, #-16]
	b	.L3
.L8:
	mov	r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-12]
	b	.L4
.L7:
	ldr	r2, [fp, #-12]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	mov	r1, r3
	ldr	r0, [fp, #-16]
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-12]
	mul	r3, r3, r2
	mov	r2, r3
	lsl	r3, r3, #2
	sub	r3, r2, r3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-12]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	mov	r1, r3
	ldr	r0, [fp, #-20]
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-12]
	mul	r3, r3, r2
	mov	r2, r3
	lsl	r3, r3, #2
	sub	r3, r2, r3
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	ble	.L5
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-36]
	cmp	r2, r3
	bgt	.L5
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	ble	.L5
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-40]
	cmp	r2, r3
	bgt	.L5
	mov	r3, #32
	strb	r3, [fp, #-5]
	b	.L6
.L5:
	mov	r3, #35
	strb	r3, [fp, #-5]
	ldr	r3, [fp, #-12]
	ldr	r2, .L11
	smull	r1, r2, r2, r3
	asr	r3, r3, #31
	sub	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L4:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	ble	.L7
.L6:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r3
	bl	putchar
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L3:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	ble	.L8
	mov	r0, #10
	bl	putchar
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L2:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	ble	.L9
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L12:
	.align	2
.L11:
	.word	1431655766
	.size	main, .-main
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
