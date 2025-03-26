module uart_tb ();
logic rx_bit,clock,reset,tx_bit,uart_wr_enable,uart_sel;
logic [3:0]uart_addr;
logic [31:0]wdata_mem,uart_data;

uart dut (
    .*
);
forever begin
    clock=~clock ;
    #1;
end
initial begin
    clock=1'b0;
    reset=1'b1;
    rx_bit=1'b1;
    uart_wr_enable=1'b0;
    uart_sel=1'b0;
    uart_addr=4'b0;
    wdata_mem=32'b0;
    #5;
    reset=1'b0;
    

end
endmodule