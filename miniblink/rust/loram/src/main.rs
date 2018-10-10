#![no_std]
#![no_main]

/*
cargo build --release
arm-none-eabi-objcopy -Obinary target/thumbv7m-none-eabi/release/blink blink.bin
*/

extern crate panic_halt;
extern crate cortex_m_rt;
extern crate embedded_graphics;
extern crate ssd1306;
extern crate stm32f103xx_hal;

use cortex_m_rt::entry;
use stm32f103xx_hal::i2c::{BlockingI2c, DutyCycle, Mode};
use stm32f103xx_hal::prelude::*;
use stm32f103xx_hal::delay::Delay;

use embedded_graphics::image::Image1BPP;
use embedded_graphics::fonts::Font12x16;
use embedded_graphics::prelude::*;
use ssd1306::prelude::*;
use ssd1306::Builder;

#[entry]
fn main() -> ! {
  let cp = cortex_m::Peripherals::take().unwrap();
  let dp = stm32f103xx_hal::stm32f103xx::Peripherals
             ::take().unwrap();

  let mut flash = dp.FLASH.constrain();
  let mut rcc = dp.RCC.constrain();

  let clocks = rcc.cfgr.freeze(&mut flash.acr);

  let mut afio = dp.AFIO.constrain(&mut rcc.apb2);

  let mut gpiob = dp.GPIOB.split(&mut rcc.apb2);

  let mut rst = gpiob.pb5.into_push_pull_output(&mut gpiob.crl);
  let scl = gpiob.pb6.into_alternate_open_drain(&mut gpiob.crl);
  let sda = gpiob.pb7.into_alternate_open_drain(&mut gpiob.crl);


  let i2c = BlockingI2c::i2c1(
              dp.I2C1, (scl, sda), &mut afio.mapr,
              Mode::Fast { frequency: 400_000,
                           duty_cycle: DutyCycle::Ratio2to1 },
              clocks, &mut rcc.apb1, 1000, 10, 1000, 1000);

  let im = Image1BPP::new(include_bytes!("./rust.raw"), 64, 64)
             .translate(Coord::new(64, 0));

  let mut delay = Delay::new(cp.SYST, clocks);
  let mut disp: GraphicsMode<_> =
    Builder::new().connect_i2c(i2c).into();
  disp.reset(&mut rst, &mut delay);
  disp.init().unwrap();

  loop {
    disp.clear();
    disp.flush().unwrap();
    delay.delay_ms(500_u16);

    disp.draw(
      Font12x16::render_str("Hello")
        .with_stroke(Some(1u8.into()))
        .into_iter());

    disp.flush().unwrap();
    delay.delay_ms(500_u16);

    disp.draw(
      Font12x16::render_str("Rust!")
        .with_stroke(Some(1u8.into()))
        .translate(Coord::new(0, 32))
        .into_iter());

    disp.flush().unwrap();
    delay.delay_ms(500_u16);

    disp.draw(im.into_iter());
    disp.flush().unwrap();
    delay.delay_ms(1500_u16);
  }
}

