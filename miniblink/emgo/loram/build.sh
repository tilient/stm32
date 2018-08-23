#!/bin/sh
export EGOS=noos
export EGARCH=cortexm3
export EGTARGET=f10x_md
egc -O "s"
arm-none-eabi-objcopy -O binary cortexm3.elf main.bin
# dfu-util.exe -v -D main.bin
