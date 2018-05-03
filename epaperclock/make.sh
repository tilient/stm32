#!/bin/bash

##################################################
# prerequisites:
##################################################
# arm-none-eabi-gcc toolchain
#   sudo apt install arm-none-eabi-gcc
# libopencm3
#   https://github.com/libopencm3/libopencm3
# ldc2
#   https://github.com/ldc-developers/ldc
##################################################

LINK_OBJS="blink.o"

LIBOPENCM3="$HOME/dev/hardware/stm32"
LIBOPENCM3+="/libopencm3-examples/libopencm3"

LINK_FLAGS="  --static"
LINK_FLAGS+=" -nostartfiles -Tbluepill.ld"
LINK_FLAGS+=" -mcpu=cortex-m3 -mtune=cortex-m3"
LINK_FLAGS+=" -Wl,-Map=blink.map"
LINK_FLAGS+=" -Wl,--cref -Wl,--gc-sections"
LINK_FLAGS+=" -L$LIBOPENCM3/lib $LINK_OBJS"
LINK_FLAGS+=" -lopencm3_stm32f1 -Wl,--start-group"
LINK_FLAGS+=" -lc -lgcc -lnosys -Wl,--end-group"
LINK_FLAGS+=" -Wl,--no-enum-size-warning"

LDC2_FLAGS="  -mtriple=thumb-none-linux-eabi"
LDC2_FLAGS+=" -relocation-model=static"
LDC2_FLAGS+=" -O -mcpu=cortex-m3"
LDC2_FLAGS+=" -release -c -betterC"

rm -f blink.{elf,map,o,s,bin}

ldc2 $LDC2_FLAGS blink.d
arm-none-eabi-gcc $LINK_FLAGS -o blink.elf
arm-none-eabi-objcopy -Obinary blink.elf blink.bin

rm -f blink.{elf,map,o,s}
