module bit_count_reg (
    input logic clcok,reset,bit_count_reg_en,
    input logic [1:0] no_of_bits,
    output logic bit_count
);
logic [2:0] bits_co,bit_co=3'b0,bits;
always_comb begin
bits_co=bit_co+1;
end

always_ff @( posedge clock ) begin 
    if (reset) begin
        bit_count <= 1'b0;
        bits <= no_of_bits;
        bit_co <= 3'b0;
    end
    else if (bit_count_reg_en) begin
        if (bit_co == (bits+3'h4)) begin
            bit_count<=1'b1;
            bit_co=3'b0;
        end
        else begin
            bit_co<=bits_co;
            bit_count <= 1'b0;
        end
    end
end
endmodule