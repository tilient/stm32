MEMORY
{
	rom (rx) : ORIGIN = 0x08005000, LENGTH = 108K
	ram (rwx) : ORIGIN = 0x20000000, LENGTH = 17K
}

/* Include the common ld script. */
INCLUDE libopencm3_stm32f1.ld

