
//---------------------------------------------------

ref T MMIO(T)(ulong addr) {
  return *(cast(T*)addr);
}

ref uint BBIO_SRAM(ulong addr, ulong bit) {
  return MMIO!uint(32 * ((cast(uint)addr) & 0x0FFFFF)
                   + 0x22000000 + (4 * bit));
}

ref uint BBIO_PERIPH(ulong addr, ulong bit) {
  return MMIO!uint(32 * ((cast(uint)addr) & 0x0FFFFF)
                   + 0x42000000 + (4 * bit));
}

//---------------------------------------------------

enum BIT0  =  1<<0;
enum BIT1  =  1<<1;
enum BIT2  =  1<<2;
enum BIT3  =  1<<3;
enum BIT4  =  1<<4;
enum BIT5  =  1<<5;
enum BIT6  =  1<<6;
enum BIT7  =  1<<7;
enum BIT8  =  1<<8;
enum BIT9  =  1<<9;
enum BIT10 = 1<<10;
enum BIT11 = 1<<11;
enum BIT12 = 1<<12;
enum BIT13 = 1<<13;
enum BIT14 = 1<<14;
enum BIT15 = 1<<15;
enum BIT16 = 1<<16;
enum BIT17 = 1<<17;
enum BIT18 = 1<<18;
enum BIT19 = 1<<19;
enum BIT20 = 1<<20;
enum BIT21 = 1<<21;
enum BIT22 = 1<<22;
enum BIT23 = 1<<23;
enum BIT24 = 1<<24;
enum BIT25 = 1<<25;
enum BIT26 = 1<<26;
enum BIT27 = 1<<27;
enum BIT28 = 1<<28;
enum BIT29 = 1<<29;
enum BIT30 = 1<<30;
enum BIT31 = 1<<31;

enum PPBI_BASE = 0xE0000000U;
enum ITM_BASE = PPBI_BASE + 0x0000;
enum DWT_BASE = PPBI_BASE + 0x1000;
enum FPB_BASE = PPBI_BASE + 0x2000;
enum SCS_BASE = PPBI_BASE + 0xE000;
enum TPIU_BASE = PPBI_BASE + 0x40000;
enum ITR_BASE = SCS_BASE + 0x0000;
enum SYS_TICK_BASE = SCS_BASE + 0x0010;
enum NVIC_BASE = SCS_BASE + 0x0100;
enum SCB_BASE = SCS_BASE + 0x0D00;
enum MPU_BASE = SCS_BASE + 0x0D90;
enum STIR_BASE = SCS_BASE + 0x0F00;
enum ID_BASE = SCS_BASE + 0x0FD0;
enum FLASH_BASE = 0x08000000U;
enum PERIPH_BASE = 0x40000000U;
enum INFO_BASE = 0x1ffff000U;
enum PERIPH_BASE_APB1 = PERIPH_BASE + 0x00000;
enum PERIPH_BASE_APB2 = PERIPH_BASE + 0x10000;
enum PERIPH_BASE_AHB = PERIPH_BASE + 0x18000;
enum TIM2_BASE = PERIPH_BASE_APB1 + 0x0000;
enum TIM3_BASE = PERIPH_BASE_APB1 + 0x0400;
enum TIM4_BASE = PERIPH_BASE_APB1 + 0x0800;
enum TIM5_BASE = PERIPH_BASE_APB1 + 0x0c00;
enum TIM6_BASE = PERIPH_BASE_APB1 + 0x1000;
enum TIM7_BASE = PERIPH_BASE_APB1 + 0x1400;
enum TIM12_BASE = PERIPH_BASE_APB1 + 0x1800;
enum TIM13_BASE = PERIPH_BASE_APB1 + 0x1c00;
enum TIM14_BASE = PERIPH_BASE_APB1 + 0x2000;
enum RTC_BASE = PERIPH_BASE_APB1 + 0x2800;
enum WWDG_BASE = PERIPH_BASE_APB1 + 0x2c00;
enum IWDG_BASE = PERIPH_BASE_APB1 + 0x3000;
enum SPI2_BASE = PERIPH_BASE_APB1 + 0x3800;
enum SPI3_BASE = PERIPH_BASE_APB1 + 0x3c00;
enum USART2_BASE = PERIPH_BASE_APB1 + 0x4400;
enum USART3_BASE = PERIPH_BASE_APB1 + 0x4800;
enum UART4_BASE = PERIPH_BASE_APB1 + 0x4c00;
enum UART5_BASE = PERIPH_BASE_APB1 + 0x5000;
enum I2C1_BASE = PERIPH_BASE_APB1 + 0x5400;
enum I2C2_BASE = PERIPH_BASE_APB1 + 0x5800;
enum USB_DEV_FS_BASE = PERIPH_BASE_APB1 + 0x5c00;
enum USB_PMA_BASE = PERIPH_BASE_APB1 + 0x6000;
enum USB_CAN_SRAM_BASE = PERIPH_BASE_APB1 + 0x6000;
enum BX_CAN1_BASE = PERIPH_BASE_APB1 + 0x6400;
enum BX_CAN2_BASE = PERIPH_BASE_APB1 + 0x6800;
enum BACKUP_REGS_BASE = PERIPH_BASE_APB1 + 0x6c00;
enum POWER_CONTROL_BASE = PERIPH_BASE_APB1 + 0x7000;
enum DAC_BASE = PERIPH_BASE_APB1 + 0x7400;
enum CEC_BASE = PERIPH_BASE_APB1 + 0x7800;
enum AFIO_BASE = PERIPH_BASE_APB2 + 0x0000;
enum EXTI_BASE = PERIPH_BASE_APB2 + 0x0400;
enum GPIO_PORT_A_BASE = PERIPH_BASE_APB2 + 0x0800;
enum GPIO_PORT_B_BASE = PERIPH_BASE_APB2 + 0x0c00;
enum GPIO_PORT_C_BASE = PERIPH_BASE_APB2 + 0x1000;
enum GPIO_PORT_D_BASE = PERIPH_BASE_APB2 + 0x1400;
enum GPIO_PORT_E_BASE = PERIPH_BASE_APB2 + 0x1800;
enum GPIO_PORT_F_BASE = PERIPH_BASE_APB2 + 0x1c00;
enum GPIO_PORT_G_BASE = PERIPH_BASE_APB2 + 0x2000;
enum ADC1_BASE = PERIPH_BASE_APB2 + 0x2400;
enum ADC2_BASE = PERIPH_BASE_APB2 + 0x2800;
enum TIM1_BASE = PERIPH_BASE_APB2 + 0x2c00;
enum SPI1_BASE = PERIPH_BASE_APB2 + 0x3000;
enum TIM8_BASE = PERIPH_BASE_APB2 + 0x3400;
enum USART1_BASE = PERIPH_BASE_APB2 + 0x3800;
enum ADC3_BASE = PERIPH_BASE_APB2 + 0x3c00;
enum TIM15_BASE = PERIPH_BASE_APB2 + 0x4000;
enum TIM16_BASE = PERIPH_BASE_APB2 + 0x4400;
enum TIM17_BASE = PERIPH_BASE_APB2 + 0x4800;
enum TIM9_BASE = PERIPH_BASE_APB2 + 0x4c00;
enum TIM10_BASE = PERIPH_BASE_APB2 + 0x5000;
enum TIM11_BASE = PERIPH_BASE_APB2 + 0x5400;
enum SDIO_BASE = PERIPH_BASE_AHB + 0x00000;
enum DMA1_BASE = PERIPH_BASE_AHB + 0x08000;
enum DMA2_BASE = PERIPH_BASE_AHB + 0x08400;
enum RCC_BASE = PERIPH_BASE_AHB + 0x09000;
enum FLASH_MEM_INTERFACE_BASE = PERIPH_BASE_AHB + 0x0a000;
enum CRC_BASE = PERIPH_BASE_AHB + 0x0b000;
enum ETHERNET_BASE = PERIPH_BASE_AHB + 0x10000;
enum USB_OTG_FS_BASE = PERIPH_BASE_AHB + 0xffe8000;
enum DBGMCU_BASE = PPBI_BASE + 0x00042000;
enum FSMC_BASE = PERIPH_BASE + 0x60000000;
enum DESIG_FLASH_SIZE_BASE = INFO_BASE + 0x7e0;
enum DESIG_UNIQUE_ID_BASE = INFO_BASE + 0x7e8;

ref uint DESIG_UNIQUE_ID0() {return MMIO!uint(DESIG_UNIQUE_ID_BASE);}
ref uint DESIG_UNIQUE_ID1() {return MMIO!uint(DESIG_UNIQUE_ID_BASE + 4);}
ref uint DESIG_UNIQUE_ID2() {return MMIO!uint(DESIG_UNIQUE_ID_BASE + 8);}

enum ADC1 = ADC1_BASE;
ref uint ADC_SR(uint block) {return MMIO!uint((block) + 0x00);}
ref uint ADC_CR1(uint block) {return MMIO!uint((block) + 0x04);}
ref uint ADC_CR2(uint block) {return MMIO!uint((block) + 0x08);}
ref uint ADC_SMPR1(uint block) {return MMIO!uint((block) + 0x0c);}
ref uint ADC_SMPR2(uint block) {return MMIO!uint((block) + 0x10);}
ref uint ADC1_SR() {return ADC_SR(ADC1);}
ref uint adc1_cr1() {return ADC_CR1(ADC1);}
ref uint adc1_cr2() {return ADC_CR2(ADC1);}
ref uint adc1_smpR1() {return ADC_SMPR1(ADC1);}
ref uint adc1_smpR2() {return ADC_SMPR2(ADC1);}
ref uint adc1_jofR1() {return ADC_JOFR1(ADC1);}
ref uint adc1_jofR2() {return ADC_JOFR2(ADC1);}
ref uint adc1_jofR3() {return ADC_JOFR3(ADC1);}
ref uint adc1_jofR4() {return ADC_JOFR4(ADC1);}
ref uint adc1_htr() {return ADC_HTR(ADC1);}
ref uint adc1_ltr() {return ADC_LTR(ADC1);}
ref uint adc1_sqr1() {return ADC_SQR1(ADC1);}
ref uint adc1_sqr2() {return ADC_SQR2(ADC1);}
ref uint adc1_sqr3() {return ADC_SQR3(ADC1);}
ref uint adc1_jsqR() {return ADC_JSQR(ADC1);}
ref uint adc1_jdr1() {return ADC_JDR1(ADC1);}
ref uint adc1_jdr2() {return ADC_JDR2(ADC1);}
ref uint adc1_jdr3() {return ADC_JDR3(ADC1);}
ref uint adc1_jdr4() {return ADC_JDR4(ADC1);}
ref uint adc1_dr() {return ADC_DR(ADC1);}

enum ADC2 = ADC2_BASE;

ref uint ADC2_SR    (){return ADC_SR(ADC2);}
ref uint ADC2_CR1   (){return ADC_CR1(ADC2);}
ref uint ADC2_CR2   (){return ADC_CR2(ADC2);}
ref uint ADC2_SMPR1 (){return ADC_SMPR1(ADC2);}
ref uint ADC2_SMPR2 (){return ADC_SMPR2(ADC2);}
ref uint ADC2_JOFR1 (){return ADC_JOFR1(ADC2);}
ref uint ADC2_JOFR2 (){return ADC_JOFR2(ADC2);}
ref uint ADC2_JOFR3 (){return ADC_JOFR3(ADC2);}
ref uint ADC2_JOFR4 (){return ADC_JOFR4(ADC2);}
ref uint ADC2_HTR   (){return ADC_HTR(ADC2);}
ref uint ADC2_LTR   (){return ADC_LTR(ADC2);}
ref uint ADC2_SQR1  (){return ADC_SQR1(ADC2);}
ref uint ADC2_SQR2  (){return ADC_SQR2(ADC2);}
ref uint ADC2_SQR3  (){return ADC_SQR3(ADC2);}
ref uint ADC2_JSQR  (){return ADC_JSQR(ADC2);}
ref uint ADC2_JDR1  (){return ADC_JDR1(ADC2);}
ref uint ADC2_JDR2  (){return ADC_JDR2(ADC2);}
ref uint ADC2_JDR3  (){return ADC_JDR3(ADC2);}
ref uint ADC2_JDR4  (){return ADC_JDR4(ADC2);}
ref uint ADC2_DR    (){return ADC_DR(ADC2);}

enum ADC3 = ADC3_BASE;
ref uint ADC3_SR   () {return ADC_SR(ADC3);}
ref uint ADC3_CR1  () {return ADC_CR1(ADC3);}
ref uint ADC3_CR2  () {return ADC_CR2(ADC3);}
ref uint ADC3_SMPR1() {return ADC_SMPR1(ADC3);}
ref uint ADC3_SMPR2() {return ADC_SMPR2(ADC3);}
ref uint ADC3_JOFR1() {return ADC_JOFR1(ADC3);}
ref uint ADC3_JOFR2() {return ADC_JOFR2(ADC3);}
ref uint ADC3_JOFR3() {return ADC_JOFR3(ADC3);}
ref uint ADC3_JOFR4() {return ADC_JOFR4(ADC3);}
ref uint ADC3_HTR  () {return ADC_HTR(ADC3);}
ref uint ADC3_LTR  () {return ADC_LTR(ADC3);}
ref uint ADC3_SQR1 () {return ADC_SQR1(ADC3);}
ref uint ADC3_SQR2 () {return ADC_SQR2(ADC3);}
ref uint ADC3_SQR3 () {return ADC_SQR3(ADC3);}
ref uint ADC3_JSQR () {return ADC_JSQR(ADC3);}
ref uint ADC3_JDR1 () {return ADC_JDR1(ADC3);}
ref uint ADC3_JDR2 () {return ADC_JDR2(ADC3);}
ref uint ADC3_JDR3 () {return ADC_JDR3(ADC3);}
ref uint ADC3_JDR4 () {return ADC_JDR4(ADC3);}
ref uint ADC3_DR   () {return ADC_DR(ADC3);}

enum ADC_CHANNEL0  = 0x00;
enum ADC_CHANNEL1  = 0x01;
enum ADC_CHANNEL2  = 0x02;
enum ADC_CHANNEL3  = 0x03;
enum ADC_CHANNEL4  = 0x04;
enum ADC_CHANNEL5  = 0x05;
enum ADC_CHANNEL6  = 0x06;
enum ADC_CHANNEL7  = 0x07;
enum ADC_CHANNEL8  = 0x08;
enum ADC_CHANNEL9  = 0x09;
enum ADC_CHANNEL10 = 0x0A;
enum ADC_CHANNEL11 = 0x0B;
enum ADC_CHANNEL12 = 0x0C;
enum ADC_CHANNEL13 = 0x0D;
enum ADC_CHANNEL14 = 0x0E;
enum ADC_CHANNEL15 = 0x0F;
enum ADC_CHANNEL16 = 0x10;
enum ADC_CHANNEL17 = 0x11;
enum ADC_CHANNEL18 = 0x12;

enum ADC_CHANNEL_MASK = 0x1F;
enum ADC_SR_STRT = 1 << 4;
enum ADC_SR_JSTRT = 1 << 3;
enum ADC_SR_JEOC = 1 << 2;
enum ADC_SR_EOC = 1 << 1;
enum ADC_SR_AWD = 1 << 0;
enum ADC_CR1_AWDEN = 1 << 23;
enum ADC_CR1_JAWDEN = 1 << 22;
enum ADC_CR1_DISCNUM_1CHANNELS = 0x0 << 13;
enum ADC_CR1_DISCNUM_2CHANNELS = 0x1 << 13;
enum ADC_CR1_DISCNUM_3CHANNELS = 0x2 << 13;
enum ADC_CR1_DISCNUM_4CHANNELS = 0x3 << 13;
enum ADC_CR1_DISCNUM_5CHANNELS = 0x4 << 13;
enum ADC_CR1_DISCNUM_6CHANNELS = 0x5 << 13;
enum ADC_CR1_DISCNUM_7CHANNELS = 0x6 << 13;
enum ADC_CR1_DISCNUM_8CHANNELS = 0x7 << 13;
enum ADC_CR1_DISCNUM_MASK = 0x7 << 13;
enum ADC_CR1_DISCNUM_SHIFT = 13;
enum ADC_CR1_JDISCEN = 1 << 12;
enum ADC_CR1_DISCEN = 1 << 11;
enum ADC_CR1_JAUTO = 1 << 10;
enum ADC_CR1_AWDSGL = 1 << 9;
enum ADC_CR1_SCAN = 1 << 8;
enum ADC_CR1_JEOCIE = 1 << 7;
enum ADC_CR1_AWDIE = 1 << 6;
enum ADC_CR1_EOCIE = 1 << 5;
enum ADC_CR1_AWDCH_CHANNEL0 = 0x00 << 0;
enum ADC_CR1_AWDCH_CHANNEL1 = 0x01 << 0;
enum ADC_CR1_AWDCH_CHANNEL2 = 0x02 << 0;
enum ADC_CR1_AWDCH_CHANNEL3 = 0x03 << 0;
enum ADC_CR1_AWDCH_CHANNEL4 = 0x04 << 0;
enum ADC_CR1_AWDCH_CHANNEL5 = 0x05 << 0;
enum ADC_CR1_AWDCH_CHANNEL6 = 0x06 << 0;
enum ADC_CR1_AWDCH_CHANNEL7 = 0x07 << 0;
enum ADC_CR1_AWDCH_CHANNEL8 = 0x08 << 0;
enum ADC_CR1_AWDCH_CHANNEL9 = 0x09 << 0;
enum ADC_CR1_AWDCH_CHANNEL10 = 0x0A << 0;
enum ADC_CR1_AWDCH_CHANNEL11 = 0x0B << 0;
enum ADC_CR1_AWDCH_CHANNEL12 = 0x0C << 0;
enum ADC_CR1_AWDCH_CHANNEL13 = 0x0D << 0;
enum ADC_CR1_AWDCH_CHANNEL14 = 0x0E << 0;
enum ADC_CR1_AWDCH_CHANNEL15 = 0x0F << 0;
enum ADC_CR1_AWDCH_CHANNEL16 = 0x10 << 0;
enum ADC_CR1_AWDCH_CHANNEL17 = 0x11 << 0;
enum ADC_CR1_AWDCH_MASK = 0x1F << 0;
enum ADC_CR1_AWDCH_SHIFT = 0;
enum ADC_JOFFSET_LSB = 0;
enum ADC_JOFFSET_MSK = 0xfff;
enum ADC_HT_LSB = 0;
enum ADC_HT_MSK = 0xfff;
enum ADC_LT_LSB = 0;
enum ADC_LT_MSK = 0xfff;
enum ADC_SQR1_L_LSB = 20;
enum ADC_JSQR_JL_LSB = 20;
enum ADC_JSQR_JSQ4_LSB = 15;
enum ADC_JSQR_JSQ3_LSB = 10;
enum ADC_JSQR_JSQ2_LSB = 5;
enum ADC_JSQR_JSQ1_LSB = 0;
enum ADC_JSQR_JL_1CHANNELS = 0x0 << ADC_JSQR_JL_LSB;
enum ADC_JSQR_JL_2CHANNELS = 0x1 << ADC_JSQR_JL_LSB;
enum ADC_JSQR_JL_3CHANNELS = 0x2 << ADC_JSQR_JL_LSB;
enum ADC_JSQR_JL_4CHANNELS = 0x3 << ADC_JSQR_JL_LSB;
enum ADC_JSQR_JL_MSK = 0x2 << ADC_JSQR_JL_LSB;
enum ADC_JSQR_JSQ4_MSK = 0x1f << ADC_JSQR_JSQ4_LSB;
enum ADC_JSQR_JSQ3_MSK = 0x1f << ADC_JSQR_JSQ3_LSB;
enum ADC_JSQR_JSQ2_MSK = 0x1f << ADC_JSQR_JSQ2_LSB;
enum ADC_JSQR_JSQ1_MSK = 0x1f << ADC_JSQR_JSQ1_LSB;

ulong ADC_JSQR_JSQ_VAL(ulong n, ulong val) {
  return ((val) << (((n) - 1) * 5));
}

ulong ADC_JSQR_JL_VAL(ulong val) {
  return (((val) - 1) << ADC_JSQR_JL_LSB);
}

extern(C) extern void adc_power_on(uint adc);
extern(C) extern void adc_power_off(uint adc);
extern(C) extern void adc_enable_analog_watchdog_regular(uint adc);
extern(C) extern void adc_disable_analog_watchdog_regular(uint adc);
extern(C) extern void adc_enable_analog_watchdog_injected(uint adc);
extern(C) extern void adc_disable_analog_watchdog_injected(uint adc);
extern(C) extern void adc_enable_discontinuous_mode_regular(
    uint adc, ubyte length);
extern(C) extern void adc_disable_discontinuous_mode_regular(uint adc);
extern(C) extern void adc_enable_discontinuous_mode_injected(uint adc);
extern(C) extern void adc_disable_discontinuous_mode_injected(uint adc);
extern(C) extern void adc_enable_automatic_injected_group_conversion(
    uint adc);
extern(C) extern void adc_disable_automatic_injected_group_conversion(
    uint adc);
extern(C) extern void adc_enable_analog_watchdog_on_all_channels(
    uint adc);
extern(C) extern void adc_enable_analog_watchdog_on_selected_channel(
    uint adc, ubyte channel);
extern(C) extern void adc_enable_scan_mode(uint adc);
extern(C) extern void adc_disable_scan_mode(uint adc);
extern(C) extern void adc_enable_eoc_interrupt_injected(uint adc);
extern(C) extern void adc_disable_eoc_interrupt_injected(uint adc);
extern(C) extern void adc_enable_awd_interrupt(uint adc);
extern(C) extern void adc_disable_awd_interrupt(uint adc);
extern(C) extern void adc_enable_eoc_interrupt(uint adc);
extern(C) extern void adc_disable_eoc_interrupt(uint adc);
extern(C) extern void adc_set_left_aligned(uint adc);
extern(C) extern void adc_set_right_aligned(uint adc);
extern(C) extern bool adc_eoc(uint adc);
extern(C) extern bool adc_eoc_injected(uint adc);
extern(C) extern uint adc_read_regular(uint adc);
extern(C) extern uint adc_read_injected(uint adc, ubyte reg);
extern(C) extern void adc_set_continuous_conversion_mode(uint adc);
extern(C) extern void adc_set_single_conversion_mode(uint adc);
extern(C) extern void adc_set_regular_sequence(
    uint adc, ubyte length, ubyte* channel);
extern(C) extern void adc_set_injected_sequence(
    uint adc, ubyte length, ubyte* channel);
extern(C) extern void adc_set_injected_offset(
    uint adc, ubyte reg, uint offset);
extern(C) extern void adc_set_watchdog_high_threshold(
    uint adc, ushort threshold);
extern(C) extern void adc_set_watchdog_low_threshold(
    uint adc, ushort threshold);
extern(C) extern void adc_start_conversion_regular(uint adc);
extern(C) extern void adc_start_conversion_injected(uint adc);
extern(C) extern void adc_enable_dma(uint adc);
extern(C) extern void adc_disable_dma(uint adc);
extern(C) extern void adc_set_sample_time(
    uint adc, ubyte channel, ubyte time);
extern(C) extern void adc_set_sample_time_on_all_channels(
    uint adc, ubyte time);
extern(C) extern void adc_disable_external_trigger_regular(uint adc);
extern(C) extern void adc_disable_external_trigger_injected(uint adc);

ref uint ADC_JOFR1(ulong block) { return MMIO!uint((block) + 0x14); }
ref uint ADC_JOFR2(ulong block) { return MMIO!uint((block) + 0x18); }
ref uint ADC_JOFR3(ulong block) { return MMIO!uint((block) + 0x1c); }
ref uint ADC_JOFR4(ulong block) { return MMIO!uint((block) + 0x20); }
ref uint ADC_HTR  (ulong block) { return MMIO!uint((block) + 0x24); }
ref uint ADC_LTR  (ulong block) { return MMIO!uint((block) + 0x28); }
ref uint ADC_SQR1 (ulong block) { return MMIO!uint((block) + 0x2c); }
ref uint ADC_SQR2 (ulong block) { return MMIO!uint((block) + 0x30); }
ref uint ADC_SQR3 (ulong block) { return MMIO!uint((block) + 0x34); }
ref uint ADC_JSQR (ulong block) { return MMIO!uint((block) + 0x38); }
ref uint ADC_JDR1 (ulong block) { return MMIO!uint((block) + 0x3c); }
ref uint ADC_JDR2 (ulong block) { return MMIO!uint((block) + 0x40); }
ref uint ADC_JDR3 (ulong block) { return MMIO!uint((block) + 0x44); }
ref uint ADC_JDR4 (ulong block) { return MMIO!uint((block) + 0x48); }
ref uint ADC_DR   (ulong block) { return MMIO!uint((block) + 0x4c); }

enum ADC_CR1_DUALMOD_IND = 0x0 << 16;
enum ADC_CR1_DUALMOD_CRSISM = 0x1 << 16;
enum ADC_CR1_DUALMOD_CRSATM = 0x2 << 16;
enum ADC_CR1_DUALMOD_CISFIM = 0x3 << 16;
enum ADC_CR1_DUALMOD_CISSIM = 0x4 << 16;
enum ADC_CR1_DUALMOD_ISM = 0x5 << 16;
enum ADC_CR1_DUALMOD_RSM = 0x6 << 16;
enum ADC_CR1_DUALMOD_FIM = 0x7 << 16;
enum ADC_CR1_DUALMOD_SIM = 0x8 << 16;
enum ADC_CR1_DUALMOD_ATM = 0x9 << 16;
enum ADC_CR1_DUALMOD_MASK = 0xF << 16;
enum ADC_CR1_DUALMOD_SHIFT = 16;
enum ADC_CR1_AWDCH_MAX = 17;
enum ADC_CR2_TSVREFE = 1 << 23;
enum ADC_CR2_SWSTART = 1 << 22;
enum ADC_CR2_JSWSTART = 1 << 21;
enum ADC_CR2_EXTTRIG = 1 << 20;
enum ADC_CR2_EXTSEL_TIM1_CC1 = 0x0 << 17;
enum ADC_CR2_EXTSEL_TIM1_CC2 = 0x1 << 17;
enum ADC_CR2_EXTSEL_TIM1_CC3 = 0x2 << 17;
enum ADC_CR2_EXTSEL_TIM2_CC2 = 0x3 << 17;
enum ADC_CR2_EXTSEL_TIM3_TRGO = 0x4 << 17;
enum ADC_CR2_EXTSEL_TIM4_CC4 = 0x5 << 17;
enum ADC_CR2_EXTSEL_EXTI11 = 0x6 << 17;
enum ADC_CR2_EXTSEL_SWSTART = 0x7 << 17;
enum ADC_CR2_EXTSEL_TIM3_CC1 = 0x0 << 17;
enum ADC_CR2_EXTSEL_TIM2_CC3 = 0x1 << 17;
enum ADC_CR2_EXTSEL_TIM8_CC1 = 0x3 << 17;
enum ADC_CR2_EXTSEL_TIM8_TRGO = 0x4 << 17;
enum ADC_CR2_EXTSEL_TIM5_CC1 = 0x5 << 17;
enum ADC_CR2_EXTSEL_TIM5_CC3 = 0x6 << 17;
enum ADC_CR2_EXTSEL_MASK = 0x7 << 17;
enum ADC_CR2_EXTSEL_SHIFT = 17;
enum ADC_CR2_JEXTTRIG = 1 << 15;
enum ADC_CR2_JEXTSEL_TIM2_TRGO = 0x2 << 12;
enum ADC_CR2_JEXTSEL_TIM2_CC1 = 0x3 << 12;
enum ADC_CR2_JEXTSEL_TIM3_CC4 = 0x4 << 12;
enum ADC_CR2_JEXTSEL_TIM4_TRGO = 0x5 << 12;
enum ADC_CR2_JEXTSEL_EXTI15 = 0x6 << 12;
enum ADC_CR2_JEXTSEL_TIM1_TRGO = 0x0 << 12;
enum ADC_CR2_JEXTSEL_TIM1_CC4 = 0x1 << 12;
enum ADC_CR2_JEXTSEL_TIM4_CC3 = 0x2 << 12;
enum ADC_CR2_JEXTSEL_TIM8_CC2 = 0x3 << 12;
enum ADC_CR2_JEXTSEL_TIM8_CC4 = 0x4 << 12;
enum ADC_CR2_JEXTSEL_TIM5_TRGO = 0x5 << 12;
enum ADC_CR2_JEXTSEL_TIM5_CC4 = 0x6 << 12;
enum ADC_CR2_JEXTSEL_JSWSTART = 0x7 << 12;
enum ADC_CR2_JEXTSEL_MASK = 0x7 << 12;
enum ADC_CR2_JEXTSEL_SHIFT = 12;
enum ADC_CR2_ALIGN_RIGHT = 0 << 11;
enum ADC_CR2_ALIGN_LEFT = 1 << 11;
enum ADC_CR2_ALIGN = 1 << 11;
enum ADC_CR2_DMA = 1 << 8;
enum ADC_CR2_RSTCAL = 1 << 3;
enum ADC_CR2_CAL = 1 << 2;
enum ADC_CR2_CONT = 1 << 1;
enum ADC_CR2_ADON = 1 << 0;
enum ADC_SMPR1_SMP17_LSB = 21;
enum ADC_SMPR1_SMP16_LSB = 18;
enum ADC_SMPR1_SMP15_LSB = 15;
enum ADC_SMPR1_SMP14_LSB = 12;
enum ADC_SMPR1_SMP13_LSB = 9;
enum ADC_SMPR1_SMP12_LSB = 6;
enum ADC_SMPR1_SMP11_LSB = 3;
enum ADC_SMPR1_SMP10_LSB = 0;
enum ADC_SMPR1_SMP17_MSK = 0x7 << ADC_SMPR1_SMP17_LSB;
enum ADC_SMPR1_SMP16_MSK = 0x7 << ADC_SMPR1_SMP16_LSB;
enum ADC_SMPR1_SMP15_MSK = 0x7 << ADC_SMPR1_SMP15_LSB;
enum ADC_SMPR1_SMP14_MSK = 0x7 << ADC_SMPR1_SMP14_LSB;
enum ADC_SMPR1_SMP13_MSK = 0x7 << ADC_SMPR1_SMP13_LSB;
enum ADC_SMPR1_SMP12_MSK = 0x7 << ADC_SMPR1_SMP12_LSB;
enum ADC_SMPR1_SMP11_MSK = 0x7 << ADC_SMPR1_SMP11_LSB;
enum ADC_SMPR1_SMP10_MSK = 0x7 << ADC_SMPR1_SMP10_LSB;
enum ADC_SMPR2_SMP9_LSB = 27;
enum ADC_SMPR2_SMP8_LSB = 24;
enum ADC_SMPR2_SMP7_LSB = 21;
enum ADC_SMPR2_SMP6_LSB = 18;
enum ADC_SMPR2_SMP5_LSB = 15;
enum ADC_SMPR2_SMP4_LSB = 12;
enum ADC_SMPR2_SMP3_LSB = 9;
enum ADC_SMPR2_SMP2_LSB = 6;
enum ADC_SMPR2_SMP1_LSB = 3;
enum ADC_SMPR2_SMP0_LSB = 0;
enum ADC_SMPR2_SMP9_MSK = 0x7 << ADC_SMPR2_SMP9_LSB;
enum ADC_SMPR2_SMP8_MSK = 0x7 << ADC_SMPR2_SMP8_LSB;
enum ADC_SMPR2_SMP7_MSK = 0x7 << ADC_SMPR2_SMP7_LSB;
enum ADC_SMPR2_SMP6_MSK = 0x7 << ADC_SMPR2_SMP6_LSB;
enum ADC_SMPR2_SMP5_MSK = 0x7 << ADC_SMPR2_SMP5_LSB;
enum ADC_SMPR2_SMP4_MSK = 0x7 << ADC_SMPR2_SMP4_LSB;
enum ADC_SMPR2_SMP3_MSK = 0x7 << ADC_SMPR2_SMP3_LSB;
enum ADC_SMPR2_SMP2_MSK = 0x7 << ADC_SMPR2_SMP2_LSB;
enum ADC_SMPR2_SMP1_MSK = 0x7 << ADC_SMPR2_SMP1_LSB;
enum ADC_SMPR2_SMP0_MSK = 0x7 << ADC_SMPR2_SMP0_LSB;
enum ADC_SMPR_SMP_1DOT5CYC = 0x0;
enum ADC_SMPR_SMP_7DOT5CYC = 0x1;
enum ADC_SMPR_SMP_13DOT5CYC = 0x2;
enum ADC_SMPR_SMP_28DOT5CYC = 0x3;
enum ADC_SMPR_SMP_41DOT5CYC = 0x4;
enum ADC_SMPR_SMP_55DOT5CYC = 0x5;
enum ADC_SMPR_SMP_71DOT5CYC = 0x6;
enum ADC_SMPR_SMP_239DOT5CYC = 0x7;
enum ADC_SQR_MAX_CHANNELS_REGULAR = 16;
enum ADC_SQR1_SQ16_LSB = 15;
enum ADC_SQR1_SQ15_LSB = 10;
enum ADC_SQR1_SQ14_LSB = 5;
enum ADC_SQR1_SQ13_LSB = 0;
enum ADC_SQR1_L_MSK = 0xf << ADC_SQR1_L_LSB;
enum ADC_SQR1_SQ16_MSK = 0x1f << ADC_SQR1_SQ16_LSB;
enum ADC_SQR1_SQ15_MSK = 0x1f << ADC_SQR1_SQ15_LSB;
enum ADC_SQR1_SQ14_MSK = 0x1f << ADC_SQR1_SQ14_LSB;
enum ADC_SQR1_SQ13_MSK = 0x1f << ADC_SQR1_SQ13_LSB;
enum ADC_SQR2_SQ12_LSB = 25;
enum ADC_SQR2_SQ11_LSB = 20;
enum ADC_SQR2_SQ10_LSB = 15;
enum ADC_SQR2_SQ9_LSB = 10;
enum ADC_SQR2_SQ8_LSB = 5;
enum ADC_SQR2_SQ7_LSB = 0;
enum ADC_SQR2_SQ12_MSK = 0x1f << ADC_SQR2_SQ12_LSB;
enum ADC_SQR2_SQ11_MSK = 0x1f << ADC_SQR2_SQ11_LSB;
enum ADC_SQR2_SQ10_MSK = 0x1f << ADC_SQR2_SQ10_LSB;
enum ADC_SQR2_SQ9_MSK = 0x1f << ADC_SQR2_SQ9_LSB;
enum ADC_SQR2_SQ8_MSK = 0x1f << ADC_SQR2_SQ8_LSB;
enum ADC_SQR2_SQ7_MSK = 0x1f << ADC_SQR2_SQ7_LSB;
enum ADC_SQR3_SQ6_LSB = 25;
enum ADC_SQR3_SQ5_LSB = 20;
enum ADC_SQR3_SQ4_LSB = 15;
enum ADC_SQR3_SQ3_LSB = 10;
enum ADC_SQR3_SQ2_LSB = 5;
enum ADC_SQR3_SQ1_LSB = 0;
enum ADC_SQR3_SQ6_MSK = 0x1f << ADC_SQR3_SQ6_LSB;
enum ADC_SQR3_SQ5_MSK = 0x1f << ADC_SQR3_SQ5_LSB;
enum ADC_SQR3_SQ4_MSK = 0x1f << ADC_SQR3_SQ4_LSB;
enum ADC_SQR3_SQ3_MSK = 0x1f << ADC_SQR3_SQ3_LSB;
enum ADC_SQR3_SQ2_MSK = 0x1f << ADC_SQR3_SQ2_LSB;
enum ADC_SQR3_SQ1_MSK = 0x1f << ADC_SQR3_SQ1_LSB;
enum ADC_JDATA_LSB = 0;
enum ADC_DATA_LSB = 0;
enum ADC_ADC2DATA_LSB = 16;
enum ADC_JDATA_MSK = 0xffff << ADC_JDATA_LSB;
enum ADC_ADC2DATA_MSK = 0xffff << ADC_ADC2DATA_LSB;
enum ADC_CHANNEL_TEMP = 16;
enum ADC_CHANNEL_VREF = 17;

