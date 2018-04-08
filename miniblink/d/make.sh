
ldc2 -mtriple=thumb-none-linux-eabi -mcpu=cortex-m3 -c -betterC program.d

arm-none-eabi-gcc -Os -std=c99 -ggdb3 -mthumb -mcpu=cortex-m3 -msoft-float -mfix-cortex-m3-ldrd -Wextra -Wshadow -Wimplicit-function-declaration -Wredundant-decls -Wmissing-prototypes -Wstrict-prototypes -fno-common -ffunction-sections -fdata-sections  -MD -Wall -Wundef -DSTM32F1 -I/home/wiffel/dev/hardware/stm32/libopencm3-examples/libopencm3/include -o miniblink.o -c miniblink.c

arm-none-eabi-gcc --static -nostartfiles -Tbluepill.ld -mthumb -mcpu=cortex-m3 -msoft-float -mfix-cortex-m3-ldrd -ggdb3 -Wl,-Map=miniblink.map -Wl,--cref -Wl,--gc-sections -L/home/wiffel/dev/hardware/stm32/libopencm3-examples/libopencm3/lib miniblink.o program.o -lopencm3_stm32f1 -Wl,--start-group -lc -lgcc -lnosys -Wl,--end-group -o miniblink.elf

arm-none-eabi-objcopy -Obinary miniblink.elf miniblink.bin
