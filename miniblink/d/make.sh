#!/bin/bash

# prerequisites:
#   arm-unknown-linux-gnueabihf-gdc
#   arm-none-eabi-gcc toolchain
#   libopencm3

rm blink.bin
rm blink.elf
rm blink.map
rm blink.o

LIBOPENCM3="$HOME/dev/hardware/stm32"
LIBOPENCM3+="/libopencm3-examples/libopencm3"

GEN_FLAGS="-mthumb -ggdb3 -mcpu=cortex-m3 -mtune=cortex-m3"
GEN_FLAGS+=" -msoft-float -mfix-cortex-m3-ldrd"

GDC_FLAGS="-c -O3 -nophoboslib -nostdinc"
GDC_FLAGS+=" $GEN_FLAGS -nodefaultlibs -nostdlib"
GDC_FLAGS+=" -fno-bounds-check -fno-invariants"
GDC_FLAGS+=" -ffunction-sections -fdata-sections"
GDC_FLAGS+=" -frelease -mfloat-abi=soft "

LINK_FLAGS="--static -nostartfiles -Tbluepill.ld"
LINK_FLAGS+=" $GEN_FLAGS -Wl,-Map=blink.map"
LINK_FLAGS+=" -Wl,--cref -Wl,--gc-sections"
LINK_FLAGS+=" -L$LIBOPENCM3/lib $LINK_OBJS"
LINK_FLAGS+=" -lopencm3_stm32f1 -Wl,--start-group"
LINK_FLAGS+=" -lc -lgcc -lnosys -Wl,--end-group"
LINK_FLAGS+=" -Wl,--no-enum-size-warning"

LINK_OBJS="blink.o"

arm-unknown-linux-gnueabihf-gdc $GDC_FLAGS blink.d
arm-none-eabi-gcc $LINK_FLAGS -o blink.elf
arm-none-eabi-objcopy -Obinary blink.elf blink.bin
