import api;

//--- main -----------------------------------

extern(C) void main() {
  timerSetup();
  ledSetup();
  ledBlink(3);
  for (;;)
    ledWave();
}

//--- Led ------------------------------------

enum ledPort = GPIOC;
enum ledPin = GPIO13;

shared bool ledState = true;

void ledBlink(int seconds = 3) {
  foreach (_; 0 .. 10 * seconds) {
    ledState ? ledOn() : ledOff();
    sleep(100);
  }
}

void ledOn() {
  gpio_clear(ledPort, ledPin);
}

void ledOff() {
  gpio_set(ledPort, ledPin);
}

void ledWave(int seconds = 3) {
  import std.range: iota, retro, chain, drop;

  enum max  = 25;
  enum w_up = iota(1, max);
  enum wave = w_up.chain(w_up.retro.drop(1));
  static foreach(onTime; wave)
    led(onTime, max - onTime);
  sleep(seconds * 1000 - max * (2 * max - 3));
}

void led(int onTime, int offTime) {
  gpio_clear(ledPort, ledPin);
  sleep(onTime);
  gpio_set(ledPort, ledPin);
  sleep(offTime);
}

void ledSetup() {
  rcc_periph_clock_enable(RCC_GPIOC);
  gpio_set_mode(
    ledPort, GPIO_MODE_OUTPUT_2_MHZ,
    GPIO_CNF_OUTPUT_PUSHPULL, ledPin);
}

//--- Timer ----------------------------------

void sleep(int time) {
  import ldc.llvmasm;

  timer_set_period(TIM2, time);
  __asm("wfi", "");
}

extern(C) void tim2_isr() {
  if (timer_get_flag(TIM2, TIM_SR_CC1IF)) {
    timer_clear_flag(TIM2, TIM_SR_CC1IF);
    ledState = !ledState;
  }
}

void timerSetup() {
  rcc_periph_clock_enable(RCC_TIM2);
  rcc_periph_reset_pulse(RST_TIM2);
  timer_set_prescaler(TIM2, 72_000);
  timer_disable_preload(TIM2);
  timer_continuous_mode(TIM2);
  nvic_enable_irq(NVIC_TIM2_IRQ);
  timer_enable_irq(TIM2, TIM_DIER_CC1IE);
  timer_enable_counter(TIM2);
}

//--------------------------------------------
