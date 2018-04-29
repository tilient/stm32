#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/timer.h>
#include <libopencm3/cm3/nvic.h>
#include <libopencm3/cm3/vector.h>

int toggle = 1;

static void gpio_setup(void)
{
	rcc_periph_clock_enable(RCC_GPIOB);
	gpio_set_mode(
    GPIOB, GPIO_MODE_OUTPUT_2_MHZ,
		GPIO_CNF_OUTPUT_PUSHPULL, GPIO1);
}

void tim2_isr(void) {
  if (timer_get_flag(TIM2, TIM_SR_CC1IF)) {
    timer_clear_flag(TIM2, TIM_SR_CC1IF);
		gpio_toggle(GPIOB, GPIO1);
    timer_set_period(TIM2, 90);
    toggle = (toggle == 1)? 0 : 1;
  }
}

static void timerSetup(void) {
   //timer_disable_counter(TIM2);
   //vector_table.irq[28] = &tim2_isr;

   //rcc_periph_clock_enable(RCC_TIM2);
   //nvic_enable_irq(NVIC_TIM2_IRQ);
   //timer_reset(RST_TIM2);
   //rcc_periph_reset_pulse(RST_TIM2);
   //timer_set_mode(TIM2, TIM_CR1_CKD_CK_INT,
   //               TIM_CR1_CMS_EDGE, TIM_CR1_DIR_UP);
   //timer_set_prescaler(TIM2, 72000);
   //timer_disable_preload(TIM2);
   //timer_continuous_mode(TIM2);
   //timer_set_period(TIM2, 30);
   //timer_enable_counter(TIM2);
   //timer_enable_irq(TIM2, TIM_DIER_CC1IE);
}

static void sleep(void)
{
	int i;
  for (i = 0; i < 100000; i++)
    __asm__("nop");
}

int main(void)
{
  //rcc_clock_setup_in_hse_8mhz_out_72mhz();
	gpio_setup();
  timerSetup();
	while (1) {
		gpio_toggle(GPIOB, GPIO1);
    sleep();
    toggle = (toggle == 1)? 0 : 1;
	}
	return 0;
}


