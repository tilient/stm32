import api;

//--- Global State ----------------------------------

struct State {
  int on;

  mixin GlobalState;
}

//--- main ------------------------------------------

extern(C) int main() {
  ledSetup();
  timerSetup();

  foreach (_; 0..20) {
    sleep(6000);
    if (State().on)
      ledOn();
    else
      ledOff();
  }

  immutable max = 200;
  void step(int t) {
    ledOn();
    sleep(t);
    ledOff();
    sleep(max-t);
  }
  for (;;) {
    foreach_reverse(t; 1..max)
      step(t);
    foreach(t; 1..max)
      step(t);
  }

  return 0;
}

//--- Led -------------------------------------------

immutable ledPort = GPIOC;
immutable ledPin = GPIO13;

void ledOn() {
  gpio_set(ledPort, ledPin);
}

void ledOff() {
  gpio_clear(ledPort, ledPin);
}

void ledSetup() {
  rcc_periph_clock_enable(rcc_periph_clken.RCC_GPIOC);
  gpio_set_mode(ledPort, GPIO_MODE_OUTPUT_2_MHZ,
                GPIO_CNF_OUTPUT_PUSHPULL, ledPin);
  gpio_clear(ledPort, ledPin);
}

//--- Timer -----------------------------------------

void sleep(int time) {
  timer_set_period(TIM2, time);
  wfi();
}

extern(C) void tim2_isr() {
  if (timer_get_flag(TIM2, TIM_SR_CC1IF)) {
    timer_clear_flag(TIM2, TIM_SR_CC1IF);
    State().on = State().on == 0 ? 1 : 0;
  }
}

void timerSetup() {
  rcc_periph_clock_enable(rcc_periph_clken.RCC_TIM2);
  rcc_periph_reset_pulse(rcc_periph_rst.RST_TIM2);
  timer_set_prescaler(TIM2, 128);
  timer_set_period(TIM2, 100);
  timer_disable_preload(TIM2);
  timer_continuous_mode(TIM2);
  nvic_enable_irq(NVIC_TIM2_IRQ);
  timer_enable_irq(TIM2, TIM_DIER_CC1IE);
  timer_enable_counter(TIM2);
}

//---------------------------------------------------
