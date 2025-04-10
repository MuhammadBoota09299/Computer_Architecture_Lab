import packages ::*;
module lsu (
    input logic[31:0]alu_mem,
    input logic mem_wr_mem,
    output logic uart_sel,mem_wr_en,uart_wr_enable,
    output logic [3:0]uart_addr
);
    always_comb begin 
        uart_addr=alu_mem[3:0];
        if(alu_mem[31:4]==UART_BASE_ADDRESS)begin
            uart_sel=1'b1;
            mem_wr_en=1'b0;
            uart_wr_enable=mem_wr_mem;
        end
        else begin
            uart_wr_enable=1'b0;
            uart_sel=1'b0;
            mem_wr_en=mem_wr_mem;
        end
    end
endmodule