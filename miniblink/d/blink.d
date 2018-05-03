import api;

//--- main -----------------------------------

enum ledPort = GPIOC;
enum ledPin = GPIO13;

enum ledStripPort = GPIOB;
enum ledStripPin = GPIO9;


extern(C) void main() {
  timerSetup();
  ledSetup();
  ledStripSetup();

  ledBlinkTest();
  for (;;) {
    ledWaveTest();
    ledStripTest();
  }
}

//--- Led ------------------------------------

shared bool ledState = true;

void ledBlinkTest(int seconds = 3) {
  foreach (_; 0 .. 10 * seconds) {
    ledState ? ledOn() : ledOff();
    sleep(100);
  }
}

void ledWaveTest(int seconds = 2) {
  import std.range: iota, retro, chain, drop;

  enum max  = 25;
  enum w_up = iota(1, max);
  enum wave = w_up.chain(w_up.retro.drop(1));
  static foreach(onTime; wave)
    led(onTime, max - onTime);
  sleep(seconds * 1000 - max * (2 * max - 3));
}

void ledOn() {
  gpio_clear(ledPort, ledPin);
}

void ledOff() {
  gpio_set(ledPort, ledPin);
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

//--- LedStrip --- WS2812 --------------------

alias ledColor = ubyte[3];
alias ledColors = ledColor[8];

void ledStripTest() {
  enum ledColors colors0 = [
    [0, 0, 0], [0, 0, 0],
    [0, 0, 0], [0, 0, 0],
    [0, 0, 0], [0, 0, 0],
    [0, 0, 0], [0, 0, 0]];
  enum ledColors colors1 = [
    [200,   0,   0], [  0, 200,   0],
    [  0,   0, 200], [200, 200,   0],
    [200,   0, 200], [  0, 200, 200],
    [200, 200, 200], [  0,   0,   0]];
  sendLedStripColors(colors0);
  sleep(1000);
  sendLedStripColors(colors1);
  sleep(1000);
}

void sendLedStripColors(ledColors colors) {
  foreach (color; colors)
    foreach (b; color)
      sendLedStripByte(b);
}

void sendLedStripByte(ubyte b) {
  for (ubyte msk = 0x80; msk > 0; msk >>= 1) {
    gpio_set(ledStripPort, ledStripPin);
    nops(25);
    ((b & msk) ? &gpio_set : &gpio_clear)
      (ledStripPort, ledStripPin);
    nops(43);
    gpio_clear(ledStripPort, ledStripPin);
    nops(25);
  }
}

void ledStripSetup() {
  rcc_periph_clock_enable(RCC_GPIOB);
  gpio_set_mode(
    ledStripPort, GPIO_MODE_OUTPUT_2_MHZ,
    GPIO_CNF_OUTPUT_PUSHPULL, ledStripPin);
}

//--- Timer ----------------------------------

void sleep(int milliseconds) {
  timer_set_period(TIM2, milliseconds);
  timer_set_prescaler(TIM2, 72_000);
  timer_enable_counter(TIM2);
  wfi();
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
  timer_one_shot_mode(TIM2);
  nvic_enable_irq(NVIC_TIM2_IRQ);
  timer_enable_irq(TIM2, TIM_DIER_CC1IE);
}

//--- Tools ----------------------------------

void wfi() {
  import ldc.llvmasm;

  __asm("wfi", "");
}

void nops(const uint nr) {
  import ldc.llvmasm;

  foreach(_; 0 .. nr)
    __asm("nop", "");
}

//--------------------------------------------
