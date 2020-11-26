	.arch armv6
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
	mov	r3, #1				@ crea y almacena el valor que controla las coordenadas "y"
	str	r3, [fp, #-20]
	b	.L2
.L9:						
	mov	r3, #1				@ crea y almacena el valor que controla las coordenadas "x"
	str	r3, [fp, #-16]
	b	.L3
.L8:
	mov	r3, #1				@ crea y almacena el valor que controla las coordenadas del nivel de profundidad de la alfombra
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-12]		@ define la dimension del cuadro basandose en la dimension de la alfombra cada vez que el nivel sea igual a uno
	b	.L4
.L7:	@ la cereza del pastel :')
	ldr	r2, [fp, #-12]		@ carga la dimensión del cuadro definida en L8
	mov	r3, r2
	lsl	r3, r3, #1			@ corre los bits que representan la dimension del cuadro 1 bit a la izquierda
	add	r3, r3, r2			@ le suma la dimension una vez mas para dar el resultado de (dimensionCuadro * 3)
	mov	r1, r3				@ carga el valor de (dimensionCuadro * 3) en r1 
	ldr	r0, [fp, #-16]		@ carga el valor de x en r0
	bl	__aeabi_idiv		@ ejecuta divison r0/r1. divide lo que le haya dado (dimension * 3) entre la cordenada x
	@mov	r3, r0
	@mov	r2, r3
	ldr	r3, [fp, #-12]
	mul	r3, r3, r0
	mov	r2, r3
	lsl	r3, r3, #2
	sub	r3, r2, r3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-12]		@ Empieza de nuevo el proceso
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	mov	r1, r3
	ldr	r0, [fp, #-20]
	bl	__aeabi_idiv
	@mov	r3, r0
	@mov	r2, r3
	ldr	r3, [fp, #-12]
	mul	r3, r3, r0
	mov	r2, r3
	lsl	r3, r3, #2
	sub	r3, r2, r3
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-40]		@ Termina el proceso
	ldr	r2, [fp, #-36]		@ Carga el resultado de a = (x-(dimensionCuadro*3)*(x/(dimensionCuadro*3))) en r2
	ldr	r3, [fp, #-12]		@ Carga nuevamente la dimension del cuadro en r3
	cmp	r2, r3				@ Compara "a" con la dimension del cuadro
	ble	.L5					@ Si "a" es menor o igual que la dimension del cuadro brinca a .L5
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #1			@ Carga la dimension del cuadro y la multiplica por dos haciendo un shift a la izquierda
	ldr	r2, [fp, #-36]
	cmp	r2, r3
	bgt	.L5					@ Si dimension del cuadro es mayor que "a" brinca a .L5
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
	add	r3, r3, #1			@ aumenta el valor de z
	str	r3, [fp, #-24]		@ almacena el valor aumentado de x 
.L4:						@ ciclo para recorrer los niveles "z" de la alfombra 
	ldr	r2, [fp, #-24]		@ r2 = "z"
	ldr	r3, [fp, #-32]		@ carga el nivel (4)
	cmp	r2, r3				@ compara "z" con el nivel ( z+1 <= 4? )...
	ble	.L7
.L6:
	ldrb	r3, [fp, #-5]	@ carga en r3 la representacion numerica del caracter "#" (ascii table)
	mov	r0, r3
	bl	putchar
	ldr	r3, [fp, #-16]		
	add	r3, r3, #1			@ aumenta el valor de x
	str	r3, [fp, #-16]		@ almacena el valor aumentado de x 
.L3:	@ ciclo para recorrer las coordenadas "x" de la alfombra
	ldr	r2, [fp, #-16]		@ r2 = "x"
	ldr	r3, [fp, #-28]		@ carga 108 al registro r3
	cmp	r2, r3				@ compara x con 108
	ble	.L8					@ mientras "x" sea menor que 108, salta a L8
	mov	r0, #10
	bl	putchar
	ldr	r3, [fp, #-20]
	add	r3, r3, #1			@ aumenta el valor de y
	str	r3, [fp, #-20]		@ almacena el valor aumentado de x
.L2:	@ ciclo para recorrer las coordenadas y de la alfombra
	ldr	r2, [fp, #-20]		@ r2 = "y"
	ldr	r3, [fp, #-28]		@ carga 108 al registro r3
	cmp	r2, r3				@ compara y con 108
	ble	.L9					@ mientras "y" sea menor que 108, salta a L9
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
