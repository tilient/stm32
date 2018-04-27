
//--- WFI -----------------------//

void wfi(void) { __asm__("wfi"); }
void nop(void) { __asm__("nop"); }

//--- Global State --------------//

volatile void* global = 0;

void setGlobal(void* ptr) {
  global = ptr;
}

volatile void* getGlobal() {
  return global;
}

//-------------------------------//
