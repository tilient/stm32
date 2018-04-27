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
	.save	{r4, r5, r6, lr}
	push	{r4, r5, r6, lr}
	movw	r0, #771
	bl	rcc_periph_clock_enable
	movw	r4, #3072
	movs	r1, #2
	movs	r2, #0
	movs	r3, #2
	movt	r4, #16385
	mov	r0, r4
	bl	gpio_set_mode
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
	mov	r0, r4
	movs	r1, #2
	bl	gpio_toggle
	mov	r0, r4
	movs	r1, #2
	bl	gpio_set
	mov.w	r5, #400
.LBB0_1:
	bl	nop
	subs	r5, #1
	bne	.LBB0_1
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
	movw	r5, #6784
	movt	r5, #6
	mov	r6, r5
.LBB0_3:
	bl	nop
	subs	r6, #1
	bne	.LBB0_3
	mov	r0, r4
	movs	r1, #2
	bl	gpio_set
	mov.w	r6, #400
.LBB0_5:
	bl	nop
	subs	r6, #1
	bne	.LBB0_5
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
	mov	r6, r5
.LBB0_7:
	bl	nop
	subs	r6, #1
	bne	.LBB0_7
	mov	r0, r4
	movs	r1, #2
	bl	gpio_set
	mov.w	r6, #400
.LBB0_9:
	bl	nop
	subs	r6, #1
	bne	.LBB0_9
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
	mov	r6, r5
.LBB0_11:
	bl	nop
	subs	r6, #1
	bne	.LBB0_11
	mov	r0, r4
	movs	r1, #2
	bl	gpio_set
	mov.w	r6, #400
.LBB0_13:
	bl	nop
	subs	r6, #1
	bne	.LBB0_13
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
	mov	r6, r5
.LBB0_15:
	bl	nop
	subs	r6, #1
	bne	.LBB0_15
	mov	r0, r4
	movs	r1, #2
	bl	gpio_set
	mov.w	r6, #400
.LBB0_17:
	bl	nop
	subs	r6, #1
	bne	.LBB0_17
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
.LBB0_19:
	bl	nop
	subs	r5, #1
	bne	.LBB0_19
.LBB0_20:
	bl	_D5blink7ledWaveFZv
	b	.LBB0_20
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
	.save	{r4, lr}
	push	{r4, lr}
	movw	r0, #771
	bl	rcc_periph_clock_enable
	movw	r4, #3072
	movs	r1, #2
	movs	r2, #0
	movs	r3, #2
	movt	r4, #16385
	mov	r0, r4
	bl	gpio_set_mode
	mov	r0, r4
	movs	r1, #2
	pop.w	{r4, lr}
	b	gpio_clear
.Lfunc_end1:
	.size	_D5blink8ledSetupFZv, .Lfunc_end1-_D5blink8ledSetupFZv
	.fnend

	.section	.text._D5blink8ledBlinkFZv,"axG",%progbits,_D5blink8ledBlinkFZv,comdat
	.globl	_D5blink8ledBlinkFZv
	.p2align	1
	.type	_D5blink8ledBlinkFZv,%function
	.code	16
	.thumb_func
_D5blink8ledBlinkFZv:
	.fnstart
	.save	{r4, r5, r7, lr}
	push	{r4, r5, r7, lr}
	movw	r4, #3072
	movs	r1, #2
	movt	r4, #16385
	mov	r0, r4
	bl	gpio_set
	mov.w	r5, #400
.LBB2_1:
	bl	nop
	subs	r5, #1
	bne	.LBB2_1
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
	movw	r4, #6784
	movt	r4, #6
.LBB2_3:
	bl	nop
	subs	r4, #1
	bne	.LBB2_3
	pop	{r4, r5, r7, pc}
.Lfunc_end2:
	.size	_D5blink8ledBlinkFZv, .Lfunc_end2-_D5blink8ledBlinkFZv
	.fnend

	.section	.text._D5blink7ledWaveFZv,"axG",%progbits,_D5blink7ledWaveFZv,comdat
	.globl	_D5blink7ledWaveFZv
	.p2align	1
	.type	_D5blink7ledWaveFZv,%function
	.code	16
	.thumb_func
_D5blink7ledWaveFZv:
	.fnstart
	.save	{r4, r5, r7, lr}
	push	{r4, r5, r7, lr}
	movw	r4, #3072
	movs	r1, #2
	movt	r4, #16385
	mov	r0, r4
	bl	gpio_set
	mov.w	r5, #400
.LBB3_1:
	bl	nop
	subs	r5, #1
	bne	.LBB3_1
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
	movw	r5, #10000
