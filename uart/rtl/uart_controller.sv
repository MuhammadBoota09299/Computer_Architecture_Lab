module uart_controller (
    input logic clock,reset,stop_bit,parity_enable,uart_en,busy,parity,

   //transmiter
   input logic tx_en,tx_fifo_empty,tx_baud_rate,tx_bit_count,
   output logic tx_baud_rate_reg_en,tx_bit_count_reg_en,tx_shift_reg_en,tx_shift_en,
   output logic tx_fifo_rd_en,

   //receiver
   input logic rx_en,rx_baud_rate,rx_bit_count,rx_bit,rx_fifo_full,
   output logic rx_baud_rate_reg_en,rx_bit_count_reg_en,rx_shift_reg_en,receive_parity,
   output logic stop_bit_error,rx_fifo_wr_en,shift_status_en,status_register_en
);

typedef enum logic [2:0] {
    RX_IDLE,
    RX_LOAD,
    RX_RECEIVE,
    RX_START_BIT,
    RX_DATA_BITS,
    RX_PARITY,
    RX_STOP_BIT
} receiver_states;

typedef enum logic [2:0] {
    TX_IDLE,
    TX_LOAD,
    TX_TRANSMIT,
    TX_START_BIT,
    TX_DATA_BITS,
    TX_PARITY,
    TX_STOP_BIT
} transmiter_states;



// for receiver
logic [2:0] rx_current_state, rx_next_state;

always_ff @( posedge clock ) begin 
    if (reset) begin
        rx_current_state<=RX_IDLE;
    end
    else begin
        rx_current_state <=rx_next_state;
    end
end


always_comb begin
    rx_baud_rate_reg_en=1'b0;
    rx_bit_count_reg_en=1'b0;
    rx_shift_reg_en=1'b0;
    status_register_en=1'b0;
    rx_fifo_wr_en=1'b0;
    busy=1'b0;
    case (rx_current_state)
        RX_IDLE:if (uart_en) rx_next_state=RX_LOAD; else rx_next_state=RX_IDLE;
        RX_LOAD:begin
            if (rx_en && ~rx_fifo_full && ~rx_bit) begin
                rx_next_state=RX_RECEIVE;
                rx_baud_rate_reg_en=1'b1;
                busy=1'b1;
            end
            else if (!uart_en) begin
                rx_next_state=RX_IDLE;
            end
            else begin
                rx_next_state=RX_LOAD;
            end
        end
        RX_RECEIVE:begin
            rx_baud_rate_reg_en=1'b1;
            busy=1'b1;
            if ( rx_baud_rate) rx_next_state=RX_START_BIT; else rx_next_state=RX_RECEIVE;
        end
        RX_START_BIT:begin
            rx_baud_rate_reg_en=1'b1;
            busy=1'b1;
            if (rx_baud_rate)begin
                rx_next_state=RX_DATA_BITS;
                rx_bit_count_reg_en=1'b1;
                rx_shift_reg_en=1'b1;
            end
            else begin
                rx_next_state=RX_START_BIT;
            end

        end
        RX_DATA_BITS: begin
            busy=1'b1;
            rx_baud_rate_reg_en=1'b1;
            if (rx_baud_rate) begin
                rx_next_state=RX_DATA_BITS;
                rx_bit_count_reg_en=1'b1;
                rx_shift_reg_en=1'b1;
            end
            else if (rx_bit_count && (~parity_enable) && stop_bit) begin
                rx_next_state=RX_STOP_BIT;
                stop_bit_error = (rx_bit==1);
                rx_fifo_wr_en = 1'b1;
            end
            else if (rx_bit_count && parity_enable) begin
                rx_next_state=RX_PARITY;
                receive_parity=rx_bit;
                rx_fifo_wr_en=1'b1;
            end
            else if ( rx_bit_count && (~parity) && (~stop_bit)) begin
                rx_next_state=RX_LOAD;
                status_register_en=1'b1;
                stop_bit_error = (rx_bit==1);
                busy=1'b0;
                rx_baud_rate_reg_en=1'b0;
            end
            else begin
                rx_next_state=RX_DATA_BITS;
            end
        end
        RX_PARITY:begin
            rx_baud_rate_reg_en=1'b1;
            if (rx_baud_rate && stop_bit) begin
                rx_next_state=RX_STOP_BIT;
                stop_bit_error = (rx_bit==1);
            end
            else if (rx_baud_rate && ~stop_bit) begin
                rx_next_state=RX_LOAD;
                status_register_en=1'b1;
                stop_bit_error = (rx_bit==1);
                rx_baud_rate_reg_en=1'b0;  
            end
            else begin
                rx_next_state=RX_PARITY;
            end
        end
        RX_STOP_BIT:begin
            if (rx_baud_rate) begin
                rx_next_state=RX_LOAD;
                status_register_en=1'b1;
                stop_bit_error=(rx_bit==1) || stop_bit_error;
            end
            else begin
                rx_next_state=RX_STOP_BIT;
            end
        end


        default: rx_next_state=rx_current_state;
    endcase
