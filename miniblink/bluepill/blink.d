import api;

//--- main -----------------------------------

shared bool ledState = true;

alias LED13 = LED!(GPIOC, GPIO13);

extern(C) void main()
{
  timerSetup();
  auto led = LED13();

  for (;;) {
    led.test();
    led.waveTest();
  }
}

//--- Tests ----------------------------------

void test(ref LED13 led, int seconds = 2)
{
  foreach (_; 0 .. 10 * seconds) {
    ledState ? led.on() : led.off();
    sleepMs(100);
  }
}

void waveTest(ref LED13 led, int seconds = 2)
{
  import std.range: iota, retro, chain, drop;

  enum max  = 25;
  enum w_up = iota(1, max);
  enum wave = w_up.chain(w_up.retro.drop(1));
  foreach (_; 0 .. 3) {
    foreach(onTime; wave) {
      led.on();
      sleepMs(onTime);
      led.off();
      sleepMs(max - onTime);
    }
    sleepMs(seconds*1000 - max*(2*max - 3));
  }
}

//--- Timer ----------------------------------

void sleepMs(int milliseconds)
{
  import ldc.llvmasm;

  timer_set_period(TIM2, milliseconds);
  timer_set_prescaler(TIM2, 72_000);
  timer_enable_counter(TIM2);
  __asm("wfi", "");
}

extern(C) void tim2_isr()
{
  if (timer_get_flag(TIM2, TIM_SR_CC1IF)) {
    timer_clear_flag(TIM2, TIM_SR_CC1IF);
    ledState = !ledState;
  }
}

void timerSetup()
{
  rcc_periph_clock_enable(RCC_TIM2);
  rcc_periph_reset_pulse(RST_TIM2);
  timer_disable_preload(TIM2);
  timer_one_shot_mode(TIM2);
  nvic_enable_irq(NVIC_TIM2_IRQ);
  timer_enable_irq(TIM2, TIM_DIER_CC1IE);
}

//--- Led ------------------------------------

struct LED(int port = GPIOC,
           int pin = GPIO13)
{
  static LED opCall() {
    rcc_periph_clock_enable(RCC_GPIOC);
    gpio_set_mode(
      port, GPIO_MODE_OUTPUT_2_MHZ,
      GPIO_CNF_OUTPUT_PUSHPULL, pin);
    LED led;
    return led;
  }

  void on() {
    gpio_clear(port, pin);
  }

  void off() {
    gpio_set(port, pin);
  }
}

//--------------------------------------------
