//fetch to decode and execute phase
module pipline_fetch_to_decode (
    input clock,reset,
    input logic [31:0]pc_fetch,instruction_fetch,
    output logic [31:0]pc_decode,instruction_decode;
);
    always_ff @( posedge clock,posedge reset ) begin 
        if (reset) begin
            pc_decode<=32'b0;
            instruction_decode<=32'b00000013;
        end
        else begin
            pc_decode <=pc_fetch;
            instruction_decode <=instruction_fetch;
        end
    end
endmodule

//execute to memory and writeback phase
module pipline_execute_to_memory (
    input logic [31:0]pc_execute, alu_execute,mem_wdata_execute,instruction_execute
    input logic waddr_execute,reg_wr_execute,mem_wr_execute,clock,reset,
    input logic [2:0]rd_wr_mem_execute,
    output logic [31:0]pc_mem, alu_mem,mem_wdata_mem,instruction_mem
    output logic waddr_mem,reg_wr_mem,mem_wr_mem,
    output logic [2:0]rd_wr_mem_mem,    
);
    always_ff @( posedge clock ) begin 
        if reset begin
            pc_mem <=32'b0;
            alu_mem <=32'b0;
            mem_wdata_mem <=32'b0;
            instruction_mem <=32'h00000013;
            waddr_mem <=1'b0;
            reg_wr_mem <=1'b0;
            mem_wr_mem <=1'b0;
            rd_wr_mem_mem <=3'b0;
        end
    end
endmodule