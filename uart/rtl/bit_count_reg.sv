module bit_count_reg (
    input logic clock, reset, tx_bit_count_reg_en, rx_bit_count_reg_en,  // Fixed typo: clcok -> clock
    input logic [1:0] no_of_bits,
    output logic tx_bit_count, rx_bit_count
);
    logic [3:0] tx_bit_co = 4'b0;  // Combined declaration and initialization
    logic [3:0] rx_bit_co = 4'b0;
    logic [3:0] tx_bits_co, rx_bits_co;  // Separate declarations
    
    always_comb begin
        tx_bits_co = tx_bit_co + 1;
        rx_bits_co = rx_bit_co + 1;
    end

    always_ff @(posedge clock) begin 
        if (reset) begin
            tx_bit_count <= 1'b0;
            tx_bit_co <= 4'b0;
        end
        else if (tx_bit_count_reg_en) begin
            if (tx_bit_co == (no_of_bits + 4'h4)) begin  
                tx_bit_count <= 1'b1;
                tx_bit_co <= 4'b0;  
            end
            else begin
                tx_bit_co <= tx_bits_co; 
                tx_bit_count <= 1'b0;
            end
        end
    end

    always_ff @(posedge clock) begin 
        if (reset) begin
            rx_bit_count <= 1'b0;
            rx_bit_co <= 4'b0;
        end
        else if (rx_bit_count_reg_en) begin
            if (rx_bit_co == (no_of_bits + 4'h4)) begin
                rx_bit_count <= 1'b1;
                rx_bit_co <= 4'b0;  
            end
            else begin
                rx_bit_co <= rx_bits_co; 
                rx_bit_count <= 1'b0;
            end
        end
    end
endmodule