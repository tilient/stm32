#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>

static void gpio_setup(void)
{
	rcc_periph_clock_enable(RCC_GPIOB);
	gpio_set_mode(
    GPIOB, GPIO_MODE_OUTPUT_2_MHZ,
		GPIO_CNF_OUTPUT_PUSHPULL, GPIO1);
}

static void sleep(void)
{
	int i;
  for (i = 0; i < 100000; i++)
    __asm__("nop");
}

int main(void)
{
	gpio_setup();
	while (1) {
		gpio_toggle(GPIOB, GPIO1);
    sleep();
	}
	return 0;
}
