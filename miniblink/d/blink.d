import api;

//--- main -----------------------------------

shared bool ledState = true;

alias LED13 = LED!(GPIOC, GPIO13);
alias OLED  = SSD1306!(128, 64);

extern(C) void main()
{
  timerSetup();
  auto oled = OLED();
  auto led = LED13();

  for (;;) {
    oled.test();
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

void test(ref OLED oled)
{
  import std.range: iota, chain, retro;

  oled.turnOn();
  enum r = iota(1, 26);
  enum wave = r.chain(r.retro);
  foreach(_; 0..2)
    foreach(x; wave) {
      oled.clear();
      oled.fillRect(
        x, x, 127 - 2*x, 62 - 2*x,
        Color.white);
      oled.fillRect(
        x + 5, x + 5, 117 - 2*x, 52 - 2*x,
        Color.black);
      sleepMs(30);
      oled.refresh();
    }
  oled.turnOff();
}

//--- Timer ----------------------------------

void sleepMs(int milliseconds)
{
  import ldc.llvmasm;

  timer_set_period(TIM2, milliseconds);
  timer_set_prescaler(TIM2, 48_000);
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
    gpio_set(port, pin);
  }

  void off() {
    gpio_clear(port, pin);
  }
}

//--- SSD1306 --------------------------------

enum Color {black, white, inverse};

struct SSD1306(int width = 128,
               int height = 64)
{
  enum bufferLen = width * height / 8;
  ubyte[bufferLen] buffer;

  static SSD1306 opCall()
  {
    SSD1306 oled;
    oled.i2cSetup();
    oled.reset();
    enum cmds = [
      0xAE, 0xA8, 0x3F, 0x00, 0x40, 0x20,
      0x00, 0xA1, 0xC8, 0xDA, 0x12, 0x81,
      0xff, 0xA4, 0xA6, 0xD5, 0x80, 0x8D,
      0x14, 0xAF];
    static foreach(cmd; cmds)
      oled.command(cmd);
    return oled;
  }

  void i2cSetup()
  {
    rcc_periph_clock_enable(RCC_GPIOB);
    rcc_periph_clock_enable(RCC_I2C1);

    gpio_set_mode(GPIOB,
      GPIO_MODE_OUTPUT_50_MHZ,
      GPIO_CNF_OUTPUT_ALTFN_OPENDRAIN,
      GPIO_I2C1_SDA); //PB7
    gpio_set_mode(GPIOB,
      GPIO_MODE_OUTPUT_50_MHZ,
      GPIO_CNF_OUTPUT_ALTFN_OPENDRAIN,
      GPIO_I2C1_SCL); //PB6

    i2c_reset(I2C1);
    i2c_peripheral_disable(I2C1);
    i2c_set_speed(I2C1,
      i2c_speeds.i2c_speed_fm_400k,
      I2C_CR2_FREQ_36MHZ);
    i2c_peripheral_enable(I2C1);

    gpio_set_mode(
      GPIOB, GPIO_MODE_OUTPUT_2_MHZ,
      GPIO_CNF_OUTPUT_PUSHPULL, GPIO5);
  }

  void reset()
  {
    gpio_set(GPIOB, GPIO5);
    sleepMs(1);
    gpio_clear(GPIOB, GPIO5);
    sleepMs(10);
    gpio_set(GPIOB, GPIO5);
  }

  void command(ubyte comm)
  {
    ubyte[2] buf = [0x00u, comm];
    i2c_transfer7(I2C1, 0x3C,
                  buf.ptr, 2, null, 0);
  }

  void refresh()
  {
    enum cmds = [
      0x21, 0x00, width - 1,
      0x22, 0x00, (height / 8) - 1];
    foreach(ubyte cmd; cmds)
      command(cmd);
    ubyte[1 + bufferLen] buf;
    buf[0] = 0x40u;
    buf[1 .. $] = buffer[];
    i2c_transfer7(I2C1, 0x3C,
      buf.ptr, buf.length, null, 0);
  }

  void turnOn()
  {
    command(0xAF);
  }

  void turnOff()
  {
    command(0xAE);
  }

  void clear()
  {
    buffer[] = 0x00;
  }

  void drawPixel(int x, int y, int color)
  {
    if (x < 0) return;
    if (y < 0) return;
    if (x >= width) return;
    if (y >= height) return;

    auto bytePos = x + (y/8) * width;
    auto bit = 1 << (y & 7);
    switch (color)
    {
      case Color.white:
        buffer[bytePos] |= bit;
        break;
      case Color.black:
        buffer[bytePos] &= ~bit;
        break;
      case Color.inverse:
        buffer[bytePos] ^= bit;
        break;
      default:
    }
  }

  void swap(ref int a, ref int b)
  {
    int t = a;
    a = b;
    b = t;
  }

  int abs(int v)
  {
    return (v < 0) ? -v : v;
  }

  void drawLine(int x0, int y0,
                int x1, int y1,
                int color)
  {
    int steep = (abs(y1 - y0) > abs(x1 - x0));
    if (steep) {
      swap(x0, y0);
      swap(x1, y1);
    }
    if (x0 > x1) {
      swap(x0, x1);
      swap(y0, y1);
    }

    int dx = x1 - x0;
    int dy = abs(y1 - y0);
    int err = dx / 2;
    int ystep = (y0 < y1) ? 1 : -1;

    for (; x0 <= x1; x0++) {
      if (steep)
        drawPixel(y0, x0, color);
      else
        drawPixel(x0, y0, color);
      err -= dy;
      if (err < 0) {
        y0 += ystep;
        err += dx;
      }
    }
  }

  void fillRect(int x, int y, int w, int h,
                int color)
  {
    foreach(yy; y .. y+h)
      foreach(xx; x .. x+w)
        drawPixel(xx, yy, color);
  }

  void drawRect(int x, int y, int w, int h,
                int color)
  {
    if (w == 0)
      return;
    if (h == 0)
      return;
    int x1 = x + w - 1;
    int y1 = y + h - 1;
    if ((h > 2 ) | (w > 2)) {
      drawLine(x,    y, x1,    y, color);
      drawLine(x,   y1, x1,   y1, color);
      drawLine(x,  y+1,  x, y1-1, color);
      drawLine(x1, y+1, x1, y1-1, color);
    } else {
      drawLine(x,  y, x1,  y, color);
      drawLine(x, y1, x1, y1, color);
    }
  }
}

//--------------------------------------------
