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

// from machine import Pin, SPI, reset_cause, \
//                     DEEPSLEEP_RESET, RTC, deepsleep, DEEPSLEEP
// from time import sleep, localtime
// from network import WLAN, STA_IF, AP_IF
// from ntptime import settime
//
// #############################################################
// # ePaper Clock
// #############################################################
//
// xDot = 128
// yDot = 296
//
// spi  = SPI(1, baudrate = 2000000, polarity = 0, phase = 0)
// cs   = Pin(5, Pin.OUT)
// dc   = Pin(4, Pin.OUT)
// rst  = Pin(0, Pin.OUT)
// busy = Pin(15, Pin.IN)
//
// ###################################################################
// # Setup Wifi once:
// #  import network
// #  sta_if = network.WLAN(network.STA_IF)
// #  sta_if.active(True)
// #  sta_if.connect('sid','pwd')
// ###################################################################
// # lolin esp8266 EPD
// # ----- ------- ---
// # 3V3   -       VCC	3.3V
// # GND   -       GND	Ground
// # D7    HMOSI   DIN	SPI MOSI pin
// # D5    HSCLK   CLK	SPI SCK pin
// # D1    GPIO05  CS	SPI chip selection, low active
// # D2    GPIO04  DC	Data/Command selection (high=data, low=cmd)
// # D3    GPIO00  RST	External reset, low active
// # D8    GPIO15  BUSY	Busy status output, low active
// ###################################################################
//
// def main():
//   if reset_cause() != DEEPSLEEP_RESET:
//     sleep(10)
//   epdInit()
//   updateTimeFromInternetIfNeeded()
//   drawClock()
//   goToDeepSleep()
//
// #############################################################
// # Deep Sleep Logic
// #############################################################
//
// def goToDeepSleep(seconds = 0):
//   epdWrite(0x10, 0x01)
//   if seconds <= 0:
//     seconds = 60 - localtime()[5]
//   rtc = RTC()
//   rtc.irq(trigger = rtc.ALARM0, wake = DEEPSLEEP)
//   rtc.alarm(rtc.ALARM0, seconds * 1000)
//   deepsleep()
//
// #############################################################
// # Update Time From Internet every 60 cycles (~ every hour)
// #############################################################
//
// def updateTimeFromInternetIfNeeded(maxCount = 60):
//   rtc = RTC()
//   counter = maxCount
//   if reset_cause() == DEEPSLEEP_RESET:
//     try:
//       buffer = rtc.memory()
//       if len(buffer) > 0:
//         counter = buffer[0]
//     except:
//       pass
//   counter += 1
//   if counter > maxCount:
//     updateTimeFromInternet()
//     counter = 0
//   buffer = bytearray(1)
//   buffer[0] = counter
//   rtc.memory(buffer)
//
// def updateTimeFromInternet():
//   wlan = WLAN(STA_IF)
//   wlan.active(True)
//   wlan.connect()
//   for t in range(20):
//     if wlan.isconnected():
//       break
//     sleep(3)
//   for t in range(20):
//     try:
//       settime()
//       break
//     except:
//       sleep(3)
//   wlan.active(False)
//   WLAN(AP_IF).active(False)
//
// ###################################################################
//
// buf1 = bytearray(1)
//
// def epdWriteCmd(cmd):
//   waitBusy()
//   buf1[0] = cmd
//   cs.off()
//   dc.off()
//   spi.write(buf1)
//   cs.on()
//
// def epdWrite(cmd, data):
//   waitBusy()
//   buf1[0] = cmd
//   cs.off()
//   dc.off()
//   spi.write(buf1)
//   dc.on()
//   buf1[0] = data
//   spi.write(buf1)
//   cs.on()
//
// def epdWriteData(cmd, data):
//   waitBusy()
//   buf1[0] = cmd
//   buf = bytearray(len(data))
//   for i in range(len(data)):
//     buf[i] = data[i]
//   cs.off()
//   dc.off()
//   spi.write(buf1)
//   dc.on()
//   spi.write(buf)
//   cs.on()
//
// def epdWriteTimes(cmd, data, times):
//   buf1[0] = cmd
//   cs.off()
//   dc.off()
//   spi.write(buf1)
//   dc.on()
//   buf1[0] = data
//   for i in range(times):
//     spi.write(buf1)
//   cs.on()
//
// def epdClearScreen():
//   waitBusy()
//   epdWrite(0x4e,0x00)
//   epdWriteData(0x4f,[0x27,0x01])
//   epdWriteTimes(0x24,0xff, (xDot * yDot) // 8)
//
// def epdUpdate():
//   waitBusy()
//   epdWrite(0x22,0xc7)
//   epdWriteCmd(0x20)
//   epdWriteCmd(0xff)
//
// def epdReset():
//   cs.off()
//   rst.on()
//   sleep(0.05)
//   rst.off()
//   sleep(0.05)
//   rst.on()
//   cs.on()
//
// def epdInit():
//   waitBusy()
//   epdReset()
//
//   waitBusy()
//   epdWriteData(0x01,[0x27,0x01,0x00]) # Pannel configuration
//   epdWriteData(0x0c,[0xd7,0xd6,0x9d]) # X decrease, Y decrease
//   epdWrite(0x2c,0xa8) # VCOM setting
//   epdWrite(0x3a,0x1a) # dummy line per gate
//   epdWrite(0x3b,0x08) # Gage time setting
//   epdWrite(0x11,0x01) # X increase, Y decrease
//
//   waitBusy()
//   epdWriteData(0x44, [0x00,0x0F])
//   epdWriteData(0x45, [0x27,0x01,0x00,0x00])
//   epdWrite(0x4e,0x00)
//   epdWriteData(0x4f,[0x27,0x01])
//
//   waitBusy()
//   epdWriteData(0x32,
//                [0x02,0x02,0x01,0x11,0x12,0x12,0x22,0x22,0x66, 0x69,
//                 0x69,0x59,0x58,0x99,0x99,0x88,0x00,0x00, 0x00,0x00,
//                 0xF8,0xB4,0x13,0x51,0x35,0x51,0x51,0x19,0x01,0x00])
//   epdWrite(0x22,0xc0)
//   epdWriteCmd(0x20)
//
// def waitBusy():
//   for i in range(0,400):
//     if busy.value() == 0:
//       return
//     sleep(0.01)
//
// ##################################################################
//
// filename = 'digits.bin'
// offsets  = [[   0, 61], [ 976, 52], [1808, 64], [2832, 65],
//             [3872, 65], [4912, 61], [5888, 63], [6896, 60],
//             [7856, 60], [8816, 63], [9824, 21]]
// dotBytes =   b'\xff\xff\xff\xff\xff\xaa\xaa\xaa\xff\xaa\xaa\xaa\xff\xff\xff\xff'
// emptyBytes = b'\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff'
//
// def lenNum(n):
//   return offsets[n][1]
//
// def drawDot():
//   waitBusy()
//   spi.write(emptyBytes)
//   for i in range(2):
//     spi.write(dotBytes)
//   spi.write(emptyBytes)
//
// def drawEmpty(n):
//   waitBusy()
//   for i in range(n):
//     spi.write(emptyBytes)
//
// def drawDotDigit():
//   waitBusy()
//   spi.write(emptyBytes)
//   f = open(filename,'rb')
//   f.seek(offsets[10][0])
//   for i in range(lenNum(10)):
//     spi.write(f.read(16))
//   f.close()
//   spi.write(emptyBytes)
//
// def drawDigits(d1, d2):
//   waitBusy()
//   f = open(filename,'rb')
//   f.seek(offsets[d1][0])
//   for i in range(lenNum(d1)):
//     spi.write(f.read(16))
//   spi.write(emptyBytes)
//   f.seek(offsets[d2][0])
//   for i in range(lenNum(d2)):
//     spi.write(f.read(16))
//   f.close()
//
// def drawClock():
//   now = localtime()
//   h = (2 + now[3]) % 24
//   m = now[4]
//   waitBusy()
//   #epdClearScreen()
//   epdWrite(0x4e,0x00)
//   epdWriteData(0x4f,[0x27,0x01])
//   buf1[0] = 0x24
//   cs.off()
//   dc.off()
//   spi.write(buf1)
//   dc.on()
//   margin = yDot
//   h1, h2 = h // 10, h % 10
//   m1, m2 = m // 10, m % 10
//   margin -= 4 + lenNum(10) + lenNum(h1) + lenNum(h2) \
//           + lenNum(m1)+ lenNum(m2)
//   drawEmpty(margin // 2)
//   drawDigits(h1, h2)
//   drawDotDigit()
//   drawDigits(m1, m2)
//   drawEmpty(margin - margin // 2)
//   cs.on()
//   waitBusy()
//   epdUpdate()
//   waitBusy()
//   sleep(0.05)
//
// ##################################################################
//
// main()
//
// ##################################################################
//--------------------------------------------

