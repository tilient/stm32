ISRStack = 1024;
MainStack = 1024;
TaskStack = 1024;
MaxTasks = 2;

/* bootSRAM code should by placed at 0x200001E0. */
/*bootOffset = 0x1E0;*/

INCLUDE stm32/f103x8
INCLUDE stm32/loadflash
INCLUDE noos-cortexm

/* Include bootRAM and set it as entry point. */
/*ENTRY(bootRAM)*/
