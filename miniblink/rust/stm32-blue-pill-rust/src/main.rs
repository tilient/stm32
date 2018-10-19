#![no_main]
#![no_std]
#![feature(panic_implementation)]
#![feature(core_intrinsics)]

/****************************************************** /
to build :

cargo build --release
arm-none-eabi-objcopy -Obinary \
  target/thumbv7m-none-eabi/release/bluepill blink.bin
/ ******************************************************/

extern crate cortex_m;
#[macro_use]
extern crate cortex_m_rt;
extern crate stm32f103xx_hal as bluepill_hal;

use cortex_m_rt::ExceptionFrame;
use bluepill_hal::delay::Delay;
use bluepill_hal::prelude::*;
use bluepill_hal::stm32f103xx::Peripherals;

entry!(main);

fn main() -> ! {
  let bluepill = Peripherals::take().unwrap();

  let mut rcc = bluepill.RCC.constrain();
  let mut flash = bluepill.FLASH.constrain();
  let clocks = rcc.cfgr.freeze(&mut flash.acr);

  let mut gpioc = bluepill.GPIOC.split(&mut rcc.apb2);
  let mut led = gpioc.pc13.into_push_pull_output(
                  &mut gpioc.crh);

  let cp = cortex_m::Peripherals::take().unwrap();
  let mut delay = Delay::new(cp.SYST, clocks);

  loop {
    led.set_high();
    delay.delay_ms(500_u16);
    led.set_low();
    delay.delay_ms(500_u16);
  }
}

//*******************************************************
//** Exceptions
//*******************************************************

exception!(HardFault, hard_fault);

fn hard_fault(ef: &ExceptionFrame) -> ! {
  panic!("Hard fault: {:#?}", ef);
}

exception!(*, default_handler);

fn default_handler(irqn: i16) {
  panic!("Unhandled exception (IRQn = {})", irqn);
}

//*******************************************************
//** Panic
//*******************************************************

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
  use core::intrinsics;

  unsafe { intrinsics::abort() }
}

//*******************************************************
