#![no_std]
#![no_main]
#![feature(asm)]
#![feature(lang_items)]
#![feature(panic_implementation)]
#![feature(core_intrinsics)]

/****************************************************** /
to build :

cargo build --release
arm-none-eabi-objcopy -Obinary \
  target/thumbv7m-none-eabi/release/bluepill blink.bin
/ ******************************************************/

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

//*******************************************************
//** SysTick Timer
//*******************************************************

fn sleep(mut ms: u32) {
  const CLK_FREQ: u32 = 72_000_000;
  const MS_TICKS: u32 = CLK_FREQ / 9_000; // ??
  const MAX_MS: u32 = 0x00FF_FFFF / MS_TICKS;

  const SYSTICK_CSR: *mut u32 = 0xE000_E010 as *mut u32;
  const SYSTICK_RVR: *mut u32 = 0xE000_E014 as *mut u32;
  const SYSTICK_VAL: *mut u32 = 0xE000_E018 as *mut u32;
  const TCK_FLG: u32 = 1 << 16;

  while ms > MAX_MS {
    sleep(MAX_MS);
    ms -= MAX_MS;
  }
  reg_write(SYSTICK_CSR, 4);
  reg_write(SYSTICK_RVR, ms * MS_TICKS);
  reg_write(SYSTICK_VAL, 0);
  reg_write(SYSTICK_CSR, 7);
  while 0 == (reg_read(SYSTICK_CSR) & TCK_FLG) {
    wfi();
  }
  reg_write(SYSTICK_CSR, 4);
}

//*******************************************************
//** Tools
//*******************************************************

fn reg_write(p: *mut u32, v: u32) {
  use core::ptr;

  unsafe { ptr::write_volatile(p, v); }
}

fn reg_read(p: *mut u32) -> u32 {
  use core::ptr;

  unsafe { ptr::read_volatile(p) }
}

fn wfi() {
  unsafe { asm!("wfi"); }
}

//*******************************************************
//** GPIO Ports
//*******************************************************

// LED0 = PC13;

fn init_gpio() {
  const RCC_APB2ENR: *mut u32 = 0x4002_1018 as *mut u32;
  const RCC_APB2ENR_IOPCEN: u32 = 1 << 4;
  const GPIOC_CRH: *mut u32 = 0x4001_1004 as *mut u32;

  reg_write(
    RCC_APB2ENR,
    reg_read(RCC_APB2ENR) | RCC_APB2ENR_IOPCEN,
  );
  reg_write(GPIOC_CRH, 0x44544444);
}

const GPIOC_BSRR: *mut u32 = 0x4001_1010 as *mut u32;

fn set_port(p: u8) {
  reg_write(GPIOC_BSRR, 1 << (p + 16));
}

fn clear_port(p: u8) {
  reg_write(GPIOC_BSRR, 1 << p);
}

//*******************************************************
//** Interrupt Handlers
//*******************************************************

pub type Handler = unsafe extern "C" fn();
pub type Handlers = [Option<Handler>; 15];

#[no_mangle]
#[link_section = ".vector.exceptions"]
pub static EXCEPTION_HANDLERS: Handlers = [
  Some(_reset),
  Some(_nmi),
  Some(_hard_fault),
  Some(_memmanage_fault),
  Some(_bus_fault),
  Some(_usage_fault),
  None,
  None,
  None,
  None,
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
pub unsafe extern "C" fn systick() {}

#[doc(hidden)]
#[export_name = "_default_exception_handler"]
pub unsafe extern "C" fn default_handler_entry_point() {}

#[doc(hidden)]
#[export_name = "_reset"]
pub unsafe extern "C" fn reset() {
  main();
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
