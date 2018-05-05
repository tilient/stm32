import api;

//--- main -----------------------------------

enum ledPort = GPIOC;
enum ledPin = GPIO13;

extern(C) void main()
{
  rcc_clock_setup_in_hse_8mhz_out_72mhz();
  timerSetup();
  ledSetup();

  oledTest();
  ledBlinkTest(30);
  for (;;)
    ledWaveTest();
}

//--- Oled -----------------------------------

void oledTest() {
  import std.range: iota, chain, retro, drop;

  SSD1306!(128,64) oled;
  oled.init();
  enum r = iota(1, 26);
  enum wave = r.chain(r.retro.drop(1));
  foreach(_; 0 .. 2)
    foreach(x; wave) {
      oled.clearScreen();
      oled.fillRect(
        x, x, 127-2*x, 62-2*x,
        Color.WHITE);
      oled.fillRect(
        x+5, x+5, 117-2*x, 52-2*x,
        Color.BLACK);
      sleep(30);
      oled.refresh();
    }
  oled.turnOff();
}

//--- Led ------------------------------------

shared bool ledState = true;

void ledBlinkTest(int seconds = 3) {
  foreach (_; 0 .. 10 * seconds) {
    ledState ? ledOn() : ledOff();
    sleep(100);
  }
}

void ledWaveTest(int seconds = 3) {
  import std.range: iota, retro, chain, drop;

  enum max  = 25;
  enum w_up = iota(1, max);
  enum wave = w_up.chain(w_up.retro.drop(1));
  static foreach(onTime; wave)
    led(onTime, max - onTime);
  sleep(seconds * 1000 - max * (2 * max - 3));
}

void ledOn() {
  gpio_set(ledPort, ledPin);
}

void ledOff() {
  gpio_clear(ledPort, ledPin);
}

void led(int onTime, int offTime) {
  gpio_set(ledPort, ledPin);
  sleep(onTime);
  gpio_clear(ledPort, ledPin);
  sleep(offTime);
}

void ledSetup() {
  rcc_periph_clock_enable(RCC_GPIOC);
  gpio_set_mode(
    ledPort, GPIO_MODE_OUTPUT_2_MHZ,
    GPIO_CNF_OUTPUT_PUSHPULL, ledPin);
}

//--- Timer ----------------------------------

void sleep(int milliseconds) {
  import ldc.llvmasm;

  timer_set_period(TIM2, milliseconds);
  timer_set_prescaler(TIM2, 48_000);
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
  timer_one_shot_mode(TIM2);
  nvic_enable_irq(NVIC_TIM2_IRQ);
  timer_enable_irq(TIM2, TIM_DIER_CC1IE);
}

//--- ssd1306 --------------------------------

enum Color {BLACK, WHITE, INVERSE};

enum SSD1306_ADDRESS               =  0x3c;
// Commands
enum SSD1306_SETCONTRAST           =  0x81;
enum SSD1306_DISPLAYALLON_RESUME   =  0xA4;
enum SSD1306_DISPLAYALLON          =  0xA5;
enum SSD1306_NORMALDISPLAY         =  0xA6;
enum SSD1306_INVERTDISPLAY         =  0xA7;
enum SSD1306_DISPLAYOFF            =  0xAE;
enum SSD1306_DISPLAYON             =  0xAF;
enum SSD1306_SETDISPLAYOFFSET      =  0xD3;
enum SSD1306_SETCOMPINS            =  0xDA;
enum SSD1306_SETVCOMDETECT         =  0xDB;
enum SSD1306_SETDISPLAYCLOCKDIV    =  0xD5;
enum SSD1306_SETPRECHARGE          =  0xD9;
enum SSD1306_SETMULTIPLEX          =  0xA8;
enum SSD1306_SETLOWCOLUMN          =  0x00;
enum SSD1306_SETHIGHCOLUMN         =  0x10;
enum SSD1306_SETSTARTLINE          =  0x40;
enum SSD1306_MEMORYMODE            =  0x20;
enum SSD1306_COMSCANINC            =  0xC0;
enum SSD1306_COMSCANDEC            =  0xC8;
enum SSD1306_SEGREMAP              =  0xA0;
enum SSD1306_CHARGEPUMP            =  0x8D;
enum SSD1306_EXTERNALVCC           =  0x1;
enum SSD1306_SWITCHCAPVCC          =  0x2;
enum SSD1306_COLUMNADDR            =  0x21;
enum SSD1306_PAGEADDR              =  0x22;

