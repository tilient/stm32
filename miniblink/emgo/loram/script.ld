ISRStack = 2048;
MainStack = 4096;
TaskStack = 0;
MaxTasks = 1;

/* bootSRAM code should by placed at 0x200001E0. */
/*bootOffset = 0x1E0;*/

MEMORY {
	Flash (rx)  : ORIGIN = 0x08000000, LENGTH = 128K
 	RAM   (rwx) : ORIGIN = 0x20000000, LENGTH = 20K
}
INCLUDE stm32/loadflash
INCLUDE noos-cortexm

/* Include bootRAM and set it as entry point. */
/*ENTRY(bootRAM)*/
