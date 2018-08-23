#![no_std]
#![no_main]
#![feature(asm)]
#![feature(lang_items)]
#![feature(panic_implementation)]
#![feature(core_intrinsics)]

use core::ptr;
use core::panic::PanicInfo;

//**********************************************************
/* to build ...
cargo build --release
arm-none-eabi-objcopy -Obinary \
  target/thumbv7m-none-eabi/release/bluepill blink.bin
*/
//**********************************************************

#[no_mangle]
pub extern "C" fn main() {
  init_gpio();
  loop {
    set_port(13);
    sleep(20);
    clear_port(13);
    sleep(980);
  }
}

//**********************************************************
//** SysTick Timer
//**********************************************************

const SYSTICK_CSR: *mut u32 = 0xE000_E010 as *mut u32;
const SYSTICK_RVR: *mut u32 = 0xE000_E014 as *mut u32;
const SYSTICK_VAL: *mut u32 = 0xE000_E018 as *mut u32;
const TCK_FLG: u32 = 0x10_000;

fn sleep(millis: u32) {
  let mut ms = millis;
  while ms > 2000 {
    sleep(2000);
    ms -= 2000;
  }
  unsafe {
    ptr::write_volatile(SYSTICK_CSR, 4);
    ptr::write_volatile(SYSTICK_RVR, ms * 8_000);
    ptr::write_volatile(SYSTICK_VAL, 0);
    ptr::write_volatile(SYSTICK_CSR, 7);
    while 0 == (ptr::read_volatile(SYSTICK_CSR) & TCK_FLG) {
      asm!("wfi");
    }
    ptr::write_volatile(SYSTICK_CSR, 4);
  }
}

//**********************************************************
//** GPIO Ports
//**********************************************************

// LED0 = PC13;

const RCC_APB2ENR: *mut u32 = 0x4002_1018 as *mut u32;
const RCC_APB2ENR_IOPCEN: u32 = 1 << 4;
const GPIOC_CRH: *mut u32 = 0x4001_1004 as *mut u32;
const GPIOC_BSRR: *mut u32 = 0x4001_1010 as *mut u32;

fn init_gpio() {
  unsafe {
    ptr::write_volatile(RCC_APB2ENR,
      ptr::read_volatile(RCC_APB2ENR) | RCC_APB2ENR_IOPCEN);
    ptr::write_volatile(GPIOC_CRH, 0x44544444);
  }
}

fn set_port(p: u8) {
  unsafe {
    ptr::write_volatile(GPIOC_BSRR, 1 << (p + 16));
  }
}

fn clear_port(p: u8) {
  unsafe {
    ptr::write_volatile(GPIOC_BSRR, 1 << p);
  }
}

//**********************************************************
//** Interrupt Handlers
//**********************************************************

pub type Handler = unsafe extern "C" fn();

#[link_section = ".vector.exceptions"]
#[no_mangle]
pub static EXCEPTION_HANDLERS: [Option<Handler>; 15] = [
  Some(_reset),
  Some(_nmi),
  Some(_hard_fault),
  Some(_memmanage_fault),
  Some(_bus_fault),
  Some(_usage_fault),
  None, None, None, None,
  Some(_svcall),
  Some(_debug),
  None,
  Some(_pendsv),
  Some(_systick),
];

extern "C" {
  pub fn _reset();
  pub fn _nmi();
  pub fn _hard_fault();
  pub fn _memmanage_fault();
  pub fn _bus_fault();
  pub fn _usage_fault();
  pub fn _svcall();
  pub fn _debug();
  pub fn _pendsv();
  pub fn _systick();
}

#[doc(hidden)]
#[export_name = "_systick"]
pub unsafe extern "C" fn systick() {
}

#[doc(hidden)]
#[export_name = "_default_exception_handler"]
pub unsafe extern "C" fn default_handler_entry_point() {
}

#[doc(hidden)]
#[export_name = "_reset"]
pub unsafe extern "C" fn reset() {
  main();
}

//**********************************************************
//** Panic
//**********************************************************

#[panic_implementation]
fn panic(_info: &PanicInfo) -> !  {
  use core::intrinsics;
  unsafe { intrinsics::abort() }
}

//**********************************************************
