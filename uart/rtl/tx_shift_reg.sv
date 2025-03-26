module tx_shift_reg (
input logic clock,reset,tx_parity_add,tx_shift_reg_en,tx_shift_en,parity_en,
input logic [7:0]tx_data,
output logic tx_bit
);
    // [0] = current output bit
    // [1] = start bit (0)
    // [9:2] = data bits
    // [10] = parity/stop bit

logic [10:0]tx_shift_reg;

assign tx_bit=tx_shift_reg[0];

always_ff @( posedge clock ) begin 
    if (reset) begin
        tx_shift_reg <= 11'b11111111111;
    else if (tx_shift_reg_en) begin
        tx_shift_reg[1]<=1'b0;
        tx_shift_reg[9:2]<=tx_data;
        if (parity_en) tx_shift_reg[10] <= tx_parity_add; else tx_shift_reg[10] <= 1'b1;
    end
    else if (tx_shift_en) begin
        tx_shift_reg<={1'b1,tx_shift_reg[10:1]};
    end
    end
end
endmodule