#![no_std]
#![no_main]
#![feature(asm)]
#![feature(lang_items)]
#![feature(panic_implementation)]
#![feature(core_intrinsics)]

/*
cargo build --release
arm-none-eabi-objcopy -Obinary \
  target/thumbv7em-none-eabihf/release/blue-pill blink.bin
*/


// LED0 = PC13;

pub const RCC_APB2ENR: *mut u32 = 0x4002_1018 as *mut u32;
pub const RCC_APB2ENR_IOPCEN: u32 = 1 << 4;
pub const GPIOC_CRH: *mut u32 = 0x4001_1004 as *mut u32;
pub const GPIOC_BSRR: *mut u32 = 0x4001_1010 as *mut u32;

#[no_mangle]
pub extern "C" fn main() -> !
{
  use core::ptr;

  unsafe {
    // Enable GPIOC
    ptr::write_volatile(RCC_APB2ENR,
      ptr::read_volatile(RCC_APB2ENR) | RCC_APB2ENR_IOPCEN);
    // Set PC13 Mode = Output
    ptr::write_volatile(GPIOC_CRH, 0x44544444);
    loop {
      // Set PC13
      ptr::write_volatile(GPIOC_BSRR, 1 << (13 + 16));
      // Delay approx 1/40 second
      for _ in 0 .. 100_000 { asm!("nop") }
      // Reset Set PC13
      ptr::write_volatile(GPIOC_BSRR, 1 << 13);
      // Delay approx 1/4 second
      for _ in 0 .. 1_000_000 { asm!("nop") }
    }
  }
}

#[doc(hidden)]
#[export_name = "_default_exception_handler"]
pub unsafe extern "C" fn default_handler_entry_point() -> ! {
    loop {}
}

#[doc(hidden)]
#[export_name = "_reset"]
pub unsafe extern "C" fn reset() -> ! {
    extern "C" {
        fn main();
    }
    main();
    loop {}
}

pub type Handler = unsafe extern "C" fn();

#[link_section = ".vector.exceptions"]
#[no_mangle]
pub static EXCEPTION_HANDLERS: [Option<Handler>; 15] = [
  Some(_reset),       // Reset Handler
  Some(_nmi),         // Non-maskable interrupt.
  Some(_hard_fault),  // All class of fault.
  Some(_memmanage_fault), // Memory Management
  Some(_bus_fault),   // Pre-fetch fault, memory access fault.
  Some(_usage_fault), // Undefined instruction or illegal state.
  None,
  None,
  None,
  None,
  Some(_svcall),      // System service call via SWI instruction
  Some(_debug),       // Debug
  None,
  Some(_pendsv),      // Pendable request for system service
  Some(_systick),     // System tick timer
];

extern "C" {
  pub fn _reset();    // Reset Handler
  pub fn _nmi();      // Non-maskable interrupt.
  pub fn _hard_fault(); // All class of fault.
  pub fn _memmanage_fault(); // Memory Management
  pub fn _bus_fault(); // Pre-fetch fault, memory
                       // access fault.
  pub fn _usage_fault(); // Undefined instruction or
                         //illegal state.
  pub fn _svcall();   // System service call via SWI instruction
  pub fn _debug();    // Debug
  pub fn _pendsv();   // Pendable request for system service
  pub fn _systick();  // System tick timer
}


use core::panic::PanicInfo;

#[panic_implementation]
fn panic(_info: &PanicInfo) -> !
{
  use core::intrinsics;

  unsafe { intrinsics::abort() }
}