end


// for transmiter
logic [2:0] tx_current_state, tx_next_state;

always_ff @( posedge clock ) begin 
    if (reset) begin
        tx_current_state<=TX_IDLE;
    end
    else begin
        tx_current_state <=tx_next_state;
    end
end


always_comb begin
    tx_baud_rate_reg_en=1'b0;
    tx_bit_count_reg_en=1'b0;
    tx_shift_reg_en=1'b0;
    tx_shift_en=1'b0;
    tx_fifo_rd_en=1'b0;
    busy=1'b0;
    case (tx_current_state)
        TX_IDLE:if (uart_en) tx_next_state=TX_LOAD; else tx_next_state=TX_IDLE;
        TX_LOAD:begin
            if (tx_en && ~tx_fifo_empty) begin
                tx_next_state=TX_TRANSMIT;
                tx_baud_rate_reg_en=1'b1;
                tx_shift_reg_en=1'b1;
                tx_fifo_rd_en=1'b1;
                busy=1'b1;
            end
            else if (!uart_en) begin
                tx_next_state=TX_IDLE;
            end
            else begin
                tx_next_state=TX_LOAD;
            end
        end
        TX_TRANSMIT:begin
            tx_baud_rate_reg_en=1'b1;
            busy=1'b1;
            if ( rx_baud_rate)begin
                 tx_next_state=TX_START_BIT;
                 tx_shift_en=1'b1;
            end
                else tx_next_state=TX_TRANSMIT;
        end
        TX_START_BIT:begin
            tx_baud_rate_reg_en=1'b1;
            busy=1'b1;
            if (tx_baud_rate)begin
                tx_next_state=TX_DATA_BITS;
                tx_bit_count_reg_en=1'b1;
                tx_shift_en=1'b1;
            end
            else begin
                tx_next_state=TX_START_BIT;
            end

        end
        TX_DATA_BITS: begin
            busy=1'b1;
            tx_baud_rate_reg_en=1'b1;
            if (tx_baud_rate) begin
                tx_next_state=TX_DATA_BITS;
                tx_bit_count_reg_en=1'b1;
                tx_shift_en=1'b1;
            end
            else if (tx_bit_count && (~parity_enable) && stop_bit) begin
                tx_next_state=TX_STOP_BIT;
                tx_shift_en=1'b1;
            end
            else if (tx_bit_count && parity_enable) begin
                tx_next_state=TX_PARITY;
                tx_shift_en=1'b1;
            end
            else if ( tx_bit_count && (~parity) && (~stop_bit) && (tx_fifo_empty)) begin
                tx_next_state=TX_LOAD;
                tx_shift_en=1'b1;
                busy=1'b0;
                tx_baud_rate_reg_en=1'b0;
            end
            else begin
                tx_next_state=TX_DATA_BITS;
            end
        end
        TX_PARITY:begin
            tx_baud_rate_reg_en=1'b1;
            if (tx_baud_rate && stop_bit) begin
                tx_next_state=TX_STOP_BIT;
                tx_shift_en=1'b1;
            end
            else if (tx_baud_rate && ~stop_bit && (tx_fifo_empty)) begin
                tx_next_state=TX_LOAD;
                tx_baud_rate_reg_en=1'b0;
                tx_shift_en=1'b1;  
            end

            else begin
                tx_next_state=TX_PARITY;
            end
        end
        TX_STOP_BIT:begin
            if (tx_baud_rate) begin
                rx_next_state=TX_LOAD;
                tx_shift_en=1'b1;
            end
            else begin
                rx_next_state=TX_STOP_BIT;
            end
        end
        default: tx_next_state=tx_current_state;
    endcase
end
endmodule