extern(C) extern void adc_start_conversion_direct(uint adc);
extern(C) extern void adc_set_dual_mode(uint mode);
extern(C) extern void adc_enable_temperature_sensor();
extern(C) extern void adc_disable_temperature_sensor();
extern(C) extern void adc_enable_external_trigger_regular(
    uint adc, uint trigger);
extern(C) extern void adc_enable_external_trigger_injected(
    uint adc, uint trigger);
extern(C) extern void adc_reset_calibration(uint adc);
extern(C) extern void adc_calibrate_async(uint adc);
extern(C) extern bool adc_is_calibrating(uint adc);
extern(C) extern void adc_calibrate(uint adc);

ref uint CRC_DR () {return MMIO!uint(CRC_BASE + 0x00);}
ref uint CRC_IDR () {return MMIO!uint(CRC_BASE + 0x04);}
ref uint CRC_CR () {return MMIO!uint(CRC_BASE + 0x08);}
enum CRC_CR_RESET = 1 << 0;

extern(C) extern void crc_reset();
extern(C) extern uint crc_calculate(uint data);
extern(C) extern uint crc_calculate_block(uint *datap, int size);

ref uint dac_cr () {return MMIO!uint(DAC_BASE + 0x00);}
ref uint dac_swtriGR () {return MMIO!uint(DAC_BASE + 0x04);}
ref uint dac_dhr12R1 () {return MMIO!uint(DAC_BASE + 0x08);}
ref uint dac_dhr12L1 () {return MMIO!uint(DAC_BASE + 0x0C);}
ref uint dac_dhr8r1 () {return MMIO!uint(DAC_BASE + 0x10);}
ref uint dac_dhr12R2 () {return MMIO!uint(DAC_BASE + 0x14);}
ref uint dac_dhr12L2 () {return MMIO!uint(DAC_BASE + 0x18);}
ref uint dac_dhr8r2 () {return MMIO!uint(DAC_BASE + 0x1C);}
ref uint dac_dhr12RD () {return MMIO!uint(DAC_BASE + 0x20);}
ref uint dac_dhr12LD () {return MMIO!uint(DAC_BASE + 0x24);}
ref uint dac_dhr8rD () {return MMIO!uint(DAC_BASE + 0x28);}
ref uint dac_dor1 () {return MMIO!uint(DAC_BASE + 0x2C);}
ref uint dac_dor2 () {return MMIO!uint(DAC_BASE + 0x30);}

enum DAC_CR_DMAUDRIE2 = 1 << 29;
enum DAC_CR_DMAEN2 = 1 << 28;
enum DAC_CR_MAMP2_SHIFT = 24;
enum DAC_CR_MAMP2_1 = 0x0 << DAC_CR_MAMP2_SHIFT;
enum DAC_CR_MAMP2_2 = 0x1 << DAC_CR_MAMP2_SHIFT;
enum DAC_CR_MAMP2_3 = 0x2 << DAC_CR_MAMP2_SHIFT;
enum DAC_CR_MAMP2_4 = 0x3 << DAC_CR_MAMP2_SHIFT;
enum DAC_CR_MAMP2_5 = 0x4 << DAC_CR_MAMP2_SHIFT;
enum DAC_CR_MAMP2_6 = 0x5 << DAC_CR_MAMP2_SHIFT;
enum DAC_CR_MAMP2_7 = 0x6 << DAC_CR_MAMP2_SHIFT;
enum DAC_CR_MAMP2_8 = 0x7 << DAC_CR_MAMP2_SHIFT;
enum DAC_CR_MAMP2_9 = 0x8 << DAC_CR_MAMP2_SHIFT;
enum DAC_CR_MAMP2_10 = 0x9 << DAC_CR_MAMP2_SHIFT;
enum DAC_CR_MAMP2_11 = 0xA << DAC_CR_MAMP2_SHIFT;
enum DAC_CR_MAMP2_12 = 0xB << DAC_CR_MAMP2_SHIFT;
enum DAC_CR_WAVE2_SHIFT = 22;
enum DAC_CR_WAVE2_DIS = 0x3 << DAC_CR_WAVE2_SHIFT;
enum DAC_CR_WAVE2_NOISE = 0x1 << DAC_CR_WAVE2_SHIFT;
enum DAC_CR_WAVE2_TRI = 0x2 << DAC_CR_WAVE2_SHIFT;
enum DAC_CR_TSEL2_SHIFT = 19;
enum DAC_CR_TSEL2_T6 = 0x0 << DAC_CR_TSEL2_SHIFT;
enum DAC_CR_TSEL2_T3 = 0x1 << DAC_CR_TSEL2_SHIFT;
enum DAC_CR_TSEL2_T8 = 0x1 << DAC_CR_TSEL2_SHIFT;
enum DAC_CR_TSEL2_T7 = 0x2 << DAC_CR_TSEL2_SHIFT;
enum DAC_CR_TSEL2_T5 = 0x3 << DAC_CR_TSEL2_SHIFT;
enum DAC_CR_TSEL2_T15 = 0x3 << DAC_CR_TSEL2_SHIFT;
enum DAC_CR_TSEL2_T2 = 0x4 << DAC_CR_TSEL2_SHIFT;
enum DAC_CR_TSEL2_T4 = 0x5 << DAC_CR_TSEL2_SHIFT;
enum DAC_CR_TSEL2_E9 = 0x6 << DAC_CR_TSEL2_SHIFT;
enum DAC_CR_TSEL2_SW = 0x7 << DAC_CR_TSEL2_SHIFT;
enum DAC_CR_TEN2 = 1 << 18;
enum DAC_CR_BOFF2 = 1 << 17;
enum DAC_CR_EN2 = 1 << 16;
enum DAC_CR_DMAUDRIE1 = 1 << 13;
enum DAC_CR_DMAEN1 = 1 << 12;
enum DAC_CR_MAMP1_SHIFT = 8;
enum DAC_CR_MAMP1_1 = 0x0 << DAC_CR_MAMP1_SHIFT;
enum DAC_CR_MAMP1_2 = 0x1 << DAC_CR_MAMP1_SHIFT;
enum DAC_CR_MAMP1_3 = 0x2 << DAC_CR_MAMP1_SHIFT;
enum DAC_CR_MAMP1_4 = 0x3 << DAC_CR_MAMP1_SHIFT;
enum DAC_CR_MAMP1_5 = 0x4 << DAC_CR_MAMP1_SHIFT;
enum DAC_CR_MAMP1_6 = 0x5 << DAC_CR_MAMP1_SHIFT;
enum DAC_CR_MAMP1_7 = 0x6 << DAC_CR_MAMP1_SHIFT;
enum DAC_CR_MAMP1_8 = 0x7 << DAC_CR_MAMP1_SHIFT;
enum DAC_CR_MAMP1_9 = 0x8 << DAC_CR_MAMP1_SHIFT;
enum DAC_CR_MAMP1_10 = 0x9 << DAC_CR_MAMP1_SHIFT;
enum DAC_CR_MAMP1_11 = 0xA << DAC_CR_MAMP1_SHIFT;
enum DAC_CR_MAMP1_12 = 0xB << DAC_CR_MAMP1_SHIFT;
enum DAC_CR_WAVE1_SHIFT = 6;
enum DAC_CR_WAVE1_DIS = 0x3 << DAC_CR_WAVE1_SHIFT;
enum DAC_CR_WAVE1_NOISE = 0x1 << DAC_CR_WAVE1_SHIFT;
enum DAC_CR_WAVE1_TRI = 0x2 << DAC_CR_WAVE1_SHIFT;
enum DAC_CR_TSEL1_SHIFT = 3;
enum DAC_CR_TSEL1_T6 = 0x0 << DAC_CR_TSEL1_SHIFT;
enum DAC_CR_TSEL1_T3 = 0x1 << DAC_CR_TSEL1_SHIFT;
enum DAC_CR_TSEL1_T8 = 0x1 << DAC_CR_TSEL1_SHIFT;
enum DAC_CR_TSEL1_T7 = 0x2 << DAC_CR_TSEL1_SHIFT;
enum DAC_CR_TSEL1_T5 = 0x3 << DAC_CR_TSEL1_SHIFT;
enum DAC_CR_TSEL1_T15 = 0x3 << DAC_CR_TSEL1_SHIFT;
enum DAC_CR_TSEL1_T2 = 0x4 << DAC_CR_TSEL1_SHIFT;
enum DAC_CR_TSEL1_T4 = 0x5 << DAC_CR_TSEL1_SHIFT;
enum DAC_CR_TSEL1_E9 = 0x6 << DAC_CR_TSEL1_SHIFT;
enum DAC_CR_TSEL1_SW = 0x7 << DAC_CR_TSEL1_SHIFT;
enum DAC_CR_TEN1 = 1 << 2;
enum DAC_CR_BOFF1 = 1 << 1;
enum DAC_CR_EN1 = 1 << 0;
enum DAC_SWTRIGR_SWTRIG2 = 1 << 1;
enum DAC_SWTRIGR_SWTRIG1 = 1 << 0;
enum DAC_DHR12R1_DACC1DHR_LSB = 1 << 0;
enum DAC_DHR12R1_DACC1DHR_MSK = 0x0FFF << 0;
enum DAC_DHR12L1_DACC1DHR_LSB = 1 << 4;
enum DAC_DHR12L1_DACC1DHR_MSK = 0x0FFF << 4;
enum DAC_DHR8R1_DACC1DHR_LSB = 1 << 0;
enum DAC_DHR8R1_DACC1DHR_MSK = 0x00FF << 0;
enum DAC_DHR12R2_DACC2DHR_LSB = 1 << 0;
enum DAC_DHR12R2_DACC2DHR_MSK = 0x00FFF << 0;
enum DAC_DHR12L2_DACC2DHR_LSB = 1 << 4;
enum DAC_DHR12L2_DACC2DHR_MSK = 0x0FFF << 4;
enum DAC_DHR8R2_DACC2DHR_LSB = 1 << 0;
enum DAC_DHR8R2_DACC2DHR_MSK = 0x00FF << 0;
enum DAC_DHR12RD_DACC2DHR_LSB = 1 << 16;
enum DAC_DHR12RD_DACC2DHR_MSK = 0x0FFF << 16;
enum DAC_DHR12RD_DACC1DHR_LSB = 1 << 0;
enum DAC_DHR12RD_DACC1DHR_MSK = 0x0FFF << 0;
enum DAC_DHR12LD_DACC2DHR_LSB = 1 << 16;
enum DAC_DHR12LD_DACC2DHR_MSK = 0x0FFF << 20;
enum DAC_DHR12LD_DACC1DHR_LSB = 1 << 0;
enum DAC_DHR12LD_DACC1DHR_MSK = 0x0FFF << 4;
enum DAC_DHR8RD_DACC2DHR_LSB = 1 << 8;
enum DAC_DHR8RD_DACC2DHR_MSK = 0x00FF << 8;
enum DAC_DHR8RD_DACC1DHR_LSB = 1 << 0;
enum DAC_DHR8RD_DACC1DHR_MSK = 0x00FF << 0;
enum DAC_DOR1_DACC1DOR_LSB = 1 << 0;
enum DAC_DOR1_DACC1DOR_MSK = 0x0FFF << 0;
enum DAC_DOR2_DACC2DOR_LSB = 1 << 0;
enum DAC_DOR2_DACC2DOR_MSK = 0x0FFF << 0;

enum data_channel {CHANNEL_1, CHANNEL_2, CHANNEL_D};
enum data_align {RIGHT8, RIGHT12, LEFT12};

// void dac_enable(data_channel dac_channel);
// void dac_disable(data_channel dac_channel);
// void dac_buffer_enable(data_channel dac_channel);
// void dac_buffer_disable(data_channel dac_channel);
// void dac_dma_enable(data_channel dac_channel);
// void dac_dma_disable(data_channel dac_channel);
// void dac_trigger_enable(data_channel dac_channel);
// void dac_trigger_disable(data_channel dac_channel);
// void dac_set_trigger_source(uint dac_trig_src);
// void dac_set_waveform_generation(uint dac_wave_ens);
// void dac_disable_waveform_generation(data_channel dac_channel);
// void dac_set_waveform_characteristics(uint dac_mamp);
// void dac_load_data_buffer_single(ushort dac_data, data_align dac_data_format,
//      data_channel dac_channel);
// void dac_load_data_buffer_dual(ushort dac_data1, ushort dac_data2,
//           data_align dac_data_format);
// void dac_software_trigger(data_channel dac_channel);
//
// enum LIBOPENCM3_DMA_H
// enum LIBOPENCM3_DMA_COMMON_F13_H
// enum DMA1 DMA1_BASE
// enum DMA2 DMA2_BASE
// enum DMA_ISR(dma_base) () { return MMIO!uint((dma_base) + 0x00)
// enum DMA1_ISR DMA_ISR(DMA1)
// enum DMA2_ISR DMA_ISR(DMA2)
// enum DMA_IFCR(dma_base) () { return MMIO!uint((dma_base) + 0x04)
// enum DMA1_IFCR DMA_IFCR(DMA1)
// enum DMA2_IFCR DMA_IFCR(DMA2)
// enum DMA_CCR(dma_base,channel) () { return MMIO!uint((dma_base) + 0x08 + (0x14 * ((channel) - 1)))
// enum DMA1_CCR(channel) DMA_CCR(DMA1, channel)
// enum DMA1_CCR1 DMA1_CCR(DMA_CHANNEL1)
// enum DMA1_CCR2 DMA1_CCR(DMA_CHANNEL2)
// enum DMA1_CCR3 DMA1_CCR(DMA_CHANNEL3)
// enum DMA1_CCR4 DMA1_CCR(DMA_CHANNEL4)
// enum DMA1_CCR5 DMA1_CCR(DMA_CHANNEL5)
// enum DMA1_CCR6 DMA1_CCR(DMA_CHANNEL6)
// enum DMA1_CCR7 DMA1_CCR(DMA_CHANNEL7)
// enum DMA2_CCR(channel) DMA_CCR(DMA2, channel)
// enum DMA2_CCR1 DMA2_CCR(DMA_CHANNEL1)
// enum DMA2_CCR2 DMA2_CCR(DMA_CHANNEL2)
// enum DMA2_CCR3 DMA2_CCR(DMA_CHANNEL3)
// enum DMA2_CCR4 DMA2_CCR(DMA_CHANNEL4)
// enum DMA2_CCR5 DMA2_CCR(DMA_CHANNEL5)
// enum DMA_CNDTR(dma_base,channel) () { return MMIO!uint((dma_base) + 0x0C + (0x14 * ((channel) - 1)))
// enum DMA1_CNDTR(channel) DMA_CNDTR(DMA1, channel)
// enum DMA1_CNDTR1 DMA1_CNDTR(DMA_CHANNEL1)
// enum DMA1_CNDTR2 DMA1_CNDTR(DMA_CHANNEL2)
// enum DMA1_CNDTR3 DMA1_CNDTR(DMA_CHANNEL3)
// enum DMA1_CNDTR4 DMA1_CNDTR(DMA_CHANNEL4)
// enum DMA1_CNDTR5 DMA1_CNDTR(DMA_CHANNEL5)
// enum DMA1_CNDTR6 DMA1_CNDTR(DMA_CHANNEL6)
// enum DMA1_CNDTR7 DMA1_CNDTR(DMA_CHANNEL7)
// enum DMA2_CNDTR(channel) DMA_CNDTR(DMA2, channel)
// enum DMA2_CNDTR1 DMA2_CNDTR(DMA_CHANNEL1)
// enum DMA2_CNDTR2 DMA2_CNDTR(DMA_CHANNEL2)
// enum DMA2_CNDTR3 DMA2_CNDTR(DMA_CHANNEL3)
// enum DMA2_CNDTR4 DMA2_CNDTR(DMA_CHANNEL4)
// enum DMA2_CNDTR5 DMA2_CNDTR(DMA_CHANNEL5)
// enum DMA_CPAR(dma_base,channel) () { return MMIO!uint((dma_base) + 0x10 + (0x14 * ((channel) - 1)))
// enum DMA1_CPAR(channel) DMA_CPAR(DMA1, channel)
// enum DMA1_CPAR1 DMA1_CPAR(DMA_CHANNEL1)
// enum DMA1_CPAR2 DMA1_CPAR(DMA_CHANNEL2)
// enum DMA1_CPAR3 DMA1_CPAR(DMA_CHANNEL3)
// enum DMA1_CPAR4 DMA1_CPAR(DMA_CHANNEL4)
// enum DMA1_CPAR5 DMA1_CPAR(DMA_CHANNEL5)
// enum DMA1_CPAR6 DMA1_CPAR(DMA_CHANNEL6)
// enum DMA1_CPAR7 DMA1_CPAR(DMA_CHANNEL7)
// enum DMA2_CPAR(channel) DMA_CPAR(DMA2, channel)
// enum DMA2_CPAR1 DMA2_CPAR(DMA_CHANNEL1)
// enum DMA2_CPAR2 DMA2_CPAR(DMA_CHANNEL2)
// enum DMA2_CPAR3 DMA2_CPAR(DMA_CHANNEL3)
// enum DMA2_CPAR4 DMA2_CPAR(DMA_CHANNEL4)
// enum DMA2_CPAR5 DMA2_CPAR(DMA_CHANNEL5)
// enum DMA_CMAR(dma_base,channel) () { return MMIO!uint((dma_base) + 0x14 + (0x14 * ((channel) - 1)))
// enum DMA1_CMAR(channel) DMA_CMAR(DMA1, channel)
// enum DMA1_CMAR1 DMA1_CMAR(DMA_CHANNEL1)
// enum DMA1_CMAR2 DMA1_CMAR(DMA_CHANNEL2)
// enum DMA1_CMAR3 DMA1_CMAR(DMA_CHANNEL3)
// enum DMA1_CMAR4 DMA1_CMAR(DMA_CHANNEL4)
// enum DMA1_CMAR5 DMA1_CMAR(DMA_CHANNEL5)
// enum DMA1_CMAR6 DMA1_CMAR(DMA_CHANNEL6)
// enum DMA1_CMAR7 DMA1_CMAR(DMA_CHANNEL7)
// enum DMA2_CMAR(channel) DMA_CMAR(DMA2, channel)
// enum DMA2_CMAR1 DMA2_CMAR(DMA_CHANNEL1)
// enum DMA2_CMAR2 DMA2_CMAR(DMA_CHANNEL2)
// enum DMA2_CMAR3 DMA2_CMAR(DMA_CHANNEL3)
// enum DMA2_CMAR4 DMA2_CMAR(DMA_CHANNEL4)
// enum DMA2_CMAR5 DMA2_CMAR(DMA_CHANNEL5)
// enum DMA_TEIF (1 << 3)
// enum DMA_HTIF (1 << 2)
// enum DMA_TCIF (1 << 1)
// enum DMA_GIF (1 << 0)
// enum DMA_FLAG_OFFSET(channel) (4*((channel) - 1))
// enum DMA_FLAGS (DMA_TEIF | DMA_TCIF | DMA_HTIF | DMA_GIF)
// enum DMA_ISR_MASK(channel) (DMA_FLAGS << DMA_FLAG_OFFSET(channel))
// enum DMA_ISR_TEIF_BIT DMA_TEIF
// enum DMA_ISR_TEIF(channel) (DMA_ISR_TEIF_BIT << (DMA_FLAG_OFFSET(channel)))
// enum DMA_ISR_TEIF1 DMA_ISR_TEIF(DMA_CHANNEL1)
// enum DMA_ISR_TEIF2 DMA_ISR_TEIF(DMA_CHANNEL2)
// enum DMA_ISR_TEIF3 DMA_ISR_TEIF(DMA_CHANNEL3)
// enum DMA_ISR_TEIF4 DMA_ISR_TEIF(DMA_CHANNEL4)
// enum DMA_ISR_TEIF5 DMA_ISR_TEIF(DMA_CHANNEL5)
// enum DMA_ISR_TEIF6 DMA_ISR_TEIF(DMA_CHANNEL6)
// enum DMA_ISR_TEIF7 DMA_ISR_TEIF(DMA_CHANNEL7)
// enum DMA_ISR_HTIF_BIT DMA_HTIF
// enum DMA_ISR_HTIF(channel) (DMA_ISR_HTIF_BIT << (DMA_FLAG_OFFSET(channel)))
// enum DMA_ISR_HTIF1 DMA_ISR_HTIF(DMA_CHANNEL1)
// enum DMA_ISR_HTIF2 DMA_ISR_HTIF(DMA_CHANNEL2)
// enum DMA_ISR_HTIF3 DMA_ISR_HTIF(DMA_CHANNEL3)
// enum DMA_ISR_HTIF4 DMA_ISR_HTIF(DMA_CHANNEL4)
// enum DMA_ISR_HTIF5 DMA_ISR_HTIF(DMA_CHANNEL5)
// enum DMA_ISR_HTIF6 DMA_ISR_HTIF(DMA_CHANNEL6)
// enum DMA_ISR_HTIF7 DMA_ISR_HTIF(DMA_CHANNEL7)
// enum DMA_ISR_TCIF_BIT DMA_TCIF
// enum DMA_ISR_TCIF(channel) (DMA_ISR_TCIF_BIT << (DMA_FLAG_OFFSET(channel)))
// enum DMA_ISR_TCIF1 DMA_ISR_TCIF(DMA_CHANNEL1)
// enum DMA_ISR_TCIF2 DMA_ISR_TCIF(DMA_CHANNEL2)
// enum DMA_ISR_TCIF3 DMA_ISR_TCIF(DMA_CHANNEL3)
// enum DMA_ISR_TCIF4 DMA_ISR_TCIF(DMA_CHANNEL4)
// enum DMA_ISR_TCIF5 DMA_ISR_TCIF(DMA_CHANNEL5)
// enum DMA_ISR_TCIF6 DMA_ISR_TCIF(DMA_CHANNEL6)
// enum DMA_ISR_TCIF7 DMA_ISR_TCIF(DMA_CHANNEL7)
// enum DMA_ISR_GIF_BIT DMA_GIF
// enum DMA_ISR_GIF(channel) (DMA_ISR_GIF_BIT << (DMA_FLAG_OFFSET(channel)))
// enum DMA_ISR_GIF1 DMA_ISR_GIF(DMA_CHANNEL1)
// enum DMA_ISR_GIF2 DMA_ISR_GIF(DMA_CHANNEL2)
// enum DMA_ISR_GIF3 DMA_ISR_GIF(DMA_CHANNEL3)
// enum DMA_ISR_GIF4 DMA_ISR_GIF(DMA_CHANNEL4)
// enum DMA_ISR_GIF5 DMA_ISR_GIF(DMA_CHANNEL5)
// enum DMA_ISR_GIF6 DMA_ISR_GIF(DMA_CHANNEL6)
// enum DMA_ISR_GIF7 DMA_ISR_GIF(DMA_CHANNEL7)
// enum DMA_IFCR_CTEIF_BIT DMA_TEIF
// enum DMA_IFCR_CTEIF(channel) (DMA_IFCR_CTEIF_BIT << (DMA_FLAG_OFFSET(channel)))
// enum DMA_IFCR_CTEIF1 DMA_IFCR_CTEIF(DMA_CHANNEL1)
// enum DMA_IFCR_CTEIF2 DMA_IFCR_CTEIF(DMA_CHANNEL2)
// enum DMA_IFCR_CTEIF3 DMA_IFCR_CTEIF(DMA_CHANNEL3)
// enum DMA_IFCR_CTEIF4 DMA_IFCR_CTEIF(DMA_CHANNEL4)
// enum DMA_IFCR_CTEIF5 DMA_IFCR_CTEIF(DMA_CHANNEL5)
// enum DMA_IFCR_CTEIF6 DMA_IFCR_CTEIF(DMA_CHANNEL6)
// enum DMA_IFCR_CTEIF7 DMA_IFCR_CTEIF(DMA_CHANNEL7)
// enum DMA_IFCR_CHTIF_BIT DMA_HTIF
// enum DMA_IFCR_CHTIF(channel) (DMA_IFCR_CHTIF_BIT << (DMA_FLAG_OFFSET(channel)))
// enum DMA_IFCR_CHTIF1 DMA_IFCR_CHTIF(DMA_CHANNEL1)
// enum DMA_IFCR_CHTIF2 DMA_IFCR_CHTIF(DMA_CHANNEL2)
// enum DMA_IFCR_CHTIF3 DMA_IFCR_CHTIF(DMA_CHANNEL3)
// enum DMA_IFCR_CHTIF4 DMA_IFCR_CHTIF(DMA_CHANNEL4)
// enum DMA_IFCR_CHTIF5 DMA_IFCR_CHTIF(DMA_CHANNEL5)
// enum DMA_IFCR_CHTIF6 DMA_IFCR_CHTIF(DMA_CHANNEL6)
// enum DMA_IFCR_CHTIF7 DMA_IFCR_CHTIF(DMA_CHANNEL7)
// enum DMA_IFCR_CTCIF_BIT DMA_TCIF
// enum DMA_IFCR_CTCIF(channel) (DMA_IFCR_CTCIF_BIT << (DMA_FLAG_OFFSET(channel)))
// enum DMA_IFCR_CTCIF1 DMA_IFCR_CTCIF(DMA_CHANNEL1)
// enum DMA_IFCR_CTCIF2 DMA_IFCR_CTCIF(DMA_CHANNEL2)
// enum DMA_IFCR_CTCIF3 DMA_IFCR_CTCIF(DMA_CHANNEL3)
// enum DMA_IFCR_CTCIF4 DMA_IFCR_CTCIF(DMA_CHANNEL4)
// enum DMA_IFCR_CTCIF5 DMA_IFCR_CTCIF(DMA_CHANNEL5)
// enum DMA_IFCR_CTCIF6 DMA_IFCR_CTCIF(DMA_CHANNEL6)
// enum DMA_IFCR_CTCIF7 DMA_IFCR_CTCIF(DMA_CHANNEL7)
// enum DMA_IFCR_CGIF_BIT DMA_GIF
// enum DMA_IFCR_CGIF(channel) (DMA_IFCR_CGIF_BIT << (DMA_FLAG_OFFSET(channel)))
// enum DMA_IFCR_CGIF1 DMA_IFCR_CGIF(DMA_CHANNEL1)
// enum DMA_IFCR_CGIF2 DMA_IFCR_CGIF(DMA_CHANNEL2)
// enum DMA_IFCR_CGIF3 DMA_IFCR_CGIF(DMA_CHANNEL3)
// enum DMA_IFCR_CGIF4 DMA_IFCR_CGIF(DMA_CHANNEL4)
// enum DMA_IFCR_CGIF5 DMA_IFCR_CGIF(DMA_CHANNEL5)
// enum DMA_IFCR_CGIF6 DMA_IFCR_CGIF(DMA_CHANNEL6)
// enum DMA_IFCR_CGIF7 DMA_IFCR_CGIF(DMA_CHANNEL7)
// enum DMA_IFCR_CIF_BIT 0xF
// enum DMA_IFCR_CIF(channel) (DMA_IFCR_CIF_BIT << (DMA_FLAG_OFFSET(channel)))
// enum DMA_IFCR_CIF1 DMA_IFCR_CIF(DMA_CHANNEL1)
// enum DMA_IFCR_CIF2 DMA_IFCR_CIF(DMA_CHANNEL2)
// enum DMA_IFCR_CIF3 DMA_IFCR_CIF(DMA_CHANNEL3)
// enum DMA_IFCR_CIF4 DMA_IFCR_CIF(DMA_CHANNEL4)
// enum DMA_IFCR_CIF5 DMA_IFCR_CIF(DMA_CHANNEL5)
// enum DMA_IFCR_CIF6 DMA_IFCR_CIF(DMA_CHANNEL6)
// enum DMA_IFCR_CIF7 DMA_IFCR_CIF(DMA_CHANNEL7)
// enum DMA_CCR_MEM2MEM (1 << 14)
// enum DMA_CCR_PL_LOW (0x0 << 12)
// enum DMA_CCR_PL_MEDIUM (0x1 << 12)
// enum DMA_CCR_PL_HIGH (0x2 << 12)
// enum DMA_CCR_PL_VERY_HIGH (0x3 << 12)
// enum DMA_CCR_PL_MASK (0x3 << 12)
// enum DMA_CCR_PL_SHIFT 12
// enum DMA_CCR_MSIZE_8BIT (0x0 << 10)
// enum DMA_CCR_MSIZE_16BIT (0x1 << 10)
// enum DMA_CCR_MSIZE_32BIT (0x2 << 10)
// enum DMA_CCR_MSIZE_MASK (0x3 << 10)
// enum DMA_CCR_MSIZE_SHIFT 10
// enum DMA_CCR_PSIZE_8BIT (0x0 << 8)
// enum DMA_CCR_PSIZE_16BIT (0x1 << 8)
// enum DMA_CCR_PSIZE_32BIT (0x2 << 8)
// enum DMA_CCR_PSIZE_MASK (0x3 << 8)
// enum DMA_CCR_PSIZE_SHIFT 8
// enum DMA_CCR_MINC (1 << 7)
// enum DMA_CCR_PINC (1 << 6)
// enum DMA_CCR_CIRC (1 << 5)
// enum DMA_CCR_DIR (1 << 4)
// enum DMA_CCR_TEIE (1 << 3)
// enum DMA_CCR_HTIE (1 << 2)
// enum DMA_CCR_TCIE (1 << 1)
// enum DMA_CCR_EN (1 << 0)
// enum DMA_CHANNEL1 1
// enum DMA_CHANNEL2 2
// enum DMA_CHANNEL3 3
// enum DMA_CHANNEL4 4
// enum DMA_CHANNEL5 5
// enum DMA_CHANNEL6 6
// enum DMA_CHANNEL7 7
//
// void dma_channel_reset(uint dma, ubyte channel);
// void dma_clear_interrupt_flags(uint dma, ubyte channel,
//           uint interrupts);
// bool dma_get_interrupt_flag(uint dma, ubyte channel, uint interrupts);
// void dma_enable_mem2mem_mode(uint dma, ubyte channel);
// void dma_set_priority(uint dma, ubyte channel, uint prio);
// void dma_set_memory_size(uint dma, ubyte channel, uint mem_size);
// void dma_set_peripheral_size(uint dma, ubyte channel,
//         uint peripheral_size);
// void dma_enable_memory_increment_mode(uint dma, ubyte channel);
// void dma_disable_memory_increment_mode(uint dma, ubyte channel);
// void dma_enable_peripheral_increment_mode(uint dma, ubyte channel);
// void dma_disable_peripheral_increment_mode(uint dma, ubyte channel);
// void dma_enable_circular_mode(uint dma, ubyte channel);
// void dma_set_read_from_peripheral(uint dma, ubyte channel);
// void dma_set_read_from_memory(uint dma, ubyte channel);
// void dma_enable_transfer_error_interrupt(uint dma, ubyte channel);
// void dma_disable_transfer_error_interrupt(uint dma, ubyte channel);
// void dma_enable_half_transfer_interrupt(uint dma, ubyte channel);
// void dma_disable_half_transfer_interrupt(uint dma, ubyte channel);
// void dma_enable_transfer_complete_interrupt(uint dma, ubyte channel);
// void dma_disable_transfer_complete_interrupt(uint dma, ubyte channel);
// void dma_enable_channel(uint dma, ubyte channel);
// void dma_disable_channel(uint dma, ubyte channel);
// void dma_set_peripheral_address(uint dma, ubyte channel,
//     uint address);
// void dma_set_memory_address(uint dma, ubyte channel, uint address);
// void dma_set_number_of_data(uint dma, ubyte channel, ushort number);
//
// enum EXTI_IMR () { return MMIO!uint(EXTI_BASE + 0x00)
// enum EXTI_EMR () { return MMIO!uint(EXTI_BASE + 0x04)
// enum EXTI_RTSR () { return MMIO!uint(EXTI_BASE + 0x08)
// enum EXTI_FTSR () { return MMIO!uint(EXTI_BASE + 0x0c)
// enum EXTI_SWIER () { return MMIO!uint(EXTI_BASE + 0x10)
// enum EXTI_PR () { return MMIO!uint(EXTI_BASE + 0x14)

enum EXTI0 = 1 << 0;
enum EXTI1 = 1 << 1;
enum EXTI2 = 1 << 2;
enum EXTI3 = 1 << 3;
enum EXTI4 = 1 << 4;
enum EXTI5 = 1 << 5;
enum EXTI6 = 1 << 6;
enum EXTI7 = 1 << 7;
enum EXTI8 = 1 << 8;
enum EXTI9 = 1 << 9;
enum EXTI10 = 1 << 10;
enum EXTI11 = 1 << 11;
enum EXTI12 = 1 << 12;
enum EXTI13 = 1 << 13;
enum EXTI14 = 1 << 14;
enum EXTI15 = 1 << 15;
enum EXTI16 = 1 << 16;
enum EXTI17 = 1 << 17;
enum EXTI18 = 1 << 18;
enum EXTI19 = 1 << 19;
enum EXTI20 = 1 << 20;
enum EXTI21 = 1 << 21;
enum EXTI22 = 1 << 22;
enum EXTI23 = 1 << 23;
enum EXTI24 = 1 << 24;
enum EXTI25 = 1 << 25;
enum EXTI26 = 1 << 26;
enum EXTI27 = 1 << 27;
enum EXTI28 = 1 << 28;
enum EXTI29 = 1 << 29;
enum EXTI30 = 1 << 30;
enum EXTI31 = 1 << 31;
enum EXTI32 = 1 << 0;
enum EXTI33 = 1 << 1;
enum EXTI34 = 1 << 2;
enum EXTI35 = 1 << 3;
enum EXTI36 = 1 << 4;
enum EXTI37 = 1 << 5;

enum exti_trigger_type {
  EXTI_TRIGGER_RISING,
  EXTI_TRIGGER_FALLING,
  EXTI_TRIGGER_BOTH,
};

extern(C) extern void exti_set_trigger(
    uint extis, exti_trigger_type trig);
extern(C) extern void exti_enable_request(uint extis);
extern(C) extern void exti_disable_request(uint extis);
extern(C) extern void exti_reset_request(uint extis);
extern(C) extern void exti_select_source(uint exti, uint gpioport);
extern(C) extern uint exti_get_flag_status(uint exti);

