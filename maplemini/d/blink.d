import api;


//--- main --------------------------------

extern(C) void main() {
  ledSetup();
  //timerSetup();

  gpio_toggle(ledPort, ledPin);
  foreach (_; 0 .. 5)
    ledBlink();
  for (;;)
    ledWave();
}

//--- Led ---------------------------------

immutable ledPort = GPIOB;
immutable ledPin = GPIO1;

void ledBlink() {
  ledOn();
  sleep(1);
  ledOff();
  sleep(1000);
}

void sleep(int time) {
  for (int j = 0; j < 400*time; j++)
    nop();
}

void ledWave() {
  static immutable ubyte[] wave = [
    1, 2, 3, 4, 5, 6, 7, 8,
    9, 8, 7, 6, 5, 4, 3, 2];
  static foreach(t; wave) {
    ledOn();
    sleep(t);
    ledOff();
    sleep(26-t);
  }
  sleep(2000);
}

void ledOn() {
  gpio_set(ledPort, ledPin);
}

void ledOff() {
  gpio_clear(ledPort, ledPin);
}

void ledSetup() {
  rcc_periph_clock_enable(
    rcc_periph_clken.RCC_GPIOB);
  gpio_set_mode(
    ledPort, GPIO_MODE_OUTPUT_2_MHZ,
    GPIO_CNF_OUTPUT_PUSHPULL, ledPin);
  gpio_clear(ledPort, ledPin);
}

//--- Timer -------------------------------

// void sleep(int time) {
//   timer_set_period(TIM2, time);
//   wfi();
// }

extern(C) void tim2_isr() {
  if (timer_get_flag(TIM2, TIM_SR_CC1IF)) {
    timer_clear_flag(TIM2, TIM_SR_CC1IF);
    //State().on = State().on == 0 ? 1 : 0;
    //timer_set_period(TIM2, 3000);
  }
}

void timerSetup() {
   rcc_periph_clock_enable(
     rcc_periph_clken.RCC_TIM2);
   rcc_periph_reset_pulse(
     rcc_periph_rst.RST_TIM2);
   timer_set_prescaler(TIM2, 72_000);
   timer_set_period(TIM2, 3000);
   timer_disable_preload(TIM2);
   timer_continuous_mode(TIM2);
   nvic_enable_irq(NVIC_TIM2_IRQ);
   timer_enable_counter(TIM2);
   // timer_enable_irq(TIM2, TIM_DIER_CC1IE);
}

//-----------------------------------------
