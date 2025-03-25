module buad_rate_reg (
    input logic clock,reset,buad_rate_reg_en,
    input logic [15:0] buad_rate,
    output logic buad_rate_en
);
logic [15:0]buad_rate_count,baud_rate_count_updated;
logic [16:0]baud_rate_updated;
logic sample;
always_comb begin
    
    baud_rate_count_updated=baud_rate_count+1;

    if (sample) begin
       baud_rate_updated=baud_rate 
    end
    else begin
       baud_rate_updated=baud_rate>>1'b1; // for sampling at middle
    end

end

always_ff @(posedge clock ) begin 
if (reset) begin
    sample<=1'b0;
    baud_rate_count<=16'b0;
    baud_rate_en <= 1'b0;
else if (baud_rate_reg_en) begin
    if (baud_rate_updated==baud_rate_count)begin
        baud_rate_count<=1'b0;
        sample<=1'b1;
        baud_rate_en <= 1'b1;
    end
    else  begin
        baud_rate_count<=baud_rate_count_updated;
        sample<=1'b1;
        baud_rate_en <= 1'b0;
    end
end

end
end
    
endmodule