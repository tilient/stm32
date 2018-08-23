#!/bin/sh
export EGOS=noos
export EGARCH=cortexm3
export EGTARGET=f10x_md
egc -v 4
arm-none-eabi-objcopy -O binary cortexm3.elf blinky.bin
