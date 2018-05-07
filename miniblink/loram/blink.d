import api;

//--- main --------------------------------------------

shared bool ledState = true;

alias OLED = SSD1306!(128, 64);

extern(C) void main()
{
  timerSetup();
  auto led  = IO(GPIOC, GPIO13, RCC_GPIOC);
  auto oled = OLED(GPIOB, GPIO5, RCC_GPIOB);
  for (;;) {
    oled.test();
    led.test();
    led.waveTest();
  }
}

//--- Tests -------------------------------------------

void test(ref IO led, int seconds = 1)
{
  foreach (_; 0 .. 10 * seconds) {
    ledState ? led.on() : led.off();
    sleepMs(100);
  }
}

void waveTest(ref IO led, int seconds = 2)
{
  import std.range: iota, retro, chain, drop;

  auto max  = 25;
  auto w_up = iota(1, max);
  auto wave = w_up.chain(w_up.retro.drop(1));
  foreach (_; 0 .. 3) {
    foreach(onTime; wave) {
      led.on();
      sleepMs(onTime);
      led.off();
      sleepMs(max - onTime);
    }
    sleepMs(seconds * 1000 - max * (2 * max - 3));
  }
}

void test(ref OLED oled)
{
  import std.range: iota, chain, retro;

  oled.turnOn();
  auto r = iota(1, 26);
  auto wave = r.chain(r.retro);
  foreach(_; 0..2)
    foreach(x; wave) {
      oled.clear();
      oled.fillRect(x, x, 127 - 2*x, 62 - 2*x,
                    Color.white);
      oled.fillRect(x + 5, x + 5, 117 - 2*x, 52 - 2*x,
                    Color.black);
      sleepMs(30);
      oled.refresh();
    }
  oled.turnOff();
}

//--- Timer -------------------------------------------

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

//--- IO Port -----------------------------------------

struct IO
{
  uint   port;
  ushort pin;

  this(uint port, ushort pin, int clk)
  {
    this.port = port;
    this.pin = pin;
    rcc_periph_clock_enable(clk);
    gpio_set_mode(port, GPIO_MODE_OUTPUT_2_MHZ,
                  GPIO_CNF_OUTPUT_PUSHPULL, pin);
  }

  void on()
  {
    gpio_set(port, pin);
  }

  void off()
  {
    gpio_clear(port, pin);
  }
}

//--- SSD1306 -----------------------------------------

struct SSD1306(int width, int height)
{
  Gfx!(width, height) gfx;
  IO resetIO;

  alias gfx this;

  this(uint rstPort, ushort rstPin, int clk)
  {
    this.i2cSetup();
    this.resetIO = IO(rstPort, rstPin, clk);
    this.reset();
    this.command(
      0xAE, 0xA8, 0x3F, 0x00, 0x40, 0x20, 0x00, 0xA1,
      0xC8, 0xDA, 0x12, 0x81, 0xff, 0xA4, 0xA6, 0xD5,
      0x80, 0x8D, 0x14, 0xAF);
  }

  void i2cSetup()
  {
    rcc_periph_clock_enable(RCC_GPIOB);
    rcc_periph_clock_enable(RCC_I2C1);

    gpio_set_mode(GPIOB, GPIO_MODE_OUTPUT_50_MHZ,
      GPIO_CNF_OUTPUT_ALTFN_OPENDRAIN, GPIO_I2C1_SDA);
    gpio_set_mode(GPIOB, GPIO_MODE_OUTPUT_50_MHZ,
      GPIO_CNF_OUTPUT_ALTFN_OPENDRAIN, GPIO_I2C1_SCL);

    i2c_reset(I2C1);
    i2c_peripheral_disable(I2C1);
    i2c_set_speed(I2C1, i2c_speeds.i2c_speed_fm_400k,
                  I2C_CR2_FREQ_36MHZ);
    i2c_peripheral_enable(I2C1);
  }

  void reset()
  {
    resetIO.on();
    sleepMs(1);
    resetIO.off();
    sleepMs(10);
    resetIO.on();
  }

  void command(ubyte[] comm ...)
  {
    ubyte[2] buf = [0x00u, 0x00u];
    foreach(c; comm) {
      buf[1] = c;
      i2c_transfer7(I2C1, 0x3C, buf.ptr, 2, null, 0);
    }
  }

  void refresh()
  {
    command(0x21, 0x00, cast(ubyte)(width - 1),
            0x22, 0x00, cast(ubyte)((height / 8) - 1));
    gfx.buffer[0] = 0x40;
    i2c_transfer7(I2C1, 0x3C, gfx.buffer.ptr,
                  gfx.buffer.length, null, 0);
  }

  void turnOn()
  {
    command(0xAF);
  }

  void turnOff()
  {
    command(0xAE);
  }
}

//--- Gfx ---------------------------------------------

enum Color {black, white, inverse};

struct Gfx(int width, int height)
{
  ubyte[1 + width * height / 8] buffer;

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

    auto b = &buffer[1 + x + (y/8) * width];
    auto bit = 1 << (y & 7);
    switch (color) {
      case Color.white  : *b |=  bit; break;
      case Color.black  : *b &= ~bit; break;
      case Color.inverse: *b ^=  bit; break;
      default:
    }
  }

  void fillRect(int x, int y, int w, int h,
                int color)
  {
    foreach(yy; y .. y + h)
      foreach(xx; x .. x + w)
        drawPixel(xx, yy, color);
  }
}

//--- Tools -------------------------------------------

int abs(int v)
{
  return (v < 0) ? -v : v;
}

//-----------------------------------------------------
