#![no_std]
#![no_main]

/*
cargo build --release
cargo objcopy --bin blink --release -- -O binary blink.bin
*/

extern crate panic_halt;
extern crate cortex_m_rt;
extern crate embedded_graphics;
extern crate ssd1306;
extern crate stm32f103xx_hal;

use cortex_m_rt::entry;
use stm32f103xx_hal::prelude::*;
use stm32f103xx_hal::i2c::{BlockingI2c, DutyCycle, Mode};
use stm32f103xx_hal::delay::Delay;
use stm32f103xx_hal::stm32f103xx::Peripherals;
use embedded_graphics::prelude::*;
use embedded_graphics::image::Image1BPP;
use embedded_graphics::fonts::Font12x16;
use ssd1306::prelude::*;
use ssd1306::Builder;

#[entry]
fn main() -> ! {
  let cp = cortex_m::Peripherals::take().unwrap();
  let dp = Peripherals::take().unwrap();
  let mut flash = dp.FLASH.constrain();
  let mut rcc = dp.RCC.constrain();
  let clocks = rcc.cfgr.freeze(&mut flash.acr);
  let mut delay = Delay::new(cp.SYST, clocks);
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
  let mut disp: GraphicsMode<_> =
    Builder::new()
      .with_rotation(DisplayRotation::Rotate180)
      .connect_i2c(i2c).into();
  disp.reset(&mut rst, &mut delay);
  disp.init().unwrap();

  let im = Image1BPP::new(include_bytes!("./rust.raw"), 64, 64)
             .translate(Coord::new(64, 0));
  loop {
    disp.clear();
    disp.draw(im.into_iter());
    disp.flush().unwrap();

    render_str(&mut disp, &mut delay,  0, "Hello");
    render_str(&mut disp, &mut delay, 16, "world");
    render_str(&mut disp, &mut delay, 32, "from");
    render_str(&mut disp, &mut delay, 48, "Wiffel");

    delay.delay_ms(1000_u16);
  }
}

fn render_str<T>(disp: &mut GraphicsMode<T>,
                 delay: &mut Delay, y: i32, chars: &str)
where T: ssd1306::interface::DisplayInterface
{
  for i in 0 .. chars.len() {
    disp.draw(Font12x16::render_str(&chars[0..i+1])
                .with_stroke(Some(1u8.into()))
                .translate(Coord::new(0, y))
                .into_iter());
    disp.flush().unwrap();
    delay.delay_ms(200_u16);
  }
}

