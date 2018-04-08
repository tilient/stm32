
void wfi(void) { __asm__("wfi"); }

extern void d_main(void);

int main(void) {
  d_main();
  return 0;
}