.LBB3_3:
	bl	nop
	subs	r5, #1
	bne	.LBB3_3
	mov	r0, r4
	movs	r1, #2
	bl	gpio_set
	mov.w	r5, #800
.LBB3_5:
	bl	nop
	subs	r5, #1
	bne	.LBB3_5
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
	mov.w	r5, #9600
.LBB3_7:
	bl	nop
	subs	r5, #1
	bne	.LBB3_7
	mov	r0, r4
	movs	r1, #2
	bl	gpio_set
	mov.w	r5, #1200
.LBB3_9:
	bl	nop
	subs	r5, #1
	bne	.LBB3_9
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
	movw	r5, #9200
.LBB3_11:
	bl	nop
	subs	r5, #1
	bne	.LBB3_11
	mov	r0, r4
	movs	r1, #2
	bl	gpio_set
	mov.w	r5, #1600
.LBB3_13:
	bl	nop
	subs	r5, #1
	bne	.LBB3_13
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
	movw	r5, #8800
.LBB3_15:
	bl	nop
	subs	r5, #1
	bne	.LBB3_15
	mov	r0, r4
	movs	r1, #2
	bl	gpio_set
	mov.w	r5, #2000
.LBB3_17:
	bl	nop
	subs	r5, #1
	bne	.LBB3_17
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
	movw	r5, #8400
.LBB3_19:
	bl	nop
	subs	r5, #1
	bne	.LBB3_19
	mov	r0, r4
	movs	r1, #2
	bl	gpio_set
	mov.w	r5, #2400
.LBB3_21:
	bl	nop
	subs	r5, #1
	bne	.LBB3_21
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
	mov.w	r5, #8000
.LBB3_23:
	bl	nop
	subs	r5, #1
	bne	.LBB3_23
	mov	r0, r4
	movs	r1, #2
	bl	gpio_set
	mov.w	r5, #2800
.LBB3_25:
	bl	nop
	subs	r5, #1
	bne	.LBB3_25
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
	movw	r5, #7600
.LBB3_27:
	bl	nop
	subs	r5, #1
	bne	.LBB3_27
	mov	r0, r4
	movs	r1, #2
	bl	gpio_set
	mov.w	r5, #3200
.LBB3_29:
	bl	nop
	subs	r5, #1
	bne	.LBB3_29
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
	mov.w	r5, #7200
.LBB3_31:
	bl	nop
	subs	r5, #1
	bne	.LBB3_31
	mov	r0, r4
	movs	r1, #2
	bl	gpio_set
	mov.w	r5, #3600
.LBB3_33:
	bl	nop
	subs	r5, #1
	bne	.LBB3_33
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
	movw	r5, #6800
.LBB3_35:
	bl	nop
	subs	r5, #1
	bne	.LBB3_35
	mov	r0, r4
	movs	r1, #2
	bl	gpio_set
	mov.w	r5, #3200
.LBB3_37:
	bl	nop
	subs	r5, #1
	bne	.LBB3_37
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
	mov.w	r5, #7200
.LBB3_39:
	bl	nop
	subs	r5, #1
	bne	.LBB3_39
	mov	r0, r4
	movs	r1, #2
	bl	gpio_set
	mov.w	r5, #2800
.LBB3_41:
	bl	nop
	subs	r5, #1
	bne	.LBB3_41
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
	movw	r5, #7600
.LBB3_43:
	bl	nop
	subs	r5, #1
	bne	.LBB3_43
	mov	r0, r4
	movs	r1, #2
	bl	gpio_set
	mov.w	r5, #2400
.LBB3_45:
	bl	nop
	subs	r5, #1
	bne	.LBB3_45
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
	mov.w	r5, #8000
.LBB3_47:
	bl	nop
	subs	r5, #1
	bne	.LBB3_47
	mov	r0, r4
	movs	r1, #2
	bl	gpio_set
	mov.w	r5, #2000
.LBB3_49:
	bl	nop
	subs	r5, #1
	bne	.LBB3_49
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
	movw	r5, #8400
.LBB3_51:
	bl	nop
	subs	r5, #1
	bne	.LBB3_51
	mov	r0, r4
	movs	r1, #2
	bl	gpio_set
	mov.w	r5, #1600
.LBB3_53:
	bl	nop
	subs	r5, #1
	bne	.LBB3_53
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
	movw	r5, #8800
.LBB3_55:
	bl	nop
	subs	r5, #1
	bne	.LBB3_55
	mov	r0, r4
	movs	r1, #2
	bl	gpio_set
	mov.w	r5, #1200
.LBB3_57:
	bl	nop
	subs	r5, #1
	bne	.LBB3_57
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
	movw	r5, #9200
.LBB3_59:
	bl	nop
	subs	r5, #1
	bne	.LBB3_59
	mov	r0, r4
	movs	r1, #2
	bl	gpio_set
	mov.w	r5, #800
