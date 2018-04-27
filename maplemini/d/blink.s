	.text
	.syntax unified
	.eabi_attribute	67, "2.09"
	.cpu	cortex-m3
	.eabi_attribute	6, 10
	.eabi_attribute	7, 77
	.eabi_attribute	8, 0
	.eabi_attribute	9, 2
	.eabi_attribute	34, 1
	.eabi_attribute	15, 1
	.eabi_attribute	16, 1
	.eabi_attribute	17, 2
	.eabi_attribute	20, 1
	.eabi_attribute	21, 1
	.eabi_attribute	23, 3
	.eabi_attribute	24, 1
	.eabi_attribute	25, 1
	.eabi_attribute	38, 1
	.eabi_attribute	14, 0
	.file	"blink.d"
	.section	.text.main,"axG",%progbits,main,comdat
	.globl	main
	.p2align	1
	.type	main,%function
	.code	16
	.thumb_func
main:
	.fnstart
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	bl	_D5blink8ledSetupFZv
	bl	_D5blink10timerSetupFZv
	b	.LBB0_1
.LBB0_1:
	movs	r0, #0
	cmp	r0, #0
	bne	.LBB0_4
	b	.LBB0_2
.LBB0_2:
	bl	_D5blink8ledBlinkFZv
	b	.LBB0_3
.LBB0_3:
	b	.LBB0_1
.LBB0_4:
	pop	{r7, pc}
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.fnend

	.section	.text._D5blink8ledSetupFZv,"axG",%progbits,_D5blink8ledSetupFZv,comdat
	.globl	_D5blink8ledSetupFZv
	.p2align	1
	.type	_D5blink8ledSetupFZv,%function
	.code	16
	.thumb_func
_D5blink8ledSetupFZv:
	.fnstart
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#8
	sub	sp, #8
	movw	r0, #771
	bl	rcc_periph_clock_enable
	movw	r0, #3072
	movt	r0, #16385
	movs	r2, #0
	mov.w	lr, #2
	str	r0, [sp, #4]
	mov	r1, lr
	mov	r3, lr
	str.w	lr, [sp]
	bl	gpio_set_mode
	ldr	r0, [sp, #4]
	ldr	r1, [sp]
	bl	gpio_clear
	add	sp, #8
	pop	{r7, pc}
.Lfunc_end1:
	.size	_D5blink8ledSetupFZv, .Lfunc_end1-_D5blink8ledSetupFZv
	.fnend

	.section	.text._D5blink10timerSetupFZv,"axG",%progbits,_D5blink10timerSetupFZv,comdat
	.globl	_D5blink10timerSetupFZv
	.p2align	1
	.type	_D5blink10timerSetupFZv,%function
	.code	16
	.thumb_func
_D5blink10timerSetupFZv:
	.fnstart
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#8
	sub	sp, #8
	movw	r0, #897
	bl	rcc_periph_clock_enable
	movw	r0, #513
	bl	rcc_periph_reset_pulse
	movw	r0, #1024
	movt	r0, #16384
	movw	r1, #6464
	movt	r1, #1
	str	r0, [sp, #4]
	bl	timer_set_prescaler
	movs	r1, #200
	ldr	r0, [sp, #4]
	bl	timer_set_period
	ldr	r0, [sp, #4]
	bl	timer_disable_preload
	ldr	r0, [sp, #4]
	bl	timer_continuous_mode
	movs	r0, #29
	bl	nvic_enable_irq
	movs	r1, #2
	ldr	r0, [sp, #4]
	bl	timer_enable_irq
	ldr	r0, [sp, #4]
	bl	timer_enable_counter
	add	sp, #8
	pop	{r7, pc}
.Lfunc_end2:
	.size	_D5blink10timerSetupFZv, .Lfunc_end2-_D5blink10timerSetupFZv
	.fnend

	.section	.text._D5blink8ledBlinkFZv,"axG",%progbits,_D5blink8ledBlinkFZv,comdat
	.globl	_D5blink8ledBlinkFZv
	.p2align	1
	.type	_D5blink8ledBlinkFZv,%function
	.code	16
	.thumb_func
_D5blink8ledBlinkFZv:
	.fnstart
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	movw	r0, #3072
	movt	r0, #16385
	movs	r1, #2
	bl	gpio_toggle
	mov.w	r0, #500
	bl	_D5blink5sleepFiZv
	pop	{r7, pc}
.Lfunc_end3:
	.size	_D5blink8ledBlinkFZv, .Lfunc_end3-_D5blink8ledBlinkFZv
	.fnend

	.section	.text._D5blink5sleepFiZv,"axG",%progbits,_D5blink5sleepFiZv,comdat
	.globl	_D5blink5sleepFiZv
	.p2align	1
	.type	_D5blink5sleepFiZv,%function
	.code	16
	.thumb_func
_D5blink5sleepFiZv:
	.fnstart
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#16
	sub	sp, #16
	mov	r1, r0
	str	r0, [sp, #12]
	ldr	r0, [sp, #12]
	movw	r2, #1024
	movt	r2, #16384
	str	r0, [sp, #8]
	mov	r0, r2
	ldr	r2, [sp, #8]
	str	r1, [sp, #4]
	mov	r1, r2
	bl	timer_set_period
	bl	wfi
	add	sp, #16
	pop	{r7, pc}
.Lfunc_end4:
	.size	_D5blink5sleepFiZv, .Lfunc_end4-_D5blink5sleepFiZv
	.fnend

	.section	.text.tim2_isr,"axG",%progbits,tim2_isr,comdat
	.globl	tim2_isr
	.p2align	1
	.type	tim2_isr,%function
	.code	16
	.thumb_func
tim2_isr:
	.fnstart
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	movw	r0, #1024
	movt	r0, #16384
	movs	r1, #2
	bl	timer_get_flag
	cmp	r0, #1
	bne	.LBB5_2
	b	.LBB5_1
.LBB5_1:
	movw	r0, #1024
	movt	r0, #16384
	movs	r1, #2
	bl	timer_clear_flag
	b	.LBB5_2
.LBB5_2:
	pop	{r7, pc}
.Lfunc_end5:
	.size	tim2_isr, .Lfunc_end5-tim2_isr
	.fnend

	.type	_D5blink7ledPortyk,%object
	.section	.rodata._D5blink7ledPortyk,"aG",%progbits,_D5blink7ledPortyk,comdat
	.globl	_D5blink7ledPortyk
	.p2align	2
_D5blink7ledPortyk:
	.long	1073810432
	.size	_D5blink7ledPortyk, 4

	.type	_D5blink6ledPinyi,%object
	.section	.rodata._D5blink6ledPinyi,"aG",%progbits,_D5blink6ledPinyi,comdat
	.globl	_D5blink6ledPinyi
	.p2align	2
_D5blink6ledPinyi:
	.long	2
	.size	_D5blink6ledPinyi, 4


	.ident	"ldc version 1.8.0"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 5