// enum FLASH_ACR () { return MMIO!uint(FLASH_MEM_INTERFACE_BASE + 0x00)
// enum FLASH_KEYR () { return MMIO!uint(FLASH_MEM_INTERFACE_BASE + 0x04)
// enum FLASH_OPTKEYR () { return MMIO!uint(FLASH_MEM_INTERFACE_BASE + 0x08)
// enum FLASH_SR () { return MMIO!uint(FLASH_MEM_INTERFACE_BASE + 0x0C)
// enum FLASH_CR () { return MMIO!uint(FLASH_MEM_INTERFACE_BASE + 0x10)
// enum FLASH_AR () { return MMIO!uint(FLASH_MEM_INTERFACE_BASE + 0x14)
// enum FLASH_OBR () { return MMIO!uint(FLASH_MEM_INTERFACE_BASE + 0x1C)
// enum FLASH_WRPR () { return MMIO!uint(FLASH_MEM_INTERFACE_BASE + 0x20)
// enum FLASH_KEYR2 () { return MMIO!uint(FLASH_MEM_INTERFACE_BASE + 0x44)
// enum FLASH_SR2 () { return MMIO!uint(FLASH_MEM_INTERFACE_BASE + 0x4C)
// enum FLASH_CR2 () { return MMIO!uint(FLASH_MEM_INTERFACE_BASE + 0x50)
// enum FLASH_AR2 () { return MMIO!uint(FLASH_MEM_INTERFACE_BASE + 0x54)
// enum FLASH_OPTION_BYTE(i) () { return MMIO!ushort(INFO_BASE+0x0800 + (i)*2)
// enum FLASH_ACR_LATENCY_SHIFT 0
// enum FLASH_ACR_LATENCY 7
// enum FLASH_ACR_PRFTBS (1 << 5)
// enum FLASH_ACR_PRFTBE (1 << 4)
// enum FLASH_SR_EOP (1 << 5)
// enum FLASH_SR_WRPRTERR (1 << 4)
// enum FLASH_SR_PGERR (1 << 2)
// enum FLASH_SR_BSY (1 << 0)
// enum FLASH_CR_EOPIE (1 << 12)
// enum FLASH_CR_ERRIE (1 << 10)
// enum FLASH_CR_OPTWRE (1 << 9)
// enum FLASH_CR_LOCK (1 << 7)
// enum FLASH_CR_STRT (1 << 6)
// enum FLASH_CR_OPTER (1 << 5)
// enum FLASH_CR_OPTPG (1 << 4)
// enum FLASH_CR_MER (1 << 2)
// enum FLASH_CR_PER (1 << 1)
// enum FLASH_CR_PG (1 << 0)
// enum FLASH_OBR_RDPRT_SHIFT 1
// enum FLASH_OBR_OPTERR (1 << 0)
// enum FLASH_KEYR_KEY1 ((uint)0x45670123)
// enum FLASH_KEYR_KEY2 ((uint)0xcdef89ab)
//
// void flash_set_ws(uint ws);
// void flash_prefetch_buffer_enable();
// void flash_prefetch_buffer_disable();
// void flash_unlock();
// void flash_lock();
// void flash_clear_pgerr_flag();
// void flash_clear_eop_flag();
// void flash_clear_wrprterr_flag();
// void flash_clear_bsy_flag();
// void flash_clear_status_flags();
// uint flash_get_status_flags();
// void flash_wait_for_last_operation();
// void flash_program_word(uint address, uint data);
// void flash_program_half_word(uint address, ushort data);
// void flash_erase_page(uint page_address);
// void flash_erase_all_pages();
// void flash_unlock_option_bytes();
// void flash_erase_option_bytes();
// void flash_program_option_bytes(uint address, ushort data);
//
// enum FLASH_OPTION_BYTE_0 FLASH_OPTION_BYTE(0)
// enum FLASH_OPTION_BYTE_1 FLASH_OPTION_BYTE(1)
// enum FLASH_OPTION_BYTE_2 FLASH_OPTION_BYTE(2)
// enum FLASH_OPTION_BYTE_3 FLASH_OPTION_BYTE(3)
// enum FLASH_OPTION_BYTE_4 FLASH_OPTION_BYTE(4)
// enum FLASH_OPTION_BYTE_5 FLASH_OPTION_BYTE(5)
// enum FLASH_OPTION_BYTE_6 FLASH_OPTION_BYTE(6)
// enum FLASH_OPTION_BYTE_7 FLASH_OPTION_BYTE(7)
// enum FLASH_ACR_LATENCY_0WS 0x00
// enum FLASH_ACR_LATENCY_1WS 0x01
// enum FLASH_ACR_LATENCY_2WS 0x02
// enum FLASH_ACR_HLFCYA (1 << 3)
// enum FLASH_SR_EOP (1 << 5)
// enum FLASH_SR_WRPRTERR (1 << 4)
// enum FLASH_SR_PGERR (1 << 2)
// enum FLASH_SR_BSY (1 << 0)
// enum FLASH_OBR_NRST_STDBY (1 << 4)
// enum FLASH_OBR_NRST_STOP (1 << 3)
// enum FLASH_OBR_WDG_SW (1 << 2)
// enum FLASH_OBR_RDPRT_EN (1 << FLASH_OBR_RDPRT_SHIFT)
// enum FLASH_RDP_KEY ((ushort)0x00a5)
//
// void flash_halfcycle_enable();
// void flash_halfcycle_disable();
// void flash_unlock_upper();
// void flash_lock_upper();
// void flash_clear_pgerr_flag_upper();
// void flash_clear_eop_flag_upper();
// void flash_clear_wrprterr_flag_upper();
// void flash_clear_bsy_flag_upper();

enum GPIO_LCKK = 1 << 16;
enum GPIO0 = 1 << 0;
enum GPIO1 = 1 << 1;
enum GPIO2 = 1 << 2;
enum GPIO3 = 1 << 3;
enum GPIO4 = 1 << 4;
enum GPIO5 = 1 << 5;
enum GPIO6 = 1 << 6;
enum GPIO7 = 1 << 7;
enum GPIO8 = 1 << 8;
enum GPIO9 = 1 << 9;
enum GPIO10 = 1 << 10;
enum GPIO11 = 1 << 11;
enum GPIO12 = 1 << 12;
enum GPIO13 = 1 << 13;
enum GPIO14 = 1 << 14;
enum GPIO15 = 1 << 15;
enum GPIO_ALL = 0xffff;

extern(C) extern void gpio_set(uint gpioport, ushort gpios);
extern(C) extern void gpio_clear(uint gpioport, ushort gpios);
extern(C) extern ushort gpio_get(uint gpioport, ushort gpios);
extern(C) extern void gpio_toggle(uint gpioport, ushort gpios);
extern(C) extern ushort gpio_port_read(uint gpioport);
extern(C) extern void gpio_port_write(uint gpioport, ushort data);
extern(C) extern void gpio_port_config_lock(uint gpioport, ushort gpios);

enum GPIOA = GPIO_PORT_A_BASE;
enum GPIOB = GPIO_PORT_B_BASE;
enum GPIOC = GPIO_PORT_C_BASE;
enum GPIOD = GPIO_PORT_D_BASE;
enum GPIOE = GPIO_PORT_E_BASE;
enum GPIOF = GPIO_PORT_F_BASE;
enum GPIOG = GPIO_PORT_G_BASE;
enum GPIO_CAN1_RX = GPIO11;
enum GPIO_CAN1_TX = GPIO12;
enum GPIO_CAN_RX = GPIO_CAN1_RX;
enum GPIO_CAN_TX = GPIO_CAN1_TX;
enum GPIO_CAN_PB_RX = GPIO8;
enum GPIO_CAN_PB_TX = GPIO9;
enum GPIO_CAN1_PB_RX = GPIO_CAN_PB_RX;
enum GPIO_CAN1_PB_TX = GPIO_CAN_PB_TX;
enum GPIO_CAN_PD_RX = GPIO0;
enum GPIO_CAN_PD_TX = GPIO1;
enum GPIO_CAN1_PD_RX = GPIO_CAN_PD_RX;
enum GPIO_CAN1_PD_TX = GPIO_CAN_PD_TX;
enum GPIO_BANK_CAN1_RX = GPIOA;
enum GPIO_BANK_CAN1_TX = GPIOA;
enum GPIO_BANK_CAN_RX = GPIO_BANK_CAN1_RX;
enum GPIO_BANK_CAN_TX = GPIO_BANK_CAN1_TX;
enum GPIO_BANK_CAN_PB_RX = GPIOB;
enum GPIO_BANK_CAN_PB_TX = GPIOB;
enum GPIO_BANK_CAN1_PB_RX = GPIO_BANK_CAN_PB_RX;
enum GPIO_BANK_CAN1_PB_TX = GPIO_BANK_CAN_PB_TX;
enum GPIO_BANK_CAN_PD_RX = GPIOD;
enum GPIO_BANK_CAN_PD_TX = GPIOD;
enum GPIO_BANK_CAN1_PD_RX = GPIO_BANK_CAN_PD_RX;
enum GPIO_BANK_CAN1_PD_TX = GPIO_BANK_CAN_PD_TX;
enum GPIO_CAN2_RX = GPIO12;
enum GPIO_CAN2_TX = GPIO13;
enum GPIO_CAN2_RE_RX = GPIO5;
enum GPIO_CAN2_RE_TX = GPIO6;
enum GPIO_BANK_CAN2_RX = GPIOB;
enum GPIO_BANK_CAN2_TX = GPIOB;
enum GPIO_BANK_CAN2_RE_RX = GPIOB;
enum GPIO_BANK_CAN2_RE_TX = GPIOB;
enum GPIO_JTMS_SWDIO = GPIO13;
enum GPIO_JTCK_SWCLK = GPIO14;
enum GPIO_JTDI = GPIO15;
enum GPIO_JTDO_TRACESWO = GPIO3;
enum GPIO_JNTRST = GPIO4;
enum GPIO_TRACECK = GPIO2;
enum GPIO_TRACED0 = GPIO3;
enum GPIO_TRACED1 = GPIO4;
enum GPIO_TRACED2 = GPIO5;
enum GPIO_TRACED3 = GPIO6;
enum GPIO_BANK_JTMS_SWDIO = GPIOA;
enum GPIO_BANK_JTCK_SWCLK = GPIOA;
enum GPIO_BANK_JTDI = GPIOA;
enum GPIO_BANK_JTDO_TRACESWO = GPIOB;
enum GPIO_BANK_JNTRST = GPIOB;
enum GPIO_BANK_TRACECK = GPIOE;
enum GPIO_BANK_TRACED0 = GPIOE;
enum GPIO_BANK_TRACED1 = GPIOE;
enum GPIO_BANK_TRACED2 = GPIOE;
enum GPIO_BANK_TRACED3 = GPIOE;
enum GPIO_TIM5_CH1 = GPIO0;
enum GPIO_TIM5_CH2 = GPIO1;
enum GPIO_TIM5_CH3 = GPIO2;
enum GPIO_TIM5_CH4 = GPIO3;
enum GPIO_BANK_TIM5_CH1 = GPIOA;
enum GPIO_BANK_TIM5_CH2 = GPIOA;
enum GPIO_BANK_TIM5_CH3 = GPIOA;
enum GPIO_BANK_TIM5_CH4 = GPIOA;
enum GPIO_BANK_TIM5 = GPIOA;
enum GPIO_TIM4_CH1 = GPIO6;
enum GPIO_TIM4_CH2 = GPIO7;
enum GPIO_TIM4_CH3 = GPIO8;
enum GPIO_TIM4_CH4 = GPIO9;
enum GPIO_TIM4_RE_CH1 = GPIO12;
enum GPIO_TIM4_RE_CH2 = GPIO13;
enum GPIO_TIM4_RE_CH3 = GPIO14;
enum GPIO_TIM4_RE_CH4 = GPIO15;
enum GPIO_BANK_TIM4_CH1 = GPIOB;
enum GPIO_BANK_TIM4_CH2 = GPIOB;
enum GPIO_BANK_TIM4_CH3 = GPIOB;
enum GPIO_BANK_TIM4_CH4 = GPIOB;
enum GPIO_BANK_TIM4 = GPIOB;
enum GPIO_BANK_TIM4_RE_CH1 = GPIOD;
enum GPIO_BANK_TIM4_RE_CH2 = GPIOD;
enum GPIO_BANK_TIM4_RE_CH3 = GPIOD;
enum GPIO_BANK_TIM4_RE_CH4 = GPIOD;
enum GPIO_BANK_TIM4_RE = GPIOD;
enum GPIO_TIM3_CH1 = GPIO6;
enum GPIO_TIM3_CH2 = GPIO7;
enum GPIO_TIM3_CH3 = GPIO0;
enum GPIO_TIM3_CH4 = GPIO1;
enum GPIO_TIM3_PR_CH1 = GPIO4;
enum GPIO_TIM3_PR_CH2 = GPIO5;
enum GPIO_TIM3_PR_CH3 = GPIO0;
enum GPIO_TIM3_PR_CH4 = GPIO1;
enum GPIO_TIM3_FR_CH1 = GPIO6;
enum GPIO_TIM3_FR_CH2 = GPIO7;
enum GPIO_TIM3_FR_CH3 = GPIO8;
enum GPIO_TIM3_FR_CH4 = GPIO9;
enum GPIO_BANK_TIM3_CH1 = GPIOA;
enum GPIO_BANK_TIM3_CH2 = GPIOA;
enum GPIO_BANK_TIM3_CH3 = GPIOB;
enum GPIO_BANK_TIM3_CH4 = GPIOB;
enum GPIO_BANK_TIM3_CH12 = GPIOA;
enum GPIO_BANK_TIM3_CH34 = GPIOB;
enum GPIO_BANK_TIM3_PR_CH1 = GPIOB;
enum GPIO_BANK_TIM3_PR_CH2 = GPIOB;
enum GPIO_BANK_TIM3_PR_CH3 = GPIOB;
enum GPIO_BANK_TIM3_PR_CH4 = GPIOB;
enum GPIO_BANK_TIM3_PR = GPIOB;
enum GPIO_BANK_TIM3_FR_CH1 = GPIOC;
enum GPIO_BANK_TIM3_FR_CH2 = GPIOC;
enum GPIO_BANK_TIM3_FR_CH3 = GPIOC;
enum GPIO_BANK_TIM3_FR_CH4 = GPIOC;
enum GPIO_BANK_TIM3_FR = GPIOC;
enum GPIO_TIM2_CH1_ETR = GPIO0;
enum GPIO_TIM2_CH2 = GPIO1;
enum GPIO_TIM2_CH3 = GPIO2;
enum GPIO_TIM2_CH4 = GPIO3;
enum GPIO_TIM2_PR1_CH1_ETR = GPIO15;
enum GPIO_TIM2_PR1_CH2 = GPIO3;
enum GPIO_TIM2_PR1_CH3 = GPIO2;
enum GPIO_TIM2_PR1_CH4 = GPIO3;
enum GPIO_TIM2_PR2_CH1_ETR = GPIO0;
enum GPIO_TIM2_PR2_CH2 = GPIO1;
enum GPIO_TIM2_PR2_CH3 = GPIO10;
enum GPIO_TIM2_PR2_CH4 = GPIO11;
enum GPIO_TIM2_FR_CH1_ETR = GPIO15;
enum GPIO_TIM2_FR_CH2 = GPIO3;
enum GPIO_TIM2_FR_CH3 = GPIO10;
enum GPIO_TIM2_FR_CH4 = GPIO11;
enum GPIO_BANK_TIM2_CH1_ETR = GPIOA;
enum GPIO_BANK_TIM2_CH2 = GPIOA;
enum GPIO_BANK_TIM2_CH3 = GPIOA;
enum GPIO_BANK_TIM2_CH4 = GPIOA;
enum GPIO_BANK_TIM2 = GPIOA;
enum GPIO_BANK_TIM2_PR1_CH1_ETR = GPIOA;
enum GPIO_BANK_TIM2_PR1_CH2 = GPIOB;
enum GPIO_BANK_TIM2_PR1_CH3 = GPIOA;
enum GPIO_BANK_TIM2_PR1_CH4 = GPIOA;
enum GPIO_BANK_TIM2_PR1_CH134 = GPIOA;
enum GPIO_BANK_TIM2_PR2_CH1_ETR = GPIOA;
enum GPIO_BANK_TIM2_PR2_CH2 = GPIOA;
enum GPIO_BANK_TIM2_PR2_CH3 = GPIOB;
enum GPIO_BANK_TIM2_PR2_CH4 = GPIOB;
enum GPIO_BANK_TIM2_PR2_CH12 = GPIOA;
enum GPIO_BANK_TIM2_PR2_CH34 = GPIOB;
enum GPIO_BANK_TIM2_FR_CH1_ETR = GPIOA;
enum GPIO_BANK_TIM2_FR_CH2 = GPIOB;
enum GPIO_BANK_TIM2_FR_CH3 = GPIOB;
enum GPIO_BANK_TIM2_FR_CH4 = GPIOB;
enum GPIO_BANK_TIM2_FR_CH234 = GPIOB;
enum GPIO_TIM1_ETR = GPIO12;
enum GPIO_TIM1_CH1 = GPIO8;
enum GPIO_TIM1_CH2 = GPIO9;
enum GPIO_TIM1_CH3 = GPIO10;
enum GPIO_TIM1_CH4 = GPIO11;
enum GPIO_TIM1_BKIN = GPIO12;
enum GPIO_TIM1_CH1N = GPIO13;
enum GPIO_TIM1_CH2N = GPIO14;
enum GPIO_TIM1_CH3N = GPIO15;
enum GPIO_TIM1_PR_ETR = GPIO12;
enum GPIO_TIM1_PR_CH1 = GPIO8;
enum GPIO_TIM1_PR_CH2 = GPIO9;
enum GPIO_TIM1_PR_CH3 = GPIO10;
enum GPIO_TIM1_PR_CH4 = GPIO11;
enum GPIO_TIM1_PR_BKIN = GPIO6;
enum GPIO_TIM1_PR_CH1N = GPIO7;
enum GPIO_TIM1_PR_CH2N = GPIO0;
enum GPIO_TIM1_PR_CH3N = GPIO1;
enum GPIO_TIM1_FR_ETR = GPIO7;
enum GPIO_TIM1_FR_CH1 = GPIO9;
enum GPIO_TIM1_FR_CH2 = GPIO11;
enum GPIO_TIM1_FR_CH3 = GPIO13;
enum GPIO_TIM1_FR_CH4 = GPIO14;
enum GPIO_TIM1_FR_BKIN = GPIO15;
enum GPIO_TIM1_FR_CH1N = GPIO8;
enum GPIO_TIM1_FR_CH2N = GPIO10;
enum GPIO_TIM1_FR_CH3N = GPIO12;
enum GPIO_BANK_TIM1_ETR = GPIOA;
enum GPIO_BANK_TIM1_CH1 = GPIOA;
enum GPIO_BANK_TIM1_CH2 = GPIOA;
enum GPIO_BANK_TIM1_CH3 = GPIOA;
enum GPIO_BANK_TIM1_CH4 = GPIOA;
enum GPIO_BANK_TIM1_BKIN = GPIOB;
enum GPIO_BANK_TIM1_CH1N = GPIOB;
enum GPIO_BANK_TIM1_CH2N = GPIOB;
enum GPIO_BANK_TIM1_CH3N = GPIOB;
enum GPIO_BANK_TIM1_ETR_CH1234 = GPIOA;
enum GPIO_BANK_TIM1_BKIN_CH123N = GPIOB;
enum GPIO_BANK_TIM1_PR_ETR = GPIOA;
enum GPIO_BANK_TIM1_PR_CH1 = GPIOA;
enum GPIO_BANK_TIM1_PR_CH2 = GPIOA;
enum GPIO_BANK_TIM1_PR_CH3 = GPIOA;
enum GPIO_BANK_TIM1_PR_CH4 = GPIOA;
enum GPIO_BANK_TIM1_PR_BKIN = GPIOA;
enum GPIO_BANK_TIM1_PR_CH1N = GPIOA;
enum GPIO_BANK_TIM1_PR_CH2N = GPIOB;
enum GPIO_BANK_TIM1_PR_CH3N = GPIOB;
enum GPIO_BANK_TIM1_PR_ETR_CH1234_BKIN_CH1N = GPIOA;
enum GPIO_BANK_TIM1_PR_CH23N = GPIOB;
enum GPIO_BANK_TIM1_FR_ETR = GPIOE;
enum GPIO_BANK_TIM1_FR_CH1 = GPIOE;
enum GPIO_BANK_TIM1_FR_CH2 = GPIOE;
enum GPIO_BANK_TIM1_FR_CH3 = GPIOE;
enum GPIO_BANK_TIM1_FR_CH4 = GPIOE;
enum GPIO_BANK_TIM1_FR_BKIN = GPIOE;
enum GPIO_BANK_TIM1_FR_CH1N = GPIOE;
enum GPIO_BANK_TIM1_FR_CH2N = GPIOE;
enum GPIO_BANK_TIM1_FR_CH3N = GPIOE;
enum GPIO_BANK_TIM1_FR = GPIOE;
enum GPIO_UART5_TX = GPIO12;
enum GPIO_UART5_RX = GPIO2;
enum GPIO_BANK_UART5_TX = GPIOC;
enum GPIO_BANK_UART5_RX = GPIOD;
enum GPIO_UART4_TX = GPIO10;
enum GPIO_UART4_RX = GPIO11;
enum GPIO_BANK_UART4_TX = GPIOC;
enum GPIO_BANK_UART4_RX = GPIOC;
enum GPIO_USART3_TX = GPIO10;
enum GPIO_USART3_RX = GPIO11;
enum GPIO_USART3_CK = GPIO12;
enum GPIO_USART3_CTS = GPIO13;
enum GPIO_USART3_RTS = GPIO14;
enum GPIO_USART3_PR_TX = GPIO10;
enum GPIO_USART3_PR_RX = GPIO11;
enum GPIO_USART3_PR_CK = GPIO12;
enum GPIO_USART3_PR_CTS = GPIO13;
enum GPIO_USART3_PR_RTS = GPIO14;
enum GPIO_USART3_FR_TX = GPIO8;
enum GPIO_USART3_FR_RX = GPIO9;
enum GPIO_USART3_FR_CK = GPIO10;
enum GPIO_USART3_FR_CTS = GPIO11;
enum GPIO_USART3_FR_RTS = GPIO12;
enum GPIO_BANK_USART3_TX = GPIOB;
enum GPIO_BANK_USART3_RX = GPIOB;
enum GPIO_BANK_USART3_CK = GPIOB;
enum GPIO_BANK_USART3_CTS = GPIOB;
enum GPIO_BANK_USART3_RTS = GPIOB;
enum GPIO_BANK_USART3_PR_TX = GPIOC;
enum GPIO_BANK_USART3_PR_RX = GPIOC;
enum GPIO_BANK_USART3_PR_CK = GPIOC;
enum GPIO_BANK_USART3_PR_CTS = GPIOB;
enum GPIO_BANK_USART3_PR_RTS = GPIOB;
enum GPIO_BANK_USART3_FR_TX = GPIOD;
enum GPIO_BANK_USART3_FR_RX = GPIOD;
enum GPIO_BANK_USART3_FR_CK = GPIOD;
enum GPIO_BANK_USART3_FR_CTS = GPIOD;
enum GPIO_BANK_USART3_FR_RTS = GPIOD;
enum GPIO_USART2_CTS = GPIO0;
enum GPIO_USART2_RTS = GPIO1;
enum GPIO_USART2_TX = GPIO2;
enum GPIO_USART2_RX = GPIO3;
enum GPIO_USART2_CK = GPIO4;
enum GPIO_USART2_RE_CTS = GPIO3;
enum GPIO_USART2_RE_RTS = GPIO4;
enum GPIO_USART2_RE_TX = GPIO5;
enum GPIO_USART2_RE_RX = GPIO6;
enum GPIO_USART2_RE_CK = GPIO7;
enum GPIO_BANK_USART2_CTS = GPIOA;
enum GPIO_BANK_USART2_RTS = GPIOA;
enum GPIO_BANK_USART2_TX = GPIOA;
enum GPIO_BANK_USART2_RX = GPIOA;
enum GPIO_BANK_USART2_CK = GPIOA;
enum GPIO_BANK_USART2_RE_CTS = GPIOD;
enum GPIO_BANK_USART2_RE_RTS = GPIOD;
enum GPIO_BANK_USART2_RE_TX = GPIOD;
enum GPIO_BANK_USART2_RE_RX = GPIOD;
enum GPIO_BANK_USART2_RE_CK = GPIOD;
enum GPIO_USART1_TX = GPIO9;
enum GPIO_USART1_RX = GPIO10;
enum GPIO_USART1_RE_TX = GPIO6;
enum GPIO_USART1_RE_RX = GPIO7;
enum GPIO_BANK_USART1_TX = GPIOA;
enum GPIO_BANK_USART1_RX = GPIOA;
enum GPIO_BANK_USART1_RE_TX = GPIOB;
enum GPIO_BANK_USART1_RE_RX = GPIOB;
enum GPIO_I2C1_SMBAI = GPIO5;
enum GPIO_I2C1_SCL = GPIO6;
enum GPIO_I2C1_SDA = GPIO7;
enum GPIO_I2C1_RE_SMBAI = GPIO5;
enum GPIO_I2C1_RE_SCL = GPIO8;
enum GPIO_I2C1_RE_SDA = GPIO9;
enum GPIO_BANK_I2C1_SMBAI = GPIOB;
enum GPIO_BANK_I2C1_SCL = GPIOB;
enum GPIO_BANK_I2C1_SDA = GPIOB;
enum GPIO_BANK_I2C1_RE_SMBAI = GPIOB;
enum GPIO_BANK_I2C1_RE_SCL = GPIOB;
enum GPIO_BANK_I2C1_RE_SDA = GPIOB;
enum GPIO_I2C2_SCL = GPIO10;
enum GPIO_I2C2_SDA = GPIO11;
enum GPIO_I2C2_SMBAI = GPIO12;
enum GPIO_BANK_I2C2_SCL = GPIOB;
enum GPIO_BANK_I2C2_SDA = GPIOB;
enum GPIO_BANK_I2C2_SMBAI = GPIOB;
enum GPIO_SPI1_NSS = GPIO4;
enum GPIO_SPI1_SCK = GPIO5;
enum GPIO_SPI1_MISO = GPIO6;
enum GPIO_SPI1_MOSI = GPIO7;
enum GPIO_SPI1_RE_NSS = GPIO15;
enum GPIO_SPI1_RE_SCK = GPIO3;
enum GPIO_SPI1_RE_MISO = GPIO4;
enum GPIO_SPI1_RE_MOSI = GPIO5;
enum GPIO_BANK_SPI1_NSS = GPIOA;
enum GPIO_BANK_SPI1_SCK = GPIOA;
enum GPIO_BANK_SPI1_MISO = GPIOA;
enum GPIO_BANK_SPI1_MOSI = GPIOA;
enum GPIO_BANK_SPI1_RE_NSS = GPIOA;
enum GPIO_BANK_SPI1_RE_SCK = GPIOB;
enum GPIO_BANK_SPI1_RE_MISO = GPIOB;
enum GPIO_BANK_SPI1_RE_MOSI = GPIOB;
enum GPIO_SPI2_NSS = GPIO12;
enum GPIO_SPI2_SCK = GPIO13;
enum GPIO_SPI2_MISO = GPIO14;
enum GPIO_SPI2_MOSI = GPIO15;
enum GPIO_BANK_SPI2_NSS = GPIOB;
enum GPIO_BANK_SPI2_SCK = GPIOB;
enum GPIO_BANK_SPI2_MISO = GPIOB;
enum GPIO_BANK_SPI2_MOSI = GPIOB;
enum GPIO_SPI3_NSS = GPIO15;
enum GPIO_SPI3_SCK = GPIO3;
enum GPIO_SPI3_MISO = GPIO4;
enum GPIO_SPI3_MOSI = GPIO5;
enum GPIO_SPI3_RE_NSS = GPIO4;
enum GPIO_SPI3_RE_SCK = GPIO10;
enum GPIO_SPI3_RE_MISO = GPIO11;
enum GPIO_SPI3_RE_MOSI = GPIO12;
enum GPIO_BANK_SPI3_NSS = GPIOA;
enum GPIO_BANK_SPI3_SCK = GPIOB;
enum GPIO_BANK_SPI3_MISO = GPIOB;
enum GPIO_BANK_SPI3_MOSI = GPIOB;
enum GPIO_BANK_SPI3_RE_NSS = GPIOA;
enum GPIO_BANK_SPI3_RE_SCK = GPIOC;
enum GPIO_BANK_SPI3_RE_MISO = GPIOC;
enum GPIO_BANK_SPI3_RE_MOSI = GPIOC;
enum GPIO_ETH_RX_DV_CRS_DV = GPIO7;
enum GPIO_ETH_RXD0 = GPIO4;
enum GPIO_ETH_RXD1 = GPIO5;
enum GPIO_ETH_RXD2 = GPIO0;
enum GPIO_ETH_RXD3 = GPIO1;
enum GPIO_ETH_RE_RX_DV_CRS_DV = GPIO8;
enum GPIO_ETH_RE_RXD0 = GPIO9;
enum GPIO_ETH_RE_RXD1 = GPIO10;
enum GPIO_ETH_RE_RXD2 = GPIO11;
enum GPIO_ETH_RE_RXD3 = GPIO12;
enum GPIO_BANK_ETH_RX_DV_CRS_DV = GPIOA;
enum GPIO_BANK_ETH_RXD0 = GPIOC;
enum GPIO_BANK_ETH_RXD1 = GPIOC;
enum GPIO_BANK_ETH_RXD2 = GPIOB;
enum GPIO_BANK_ETH_RXD3 = GPIOB;
enum GPIO_BANK_ETH_RE_RX_DV_CRS_DV = GPIOD;
enum GPIO_BANK_ETH_RE_RXD0 = GPIOD;
enum GPIO_BANK_ETH_RE_RXD1 = GPIOD;
enum GPIO_BANK_ETH_RE_RXD2 = GPIOD;
enum GPIO_BANK_ETH_RE_RXD3 = GPIOD;

// enum GPIO_CRL(port) () { return MMIO!uint((port) + 0x00)
// enum GPIOA_CRL GPIO_CRL(GPIOA)
// enum GPIOB_CRL GPIO_CRL(GPIOB)
// enum GPIOC_CRL GPIO_CRL(GPIOC)
// enum GPIOD_CRL GPIO_CRL(GPIOD)
// enum GPIOE_CRL GPIO_CRL(GPIOE)
// enum GPIOF_CRL GPIO_CRL(GPIOF)
// enum GPIOG_CRL GPIO_CRL(GPIOG)
// enum GPIO_CRH(port) () { return MMIO!uint((port) + 0x04)
// enum GPIOA_CRH GPIO_CRH(GPIOA)
// enum GPIOB_CRH GPIO_CRH(GPIOB)
// enum GPIOC_CRH GPIO_CRH(GPIOC)
// enum GPIOD_CRH GPIO_CRH(GPIOD)
// enum GPIOE_CRH GPIO_CRH(GPIOE)
// enum GPIOF_CRH GPIO_CRH(GPIOF)
// enum GPIOG_CRH GPIO_CRH(GPIOG)
// enum GPIO_IDR(port) () { return MMIO!uint((port) + 0x08)
// enum GPIOA_IDR GPIO_IDR(GPIOA)
// enum GPIOB_IDR GPIO_IDR(GPIOB)
// enum GPIOC_IDR GPIO_IDR(GPIOC)
// enum GPIOD_IDR GPIO_IDR(GPIOD)
// enum GPIOE_IDR GPIO_IDR(GPIOE)
// enum GPIOF_IDR GPIO_IDR(GPIOF)
// enum GPIOG_IDR GPIO_IDR(GPIOG)
// enum GPIO_ODR(port) () { return MMIO!uint((port) + 0x0c)
// enum GPIOA_ODR GPIO_ODR(GPIOA)
// enum GPIOB_ODR GPIO_ODR(GPIOB)
// enum GPIOC_ODR GPIO_ODR(GPIOC)
// enum GPIOD_ODR GPIO_ODR(GPIOD)
// enum GPIOE_ODR GPIO_ODR(GPIOE)
// enum GPIOF_ODR GPIO_ODR(GPIOF)
// enum GPIOG_ODR GPIO_ODR(GPIOG)
// enum GPIO_BSRR(port) () { return MMIO!uint((port) + 0x10)
// enum GPIOA_BSRR GPIO_BSRR(GPIOA)
// enum GPIOB_BSRR GPIO_BSRR(GPIOB)
// enum GPIOC_BSRR GPIO_BSRR(GPIOC)
// enum GPIOD_BSRR GPIO_BSRR(GPIOD)
// enum GPIOE_BSRR GPIO_BSRR(GPIOE)
// enum GPIOF_BSRR GPIO_BSRR(GPIOF)
// enum GPIOG_BSRR GPIO_BSRR(GPIOG)
// enum GPIO_BRR(port) () { return MMIO!ushort((port) + 0x14)
// enum GPIOA_BRR GPIO_BRR(GPIOA)
// enum GPIOB_BRR GPIO_BRR(GPIOB)
// enum GPIOC_BRR GPIO_BRR(GPIOC)
// enum GPIOD_BRR GPIO_BRR(GPIOD)
// enum GPIOE_BRR GPIO_BRR(GPIOE)
// enum GPIOF_BRR GPIO_BRR(GPIOF)
// enum GPIOG_BRR GPIO_BRR(GPIOG)
// enum GPIO_LCKR(port) () { return MMIO!uint((port) + 0x18)
// enum GPIOA_LCKR GPIO_LCKR(GPIOA)
// enum GPIOB_LCKR GPIO_LCKR(GPIOB)
// enum GPIOC_LCKR GPIO_LCKR(GPIOC)
// enum GPIOD_LCKR GPIO_LCKR(GPIOD)
// enum GPIOE_LCKR GPIO_LCKR(GPIOE)
// enum GPIOF_LCKR GPIO_LCKR(GPIOF)
// enum GPIOG_LCKR GPIO_LCKR(GPIOG)

enum GPIO_CNF_INPUT_ANALOG = 0x00;
enum GPIO_CNF_INPUT_FLOAT = 0x01;
enum GPIO_CNF_INPUT_PULL_UPDOWN = 0x02;
enum GPIO_CNF_OUTPUT_PUSHPULL = 0x00;
enum GPIO_CNF_OUTPUT_OPENDRAIN = 0x01;
enum GPIO_CNF_OUTPUT_ALTFN_PUSHPULL = 0x02;
enum GPIO_CNF_OUTPUT_ALTFN_OPENDRAIN = 0x03;
enum GPIO_MODE_INPUT = 0x00;
enum GPIO_MODE_OUTPUT_10_MHZ = 0x01;
enum GPIO_MODE_OUTPUT_2_MHZ = 0x02;
enum GPIO_MODE_OUTPUT_50_MHZ = 0x03;