// /*
//  * This file is part of the libopencm3 project.
//  *
//  * Copyright (C) 2009 Uwe Hermann <uwe@hermann-uwe.de>
//  * Copyright (C) 2013 Stephen Dwyer <scdwyer@ualberta.ca>
//  *
//  * This library is free software: you can redistribute it and/or modify
//  * it under the terms of the GNU Lesser General Public License as published by
//  * the Free Software Foundation, either version 3 of the License, or
//  * (at your option) any later version.
//  *
//  * This library is distributed in the hope that it will be useful,
//  * but WITHOUT ANY WARRANTY; without even the implied warranty of
//  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  * GNU Lesser General Public License for more details.
//  *
//  * You should have received a copy of the GNU Lesser General Public License
//  * along with this library.  If not, see <http://www.gnu.org/licenses/>.
//  */
//
// #include <libopencm3/stm32/rcc.h>
// #include <libopencm3/stm32/gpio.h>
// #include <libopencm3/stm32/usart.h>
// #include <libopencm3/stm32/dma.h>
// #include <libopencm3/cm3/nvic.h>
// #include <libopencm3/stm32/spi.h>
// #include <stdio.h>
// #include <errno.h>
//
// int _write(int file, char *ptr, int len);
//
// static void clock_setup(void)
// {
// 	rcc_clock_setup_in_hse_12mhz_out_72mhz();
//
// 	/* Enable GPIOA, GPIOB, GPIOC clock. */
// 	rcc_periph_clock_enable(RCC_GPIOA);
// 	rcc_periph_clock_enable(RCC_GPIOB);
// 	rcc_periph_clock_enable(RCC_GPIOC);
//
// 	/* Enable clocks for GPIO port A (for GPIO_USART2_TX) and USART2. */
// 	rcc_periph_clock_enable(RCC_GPIOA);
// 	rcc_periph_clock_enable(RCC_AFIO);
// 	rcc_periph_clock_enable(RCC_USART2);
//
// 	/* Enable SPI1 Periph and gpio clocks */
// 	rcc_periph_clock_enable(RCC_SPI1);
// }
//
// static void spi_setup(void) {
//
//   /* Configure GPIOs: SS=PA4, SCK=PA5, MISO=PA6 and MOSI=PA7 */
//   gpio_set_mode(GPIOA, GPIO_MODE_OUTPUT_50_MHZ,
//             GPIO_CNF_OUTPUT_ALTFN_PUSHPULL, GPIO4 |
//             								GPIO5 |
//                                             GPIO7 );
//
//   gpio_set_mode(GPIOA, GPIO_MODE_INPUT, GPIO_CNF_INPUT_FLOAT,
//           GPIO6);
//
//   /* Reset SPI, SPI_CR1 register cleared, SPI is disabled */
//   spi_reset(SPI1);
//
//   /* Set up SPI in Master mode with:
//    * Clock baud rate: 1/64 of peripheral clock frequency
//    * Clock polarity: Idle High
//    * Clock phase: Data valid on 2nd clock pulse
//    * Data frame format: 8-bit
//    * Frame format: MSB First
//    */
//   spi_init_master(SPI1, SPI_CR1_BAUDRATE_FPCLK_DIV_64, SPI_CR1_CPOL_CLK_TO_1_WHEN_IDLE,
//                   SPI_CR1_CPHA_CLK_TRANSITION_2, SPI_CR1_DFF_8BIT, SPI_CR1_MSBFIRST);
//
//   /*
//    * Set NSS management to software.
//    *
//    * Note:
//    * Setting nss high is very important, even if we are controlling the GPIO
//    * ourselves this bit needs to be at least set to 1, otherwise the spi
//    * peripheral will not send any data out.
//    */
//   spi_enable_software_slave_management(SPI1);
//   spi_set_nss_high(SPI1);
//
//   /* Enable SPI1 periph. */
//   spi_enable(SPI1);
// }
//
// static void usart_setup(void)
// {
// 	/* Setup GPIO pin GPIO_USART2_TX and GPIO_USART2_RX. */
// 	gpio_set_mode(GPIOA, GPIO_MODE_OUTPUT_50_MHZ,
// 		      GPIO_CNF_OUTPUT_ALTFN_PUSHPULL, GPIO_USART2_TX);
// 	gpio_set_mode(GPIOA, GPIO_MODE_INPUT,
// 		      GPIO_CNF_INPUT_FLOAT, GPIO_USART2_RX);
//
// 	/* Setup UART parameters. */
// 	usart_set_baudrate(USART2, 9600);
// 	usart_set_databits(USART2, 8);
// 	usart_set_stopbits(USART2, USART_STOPBITS_1);
// 	usart_set_mode(USART2, USART_MODE_TX_RX);
// 	usart_set_parity(USART2, USART_PARITY_NONE);
// 	usart_set_flow_control(USART2, USART_FLOWCONTROL_NONE);
//
// 	/* Finally enable the USART. */
// 	usart_enable(USART2);
// }
//
// int _write(int file, char *ptr, int len)
// {
// 	int i;
//
// 	if (file == 1) {
// 		for (i = 0; i < len; i++)
// 			usart_send_blocking(USART2, ptr[i]);
// 		return i;
// 	}
//
// 	errno = EIO;
// 	return -1;
// }
//
// static void gpio_setup(void)
// {
// 	/* Set GPIO8 (in GPIO port A) to 'output push-pull'. */
// 	gpio_set_mode(GPIOA, GPIO_MODE_OUTPUT_2_MHZ,
// 		      GPIO_CNF_OUTPUT_PUSHPULL, GPIO8);
// }
//
// int main(void)
// {
// 	int counter = 0;
// 	uint16_t rx_value = 0x42;
//
// 	clock_setup();
// 	gpio_setup();
// 	usart_setup();
// 	spi_setup();
//
//
// 	/* Blink the LED (PA8) on the board with every transmitted byte. */
// 	while (1) {
// 		/* LED on/off */
// 		gpio_toggle(GPIOA, GPIO8);
//
// 		/* printf the value that SPI should send */
// 		printf("Counter: %i  SPI Sent Byte: %i", counter, (uint8_t) counter);
// 		/* blocking send of the byte out SPI1 */
// 		spi_send(SPI1, (uint8_t) counter);
// 		/* Read the byte that just came in (use a loopback between MISO and MOSI
// 		 * to get the same byte back)
// 		 */
// 		rx_value = spi_read(SPI1);
// 		/* printf the byte just received */
// 		printf("    SPI Received Byte: %i\r\n", rx_value);
//
// 		counter++;
//
// 	}
//
// 	return 0;
// }
//--------------------------------------------
