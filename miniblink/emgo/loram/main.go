package main

import (
	"delay"

	"stm32/hal/gpio"
	"stm32/hal/system"
	"stm32/hal/system/timer/systick"
)

var led gpio.Pin

func init() {
	system.SetupPLL(8, 1, 72/8)
	systick.Setup(2e6)

	gpio.C.EnableClock(false)
	led = gpio.C.Pin(13)

	cfg := gpio.Config{
		Mode:   gpio.Out,
		Speed:  gpio.Low,
		Driver: gpio.OpenDrain}
	led.Setup(&cfg)
	for {
		led.Clear()
		//delay.Millisec(100)
		led.Set()
		//delay.Millisec(400)
	}
}

func main() {
	for {
		led.Clear()
		delay.Millisec(100)
		led.Set()
		delay.Millisec(400)
	}
}

// import api;
//
// //--- main --------------------------------------------
//
// extern(C) void main()
// {
//   timerSetup();
//   auto led  = IO(GPIOC, GPIO13, RCC_GPIOC);
//   auto oled = SSD1306(128, 64, I2C1, 0x3C,
//                       GPIOB, GPIO5, RCC_GPIOB);
//   for (;;)
//   {
//     oled.test();
//     led.waveTest();
//     led.test();
//   }
// }
//
// //--- Tests -------------------------------------------
//
// void test(ref SSD1306 oled)
// {
//   import std.range : iota, chain, retro, cycle, take;
//
//   void drawing(int i)
//   {
//     alias x = i;
//     alias y = i;
//     immutable dx = 127 - 2 * i;
//     immutable dy = 63 - 2 * i;
//     oled.clear();
//     oled.fillRect(x, y, dx, dy, Color.white);
//     oled.fillRect(x + 5, y + 5, dx - 10, dy - 10,
//                   Color.black);
//     oled.refresh();
//     sleepMs(30);
//   }
//
//   oled.turnOn();
//   immutable steps = [1,3,5,7,9,11,13,15,17,19,21,23,25,
//                      23,21,19,17,15,13,11,9,7,5,3];
//   foreach(i; steps)
//     drawing(i);
//   oled.turnOff();
// }
//
// shared bool ledState = true;
//
// void test(ref IO led, int seconds = 1)
// {
//   foreach (_; 0 .. 10 * seconds)
//   {
//     ledState ? led.on() : led.off();
//     sleepMs(100);
//   }
// }
//
// void waveTest(ref IO led, int seconds = 2)
// {
//   import std.range: iota, retro, chain;
//   immutable max = 25;
//
//   void onOff(int onTime)
//   {
//     led.on();
//     sleepMs(onTime);
//     led.off();
//     sleepMs(max - onTime);
//   }
//
//   auto steps = iota(1, max);
//   auto wave  = steps.chain(steps.retro);
//   foreach (_; 0 .. 3)
//   {
//     foreach(onTime; wave)
//       onOff(onTime);
//     sleepMs(seconds * 1000 - max * (2 * max - 2));
//   }
// }
//
// //--- Timer -------------------------------------------
//
// void sleepMs(int milliseconds)
// {
//   import ldc.llvmasm;
//
//   timer_set_period(TIM2, milliseconds);
//   timer_enable_counter(TIM2);
//   __asm("wfi", "");
// }
//
// extern(C) void tim2_isr()
// {
//   if (timer_get_flag(TIM2, TIM_SR_CC1IF))
//   {
//     timer_clear_flag(TIM2, TIM_SR_CC1IF);
//     ledState = !ledState;
//   }
// }
//
// void timerSetup()
// {
//   rcc_periph_clock_enable(RCC_TIM2);
//   rcc_periph_reset_pulse(RST_TIM2);
//   timer_disable_preload(TIM2);
//   timer_set_prescaler(TIM2, 48_000);
//   timer_one_shot_mode(TIM2);
//   nvic_enable_irq(NVIC_TIM2_IRQ);
//   timer_enable_irq(TIM2, TIM_DIER_CC1IE);
// }
//
// //--- IO Port -----------------------------------------
//
// struct IO
// {
//   uint   port;
//   ushort pin;
//
//   this(uint port, ushort pin, int clk)
//   {
//     this.port = port;
//     this.pin = pin;
//     rcc_periph_clock_enable(clk);
//     gpio_set_mode(port, GPIO_MODE_OUTPUT_2_MHZ,
//                   GPIO_CNF_OUTPUT_PUSHPULL, pin);
//   }
//
//   void on()
//   {
//     gpio_set(port, pin);
//   }
//
//   void off()
//   {
//     gpio_clear(port, pin);
//   }
// }
//
// //--- SSD1306 -----------------------------------------
//
// struct SSD1306
// {
//   Gfx   gfx;
//   IO    resetIO;
//   uint  i2c;
//   ubyte i2cAddr;
//
//   alias gfx this;
//
//   this(int width, int height,
//        uint i2c, ubyte i2cAddr,
//        uint rstPort, ushort rstPin, int clk)
//   {
//     this.i2c = i2c;
//     this.i2cAddr = i2cAddr;
//     this.i2cSetup();
//     this.gfx = Gfx(width, height);
//     this.resetIO = IO(rstPort, rstPin, clk);
//     this.reset();
//     this.command(
//       0xAE, 0xA8, 0x3F, 0x00, 0x40, 0x20, 0x00, 0xA1,
//       0xC8, 0xDA, 0x12, 0x81, 0xff, 0xA4, 0xA6, 0xD5,
//       0x80, 0x8D, 0x14, 0xAF);
//   }
//
//   void i2cSetup()
//   {
//     rcc_periph_clock_enable(RCC_GPIOB);
//     rcc_periph_clock_enable(RCC_I2C1);
//
//     gpio_set_mode(GPIOB, GPIO_MODE_OUTPUT_50_MHZ,
//       GPIO_CNF_OUTPUT_ALTFN_OPENDRAIN, GPIO_I2C1_SDA);
//     gpio_set_mode(GPIOB, GPIO_MODE_OUTPUT_50_MHZ,
//       GPIO_CNF_OUTPUT_ALTFN_OPENDRAIN, GPIO_I2C1_SCL);
//
//     i2c_reset(this.i2c);
//     i2c_peripheral_disable(this.i2c);
//     i2c_set_speed(this.i2c,
//       i2c_speeds.i2c_speed_fm_400k,
//       I2C_CR2_FREQ_36MHZ);
//     i2c_peripheral_enable(this.i2c);
//   }
//
//   void reset()
//   {
//     resetIO.on();
//     sleepMs(1);
//     resetIO.off();
//     sleepMs(10);
//     resetIO.on();
//   }
//
//   void command(ubyte[] comm ...)
//   {
//     foreach(c; comm)
//     {
//       ubyte[2] buf = [0x00u, c];
//       i2c_transfer7(this.i2c, this.i2cAddr,
//                     buf.ptr, 2, null, 0);
//     }
//   }
//
//   void refresh()
//   {
//     this.command(
//       0x21, 0x00, cast(ubyte) (width - 1),
//       0x22, 0x00, cast(ubyte) ((height / 8) - 1));
//     this.gfx.buffer[0] = 0x40;
//     i2c_transfer7(this.i2c, this.i2cAddr,
//       this.gfx.buffer.ptr, this.gfx.buffer.length,
//       null, 0);
//   }
//
//   void turnOn()
//   {
//     this.command(0xAF);
//   }
//
//   void turnOff()
//   {
//     this.command(0xAE);
//   }
// }
//
// //--- Gfx ---------------------------------------------
//
// enum Color {black, white, inverse};
//
// struct Gfx
// {
//   int     width;
//   int     height;
//   ubyte[] buffer;
//
//   this(int width, int height)
//   {
//     import core.stdc.stdlib: malloc;
//
//     this.width = width;
//     this.height = height;
//     immutable len = 1 + width * height / 8;
//     this.buffer = (cast(ubyte*) malloc(len))[0..len];
//     this.buffer[] = 0x00u;
//   }
//
//   void clear()
//   {
//     this.buffer[] = 0x00u;
//   }
//
//   void drawPixel(int x, int y, int color)
//   {
//     if (x < 0) return;
//     if (y < 0) return;
//     if (x >= width) return;
//     if (y >= height) return;
//
//     auto b = &buffer[1 + x + (y / 8) * width];
//     immutable bit = 1 << (y & 7);
//     switch (color)
//     {
//       case Color.white   : *b |=  bit; break;
//       case Color.black   : *b &= ~bit; break;
//       case Color.inverse : *b ^=  bit; break;
//       default:
//     }
//   }
//
//   void fillRect(int x, int y, int w, int h, int color)
//   {
//     foreach(yy; y .. y + h)
//       foreach(xx; x .. x + w)
//         drawPixel(xx, yy, color);
//   }
// }
//
// //-----------------------------------------------------
