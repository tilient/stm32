import api;

void gpioSetup()
{
	rcc_periph_clock_enable(rcc_periph_clken.RCC_GPIOC);
	gpio_set_mode(GPIOC, GPIO_MODE_OUTPUT_2_MHZ,
                GPIO_CNF_OUTPUT_PUSHPULL, GPIO13);
}

void timerSetup()
{
  rcc_periph_clock_enable(rcc_periph_clken.RCC_TIM2);
  nvic_enable_irq(NVIC_TIM2_IRQ);
  rcc_periph_reset_pulse(rcc_periph_rst.RST_TIM2);
  timer_set_mode(TIM2, TIM_CR1_CKD_CK_INT,
                 TIM_CR1_CMS_EDGE, TIM_CR1_DIR_UP);
  timer_set_prescaler(TIM2, 128);
  timer_disable_preload(TIM2);
  timer_continuous_mode(TIM2);
  timer_set_period(TIM2, 16_000);
  timer_continuous_mode(TIM2);
  timer_enable_counter(TIM2);
  timer_enable_irq(TIM2, TIM_DIER_CC1IE);
}

extern(C) void tim2_isr()
{
  if (timer_get_flag(TIM2, TIM_SR_CC1IF))
    timer_clear_flag(TIM2, TIM_SR_CC1IF);
}

extern(C) void d_main()
{
  gpioSetup();
  timerSetup();
  for (;;) {
    gpio_toggle(GPIOC, GPIO13);
    wfi();
  }
}
