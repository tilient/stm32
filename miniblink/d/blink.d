import api;

//--- main -----------------------------------

enum ledPort = GPIOC;
enum ledPin = GPIO13;

extern(C) void main()
{
  import std.range: iota, chain, retro, drop;

  rcc_clock_setup_in_hse_8mhz_out_72mhz();
  ledSetup();
  timerSetup();

  i2cSetup();
  ssd1306Init();

  enum r = iota(1, 33);
  enum wave = r.chain(r.retro.drop(1));
  foreach(_; 0 .. 10)
    foreach(x; wave) {
      ssd1306ClearScreen();
      ssd1306FillRect(x, x, 80, 30, WHITE);
      sleep(100);
      ssd1306Refresh();
      ssd1306FillRect(x+5, x+5, 70, 20, BLACK);
      sleep(100);
      ssd1306Refresh();
    }

  ssd1306TurnOff();

  ledBlinkTest(30);
  for (;;)
    ledWaveTest();
}

//--- OLED Display ---------------------------
/*
128x64 OLED display
I2C
SSD1306

PB5 - OLED RST
PB6 - OLED SCL
PB7 - OLED SDA

*/

void i2cSetup()
{
  rcc_periph_clock_enable(RCC_GPIOB);
  rcc_periph_clock_enable(RCC_I2C1);

  gpio_set_mode(GPIOB, GPIO_MODE_OUTPUT_50_MHZ,
    GPIO_CNF_OUTPUT_ALTFN_OPENDRAIN,
    GPIO_I2C1_SDA); //PB7
  gpio_set_mode(GPIOB, GPIO_MODE_OUTPUT_50_MHZ,
    GPIO_CNF_OUTPUT_ALTFN_OPENDRAIN,
    GPIO_I2C1_SCL); //PB6

  i2c_reset(I2C1);
  i2c_peripheral_disable(I2C1);
  i2c_set_speed(I2C1, i2c_speeds.i2c_speed_sm_100k,
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

enum BLACK   =  0;
enum WHITE   =  1;
enum INVERSE =  2;

enum MULTILAYER =  1;
enum LAYER0     =  1;
enum LAYER1     =  2;

enum SSD1306_LCDWIDTH  = 128;
enum SSD1306_LCDHEIGHT = 	64;

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

shared ubyte[SSD1306_LCDWIDTH * SSD1306_LCDHEIGHT / 8] buffer;

void  ssd1306Init()
{
//   _font = (FONT_INFO*)&ubuntuMono_24ptFontInfo;
//
  // Initialisation sequence
  ssd1306TurnOff();
  //  1. set mux ratio
  ssd1306Command!(SSD1306_SETMULTIPLEX);
  ssd1306Command!(0x3F);
  //  2. set display offset
  ssd1306Command!(SSD1306_SETDISPLAYOFFSET);
  ssd1306Command!(0x0);
  //  3. set display start line
  ssd1306Command!(SSD1306_SETSTARTLINE);
  ssd1306Command!(SSD1306_MEMORYMODE); // 0x20
  ssd1306Command!(0x00);               // 0x0 act like ks0108
  //  4. set Segment re-map A0h/A1h
  ssd1306Command!(SSD1306_SEGREMAP | 0x1);
  //   5. Set COM Output Scan Direction C0h/C8h
  ssd1306Command!(SSD1306_COMSCANDEC);
  //  6. Set COM Pins hardware configuration DAh, 12
  ssd1306Command!(SSD1306_SETCOMPINS);
  ssd1306Command!(0x12);
  //  7. Set Contrast Control 81h, 7Fh
  ssd1306Command!(SSD1306_SETCONTRAST);
  ////if (vccstate == SSD1306_EXTERNALVCC)
  ////  ssd1306Command!(0x9F);
  ////else
    ssd1306Command!(0xff);
  //  8. Disable Entire Display On A4h
  ssd1306Command!(SSD1306_DISPLAYALLON_RESUME);
  //  9. Set Normal Display A6h
  ssd1306Command!(SSD1306_NORMALDISPLAY);
  //  10. Set Osc Frequency  D5h, 80h
  ssd1306Command!(SSD1306_SETDISPLAYCLOCKDIV);
  ssd1306Command!(0x80);
  //  11. Enable charge pump regulator 8Dh, 14h
  ssd1306Command!(SSD1306_CHARGEPUMP );
  ////if (vccstate == SSD1306_EXTERNALVCC)
  ////  ssd1306Command!(0x10);
  ////else
  ssd1306Command!(0x14);
  //  12. Display On AFh
  ssd1306TurnOn();
}

void ssd1306Refresh()
{

  ssd1306Command!(SSD1306_COLUMNADDR); // 0x21 COMMAND
  ssd1306Command!(0); // Column start address
  ssd1306Command!(SSD1306_LCDWIDTH-1); // Column end address

  ssd1306Command!(SSD1306_PAGEADDR); // 0x22 COMMAND
  ssd1306Command!(0); // Start Page address
  ssd1306Command!((SSD1306_LCDHEIGHT/8)-1);// End Page address

  ubyte[1+SSD1306_LCDWIDTH * SSD1306_LCDHEIGHT / 8] buf;
  buf[1..$] = buffer[];
  buf[0] = 0x40;
  i2c_transfer7(I2C1, SSD1306_ADDRESS,
                buf.ptr, buf.length, null, 0);
}

void ssd1306TurnOn()
{
  ssd1306Command!(SSD1306_DISPLAYON);
}

void ssd1306TurnOff()
{
  ssd1306Command!(SSD1306_DISPLAYOFF);
}

void  ssd1306Command(int comm)()
{
  ubyte[2] buf;
  buf[0] = 0x00;
  buf[1] = comm;
  i2c_transfer7(I2C1, SSD1306_ADDRESS,
                buf.ptr, 2, null, 0);
}

void ssd1306ClearScreen()
{
  buffer[] = 0x00;
}

void ssd1306DrawPixel(int x, int y, int color)
{
  import core.atomic: atomicOp;

  if (x < 0)
    return;
  if (y < 0)
    return;
  if (x >= SSD1306_LCDWIDTH)
    return;
  if (y >= SSD1306_LCDHEIGHT)
    return;

  auto bytePos = x + (y / 8) * SSD1306_LCDWIDTH;
  auto bit = 1 << (y & 7);
  switch (color)
  {
    case WHITE  : buffer[bytePos].atomicOp!"|="( bit); break;
    case BLACK  : buffer[bytePos].atomicOp!"&="(~bit); break;
    case INVERSE: buffer[bytePos].atomicOp!"^="( bit); break;
    default:
  }
}

void SWAP(ref short a, ref short b)
{
  short t = a;
  a = b;
  b = t;
}

short abs(int v) {
  return cast(short)((v < 0) ? -v : v);
}

void ssd1306DrawLine(short x0, short y0,
                     short x1, short y1,
                     ushort color)
{
  short steep = (abs(y1 - y0) > abs(x1 - x0));
  if (steep) {
    SWAP(x0, y0);
    SWAP(x1, y1);
  }

  if (x0 > x1) {
    SWAP(x0, x1);
    SWAP(y0, y1);
  }

  short dx, dy;
  dx = cast(short)(x1 - x0);
  dy = abs(y1 - y0);

  short err   = dx / 2;
  short ystep;

  if (y0 < y1) {
    ystep = 1;
  } else {
    ystep = -1;
  }

  for (; x0 <= x1; x0++) {
    if (steep) {
      ssd1306DrawPixel(y0, x0, color);
    } else {
      ssd1306DrawPixel(x0, y0, color);
    }
    err -= dy;
    if (err < 0) {
      y0 += ystep;
      err += dx;
    }
  }
}

// void  ssd1306SetFont(FONT_INFO * f) {
//     _font = f;
// }

void ssd1306FillRect(int x, int y, int w, int h,
                     int color)
{
  int x0 = x;
  int x1 = x + w;
  int y1 = y + h;
  for(; y < y1; y++)
    for(x = x0; x < x1; x++)
      ssd1306DrawPixel(x, y, color);
}

void ssd1306DrawRect(short x, short y, short w, short h,
                     ushort color)
{
  if (w == 0)
    return;
  if (h == 0)
    return;
  short x1 = cast(short)(x + w - 1);
  short y1 = cast(short)(y + h - 1);
  short yp1 = cast(short)(y + 1);
  short y1m1 = cast(short)(y1 - 1);

  if((h > 2 ) | (w > 2)) {
    ssd1306DrawLine(x,    y, x1,    y, color);
    ssd1306DrawLine(x,   y1, x1,   y1, color);
    ssd1306DrawLine(x,  yp1,  x, y1m1, color);
    ssd1306DrawLine(x1, yp1, x1, y1m1, color);
  } else {
    ssd1306DrawLine(x,  y, x1,  y, color);
    ssd1306DrawLine(x, y1, x1, y1, color);
  }
}

// short  ssd1306DrawChar(short x, short y,
//                          ubyte c, ubyte size,
//                          ushort color)
// {
//     short i,j,k, _x;
//     ushort line;
//
//     if( (c < _font->startChar) ||   // skip if character don't exist
//         (c > _font->endChar))        // skip if character don't exist
//     return 0;
//
//     c = c - _font->startChar;
//     // skip invisible characters
//     line = _font->charInfo[c].offset;
//     // scan height
//     for ( i=0; i < _font->charInfo[c].heightBits; i++ ) {
//         k =  (_font->charInfo[c].widthBits-1)/8 + 1; //number of bytes in a row
//         _x = 0;
//         do {
//             short l = _font->data[line];
//             // scan width
//             for ( j = 0; j < 8; j++ ) {
//                 if ( l & 0x80 ) {
//                     if (size == 1) {
//                         ssd1306DrawPixel( x+_x, y+i, color, layer );
//                     } else {
//                         ssd1306DrawRect(x+(_x*size), y+(i*size), size, size, color, layer);
//                     }
//                 }
//                 l <<= 1;
//                 _x++;
//             }
//         k--;
//         line++;
//         } while (k > 0);
//     }
//     //    ssd1306Refresh();
//     return _font->charInfo[c].widthBits; // return characher width
// }
//
// void  ssd1306DrawString(short x, short y, int8_t *text, ubyte size,
//                         ushort color, ushort layer)
// {
//   static ushort l, pos;
//   pos =  0;
//   for (l = 0; l < strlen(text); l++)
//   {
//     pos = pos + ssd1306DrawChar(x + (pos * size + 1), y, text[l], size, color, layer);
//   }
// }

//--------------------------------------------
