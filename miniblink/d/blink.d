import api;

extern(C) int main() {
  State state;
  state.init();
  gpioSetup();
  timerSetup();
  for (;;) {
    if (state.on)
      gpio_set(GPIOC, GPIO13);
    else
      gpio_clear(GPIOC, GPIO13);
    wfi();
  }
  return 0;
}

//--- Global State ----------------------------------

struct State {
  int on;

  void init() {
    setGlobal(&this);
  }

  @property static State* opCall() {
    return cast(State*) getGlobal();
  }
}

//---------------------------------------------------

extern(C) void tim2_isr() {
  if (timer_get_flag(TIM2, TIM_SR_CC1IF)) {
    timer_clear_flag(TIM2, TIM_SR_CC1IF);
    State().on = State().on == 0 ? 1 : 0;
  }
}

void gpioSetup() {
  rcc_periph_clock_enable(rcc_periph_clken.RCC_GPIOC);
  gpio_set_mode(GPIOC, GPIO_MODE_OUTPUT_2_MHZ,
                GPIO_CNF_OUTPUT_PUSHPULL, GPIO13);
}

void timerSetup() {
  rcc_periph_clock_enable(rcc_periph_clken.RCC_TIM2);
  rcc_periph_reset_pulse(rcc_periph_rst.RST_TIM2);
  timer_set_prescaler(TIM2, 128);
  timer_set_period(TIM2, 8_000);
  timer_disable_preload(TIM2);
  timer_continuous_mode(TIM2);
  nvic_enable_irq(NVIC_TIM2_IRQ);
  timer_enable_irq(TIM2, TIM_DIER_CC1IE);
  timer_enable_counter(TIM2);
}

