_TFT_Set_Index_Custom:
;Pantalla.c,20 :: 		void TFT_Set_Index_Custom(unsigned short index) {
; index start address is: 0 (R0)
UXTB	R2, R0
; index end address is: 0 (R0)
; index start address is: 8 (R2)
;Pantalla.c,22 :: 		TFT_RS = 0;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
;Pantalla.c,28 :: 		temp = index;
; temp start address is: 0 (R0)
UXTB	R0, R2
; index end address is: 8 (R2)
;Pantalla.c,29 :: 		TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
AND	R2, R0, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;Pantalla.c,30 :: 		TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
AND	R1, R0, #2
UXTH	R1, R1
LSRS	R2, R1, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
_SX	[R1, ByteOffset(GPIOD_ODR+0)]
;Pantalla.c,31 :: 		TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
AND	R1, R0, #4
UXTH	R1, R1
LSRS	R2, R1, #2
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;Pantalla.c,32 :: 		TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
AND	R1, R0, #8
UXTH	R1, R1
LSRS	R2, R1, #3
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
_SX	[R1, ByteOffset(GPIOE_ODR+0)]
;Pantalla.c,33 :: 		TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
AND	R1, R0, #16
UXTH	R1, R1
LSRS	R2, R1, #4
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;Pantalla.c,34 :: 		TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
AND	R1, R0, #32
UXTH	R1, R1
LSRS	R2, R1, #5
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
_SX	[R1, ByteOffset(GPIOE_ODR+0)]
;Pantalla.c,35 :: 		TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
AND	R1, R0, #64
UXTH	R1, R1
LSRS	R2, R1, #6
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
_SX	[R1, ByteOffset(GPIOE_ODR+0)]
;Pantalla.c,36 :: 		TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
AND	R1, R0, #128
UXTH	R1, R1
; temp end address is: 0 (R0)
LSRS	R2, R1, #7
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;Pantalla.c,38 :: 		TFT_WR = 0;
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
;Pantalla.c,39 :: 		asm nop;
NOP
;Pantalla.c,40 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
;Pantalla.c,41 :: 		}
L_end_TFT_Set_Index_Custom:
BX	LR
; end of _TFT_Set_Index_Custom
_TFT_Write_Command_Custom:
;Pantalla.c,43 :: 		void TFT_Write_Command_Custom(unsigned short cmd) {
; cmd start address is: 0 (R0)
UXTB	R3, R0
; cmd end address is: 0 (R0)
; cmd start address is: 12 (R3)
;Pantalla.c,45 :: 		TFT_RS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
;Pantalla.c,51 :: 		temp = cmd;
; temp start address is: 0 (R0)
UXTB	R0, R3
; cmd end address is: 12 (R3)
;Pantalla.c,52 :: 		TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
AND	R2, R0, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;Pantalla.c,53 :: 		TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
AND	R1, R0, #2
UXTH	R1, R1
LSRS	R2, R1, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
_SX	[R1, ByteOffset(GPIOD_ODR+0)]
;Pantalla.c,54 :: 		TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
AND	R1, R0, #4
UXTH	R1, R1
LSRS	R2, R1, #2
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;Pantalla.c,55 :: 		TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
AND	R1, R0, #8
UXTH	R1, R1
LSRS	R2, R1, #3
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
_SX	[R1, ByteOffset(GPIOE_ODR+0)]
;Pantalla.c,56 :: 		TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
AND	R1, R0, #16
UXTH	R1, R1
LSRS	R2, R1, #4
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;Pantalla.c,57 :: 		TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
AND	R1, R0, #32
UXTH	R1, R1
LSRS	R2, R1, #5
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
_SX	[R1, ByteOffset(GPIOE_ODR+0)]
;Pantalla.c,58 :: 		TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
AND	R1, R0, #64
UXTH	R1, R1
LSRS	R2, R1, #6
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
_SX	[R1, ByteOffset(GPIOE_ODR+0)]
;Pantalla.c,59 :: 		TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
AND	R1, R0, #128
UXTH	R1, R1
; temp end address is: 0 (R0)
LSRS	R2, R1, #7
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;Pantalla.c,61 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
;Pantalla.c,62 :: 		asm nop;
NOP
;Pantalla.c,63 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
;Pantalla.c,64 :: 		}
L_end_TFT_Write_Command_Custom:
BX	LR
; end of _TFT_Write_Command_Custom
_TFT_Write_Data_Custom:
;Pantalla.c,66 :: 		void TFT_Write_Data_Custom(unsigned int _data) {
SUB	SP, SP, #4
STRH	R0, [SP, #0]
;Pantalla.c,68 :: 		TFT_RS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
;Pantalla.c,74 :: 		temp = Hi(_data);
ADD	R1, SP, #0
ADDS	R1, R1, #1
LDRB	R0, [R1, #0]
; temp start address is: 0 (R0)
UXTB	R0, R0
;Pantalla.c,75 :: 		TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
AND	R2, R0, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;Pantalla.c,76 :: 		TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
AND	R1, R0, #2
UXTH	R1, R1
LSRS	R2, R1, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
_SX	[R1, ByteOffset(GPIOD_ODR+0)]
;Pantalla.c,77 :: 		TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
AND	R1, R0, #4
UXTH	R1, R1
LSRS	R2, R1, #2
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;Pantalla.c,78 :: 		TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
AND	R1, R0, #8
UXTH	R1, R1
LSRS	R2, R1, #3
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
_SX	[R1, ByteOffset(GPIOE_ODR+0)]
;Pantalla.c,79 :: 		TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
AND	R1, R0, #16
UXTH	R1, R1
LSRS	R2, R1, #4
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;Pantalla.c,80 :: 		TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
AND	R1, R0, #32
UXTH	R1, R1
LSRS	R2, R1, #5
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
_SX	[R1, ByteOffset(GPIOE_ODR+0)]
;Pantalla.c,81 :: 		TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
AND	R1, R0, #64
UXTH	R1, R1
LSRS	R2, R1, #6
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
_SX	[R1, ByteOffset(GPIOE_ODR+0)]
;Pantalla.c,82 :: 		TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
AND	R1, R0, #128
UXTH	R1, R1
; temp end address is: 0 (R0)
LSRS	R2, R1, #7
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;Pantalla.c,84 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
;Pantalla.c,85 :: 		asm nop;
NOP
;Pantalla.c,86 :: 		TFT_WR = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R3, #lo_addr(GPIOC_ODR+0)
MOVT	R3, #hi_addr(GPIOC_ODR+0)
_SX	[R3, ByteOffset(GPIOC_ODR+0)]
;Pantalla.c,93 :: 		temp = Lo(_data);
ADD	R1, SP, #0
LDRB	R1, [R1, #0]
; temp start address is: 0 (R0)
UXTB	R0, R1
;Pantalla.c,94 :: 		TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
AND	R2, R0, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;Pantalla.c,95 :: 		TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
AND	R1, R0, #2
UXTH	R1, R1
LSRS	R2, R1, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
_SX	[R1, ByteOffset(GPIOD_ODR+0)]
;Pantalla.c,96 :: 		TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
AND	R1, R0, #4
UXTH	R1, R1
LSRS	R2, R1, #2
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;Pantalla.c,97 :: 		TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
AND	R1, R0, #8
UXTH	R1, R1
LSRS	R2, R1, #3
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
_SX	[R1, ByteOffset(GPIOE_ODR+0)]
;Pantalla.c,98 :: 		TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
AND	R1, R0, #16
UXTH	R1, R1
LSRS	R2, R1, #4
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;Pantalla.c,99 :: 		TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
AND	R1, R0, #32
UXTH	R1, R1
LSRS	R2, R1, #5
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
_SX	[R1, ByteOffset(GPIOE_ODR+0)]
;Pantalla.c,100 :: 		TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
AND	R1, R0, #64
UXTH	R1, R1
LSRS	R2, R1, #6
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
_SX	[R1, ByteOffset(GPIOE_ODR+0)]
;Pantalla.c,101 :: 		TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
AND	R1, R0, #128
UXTH	R1, R1
; temp end address is: 0 (R0)
LSRS	R2, R1, #7
UXTH	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;Pantalla.c,103 :: 		TFT_WR = 0;
MOVS	R1, #0
SXTB	R1, R1
_SX	[R3, ByteOffset(GPIOC_ODR+0)]
;Pantalla.c,104 :: 		asm nop;
NOP
;Pantalla.c,105 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
;Pantalla.c,106 :: 		}
L_end_TFT_Write_Data_Custom:
ADD	SP, SP, #4
BX	LR
; end of _TFT_Write_Data_Custom
_InitPantalla:
;Pantalla.c,108 :: 		void InitPantalla(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Pantalla.c,109 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_3,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
MOV	R2, #532
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;Pantalla.c,110 :: 		GPIO_Config(&GPIOF_BASE, _GPIO_PINMASK_13 |_GPIO_PINMASK_3 | _GPIO_PINMASK_5 | _GPIO_PINMASK_12 | _GPIO_PINMASK_15 | _GPIO_PINMASK_14,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
MOV	R2, #532
MOVW	R1, #61480
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Config+0
;Pantalla.c,111 :: 		GPIO_Config(&GPIOC_BASE,_GPIO_PINMASK_0 | _GPIO_PINMASK_3  ,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
MOV	R2, #532
MOVW	R1, #9
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;Pantalla.c,112 :: 		GPIO_Config(&GPIOE_BASE,_GPIO_PINMASK_13 | _GPIO_PINMASK_11 | _GPIO_PINMASK_9 ,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
MOV	R2, #532
MOVW	R1, #10752
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Config+0
;Pantalla.c,113 :: 		GPIO_Config(&GPIOD_BASE,_GPIO_PINMASK_15 ,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
MOV	R2, #532
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Config+0
;Pantalla.c,114 :: 		GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_3);
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;Pantalla.c,115 :: 		GPIO_Digital_Output(&GPIOF_BASE,_GPIO_PINMASK_13 |_GPIO_PINMASK_3 | _GPIO_PINMASK_5 | _GPIO_PINMASK_12 | _GPIO_PINMASK_15 | _GPIO_PINMASK_14);
MOVW	R1, #61480
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Output+0
;Pantalla.c,116 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_3 );
MOVW	R1, #9
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;Pantalla.c,117 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_13 | _GPIO_PINMASK_11 | _GPIO_PINMASK_9);
MOVW	R1, #10752
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;Pantalla.c,118 :: 		GPIO_Digital_Output(&GPIOD_BASE,_GPIO_PINMASK_15 );
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;Pantalla.c,119 :: 		TFT_Set_Active(&TFT_Set_Index_Custom, &TFT_Write_Command_Custom, &TFT_Write_Data_Custom);
MOVW	R2, #lo_addr(_TFT_Write_Data_Custom+0)
MOVT	R2, #hi_addr(_TFT_Write_Data_Custom+0)
MOVW	R1, #lo_addr(_TFT_Write_Command_Custom+0)
MOVT	R1, #hi_addr(_TFT_Write_Command_Custom+0)
MOVW	R0, #lo_addr(_TFT_Set_Index_Custom+0)
MOVT	R0, #hi_addr(_TFT_Set_Index_Custom+0)
BL	_TFT_Set_Active+0
;Pantalla.c,120 :: 		TFT_Init_ILI9341_8bit_Custom(240, 320);
MOVW	R1, #320
MOVS	R0, #240
BL	_TFT_Init_ILI9341_8bit_Custom+0
;Pantalla.c,121 :: 		}
L_end_InitPantalla:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitPantalla
