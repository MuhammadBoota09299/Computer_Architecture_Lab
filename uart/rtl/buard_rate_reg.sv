module buard_rate_reg (
    input logic clock,reset,buard_rate_reg_en,
    input logic [15:0] buard_rate,
    output logic buard_rate_en
);
logic [15:0]buard_rate_in,buard_rate_count,buard_rate_count_updated;
logic [16:0]buard_rate_in_updated;
logic sample;
always_comb begin
    
    buard_rate_count_updated=buard_rate_count+1;

    if (sample) begin
       buard_rate_in_updated=buard_rate_in 
    end
    else begin
       buard_rate_in_updated=buard_rate_in>>1'b1; // for sampling at middle
    end

end

always_ff @(posedge clock ) begin 
if (reset) begin
    sample<=1'b0;
    buard_rate_count<=16'b0;
    buard_rate_in<=buard_rate;
    buard_rate_en <= 1'b0;
else if (buard_rate_reg_en) begin
    if (buard_rate_in_updated==buard_rate_count)begin
        buard_rate_count<=1'b0;
        sample<=1'b1;
        buard_rate_en <= 1'b1;
    end
    else  begin
        buard_rate_count<=buard_rate_count_updated;
        sample<=1'b1;
        buard_rate_en <= 1'b0;
    end
end

end
end
    
endmodule