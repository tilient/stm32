#include "__noos_cortexm3_f10x_md.h"

// type decl
// var  decl
static stm32$hal$gpio$Port *main$leds;
// func decl
// const decl
// type def
// var  def
static 
__typeof__(main$leds) main$leds = nil;

__typeof__(main$ISRs) main$ISRs = {{[41] = stm32$hal$system$timer$rtcst$ISR}};
// func def
static // 13
void main$0init() {
	stm32$hal$system$SetupPLL(8L, 1L, 9L);
	stm32$hal$system$timer$rtcst$Setup(32768);
	stm32$hal$gpio$Port$EnableClock(stm32$hal$gpio$C, false);
	main$leds = stm32$hal$gpio$C;
	stm32$hal$gpio$Config cfg$ = ((stm32$hal$gpio$Config){.Mode = 1, .Driver = 4, .Speed = 1});
	stm32$hal$gpio$Port$Setup(main$leds, 8192, &cfg$);
}
 // 10
void main$main() {
	for (;;) {
		stm32$hal$gpio$Port$ClearPins(main$leds, 8192);
		delay$Millisec(50L);
		stm32$hal$gpio$Port$SetPins(main$leds, 8192);
		delay$Millisec(450L);
	}
}
// init
void main$init() {
	internal$init();
	delay$init();
	stm32$hal$gpio$init();
	stm32$hal$irq$init();
	stm32$hal$system$init();
	stm32$hal$system$timer$rtcst$init();
	runtime$init();
	main$0init();
}
