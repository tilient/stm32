package main

import (
	"delay"

	"stm32/hal/gpio"
	"stm32/hal/system"
	"stm32/hal/system/timer/systick"
)

var led gpio.Pin

func init() {
	system.SetupPLL(8, 1, 72/8)
	systick.Setup(2e6)

	gpio.C.EnableClock(false)
	led = gpio.C.Pin(13)

	cfg := gpio.Config{
		Mode:   gpio.Out,
		Driver: gpio.OpenDrain}
	led.Setup(&cfg)
}

func main() {
	for {
		led.Clear()
		delay.Millisec(50)
		led.Set()
		delay.Millisec(450)
	}
}