struct SSD1306(int WIDTH = 128,
               int HEIGHT = 64)
{
  enum bufferLen = WIDTH * HEIGHT / 8;
  ubyte[bufferLen] buffer;

  void init() {
    i2cSetup();
    // Initialisation sequence
    turnOff();
    // 1. set mux ratio
    command!(SSD1306_SETMULTIPLEX);
    command!(0x3F);
    // 2. set display offset
    command!(SSD1306_SETDISPLAYOFFSET);
    command!(0x0);
    // 3. set display start line
    command!(SSD1306_SETSTARTLINE);
    command!(SSD1306_MEMORYMODE);
    command!(0x00);
    // 4. set Segment re-map A0h/A1h
    command!(SSD1306_SEGREMAP | 0x1);
    // 5. Set COM Output Scan Direction
    //    C0h/C8h
    command!(SSD1306_COMSCANDEC);
    // 6. Set COM Pins hardware configuration
    //    DAh, 12
    command!(SSD1306_SETCOMPINS);
    command!(0x12);
    // 7. Set Contrast Control 81h, 7Fh
    command!(SSD1306_SETCONTRAST);
    command!(0xff);
    // 8. Disable Entire Display On A4h
    command!(SSD1306_DISPLAYALLON_RESUME);
    // 9. Set Normal Display A6h
    command!(SSD1306_NORMALDISPLAY);
    // 10. Set Osc Frequency  D5h, 80h
    command!(SSD1306_SETDISPLAYCLOCKDIV);
    command!(0x80);
    // 11. Enable charge pump regulator 8Dh,
    //     14h
    command!(SSD1306_CHARGEPUMP );
    command!(0x14);
    // 12. Display On AFh
    turnOn();
    turnOff();
    turnOn();
  }

  void i2cSetup() {
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
      i2c_speeds.i2c_speed_sm_100k,
      I2C_CR2_FREQ_36MHZ);
    i2c_peripheral_enable(I2C1);

    gpio_set_mode(
      GPIOB, GPIO_MODE_OUTPUT_2_MHZ,
      GPIO_CNF_OUTPUT_PUSHPULL, GPIO5);

    gpio_set(GPIOB, GPIO5);
    sleep(1);
    gpio_clear(GPIOB, GPIO5);
    sleep(10);
    gpio_set(GPIOB, GPIO5);
  }

  void command(int comm)() {
    ubyte[2] buf =[0x00, comm];
    i2c_transfer7(I2C1, SSD1306_ADDRESS,
                  buf.ptr, 2, null, 0);
  }

  void refresh() {
    command!(SSD1306_COLUMNADDR);
    command!(0);
    command!(WIDTH-1);
    command!(SSD1306_PAGEADDR);
    command!(0);
    command!((HEIGHT/8)-1);

    ubyte[1+bufferLen] buf;
    buf[0] = 0x40;
    buf[1 .. $] = buffer[];
    i2c_transfer7(I2C1, SSD1306_ADDRESS,
      buf.ptr, buf.length, null, 0);
  }

  void turnOn() {
    command!(SSD1306_DISPLAYON);
  }

  void turnOff() {
    command!(SSD1306_DISPLAYOFF);
  }

  void clearScreen() {
    buffer[] = 0x00;
  }

  void drawPixel(int x, int y, int color) {
    if (x < 0) return;
    if (y < 0) return;
    if (x >= WIDTH) return;
    if (y >= HEIGHT) return;

    auto bytePos = x + (y/8) * WIDTH;
    auto bit = 1 << (y & 7);
    switch (color)
    {
      case Color.WHITE  :
        buffer[bytePos] |= bit;
        break;
      case Color.BLACK  :
        buffer[bytePos] &= ~bit;
        break;
      case Color.INVERSE:
        buffer[bytePos] ^= bit;
        break;
      default:
    }
  }

  void SWAP(ref int a, ref int b)
  {
    int t = a;
    a = b;
    b = t;
  }

  int abs(int v) {
    return (v < 0) ? -v : v;
  }

  void drawLine(int x0, int y0,
                int x1, int y1,
                int color) {
    int steep = (abs(y1 - y0) > abs(x1 - x0));
    if (steep) {
      SWAP(x0, y0);
      SWAP(x1, y1);
    }
    if (x0 > x1) {
      SWAP(x0, x1);
      SWAP(y0, y1);
    }

    int dx = x1 - x0;
    int dy = abs(y1 - y0);

    int err = dx / 2;
    int ystep;

    if (y0 < y1)
      ystep = 1;
    else
      ystep = -1;

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

  void fillRect(int x, int y,
                int w, int h,
                int color) {
    foreach(yy; y .. y+h)
      foreach(xx; x .. x+w)
        drawPixel(xx, yy, color);
  }

  void drawRect(int x, int y,
                int w, int h,
                int color) {
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
