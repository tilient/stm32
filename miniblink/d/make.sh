#!/bin/bash

# prerequisites:
#   arm-none-eabi-gcc toolchain
#   libopencm3
#   ldc2

LINK_OBJS="tools.o blink.o"

LIBOPENCM3="$HOME/dev/hardware/stm32"
LIBOPENCM3+="/libopencm3-examples/libopencm3"

GEN_FLAGS="-mthumb -ggdb3 -mcpu=cortex-m3"
GEN_FLAGS+=" -msoft-float -mfix-cortex-m3-ldrd"

GCC_FLAGS="-Os -std=c99 $GEN_FLAGS -Wextra -Wshadow"
GCC_FLAGS+=" -Wimplicit-function-declaration"
GCC_FLAGS+=" -Wredundant-decls"
GCC_FLAGS+=" -fno-common"
GCC_FLAGS+=" -ffunction-sections -fdata-sections"
GCC_FLAGS+=" -MD -Wall -DSTM32F1"
GCC_FLAGS+=" -I$LIBOPENCM3/include"

LINK_FLAGS="--static -nostartfiles -Tbluepill.ld"
LINK_FLAGS+=" $GEN_FLAGS -Wl,-Map=blink.map"
LINK_FLAGS+=" -Wl,--cref -Wl,--gc-sections"
LINK_FLAGS+=" -L$LIBOPENCM3/lib $LINK_OBJS"
LINK_FLAGS+=" -lopencm3_stm32f1 -Wl,--start-group"
LINK_FLAGS+=" -lc -lgcc -lnosys -Wl,--end-group"

LDC2_FLAGS="-mtriple=thumb-none-linux-eabi"
LDC2_FLAGS+=" -mcpu=cortex-m3 -c -betterC"

ldc2 $LDC2_FLAGS blink.d
arm-none-eabi-gcc $GCC_FLAGS -o tools.o -c tools.c
arm-none-eabi-gcc $LINK_FLAGS -o blink.elf
arm-none-eabi-objcopy -Obinary blink.elf blink.bin
