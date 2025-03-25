module rx_shift_reg (
    input logic clock,reset,rx_bits,rx_shift_reg_en,
    output logic [7:0] rx_fifo_data
);
logic [7:0] rx_shift_reg;
assign rx_fifo_data=rx_shift_reg;

always_ff @( posedge clock ) begin 
    if (reset)begin
        rx_shift_reg<=8'b0;
    end
    else if (rx_shift_reg_en) begin
        rx_shift_reg <= {rx_bits, rx_shift_reg[7:1]};
    end
end
endmodule