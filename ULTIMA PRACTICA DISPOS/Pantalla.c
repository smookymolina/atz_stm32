
#include <built_in.h>

unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_DataPort_B0 at GPIOF_ODR.B12;
sbit TFT_DataPort_B1 at GPIOD_ODR.B15;
sbit TFT_DataPort_B2 at GPIOF_ODR.B15;
sbit TFT_DataPort_B3 at GPIOE_ODR.B13;
sbit TFT_DataPort_B4 at GPIOF_ODR.B14;
sbit TFT_DataPort_B5 at GPIOE_ODR.B11;
sbit TFT_DataPort_B6 at GPIOE_ODR.B9;
sbit TFT_DataPort_B7 at GPIOF_ODR.B13;

sbit TFT_RST at GPIOF_ODR.B5;
sbit TFT_CS at GPIOF_ODR.B3;
sbit TFT_RS at GPIOC_ODR.B3;
sbit TFT_WR at GPIOC_ODR.B0;
sbit TFT_RD at GPIOA_ODR.B3;

void TFT_Set_Index_Custom(unsigned short index) {
unsigned int temp;
  TFT_RS = 0;

  // Write to port
  //temp = TFT_DataPort;
  //temp &= 0xFF00;
//  TFT_DataPort = index | temp;
  temp = index;
  TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
  TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
  TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
  TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
  TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
  TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
  TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
  TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
  // Strobe
  TFT_WR = 0;
  asm nop;
  TFT_WR = 1;
}

void TFT_Write_Command_Custom(unsigned short cmd) {
unsigned int temp;
  TFT_RS = 1;

  // Write to port
  //temp = TFT_DataPort;
  //temp &= 0xFF00;
  //TFT_DataPort = cmd | temp;
  temp = cmd;
  TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
  TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
  TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
  TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
  TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
  TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
  TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
  TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
  // Strobe
  TFT_WR = 0;
  asm nop;
  TFT_WR = 1;
}

void TFT_Write_Data_Custom(unsigned int _data) {
unsigned int temp;
  TFT_RS = 1;

  // Write to port
  //temp = TFT_DataPort;
  //temp &= 0xFF00;
  //TFT_DataPort = Hi(_data) | temp;
  temp = Hi(_data);
  TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
  TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
  TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
  TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
  TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
  TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
  TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
  TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
  // Strobe
  TFT_WR = 0;
  asm nop;
  TFT_WR = 1;

  // Write to port
  //temp = TFT_DataPort;
  //temp &= 0xFF00;
  //TFT_DataPort = Lo(_data) | temp;

  temp = Lo(_data);
  TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
  TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
  TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
  TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
  TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
  TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
  TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
  TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
  // Strobe
  TFT_WR = 0;
  asm nop;
  TFT_WR = 1;
}

void InitPantalla(){
   GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_3,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
   GPIO_Config(&GPIOF_BASE, _GPIO_PINMASK_13 |_GPIO_PINMASK_3 | _GPIO_PINMASK_5 | _GPIO_PINMASK_12 | _GPIO_PINMASK_15 | _GPIO_PINMASK_14,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
   GPIO_Config(&GPIOC_BASE,_GPIO_PINMASK_0 | _GPIO_PINMASK_3  ,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
   GPIO_Config(&GPIOE_BASE,_GPIO_PINMASK_13 | _GPIO_PINMASK_11 | _GPIO_PINMASK_9 ,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
   GPIO_Config(&GPIOD_BASE,_GPIO_PINMASK_15 ,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
   GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_3);
   GPIO_Digital_Output(&GPIOF_BASE,_GPIO_PINMASK_13 |_GPIO_PINMASK_3 | _GPIO_PINMASK_5 | _GPIO_PINMASK_12 | _GPIO_PINMASK_15 | _GPIO_PINMASK_14);
   GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_3 );
   GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_13 | _GPIO_PINMASK_11 | _GPIO_PINMASK_9);
   GPIO_Digital_Output(&GPIOD_BASE,_GPIO_PINMASK_15 );
   TFT_Set_Active(&TFT_Set_Index_Custom, &TFT_Write_Command_Custom, &TFT_Write_Data_Custom);
   TFT_Init_ILI9341_8bit_Custom(240, 320);
}