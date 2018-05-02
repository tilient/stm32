import api;

//--- main -----------------------------------

extern(C) void main()
{
  timerSetup();
  ledSetup();
  ledBlink();
  for (;;)
    ledWave();
}

//--- Led ------------------------------------

immutable ledPort = GPIOC;
immutable ledPin = GPIO13;

shared bool ledState = true;

void ledBlink(int seconds = 4)
{
  foreach (_; 0 .. 10 * seconds)
    ledState ? ledOn(100) : ledOff(100);
}

void ledWave()
{
  static immutable ubyte[] wave = [
    1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23,
    21, 19, 17, 15, 13, 11, 9, 7, 5, 3, 1];
  static foreach(onTime; wave)
    static foreach(_; 0 .. 3) {
      ledOn(onTime);
      ledOff(25 - onTime);
    }
  sleep(2275);
}

void ledOn(int time)
{
  gpio_clear(ledPort, ledPin);
  sleep(time);
}

void ledOff(int time)
{
  gpio_set(ledPort, ledPin);
  sleep(time);
}

void ledSetup()
{
  rcc_periph_clock_enable(RCC_GPIOC);
  gpio_set_mode(
    ledPort, GPIO_MODE_OUTPUT_2_MHZ,
    GPIO_CNF_OUTPUT_PUSHPULL, ledPin);
}

//--- Timer ----------------------------------

void sleep(int time)
{
  import ldc.llvmasm;

  timer_set_period(TIM2, time);
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
  timer_set_prescaler(TIM2, 72_000);
  timer_disable_preload(TIM2);
  timer_continuous_mode(TIM2);
  nvic_enable_irq(NVIC_TIM2_IRQ);
  timer_enable_irq(TIM2, TIM_DIER_CC1IE);
  timer_enable_counter(TIM2);
}

//--------------------------------------------
