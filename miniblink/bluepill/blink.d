
import api;

//--- main --------------------------------------------

shared bool ledState = true;

extern(C) void main() {
  timerSetup();
  auto led  = IO(GPIOC, GPIO13, RCC_GPIOC);
  for (;;) {
    led.test();
    led.waveTest();
  }
}

//--- Tests -------------------------------------------

void test(ref IO led, int seconds = 1) {
  foreach (_; 0 .. 10 * seconds) {
    ledState ? led.off() : led.on();
    sleepMs(100);
  }
}

void waveTest(ref IO led, int seconds = 2) {
  import std.range: iota, retro, chain, drop;

  auto max   = 25;
  auto steps = iota(1, max);
  auto wave  = steps.chain(steps.retro.drop(1));
  foreach (_; 0 .. 3) {
    foreach(onTime; wave) {
      led.off();
      sleepMs(onTime);
      led.on();
      sleepMs(max - onTime);
    }
    sleepMs(seconds * 1000 - max * (2 * max - 3));
  }
}

//--- Timer -------------------------------------------

void sleepMs(int milliseconds) {
  import ldc.llvmasm;

  timer_set_period(TIM2, milliseconds);
  timer_enable_counter(TIM2);
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
  timer_disable_preload(TIM2);
  timer_set_prescaler(TIM2, 72_000);
  timer_one_shot_mode(TIM2);
  nvic_enable_irq(NVIC_TIM2_IRQ);
  timer_enable_irq(TIM2, TIM_DIER_CC1IE);
}

//--- IO Port -----------------------------------------

struct IO
{
  uint   port;
  ushort pin;

  this(uint port, ushort pin, int clk) {
    this.port = port;
    this.pin = pin;
    rcc_periph_clock_enable(clk);
    gpio_set_mode(port, GPIO_MODE_OUTPUT_2_MHZ,
                  GPIO_CNF_OUTPUT_PUSHPULL, pin);
  }

  void on() {
    gpio_set(this.port, this.pin);
  }

  void off() {
    gpio_clear(this.port, this.pin);
  }
}

//-----------------------------------------------------
