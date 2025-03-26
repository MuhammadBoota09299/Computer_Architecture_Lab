module baud_rate_reg (
    input logic clock,reset,tx_baud_rate_reg_en,rx_baud_rate_reg_en,
    input logic [15:0] baud_rate,
    output logic tx_baud_rate,rx_baud_rate
);
logic [15:0]rx_baud_rate_count,rx_baud_rate_count_updated,tx_baud_rate_count,tx_baud_rate_count_updated;
logic [15:0]rx_baud_rate_updated;
logic sample;
always_comb begin
    
    tx_baud_rate_count_updated=tx_baud_rate_count+1;
    rx_baud_rate_count_updated=rx_baud_rate_count+1;

    if (sample) begin
       rx_baud_rate_updated=baud_rate 
    end
    else begin
       rx_baud_rate_updated=baud_rate>>1'b1; // for sampling at middle
    end

end

always_ff @(posedge clock ) begin 
if (reset) begin
    sample<=1'b0;
    rx_baud_rate_count<=16'b0;
    rx_baud_rate <= 1'b0;
else if (rx_baud_rate_reg_en) begin
    if (rx_baud_rate_updated==rx_baud_rate_count)begin
        rx_baud_rate_count<=1'b0;
        sample<=1'b1;
        rx_baud_rate <= 1'b1;
    end
    else  begin
        rx_baud_rate_count<=rx_baud_rate_count_updated;
        sample<=1'b1;
        rx_baud_rate <= 1'b0;
    end
end

end
end

always_ff @(posedge clock ) begin 
if (reset) begin
    tx_baud_rate_count<=16'b0;
    tx_baud_rate <= 1'b0;
else if (tx_baud_rate_reg_en) begin
    if (baud_rate==tx_baud_rate_count)begin
        tx_baud_rate_count<=1'b0;
        tx_baud_rate <= 1'b1;
    end
    else  begin
        tx_baud_rate_count<=tx_baud_rate_count_updated;
        tx_baud_rate <= 1'b0;
    end
end

end
end  
endmodule