// enum AFIO_EVCR () { return MMIO!uint(AFIO_BASE + 0x00)
// enum AFIO_MAPR () { return MMIO!uint(AFIO_BASE + 0x04)
// enum AFIO_EXTICR(i) () { return MMIO!uint(AFIO_BASE + 0x08 + (i)*4)
// enum AFIO_EXTICR1 AFIO_EXTICR(0)
// enum AFIO_EXTICR2 AFIO_EXTICR(1)
// enum AFIO_EXTICR3 AFIO_EXTICR(2)
// enum AFIO_EXTICR4 AFIO_EXTICR(3)
// enum AFIO_MAPR2 () { return MMIO!uint(AFIO_BASE + 0x1C)
// enum AFIO_EVCR_EVOE (1 << 7)
// enum AFIO_EVCR_PORT_PA (0x0 << 4)
// enum AFIO_EVCR_PORT_PB (0x1 << 4)
// enum AFIO_EVCR_PORT_PC (0x2 << 4)
// enum AFIO_EVCR_PORT_PD (0x3 << 4)
// enum AFIO_EVCR_PORT_PE (0x4 << 4)
// enum AFIO_EVCR_PIN_Px0 (0x0 << 0)
// enum AFIO_EVCR_PIN_Px1 (0x1 << 0)
// enum AFIO_EVCR_PIN_Px2 (0x2 << 0)
// enum AFIO_EVCR_PIN_Px3 (0x3 << 0)
// enum AFIO_EVCR_PIN_Px4 (0x4 << 0)
// enum AFIO_EVCR_PIN_Px5 (0x5 << 0)
// enum AFIO_EVCR_PIN_Px6 (0x6 << 0)
// enum AFIO_EVCR_PIN_Px7 (0x7 << 0)
// enum AFIO_EVCR_PIN_Px8 (0x8 << 0)
// enum AFIO_EVCR_PIN_Px9 (0x9 << 0)
// enum AFIO_EVCR_PIN_Px10 (0xA << 0)
// enum AFIO_EVCR_PIN_Px11 (0xB << 0)
// enum AFIO_EVCR_PIN_Px12 (0xC << 0)
// enum AFIO_EVCR_PIN_Px13 (0xD << 0)
// enum AFIO_EVCR_PIN_Px14 (0xE << 0)
// enum AFIO_EVCR_PIN_Px15 (0xF << 0)
// enum AFIO_MAPR_PTP_PPS_REMAP (1 << 30)
// enum AFIO_MAPR_TIM2ITR1_IREMAP (1 << 29)
// enum AFIO_MAPR_SPI3_REMAP (1 << 28)
// enum AFIO_MAPR_MII_RMII_SEL (1 << 23)
// enum AFIO_MAPR_CAN2_REMAP (1 << 22)
// enum AFIO_MAPR_ETH_REMAP (1 << 21)
// enum AFIO_MAPR_SWJ_MASK (0x7 << 24)
// enum AFIO_MAPR_SWJ_CFG_FULL_SWJ (0x0 << 24)
// enum AFIO_MAPR_SWJ_CFG_FULL_SWJ_NO_JNTRST (0x1 << 24)
// enum AFIO_MAPR_SWJ_CFG_JTAG_OFF_SW_ON (0x2 << 24)
// enum AFIO_MAPR_SWJ_CFG_JTAG_OFF_SW_OFF (0x4 << 24)
// enum AFIO_MAPR_ADC2_ETRGREG_REMAP (1 << 20)
// enum AFIO_MAPR_ADC2_ETRGINJ_REMAP (1 << 19)
// enum AFIO_MAPR_ADC1_ETRGREG_REMAP (1 << 18)
// enum AFIO_MAPR_ADC1_ETRGINJ_REMAP (1 << 17)
// enum AFIO_MAPR_TIM5CH4_IREMAP (1 << 16)
// enum AFIO_MAPR_PD01_REMAP (1 << 15)
// enum AFIO_MAPR_TIM4_REMAP (1 << 12)
// enum AFIO_MAPR_USART2_REMAP (1 << 3)
// enum AFIO_MAPR_USART1_REMAP (1 << 2)
// enum AFIO_MAPR_I2C1_REMAP (1 << 1)
// enum AFIO_MAPR_SPI1_REMAP (1 << 0)
// enum AFIO_MAPR_CAN1_REMAP_PORTA (0x0 << 13)
// enum AFIO_MAPR_CAN1_REMAP_PORTB (0x2 << 13)
// enum AFIO_MAPR_CAN1_REMAP_PORTD (0x3 << 13)
// enum AFIO_MAPR_TIM3_REMAP_NO_REMAP (0x0 << 10)
// enum AFIO_MAPR_TIM3_REMAP_PARTIAL_REMAP (0x2 << 10)
// enum AFIO_MAPR_TIM3_REMAP_FULL_REMAP (0x3 << 10)
// enum AFIO_MAPR_TIM2_REMAP_NO_REMAP (0x0 << 8)
// enum AFIO_MAPR_TIM2_REMAP_PARTIAL_REMAP1 (0x1 << 8)
// enum AFIO_MAPR_TIM2_REMAP_PARTIAL_REMAP2 (0x2 << 8)
// enum AFIO_MAPR_TIM2_REMAP_FULL_REMAP (0x3 << 8)
// enum AFIO_MAPR_TIM1_REMAP_NO_REMAP (0x0 << 6)
// enum AFIO_MAPR_TIM1_REMAP_PARTIAL_REMAP (0x1 << 6)
// enum AFIO_MAPR_TIM1_REMAP_FULL_REMAP (0x3 << 6)
// enum AFIO_MAPR_USART3_REMAP_NO_REMAP (0x0 << 4)
// enum AFIO_MAPR_USART3_REMAP_PARTIAL_REMAP (0x1 << 4)
// enum AFIO_MAPR_USART3_REMAP_FULL_REMAP (0x3 << 4)
// enum AFIO_MAPR2_MISC_REMAP (1 << 13)
// enum AFIO_MAPR2_TIM12_REMAP (1 << 12)
// enum AFIO_MAPR2_TIM76_DAC_DMA_REMAPE (1 << 11)
// enum AFIO_MAPR2_FSMC_NADV_DISCONNECT (1 << 10)
// enum AFIO_MAPR2_TIM14_REMAP (1 << 9)
// enum AFIO_MAPR2_TIM13_REMAP (1 << 8)
// enum AFIO_MAPR2_TIM11_REMAP (1 << 7)
// enum AFIO_MAPR2_TIM10_REMAP (1 << 6)
// enum AFIO_MAPR2_TIM9_REMAP (1 << 5)
// enum AFIO_MAPR2_TIM1_DMA_REMAP (1 << 4)
// enum AFIO_MAPR2_CEC_REMAP (1 << 3)
// enum AFIO_MAPR2_TIM17_REMAP (1 << 2)
// enum AFIO_MAPR2_TIM16_REMAP (1 << 1)
// enum AFIO_MAPR1_TIM16_REMAP (1 << 0)
// enum AFIO_EXTI0 0
// enum AFIO_EXTI1 1
// enum AFIO_EXTI2 2
// enum AFIO_EXTI3 3
// enum AFIO_EXTI4 4
// enum AFIO_EXTI5 5
// enum AFIO_EXTI6 6
// enum AFIO_EXTI7 7
// enum AFIO_EXTI8 8
// enum AFIO_EXTI9 9
// enum AFIO_EXTI10 10
// enum AFIO_EXTI11 11
// enum AFIO_EXTI12 12
// enum AFIO_EXTI13 13
// enum AFIO_EXTI14 14
// enum AFIO_EXTI15 15

extern(C) extern void gpio_set_mode(
    uint gpioport, ubyte mode, ubyte cnf, ushort gpios);
extern(C) extern void gpio_set_eventout(
    ubyte evoutport, ubyte evoutpin);
extern(C) extern void gpio_primary_remap(uint swjenable, uint maps);
extern(C) extern void gpio_secondary_remap(uint maps);

// enum LIBOPENCM3_I2C_H
// enum LIBOPENCM3_I2C_COMMON_V1_H
// enum _STDDEF_H
// enum _STDDEF_H_
// enum _ANSI_STDDEF_H
// enum _PTRDIFF_T
// enum _T_PTRDIFF_
// enum _T_PTRDIFF
// enum __PTRDIFF_T
// enum _PTRDIFF_T_
// enum _BSD_PTRDIFF_T_
// enum ___int_ptrdiff_t_h
// enum _GCC_PTRDIFF_T
// enum _PTRDIFF_T_DECLARED
// typedef int ptrdiff_t;
// #undef __need_ptrdiff_t
// enum __size_t__
// enum __SIZE_T__
// enum _SIZE_T
// enum _SYS_SIZE_T_H
// enum _T_SIZE_
// enum _T_SIZE
// enum __SIZE_T
// enum _SIZE_T_
// enum _BSD_SIZE_T_
// enum _SIZE_T_DEFINED_
// enum _SIZE_T_DEFINED
// enum _BSD_SIZE_T_DEFINED_
// enum _SIZE_T_DECLARED
// enum ___int_size_t_h
// enum _GCC_SIZE_T
// enum _SIZET_
// enum __size_t
// typedef unsigned int size_t;
// #undef __need_size_t
// enum __wchar_t__
// enum __WCHAR_T__
// enum _WCHAR_T
// enum _T_WCHAR_
// enum _T_WCHAR
// enum __WCHAR_T
// enum _WCHAR_T_
// enum _BSD_WCHAR_T_
// enum _WCHAR_T_DEFINED_
// enum _WCHAR_T_DEFINED
// enum _WCHAR_T_H
// enum ___int_wchar_t_h
// enum __INT_WCHAR_T_H
// enum _GCC_WCHAR_T
// enum _WCHAR_T_DECLARED
// #undef _BSD_WCHAR_T_
// typedef unsigned int wchar_t;
// #undef __need_wchar_t
// #undef NULL
// enum NULL ((void *)0)
// #undef __need_NULL
// enum offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)
// enum I2C1 I2C1_BASE
// enum I2C2 I2C2_BASE
// enum I2C_CR1(i2c_base) () { return MMIO!uint((i2c_base) + 0x00)
// enum I2C1_CR1 I2C_CR1(I2C1)
// enum I2C2_CR1 I2C_CR1(I2C2)
// enum I2C_CR2(i2c_base) () { return MMIO!uint((i2c_base) + 0x04)
// enum I2C1_CR2 I2C_CR2(I2C1)
// enum I2C2_CR2 I2C_CR2(I2C2)
// enum I2C_OAR1(i2c_base) () { return MMIO!uint((i2c_base) + 0x08)
// enum I2C1_OAR1 I2C_OAR1(I2C1)
// enum I2C2_OAR1 I2C_OAR1(I2C2)
// enum I2C_OAR2(i2c_base) () { return MMIO!uint((i2c_base) + 0x0c)
// enum I2C1_OAR2 I2C_OAR2(I2C1)
// enum I2C2_OAR2 I2C_OAR2(I2C2)
// enum I2C_DR(i2c_base) () { return MMIO!uint((i2c_base) + 0x10)
// enum I2C1_DR I2C_DR(I2C1)
// enum I2C2_DR I2C_DR(I2C2)
// enum I2C_SR1(i2c_base) () { return MMIO!uint((i2c_base) + 0x14)
// enum I2C1_SR1 I2C_SR1(I2C1)
// enum I2C2_SR1 I2C_SR1(I2C2)
// enum I2C_SR2(i2c_base) () { return MMIO!uint((i2c_base) + 0x18)
// enum I2C1_SR2 I2C_SR2(I2C1)
// enum I2C2_SR2 I2C_SR2(I2C2)
// enum I2C_CCR(i2c_base) () { return MMIO!uint((i2c_base) + 0x1c)
// enum I2C1_CCR I2C_CCR(I2C1)
// enum I2C2_CCR I2C_CCR(I2C2)
// enum I2C_TRISE(i2c_base) () { return MMIO!uint((i2c_base) + 0x20)
// enum I2C1_TRISE I2C_TRISE(I2C1)
// enum I2C2_TRISE I2C_TRISE(I2C2)
// enum I2C_CR1_SWRST (1 << 15)
// enum I2C_CR1_ALERT (1 << 13)
// enum I2C_CR1_PEC (1 << 12)
// enum I2C_CR1_POS (1 << 11)
// enum I2C_CR1_ACK (1 << 10)
// enum I2C_CR1_STOP (1 << 9)
// enum I2C_CR1_START (1 << 8)
// enum I2C_CR1_NOSTRETCH (1 << 7)
// enum I2C_CR1_ENGC (1 << 6)
// enum I2C_CR1_ENPEC (1 << 5)
// enum I2C_CR1_ENARP (1 << 4)
// enum I2C_CR1_SMBTYPE (1 << 3)
// enum I2C_CR1_SMBUS (1 << 1)
// enum I2C_CR1_PE (1 << 0)
// enum I2C_CR2_LAST (1 << 12)
// enum I2C_CR2_DMAEN (1 << 11)
// enum I2C_CR2_ITBUFEN (1 << 10)
// enum I2C_CR2_ITEVTEN (1 << 9)
// enum I2C_CR2_ITERREN (1 << 8)
// enum I2C_CR2_FREQ_2MHZ 0x02
// enum I2C_CR2_FREQ_3MHZ 0x03
// enum I2C_CR2_FREQ_4MHZ 0x04
// enum I2C_CR2_FREQ_5MHZ 0x05
// enum I2C_CR2_FREQ_6MHZ 0x06
// enum I2C_CR2_FREQ_7MHZ 0x07
// enum I2C_CR2_FREQ_8MHZ 0x08
// enum I2C_CR2_FREQ_9MHZ 0x09
// enum I2C_CR2_FREQ_10MHZ 0x0a
// enum I2C_CR2_FREQ_11MHZ 0x0b
// enum I2C_CR2_FREQ_12MHZ 0x0c
// enum I2C_CR2_FREQ_13MHZ 0x0d
// enum I2C_CR2_FREQ_14MHZ 0x0e
// enum I2C_CR2_FREQ_15MHZ 0x0f
// enum I2C_CR2_FREQ_16MHZ 0x10
// enum I2C_CR2_FREQ_17MHZ 0x11
// enum I2C_CR2_FREQ_18MHZ 0x12
// enum I2C_CR2_FREQ_19MHZ 0x13
// enum I2C_CR2_FREQ_20MHZ 0x14
// enum I2C_CR2_FREQ_21MHZ 0x15
// enum I2C_CR2_FREQ_22MHZ 0x16
// enum I2C_CR2_FREQ_23MHZ 0x17
// enum I2C_CR2_FREQ_24MHZ 0x18
// enum I2C_CR2_FREQ_25MHZ 0x19
// enum I2C_CR2_FREQ_26MHZ 0x1a
// enum I2C_CR2_FREQ_27MHZ 0x1b
// enum I2C_CR2_FREQ_28MHZ 0x1c
// enum I2C_CR2_FREQ_29MHZ 0x1d
// enum I2C_CR2_FREQ_30MHZ 0x1e
// enum I2C_CR2_FREQ_31MHZ 0x1f
// enum I2C_CR2_FREQ_32MHZ 0x20
// enum I2C_CR2_FREQ_33MHZ 0x21
// enum I2C_CR2_FREQ_34MHZ 0x22
// enum I2C_CR2_FREQ_35MHZ 0x23
// enum I2C_CR2_FREQ_36MHZ 0x24
// enum I2C_CR2_FREQ_37MHZ 0x25
// enum I2C_CR2_FREQ_38MHZ 0x26
// enum I2C_CR2_FREQ_39MHZ 0x27
// enum I2C_CR2_FREQ_40MHZ 0x28
// enum I2C_CR2_FREQ_41MHZ 0x29
// enum I2C_CR2_FREQ_42MHZ 0x2a
// enum I2C_OAR1_ADDMODE (1 << 15)
// enum I2C_OAR1_ADDMODE_7BIT 0
// enum I2C_OAR1_ADDMODE_10BIT 1
// enum I2C_OAR2_ENDUAL (1 << 0)
// enum I2C_SR1_SMBALERT (1 << 15)
// enum I2C_SR1_TIMEOUT (1 << 14)
// enum I2C_SR1_PECERR (1 << 12)
// enum I2C_SR1_OVR (1 << 11)
// enum I2C_SR1_AF (1 << 10)
// enum I2C_SR1_ARLO (1 << 9)
// enum I2C_SR1_BERR (1 << 8)
// enum I2C_SR1_TxE (1 << 7)
// enum I2C_SR1_RxNE (1 << 6)
// enum I2C_SR1_STOPF (1 << 4)
// enum I2C_SR1_ADD10 (1 << 3)
// enum I2C_SR1_BTF (1 << 2)
// enum I2C_SR1_ADDR (1 << 1)
// enum I2C_SR1_SB (1 << 0)
// enum I2C_SR2_DUALF (1 << 7)
// enum I2C_SR2_SMBHOST (1 << 6)
// enum I2C_SR2_SMBDEFAULT (1 << 5)
// enum I2C_SR2_GENCALL (1 << 4)
// enum I2C_SR2_TRA (1 << 2)
// enum I2C_SR2_BUSY (1 << 1)
// enum I2C_SR2_MSL (1 << 0)
// enum I2C_CCR_FS (1 << 15)
// enum I2C_CCR_DUTY (1 << 14)
// enum I2C_CCR_DUTY_DIV2 0
// enum I2C_CCR_DUTY_16_DIV_9 1
// enum I2C_WRITE 0
// enum I2C_READ 1
// enum i2c_speeds {
//  i2c_speed_sm_100k,
//  i2c_speed_fm_400k,
//  i2c_speed_fmp_1m,
//  i2c_speed_unknown
// };
//
// void i2c_reset(uint i2c);
// void i2c_peripheral_enable(uint i2c);
// void i2c_peripheral_disable(uint i2c);
// void i2c_send_start(uint i2c);
// void i2c_send_stop(uint i2c);
// void i2c_clear_stop(uint i2c);
// void i2c_set_own_7bit_slave_address(uint i2c, ubyte slave);
// void i2c_set_own_10bit_slave_address(uint i2c, ushort slave);
// void i2c_set_own_7bit_slave_address_two(uint i2c, ubyte slave);
// void i2c_enable_dual_addressing_mode(uint i2c);
// void i2c_disable_dual_addressing_mode(uint i2c);
// void i2c_set_clock_frequency(uint i2c, ubyte freq);
// void i2c_send_data(uint i2c, ubyte data);
// void i2c_set_fast_mode(uint i2c);
// void i2c_set_standard_mode(uint i2c);
// void i2c_set_ccr(uint i2c, ushort freq);
// void i2c_set_trise(uint i2c, ushort trise);
// void i2c_send_7bit_address(uint i2c, ubyte slave, ubyte readwrite);
// ubyte i2c_get_data(uint i2c);
// void i2c_enable_interrupt(uint i2c, uint interrupt);
// void i2c_disable_interrupt(uint i2c, uint interrupt);
// void i2c_enable_ack(uint i2c);
// void i2c_disable_ack(uint i2c);
// void i2c_nack_next(uint i2c);
// void i2c_nack_current(uint i2c);
// void i2c_set_dutycycle(uint i2c, uint dutycycle);
// void i2c_enable_dma(uint i2c);
// void i2c_disable_dma(uint i2c);
// void i2c_set_dma_last_transfer(uint i2c);
// void i2c_clear_dma_last_transfer(uint i2c);
// void i2c_transfer7(uint i2c, ubyte addr, ubyte *w, size_t wn, ubyte *r, size_t rn);
// void i2c_set_speed(uint i2c, enum i2c_speeds speed, uint clock_megahz);
//
// enum LIBOPENCM3_IWDG_H
// enum LIBOPENCM3_IWDG_COMMON_ALL_H
// enum IWDG_KR () { return MMIO!uint(IWDG_BASE + 0x00)
// enum IWDG_PR () { return MMIO!uint(IWDG_BASE + 0x04)
// enum IWDG_RLR () { return MMIO!uint(IWDG_BASE + 0x08)
// enum IWDG_SR () { return MMIO!uint(IWDG_BASE + 0x0c)
// enum IWDG_KR_RESET 0xaaaa
// enum IWDG_KR_UNLOCK 0x5555
// enum IWDG_KR_START 0xcccc
// enum IWDG_PR_LSB 0
// enum IWDG_PR_DIV4 0x0
// enum IWDG_PR_DIV8 0x1
// enum IWDG_PR_DIV16 0x2
// enum IWDG_PR_DIV32 0x3
// enum IWDG_PR_DIV64 0x4
// enum IWDG_PR_DIV128 0x5
// enum IWDG_PR_DIV256 0x6
// enum IWDG_SR_RVU (1 << 1)
// enum IWDG_SR_PVU (1 << 0)
//
// void iwdg_start();
// void iwdg_set_period_ms(uint period);
// bool iwdg_reload_busy();
// bool iwdg_prescaler_busy();
// void iwdg_reset();
//
// enum LIBOPENCM3_PWR_H
// enum LIBOPENCM3_PWR_COMMON_V1_H
// enum PWR_CR () { return MMIO!uint(POWER_CONTROL_BASE + 0x00)
// enum PWR_CSR () { return MMIO!uint(POWER_CONTROL_BASE + 0x04)
// enum PWR_CR_DBP (1 << 8)
// enum PWR_CR_PLS_LSB 5
// enum PWR_CR_PLS_2V2 (0x0 << PWR_CR_PLS_LSB)
// enum PWR_CR_PLS_2V3 (0x1 << PWR_CR_PLS_LSB)
// enum PWR_CR_PLS_2V4 (0x2 << PWR_CR_PLS_LSB)
// enum PWR_CR_PLS_2V5 (0x3 << PWR_CR_PLS_LSB)
// enum PWR_CR_PLS_2V6 (0x4 << PWR_CR_PLS_LSB)
// enum PWR_CR_PLS_2V7 (0x5 << PWR_CR_PLS_LSB)
// enum PWR_CR_PLS_2V8 (0x6 << PWR_CR_PLS_LSB)
// enum PWR_CR_PLS_2V9 (0x7 << PWR_CR_PLS_LSB)
// enum PWR_CR_PLS_MASK (0x7 << PWR_CR_PLS_LSB)
// enum PWR_CR_PVDE (1 << 4)
// enum PWR_CR_CSBF (1 << 3)
// enum PWR_CR_CWUF (1 << 2)
// enum PWR_CR_PDDS (1 << 1)
// enum PWR_CR_LPDS (1 << 0)
// enum PWR_CSR_EWUP (1 << 8)
// enum PWR_CSR_PVDO (1 << 2)
// enum PWR_CSR_SBF (1 << 1)
// enum PWR_CSR_WUF (1 << 0)
//
// void pwr_disable_backup_domain_write_protect();
// void pwr_enable_backup_domain_write_protect();
// void pwr_enable_power_voltage_detect(uint pvd_level);
// void pwr_disable_power_voltage_detect();
// void pwr_clear_standby_flag();
// void pwr_clear_wakeup_flag();
// void pwr_set_standby_mode();
// void pwr_set_stop_mode();
// void pwr_voltage_regulator_on_in_stop();
// void pwr_voltage_regulator_low_power_in_stop();
// void pwr_enable_wakeup_pin();
// void pwr_disable_wakeup_pin();
// bool pwr_voltage_high();
// bool pwr_get_standby_flag();
// bool pwr_get_wakeup_flag();
//
// enum LIBOPENCM3_RCC_H
// enum RCC_CR () { return MMIO!uint(RCC_BASE + 0x00)
// enum RCC_CFGR () { return MMIO!uint(RCC_BASE + 0x04)
// enum RCC_CIR () { return MMIO!uint(RCC_BASE + 0x08)
// enum RCC_APB2RSTR () { return MMIO!uint(RCC_BASE + 0x0c)
// enum RCC_APB1RSTR () { return MMIO!uint(RCC_BASE + 0x10)
// enum RCC_AHBENR () { return MMIO!uint(RCC_BASE + 0x14)
// enum RCC_APB2ENR () { return MMIO!uint(RCC_BASE + 0x18)
// enum RCC_APB1ENR () { return MMIO!uint(RCC_BASE + 0x1c)
// enum RCC_BDCR () { return MMIO!uint(RCC_BASE + 0x20)
// enum RCC_CSR () { return MMIO!uint(RCC_BASE + 0x24)
// enum RCC_AHBRSTR () { return MMIO!uint(RCC_BASE + 0x28)
// enum RCC_CFGR2 () { return MMIO!uint(RCC_BASE + 0x2c)
// enum RCC_CR_PLL3RDY (1 << 29)
// enum RCC_CR_PLL3ON (1 << 28)
// enum RCC_CR_PLL2RDY (1 << 27)
// enum RCC_CR_PLL2ON (1 << 26)
// enum RCC_CR_PLLRDY (1 << 25)
// enum RCC_CR_PLLON (1 << 24)
// enum RCC_CR_CSSON (1 << 19)
// enum RCC_CR_HSEBYP (1 << 18)
// enum RCC_CR_HSERDY (1 << 17)
// enum RCC_CR_HSEON (1 << 16)
// enum RCC_CR_HSIRDY (1 << 1)
// enum RCC_CR_HSION (1 << 0)
// enum RCC_CFGR_OTGFSPRE (1 << 22)
// enum RCC_CFGR_USBPRE (1 << 22)
// enum RCC_CFGR_PLLMUL_SHIFT 18
// enum RCC_CFGR_PLLMUL (0xF << RCC_CFGR_PLLMUL_SHIFT)
// enum RCC_CFGR_PLLXTPRE (1 << 17)
// enum RCC_CFGR_PLLSRC (1 << 16)
// enum RCC_CFGR_ADCPRE_SHIFT 14
// enum RCC_CFGR_ADCPRE (3 << RCC_CFGR_ADCPRE_SHIFT)
// enum RCC_CFGR_PPRE2_SHIFT 11
// enum RCC_CFGR_PPRE2 (7 << RCC_CFGR_PPRE2_SHIFT)
// enum RCC_CFGR_PPRE1_SHIFT 8
// enum RCC_CFGR_PPRE1 (7 << RCC_CFGR_PPRE1_SHIFT)
// enum RCC_CFGR_HPRE_SHIFT 4
// enum RCC_CFGR_HPRE (0xF << RCC_CFGR_HPRE_SHIFT)
// enum RCC_CFGR_SWS_SHIFT 2
// enum RCC_CFGR_SWS (3 << RCC_CFGR_SWS_SHIFT)
// enum RCC_CFGR_SW_SHIFT 0
// enum RCC_CFGR_SW (3 << RCC_CFGR_SW_SHIFT)
// enum RCC_CFGR_MCO_SHIFT 24
// enum RCC_CFGR_MCO_MASK 0xf
// enum RCC_CFGR_MCO_NOCLK 0x0
// enum RCC_CFGR_MCO_SYSCLK 0x4
// enum RCC_CFGR_MCO_HSI 0x5
// enum RCC_CFGR_MCO_HSE 0x6
// enum RCC_CFGR_MCO_PLL_DIV2 0x7
// enum RCC_CFGR_MCO_PLL2 0x8
// enum RCC_CFGR_MCO_PLL3_DIV2 0x9
// enum RCC_CFGR_MCO_XT1 0xa
// enum RCC_CFGR_MCO_PLL3 0xb
// enum RCC_CFGR_USBPRE_PLL_CLK_DIV1_5 0x0
// enum RCC_CFGR_USBPRE_PLL_CLK_NODIV 0x1
// enum RCC_CFGR_USBPRE_PLL_VCO_CLK_DIV3 0x0
// enum RCC_CFGR_USBPRE_PLL_VCO_CLK_DIV2 0x1
// enum RCC_CFGR_PLLMUL_PLL_CLK_MUL2 0x0
// enum RCC_CFGR_PLLMUL_PLL_CLK_MUL3 0x1
// enum RCC_CFGR_PLLMUL_PLL_CLK_MUL4 0x2
// enum RCC_CFGR_PLLMUL_PLL_CLK_MUL5 0x3
// enum RCC_CFGR_PLLMUL_PLL_CLK_MUL6 0x4
// enum RCC_CFGR_PLLMUL_PLL_CLK_MUL7 0x5
// enum RCC_CFGR_PLLMUL_PLL_CLK_MUL8 0x6
// enum RCC_CFGR_PLLMUL_PLL_CLK_MUL9 0x7
// enum RCC_CFGR_PLLMUL_PLL_CLK_MUL10 0x8
// enum RCC_CFGR_PLLMUL_PLL_CLK_MUL11 0x9
// enum RCC_CFGR_PLLMUL_PLL_CLK_MUL12 0xa
// enum RCC_CFGR_PLLMUL_PLL_CLK_MUL13 0xb
// enum RCC_CFGR_PLLMUL_PLL_CLK_MUL14 0xc
// enum RCC_CFGR_PLLMUL_PLL_CLK_MUL15 0xd
// enum RCC_CFGR_PLLMUL_PLL_CLK_MUL6_5 0xd
// enum RCC_CFGR_PLLMUL_PLL_CLK_MUL16 0xe
// enum RCC_CFGR_PLLXTPRE_HSE_CLK 0x0
// enum RCC_CFGR_PLLXTPRE_HSE_CLK_DIV2 0x1
// enum RCC_CFGR_PLLSRC_HSI_CLK_DIV2 0x0
// enum RCC_CFGR_PLLSRC_HSE_CLK 0x1
// enum RCC_CFGR_PLLSRC_PREDIV1_CLK 0x1
// enum RCC_CFGR_ADCPRE_PCLK2_DIV2 0x0
// enum RCC_CFGR_ADCPRE_PCLK2_DIV4 0x1
// enum RCC_CFGR_ADCPRE_PCLK2_DIV6 0x2
// enum RCC_CFGR_ADCPRE_PCLK2_DIV8 0x3
// enum RCC_CFGR_PPRE2_HCLK_NODIV 0x0
// enum RCC_CFGR_PPRE2_HCLK_DIV2 0x4
// enum RCC_CFGR_PPRE2_HCLK_DIV4 0x5
// enum RCC_CFGR_PPRE2_HCLK_DIV8 0x6
// enum RCC_CFGR_PPRE2_HCLK_DIV16 0x7
// enum RCC_CFGR_PPRE1_HCLK_NODIV 0x0
// enum RCC_CFGR_PPRE1_HCLK_DIV2 0x4
// enum RCC_CFGR_PPRE1_HCLK_DIV4 0x5
// enum RCC_CFGR_PPRE1_HCLK_DIV8 0x6
// enum RCC_CFGR_PPRE1_HCLK_DIV16 0x7
// enum RCC_CFGR_HPRE_SYSCLK_NODIV 0x0
// enum RCC_CFGR_HPRE_SYSCLK_DIV2 0x8
// enum RCC_CFGR_HPRE_SYSCLK_DIV4 0x9
// enum RCC_CFGR_HPRE_SYSCLK_DIV8 0xa
// enum RCC_CFGR_HPRE_SYSCLK_DIV16 0xb
// enum RCC_CFGR_HPRE_SYSCLK_DIV64 0xc
// enum RCC_CFGR_HPRE_SYSCLK_DIV128 0xd
// enum RCC_CFGR_HPRE_SYSCLK_DIV256 0xe
// enum RCC_CFGR_HPRE_SYSCLK_DIV512 0xf
// enum RCC_CFGR_SWS_SYSCLKSEL_HSICLK 0x0
// enum RCC_CFGR_SWS_SYSCLKSEL_HSECLK 0x1
// enum RCC_CFGR_SWS_SYSCLKSEL_PLLCLK 0x2
// enum RCC_CFGR_SW_SYSCLKSEL_HSICLK 0x0
// enum RCC_CFGR_SW_SYSCLKSEL_HSECLK 0x1
// enum RCC_CFGR_SW_SYSCLKSEL_PLLCLK 0x2
// enum RCC_CIR_CSSC (1 << 23)
// enum RCC_CIR_PLL3RDYC (1 << 22)
// enum RCC_CIR_PLL2RDYC (1 << 21)
// enum RCC_CIR_PLLRDYC (1 << 20)
// enum RCC_CIR_HSERDYC (1 << 19)
// enum RCC_CIR_HSIRDYC (1 << 18)
// enum RCC_CIR_LSERDYC (1 << 17)
// enum RCC_CIR_LSIRDYC (1 << 16)
// enum RCC_CIR_PLL3RDYIE (1 << 14)
// enum RCC_CIR_PLL2RDYIE (1 << 13)
// enum RCC_CIR_PLLRDYIE (1 << 12)
// enum RCC_CIR_HSERDYIE (1 << 11)
// enum RCC_CIR_HSIRDYIE (1 << 10)
// enum RCC_CIR_LSERDYIE (1 << 9)
// enum RCC_CIR_LSIRDYIE (1 << 8)
// enum RCC_CIR_CSSF (1 << 7)
// enum RCC_CIR_PLL3RDYF (1 << 6)
// enum RCC_CIR_PLL2RDYF (1 << 5)
// enum RCC_CIR_PLLRDYF (1 << 4)
// enum RCC_CIR_HSERDYF (1 << 3)
// enum RCC_CIR_HSIRDYF (1 << 2)
// enum RCC_CIR_LSERDYF (1 << 1)
// enum RCC_CIR_LSIRDYF (1 << 0)
// enum RCC_APB2RSTR_TIM17RST (1 << 18)
// enum RCC_APB2RSTR_TIM16RST (1 << 17)
// enum RCC_APB2RSTR_TIM15RST (1 << 16)
// enum RCC_APB2RSTR_ADC3RST (1 << 15)
// enum RCC_APB2RSTR_USART1RST (1 << 14)
// enum RCC_APB2RSTR_TIM8RST (1 << 13)
// enum RCC_APB2RSTR_SPI1RST (1 << 12)
// enum RCC_APB2RSTR_TIM1RST (1 << 11)
// enum RCC_APB2RSTR_ADC2RST (1 << 10)
// enum RCC_APB2RSTR_ADC1RST (1 << 9)
// enum RCC_APB2RSTR_IOPGRST (1 << 8)
// enum RCC_APB2RSTR_IOPFRST (1 << 7)
// enum RCC_APB2RSTR_IOPERST (1 << 6)
// enum RCC_APB2RSTR_IOPDRST (1 << 5)
// enum RCC_APB2RSTR_IOPCRST (1 << 4)
// enum RCC_APB2RSTR_IOPBRST (1 << 3)
// enum RCC_APB2RSTR_IOPARST (1 << 2)
// enum RCC_APB2RSTR_AFIORST (1 << 0)
// enum RCC_APB1RSTR_DACRST (1 << 29)
// enum RCC_APB1RSTR_PWRRST (1 << 28)
// enum RCC_APB1RSTR_BKPRST (1 << 27)
// enum RCC_APB1RSTR_CAN2RST (1 << 26)
// enum RCC_APB1RSTR_CAN1RST (1 << 25)
// enum RCC_APB1RSTR_CANRST (1 << 25)
// enum RCC_APB1RSTR_USBRST (1 << 23)
// enum RCC_APB1RSTR_I2C2RST (1 << 22)
// enum RCC_APB1RSTR_I2C1RST (1 << 21)
// enum RCC_APB1RSTR_UART5RST (1 << 20)
// enum RCC_APB1RSTR_UART4RST (1 << 19)
// enum RCC_APB1RSTR_USART3RST (1 << 18)
// enum RCC_APB1RSTR_USART2RST (1 << 17)
// enum RCC_APB1RSTR_SPI3RST (1 << 15)
// enum RCC_APB1RSTR_SPI2RST (1 << 14)
// enum RCC_APB1RSTR_WWDGRST (1 << 11)
// enum RCC_APB1RSTR_TIM7RST (1 << 5)
// enum RCC_APB1RSTR_TIM6RST (1 << 4)
// enum RCC_APB1RSTR_TIM5RST (1 << 3)
// enum RCC_APB1RSTR_TIM4RST (1 << 2)
// enum RCC_APB1RSTR_TIM3RST (1 << 1)
// enum RCC_APB1RSTR_TIM2RST (1 << 0)
// enum RCC_AHBENR_ETHMACENRX (1 << 16)
// enum RCC_AHBENR_ETHMACENTX (1 << 15)
// enum RCC_AHBENR_ETHMACEN (1 << 14)
// enum RCC_AHBENR_OTGFSEN (1 << 12)
// enum RCC_AHBENR_SDIOEN (1 << 10)
// enum RCC_AHBENR_FSMCEN (1 << 8)
// enum RCC_AHBENR_CRCEN (1 << 6)
// enum RCC_AHBENR_FLITFEN (1 << 4)
// enum RCC_AHBENR_SRAMEN (1 << 2)
// enum RCC_AHBENR_DMA2EN (1 << 1)
// enum RCC_AHBENR_DMA1EN (1 << 0)
// enum RCC_APB2ENR_TIM17EN (1 << 18)
// enum RCC_APB2ENR_TIM16EN (1 << 17)
// enum RCC_APB2ENR_TIM15EN (1 << 16)
// enum RCC_APB2ENR_ADC3EN (1 << 15)
// enum RCC_APB2ENR_USART1EN (1 << 14)
// enum RCC_APB2ENR_TIM8EN (1 << 13)
// enum RCC_APB2ENR_SPI1EN (1 << 12)
// enum RCC_APB2ENR_TIM1EN (1 << 11)
// enum RCC_APB2ENR_ADC2EN (1 << 10)
// enum RCC_APB2ENR_ADC1EN (1 << 9)
// enum RCC_APB2ENR_IOPGEN (1 << 8)
// enum RCC_APB2ENR_IOPFEN (1 << 7)
// enum RCC_APB2ENR_IOPEEN (1 << 6)
// enum RCC_APB2ENR_IOPDEN (1 << 5)
// enum RCC_APB2ENR_IOPCEN (1 << 4)
// enum RCC_APB2ENR_IOPBEN (1 << 3)
// enum RCC_APB2ENR_IOPAEN (1 << 2)
// enum RCC_APB2ENR_AFIOEN (1 << 0)
// enum RCC_APB1ENR_DACEN (1 << 29)
// enum RCC_APB1ENR_PWREN (1 << 28)
// enum RCC_APB1ENR_BKPEN (1 << 27)
// enum RCC_APB1ENR_CAN2EN (1 << 26)
// enum RCC_APB1ENR_CAN1EN (1 << 25)
// enum RCC_APB1ENR_CANEN (1 << 25)
// enum RCC_APB1ENR_USBEN (1 << 23)
// enum RCC_APB1ENR_I2C2EN (1 << 22)
// enum RCC_APB1ENR_I2C1EN (1 << 21)
// enum RCC_APB1ENR_UART5EN (1 << 20)
// enum RCC_APB1ENR_UART4EN (1 << 19)
// enum RCC_APB1ENR_USART3EN (1 << 18)
// enum RCC_APB1ENR_USART2EN (1 << 17)
// enum RCC_APB1ENR_SPI3EN (1 << 15)
// enum RCC_APB1ENR_SPI2EN (1 << 14)
// enum RCC_APB1ENR_WWDGEN (1 << 11)
// enum RCC_APB1ENR_TIM7EN (1 << 5)
// enum RCC_APB1ENR_TIM6EN (1 << 4)
// enum RCC_APB1ENR_TIM5EN (1 << 3)
// enum RCC_APB1ENR_TIM4EN (1 << 2)
// enum RCC_APB1ENR_TIM3EN (1 << 1)
// enum RCC_APB1ENR_TIM2EN (1 << 0)
// enum RCC_BDCR_BDRST (1 << 16)
// enum RCC_BDCR_RTCEN (1 << 15)
// enum RCC_BDCR_LSEBYP (1 << 2)
// enum RCC_BDCR_LSERDY (1 << 1)
// enum RCC_BDCR_LSEON (1 << 0)
// enum RCC_CSR_LPWRRSTF (1 << 31)
// enum RCC_CSR_WWDGRSTF (1 << 30)
// enum RCC_CSR_IWDGRSTF (1 << 29)
// enum RCC_CSR_SFTRSTF (1 << 28)
// enum RCC_CSR_PORRSTF (1 << 27)
// enum RCC_CSR_PINRSTF (1 << 26)
// enum RCC_CSR_RMVF (1 << 24)
// enum RCC_CSR_RESET_FLAGS (RCC_CSR_LPWRRSTF | RCC_CSR_WWDGRSTF | RCC_CSR_IWDGRSTF | RCC_CSR_SFTRSTF | RCC_CSR_PORRSTF | RCC_CSR_PINRSTF)
// enum RCC_CSR_LSIRDY (1 << 1)
// enum RCC_CSR_LSION (1 << 0)
// enum RCC_AHBRSTR_ETHMACRST (1 << 14)
// enum RCC_AHBRSTR_OTGFSRST (1 << 12)
// enum RCC_CFGR2_I2S3SRC_SYSCLK 0x0
// enum RCC_CFGR2_I2S3SRC_PLL3_VCO_CLK 0x1
// enum RCC_CFGR2_I2S2SRC_SYSCLK 0x0
// enum RCC_CFGR2_I2S2SRC_PLL3_VCO_CLK 0x1
// enum RCC_CFGR2_I2S2SRC (1 << 17)
// enum RCC_CFGR2_PREDIV1SRC_HSE_CLK 0x0
// enum RCC_CFGR2_PREDIV1SRC_PLL2_CLK 0x1
// enum RCC_CFGR2_PREDIV1SRC (1 << 16)
// enum RCC_CFGR2_PLL3MUL_SHIFT 12
// enum RCC_CFGR2_PLL3MUL (0xF << RCC_CFGR2_PLL3MUL_SHIFT)
// enum RCC_CFGR2_PLL2MUL_SHIFT 8
// enum RCC_CFGR2_PLL2MUL (0xF << RCC_CFGR2_PLL2MUL_SHIFT)
// enum RCC_CFGR2_PREDIV2_SHIFT 4
// enum RCC_CFGR2_PREDIV2 (0xF << RCC_CFGR2_PREDIV2_SHIFT)
// enum RCC_CFGR2_PREDIV1_SHIFT 0
// enum RCC_CFGR2_PREDIV1 (0xF << RCC_CFGR2_PREDIV1_SHIFT)
// enum RCC_CFGR2_PLL3MUL_PLL3_CLK_MUL8 0x6
// enum RCC_CFGR2_PLL3MUL_PLL3_CLK_MUL9 0x7
// enum RCC_CFGR2_PLL3MUL_PLL3_CLK_MUL10 0x8
// enum RCC_CFGR2_PLL3MUL_PLL3_CLK_MUL11 0x9
// enum RCC_CFGR2_PLL3MUL_PLL3_CLK_MUL12 0xa
// enum RCC_CFGR2_PLL3MUL_PLL3_CLK_MUL13 0xb
// enum RCC_CFGR2_PLL3MUL_PLL3_CLK_MUL14 0xc
// enum RCC_CFGR2_PLL3MUL_PLL3_CLK_MUL16 0xe
// enum RCC_CFGR2_PLL3MUL_PLL3_CLK_MUL20 0xf
// enum RCC_CFGR2_PLL2MUL_PLL2_CLK_MUL8 0x6
// enum RCC_CFGR2_PLL2MUL_PLL2_CLK_MUL9 0x7
// enum RCC_CFGR2_PLL2MUL_PLL2_CLK_MUL10 0x8
// enum RCC_CFGR2_PLL2MUL_PLL2_CLK_MUL11 0x9
// enum RCC_CFGR2_PLL2MUL_PLL2_CLK_MUL12 0xa
// enum RCC_CFGR2_PLL2MUL_PLL2_CLK_MUL13 0xb
// enum RCC_CFGR2_PLL2MUL_PLL2_CLK_MUL14 0xc
// enum RCC_CFGR2_PLL2MUL_PLL2_CLK_MUL16 0xe
// enum RCC_CFGR2_PLL2MUL_PLL2_CLK_MUL20 0xf
// enum RCC_CFGR2_PREDIV_NODIV 0x0
// enum RCC_CFGR2_PREDIV_DIV2 0x1
// enum RCC_CFGR2_PREDIV_DIV3 0x2
// enum RCC_CFGR2_PREDIV_DIV4 0x3
// enum RCC_CFGR2_PREDIV_DIV5 0x4
// enum RCC_CFGR2_PREDIV_DIV6 0x5
// enum RCC_CFGR2_PREDIV_DIV7 0x6
// enum RCC_CFGR2_PREDIV_DIV8 0x7
// enum RCC_CFGR2_PREDIV_DIV9 0x8
// enum RCC_CFGR2_PREDIV_DIV10 0x9
// enum RCC_CFGR2_PREDIV_DIV11 0xa
// enum RCC_CFGR2_PREDIV_DIV12 0xb
// enum RCC_CFGR2_PREDIV_DIV13 0xc
// enum RCC_CFGR2_PREDIV_DIV14 0xd
// enum RCC_CFGR2_PREDIV_DIV15 0xe
// enum RCC_CFGR2_PREDIV_DIV16 0xf
// enum RCC_CFGR2_PREDIV2_NODIV 0x0
// enum RCC_CFGR2_PREDIV2_DIV2 0x1
// enum RCC_CFGR2_PREDIV2_DIV3 0x2
// enum RCC_CFGR2_PREDIV2_DIV4 0x3
// enum RCC_CFGR2_PREDIV2_DIV5 0x4
// enum RCC_CFGR2_PREDIV2_DIV6 0x5
// enum RCC_CFGR2_PREDIV2_DIV7 0x6
// enum RCC_CFGR2_PREDIV2_DIV8 0x7
// enum RCC_CFGR2_PREDIV2_DIV9 0x8
// enum RCC_CFGR2_PREDIV2_DIV10 0x9
// enum RCC_CFGR2_PREDIV2_DIV11 0xa
// enum RCC_CFGR2_PREDIV2_DIV12 0xb
// enum RCC_CFGR2_PREDIV2_DIV13 0xc
// enum RCC_CFGR2_PREDIV2_DIV14 0xd
// enum RCC_CFGR2_PREDIV2_DIV15 0xe
// enum RCC_CFGR2_PREDIV2_DIV16 0xf

