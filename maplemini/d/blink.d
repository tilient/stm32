import api;

//--- Global State ------------------------

// struct State {
//   int on;
//
//   mixin GlobalState;
// }

//--- main --------------------------------

extern(C) void main() {
  ledSetup();
  //timerSetup();

  for (;;)
    ledBlink();
  //for (;;)
  //  ledWave();
}

//--- Led ---------------------------------

immutable ledPort = GPIOB;
immutable ledPin = GPIO1;

void ledBlink() {
  gpio_toggle(ledPort, ledPin);
  sleepB!500;
  //if (State().on)
  //  ledOn();
  //else
  //  ledOff();
  //sleepB(500);
}

void sleepB(int time)() {
  static immutable times = 200*time;
  int x = 0;
  for (int i = 0; i < times; i++)
    x += 1;
}

// void ledWave() {
//   static immutable ubyte[] wave = [
//     1, 3, 5, 7, 9, 11, 13, 15, 17, 19,
//     21, 23, 25, 27, 29, 27, 25, 23, 21,
//     19, 17, 15, 13, 11, 9, 7, 5, 3];
//   static foreach(t; wave) {
//     ledOn();
//     sleep(t);
//     ledOff();
//     sleep(30-t);
//   }
// }
//
// void ledOn() {
//   gpio_set(ledPort, ledPin);
// }
//
// void ledOff() {
//   gpio_clear(ledPort, ledPin);
// }

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
//   timer_set_period(TIM3, time);
//   wfi();
// }
// 
// extern(C) void tim2_isr() {
//   if (timer_get_flag(TIM3, TIM_SR_CC1IF)) {
//     timer_clear_flag(TIM3, TIM_SR_CC1IF);
//     State().on = State().on == 0 ? 1 : 0;
//   }
// }
// 
// void timerSetup() {
//   rcc_periph_clock_enable(
//     rcc_periph_clken.RCC_TIM3);
//   rcc_periph_reset_pulse(
//     rcc_periph_rst.RST_TIM3);
//   timer_set_prescaler(TIM3, 72_000);
//   timer_set_period(TIM3, 200);
//   timer_disable_preload(TIM3);
//   timer_continuous_mode(TIM3);
//   nvic_enable_irq(NVIC_TIM3_IRQ);
//   timer_enable_irq(TIM3, TIM_DIER_CC1IE);
//   timer_enable_counter(TIM3);
// }

//-----------------------------------------
