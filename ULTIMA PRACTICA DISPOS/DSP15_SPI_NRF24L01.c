#include <Pantalla.h>
#include <string.h>
#include <stdlib.h>

sbit CE  at GPIOC_ODR.B0;
sbit CSN at GPIOC_ODR.B2;

char buffer, MsjRec;
char texto[10];
char address[5] = {'A', 'A', 'A', 'A', 'A'};
char caracteres[] = "AtziryySaymi12345";
unsigned char contador = 0;

void Init_TFT() {
    InitPantalla();
    TFT_Fill_Screen(CL_BLACK);
    TFT_Set_Font(TFT_defaultFont, CL_AQUA, FO_HORIZONTAL);
    TFT_Write_Text("NRF24L01 Pantalla 2", 30, 30);
    TFT_Write_Text("Enviado:", 50, 80);
    TFT_Write_Text("Recibido:", 50, 120);
    TFT_Write_Text("Equipo 7:", 50, 160);
    TFT_Write_Text("4TV2", 50, 180);
    TFT_Write_Text("Atziry Vianey", 50, 200);
    TFT_Write_Text("Saymi Garc�a", 50, 220);
}

void mostrarTX(char caracter, unsigned short x, unsigned short y);
void mostrarRX(char caracter, unsigned short x, unsigned short y);

void nrf24_write_reg(char reg, char value) {
    CSN = 0;
    SPI1_Write(0x20 | reg);
    SPI1_Write(value);
    CSN = 1;
}

void nrf24_write_address(char reg, const char *addr, char len) {
    char i;
    CSN = 0;
    SPI1_Write(0x20 | reg);
    for (i = 0; i < len; i++) {
        SPI1_Write(addr[i]);
    }
    CSN = 1;
}

void nrf24_flush_rx() {
    CSN = 0;
    SPI1_Write(0xE2);
    CSN = 1;
}

void nrf24_clear_interrupts() {
    nrf24_write_reg(0x07, 0x70);
}
char nrf24_read_payload() {
    char dato;
    CSN = 0;
    SPI1_Write(0x61);
    dato = SPI1_Read(0x00);
    CSN = 1;
    return dato;
}

char nrf24_get_status() {
    char status;
    CSN = 0;
    status = SPI1_Read(0xFF);
    CSN = 1;
    return status;
}
void TX() {
    buffer = caracteres[contador++];
    if (contador >= 36) contador = 0;

    CSN = 0;
    SPI1_Write(0xA0);
    SPI1_Write(buffer);
    CSN = 1;

    CE = 1;
    Delay_us(20);
    CE = 0;

    mostrarTX(buffer, 50, 80);
}

void RX() {
    char status = nrf24_get_status();

    if (status & 0x40) {
        MsjRec = nrf24_read_payload();
        mostrarRX(MsjRec, 50, 120);
        nrf24_clear_interrupts();
        nrf24_flush_rx();
    }
}

void mostrarTX(char caracter, unsigned short x, unsigned short y) {
    TFT_Set_Brush(1, CL_BLACK, 0, LEFT_TO_RIGHT, CL_BLACK, CL_BLACK);
    TFT_Rectangle(x + 70, y, x + 100, y + 16);
    texto[0] = caracter;
    texto[1] = '\0';
    TFT_Set_Font(TFT_defaultFont, CL_AQUA, FO_HORIZONTAL);
    TFT_Write_Text(texto, x + 75, y);
}

void mostrarRX(char caracter, unsigned short x, unsigned short y) {
    TFT_Set_Brush(1, CL_BLACK, 0, LEFT_TO_RIGHT, CL_BLACK, CL_BLACK);
    TFT_Rectangle(x + 70, y, x + 100, y + 16);
    texto[0] = caracter;
    texto[1] = '\0';
    TFT_Set_Font(TFT_defaultFont, CL_AQUA, FO_HORIZONTAL);
    TFT_Write_Text(texto, x + 75, y);
}

void Init_SPI() {
    SPI1_Init_Advanced(_SPI_FPCLK_DIV64, _SPI_MASTER | _SPI_8_BIT | _SPI_CLK_IDLE_LOW |
                       _SPI_FIRST_CLK_EDGE_TRANSITION | _SPI_MSB_FIRST |
                       _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
                       &_GPIO_MODULE_SPI1_PA567);
    SPI_Set_Active(SPI1_Read, SPI1_Write);
}

void nrf24_common_config() {
    nrf24_write_reg(0x01, 0x01);
    nrf24_write_reg(0x02, 0x01);
    nrf24_write_reg(0x03, 0x03);
    nrf24_write_reg(0x04, 0xFF);
    nrf24_write_reg(0x11, 1);

}

void nrf24_initTX() {
    CE = 0;
    nrf24_common_config();
    nrf24_write_address(0x10, address, 5);
    nrf24_write_address(0x0A, address, 5);
    nrf24_write_reg(0x00, 0x0E);
    Delay_ms(2);
}

void nrf24_initRX() {
    CE = 0;
    nrf24_common_config();
    nrf24_write_address(0x0A, address, 5);
    nrf24_write_reg(0x00, 0x0F);
    Delay_ms(2);
    CE = 1;
}

void main() {
    GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_2);
    Init_SPI();
    Init_TFT();

    nrf24_write_reg(0x05, 0X06);  // Canal 6
    Delay_ms(100);

    buffer = 'A';
    contador = 0;

    while (1) {
        nrf24_initTX();
        TX();
        Delay_ms(400);

        nrf24_initRX();
        RX();
        Delay_ms(400);
    }
}