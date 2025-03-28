#define UART_BASE            0x20
#define UART_STATUS_REG     *(volatile unsigned long *) (UART_BASE + 0x0)
#define UART_DATA_REG       *(volatile unsigned long *) (UART_BASE + 0x4)
#define UART_CTRL_REG       *(volatile unsigned long *) (UART_BASE + 0x8)
#define UART_BAUD_REG       *(volatile unsigned long *) (UART_BASE + 0xC)
#define tx_fifo_full         0x10
#define rx_fifo_empty        0x08

void uart_init(void){
    UART_CTRL_REG &= 0xFE; //disable the uart
    UART_BAUD_REG = 103;   //baud rate
    UART_CTRL_REG |= 0x30; // enable tx and rx 
    UART_CTRL_REG &= 0xF9; //single stop bit, no parity
    UART_CTRL_REG &= 0xF9; // enable uart
}

void uart_transmit(int data){
    while(UART_CTRL_REG & tx_fifo_full != 0 );
    UART_DATA_REG = data;
}

int uart_receive(){
    int data=0;
    while((UART_CTRL_REG & rx_fifo_empty)==rx_fifo_empty){
        data=UART_DATA_REG;
        return data;
    }
}

int main(void){
    int i=0;
    uart_init();
    uart_transmit(54);
    i=uart_receive();
}