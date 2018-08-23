#include "__noos_cortexm3_f10x_md.h"

// type decl
// var  decl
static stm32$hal$gpio$Pin main$led;
// func decl
// const decl
// type def
// var  def
static 
__typeof__(main$led) main$led = {};
// func def
static // 20
void main$0init() {
	stm32$hal$system$SetupPLL(8L, 1L, 9L);
	stm32$hal$system$timer$systick$Setup(2000000);
	stm32$hal$gpio$Port$EnableClock(stm32$hal$gpio$C, false);
	main$led = stm32$hal$gpio$Port$Pin(stm32$hal$gpio$C, 13L);
	stm32$hal$gpio$Config cfg$ = ((stm32$hal$gpio$Config){.Mode = 1, .Speed = 1, .Driver = 4});
	stm32$hal$gpio$Pin$Setup(main$led, &cfg$);
	for (;;) {
		stm32$hal$gpio$Pin$Clear(main$led);
		stm32$hal$gpio$Pin$Set(main$led);
	}
}
 // 10
void main$main() {
	for (;;) {
		stm32$hal$gpio$Pin$Clear(main$led);
		delay$Millisec(100L);
		stm32$hal$gpio$Pin$Set(main$led);
		delay$Millisec(400L);
	}
}
// init
void main$init() {
	delay$init();
	stm32$hal$gpio$init();
	stm32$hal$system$init();
	stm32$hal$system$timer$systick$init();
	runtime$init();
	internal$init();
	main$0init();
}