extern uint rcc_ahb_frequency;
extern uint rcc_apb1_frequency;
extern uint rcc_apb2_frequency;

enum rcc_osc {RCC_PLL, RCC_PLL2, RCC_PLL3, RCC_HSE,
              RCC_HSI, RCC_LSE, RCC_LSI};

uint _REG_BIT(uint base, uint bit) {
  return ((base << 5) + bit);
}

enum rcc_periph_clken {
 RCC_DMA1 = (((0x14) << 5) + (0)),
 RCC_DMA2 = (((0x14) << 5) + (1)),
 RCC_SRAM = (((0x14) << 5) + (2)),
 RCC_FLTF = (((0x14) << 5) + (4)),
 RCC_CRC = (((0x14) << 5) + (6)),
 RCC_FSMC = (((0x14) << 5) + (8)),
 RCC_SDIO = (((0x14) << 5) + (10)),
 RCC_OTGFS = (((0x14) << 5) + (12)),
 RCC_ETHMAC = (((0x14) << 5) + (14)),
 RCC_ETHMACTX = (((0x14) << 5) + (15)),
 RCC_ETHMACRX = (((0x14) << 5) + (16)),
 RCC_AFIO = (((0x18) << 5) + (0)),
 RCC_GPIOA = (((0x18) << 5) + (2)),
 RCC_GPIOB = (((0x18) << 5) + (3)),
 RCC_GPIOC = (((0x18) << 5) + (4)),
 RCC_GPIOD = (((0x18) << 5) + (5)),
 RCC_GPIOE = (((0x18) << 5) + (6)),
 RCC_GPIOF = (((0x18) << 5) + (7)),
 RCC_GPIOG = (((0x18) << 5) + (8)),
 RCC_ADC1 = (((0x18) << 5) + (9)),
 RCC_ADC2 = (((0x18) << 5) + (10)),
 RCC_TIM1 = (((0x18) << 5) + (11)),
 RCC_SPI1 = (((0x18) << 5) + (12)),
 RCC_TIM8 = (((0x18) << 5) + (13)),
 RCC_USART1 = (((0x18) << 5) + (14)),
 RCC_ADC3 = (((0x18) << 5) + (15)),
 RCC_TIM15 = (((0x18) << 5) + (16)),
 RCC_TIM16 = (((0x18) << 5) + (17)),
 RCC_TIM17 = (((0x18) << 5) + (18)),
 RCC_TIM9 = (((0x18) << 5) + (19)),
 RCC_TIM10 = (((0x18) << 5) + (20)),
 RCC_TIM11 = (((0x18) << 5) + (21)),
 RCC_TIM2 = (((0x1C) << 5) + (0)),
 RCC_TIM3 = (((0x1C) << 5) + (1)),
 RCC_TIM4 = (((0x1C) << 5) + (2)),
 RCC_TIM5 = (((0x1C) << 5) + (3)),
 RCC_TIM6 = (((0x1C) << 5) + (4)),
 RCC_TIM7 = (((0x1C) << 5) + (5)),
 RCC_TIM12 = (((0x1C) << 5) + (6)),
 RCC_TIM13 = (((0x1C) << 5) + (7)),
 RCC_TIM14 = (((0x1C) << 5) + (8)),
 RCC_WWDG = (((0x1C) << 5) + (11)),
 RCC_SPI2 = (((0x1C) << 5) + (14)),
 RCC_SPI3 = (((0x1C) << 5) + (15)),
 RCC_USART2 = (((0x1C) << 5) + (17)),
 RCC_USART3 = (((0x1C) << 5) + (18)),
 RCC_UART4 = (((0x1C) << 5) + (19)),
 RCC_UART5 = (((0x1C) << 5) + (20)),
 RCC_I2C1 = (((0x1C) << 5) + (21)),
 RCC_I2C2 = (((0x1C) << 5) + (22)),
 RCC_USB = (((0x1C) << 5) + (23)),
 RCC_CAN = (((0x1C) << 5) + (25)),
 RCC_CAN1 = (((0x1C) << 5) + (25)),
 RCC_CAN2 = (((0x1C) << 5) + (26)),
 RCC_BKP = (((0x1C) << 5) + (27)),
 RCC_PWR = (((0x1C) << 5) + (28)),
 RCC_DAC = (((0x1C) << 5) + (29)),
 RCC_CEC = (((0x1C) << 5) + (30)),
};
enum rcc_periph_rst {
 RST_OTGFS = (((0x28) << 5) + (12)),
 RST_ETHMAC = (((0x28) << 5) + (14)),
 RST_AFIO = (((0x0c) << 5) + (0)),
 RST_GPIOA = (((0x0c) << 5) + (2)),
 RST_GPIOB = (((0x0c) << 5) + (3)),
 RST_GPIOC = (((0x0c) << 5) + (4)),
 RST_GPIOD = (((0x0c) << 5) + (5)),
 RST_GPIOE = (((0x0c) << 5) + (6)),
 RST_GPIOF = (((0x0c) << 5) + (7)),
 RST_GPIOG = (((0x0c) << 5) + (8)),
 RST_ADC1 = (((0x0c) << 5) + (9)),
 RST_ADC2 = (((0x0c) << 5) + (10)),
 RST_TIM1 = (((0x0c) << 5) + (11)),
 RST_SPI1 = (((0x0c) << 5) + (12)),
 RST_TIM8 = (((0x0c) << 5) + (13)),
 RST_USART1 = (((0x0c) << 5) + (14)),
 RST_ADC3 = (((0x0c) << 5) + (15)),
 RST_TIM15 = (((0x0c) << 5) + (16)),
 RST_TIM16 = (((0x0c) << 5) + (17)),
 RST_TIM17 = (((0x0c) << 5) + (18)),
 RST_TIM9 = (((0x0c) << 5) + (19)),
 RST_TIM10 = (((0x0c) << 5) + (20)),
 RST_TIM11 = (((0x0c) << 5) + (21)),
 RST_TIM2 = (((0x10) << 5) + (0)),
 RST_TIM3 = (((0x10) << 5) + (1)),
 RST_TIM4 = (((0x10) << 5) + (2)),
 RST_TIM5 = (((0x10) << 5) + (3)),
 RST_TIM6 = (((0x10) << 5) + (4)),
 RST_TIM7 = (((0x10) << 5) + (5)),
 RST_TIM12 = (((0x10) << 5) + (6)),
 RST_TIM13 = (((0x10) << 5) + (7)),
 RST_TIM14 = (((0x10) << 5) + (8)),
 RST_WWDG = (((0x10) << 5) + (11)),
 RST_SPI2 = (((0x10) << 5) + (14)),
 RST_SPI3 = (((0x10) << 5) + (15)),
 RST_USART2 = (((0x10) << 5) + (17)),
 RST_USART3 = (((0x10) << 5) + (18)),
 RST_UART4 = (((0x10) << 5) + (19)),
 RST_UART5 = (((0x10) << 5) + (20)),
 RST_I2C1 = (((0x10) << 5) + (21)),
 RST_I2C2 = (((0x10) << 5) + (22)),
 RST_USB = (((0x10) << 5) + (23)),
 RST_CAN = (((0x10) << 5) + (24)),
 RST_CAN1 = (((0x10) << 5) + (24)),
 RST_CAN2 = (((0x10) << 5) + (25)),
 RST_BKP = (((0x10) << 5) + (27)),
 RST_PWR = (((0x10) << 5) + (28)),
 RST_DAC = (((0x10) << 5) + (29)),
 RST_CEC = (((0x10) << 5) + (30)),
};

extern(C) extern void rcc_peripheral_enable_clock(uint *reg, uint en);
extern(C) extern void rcc_peripheral_disable_clock(uint *reg, uint en);
extern(C) extern void rcc_peripheral_reset(uint *reg, uint reset);
extern(C) extern void rcc_peripheral_clear_reset(uint *reg, uint clear_reset);
extern(C) extern void rcc_periph_clock_enable(rcc_periph_clken clken);
extern(C) extern void rcc_periph_clock_disable(rcc_periph_clken clken);
extern(C) extern void rcc_periph_reset_pulse(rcc_periph_rst rst);
extern(C) extern void rcc_periph_reset_hold(rcc_periph_rst rst);
extern(C) extern void rcc_periph_reset_release(rcc_periph_rst rst);
extern(C) extern void rcc_set_mco(uint mcosrc);
extern(C) extern void rcc_osc_bypass_enable(rcc_osc osc);
extern(C) extern void rcc_osc_bypass_disable(rcc_osc osc);
extern(C) extern bool rcc_is_osc_ready(rcc_osc osc);
extern(C) extern void rcc_wait_for_osc_ready(rcc_osc osc);

extern(C) extern void rcc_osc_ready_int_clear(rcc_osc osc);
extern(C) extern void rcc_osc_ready_int_enable(rcc_osc osc);
extern(C) extern void rcc_osc_ready_int_disable(rcc_osc osc);
extern(C) extern int rcc_osc_ready_int_flag(rcc_osc osc);
extern(C) extern void rcc_css_int_clear();
extern(C) extern int rcc_css_int_flag();
extern(C) extern void rcc_osc_on(rcc_osc osc);
extern(C) extern void rcc_osc_off(rcc_osc osc);
extern(C) extern void rcc_css_enable();
extern(C) extern void rcc_css_disable();
extern(C) extern void rcc_set_sysclk_source(uint clk);
extern(C) extern void rcc_set_pll_multiplication_factor(uint mul);
extern(C) extern void rcc_set_pll2_multiplication_factor(uint mul);
extern(C) extern void rcc_set_pll3_multiplication_factor(uint mul);
extern(C) extern void rcc_set_pll_source(uint pllsrc);
extern(C) extern void rcc_set_pllxtpre(uint pllxtpre);
extern(C) extern uint rcc_rtc_clock_enabled_flag();
extern(C) extern void rcc_enable_rtc_clock();
extern(C) extern void rcc_set_rtc_clock_source(rcc_osc clock_source);
extern(C) extern void rcc_set_adcpre(uint adcpre);
extern(C) extern void rcc_set_ppre2(uint ppre2);
extern(C) extern void rcc_set_ppre1(uint ppre1);
extern(C) extern void rcc_set_hpre(uint hpre);
extern(C) extern void rcc_set_usbpre(uint usbpre);
extern(C) extern void rcc_set_prediv1(uint prediv);
extern(C) extern void rcc_set_prediv2(uint prediv);
extern(C) extern void rcc_set_prediv1_source(uint rccsrc);
extern(C) extern uint rcc_system_clock_source();
extern(C) extern void rcc_clock_setup_in_hsi_out_64mhz();
extern(C) extern void rcc_clock_setup_in_hsi_out_48mhz();
extern(C) extern void rcc_clock_setup_in_hsi_out_24mhz();
extern(C) extern void rcc_clock_setup_in_hse_8mhz_out_24mhz();
extern(C) extern void rcc_clock_setup_in_hse_8mhz_out_72mhz();
extern(C) extern void rcc_clock_setup_in_hse_12mhz_out_72mhz();
extern(C) extern void rcc_clock_setup_in_hse_16mhz_out_72mhz();
extern(C) extern void rcc_clock_setup_in_hse_25mhz_out_72mhz();
extern(C) extern void rcc_backupdomain_reset();

ref uint RTC_CRH ()  { return MMIO!uint(RTC_BASE + 0x00); }
ref uint RTC_CRL ()  { return MMIO!uint(RTC_BASE + 0x04); }
ref uint RTC_PRLH () { return MMIO!uint(RTC_BASE + 0x08); }
ref uint RTC_PRLL () { return MMIO!uint(RTC_BASE + 0x0c); }
ref uint RTC_DIVH () { return MMIO!uint(RTC_BASE + 0x10); }
ref uint RTC_DIVL () { return MMIO!uint(RTC_BASE + 0x14); }
ref uint RTC_CNTH () { return MMIO!uint(RTC_BASE + 0x18); }
ref uint RTC_CNTL () { return MMIO!uint(RTC_BASE + 0x1c); }
ref uint RTC_ALRH () { return MMIO!uint(RTC_BASE + 0x20); }
ref uint RTC_ALRL () { return MMIO!uint(RTC_BASE + 0x24); }
enum RTC_CRH_OWIE = 1 << 2;
enum RTC_CRH_ALRIE = 1 << 1;
enum RTC_CRH_SECIE = 1 << 0;
enum RTC_CRL_RTOFF = 1 << 5;
enum RTC_CRL_CNF = 1 << 4;
enum RTC_CRL_RSF = 1 << 3;
enum RTC_CRL_OWF = 1 << 2;
enum RTC_CRL_ALRF = 1 << 1;
enum RTC_CRL_SECF = 1 << 0;
enum rtcflag_t {RTC_SEC, RTC_ALR, RTC_OW};

extern(C) extern void rtc_awake_from_off(rcc_osc clock_source);
extern(C) extern void rtc_enter_config_mode();
extern(C) extern void rtc_exit_config_mode();
extern(C) extern void rtc_set_alarm_time(uint alarm_time);
extern(C) extern void rtc_enable_alarm();
extern(C) extern void rtc_disable_alarm();
extern(C) extern void rtc_set_prescale_val(uint prescale_val);
extern(C) extern uint rtc_get_counter_val();
extern(C) extern uint rtc_get_prescale_div_val();
extern(C) extern uint rtc_get_alarm_val();
extern(C) extern void rtc_set_counter_val(uint counter_val);
extern(C) extern void rtc_interrupt_enable(rtcflag_t flag_val);
extern(C) extern void rtc_interrupt_disable(rtcflag_t flag_val);
extern(C) extern void rtc_clear_flag(rtcflag_t flag_val);
extern(C) extern uint rtc_check_flag(rtcflag_t flag_val);
extern(C) extern void rtc_awake_from_standby();
extern(C) extern void rtc_auto_awake(
    rcc_osc clock_source, uint prescale_val);

// enum SPI1 SPI1_BASE
// enum SPI2 SPI2_BASE
// enum SPI3 SPI3_BASE
// enum SPI4 SPI4_BASE
// enum SPI5 SPI5_BASE
// enum SPI6 SPI6_BASE
// enum SPI_CR1(spi_base) () { return MMIO!uint((spi_base) + 0x00)
// enum SPI1_CR1 SPI_CR1(SPI1_BASE)
// enum SPI2_CR1 SPI_CR1(SPI2_BASE)
// enum SPI3_CR1 SPI_CR1(SPI3_BASE)
// enum SPI_CR2(spi_base) () { return MMIO!uint((spi_base) + 0x04)
// enum SPI1_CR2 SPI_CR2(SPI1_BASE)
// enum SPI2_CR2 SPI_CR2(SPI2_BASE)
// enum SPI3_CR2 SPI_CR2(SPI3_BASE)
// enum SPI_SR(spi_base) () { return MMIO!uint((spi_base) + 0x08)
// enum SPI1_SR SPI_SR(SPI1_BASE)
// enum SPI2_SR SPI_SR(SPI2_BASE)
// enum SPI3_SR SPI_SR(SPI3_BASE)
// enum SPI_DR(spi_base) () { return MMIO!uint((spi_base) + 0x0c)
// enum SPI1_DR SPI_DR(SPI1_BASE)
// enum SPI2_DR SPI_DR(SPI2_BASE)
// enum SPI3_DR SPI_DR(SPI3_BASE)
// enum SPI_CRCPR(spi_base) () { return MMIO!uint((spi_base) + 0x10)
// enum SPI1_CRCPR SPI_CRCPR(SPI1_BASE)
// enum SPI2_CRCPR SPI_CRCPR(SPI2_BASE)
// enum SPI3_CRCPR SPI_CRCPR(SPI3_BASE)
// enum SPI_RXCRCR(spi_base) () { return MMIO!uint((spi_base) + 0x14)
// enum SPI1_RXCRCR SPI_RXCRCR(SPI1_BASE)
// enum SPI2_RXCRCR SPI_RXCRCR(SPI2_BASE)
// enum SPI3_RXCRCR SPI_RXCRCR(SPI3_BASE)
// enum SPI_TXCRCR(spi_base) () { return MMIO!uint((spi_base) + 0x18)
// enum SPI1_TXCRCR SPI_TXCRCR(SPI1_BASE)
// enum SPI2_TXCRCR SPI_TXCRCR(SPI2_BASE)
// enum SPI3_TXCRCR SPI_TXCRCR(SPI3_BASE)
// enum SPI_I2SCFGR(spi_base) () { return MMIO!uint((spi_base) + 0x1c)
// enum SPI1_I2SCFGR SPI_I2SCFGR(SPI1_BASE)
// enum SPI2_I2SCFGR SPI_I2SCFGR(SPI2_BASE)
// enum SPI3_I2SCFGR SPI_I2SCFGR(SPI3_BASE)
// enum SPI_I2SPR(spi_base) () { return MMIO!uint((spi_base) + 0x20)
// enum SPI1_I2SPR SPI_I2SPR(SPI1_BASE)
// enum SPI2_I2SPR SPI_I2SPR(SPI2_BASE)
// enum SPI3_I2SPR SPI_I2SPR(SPI3_BASE)
// enum SPI_CR1_BIDIMODE_2LINE_UNIDIR (0 << 15)
// enum SPI_CR1_BIDIMODE_1LINE_BIDIR (1 << 15)
// enum SPI_CR1_BIDIMODE (1 << 15)
// enum SPI_CR1_BIDIOE (1 << 14)
// enum SPI_CR1_CRCEN (1 << 13)
// enum SPI_CR1_CRCNEXT (1 << 12)
// enum SPI_CR1_RXONLY (1 << 10)
// enum SPI_CR1_SSM (1 << 9)
// enum SPI_CR1_SSI (1 << 8)
// enum SPI_CR1_MSBFIRST (0 << 7)
// enum SPI_CR1_LSBFIRST (1 << 7)
// enum SPI_CR1_SPE (1 << 6)
// enum SPI_CR1_BAUDRATE_FPCLK_DIV_2 (0x00 << 3)
// enum SPI_CR1_BAUDRATE_FPCLK_DIV_4 (0x01 << 3)
// enum SPI_CR1_BAUDRATE_FPCLK_DIV_8 (0x02 << 3)
// enum SPI_CR1_BAUDRATE_FPCLK_DIV_16 (0x03 << 3)
// enum SPI_CR1_BAUDRATE_FPCLK_DIV_32 (0x04 << 3)
// enum SPI_CR1_BAUDRATE_FPCLK_DIV_64 (0x05 << 3)
// enum SPI_CR1_BAUDRATE_FPCLK_DIV_128 (0x06 << 3)
// enum SPI_CR1_BAUDRATE_FPCLK_DIV_256 (0x07 << 3)
// enum SPI_CR1_BR_FPCLK_DIV_2 0x0
// enum SPI_CR1_BR_FPCLK_DIV_4 0x1
// enum SPI_CR1_BR_FPCLK_DIV_8 0x2
// enum SPI_CR1_BR_FPCLK_DIV_16 0x3
// enum SPI_CR1_BR_FPCLK_DIV_32 0x4
// enum SPI_CR1_BR_FPCLK_DIV_64 0x5
// enum SPI_CR1_BR_FPCLK_DIV_128 0x6
// enum SPI_CR1_BR_FPCLK_DIV_256 0x7
// enum SPI_CR1_MSTR (1 << 2)
// enum SPI_CR1_CPOL_CLK_TO_0_WHEN_IDLE (0 << 1)
// enum SPI_CR1_CPOL_CLK_TO_1_WHEN_IDLE (1 << 1)
// enum SPI_CR1_CPOL (1 << 1)
// enum SPI_CR1_CPHA_CLK_TRANSITION_1 (0 << 0)
// enum SPI_CR1_CPHA_CLK_TRANSITION_2 (1 << 0)
// enum SPI_CR1_CPHA (1 << 0)
// enum SPI_CR2_TXEIE (1 << 7)
// enum SPI_CR2_RXNEIE (1 << 6)
// enum SPI_CR2_ERRIE (1 << 5)
// enum SPI_CR2_SSOE (1 << 2)
// enum SPI_CR2_TXDMAEN (1 << 1)
// enum SPI_CR2_RXDMAEN (1 << 0)
// enum SPI_SR_BSY (1 << 7)
// enum SPI_SR_OVR (1 << 6)
// enum SPI_SR_MODF (1 << 5)
// enum SPI_SR_CRCERR (1 << 4)
// enum SPI_SR_UDR (1 << 3)
// enum SPI_SR_CHSIDE (1 << 2)
// enum SPI_SR_TXE (1 << 1)
// enum SPI_SR_RXNE (1 << 0)
// enum SPI_I2SCFGR_I2SMOD (1 << 11)
// enum SPI_I2SCFGR_I2SE (1 << 10)
// enum SPI_I2SCFGR_I2SCFG_LSB 8
// enum SPI_I2SCFGR_I2SCFG_SLAVE_TRANSMIT 0x0
// enum SPI_I2SCFGR_I2SCFG_SLAVE_RECEIVE 0x1
// enum SPI_I2SCFGR_I2SCFG_MASTER_TRANSMIT 0x2
// enum SPI_I2SCFGR_I2SCFG_MASTER_RECEIVE 0x3
// enum SPI_I2SCFGR_PCMSYNC (1 << 7)
// enum SPI_I2SCFGR_I2SSTD_LSB 4
// enum SPI_I2SCFGR_I2SSTD_I2S_PHILIPS 0x0
// enum SPI_I2SCFGR_I2SSTD_MSB_JUSTIFIED 0x1
// enum SPI_I2SCFGR_I2SSTD_LSB_JUSTIFIED 0x2
// enum SPI_I2SCFGR_I2SSTD_PCM 0x3
// enum SPI_I2SCFGR_CKPOL (1 << 3)
// enum SPI_I2SCFGR_DATLEN_LSB 1
// enum SPI_I2SCFGR_DATLEN_16BIT 0x0
// enum SPI_I2SCFGR_DATLEN_24BIT 0x1
// enum SPI_I2SCFGR_DATLEN_32BIT 0x2
// enum SPI_I2SCFGR_CHLEN (1 << 0)
// enum SPI_I2SPR_MCKOE (1 << 9)
// enum SPI_I2SPR_ODD (1 << 8)
//
// void spi_reset(uint spi_peripheral);
// int spi_init_master(uint spi, uint br, uint cpol, uint cpha,
//       uint dff, uint lsbfirst);
// void spi_enable(uint spi);
// void spi_disable(uint spi);
// ushort spi_clean_disable(uint spi);
// void spi_write(uint spi, ushort data);
// void spi_send(uint spi, ushort data);
// ushort spi_read(uint spi);
// ushort spi_xfer(uint spi, ushort data);
// void spi_set_bidirectional_mode(uint spi);
// void spi_set_unidirectional_mode(uint spi);
// void spi_set_bidirectional_receive_only_mode(uint spi);
// void spi_set_bidirectional_transmit_only_mode(uint spi);
// void spi_enable_crc(uint spi);
// void spi_disable_crc(uint spi);
// void spi_set_next_tx_from_buffer(uint spi);
// void spi_set_next_tx_from_crc(uint spi);
// void spi_set_dff_8bit(uint spi);
// void spi_set_dff_16bit(uint spi);
// void spi_set_full_duplex_mode(uint spi);
// void spi_set_receive_only_mode(uint spi);
// void spi_disable_software_slave_management(uint spi);
// void spi_enable_software_slave_management(uint spi);
// void spi_set_nss_high(uint spi);
// void spi_set_nss_low(uint spi);
// void spi_send_lsb_first(uint spi);
// void spi_send_msb_first(uint spi);
// void spi_set_baudrate_prescaler(uint spi, ubyte baudrate);
// void spi_set_master_mode(uint spi);
// void spi_set_slave_mode(uint spi);
// void spi_set_clock_polarity_1(uint spi);
// void spi_set_clock_polarity_0(uint spi);
// void spi_set_clock_phase_1(uint spi);
// void spi_set_clock_phase_0(uint spi);
// void spi_enable_tx_buffer_empty_interrupt(uint spi);
// void spi_disable_tx_buffer_empty_interrupt(uint spi);
// void spi_enable_rx_buffer_not_empty_interrupt(uint spi);
// void spi_disable_rx_buffer_not_empty_interrupt(uint spi);
// void spi_enable_error_interrupt(uint spi);
// void spi_disable_error_interrupt(uint spi);
// void spi_enable_ss_output(uint spi);
// void spi_disable_ss_output(uint spi);
// void spi_enable_tx_dma(uint spi);
// void spi_disable_tx_dma(uint spi);
// void spi_enable_rx_dma(uint spi);
// void spi_disable_rx_dma(uint spi);
// void spi_set_standard_mode(uint spi, ubyte mode);
//
// enum SPI_CR1_DFF_8BIT (0 << 11)
// enum SPI_CR1_DFF_16BIT (1 << 11)
// enum SPI_CR1_DFF (1 << 11)
// enum LIBOPENCM3_ST_USBFS_H
// enum LIBOPENCM3_ST_USBFS_V1_H
// enum LIBOPENCM3_ST_USBFS_COMMON_H
// enum LIBOPENCM3_TOOLS_H
// enum GET_REG(REG) ((ushort) *(REG))
// enum SET_REG(REG,VAL) (*(REG) = (ushort)(VAL))
// enum CLR_REG_BIT(REG,BIT) SET_REG((REG), (~(BIT)))
// enum CLR_REG_BIT_MSK_AND_SET(REG,MSK,BIT,EXTRA_BITS) SET_REG((REG), (GET_REG((REG)) & (MSK) & (~(BIT))) | (EXTRA_BITS))
// enum CLR_REG_BIT_MSK(REG,MSK,BIT) CLR_REG_BIT_MSK_AND_SET((REG), (MSK), (BIT), 0)
// enum GET_REG_BIT(REG,BIT) (GET_REG(REG) & (BIT))
// enum TOG_SET_REG_BIT_MSK_AND_SET(REG,MSK,BIT,EXTRA_BITS) do { register ushort toggle_mask = GET_REG(REG) & (MSK); toggle_mask ^= BIT; SET_REG((REG), toggle_mask | (EXTRA_BITS)); } while (0)
// enum TOG_SET_REG_BIT_MSK(REG,MSK,BIT) TOG_SET_REG_BIT_MSK_AND_SET((REG), (MSK), (BIT), 0)
// enum USB_CNTR_REG (&() { return MMIO!uint(USB_DEV_FS_BASE + 0x40))
// enum USB_ISTR_REG (&() { return MMIO!uint(USB_DEV_FS_BASE + 0x44))
// enum USB_FNR_REG (&() { return MMIO!uint(USB_DEV_FS_BASE + 0x48))
// enum USB_DADDR_REG (&() { return MMIO!uint(USB_DEV_FS_BASE + 0x4C))
// enum USB_BTABLE_REG (&() { return MMIO!uint(USB_DEV_FS_BASE + 0x50))
// enum USB_EP_REG(EP) (&() { return MMIO!uint(USB_DEV_FS_BASE) + (EP))
// enum USB_CNTR_CTRM 0x8000
// enum USB_CNTR_PMAOVRM 0x4000
// enum USB_CNTR_ERRM 0x2000
// enum USB_CNTR_WKUPM 0x1000
// enum USB_CNTR_SUSPM 0x0800
// enum USB_CNTR_RESETM 0x0400
// enum USB_CNTR_SOFM 0x0200
// enum USB_CNTR_ESOFM 0x0100
// enum USB_CNTR_RESUME 0x0010
// enum USB_CNTR_FSUSP 0x0008
// enum USB_CNTR_LP_MODE 0x0004
// enum USB_CNTR_PWDN 0x0002
// enum USB_CNTR_FRES 0x0001
// enum USB_ISTR_CTR 0x8000
// enum USB_ISTR_PMAOVR 0x4000
// enum USB_ISTR_ERR 0x2000
// enum USB_ISTR_WKUP 0x1000
// enum USB_ISTR_SUSP 0x0800
// enum USB_ISTR_RESET 0x0400
// enum USB_ISTR_SOF 0x0200
// enum USB_ISTR_ESOF 0x0100
// enum USB_ISTR_DIR 0x0010
// enum USB_ISTR_EP_ID 0x000F
// enum USB_CLR_ISTR_PMAOVR() CLR_REG_BIT(USB_ISTR_REG, USB_ISTR_PMAOVR)
// enum USB_CLR_ISTR_ERR() CLR_REG_BIT(USB_ISTR_REG, USB_ISTR_ERR)
// enum USB_CLR_ISTR_WKUP() CLR_REG_BIT(USB_ISTR_REG, USB_ISTR_WKUP)
// enum USB_CLR_ISTR_SUSP() CLR_REG_BIT(USB_ISTR_REG, USB_ISTR_SUSP)
// enum USB_CLR_ISTR_RESET() CLR_REG_BIT(USB_ISTR_REG, USB_ISTR_RESET)
// enum USB_CLR_ISTR_SOF() CLR_REG_BIT(USB_ISTR_REG, USB_ISTR_SOF)
// enum USB_CLR_ISTR_ESOF() CLR_REG_BIT(USB_ISTR_REG, USB_ISTR_ESOF)
// enum USB_FNR_RXDP (1 << 15)
// enum USB_FNR_RXDM (1 << 14)
// enum USB_FNR_LCK (1 << 13)
// enum USB_FNR_LSOF_SHIFT 11
// enum USB_FNR_LSOF (3 << USB_FNR_LSOF_SHIFT)
// enum USB_FNR_FN (0x7FF << 0)
// enum USB_DADDR_EF (1 << 7)
// enum USB_DADDR_ADDR 0x007F
// enum USB_BTABLE_BTABLE 0xFFF8
// enum USB_EP0 0
// enum USB_EP1 1
// enum USB_EP2 2
// enum USB_EP3 3
// enum USB_EP4 4
// enum USB_EP5 5
// enum USB_EP6 6
// enum USB_EP7 7
// enum USB_EP_RX_CTR 0x8000
// enum USB_EP_RX_DTOG 0x4000
// enum USB_EP_RX_STAT 0x3000
// enum USB_EP_SETUP 0x0800
// enum USB_EP_TYPE 0x0600
// enum USB_EP_KIND 0x0100
// enum USB_EP_TX_CTR 0x0080
// enum USB_EP_TX_DTOG 0x0040
// enum USB_EP_TX_STAT 0x0030
// enum USB_EP_ADDR 0x000F
// enum USB_EP_NTOGGLE_MSK (USB_EP_RX_CTR | USB_EP_SETUP | USB_EP_TYPE | USB_EP_KIND | USB_EP_TX_CTR | USB_EP_ADDR)
// enum USB_EP_RX_STAT_TOG_MSK (USB_EP_RX_STAT | USB_EP_NTOGGLE_MSK)
// enum USB_EP_TX_STAT_TOG_MSK (USB_EP_TX_STAT | USB_EP_NTOGGLE_MSK)
// enum USB_EP_RX_STAT_DISABLED 0x0000
// enum USB_EP_RX_STAT_STALL 0x1000
// enum USB_EP_RX_STAT_NAK 0x2000
// enum USB_EP_RX_STAT_VALID 0x3000
// enum USB_EP_TX_STAT_DISABLED 0x0000
// enum USB_EP_TX_STAT_STALL 0x0010
// enum USB_EP_TX_STAT_NAK 0x0020
// enum USB_EP_TX_STAT_VALID 0x0030
// enum USB_EP_TYPE_BULK 0x0000
// enum USB_EP_TYPE_CONTROL 0x0200
// enum USB_EP_TYPE_ISO 0x0400
// enum USB_EP_TYPE_INTERRUPT 0x0600
// enum USB_SET_EP_RX_STAT(EP,STAT) TOG_SET_REG_BIT_MSK_AND_SET(USB_EP_REG(EP), USB_EP_RX_STAT_TOG_MSK, STAT, USB_EP_RX_CTR | USB_EP_TX_CTR)
// enum USB_SET_EP_TX_STAT(EP,STAT) TOG_SET_REG_BIT_MSK_AND_SET(USB_EP_REG(EP), USB_EP_TX_STAT_TOG_MSK, STAT, USB_EP_RX_CTR | USB_EP_TX_CTR)
// enum USB_CLR_EP_NTOGGLE_BIT_AND_SET(EP,BIT,EXTRA_BITS) CLR_REG_BIT_MSK_AND_SET(USB_EP_REG(EP), USB_EP_NTOGGLE_MSK, BIT, EXTRA_BITS)
// enum USB_CLR_EP_RX_CTR(EP) USB_CLR_EP_NTOGGLE_BIT_AND_SET(EP, USB_EP_RX_CTR, USB_EP_TX_CTR)
// enum USB_CLR_EP_TX_CTR(EP) USB_CLR_EP_NTOGGLE_BIT_AND_SET(EP, USB_EP_TX_CTR, USB_EP_RX_CTR)
// enum USB_SET_EP_TYPE(EP,TYPE) SET_REG(USB_EP_REG(EP), (GET_REG(USB_EP_REG(EP)) & (USB_EP_NTOGGLE_MSK & (~USB_EP_TYPE))) | TYPE)
// enum USB_SET_EP_KIND(EP) SET_REG(USB_EP_REG(EP), (GET_REG(USB_EP_REG(EP)) & (USB_EP_NTOGGLE_MSK & (~USB_EP_KIND))) | USB_EP_KIND)
// enum USB_CLR_EP_KIND(EP) SET_REG(USB_EP_REG(EP), (GET_REG(USB_EP_REG(EP)) & (USB_EP_NTOGGLE_MSK & (~USB_EP_KIND))))
// enum USB_SET_EP_STAT_OUT(EP) USB_SET_EP_KIND(EP)
// enum USB_CLR_EP_STAT_OUT(EP) USB_CLR_EP_KIND(EP)
// enum USB_SET_EP_ADDR(EP,ADDR) SET_REG(USB_EP_REG(EP), ((GET_REG(USB_EP_REG(EP)) & (USB_EP_NTOGGLE_MSK & (~USB_EP_ADDR))) | ADDR))
// enum USB_CLR_EP_TX_DTOG(EP) SET_REG(USB_EP_REG(EP), GET_REG(USB_EP_REG(EP)) & (USB_EP_NTOGGLE_MSK | USB_EP_TX_DTOG))
// enum USB_CLR_EP_RX_DTOG(EP) SET_REG(USB_EP_REG(EP), GET_REG(USB_EP_REG(EP)) & (USB_EP_NTOGGLE_MSK | USB_EP_RX_DTOG))
// enum USB_GET_BTABLE GET_REG(USB_BTABLE_REG)
// enum USB_GET_EP_TX_ADDR(EP) GET_REG(USB_EP_TX_ADDR(EP))
// enum USB_GET_EP_TX_COUNT(EP) GET_REG(USB_EP_TX_COUNT(EP))
// enum USB_GET_EP_RX_ADDR(EP) GET_REG(USB_EP_RX_ADDR(EP))
// enum USB_GET_EP_RX_COUNT(EP) GET_REG(USB_EP_RX_COUNT(EP))
// enum USB_SET_EP_TX_ADDR(EP,ADDR) SET_REG(USB_EP_TX_ADDR(EP), ADDR)
// enum USB_SET_EP_TX_COUNT(EP,COUNT) SET_REG(USB_EP_TX_COUNT(EP), COUNT)
// enum USB_SET_EP_RX_ADDR(EP,ADDR) SET_REG(USB_EP_RX_ADDR(EP), ADDR)
// enum USB_SET_EP_RX_COUNT(EP,COUNT) SET_REG(USB_EP_RX_COUNT(EP), COUNT)
// enum USB_EP_TX_ADDR(EP) ((uint *)(USB_PMA_BASE + (USB_GET_BTABLE + EP * 8 + 0) * 2))
// enum USB_EP_TX_COUNT(EP) ((uint *)(USB_PMA_BASE + (USB_GET_BTABLE + EP * 8 + 2) * 2))
// enum USB_EP_RX_ADDR(EP) ((uint *)(USB_PMA_BASE + (USB_GET_BTABLE + EP * 8 + 4) * 2))
// enum USB_EP_RX_COUNT(EP) ((uint *)(USB_PMA_BASE + (USB_GET_BTABLE + EP * 8 + 6) * 2))
// enum USB_GET_EP_TX_BUFF(EP) (USB_PMA_BASE + (ubyte *)(USB_GET_EP_TX_ADDR(EP) * 2))
// enum USB_GET_EP_RX_BUFF(EP) (USB_PMA_BASE + (ubyte *)(USB_GET_EP_RX_ADDR(EP) * 2))

