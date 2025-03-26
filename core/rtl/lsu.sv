import packages;
module lsu (
    input logic[32:0]alu_mem,
    input logic mem_wr_mem,
    output logic uart_sel,mem_en
);
    always_comb begin 
        uart_sel=1'b0;
        mem_en=1'b0;
        if(alu_mem[27:0]==UART_BASE_ADDRESS)begin
            uart_sel=mem_wr_mem;
        end
        else begin
            mem_en=mem_wr_mem;
        end
    end
endmodule