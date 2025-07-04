_Init_TFT:
;DSP15_SPI_NRF24L01.c,14 :: 		void Init_TFT() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP15_SPI_NRF24L01.c,15 :: 		InitPantalla();
BL	_InitPantalla+0
;DSP15_SPI_NRF24L01.c,16 :: 		TFT_Fill_Screen(CL_BLACK);
MOVW	R0, #0
BL	_TFT_Fill_Screen+0
;DSP15_SPI_NRF24L01.c,17 :: 		TFT_Set_Font(TFT_defaultFont, CL_AQUA, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #4095
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;DSP15_SPI_NRF24L01.c,18 :: 		TFT_Write_Text("NRF24L01 Pantalla 2", 30, 30);
MOVW	R0, #lo_addr(?lstr1_DSP15_SPI_NRF24L01+0)
MOVT	R0, #hi_addr(?lstr1_DSP15_SPI_NRF24L01+0)
MOVS	R2, #30
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DSP15_SPI_NRF24L01.c,19 :: 		TFT_Write_Text("Enviado:", 50, 80);
MOVW	R0, #lo_addr(?lstr2_DSP15_SPI_NRF24L01+0)
MOVT	R0, #hi_addr(?lstr2_DSP15_SPI_NRF24L01+0)
MOVS	R2, #80
MOVS	R1, #50
BL	_TFT_Write_Text+0
;DSP15_SPI_NRF24L01.c,20 :: 		TFT_Write_Text("Recibido:", 50, 120);
MOVW	R0, #lo_addr(?lstr3_DSP15_SPI_NRF24L01+0)
MOVT	R0, #hi_addr(?lstr3_DSP15_SPI_NRF24L01+0)
MOVS	R2, #120
MOVS	R1, #50
BL	_TFT_Write_Text+0
;DSP15_SPI_NRF24L01.c,21 :: 		TFT_Write_Text("Equipo 7:", 50, 160);
MOVW	R0, #lo_addr(?lstr4_DSP15_SPI_NRF24L01+0)
MOVT	R0, #hi_addr(?lstr4_DSP15_SPI_NRF24L01+0)
MOVS	R2, #160
MOVS	R1, #50
BL	_TFT_Write_Text+0
;DSP15_SPI_NRF24L01.c,22 :: 		TFT_Write_Text("4TV2", 50, 180);
MOVW	R0, #lo_addr(?lstr5_DSP15_SPI_NRF24L01+0)
MOVT	R0, #hi_addr(?lstr5_DSP15_SPI_NRF24L01+0)
MOVS	R2, #180
MOVS	R1, #50
BL	_TFT_Write_Text+0
;DSP15_SPI_NRF24L01.c,23 :: 		TFT_Write_Text("Atziry Vianey", 50, 200);
MOVW	R0, #lo_addr(?lstr6_DSP15_SPI_NRF24L01+0)
MOVT	R0, #hi_addr(?lstr6_DSP15_SPI_NRF24L01+0)
MOVS	R2, #200
MOVS	R1, #50
BL	_TFT_Write_Text+0
;DSP15_SPI_NRF24L01.c,24 :: 		TFT_Write_Text("Saymi García", 50, 220);
MOVW	R0, #lo_addr(?lstr7_DSP15_SPI_NRF24L01+0)
MOVT	R0, #hi_addr(?lstr7_DSP15_SPI_NRF24L01+0)
MOVS	R2, #220
MOVS	R1, #50
BL	_TFT_Write_Text+0
;DSP15_SPI_NRF24L01.c,25 :: 		}
L_end_Init_TFT:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_TFT
_nrf24_write_reg:
;DSP15_SPI_NRF24L01.c,30 :: 		void nrf24_write_reg(char reg, char value) {
; value start address is: 4 (R1)
; reg start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R4, R1
; value end address is: 4 (R1)
; reg end address is: 0 (R0)
; reg start address is: 0 (R0)
; value start address is: 16 (R4)
;DSP15_SPI_NRF24L01.c,31 :: 		CSN = 0;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODR+0)
MOVT	R2, #hi_addr(GPIOC_ODR+0)
_SX	[R2, ByteOffset(GPIOC_ODR+0)]
;DSP15_SPI_NRF24L01.c,32 :: 		SPI1_Write(0x20 | reg);
ORR	R2, R0, #32
UXTB	R2, R2
; reg end address is: 0 (R0)
UXTB	R0, R2
BL	_SPI1_Write+0
;DSP15_SPI_NRF24L01.c,33 :: 		SPI1_Write(value);
UXTB	R0, R4
; value end address is: 16 (R4)
BL	_SPI1_Write+0
;DSP15_SPI_NRF24L01.c,34 :: 		CSN = 1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODR+0)
MOVT	R2, #hi_addr(GPIOC_ODR+0)
_SX	[R2, ByteOffset(GPIOC_ODR+0)]
;DSP15_SPI_NRF24L01.c,35 :: 		}
L_end_nrf24_write_reg:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nrf24_write_reg
_nrf24_write_address:
;DSP15_SPI_NRF24L01.c,37 :: 		void nrf24_write_address(char reg, const char *addr, char len) {
; len start address is: 8 (R2)
; addr start address is: 4 (R1)
; reg start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R5, R1
UXTB	R6, R2
; len end address is: 8 (R2)
; addr end address is: 4 (R1)
; reg end address is: 0 (R0)
; reg start address is: 0 (R0)
; addr start address is: 20 (R5)
; len start address is: 24 (R6)
;DSP15_SPI_NRF24L01.c,39 :: 		CSN = 0;
MOVS	R4, #0
SXTB	R4, R4
MOVW	R3, #lo_addr(GPIOC_ODR+0)
MOVT	R3, #hi_addr(GPIOC_ODR+0)
_SX	[R3, ByteOffset(GPIOC_ODR+0)]
;DSP15_SPI_NRF24L01.c,40 :: 		SPI1_Write(0x20 | reg);
ORR	R3, R0, #32
UXTB	R3, R3
; reg end address is: 0 (R0)
UXTB	R0, R3
BL	_SPI1_Write+0
;DSP15_SPI_NRF24L01.c,41 :: 		for (i = 0; i < len; i++) {
; i start address is: 0 (R0)
MOVS	R0, #0
; len end address is: 24 (R6)
; i end address is: 0 (R0)
UXTB	R4, R6
UXTB	R6, R0
L_nrf24_write_address0:
; i start address is: 24 (R6)
; len start address is: 16 (R4)
; addr start address is: 20 (R5)
; addr end address is: 20 (R5)
CMP	R6, R4
IT	CS
BCS	L_nrf24_write_address1
; addr end address is: 20 (R5)
;DSP15_SPI_NRF24L01.c,42 :: 		SPI1_Write(addr[i]);
; addr start address is: 20 (R5)
ADDS	R3, R5, R6
LDRB	R3, [R3, #0]
UXTH	R0, R3
BL	_SPI1_Write+0
;DSP15_SPI_NRF24L01.c,41 :: 		for (i = 0; i < len; i++) {
ADDS	R6, R6, #1
UXTB	R6, R6
;DSP15_SPI_NRF24L01.c,43 :: 		}
; len end address is: 16 (R4)
; addr end address is: 20 (R5)
; i end address is: 24 (R6)
IT	AL
BAL	L_nrf24_write_address0
L_nrf24_write_address1:
;DSP15_SPI_NRF24L01.c,44 :: 		CSN = 1;
MOVS	R4, #1
SXTB	R4, R4
MOVW	R3, #lo_addr(GPIOC_ODR+0)
MOVT	R3, #hi_addr(GPIOC_ODR+0)
_SX	[R3, ByteOffset(GPIOC_ODR+0)]
;DSP15_SPI_NRF24L01.c,45 :: 		}
L_end_nrf24_write_address:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nrf24_write_address
_nrf24_flush_rx:
;DSP15_SPI_NRF24L01.c,47 :: 		void nrf24_flush_rx() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP15_SPI_NRF24L01.c,48 :: 		CSN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;DSP15_SPI_NRF24L01.c,49 :: 		SPI1_Write(0xE2);
MOVS	R0, #226
BL	_SPI1_Write+0
;DSP15_SPI_NRF24L01.c,50 :: 		CSN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;DSP15_SPI_NRF24L01.c,51 :: 		}
L_end_nrf24_flush_rx:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nrf24_flush_rx
_nrf24_clear_interrupts:
;DSP15_SPI_NRF24L01.c,53 :: 		void nrf24_clear_interrupts() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP15_SPI_NRF24L01.c,54 :: 		nrf24_write_reg(0x07, 0x70);
MOVS	R1, #112
MOVS	R0, #7
BL	_nrf24_write_reg+0
;DSP15_SPI_NRF24L01.c,55 :: 		}
L_end_nrf24_clear_interrupts:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nrf24_clear_interrupts
_nrf24_read_payload:
;DSP15_SPI_NRF24L01.c,56 :: 		char nrf24_read_payload() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP15_SPI_NRF24L01.c,58 :: 		CSN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;DSP15_SPI_NRF24L01.c,59 :: 		SPI1_Write(0x61);
MOVS	R0, #97
BL	_SPI1_Write+0
;DSP15_SPI_NRF24L01.c,60 :: 		dato = SPI1_Read(0x00);
MOVS	R0, #0
BL	_SPI1_Read+0
;DSP15_SPI_NRF24L01.c,61 :: 		CSN = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
;DSP15_SPI_NRF24L01.c,62 :: 		return dato;
UXTB	R0, R0
;DSP15_SPI_NRF24L01.c,63 :: 		}
L_end_nrf24_read_payload:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nrf24_read_payload
_nrf24_get_status:
;DSP15_SPI_NRF24L01.c,65 :: 		char nrf24_get_status() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP15_SPI_NRF24L01.c,67 :: 		CSN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;DSP15_SPI_NRF24L01.c,68 :: 		status = SPI1_Read(0xFF);
MOVS	R0, #255
BL	_SPI1_Read+0
;DSP15_SPI_NRF24L01.c,69 :: 		CSN = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
;DSP15_SPI_NRF24L01.c,70 :: 		return status;
UXTB	R0, R0
;DSP15_SPI_NRF24L01.c,71 :: 		}
L_end_nrf24_get_status:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nrf24_get_status
_TX:
;DSP15_SPI_NRF24L01.c,72 :: 		void TX() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP15_SPI_NRF24L01.c,73 :: 		buffer = caracteres[contador++];
MOVW	R2, #lo_addr(_contador+0)
MOVT	R2, #hi_addr(_contador+0)
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(_caracteres+0)
MOVT	R0, #hi_addr(_caracteres+0)
ADDS	R0, R0, R1
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_buffer+0)
MOVT	R0, #hi_addr(_buffer+0)
STRB	R1, [R0, #0]
MOV	R0, R2
LDRB	R0, [R0, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R2, #0]
;DSP15_SPI_NRF24L01.c,74 :: 		if (contador >= 36) contador = 0;
CMP	R0, #36
IT	CC
BCC	L_TX3
MOVS	R1, #0
MOVW	R0, #lo_addr(_contador+0)
MOVT	R0, #hi_addr(_contador+0)
STRB	R1, [R0, #0]
L_TX3:
;DSP15_SPI_NRF24L01.c,76 :: 		CSN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;DSP15_SPI_NRF24L01.c,77 :: 		SPI1_Write(0xA0);
MOVS	R0, #160
BL	_SPI1_Write+0
;DSP15_SPI_NRF24L01.c,78 :: 		SPI1_Write(buffer);
MOVW	R0, #lo_addr(_buffer+0)
MOVT	R0, #hi_addr(_buffer+0)
LDRB	R0, [R0, #0]
BL	_SPI1_Write+0
;DSP15_SPI_NRF24L01.c,79 :: 		CSN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;DSP15_SPI_NRF24L01.c,81 :: 		CE = 1;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;DSP15_SPI_NRF24L01.c,82 :: 		Delay_us(20);
MOVW	R7, #105
MOVT	R7, #0
NOP
NOP
L_TX4:
SUBS	R7, R7, #1
BNE	L_TX4
NOP
NOP
;DSP15_SPI_NRF24L01.c,83 :: 		CE = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;DSP15_SPI_NRF24L01.c,85 :: 		mostrarTX(buffer, 50, 80);
MOVW	R0, #lo_addr(_buffer+0)
MOVT	R0, #hi_addr(_buffer+0)
LDRB	R0, [R0, #0]
MOVS	R2, #80
MOVS	R1, #50
BL	_mostrarTX+0
;DSP15_SPI_NRF24L01.c,86 :: 		}
L_end_TX:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TX
_RX:
;DSP15_SPI_NRF24L01.c,88 :: 		void RX() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP15_SPI_NRF24L01.c,89 :: 		char status = nrf24_get_status();
BL	_nrf24_get_status+0
;DSP15_SPI_NRF24L01.c,91 :: 		if (status & 0x40) {
AND	R0, R0, #64
UXTB	R0, R0
CMP	R0, #0
IT	EQ
BEQ	L_RX6
;DSP15_SPI_NRF24L01.c,92 :: 		MsjRec = nrf24_read_payload();
BL	_nrf24_read_payload+0
MOVW	R1, #lo_addr(_MsjRec+0)
MOVT	R1, #hi_addr(_MsjRec+0)
STRB	R0, [R1, #0]
;DSP15_SPI_NRF24L01.c,93 :: 		mostrarRX(MsjRec, 50, 120);
MOVS	R2, #120
MOVS	R1, #50
BL	_mostrarRX+0
;DSP15_SPI_NRF24L01.c,94 :: 		nrf24_clear_interrupts();
BL	_nrf24_clear_interrupts+0
;DSP15_SPI_NRF24L01.c,95 :: 		nrf24_flush_rx();
BL	_nrf24_flush_rx+0
;DSP15_SPI_NRF24L01.c,96 :: 		}
L_RX6:
;DSP15_SPI_NRF24L01.c,97 :: 		}
L_end_RX:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RX
_mostrarTX:
;DSP15_SPI_NRF24L01.c,99 :: 		void mostrarTX(char caracter, unsigned short x, unsigned short y) {
SUB	SP, SP, #16
STR	LR, [SP, #0]
STRB	R0, [SP, #4]
STRB	R1, [SP, #8]
STRB	R2, [SP, #12]
;DSP15_SPI_NRF24L01.c,100 :: 		TFT_Set_Brush(1, CL_BLACK, 0, LEFT_TO_RIGHT, CL_BLACK, CL_BLACK);
MOVW	R4, #0
MOVW	R3, #0
PUSH	(R4)
PUSH	(R3)
MOVS	R3, #1
MOVS	R2, #0
MOVW	R1, #0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;DSP15_SPI_NRF24L01.c,101 :: 		TFT_Rectangle(x + 70, y, x + 100, y + 16);
LDRB	R3, [SP, #12]
ADDW	R5, R3, #16
LDRB	R3, [SP, #8]
ADDW	R4, R3, #100
LDRB	R3, [SP, #8]
ADDS	R3, #70
SXTH	R2, R4
LDRB	R1, [SP, #12]
SXTH	R0, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
;DSP15_SPI_NRF24L01.c,102 :: 		texto[0] = caracter;
LDRB	R4, [SP, #4]
MOVW	R3, #lo_addr(_texto+0)
MOVT	R3, #hi_addr(_texto+0)
STRB	R4, [R3, #0]
;DSP15_SPI_NRF24L01.c,103 :: 		texto[1] = '\0';
MOVS	R4, #0
MOVW	R3, #lo_addr(_texto+1)
MOVT	R3, #hi_addr(_texto+1)
STRB	R4, [R3, #0]
;DSP15_SPI_NRF24L01.c,104 :: 		TFT_Set_Font(TFT_defaultFont, CL_AQUA, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #4095
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;DSP15_SPI_NRF24L01.c,105 :: 		TFT_Write_Text(texto, x + 75, y);
LDRB	R3, [SP, #8]
ADDS	R3, #75
LDRB	R2, [SP, #12]
UXTH	R1, R3
MOVW	R0, #lo_addr(_texto+0)
MOVT	R0, #hi_addr(_texto+0)
BL	_TFT_Write_Text+0
;DSP15_SPI_NRF24L01.c,106 :: 		}
L_end_mostrarTX:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _mostrarTX
_mostrarRX:
;DSP15_SPI_NRF24L01.c,108 :: 		void mostrarRX(char caracter, unsigned short x, unsigned short y) {
SUB	SP, SP, #16
STR	LR, [SP, #0]
STRB	R0, [SP, #4]
STRB	R1, [SP, #8]
STRB	R2, [SP, #12]
;DSP15_SPI_NRF24L01.c,109 :: 		TFT_Set_Brush(1, CL_BLACK, 0, LEFT_TO_RIGHT, CL_BLACK, CL_BLACK);
MOVW	R4, #0
MOVW	R3, #0
PUSH	(R4)
PUSH	(R3)
MOVS	R3, #1
MOVS	R2, #0
MOVW	R1, #0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;DSP15_SPI_NRF24L01.c,110 :: 		TFT_Rectangle(x + 70, y, x + 100, y + 16);
LDRB	R3, [SP, #12]
ADDW	R5, R3, #16
LDRB	R3, [SP, #8]
ADDW	R4, R3, #100
LDRB	R3, [SP, #8]
ADDS	R3, #70
SXTH	R2, R4
LDRB	R1, [SP, #12]
SXTH	R0, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
;DSP15_SPI_NRF24L01.c,111 :: 		texto[0] = caracter;
LDRB	R4, [SP, #4]
MOVW	R3, #lo_addr(_texto+0)
MOVT	R3, #hi_addr(_texto+0)
STRB	R4, [R3, #0]
;DSP15_SPI_NRF24L01.c,112 :: 		texto[1] = '\0';
MOVS	R4, #0
MOVW	R3, #lo_addr(_texto+1)
MOVT	R3, #hi_addr(_texto+1)
STRB	R4, [R3, #0]
;DSP15_SPI_NRF24L01.c,113 :: 		TFT_Set_Font(TFT_defaultFont, CL_AQUA, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #4095
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;DSP15_SPI_NRF24L01.c,114 :: 		TFT_Write_Text(texto, x + 75, y);
LDRB	R3, [SP, #8]
ADDS	R3, #75
LDRB	R2, [SP, #12]
UXTH	R1, R3
MOVW	R0, #lo_addr(_texto+0)
MOVT	R0, #hi_addr(_texto+0)
BL	_TFT_Write_Text+0
;DSP15_SPI_NRF24L01.c,115 :: 		}
L_end_mostrarRX:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _mostrarRX
_Init_SPI:
;DSP15_SPI_NRF24L01.c,117 :: 		void Init_SPI() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP15_SPI_NRF24L01.c,121 :: 		&_GPIO_MODULE_SPI1_PA567);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI1_PA567+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI1_PA567+0)
;DSP15_SPI_NRF24L01.c,120 :: 		_SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
MOVW	R1, #772
;DSP15_SPI_NRF24L01.c,118 :: 		SPI1_Init_Advanced(_SPI_FPCLK_DIV64, _SPI_MASTER | _SPI_8_BIT | _SPI_CLK_IDLE_LOW |
MOVS	R0, #5
;DSP15_SPI_NRF24L01.c,121 :: 		&_GPIO_MODULE_SPI1_PA567);
BL	_SPI1_Init_Advanced+0
;DSP15_SPI_NRF24L01.c,122 :: 		SPI_Set_Active(SPI1_Read, SPI1_Write);
MOVW	R1, #lo_addr(_SPI1_Write+0)
MOVT	R1, #hi_addr(_SPI1_Write+0)
MOVW	R0, #lo_addr(_SPI1_Read+0)
MOVT	R0, #hi_addr(_SPI1_Read+0)
BL	_SPI_Set_Active+0
;DSP15_SPI_NRF24L01.c,123 :: 		}
L_end_Init_SPI:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_SPI
_nrf24_common_config:
;DSP15_SPI_NRF24L01.c,125 :: 		void nrf24_common_config() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP15_SPI_NRF24L01.c,126 :: 		nrf24_write_reg(0x01, 0x01);
MOVS	R1, #1
MOVS	R0, #1
BL	_nrf24_write_reg+0
;DSP15_SPI_NRF24L01.c,127 :: 		nrf24_write_reg(0x02, 0x01);
MOVS	R1, #1
MOVS	R0, #2
BL	_nrf24_write_reg+0
;DSP15_SPI_NRF24L01.c,128 :: 		nrf24_write_reg(0x03, 0x03);
MOVS	R1, #3
MOVS	R0, #3
BL	_nrf24_write_reg+0
;DSP15_SPI_NRF24L01.c,129 :: 		nrf24_write_reg(0x04, 0xFF);
MOVS	R1, #255
MOVS	R0, #4
BL	_nrf24_write_reg+0
;DSP15_SPI_NRF24L01.c,130 :: 		nrf24_write_reg(0x11, 1);
MOVS	R1, #1
MOVS	R0, #17
BL	_nrf24_write_reg+0
;DSP15_SPI_NRF24L01.c,132 :: 		}
L_end_nrf24_common_config:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nrf24_common_config
_nrf24_initTX:
;DSP15_SPI_NRF24L01.c,134 :: 		void nrf24_initTX() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP15_SPI_NRF24L01.c,135 :: 		CE = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;DSP15_SPI_NRF24L01.c,136 :: 		nrf24_common_config();
BL	_nrf24_common_config+0
;DSP15_SPI_NRF24L01.c,137 :: 		nrf24_write_address(0x10, address, 5);
MOVS	R2, #5
MOVW	R1, #lo_addr(_address+0)
MOVT	R1, #hi_addr(_address+0)
MOVS	R0, #16
BL	_nrf24_write_address+0
;DSP15_SPI_NRF24L01.c,138 :: 		nrf24_write_address(0x0A, address, 5);
MOVS	R2, #5
MOVW	R1, #lo_addr(_address+0)
MOVT	R1, #hi_addr(_address+0)
MOVS	R0, #10
BL	_nrf24_write_address+0
;DSP15_SPI_NRF24L01.c,139 :: 		nrf24_write_reg(0x00, 0x0E);
MOVS	R1, #14
MOVS	R0, #0
BL	_nrf24_write_reg+0
;DSP15_SPI_NRF24L01.c,140 :: 		Delay_ms(2);
MOVW	R7, #10665
MOVT	R7, #0
NOP
NOP
L_nrf24_initTX7:
SUBS	R7, R7, #1
BNE	L_nrf24_initTX7
NOP
NOP
;DSP15_SPI_NRF24L01.c,141 :: 		}
L_end_nrf24_initTX:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nrf24_initTX
_nrf24_initRX:
;DSP15_SPI_NRF24L01.c,143 :: 		void nrf24_initRX() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP15_SPI_NRF24L01.c,144 :: 		CE = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;DSP15_SPI_NRF24L01.c,145 :: 		nrf24_common_config();
BL	_nrf24_common_config+0
;DSP15_SPI_NRF24L01.c,146 :: 		nrf24_write_address(0x0A, address, 5);
MOVS	R2, #5
MOVW	R1, #lo_addr(_address+0)
MOVT	R1, #hi_addr(_address+0)
MOVS	R0, #10
BL	_nrf24_write_address+0
;DSP15_SPI_NRF24L01.c,147 :: 		nrf24_write_reg(0x00, 0x0F);
MOVS	R1, #15
MOVS	R0, #0
BL	_nrf24_write_reg+0
;DSP15_SPI_NRF24L01.c,148 :: 		Delay_ms(2);
MOVW	R7, #10665
MOVT	R7, #0
NOP
NOP
L_nrf24_initRX9:
SUBS	R7, R7, #1
BNE	L_nrf24_initRX9
NOP
NOP
;DSP15_SPI_NRF24L01.c,149 :: 		CE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;DSP15_SPI_NRF24L01.c,150 :: 		}
L_end_nrf24_initRX:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nrf24_initRX
_main:
;DSP15_SPI_NRF24L01.c,152 :: 		void main() {
;DSP15_SPI_NRF24L01.c,153 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_2);
MOVW	R1, #5
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;DSP15_SPI_NRF24L01.c,154 :: 		Init_SPI();
BL	_Init_SPI+0
;DSP15_SPI_NRF24L01.c,155 :: 		Init_TFT();
BL	_Init_TFT+0
;DSP15_SPI_NRF24L01.c,157 :: 		nrf24_write_reg(0x05, 0X06);  // Canal 6
MOVS	R1, #6
MOVS	R0, #5
BL	_nrf24_write_reg+0
;DSP15_SPI_NRF24L01.c,158 :: 		Delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_main11:
SUBS	R7, R7, #1
BNE	L_main11
NOP
NOP
NOP
NOP
;DSP15_SPI_NRF24L01.c,160 :: 		buffer = 'A';
MOVS	R1, #65
MOVW	R0, #lo_addr(_buffer+0)
MOVT	R0, #hi_addr(_buffer+0)
STRB	R1, [R0, #0]
;DSP15_SPI_NRF24L01.c,161 :: 		contador = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_contador+0)
MOVT	R0, #hi_addr(_contador+0)
STRB	R1, [R0, #0]
;DSP15_SPI_NRF24L01.c,163 :: 		while (1) {
L_main13:
;DSP15_SPI_NRF24L01.c,164 :: 		nrf24_initTX();
BL	_nrf24_initTX+0
;DSP15_SPI_NRF24L01.c,165 :: 		TX();
BL	_TX+0
;DSP15_SPI_NRF24L01.c,166 :: 		Delay_ms(400);
MOVW	R7, #36179
MOVT	R7, #32
NOP
NOP
L_main15:
SUBS	R7, R7, #1
BNE	L_main15
NOP
NOP
NOP
NOP
;DSP15_SPI_NRF24L01.c,168 :: 		nrf24_initRX();
BL	_nrf24_initRX+0
;DSP15_SPI_NRF24L01.c,169 :: 		RX();
BL	_RX+0
;DSP15_SPI_NRF24L01.c,170 :: 		Delay_ms(400);
MOVW	R7, #36179
MOVT	R7, #32
NOP
NOP
L_main17:
SUBS	R7, R7, #1
BNE	L_main17
NOP
NOP
NOP
NOP
;DSP15_SPI_NRF24L01.c,171 :: 		}
IT	AL
BAL	L_main13
;DSP15_SPI_NRF24L01.c,172 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