enum TIM1 = TIM1_BASE;
enum TIM2 = TIM2_BASE;
enum TIM3 = TIM3_BASE;
enum TIM4 = TIM4_BASE;
enum TIM5 = TIM5_BASE;
enum TIM6 = TIM6_BASE;
enum TIM7 = TIM7_BASE;
enum TIM8 = TIM8_BASE;
enum TIM9 = TIM9_BASE;
enum TIM10 = TIM10_BASE;
enum TIM11 = TIM11_BASE;
enum TIM12 = TIM12_BASE;
enum TIM13 = TIM13_BASE;
enum TIM14 = TIM14_BASE;
enum TIM15 = TIM15_BASE;
enum TIM16 = TIM16_BASE;
enum TIM17 = TIM17_BASE;
// enum TIM_CR1(tim_base) () { return MMIO!uint((tim_base) + 0x00)
// enum TIM1_CR1 TIM_CR1(TIM1)
// enum TIM2_CR1 TIM_CR1(TIM2)
// enum TIM3_CR1 TIM_CR1(TIM3)
// enum TIM4_CR1 TIM_CR1(TIM4)
// enum TIM5_CR1 TIM_CR1(TIM5)
// enum TIM6_CR1 TIM_CR1(TIM6)
// enum TIM7_CR1 TIM_CR1(TIM7)
// enum TIM8_CR1 TIM_CR1(TIM8)
// enum TIM9_CR1 TIM_CR1(TIM9)
// enum TIM10_CR1 TIM_CR1(TIM10)
// enum TIM11_CR1 TIM_CR1(TIM11)
// enum TIM12_CR1 TIM_CR1(TIM12)
// enum TIM13_CR1 TIM_CR1(TIM13)
// enum TIM14_CR1 TIM_CR1(TIM14)
// enum TIM15_CR1 TIM_CR1(TIM15)
// enum TIM16_CR1 TIM_CR1(TIM16)
// enum TIM17_CR1 TIM_CR1(TIM17)
// enum TIM_CR2(tim_base) () { return MMIO!uint((tim_base) + 0x04)
// enum TIM1_CR2 TIM_CR2(TIM1)
// enum TIM2_CR2 TIM_CR2(TIM2)
// enum TIM3_CR2 TIM_CR2(TIM3)
// enum TIM4_CR2 TIM_CR2(TIM4)
// enum TIM5_CR2 TIM_CR2(TIM5)
// enum TIM6_CR2 TIM_CR2(TIM6)
// enum TIM7_CR2 TIM_CR2(TIM7)
// enum TIM8_CR2 TIM_CR2(TIM8)
// enum TIM15_CR2 TIM_CR2(TIM15)
// enum TIM16_CR2 TIM_CR2(TIM16)
// enum TIM17_CR2 TIM_CR2(TIM17)
// enum TIM_SMCR(tim_base) () { return MMIO!uint((tim_base) + 0x08)
// enum TIM1_SMCR TIM_SMCR(TIM1)
// enum TIM2_SMCR TIM_SMCR(TIM2)
// enum TIM3_SMCR TIM_SMCR(TIM3)
// enum TIM4_SMCR TIM_SMCR(TIM4)
// enum TIM5_SMCR TIM_SMCR(TIM5)
// enum TIM8_SMCR TIM_SMCR(TIM8)
// enum TIM9_SMCR TIM_SMCR(TIM9)
// enum TIM12_SMCR TIM_SMCR(TIM12)
// enum TIM15_SMCR TIM_SMCR(TIM15)
// enum TIM_DIER(tim_base) () { return MMIO!uint((tim_base) + 0x0C)
// enum TIM1_DIER TIM_DIER(TIM1)
// enum TIM2_DIER TIM_DIER(TIM2)
// enum TIM3_DIER TIM_DIER(TIM3)
// enum TIM4_DIER TIM_DIER(TIM4)
// enum TIM5_DIER TIM_DIER(TIM5)
// enum TIM6_DIER TIM_DIER(TIM6)
// enum TIM7_DIER TIM_DIER(TIM7)
// enum TIM8_DIER TIM_DIER(TIM8)
// enum TIM9_DIER TIM_DIER(TIM9)
// enum TIM10_DIER TIM_DIER(TIM10)
// enum TIM11_DIER TIM_DIER(TIM11)
// enum TIM12_DIER TIM_DIER(TIM12)
// enum TIM13_DIER TIM_DIER(TIM13)
// enum TIM14_DIER TIM_DIER(TIM14)
// enum TIM15_DIER TIM_DIER(TIM15)
// enum TIM16_DIER TIM_DIER(TIM16)
// enum TIM17_DIER TIM_DIER(TIM17)
// enum TIM_SR(tim_base) () { return MMIO!uint((tim_base) + 0x10)
// enum TIM1_SR TIM_SR(TIM1)
// enum TIM2_SR TIM_SR(TIM2)
// enum TIM3_SR TIM_SR(TIM3)
// enum TIM4_SR TIM_SR(TIM4)
// enum TIM5_SR TIM_SR(TIM5)
// enum TIM6_SR TIM_SR(TIM6)
// enum TIM7_SR TIM_SR(TIM7)
// enum TIM8_SR TIM_SR(TIM8)
// enum TIM9_SR TIM_SR(TIM9)
// enum TIM10_SR TIM_SR(TIM10)
// enum TIM11_SR TIM_SR(TIM11)
// enum TIM12_SR TIM_SR(TIM12)
// enum TIM13_SR TIM_SR(TIM13)
// enum TIM14_SR TIM_SR(TIM14)
// enum TIM15_SR TIM_SR(TIM15)
// enum TIM16_SR TIM_SR(TIM16)
// enum TIM17_SR TIM_SR(TIM17)
// enum TIM_EGR(tim_base) () { return MMIO!uint((tim_base) + 0x14)
// enum TIM1_EGR TIM_EGR(TIM1)
// enum TIM2_EGR TIM_EGR(TIM2)
// enum TIM3_EGR TIM_EGR(TIM3)
// enum TIM4_EGR TIM_EGR(TIM4)
// enum TIM5_EGR TIM_EGR(TIM5)
// enum TIM6_EGR TIM_EGR(TIM6)
// enum TIM7_EGR TIM_EGR(TIM7)
// enum TIM8_EGR TIM_EGR(TIM8)
// enum TIM9_EGR TIM_EGR(TIM9)
// enum TIM10_EGR TIM_EGR(TIM10)
// enum TIM11_EGR TIM_EGR(TIM11)
// enum TIM12_EGR TIM_EGR(TIM12)
// enum TIM13_EGR TIM_EGR(TIM13)
// enum TIM14_EGR TIM_EGR(TIM14)
// enum TIM15_EGR TIM_EGR(TIM15)
// enum TIM16_EGR TIM_EGR(TIM16)
// enum TIM17_EGR TIM_EGR(TIM17)
// enum TIM_CCMR1(tim_base) () { return MMIO!uint((tim_base) + 0x18)
// enum TIM1_CCMR1 TIM_CCMR1(TIM1)
// enum TIM2_CCMR1 TIM_CCMR1(TIM2)
// enum TIM3_CCMR1 TIM_CCMR1(TIM3)
// enum TIM4_CCMR1 TIM_CCMR1(TIM4)
// enum TIM5_CCMR1 TIM_CCMR1(TIM5)
// enum TIM8_CCMR1 TIM_CCMR1(TIM8)
// enum TIM9_CCMR1 TIM_CCMR1(TIM9)
// enum TIM10_CCMR1 TIM_CCMR1(TIM10)
// enum TIM11_CCMR1 TIM_CCMR1(TIM11)
// enum TIM12_CCMR1 TIM_CCMR1(TIM12)
// enum TIM13_CCMR1 TIM_CCMR1(TIM13)
// enum TIM14_CCMR1 TIM_CCMR1(TIM14)
// enum TIM15_CCMR1 TIM_CCMR1(TIM15)
// enum TIM16_CCMR1 TIM_CCMR1(TIM16)
// enum TIM17_CCMR1 TIM_CCMR1(TIM17)
// enum TIM_CCMR2(tim_base) () { return MMIO!uint((tim_base) + 0x1C)
// enum TIM1_CCMR2 TIM_CCMR2(TIM1)
// enum TIM2_CCMR2 TIM_CCMR2(TIM2)
// enum TIM3_CCMR2 TIM_CCMR2(TIM3)
// enum TIM4_CCMR2 TIM_CCMR2(TIM4)
// enum TIM5_CCMR2 TIM_CCMR2(TIM5)
// enum TIM8_CCMR2 TIM_CCMR2(TIM8)
// enum TIM_CCER(tim_base) () { return MMIO!uint((tim_base) + 0x20)
// enum TIM1_CCER TIM_CCER(TIM1)
// enum TIM2_CCER TIM_CCER(TIM2)
// enum TIM3_CCER TIM_CCER(TIM3)
// enum TIM4_CCER TIM_CCER(TIM4)
// enum TIM5_CCER TIM_CCER(TIM5)
// enum TIM8_CCER TIM_CCER(TIM8)
// enum TIM9_CCER TIM_CCER(TIM9)
// enum TIM10_CCER TIM_CCER(TIM10)
// enum TIM11_CCER TIM_CCER(TIM11)
// enum TIM12_CCER TIM_CCER(TIM12)
// enum TIM13_CCER TIM_CCER(TIM13)
// enum TIM14_CCER TIM_CCER(TIM14)
// enum TIM15_CCER TIM_CCER(TIM15)
// enum TIM16_CCER TIM_CCER(TIM16)
// enum TIM17_CCER TIM_CCER(TIM17)
// enum TIM_CNT(tim_base) () { return MMIO!uint((tim_base) + 0x24)
// enum TIM1_CNT TIM_CNT(TIM1)
// enum TIM2_CNT TIM_CNT(TIM2)
// enum TIM3_CNT TIM_CNT(TIM3)
// enum TIM4_CNT TIM_CNT(TIM4)
// enum TIM5_CNT TIM_CNT(TIM5)
// enum TIM6_CNT TIM_CNT(TIM6)
// enum TIM7_CNT TIM_CNT(TIM7)
// enum TIM8_CNT TIM_CNT(TIM8)
// enum TIM9_CNT TIM_CNT(TIM9)
// enum TIM10_CNT TIM_CNT(TIM10)
// enum TIM11_CNT TIM_CNT(TIM11)
// enum TIM12_CNT TIM_CNT(TIM12)
// enum TIM13_CNT TIM_CNT(TIM13)
// enum TIM14_CNT TIM_CNT(TIM14)
// enum TIM15_CNT TIM_CNT(TIM15)
// enum TIM16_CNT TIM_CNT(TIM16)
// enum TIM17_CNT TIM_CNT(TIM17)
// enum TIM_PSC(tim_base) () { return MMIO!uint((tim_base) + 0x28)
// enum TIM1_PSC TIM_PSC(TIM1)
// enum TIM2_PSC TIM_PSC(TIM2)
// enum TIM3_PSC TIM_PSC(TIM3)
// enum TIM4_PSC TIM_PSC(TIM4)
// enum TIM5_PSC TIM_PSC(TIM5)
// enum TIM6_PSC TIM_PSC(TIM6)
// enum TIM7_PSC TIM_PSC(TIM7)
// enum TIM8_PSC TIM_PSC(TIM8)
// enum TIM9_PSC TIM_PSC(TIM9)
// enum TIM10_PSC TIM_PSC(TIM10)
// enum TIM11_PSC TIM_PSC(TIM11)
// enum TIM12_PSC TIM_PSC(TIM12)
// enum TIM13_PSC TIM_PSC(TIM13)
// enum TIM14_PSC TIM_PSC(TIM14)
// enum TIM15_PSC TIM_PSC(TIM15)
// enum TIM16_PSC TIM_PSC(TIM16)
// enum TIM17_PSC TIM_PSC(TIM17)
// enum TIM_ARR(tim_base) () { return MMIO!uint((tim_base) + 0x2C)
// enum TIM1_ARR TIM_ARR(TIM1)
// enum TIM2_ARR TIM_ARR(TIM2)
// enum TIM3_ARR TIM_ARR(TIM3)
// enum TIM4_ARR TIM_ARR(TIM4)
// enum TIM5_ARR TIM_ARR(TIM5)
// enum TIM6_ARR TIM_ARR(TIM6)
// enum TIM7_ARR TIM_ARR(TIM7)
// enum TIM8_ARR TIM_ARR(TIM8)
// enum TIM9_ARR TIM_ARR(TIM9)
// enum TIM10_ARR TIM_ARR(TIM10)
// enum TIM11_ARR TIM_ARR(TIM11)
// enum TIM12_ARR TIM_ARR(TIM12)
// enum TIM13_ARR TIM_ARR(TIM13)
// enum TIM14_ARR TIM_ARR(TIM14)
// enum TIM15_ARR TIM_ARR(TIM15)
// enum TIM16_ARR TIM_ARR(TIM16)
// enum TIM17_ARR TIM_ARR(TIM17)
// enum TIM_RCR(tim_base) () { return MMIO!uint((tim_base) + 0x30)
// enum TIM1_RCR TIM_RCR(TIM1)
// enum TIM8_RCR TIM_RCR(TIM8)
// enum TIM15_RCR TIM_RCR(TIM15)
// enum TIM16_RCR TIM_RCR(TIM16)
// enum TIM17_RCR TIM_RCR(TIM17)
// enum TIM_CCR1(tim_base) () { return MMIO!uint((tim_base) + 0x34)
// enum TIM1_CCR1 TIM_CCR1(TIM1)
// enum TIM2_CCR1 TIM_CCR1(TIM2)
// enum TIM3_CCR1 TIM_CCR1(TIM3)
// enum TIM4_CCR1 TIM_CCR1(TIM4)
// enum TIM5_CCR1 TIM_CCR1(TIM5)
// enum TIM8_CCR1 TIM_CCR1(TIM8)
// enum TIM9_CCR1 TIM_CCR1(TIM9)
// enum TIM10_CCR1 TIM_CCR1(TIM10)
// enum TIM11_CCR1 TIM_CCR1(TIM11)
// enum TIM12_CCR1 TIM_CCR1(TIM12)
// enum TIM13_CCR1 TIM_CCR1(TIM13)
// enum TIM14_CCR1 TIM_CCR1(TIM14)
// enum TIM15_CCR1 TIM_CCR1(TIM15)
// enum TIM16_CCR1 TIM_CCR1(TIM16)
// enum TIM17_CCR1 TIM_CCR1(TIM17)
// enum TIM_CCR2(tim_base) () { return MMIO!uint((tim_base) + 0x38)
// enum TIM1_CCR2 TIM_CCR2(TIM1)
// enum TIM2_CCR2 TIM_CCR2(TIM2)
// enum TIM3_CCR2 TIM_CCR2(TIM3)
// enum TIM4_CCR2 TIM_CCR2(TIM4)
// enum TIM5_CCR2 TIM_CCR2(TIM5)
// enum TIM8_CCR2 TIM_CCR2(TIM8)
// enum TIM9_CCR2 TIM_CCR2(TIM9)
// enum TIM12_CCR2 TIM_CCR2(TIM12)
// enum TIM15_CCR2 TIM_CCR2(TIM15)
// enum TIM_CCR3(tim_base) () { return MMIO!uint((tim_base) + 0x3C)
// enum TIM1_CCR3 TIM_CCR3(TIM1)
// enum TIM2_CCR3 TIM_CCR3(TIM2)
// enum TIM3_CCR3 TIM_CCR3(TIM3)
// enum TIM4_CCR3 TIM_CCR3(TIM4)
// enum TIM5_CCR3 TIM_CCR3(TIM5)
// enum TIM8_CCR3 TIM_CCR3(TIM8)
// enum TIM_CCR4(tim_base) () { return MMIO!uint((tim_base) + 0x40)
// enum TIM1_CCR4 TIM_CCR4(TIM1)
// enum TIM2_CCR4 TIM_CCR4(TIM2)
// enum TIM3_CCR4 TIM_CCR4(TIM3)
// enum TIM4_CCR4 TIM_CCR4(TIM4)
// enum TIM5_CCR4 TIM_CCR4(TIM5)
// enum TIM8_CCR4 TIM_CCR4(TIM8)
// enum TIM_BDTR(tim_base) () { return MMIO!uint((tim_base) + 0x44)
// enum TIM1_BDTR TIM_BDTR(TIM1)
// enum TIM8_BDTR TIM_BDTR(TIM8)
// enum TIM15_BDTR TIM_BDTR(TIM15)
// enum TIM16_BDTR TIM_BDTR(TIM16)
// enum TIM17_BDTR TIM_BDTR(TIM17)
// enum TIM_DCR(tim_base) () { return MMIO!uint((tim_base) + 0x48)
// enum TIM1_DCR TIM_DCR(TIM1)
// enum TIM2_DCR TIM_DCR(TIM2)
// enum TIM3_DCR TIM_DCR(TIM3)
// enum TIM4_DCR TIM_DCR(TIM4)
// enum TIM5_DCR TIM_DCR(TIM5)
// enum TIM8_DCR TIM_DCR(TIM8)
// enum TIM15_DCR TIM_DCR(TIM15)
// enum TIM16_DCR TIM_DCR(TIM16)
// enum TIM17_DCR TIM_DCR(TIM17)
// enum TIM_DMAR(tim_base) () { return MMIO!uint((tim_base) + 0x4C)
// enum TIM1_DMAR TIM_DMAR(TIM1)
// enum TIM2_DMAR TIM_DMAR(TIM2)
// enum TIM3_DMAR TIM_DMAR(TIM3)
// enum TIM4_DMAR TIM_DMAR(TIM4)
// enum TIM5_DMAR TIM_DMAR(TIM5)
// enum TIM8_DMAR TIM_DMAR(TIM8)
// enum TIM15_DMAR TIM_DMAR(TIM15)
// enum TIM16_DMAR TIM_DMAR(TIM16)
// enum TIM17_DMAR TIM_DMAR(TIM17)
enum TIM_CR1_CKD_CK_INT = 0x0 << 8;
// enum TIM_CR1_CKD_CK_INT_MUL_2 (0x1 << 8)
// enum TIM_CR1_CKD_CK_INT_MUL_4 (0x2 << 8)
// enum TIM_CR1_CKD_CK_INT_MASK (0x3 << 8)
// enum TIM_CR1_ARPE (1 << 7)
enum TIM_CR1_CMS_EDGE = 0x0 << 5;
// enum TIM_CR1_CMS_CENTER_1 (0x1 << 5)
// enum TIM_CR1_CMS_CENTER_2 (0x2 << 5)
// enum TIM_CR1_CMS_CENTER_3 (0x3 << 5)
// enum TIM_CR1_CMS_MASK (0x3 << 5)
enum TIM_CR1_DIR_UP = 0 << 4;
// enum TIM_CR1_DIR_DOWN (1 << 4)
// enum TIM_CR1_OPM (1 << 3)
// enum TIM_CR1_URS (1 << 2)
// enum TIM_CR1_UDIS (1 << 1)
// enum TIM_CR1_CEN (1 << 0)
// enum TIM_CR2_OIS4 (1 << 14)
// enum TIM_CR2_OIS3N (1 << 13)
// enum TIM_CR2_OIS3 (1 << 12)
// enum TIM_CR2_OIS2N (1 << 11)
// enum TIM_CR2_OIS2 (1 << 10)
// enum TIM_CR2_OIS1N (1 << 9)
// enum TIM_CR2_OIS1 (1 << 8)
// enum TIM_CR2_OIS_MASK (0x7f << 8)
// enum TIM_CR2_TI1S (1 << 7)
// enum TIM_CR2_MMS_RESET (0x0 << 4)
// enum TIM_CR2_MMS_ENABLE (0x1 << 4)
// enum TIM_CR2_MMS_UPDATE (0x2 << 4)
// enum TIM_CR2_MMS_COMPARE_PULSE (0x3 << 4)
// enum TIM_CR2_MMS_COMPARE_OC1REF (0x4 << 4)
// enum TIM_CR2_MMS_COMPARE_OC2REF (0x5 << 4)
// enum TIM_CR2_MMS_COMPARE_OC3REF (0x6 << 4)
// enum TIM_CR2_MMS_COMPARE_OC4REF (0x7 << 4)
// enum TIM_CR2_MMS_MASK (0x7 << 4)
// enum TIM_CR2_CCDS (1 << 3)
// enum TIM_CR2_CCUS (1 << 2)
// enum TIM_CR2_CCPC (1 << 0)
// enum TIM_SMCR_ETP (1 << 15)
// enum TIM_SMCR_ECE (1 << 14)
// enum TIM_SMCR_ETPS_OFF (0x0 << 12)
// enum TIM_SMCR_ETPS_ETRP_DIV_2 (0x1 << 12)
// enum TIM_SMCR_ETPS_ETRP_DIV_4 (0x2 << 12)
// enum TIM_SMCR_ETPS_ETRP_DIV_8 (0x3 << 12)
// enum TIM_SMCR_ETPS_MASK (0X3 << 12)
// enum TIM_SMCR_ETF_OFF (0x0 << 8)
// enum TIM_SMCR_ETF_CK_INT_N_2 (0x1 << 8)
// enum TIM_SMCR_ETF_CK_INT_N_4 (0x2 << 8)
// enum TIM_SMCR_ETF_CK_INT_N_8 (0x3 << 8)
// enum TIM_SMCR_ETF_DTS_DIV_2_N_6 (0x4 << 8)
// enum TIM_SMCR_ETF_DTS_DIV_2_N_8 (0x5 << 8)
// enum TIM_SMCR_ETF_DTS_DIV_4_N_6 (0x6 << 8)
// enum TIM_SMCR_ETF_DTS_DIV_4_N_8 (0x7 << 8)
// enum TIM_SMCR_ETF_DTS_DIV_8_N_6 (0x8 << 8)
// enum TIM_SMCR_ETF_DTS_DIV_8_N_8 (0x9 << 8)
// enum TIM_SMCR_ETF_DTS_DIV_16_N_5 (0xA << 8)
// enum TIM_SMCR_ETF_DTS_DIV_16_N_6 (0xB << 8)
// enum TIM_SMCR_ETF_DTS_DIV_16_N_8 (0xC << 8)
// enum TIM_SMCR_ETF_DTS_DIV_32_N_5 (0xD << 8)
// enum TIM_SMCR_ETF_DTS_DIV_32_N_6 (0xE << 8)
// enum TIM_SMCR_ETF_DTS_DIV_32_N_8 (0xF << 8)
// enum TIM_SMCR_ETF_MASK (0xF << 8)
// enum TIM_SMCR_MSM (1 << 7)
// enum TIM_SMCR_TS_ITR0 (0x0 << 4)
// enum TIM_SMCR_TS_ITR1 (0x1 << 4)
// enum TIM_SMCR_TS_ITR2 (0x2 << 4)
// enum TIM_SMCR_TS_ITR3 (0x3 << 4)
// enum TIM_SMCR_TS_TI1F_ED (0x4 << 4)
// enum TIM_SMCR_TS_TI1FP1 (0x5 << 4)
// enum TIM_SMCR_TS_TI2FP2 (0x6 << 4)
// enum TIM_SMCR_TS_ETRF (0x7 << 4)
// enum TIM_SMCR_TS_MASK (0x7 << 4)
// enum TIM_SMCR_SMS_OFF (0x0 << 0)
// enum TIM_SMCR_SMS_EM1 (0x1 << 0)
// enum TIM_SMCR_SMS_EM2 (0x2 << 0)
// enum TIM_SMCR_SMS_EM3 (0x3 << 0)
// enum TIM_SMCR_SMS_RM (0x4 << 0)
// enum TIM_SMCR_SMS_GM (0x5 << 0)
// enum TIM_SMCR_SMS_TM (0x6 << 0)
// enum TIM_SMCR_SMS_ECM1 (0x7 << 0)
// enum TIM_SMCR_SMS_MASK (0x7 << 0)
// enum TIM_DIER_TDE (1 << 14)
// enum TIM_DIER_COMDE (1 << 13)
// enum TIM_DIER_CC4DE (1 << 12)
// enum TIM_DIER_CC3DE (1 << 11)
// enum TIM_DIER_CC2DE (1 << 10)
// enum TIM_DIER_CC1DE (1 << 9)
// enum TIM_DIER_UDE (1 << 8)
// enum TIM_DIER_BIE (1 << 7)
enum TIM_DIER_TIE = 1 << 6;
// enum TIM_DIER_COMIE (1 << 5)
// enum TIM_DIER_CC4IE (1 << 4)
// enum TIM_DIER_CC3IE (1 << 3)
// enum TIM_DIER_CC2IE (1 << 2)
enum TIM_DIER_CC1IE = 1 << 1;
// enum TIM_DIER_UIE (1 << 0)
// enum TIM_SR_CC4OF (1 << 12)
// enum TIM_SR_CC3OF (1 << 11)
// enum TIM_SR_CC2OF (1 << 10)
// enum TIM_SR_CC1OF (1 << 9)
// enum TIM_SR_BIF (1 << 7)
// enum TIM_SR_TIF (1 << 6)
// enum TIM_SR_COMIF (1 << 5)
// enum TIM_SR_CC4IF (1 << 4)
// enum TIM_SR_CC3IF (1 << 3)
// enum TIM_SR_CC2IF (1 << 2)
enum TIM_SR_CC1IF = 1 << 1;
// enum TIM_SR_UIF (1 << 0)
// enum TIM_EGR_BG (1 << 7)
// enum TIM_EGR_TG (1 << 6)
// enum TIM_EGR_COMG (1 << 5)
// enum TIM_EGR_CC4G (1 << 4)
// enum TIM_EGR_CC3G (1 << 3)
// enum TIM_EGR_CC2G (1 << 2)
// enum TIM_EGR_CC1G (1 << 1)
// enum TIM_EGR_UG (1 << 0)
// enum TIM_CCMR1_OC2CE (1 << 15)
// enum TIM_CCMR1_OC2M_FROZEN (0x0 << 12)
// enum TIM_CCMR1_OC2M_ACTIVE (0x1 << 12)
// enum TIM_CCMR1_OC2M_INACTIVE (0x2 << 12)
// enum TIM_CCMR1_OC2M_TOGGLE (0x3 << 12)
// enum TIM_CCMR1_OC2M_FORCE_LOW (0x4 << 12)
// enum TIM_CCMR1_OC2M_FORCE_HIGH (0x5 << 12)
// enum TIM_CCMR1_OC2M_PWM1 (0x6 << 12)
// enum TIM_CCMR1_OC2M_PWM2 (0x7 << 12)
// enum TIM_CCMR1_OC2M_MASK (0x7 << 12)
// enum TIM_CCMR1_OC2PE (1 << 11)
// enum TIM_CCMR1_OC2FE (1 << 10)
// enum TIM_CCMR1_CC2S_OUT (0x0 << 8)
// enum TIM_CCMR1_CC2S_IN_TI2 (0x1 << 8)
// enum TIM_CCMR1_CC2S_IN_TI1 (0x2 << 8)
// enum TIM_CCMR1_CC2S_IN_TRC (0x3 << 8)
// enum TIM_CCMR1_CC2S_MASK (0x3 << 8)
// enum TIM_CCMR1_OC1CE (1 << 7)
// enum TIM_CCMR1_OC1M_FROZEN (0x0 << 4)
// enum TIM_CCMR1_OC1M_ACTIVE (0x1 << 4)
// enum TIM_CCMR1_OC1M_INACTIVE (0x2 << 4)
// enum TIM_CCMR1_OC1M_TOGGLE (0x3 << 4)
// enum TIM_CCMR1_OC1M_FORCE_LOW (0x4 << 4)
// enum TIM_CCMR1_OC1M_FORCE_HIGH (0x5 << 4)
// enum TIM_CCMR1_OC1M_PWM1 (0x6 << 4)
// enum TIM_CCMR1_OC1M_PWM2 (0x7 << 4)
// enum TIM_CCMR1_OC1M_MASK (0x7 << 4)
// enum TIM_CCMR1_OC1PE (1 << 3)
// enum TIM_CCMR1_OC1FE (1 << 2)
// enum TIM_CCMR1_CC1S_OUT (0x0 << 0)
// enum TIM_CCMR1_CC1S_IN_TI2 (0x2 << 0)
// enum TIM_CCMR1_CC1S_IN_TI1 (0x1 << 0)
// enum TIM_CCMR1_CC1S_IN_TRC (0x3 << 0)
// enum TIM_CCMR1_CC1S_MASK (0x3 << 0)
// enum TIM_CCMR1_IC2F_OFF (0x0 << 12)
// enum TIM_CCMR1_IC2F_CK_INT_N_2 (0x1 << 12)
// enum TIM_CCMR1_IC2F_CK_INT_N_4 (0x2 << 12)
// enum TIM_CCMR1_IC2F_CK_INT_N_8 (0x3 << 12)
// enum TIM_CCMR1_IC2F_DTF_DIV_2_N_6 (0x4 << 12)
// enum TIM_CCMR1_IC2F_DTF_DIV_2_N_8 (0x5 << 12)
// enum TIM_CCMR1_IC2F_DTF_DIV_4_N_6 (0x6 << 12)
// enum TIM_CCMR1_IC2F_DTF_DIV_4_N_8 (0x7 << 12)
// enum TIM_CCMR1_IC2F_DTF_DIV_8_N_6 (0x8 << 12)
// enum TIM_CCMR1_IC2F_DTF_DIV_8_N_8 (0x9 << 12)
// enum TIM_CCMR1_IC2F_DTF_DIV_16_N_5 (0xA << 12)
// enum TIM_CCMR1_IC2F_DTF_DIV_16_N_6 (0xB << 12)
// enum TIM_CCMR1_IC2F_DTF_DIV_16_N_8 (0xC << 12)
// enum TIM_CCMR1_IC2F_DTF_DIV_32_N_5 (0xD << 12)
// enum TIM_CCMR1_IC2F_DTF_DIV_32_N_6 (0xE << 12)
// enum TIM_CCMR1_IC2F_DTF_DIV_32_N_8 (0xF << 12)
// enum TIM_CCMR1_IC2F_MASK (0xF << 12)
// enum TIM_CCMR1_IC2PSC_OFF (0x0 << 10)
// enum TIM_CCMR1_IC2PSC_2 (0x1 << 10)
// enum TIM_CCMR1_IC2PSC_4 (0x2 << 10)
// enum TIM_CCMR1_IC2PSC_8 (0x3 << 10)
// enum TIM_CCMR1_IC2PSC_MASK (0x3 << 10)
// enum TIM_CCMR1_IC1F_OFF (0x0 << 4)
// enum TIM_CCMR1_IC1F_CK_INT_N_2 (0x1 << 4)
// enum TIM_CCMR1_IC1F_CK_INT_N_4 (0x2 << 4)
// enum TIM_CCMR1_IC1F_CK_INT_N_8 (0x3 << 4)
// enum TIM_CCMR1_IC1F_DTF_DIV_2_N_6 (0x4 << 4)
// enum TIM_CCMR1_IC1F_DTF_DIV_2_N_8 (0x5 << 4)
// enum TIM_CCMR1_IC1F_DTF_DIV_4_N_6 (0x6 << 4)
// enum TIM_CCMR1_IC1F_DTF_DIV_4_N_8 (0x7 << 4)
// enum TIM_CCMR1_IC1F_DTF_DIV_8_N_6 (0x8 << 4)
// enum TIM_CCMR1_IC1F_DTF_DIV_8_N_8 (0x9 << 4)
// enum TIM_CCMR1_IC1F_DTF_DIV_16_N_5 (0xA << 4)
// enum TIM_CCMR1_IC1F_DTF_DIV_16_N_6 (0xB << 4)
// enum TIM_CCMR1_IC1F_DTF_DIV_16_N_8 (0xC << 4)
// enum TIM_CCMR1_IC1F_DTF_DIV_32_N_5 (0xD << 4)
// enum TIM_CCMR1_IC1F_DTF_DIV_32_N_6 (0xE << 4)
// enum TIM_CCMR1_IC1F_DTF_DIV_32_N_8 (0xF << 4)
// enum TIM_CCMR1_IC1F_MASK (0xF << 4)
// enum TIM_CCMR1_IC1PSC_OFF (0x0 << 2)
// enum TIM_CCMR1_IC1PSC_2 (0x1 << 2)
// enum TIM_CCMR1_IC1PSC_4 (0x2 << 2)
// enum TIM_CCMR1_IC1PSC_8 (0x3 << 2)
// enum TIM_CCMR1_IC1PSC_MASK (0x3 << 2)
// enum TIM_CCMR2_OC4CE (1 << 15)
// enum TIM_CCMR2_OC4M_FROZEN (0x0 << 12)
// enum TIM_CCMR2_OC4M_ACTIVE (0x1 << 12)
// enum TIM_CCMR2_OC4M_INACTIVE (0x2 << 12)
// enum TIM_CCMR2_OC4M_TOGGLE (0x3 << 12)
// enum TIM_CCMR2_OC4M_FORCE_LOW (0x4 << 12)
// enum TIM_CCMR2_OC4M_FORCE_HIGH (0x5 << 12)
// enum TIM_CCMR2_OC4M_PWM1 (0x6 << 12)
// enum TIM_CCMR2_OC4M_PWM2 (0x7 << 12)
// enum TIM_CCMR2_OC4M_MASK (0x7 << 12)
// enum TIM_CCMR2_OC4PE (1 << 11)
// enum TIM_CCMR2_OC4FE (1 << 10)
// enum TIM_CCMR2_CC4S_OUT (0x0 << 8)
// enum TIM_CCMR2_CC4S_IN_TI4 (0x1 << 8)
// enum TIM_CCMR2_CC4S_IN_TI3 (0x2 << 8)
// enum TIM_CCMR2_CC4S_IN_TRC (0x3 << 8)
// enum TIM_CCMR2_CC4S_MASK (0x3 << 8)
// enum TIM_CCMR2_OC3CE (1 << 7)
// enum TIM_CCMR2_OC3M_FROZEN (0x0 << 4)
// enum TIM_CCMR2_OC3M_ACTIVE (0x1 << 4)
// enum TIM_CCMR2_OC3M_INACTIVE (0x2 << 4)
// enum TIM_CCMR2_OC3M_TOGGLE (0x3 << 4)
// enum TIM_CCMR2_OC3M_FORCE_LOW (0x4 << 4)
// enum TIM_CCMR2_OC3M_FORCE_HIGH (0x5 << 4)
// enum TIM_CCMR2_OC3M_PWM1 (0x6 << 4)
// enum TIM_CCMR2_OC3M_PWM2 (0x7 << 4)
// enum TIM_CCMR2_OC3M_MASK (0x7 << 4)
// enum TIM_CCMR2_OC3PE (1 << 3)
// enum TIM_CCMR2_OC3FE (1 << 2)
// enum TIM_CCMR2_CC3S_OUT (0x0 << 0)
// enum TIM_CCMR2_CC3S_IN_TI3 (0x1 << 0)
// enum TIM_CCMR2_CC3S_IN_TI4 (0x2 << 0)
// enum TIM_CCMR2_CC3S_IN_TRC (0x3 << 0)
// enum TIM_CCMR2_CC3S_MASK (0x3 << 0)
// enum TIM_CCMR2_IC4F_OFF (0x0 << 12)
// enum TIM_CCMR2_IC4F_CK_INT_N_2 (0x1 << 12)
// enum TIM_CCMR2_IC4F_CK_INT_N_4 (0x2 << 12)
// enum TIM_CCMR2_IC4F_CK_INT_N_8 (0x3 << 12)
// enum TIM_CCMR2_IC4F_DTF_DIV_2_N_6 (0x4 << 12)
// enum TIM_CCMR2_IC4F_DTF_DIV_2_N_8 (0x5 << 12)
// enum TIM_CCMR2_IC4F_DTF_DIV_4_N_6 (0x6 << 12)
// enum TIM_CCMR2_IC4F_DTF_DIV_4_N_8 (0x7 << 12)
// enum TIM_CCMR2_IC4F_DTF_DIV_8_N_6 (0x8 << 12)
// enum TIM_CCMR2_IC4F_DTF_DIV_8_N_8 (0x9 << 12)
// enum TIM_CCMR2_IC4F_DTF_DIV_16_N_5 (0xA << 12)
// enum TIM_CCMR2_IC4F_DTF_DIV_16_N_6 (0xB << 12)
// enum TIM_CCMR2_IC4F_DTF_DIV_16_N_8 (0xC << 12)
// enum TIM_CCMR2_IC4F_DTF_DIV_32_N_5 (0xD << 12)
// enum TIM_CCMR2_IC4F_DTF_DIV_32_N_6 (0xE << 12)
// enum TIM_CCMR2_IC4F_DTF_DIV_32_N_8 (0xF << 12)
// enum TIM_CCMR2_IC4F_MASK (0xF << 12)
// enum TIM_CCMR2_IC4PSC_OFF (0x0 << 10)
// enum TIM_CCMR2_IC4PSC_2 (0x1 << 10)
// enum TIM_CCMR2_IC4PSC_4 (0x2 << 10)
// enum TIM_CCMR2_IC4PSC_8 (0x3 << 10)
// enum TIM_CCMR2_IC4PSC_MASK (0x3 << 10)
// enum TIM_CCMR2_IC3F_OFF (0x0 << 4)
// enum TIM_CCMR2_IC3F_CK_INT_N_2 (0x1 << 4)
// enum TIM_CCMR2_IC3F_CK_INT_N_4 (0x2 << 4)
// enum TIM_CCMR2_IC3F_CK_INT_N_8 (0x3 << 4)
// enum TIM_CCMR2_IC3F_DTF_DIV_2_N_6 (0x4 << 4)
// enum TIM_CCMR2_IC3F_DTF_DIV_2_N_8 (0x5 << 4)
// enum TIM_CCMR2_IC3F_DTF_DIV_4_N_6 (0x6 << 4)
// enum TIM_CCMR2_IC3F_DTF_DIV_4_N_8 (0x7 << 4)
// enum TIM_CCMR2_IC3F_DTF_DIV_8_N_6 (0x8 << 4)
// enum TIM_CCMR2_IC3F_DTF_DIV_8_N_8 (0x9 << 4)
// enum TIM_CCMR2_IC3F_DTF_DIV_16_N_5 (0xA << 4)
// enum TIM_CCMR2_IC3F_DTF_DIV_16_N_6 (0xB << 4)
// enum TIM_CCMR2_IC3F_DTF_DIV_16_N_8 (0xC << 4)
// enum TIM_CCMR2_IC3F_DTF_DIV_32_N_5 (0xD << 4)
// enum TIM_CCMR2_IC3F_DTF_DIV_32_N_6 (0xE << 4)
// enum TIM_CCMR2_IC3F_DTF_DIV_32_N_8 (0xF << 4)
// enum TIM_CCMR2_IC3F_MASK (0xF << 4)
// enum TIM_CCMR2_IC3PSC_OFF (0x0 << 2)
// enum TIM_CCMR2_IC3PSC_2 (0x1 << 2)
// enum TIM_CCMR2_IC3PSC_4 (0x2 << 2)
// enum TIM_CCMR2_IC3PSC_8 (0x3 << 2)
// enum TIM_CCMR2_IC3PSC_MASK (0x3 << 2)
// enum TIM_CCER_CC4NP (1 << 15)
// enum TIM_CCER_CC4P (1 << 13)
// enum TIM_CCER_CC4E (1 << 12)
// enum TIM_CCER_CC3NP (1 << 11)
// enum TIM_CCER_CC3NE (1 << 10)
// enum TIM_CCER_CC3P (1 << 9)
// enum TIM_CCER_CC3E (1 << 8)
// enum TIM_CCER_CC2NP (1 << 7)
// enum TIM_CCER_CC2NE (1 << 6)
// enum TIM_CCER_CC2P (1 << 5)
// enum TIM_CCER_CC2E (1 << 4)
// enum TIM_CCER_CC1NP (1 << 3)
// enum TIM_CCER_CC1NE (1 << 2)
// enum TIM_CCER_CC1P (1 << 1)
// enum TIM_CCER_CC1E (1 << 0)
// enum TIM_BDTR_MOE (1 << 15)
// enum TIM_BDTR_AOE (1 << 14)
// enum TIM_BDTR_BKP (1 << 13)
// enum TIM_BDTR_BKE (1 << 12)
// enum TIM_BDTR_OSSR (1 << 11)
// enum TIM_BDTR_OSSI (1 << 10)
// enum TIM_BDTR_LOCK_OFF (0x0 << 8)
// enum TIM_BDTR_LOCK_LEVEL_1 (0x1 << 8)
// enum TIM_BDTR_LOCK_LEVEL_2 (0x2 << 8)
// enum TIM_BDTR_LOCK_LEVEL_3 (0x3 << 8)
// enum TIM_BDTR_LOCK_MASK (0x3 << 8)
// enum TIM_BDTR_DTG_MASK 0x00FF
// enum TIM_BDTR_DBL_MASK (0x1F << 8)
// enum TIM_BDTR_DBA_MASK (0x1F << 0)
enum tim_oc_id {
 TIM_OC1 = 0,
 TIM_OC1N,
 TIM_OC2,
 TIM_OC2N,
 TIM_OC3,
 TIM_OC3N,
 TIM_OC4,
};
enum tim_oc_mode {
 TIM_OCM_FROZEN,
 TIM_OCM_ACTIVE,
 TIM_OCM_INACTIVE,
 TIM_OCM_TOGGLE,
 TIM_OCM_FORCE_LOW,
 TIM_OCM_FORCE_HIGH,
 TIM_OCM_PWM1,
 TIM_OCM_PWM2,
};

enum tim_ic_id {TIM_IC1, TIM_IC2, TIM_IC3, TIM_IC4};

enum tim_ic_filter {
 TIM_IC_OFF,
 TIM_IC_CK_INT_N_2,
 TIM_IC_CK_INT_N_4,
 TIM_IC_CK_INT_N_8,
 TIM_IC_DTF_DIV_2_N_6,
 TIM_IC_DTF_DIV_2_N_8,
 TIM_IC_DTF_DIV_4_N_6,
 TIM_IC_DTF_DIV_4_N_8,
 TIM_IC_DTF_DIV_8_N_6,
 TIM_IC_DTF_DIV_8_N_8,
 TIM_IC_DTF_DIV_16_N_5,
 TIM_IC_DTF_DIV_16_N_6,
 TIM_IC_DTF_DIV_16_N_8,
 TIM_IC_DTF_DIV_32_N_5,
 TIM_IC_DTF_DIV_32_N_6,
 TIM_IC_DTF_DIV_32_N_8,
};
enum tim_ic_psc {
 TIM_IC_PSC_OFF,
 TIM_IC_PSC_2,
 TIM_IC_PSC_4,
 TIM_IC_PSC_8,
};
enum tim_ic_input {
 TIM_IC_OUT = 0,
 TIM_IC_IN_TI1 = 1,
 TIM_IC_IN_TI2 = 2,
 TIM_IC_IN_TRC = 3,
 TIM_IC_IN_TI3 = 5,
 TIM_IC_IN_TI4 = 6,
};
enum tim_et_pol {
 TIM_ET_RISING,
 TIM_ET_FALLING,
};

extern(C) extern void timer_reset(uint timer_peripheral);
extern(C) extern void timer_enable_irq(uint timer_peripheral, uint irq);
extern(C) extern void timer_disable_irq(uint timer_peripheral, uint irq);
extern(C) extern bool timer_interrupt_source(uint timer_peripheral, uint flag);
extern(C) extern bool timer_get_flag(uint timer_peripheral, uint flag);
extern(C) extern void timer_clear_flag(uint timer_peripheral, uint flag);
extern(C) extern void timer_set_mode(uint timer_peripheral, uint clock_div, uint alignment, uint direction);
extern(C) extern void timer_set_clock_division(uint timer_peripheral, uint clock_div);
extern(C) extern void timer_enable_preload(uint timer_peripheral);
extern(C) extern void timer_disable_preload(uint timer_peripheral);
extern(C) extern void timer_set_alignment(uint timer_peripheral, uint alignment);
extern(C) extern void timer_direction_up(uint timer_peripheral);
extern(C) extern void timer_direction_down(uint timer_peripheral);
extern(C) extern void timer_one_shot_mode(uint timer_peripheral);
extern(C) extern void timer_continuous_mode(uint timer_peripheral);
extern(C) extern void timer_update_on_any(uint timer_peripheral);
extern(C) extern void timer_update_on_overflow(uint timer_peripheral);
extern(C) extern void timer_enable_update_event(uint timer_peripheral);
extern(C) extern void timer_disable_update_event(uint timer_peripheral);
extern(C) extern void timer_enable_counter(uint timer_peripheral);
extern(C) extern void timer_disable_counter(uint timer_peripheral);
extern(C) extern void timer_set_output_idle_state(uint timer_peripheral, uint outputs);
extern(C) extern void timer_reset_output_idle_state(uint timer_peripheral, uint outputs);
extern(C) extern void timer_set_ti1_ch123_xor(uint timer_peripheral);
extern(C) extern void timer_set_ti1_ch1(uint timer_peripheral);
extern(C) extern void timer_set_master_mode(uint timer_peripheral, uint mode);
extern(C) extern void timer_set_dma_on_compare_event(uint timer_peripheral);
extern(C) extern void timer_set_dma_on_update_event(uint timer_peripheral);
extern(C) extern void timer_enable_compare_control_update_on_trigger(uint timer_peripheral);
extern(C) extern void timer_disable_compare_control_update_on_trigger(uint timer_peripheral);
extern(C) extern void timer_enable_preload_complementry_enable_bits(uint timer_peripheral);
extern(C) extern void timer_disable_preload_complementry_enable_bits(uint timer_peripheral);
extern(C) extern void timer_set_prescaler(uint timer_peripheral, uint value);
extern(C) extern void timer_set_repetition_counter(uint timer_peripheral, uint value);
extern(C) extern void timer_set_period(uint timer_peripheral, uint period);
extern(C) extern void timer_enable_oc_clear(uint timer_peripheral, tim_oc_id oc_id);
extern(C) extern void timer_disable_oc_clear(uint timer_peripheral, tim_oc_id oc_id);
extern(C) extern void timer_set_oc_fast_mode(uint timer_peripheral, tim_oc_id oc_id);
extern(C) extern void timer_set_oc_slow_mode(uint timer_peripheral, tim_oc_id oc_id);
extern(C) extern void timer_set_oc_mode(uint timer_peripheral, tim_oc_id oc_id, tim_oc_mode oc_mode);
extern(C) extern void timer_enable_oc_preload(uint timer_peripheral, tim_oc_id oc_id);
extern(C) extern void timer_disable_oc_preload(uint timer_peripheral, tim_oc_id oc_id);
extern(C) extern void timer_set_oc_polarity_high(uint timer_peripheral, tim_oc_id oc_id);
extern(C) extern void timer_set_oc_polarity_low(uint timer_peripheral, tim_oc_id oc_id);
extern(C) extern void timer_enable_oc_output(uint timer_peripheral, tim_oc_id oc_id);
extern(C) extern void timer_disable_oc_output(uint timer_peripheral, tim_oc_id oc_id);
extern(C) extern void timer_set_oc_idle_state_set(uint timer_peripheral, tim_oc_id oc_id);
extern(C) extern void timer_set_oc_idle_state_unset(uint timer_peripheral, tim_oc_id oc_id);
extern(C) extern void timer_set_oc_value(uint timer_peripheral, tim_oc_id oc_id, uint value);
extern(C) extern void timer_enable_break_main_output(uint timer_peripheral);
extern(C) extern void timer_disable_break_main_output(uint timer_peripheral);
extern(C) extern void timer_enable_break_automatic_output(uint timer_peripheral);
extern(C) extern void timer_disable_break_automatic_output(uint timer_peripheral);
extern(C) extern void timer_set_break_polarity_high(uint timer_peripheral);
extern(C) extern void timer_set_break_polarity_low(uint timer_peripheral);
extern(C) extern void timer_enable_break(uint timer_peripheral);
extern(C) extern void timer_disable_break(uint timer_peripheral);
extern(C) extern void timer_set_enabled_off_state_in_run_mode(uint timer_peripheral);
extern(C) extern void timer_set_disabled_off_state_in_run_mode(uint timer_peripheral);
extern(C) extern void timer_set_enabled_off_state_in_idle_mode(uint timer_peripheral);
extern(C) extern void timer_set_disabled_off_state_in_idle_mode(uint timer_peripheral);
extern(C) extern void timer_set_break_lock(uint timer_peripheral, uint lock);
extern(C) extern void timer_set_deadtime(uint timer_peripheral, uint deadtime);
extern(C) extern void timer_generate_event(uint timer_peripheral, uint event);
extern(C) extern uint timer_get_counter(uint timer_peripheral);
extern(C) extern void timer_set_counter(uint timer_peripheral, uint count);
extern(C) extern void timer_ic_set_filter(uint timer, tim_ic_id ic, tim_ic_filter flt);
extern(C) extern void timer_ic_set_prescaler(uint timer, tim_ic_id ic, tim_ic_psc psc);
extern(C) extern void timer_ic_set_input(uint timer, tim_ic_id ic, tim_ic_input inp);
extern(C) extern void timer_ic_enable(uint timer, tim_ic_id ic);
extern(C) extern void timer_ic_disable(uint timer, tim_ic_id ic);
extern(C) extern void timer_slave_set_filter(uint timer, tim_ic_filter flt);
extern(C) extern void timer_slave_set_prescaler(uint timer, tim_ic_psc psc);
extern(C) extern void timer_slave_set_polarity(uint timer, tim_et_pol pol);
extern(C) extern void timer_slave_set_mode(uint timer, ubyte mode);
extern(C) extern void timer_slave_set_trigger(uint timer, ubyte trigger);

enum tim_ic_pol {TIM_IC_RISING, TIM_IC_FALLING};

extern(C) extern void timer_ic_set_polarity(
                   uint timer, tim_ic_id ic, tim_ic_pol pol);

enum USART1 = USART1_BASE;
enum USART2 = USART2_BASE;
enum USART3 = USART3_BASE;
enum UART4 = UART4_BASE;
enum UART5 = UART5_BASE;
enum USART_PARITY_NONE = 0x00;
enum USART_PARITY_EVEN = USART_CR1_PCE;
enum USART_PARITY_ODD = USART_CR1_PS | USART_CR1_PCE;
enum USART_PARITY_MASK = USART_CR1_PS | USART_CR1_PCE;
enum USART_MODE_RX = USART_CR1_RE;
enum USART_MODE_TX = USART_CR1_TE;
enum USART_MODE_TX_RX = USART_CR1_RE | USART_CR1_TE;
enum USART_MODE_MASK = USART_CR1_RE | USART_CR1_TE;
enum USART_STOPBITS_1 = USART_CR2_STOPBITS_1;
enum USART_STOPBITS_0_5 = USART_CR2_STOPBITS_0_5;
enum USART_STOPBITS_2 = USART_CR2_STOPBITS_2;
enum USART_STOPBITS_1_5 = USART_CR2_STOPBITS_1_5;
enum USART_FLOWCONTROL_NONE = 0x00;
enum USART_FLOWCONTROL_RTS = USART_CR3_RTSE;
enum USART_FLOWCONTROL_CTS = USART_CR3_CTSE;
enum USART_FLOWCONTROL_RTS_CTS = USART_CR3_RTSE | USART_CR3_CTSE;
enum USART_FLOWCONTROL_MASK = USART_CR3_RTSE | USART_CR3_CTSE;

extern(C) extern void usart_set_baudrate(uint usart, uint baud);
extern(C) extern void usart_set_databits(uint usart, uint bits);
extern(C) extern void usart_set_stopbits(uint usart, uint stopbits);
extern(C) extern void usart_set_parity(uint usart, uint parity);
extern(C) extern void usart_set_mode(uint usart, uint mode);
extern(C) extern void usart_set_flow_control(uint usart, uint flowcontrol);
extern(C) extern void usart_enable(uint usart);
extern(C) extern void usart_disable(uint usart);
extern(C) extern void usart_send(uint usart, ushort data);
extern(C) extern ushort usart_recv(uint usart);
extern(C) extern void usart_wait_send_ready(uint usart);
extern(C) extern void usart_wait_recv_ready(uint usart);
extern(C) extern void usart_send_blocking(uint usart, ushort data);
extern(C) extern ushort usart_recv_blocking(uint usart);
extern(C) extern void usart_enable_rx_dma(uint usart);
extern(C) extern void usart_disable_rx_dma(uint usart);
extern(C) extern void usart_enable_tx_dma(uint usart);
extern(C) extern void usart_disable_tx_dma(uint usart);
extern(C) extern void usart_enable_rx_interrupt(uint usart);
extern(C) extern void usart_disable_rx_interrupt(uint usart);
extern(C) extern void usart_enable_tx_interrupt(uint usart);
extern(C) extern void usart_disable_tx_interrupt(uint usart);
extern(C) extern void usart_enable_error_interrupt(uint usart);
extern(C) extern void usart_disable_error_interrupt(uint usart);
extern(C) extern bool usart_get_flag(uint usart, uint flag);

// enum USART_SR(usart_base) () { return MMIO!uint((usart_base) + 0x00)
// enum USART1_SR USART_SR(USART1_BASE)
// enum USART2_SR USART_SR(USART2_BASE)
// enum USART3_SR USART_SR(USART3_BASE)
// enum UART4_SR USART_SR(UART4_BASE)
// enum UART5_SR USART_SR(UART5_BASE)
// enum USART_DR(usart_base) () { return MMIO!uint((usart_base) + 0x04)
// enum USART1_DR USART_DR(USART1_BASE)
// enum USART2_DR USART_DR(USART2_BASE)
// enum USART3_DR USART_DR(USART3_BASE)
// enum UART4_DR USART_DR(UART4_BASE)
// enum UART5_DR USART_DR(UART5_BASE)
// enum USART_BRR(usart_base) () { return MMIO!uint((usart_base) + 0x08)
// enum USART1_BRR USART_BRR(USART1_BASE)
// enum USART2_BRR USART_BRR(USART2_BASE)
// enum USART3_BRR USART_BRR(USART3_BASE)
// enum UART4_BRR USART_BRR(UART4_BASE)
// enum UART5_BRR USART_BRR(UART5_BASE)
// enum USART_CR1(usart_base) () { return MMIO!uint((usart_base) + 0x0c)
// enum USART1_CR1 USART_CR1(USART1_BASE)
// enum USART2_CR1 USART_CR1(USART2_BASE)
// enum USART3_CR1 USART_CR1(USART3_BASE)
// enum UART4_CR1 USART_CR1(UART4_BASE)
// enum UART5_CR1 USART_CR1(UART5_BASE)
// enum USART_CR2(usart_base) () { return MMIO!uint((usart_base) + 0x10)
// enum USART1_CR2 USART_CR2(USART1_BASE)
// enum USART2_CR2 USART_CR2(USART2_BASE)
// enum USART3_CR2 USART_CR2(USART3_BASE)
// enum UART4_CR2 USART_CR2(UART4_BASE)
// enum UART5_CR2 USART_CR2(UART5_BASE)
// enum USART_CR3(usart_base) () { return MMIO!uint((usart_base) + 0x14)
// enum USART1_CR3 USART_CR3(USART1_BASE)
// enum USART2_CR3 USART_CR3(USART2_BASE)
// enum USART3_CR3 USART_CR3(USART3_BASE)
// enum UART4_CR3 USART_CR3(UART4_BASE)
// enum UART5_CR3 USART_CR3(UART5_BASE)
// enum USART_GTPR(usart_base) () { return MMIO!uint((usart_base) + 0x18)
// enum USART1_GTPR USART_GTPR(USART1_BASE)
// enum USART2_GTPR USART_GTPR(USART2_BASE)
// enum USART3_GTPR USART_GTPR(USART3_BASE)
// enum UART4_GTPR USART_GTPR(UART4_BASE)
// enum UART5_GTPR USART_GTPR(UART5_BASE)

enum SART_SR_CTS = 1 << 9;
enum USART_SR_LBD = 1 << 8;
enum USART_SR_TXE = 1 << 7;
enum USART_SR_TC = 1 << 6;
enum USART_SR_RXNE = 1 << 5;
enum USART_SR_IDLE = 1 << 4;
enum USART_SR_ORE = 1 << 3;
enum USART_SR_NE = 1 << 2;
enum USART_SR_FE = 1 << 1;
enum USART_SR_PE = 1 << 0;
enum USART_DR_MASK = 0x1F;
enum USART_BRR_DIV_MANTISSA_MASK = 0xFFF << 4;
enum USART_BRR_DIV_FRACTION_MASK = 0xF;
enum USART_CR1_UE = 1 << 13;
enum USART_CR1_M = 1 << 12;
enum USART_CR1_WAKE = 1 << 11;
enum USART_CR1_PCE = 1 << 10;
enum USART_CR1_PS = 1 << 9;
enum USART_CR1_PEIE = 1 << 8;
enum USART_CR1_TXEIE = 1 << 7;
enum USART_CR1_TCIE = 1 << 6;
enum USART_CR1_RXNEIE = 1 << 5;
enum USART_CR1_IDLEIE = 1 << 4;
enum USART_CR1_TE = 1 << 3;
enum USART_CR1_RE = 1 << 2;
enum USART_CR1_RWU = 1 << 1;
enum USART_CR1_SBK = 1 << 0;
enum USART_CR2_LINEN = 1 << 14;
enum USART_CR2_STOPBITS_1 = 0x00 << 12;
enum USART_CR2_STOPBITS_0_5 = 0x01 << 12;
enum USART_CR2_STOPBITS_2 = 0x02 << 12;
enum USART_CR2_STOPBITS_1_5 = 0x03 << 12;
enum USART_CR2_STOPBITS_MASK = 0x03 << 12;
enum USART_CR2_STOPBITS_SHIFT = 12 ;
enum USART_CR2_CLKEN = 1 << 11;
enum USART_CR2_CPOL = 1 << 10;
enum USART_CR2_CPHA = 1 << 9;
enum USART_CR2_LBCL = 1 << 8;
enum USART_CR2_LBDIE = 1 << 6;
enum USART_CR2_LBDL = 1 << 5;
enum USART_CR2_ADD_MASK = 0xF;
enum USART_CR3_CTSIE = 1 << 10;
enum USART_CR3_CTSE = 1 << 9;
enum USART_CR3_RTSE = 1 << 8;
enum USART_CR3_DMAT = 1 << 7;
enum USART_CR3_DMAR = 1 << 6;
enum USART_CR3_SCEN = 1 << 5;
enum USART_CR3_NACK = 1 << 4;
enum USART_CR3_HDSEL = 1 << 3;
enum USART_CR3_IRLP = 1 << 2;
enum USART_CR3_IREN = 1 << 1;
enum USART_CR3_EIE = 1 << 0;
enum USART_GTPR_GT_MASK = 0xFF << 8;
enum USART_GTPR_PSC_MASK = 0xFF;

extern(C) extern void cm_enable_interrupts();
extern(C) extern void cm_disable_interrupts();
extern(C) extern void cm_enable_faults();
extern(C) extern void cm_disable_faults();
extern(C) extern bool cm_is_masked_interrupts();
extern(C) extern bool cm_is_masked_faults();
extern(C) extern uint cm_mask_interrupts(uint mask);
extern(C) extern uint cm_mask_faults(uint mask);
extern(C) extern uint __cm_atomic_set(uint* val);

// enum __CM_SAVER(state) __val = (state), __save __attribute__((__cleanup__(__cm_atomic_set))) = __cm_atomic_set(&__val)
// enum CM_ATOMIC_BLOCK() for (uint __CM_SAVER(true), __my = true; __my; __my = false)
// enum CM_ATOMIC_CONTEXT() uint __CM_SAVER(true)

