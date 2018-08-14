#!/bin/sh
export EGOS=noos
export EGARCH=cortexm3
export EGTARGET=f10x_md
egc
arm-none-eabi-objcopy -O binary cortexm3.elf blinky.bin
