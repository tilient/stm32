
//--- WFI -----------------------//

void wfi(void) { __asm__("wfi"); }

//--- Global State --------------//

volatile void* global;

void setGlobal(void* ptr) {
  global = ptr;
}

volatile void* getGlobal() {
  return global;
}

//-------------------------------//