.LBB3_61:
	bl	nop
	subs	r5, #1
	bne	.LBB3_61
	mov	r0, r4
	movs	r1, #2
	bl	gpio_clear
	mov.w	r4, #9600
.LBB3_63:
	bl	nop
	subs	r4, #1
	bne	.LBB3_63
	movw	r4, #13568
	movt	r4, #12
.LBB3_65:
	bl	nop
	subs	r4, #1
	bne	.LBB3_65
	pop	{r4, r5, r7, pc}
.Lfunc_end3:
	.size	_D5blink7ledWaveFZv, .Lfunc_end3-_D5blink7ledWaveFZv
	.fnend

	.section	.text._D5blink5ledOnFZv,"axG",%progbits,_D5blink5ledOnFZv,comdat
	.globl	_D5blink5ledOnFZv
	.p2align	1
	.type	_D5blink5ledOnFZv,%function
	.code	16
	.thumb_func
_D5blink5ledOnFZv:
	.fnstart
	movw	r0, #3072
	movs	r1, #2
	movt	r0, #16385
	b	gpio_set
.Lfunc_end4:
	.size	_D5blink5ledOnFZv, .Lfunc_end4-_D5blink5ledOnFZv
	.fnend

	.section	.text._D5blink5sleepFiZv,"axG",%progbits,_D5blink5sleepFiZv,comdat
	.globl	_D5blink5sleepFiZv
	.p2align	1
	.type	_D5blink5sleepFiZv,%function
	.code	16
	.thumb_func
_D5blink5sleepFiZv:
	.fnstart
	.save	{r4, lr}
	push	{r4, lr}
	mov.w	r1, #400
	mul	r4, r0, r1
	cmp	r4, #1
	it	lt
	poplt	{r4, pc}
.LBB5_1:
	bl	nop
	subs	r4, #1
	bne	.LBB5_1
	pop	{r4, pc}
.Lfunc_end5:
	.size	_D5blink5sleepFiZv, .Lfunc_end5-_D5blink5sleepFiZv
	.fnend

	.section	.text._D5blink6ledOffFZv,"axG",%progbits,_D5blink6ledOffFZv,comdat
	.globl	_D5blink6ledOffFZv
	.p2align	1
	.type	_D5blink6ledOffFZv,%function
	.code	16
	.thumb_func
_D5blink6ledOffFZv:
	.fnstart
	movw	r0, #3072
	movs	r1, #2
	movt	r0, #16385
	b	gpio_clear
.Lfunc_end6:
	.size	_D5blink6ledOffFZv, .Lfunc_end6-_D5blink6ledOffFZv
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
	mov.w	r0, #1073741824
	movs	r1, #2
	bl	timer_get_flag
	cmp	r0, #1
	it	ne
	popne	{r7, pc}
	mov.w	r0, #1073741824
	movs	r1, #2
	pop.w	{r7, lr}
	b	timer_clear_flag
.Lfunc_end7:
	.size	tim2_isr, .Lfunc_end7-tim2_isr
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
	mov.w	r0, #896
	bl	rcc_periph_clock_enable
	mov.w	r0, #512
	bl	rcc_periph_reset_pulse
	movw	r1, #6464
	mov.w	r0, #1073741824
	movt	r1, #1
	bl	timer_set_prescaler
	mov.w	r0, #1073741824
	movw	r1, #3000
	bl	timer_set_period
	mov.w	r0, #1073741824
	bl	timer_disable_preload
	mov.w	r0, #1073741824
	bl	timer_continuous_mode
	movs	r0, #28
	bl	nvic_enable_irq
	mov.w	r0, #1073741824
	pop.w	{r7, lr}
	b	timer_enable_counter
.Lfunc_end8:
	.size	_D5blink10timerSetupFZv, .Lfunc_end8-_D5blink10timerSetupFZv
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

	.type	_D5blink7ledWaveFZ4waveyAh,%object
	.section	.data.rel.ro._D5blink7ledWaveFZ4waveyAh,"aGw",%progbits,_D5blink7ledWaveFZ4waveyAh,comdat
	.globl	_D5blink7ledWaveFZ4waveyAh
	.p2align	2
_D5blink7ledWaveFZ4waveyAh:
	.long	16
	.long	.constarray
	.size	_D5blink7ledWaveFZ4waveyAh, 8

	.type	.constarray,%object
	.section	.data..constarray,"aw",%progbits
.constarray:
	.ascii	"\001\002\003\004\005\006\007\b\t\b\007\006\005\004\003\002"
	.size	.constarray, 16


	.ident	"ldc version 1.8.0"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 2
