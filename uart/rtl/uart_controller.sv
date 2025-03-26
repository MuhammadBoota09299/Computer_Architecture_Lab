module uart_controller (
    input logic clock,reset,stop_bit,parity_enable,uart_en,busy,

   //transmiter
   input logic tx_en,tx_empty,tx_baud_rate,tx_bit_count,
   output logic tx_baud_rate_reg_en,tx_bit_count_reg_en,tx_shift_register_en,tx_shift_en,tx_fifo_rd_en

   //receiver
   input logic rx_en,rx_baud_rate,rx_bit_count,rx_bit,
   output logic rx_baud_rate_reg_en,rx_bit_count_reg_en,rx_shift_reg_en,receive_partiy,stop_bit_error,rx_fifo_wr_en,shift_status_en
);

typedef enum logic [2:0] {
    IDLE,
    LOAD,
    RECEIVE,
    START_BIT,
    DATA_BITS,
    PARITY,
    STOP_BIT
} receiver_states;

typedef enum logic [2:0] {
    IDLE,
    LOAD,
    TRANSMIT,
    START_BIT,
    DATA_BITS,
    PARITY,
    STOP_BIT
} transmiter_states;



// for receiver
receiver_states_t rx_current_state, rx_next_state;

always_ff @( posedge clock ) begin 
    if (reset) begin
        rx_current_state<=IDLE;
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
        IDLE:if (uart_en) rx_next_state=LOAD; else rx_next_state=IDLE;
        LOAD:begin
            if (rx_en && ~rx_fifo_fiful && ~rx_bit) begin
                rx_next_state=RECEIVE;
                rx_baud_rate_reg_en=1'b1;
                busy=1'b1;
            end
            else if (!uart_en) begin
                rx_next_state=IDLE;
            end
            else begin
                rx_next_state=LOAD;
            end
        end
        RECEIVE:begin
            rx_baud_rate_reg_en=1'b1;
            busy=1'b1;
            if ( rx_baurd_rate) rx_next_state=START_BIT; else rx_next_state=RECEIVE;
        end
        START_BIT:begin
            rx_baud_rate_reg_en=1'b1;
            busy=1'b1;
            if (rx_baud_rate)begin
                rx_next_state=DATA_BITS;
                rx_bit_count_reg_en=1'b1;
                rx_shift_reg_en=1'b1;
            end
            else begin
                rx_next_state=START_BIT;
            end

        end
        DATA_BITS: begin
            busy=1'b1;
            rx_baud_rate_reg_en=1'b1;
            if (rx_baud_rate) begin
                rx_next_state=DATA_BITS;
                rx_bit_count_reg_en=1'b1;
                rx_shift_reg_en=1'b1;
            end
            else if (rx_bit_count && (~parity_en) && stop_bit) begin
                rx_next_state=STOP_BIT;
                stop_bit_error = (rx_bit==1);
                rx_fifo_wr_en = 1'b1;
            end
            else if (rx_bit_count && parity_en) begin
                rx_next_state=PARITY;
                receive_parity=rx_bit;
                rx_fifo_wr_en=1'b1;
            end
            else if ( rx_bit_count && (~parity) && (~stop_bit)) begin
                rx_next_state=LOAD;
                status_register_en=1'b1;
                stop_bit_error = (rx_bit==1);
                busy=1'b0;
                rx_baud_rate_reg_en=1'b0;
            end
            else begin
                rx_next_state=DATA_BITS;
            end
        end
        PARITY:begin
            rx_baud_rate_reg_en=1'b1;
            if (rx_baud_rate && stop_bit) begin
                rx_next_state=STOP_BIT;
                stop_bit_error = (rx_bit==1);
            end
            else if (rx_baud_rate && ~stop_bit) begin
                rx_next_state=LOAD;
                status_register_en=1'b1;
                stop_bit_error = (rx_bit==1);
                rx_baud_rate_reg_en=1'b0;  
            end
            else begin
                rx_next_state=PARITY;
            end
        end
        STOP_BIT:begin
            if (rx_baud_rate) begin
                rx_next_state=LOAD;
                status_register_en=1'b1;
                stop_bit_error=(rx_bit==1) || stop_bit_error;
            end
            else begin
                rx_next_state=STOP_BIT;
            end
        end


        default: rx_next_state=rx_current_state;
    endcase
end


// for transmiter
transmiter_states_t tx_current_state, tx_next_state;

always_ff @( posedge clock ) begin 
    if (reset) begin
        tx_current_state<=IDLE;
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
        IDLE:if (uart_en) tx_next_state=LOAD; else tx_next_state=IDLE;
        LOAD:begin
            if (tx_en && ~rx_fifo_empty) begin
                tx_next_state=TRANSMIT;
                tx_baud_rate_reg_en=1'b1;
                tx_shift_reg_en=1'b1;
                tx_fifo_rd_en=1'b1;
                busy=1'b1;
            end
            else if (!uart_en) begin
                tx_next_state=IDLE;
            end
            else begin
                tx_next_state=LOAD;
            end
        end
        TRANSMIT:begin
            tx_baud_rate_reg_en=1'b1;
            busy=1'b1;
            if ( tx_baurd_rate)begin
                 tx_next_state=START_BIT;
                 tx_shift_en=1'b1;
            end
                else tx_next_state=TRANSMIT;
        end
        START_BIT:begin
            tx_baud_rate_reg_en=1'b1;
            busy=1'b1;
            if (tx_baud_rate)begin
                tx_next_state=DATA_BITS;
                tx_bit_count_reg_en=1'b1;
                tx_shift_en=1'b1;
            end
            else begin
                tx_next_state=START_BIT;
            end

        end
        DATA_BITS: begin
            busy=1'b1;
            tx_baud_rate_reg_en=1'b1;
            if (tx_baud_rate) begin
                tx_next_state=DATA_BITS;
                tx_bit_count_reg_en=1'b1;
                tx_shift_en=1'b1;
            end
            else if (tx_bit_count && (~parity_en) && stop_bit) begin
                tx_next_state=STOP_BIT;
                tx_shift_en=1'b1;
            end
            else if (tx_bit_count && parity_en) begin
                tx_next_state=PARITY;
                tx_shift_en=1'b1;
            end
            else if ( tx_bit_count && (~parity) && (~stop_bit) && (rx_fifo_empty)) begin
                tx_next_state=LOAD;
                tx_shift_en=1'b1;
                busy=1'b0;
                tx_baud_rate_reg_en=1'b0;
            end
            else begin
                tx_next_state=DATA_BITS;
            end
        end
        PARITY:begin
            tx_baud_rate_reg_en=1'b1;
            if (tx_baud_rate && stop_bit) begin
                tx_next_state=STOP_BIT;
                tx_shift_en=1'b1;
            end
            else if (tx_baud_rate && ~stop_bit && (rx_fifo_empty)) begin
                tx_next_state=LOAD;
                tx_baud_rate_reg_en=1'b0;
                tx_shift_en=1'b1;  
            end

            else begin
                tx_next_state=PARITY;
            end
        end
        STOP_BIT:begin
            if (tx_baud_rate) begin
                rx_next_state=LOAD;
                tx_shift_en=1'b1;
            end
            else begin
                rx_next_state=STOP_BIT;
            end
        end
        default: tx_next_state=tx_current_state;
    endcase
end
endmodule