ref uint STK_CSR() {return MMIO!uint(SYS_TICK_BASE + 0x00);}
ref uint STK_RVR() {return MMIO!uint(SYS_TICK_BASE + 0x04);}
ref uint STK_CVR() {return MMIO!uint(SYS_TICK_BASE + 0x08);}
ref uint STK_CALIB() {return MMIO!uint(SYS_TICK_BASE + 0x0C);}

enum STK_CSR_COUNTFLAG = 1 << 16;
enum STK_CSR_CLKSOURCE_LSB = 2;
enum STK_CSR_CLKSOURCE = 1 << STK_CSR_CLKSOURCE_LSB;
enum STK_CSR_CLKSOURCE_AHB_DIV8 = 0 << STK_CSR_CLKSOURCE_LSB;
enum STK_CSR_CLKSOURCE_AHB = 1 << STK_CSR_CLKSOURCE_LSB;
enum STK_CSR_TICKINT = 1 << 1;
enum STK_CSR_ENABLE = 1 << 0;
enum STK_RVR_RELOAD = 0x00FFFFFF;
enum STK_CVR_CURRENT = 0x00FFFFFF;
enum STK_CALIB_NOREF = 1 << 31;
enum STK_CALIB_SKEW = 1 << 30;
enum STK_CALIB_TENMS = 0x00FFFFFF;

extern(C) extern void systick_set_reload(uint value);
extern(C) extern bool systick_set_frequency(uint freq, uint ahb);
extern(C) extern uint systick_get_reload();
extern(C) extern uint systick_get_value();
extern(C) extern void systick_set_clocksource(ubyte clocksource);
extern(C) extern void systick_interrupt_enable();
extern(C) extern void systick_interrupt_disable();
extern(C) extern void systick_counter_enable();
extern(C) extern void systick_counter_disable();
extern(C) extern ubyte systick_get_countflag();
extern(C) extern void systick_clear();
extern(C) extern uint systick_get_calib();

// enum NVIC_ISER(iser_id) () {return MMIO!uint(NVIC_BASE + 0x00 + ((iser_id) * 4))
// enum NVIC_ICER(icer_id) () {return MMIO!uint(NVIC_BASE + 0x80 + ((icer_id) * 4))
// enum NVIC_ISPR(ispr_id) () {return MMIO!uint(NVIC_BASE + 0x100 + ((ispr_id) * 4))
// enum NVIC_ICPR(icpr_id) () {return MMIO!uint(NVIC_BASE + 0x180 + ((icpr_id) * 4))
// enum NVIC_IABR(iabr_id) () {return MMIO!uint(NVIC_BASE + 0x200 + ((iabr_id) * 4))
// enum NVIC_IPR(ipr_id) MMIO8(NVIC_BASE + 0x300 + (ipr_id))
// enum NVIC_STIR () {return MMIO!uint(STIR_BASE)

enum NVIC_NMI_IRQ = -14;
enum NVIC_HARD_FAULT_IRQ = -13;
enum NVIC_MEM_MANAGE_IRQ = -12;
enum NVIC_BUS_FAULT_IRQ = -11;
enum NVIC_USAGE_FAULT_IRQ = -10;
enum NVIC_SV_CALL_IRQ = -5;
enum DEBUG_MONITOR_IRQ = -4;
enum NVIC_PENDSV_IRQ = -2;
enum NVIC_SYSTICK_IRQ = -1;
enum NVIC_WWDG_IRQ = 0;
enum NVIC_PVD_IRQ = 1;
enum NVIC_TAMPER_IRQ = 2;
enum NVIC_RTC_IRQ = 3;
enum NVIC_FLASH_IRQ = 4;
enum NVIC_RCC_IRQ = 5;
enum NVIC_EXTI0_IRQ = 6;
enum NVIC_EXTI1_IRQ = 7;
enum NVIC_EXTI2_IRQ = 8;
enum NVIC_EXTI3_IRQ = 9;
enum NVIC_EXTI4_IRQ = 10;
enum NVIC_DMA1_CHANNEL1_IRQ = 11;
enum NVIC_DMA1_CHANNEL2_IRQ = 12;
enum NVIC_DMA1_CHANNEL3_IRQ = 13;
enum NVIC_DMA1_CHANNEL4_IRQ = 14;
enum NVIC_DMA1_CHANNEL5_IRQ = 15;
enum NVIC_DMA1_CHANNEL6_IRQ = 16;
enum NVIC_DMA1_CHANNEL7_IRQ = 17;
enum NVIC_ADC1_2_IRQ = 18;
enum NVIC_USB_HP_CAN_TX_IRQ = 19;
enum NVIC_USB_LP_CAN_RX0_IRQ = 20;
enum NVIC_CAN_RX1_IRQ = 21;
enum NVIC_CAN_SCE_IRQ = 22;
enum NVIC_EXTI9_5_IRQ = 23;
enum NVIC_TIM1_BRK_IRQ = 24;
enum NVIC_TIM1_UP_IRQ = 25;
enum NVIC_TIM1_TRG_COM_IRQ = 26;
enum NVIC_TIM1_CC_IRQ = 27;
enum NVIC_TIM2_IRQ = 28;
enum NVIC_TIM3_IRQ = 29;
enum NVIC_TIM4_IRQ = 30;
enum NVIC_I2C1_EV_IRQ = 31;
enum NVIC_I2C1_ER_IRQ = 32;
enum NVIC_I2C2_EV_IRQ = 33;
enum NVIC_I2C2_ER_IRQ = 34;
enum NVIC_SPI1_IRQ = 35;
enum NVIC_SPI2_IRQ = 36;
enum NVIC_USART1_IRQ = 37;
enum NVIC_USART2_IRQ = 38;
enum NVIC_USART3_IRQ = 39;
enum NVIC_EXTI15_10_IRQ = 40;
enum NVIC_RTC_ALARM_IRQ = 41;
enum NVIC_USB_WAKEUP_IRQ = 42;
enum NVIC_TIM8_BRK_IRQ = 43;
enum NVIC_TIM8_UP_IRQ = 44;
enum NVIC_TIM8_TRG_COM_IRQ = 45;
enum NVIC_TIM8_CC_IRQ = 46;
enum NVIC_ADC3_IRQ = 47;
enum NVIC_FSMC_IRQ = 48;
enum NVIC_SDIO_IRQ = 49;
enum NVIC_TIM5_IRQ = 50;
enum NVIC_SPI3_IRQ = 51;
enum NVIC_UART4_IRQ = 52;
enum NVIC_UART5_IRQ = 53;
enum NVIC_TIM6_IRQ = 54;
enum NVIC_TIM7_IRQ = 55;
enum NVIC_DMA2_CHANNEL1_IRQ = 56;
enum NVIC_DMA2_CHANNEL2_IRQ = 57;
enum NVIC_DMA2_CHANNEL3_IRQ = 58;
enum NVIC_DMA2_CHANNEL4_5_IRQ = 59;
enum NVIC_DMA2_CHANNEL5_IRQ = 60;
enum NVIC_ETH_IRQ = 61;
enum NVIC_ETH_WKUP_IRQ = 62;
enum NVIC_CAN2_TX_IRQ = 63;
enum NVIC_CAN2_RX0_IRQ = 64;
enum NVIC_CAN2_RX1_IRQ = 65;
enum NVIC_CAN2_SCE_IRQ = 66;
enum NVIC_OTG_FS_IRQ = 67;
enum NVIC_IRQ_COUNT = 68;

extern(C) extern void wwdg_isr();
extern(C) extern void pvd_isr();
extern(C) extern void tamper_isr();
extern(C) extern void rtc_isr();
extern(C) extern void flash_isr();
extern(C) extern void rcc_isr();
extern(C) extern void exti0_isr();
extern(C) extern void exti1_isr();
extern(C) extern void exti2_isr();
extern(C) extern void exti3_isr();
extern(C) extern void exti4_isr();
extern(C) extern void dma1_channel1_isr();
extern(C) extern void dma1_channel2_isr();
extern(C) extern void dma1_channel3_isr();
extern(C) extern void dma1_channel4_isr();
extern(C) extern void dma1_channel5_isr();
extern(C) extern void dma1_channel6_isr();
extern(C) extern void dma1_channel7_isr();
extern(C) extern void adc1_2_isr();
extern(C) extern void usb_hp_can_tx_isr();
extern(C) extern void usb_lp_can_rx0_isr();
extern(C) extern void can_rx1_isr();
extern(C) extern void can_sce_isr();
extern(C) extern void exti9_5_isr();
extern(C) extern void tim1_brk_isr();
extern(C) extern void tim1_up_isr();
extern(C) extern void tim1_trg_com_isr();
extern(C) extern void tim1_cc_isr();
extern(C) extern void tim2_isr();
extern(C) extern void tim3_isr();
extern(C) extern void tim4_isr();
extern(C) extern void i2c1_ev_isr();
extern(C) extern void i2c1_er_isr();
extern(C) extern void i2c2_ev_isr();
extern(C) extern void i2c2_er_isr();
extern(C) extern void spi1_isr();
extern(C) extern void spi2_isr();
extern(C) extern void usart1_isr();
extern(C) extern void usart2_isr();
extern(C) extern void usart3_isr();
extern(C) extern void exti15_10_isr();
extern(C) extern void rtc_alarm_isr();
extern(C) extern void usb_wakeup_isr();
extern(C) extern void tim8_brk_isr();
extern(C) extern void tim8_up_isr();
extern(C) extern void tim8_trg_com_isr();
extern(C) extern void tim8_cc_isr();
extern(C) extern void adc3_isr();
extern(C) extern void fsmc_isr();
extern(C) extern void sdio_isr();
extern(C) extern void tim5_isr();
extern(C) extern void spi3_isr();
extern(C) extern void uart4_isr();
extern(C) extern void uart5_isr();
extern(C) extern void tim6_isr();
extern(C) extern void tim7_isr();
extern(C) extern void dma2_channel1_isr();
extern(C) extern void dma2_channel2_isr();
extern(C) extern void dma2_channel3_isr();
extern(C) extern void dma2_channel4_5_isr();
extern(C) extern void dma2_channel5_isr();
extern(C) extern void eth_isr();
extern(C) extern void eth_wkup_isr();
extern(C) extern void can2_tx_isr();
extern(C) extern void can2_rx0_isr();
extern(C) extern void can2_rx1_isr();
extern(C) extern void can2_sce_isr();
extern(C) extern void otg_fs_isr();

extern(C) extern void nvic_enable_irq(ubyte irqn);
extern(C) extern void nvic_disable_irq(ubyte irqn);
extern(C) extern ubyte nvic_get_pending_irq(ubyte irqn);
extern(C) extern void nvic_set_pending_irq(ubyte irqn);
extern(C) extern void nvic_clear_pending_irq(ubyte irqn);
extern(C) extern ubyte nvic_get_irq_enabled(ubyte irqn);
extern(C) extern void nvic_set_priority(ubyte irqn, ubyte priority);
extern(C) extern ubyte nvic_get_active_irq(ubyte irqn);
extern(C) extern void nvic_generate_software_interrupt(ushort irqn);
extern(C) extern void reset_handler();
extern(C) extern void nmi_handler();
extern(C) extern void hard_fault_handler();
extern(C) extern void sv_call_handler();
extern(C) extern void pend_sv_handler();
extern(C) extern void sys_tick_handler();
extern(C) extern void mem_manage_handler();
extern(C) extern void bus_fault_handler();
extern(C) extern void usage_fault_handler();
extern(C) extern void debug_monitor_handler();

// enum SCB_CPUID () {return MMIO!uint(SCB_BASE + 0x00)
// enum SCB_ICSR () {return MMIO!uint(SCB_BASE + 0x04)
// enum SCB_VTOR () {return MMIO!uint(SCB_BASE + 0x08)
// enum SCB_AIRCR () {return MMIO!uint(SCB_BASE + 0x0C)
// enum SCB_SCR () {return MMIO!uint(SCB_BASE + 0x10)
// enum SCB_CCR () {return MMIO!uint(SCB_BASE + 0x14)
// enum SCB_SHPR(shpr_id) MMIO8(SCB_BASE + 0x18 + (shpr_id))

ref uint scb_shpr1 ()    {return MMIO!uint(SCB_BASE + 0x18);}
ref uint scb_shpr2 ()    {return MMIO!uint(SCB_BASE + 0x1C);}
ref uint scb_shpr3 ()    {return MMIO!uint(SCB_BASE + 0x20);}
ref uint scb_shcsr ()    {return MMIO!uint(SCB_BASE + 0x24);}
ref uint scb_dfsr ()     {return MMIO!uint(SCB_BASE + 0x30);}
ref uint scb_cfsr ()     {return MMIO!uint(SCB_BASE + 0x28);}
ref uint scb_hfsr ()     {return MMIO!uint(SCB_BASE + 0x2C);}
ref uint scb_mmfar ()    {return MMIO!uint(SCB_BASE + 0x34);}
ref uint scb_bfar ()     {return MMIO!uint(SCB_BASE + 0x38);}
ref uint scb_afsr ()     {return MMIO!uint(SCB_BASE + 0x3C);}
ref uint scb_id_pfr0 ()  {return MMIO!uint(SCB_BASE + 0x40);}
ref uint scb_id_pfr1 ()  {return MMIO!uint(SCB_BASE + 0x44);}
ref uint scb_id_dfr0 ()  {return MMIO!uint(SCB_BASE + 0x48);}
ref uint scb_id_afr0 ()  {return MMIO!uint(SCB_BASE + 0x4C);}
ref uint scb_id_mmfR0 () {return MMIO!uint(SCB_BASE + 0x50);}
ref uint scb_id_mmfR1 () {return MMIO!uint(SCB_BASE + 0x54);}
ref uint scb_id_mmfR2 () {return MMIO!uint(SCB_BASE + 0x58);}
ref uint scb_id_mmfR3 () {return MMIO!uint(SCB_BASE + 0x5C);}
ref uint scb_id_isaR0 () {return MMIO!uint(SCB_BASE + 0x60);}
ref uint scb_id_isaR1 () {return MMIO!uint(SCB_BASE + 0x64);}
ref uint scb_id_isaR2 () {return MMIO!uint(SCB_BASE + 0x68);}
ref uint scb_id_isaR3 () {return MMIO!uint(SCB_BASE + 0x6C);}
ref uint scb_id_isaR4 () {return MMIO!uint(SCB_BASE + 0x70);}
ref uint scb_cpacr ()    {return MMIO!uint(SCB_BASE + 0x88);}
ref uint scb_fpccr ()   {return MMIO!uint(SCB_BASE + 0x234);}
ref uint scb_fpcar ()   {return MMIO!uint(SCB_BASE + 0x238);}
ref uint scb_fpdscr ()  {return MMIO!uint(SCB_BASE + 0x23C);}
ref uint scb_mvfr0 ()   {return MMIO!uint(SCB_BASE + 0x240);}
ref uint scb_mvfr1 ()   {return MMIO!uint(SCB_BASE + 0x244);}

// enum SCB_CPUID_IMPLEMENTER_LSB 24
// enum SCB_CPUID_IMPLEMENTER (0xFF << SCB_CPUID_IMPLEMENTER_LSB)
// enum SCB_CPUID_VARIANT_LSB 20
// enum SCB_CPUID_VARIANT (0xF << SCB_CPUID_VARIANT_LSB)
// enum SCB_CPUID_CONSTANT_LSB 16
// enum SCB_CPUID_CONSTANT (0xF << SCB_CPUID_CONSTANT_LSB)
// enum SCB_CPUID_CONSTANT_ARMV6 (0xC << SCB_CPUID_CONSTANT_LSB)
// enum SCB_CPUID_CONSTANT_ARMV7 (0xF << SCB_CPUID_CONSTANT_LSB)
// enum SCB_CPUID_PARTNO_LSB 4
// enum SCB_CPUID_PARTNO (0xFFF << SCB_CPUID_PARTNO_LSB)
// enum SCB_CPUID_REVISION_LSB 0
// enum SCB_CPUID_REVISION (0xF << SCB_CPUID_REVISION_LSB)
// enum SCB_ICSR_NMIPENDSET (1 << 31)
// enum SCB_ICSR_PENDSVSET (1 << 28)
// enum SCB_ICSR_PENDSVCLR (1 << 27)
// enum SCB_ICSR_PENDSTSET (1 << 26)
// enum SCB_ICSR_PENDSTCLR (1 << 25)
// enum SCB_ICSR_ISRPREEMPT (1 << 23)
// enum SCB_ICSR_ISRPENDING (1 << 22)
// enum SCB_ICSR_VECTPENDING_LSB 12
// enum SCB_ICSR_VECTPENDING (0x1FF << SCB_ICSR_VECTPENDING_LSB)
// enum SCB_ICSR_RETOBASE (1 << 11)
// enum SCB_ICSR_VECTACTIVE_LSB 0
// enum SCB_ICSR_VECTACTIVE (0x1FF << SCB_ICSR_VECTACTIVE_LSB)
// enum SCB_VTOR_TBLOFF_LSB 9
// enum SCB_VTOR_TBLOFF (0x7FFFFF << SCB_VTOR_TBLOFF_LSB)
// enum SCB_AIRCR_VECTKEYSTAT_LSB 16
// enum SCB_AIRCR_VECTKEYSTAT (0xFFFF << SCB_AIRCR_VECTKEYSTAT_LSB)
// enum SCB_AIRCR_VECTKEY (0x05FA << SCB_AIRCR_VECTKEYSTAT_LSB)
// enum SCB_AIRCR_ENDIANESS (1 << 15)
// enum SCB_AIRCR_PRIGROUP_GROUP16_NOSUB (0x3 << 8)
// enum SCB_AIRCR_PRIGROUP_GROUP8_SUB2 (0x4 << 8)
// enum SCB_AIRCR_PRIGROUP_GROUP4_SUB4 (0x5 << 8)
// enum SCB_AIRCR_PRIGROUP_GROUP2_SUB8 (0x6 << 8)
// enum SCB_AIRCR_PRIGROUP_NOGROUP_SUB16 (0x7 << 8)
// enum SCB_AIRCR_PRIGROUP_MASK (0x7 << 8)
// enum SCB_AIRCR_PRIGROUP_SHIFT 8
// enum SCB_AIRCR_SYSRESETREQ (1 << 2)
// enum SCB_AIRCR_VECTCLRACTIVE (1 << 1)
// enum SCB_AIRCR_VECTRESET (1 << 0)
// enum SCB_SCR_SEVONPEND (1 << 4)
// enum SCB_SCR_SLEEPDEEP (1 << 2)
// enum SCB_SCR_SLEEPONEXIT (1 << 1)
// enum SCB_CCR_STKALIGN (1 << 9)
// enum SCB_CCR_BFHFNMIGN (1 << 8)
// enum SCB_CCR_DIV_0_TRP (1 << 4)
// enum SCB_CCR_UNALIGN_TRP (1 << 3)
// enum SCB_CCR_USERSETMPEND (1 << 1)
// enum SCB_CCR_NONBASETHRDENA (1 << 0)
// enum SCB_SHPR_PRI_4_MEMMANAGE 0
// enum SCB_SHPR_PRI_5_BUSFAULT 1
// enum SCB_SHPR_PRI_6_USAGEFAULT 2
// enum SCB_SHPR_PRI_7_RESERVED 3
// enum SCB_SHPR_PRI_8_RESERVED 4
// enum SCB_SHPR_PRI_9_RESERVED 5
// enum SCB_SHPR_PRI_10_RESERVED 6
// enum SCB_SHPR_PRI_11_SVCALL 7
// enum SCB_SHPR_PRI_12_RESERVED 8
// enum SCB_SHPR_PRI_13_RESERVED 9
// enum SCB_SHPR_PRI_14_PENDSV 10
// enum SCB_SHPR_PRI_15_SYSTICK 11
// enum SCB_SHCSR_USGFAULTENA (1 << 18)
// enum SCB_SHCSR_BUSFAULTENA (1 << 17)
// enum SCB_SHCSR_MEMFAULTENA (1 << 16)
// enum SCB_SHCSR_SVCALLPENDED (1 << 15)
// enum SCB_SHCSR_BUSFAULTPENDED (1 << 14)
// enum SCB_SHCSR_MEMFAULTPENDED (1 << 13)
// enum SCB_SHCSR_USGFAULTPENDED (1 << 12)
// enum SCB_SHCSR_SYSTICKACT (1 << 11)
// enum SCB_SHCSR_PENDSVACT (1 << 10)
// enum SCB_SHCSR_MONITORACT (1 << 8)
// enum SCB_SHCSR_SVCALLACT (1 << 7)
// enum SCB_SHCSR_USGFAULTACT (1 << 3)
// enum SCB_SHCSR_BUSFAULTACT (1 << 1)
// enum SCB_SHCSR_MEMFAULTACT (1 << 0)
// enum SCB_CFSR_DIVBYZERO (1 << 25)
// enum SCB_CFSR_UNALIGNED (1 << 24)
// enum SCB_CFSR_NOCP (1 << 19)
// enum SCB_CFSR_INVPC (1 << 18)
// enum SCB_CFSR_INVSTATE (1 << 17)
// enum SCB_CFSR_UNDEFINSTR (1 << 16)
// enum SCB_CFSR_BFARVALID (1 << 15)
// enum SCB_CFSR_STKERR (1 << 12)
// enum SCB_CFSR_UNSTKERR (1 << 11)
// enum SCB_CFSR_IMPRECISERR (1 << 10)
// enum SCB_CFSR_PRECISERR (1 << 9)
// enum SCB_CFSR_IBUSERR (1 << 8)
// enum SCB_CFSR_MMARVALID (1 << 7)
// enum SCB_CFSR_MSTKERR (1 << 4)
// enum SCB_CFSR_MUNSTKERR (1 << 3)
// enum SCB_CFSR_DACCVIOL (1 << 1)
// enum SCB_CFSR_IACCVIOL (1 << 0)
// enum SCB_HFSR_DEBUG_VT (1 << 31)
// enum SCB_HFSR_FORCED (1 << 30)
// enum SCB_HFSR_VECTTBL (1 << 1)
// enum SCB_CPACR_NONE 0
// enum SCB_CPACR_PRIV 1
// enum SCB_CPACR_FULL 3
// enum SCB_CPACR_CP10 (1 << 20)
// enum SCB_CPACR_CP11 (1 << 22)
//
// struct scb_exception_stack_frame {
//  uint r0;
//  uint r1;
//  uint r2;
//  uint r3;
//  uint r12;
//  uint lr;
//  uint pc;
//  uint xpsr;
// } __attribute__((packed));
// enum SCB_GET_EXCEPTION_STACK_FRAME(f) do { asm volatile ("mov %[frameptr], sp" : [frameptr]"=r" (f)); } while (0)
// void scb_reset_system() __attribute__((noreturn, naked));
// void scb_reset_core() __attribute__((noreturn, naked));
// void scb_set_priority_grouping(uint prigroup);
//
// enum __INLINE inline
// enum __STATIC_INLINE static inline
// enum __IO volatile
// enum __O volatile
// enum __I volatile
// enum SCB_SCR_SLEEPDEEP_Msk SCB_SCR_SLEEPDEEP
// typedef struct {
//  volatile uint CPUID;
//  volatile uint ICSR;
//  volatile uint VTOR;
//  volatile uint AIRCR;
//  volatile uint SCR;
//  volatile uint CCR;
//  volatile ubyte SHPR[12];
//  volatile uint SHCSR;
// } SCB_TypeDef;
// enum SCB ((SCB_TypeDef *) SCB_BASE)
// enum __WFI() __asm__("wfi")
// enum __CLZ(div) __builtin_clz(div)
// enum __REV(x) __builtin_bswap32(x)
// typedef struct {
//  uint DHCSR;
//  uint DEMCR;
// } CoreDebug_TypeDef;
// enum CoreDebug ((CoreDebug_TypeDef *) 0)
// enum CoreDebug_DHCSR_C_DEBUGEN_Msk 0
// enum CoreDebug_DEMCR_TRCENA_Msk 0
// static inline void NVIC_ClearPendingIRQ(ubyte irqn)
// {
//  nvic_clear_pending_irq(irqn);
// }
// static inline void NVIC_EnableIRQ(ubyte irqn)
// {
//  nvic_enable_irq(irqn);
// }
// static inline void NVIC_DisableIRQ(ubyte irqn)
// {
//  nvic_disable_irq(irqn);
// }
// static inline void __enable_irq()
// {
//  cm_enable_interrupts();
// }
// static inline void __disable_irq()
// {
//  cm_disable_interrupts();
// }
// enum SCB_SHCSR_MEMFAULTENA_Msk 0
// typedef struct {
//  uint CTRL;
//  uint RNR;
//  uint RBAR;
//  uint RASR;
// } MPU_TypeDef;
// enum MPU ((MPU_TypeDef *) 0)
// enum MPU_CTRL_ENABLE_Msk 0
// enum MPU_RASR_XN_Pos 0
// enum MPU_RASR_AP_Pos 0
// enum MPU_RASR_TEX_Pos 0
// enum MPU_RASR_S_Pos 0
// enum MPU_RASR_C_Pos 0
// enum MPU_RASR_B_Pos 0
// enum MPU_RASR_SRD_Pos 0
// enum MPU_RASR_SIZE_Pos 0
// enum MPU_RASR_ENABLE_Pos 0
// typedef struct {
//  uint CTRL;
//  uint LOAD;
//  uint VAL;
//  uint CALIB;
// } SysTick_TypeDef;
// enum SysTick ((SysTick_TypeDef *) SYS_TICK_BASE)
// static inline uint SysTick_Config(uint n_ticks)
// {
//  if (n_ticks & ~0x00FFFFFF) {
//   return 1;
//  }
//  systick_set_reload(n_ticks);
//  systick_set_clocksource(1);
//  systick_interrupt_enable();
//  systick_counter_enable();
//  return 0;
// }
// typedef struct {
//  uint LAR;
//  uint TCR;
// } ITM_TypeDef;
// enum ITM ((ITM_TypeDef *) 0)
// enum SysTick_Handler sys_tick_handler
// enum WWDG_IRQHandler wwdg_isr
// enum PVD_IRQHandler pvd_isr
// enum TAMPER_IRQHandler tamper_isr
// enum RTC_IRQHandler rtc_isr
// enum FLASH_IRQHandler flash_isr
// enum RCC_IRQHandler rcc_isr
// enum EXTI0_IRQHandler exti0_isr
// enum EXTI1_IRQHandler exti1_isr
// enum EXTI2_IRQHandler exti2_isr
// enum EXTI3_IRQHandler exti3_isr
// enum EXTI4_IRQHandler exti4_isr

// enum DMA1_CHANNEL1_IRQHandler dma1_channel1_isr
// enum DMA1_CHANNEL2_IRQHandler dma1_channel2_isr
// enum DMA1_CHANNEL3_IRQHandler dma1_channel3_isr
// enum DMA1_CHANNEL4_IRQHandler dma1_channel4_isr
// enum DMA1_CHANNEL5_IRQHandler dma1_channel5_isr
// enum DMA1_CHANNEL6_IRQHandler dma1_channel6_isr
// enum DMA1_CHANNEL7_IRQHandler dma1_channel7_isr
// enum ADC1_2_IRQHandler adc1_2_isr
// enum USB_HP_CAN_TX_IRQHandler usb_hp_can_tx_isr
// enum USB_LP_CAN_RX0_IRQHandler usb_lp_can_rx0_isr
// enum CAN_RX1_IRQHandler can_rx1_isr
// enum CAN_SCE_IRQHandler can_sce_isr
// enum EXTI9_5_IRQHandler exti9_5_isr
// enum TIM1_BRK_IRQHandler tim1_brk_isr
// enum TIM1_UP_IRQHandler tim1_up_isr
// enum TIM1_TRG_COM_IRQHandler tim1_trg_com_isr
// enum TIM1_CC_IRQHandler tim1_cc_isr
// enum TIM2_IRQHandler tim2_isr
// enum TIM3_IRQHandler tim3_isr
// enum TIM4_IRQHandler tim4_isr
// enum I2C1_EV_IRQHandler i2c1_ev_isr
// enum I2C1_ER_IRQHandler i2c1_er_isr
// enum I2C2_EV_IRQHandler i2c2_ev_isr
// enum I2C2_ER_IRQHandler i2c2_er_isr
// enum SPI1_IRQHandler spi1_isr
// enum SPI2_IRQHandler spi2_isr
// enum USART1_IRQHandler usart1_isr
// enum USART2_IRQHandler usart2_isr
// enum USART3_IRQHandler usart3_isr
// enum EXTI15_10_IRQHandler exti15_10_isr
// enum RTC_ALARM_IRQHandler rtc_alarm_isr
// enum USB_WAKEUP_IRQHandler usb_wakeup_isr
// enum TIM8_BRK_IRQHandler tim8_brk_isr
// enum TIM8_UP_IRQHandler tim8_up_isr
// enum TIM8_TRG_COM_IRQHandler tim8_trg_com_isr
// enum TIM8_CC_IRQHandler tim8_cc_isr
// enum ADC3_IRQHandler adc3_isr
// enum FSMC_IRQHandler fsmc_isr
// enum SDIO_IRQHandler sdio_isr
// enum TIM5_IRQHandler tim5_isr
// enum SPI3_IRQHandler spi3_isr
// enum UART4_IRQHandler uart4_isr
// enum UART5_IRQHandler uart5_isr
// enum TIM6_IRQHandler tim6_isr
// enum TIM7_IRQHandler tim7_isr
// enum DMA2_CHANNEL1_IRQHandler dma2_channel1_isr
// enum DMA2_CHANNEL2_IRQHandler dma2_channel2_isr
// enum DMA2_CHANNEL3_IRQHandler dma2_channel3_isr
// enum DMA2_CHANNEL4_5_IRQHandler dma2_channel4_5_isr
// enum DMA2_CHANNEL5_IRQHandler dma2_channel5_isr
// enum ETH_IRQHandler eth_isr
// enum ETH_WKUP_IRQHandler eth_wkup_isr
// enum CAN2_TX_IRQHandler can2_tx_isr
// enum CAN2_RX0_IRQHandler can2_rx0_isr
// enum CAN2_RX1_IRQHandler can2_rx1_isr
// enum CAN2_SCE_IRQHandler can2_sce_isr
// enum OTG_FS_IRQHandler otg_fs_isr
// enum LIBOPENCM3_CM3_DWT_H
// enum DWT_CTRL () {return MMIO!uint(DWT_BASE + 0x00)
// enum DWT_CYCCNT () {return MMIO!uint(DWT_BASE + 0x04)
// enum DWT_CPICNT () {return MMIO!uint(DWT_BASE + 0x08)
// enum DWT_EXCCNT () {return MMIO!uint(DWT_BASE + 0x0C)
// enum DWT_SLEEPCNT () {return MMIO!uint(DWT_BASE + 0x10)
// enum DWT_LSUCNT () {return MMIO!uint(DWT_BASE + 0x14)
// enum DWT_FOLDCNT () {return MMIO!uint(DWT_BASE + 0x18)
// enum DWT_PCSR () {return MMIO!uint(DWT_BASE + 0x1C)
// enum DWT_COMP(n) () {return MMIO!uint(DWT_BASE + 0x20 + (n) * 16)
// enum DWT_MASK(n) () {return MMIO!uint(DWT_BASE + 0x24 + (n) * 16)
// enum DWT_FUNCTION(n) () {return MMIO!uint(DWT_BASE + 0x28 + (n) * 16)
// enum DWT_CTRL_NUMCOMP_SHIFT 28
// enum DWT_CTRL_NUMCOMP (0x0F << DWT_CTRL_NUMCOMP_SHIFT)
// enum DWT_CTRL_NOTRCPKT (1 << 27)
// enum DWT_CTRL_NOEXTTRIG (1 << 26)
// enum DWT_CTRL_NOCYCCNT (1 << 25)
// enum DWT_CTRL_NOPRFCCNT (1 << 24)
// enum DWT_CTRL_CYCEVTENA (1 << 22)
// enum DWT_CTRL_FOLDEVTENA (1 << 21)
// enum DWT_CTRL_LSUEVTENA (1 << 20)
// enum DWT_CTRL_SLEEPEVTENA (1 << 19)
// enum DWT_CTRL_EXCEVTENA (1 << 18)
// enum DWT_CTRL_CPIEVTENA (1 << 17)
// enum DWT_CTRL_EXCTRCENA (1 << 16)
// enum DWT_CTRL_PCSAMPLENA (1 << 12)
// enum DWT_CTRL_SYNCTAP_SHIFT 10
// enum DWT_CTRL_SYNCTAP (3 << DWT_CTRL_SYNCTAP_SHIFT)
// enum DWT_CTRL_SYNCTAP_DISABLED (0 << DWT_CTRL_SYNCTAP_SHIFT)
// enum DWT_CTRL_SYNCTAP_BIT24 (1 << DWT_CTRL_SYNCTAP_SHIFT)
// enum DWT_CTRL_SYNCTAP_BIT26 (2 << DWT_CTRL_SYNCTAP_SHIFT)
// enum DWT_CTRL_SYNCTAP_BIT28 (3 << DWT_CTRL_SYNCTAP_SHIFT)
// enum DWT_CTRL_CYCTAP (1 << 9)
// enum DWT_CTRL_POSTCNT_SHIFT 5
// enum DWT_CTRL_POSTCNT (0x0F << DWT_CTRL_POSTCNT_SHIFT)
// enum DWT_CTRL_POSTPRESET_SHIFT 1
// enum DWT_CTRL_POSTPRESET (0x0F << DWT_CTRL_POSTPRESET_SHIFT)
// enum DWT_CTRL_CYCCNTENA (1 << 0)
// enum DWT_MASKx_MASK 0x0F
// enum DWT_FUNCTIONx_MATCHED (1 << 24)
// enum DWT_FUNCTIONx_DATAVADDR1_SHIFT 16
// enum DWT_FUNCTIONx_DATAVADDR1 (15 << DWT_FUNCTIONx_DATAVADDR1_SHIFT)
// enum DWT_FUNCTIONx_DATAVADDR0_SHIFT 12
// enum DWT_FUNCTIONx_DATAVADDR0 (15 << DWT_FUNCTIONx_DATAVADDR0_SHIFT)
// enum DWT_FUNCTIONx_DATAVSIZE_SHIFT 10
// enum DWT_FUNCTIONx_DATAVSIZE (3 << DWT_FUNCTIONx_DATAVSIZE_SHIFT)
// enum DWT_FUNCTIONx_DATAVSIZE_BYTE (0 << DWT_FUNCTIONx_DATAVSIZE_SHIFT)
// enum DWT_FUNCTIONx_DATAVSIZE_HALF (1 << DWT_FUNCTIONx_DATAVSIZE_SHIFT)
// enum DWT_FUNCTIONx_DATAVSIZE_WORD (2 << DWT_FUNCTIONx_DATAVSIZE_SHIFT)
// enum DWT_FUNCTIONx_LNK1ENA (1 << 9)
// enum DWT_FUNCTIONx_DATAVMATCH (1 << 8)
// enum DWT_FUNCTIONx_CYCMATCH (1 << 7)
// enum DWT_FUNCTIONx_EMITRANGE (1 << 5)
// enum DWT_FUNCTIONx_FUNCTION 15
// enum DWT_FUNCTIONx_FUNCTION_DISABLED 0

extern(C) extern bool dwt_enable_cycle_counter();
extern(C) extern uint dwt_read_cycle_counter();
