//fetch to decode and execute phase
module pipline_fetch_to_decode (
    input clock,reset,stall,br_taken,
    input logic [31:0]pc_fetch,instruction_fetch,
    output logic [31:0]pc_execute,instruction_execute;
);
    always_ff @( posedge clock,posedge reset ) begin 
        if (reset | stall | br_taken) begin
            pc_execute<=32'b0;
            instruction_execute<=32'b00000013;
        end
        else begin
            pc_execute <=pc_fetch;
            instruction_execute <=instruction_fetch;
        end
    end
endmodule

//execute to memory and writeback phase
module pipline_execute_to_memory (
    input logic [31:0]pc_execute, alu_execute,mem_wdata_execute,instruction_execute
    input logic reg_wr_execute,mem_wr_execute,clock,reset,wb_sel_execute,
    input logic [2:0]rd_wr_mem_execute,
    output logic [31:0]pc_mem, alu_mem,mem_wdata_mem,instruction_mem
    output logic waddr_mem,mem_wr_mem,wb_sel_mem,
    output logic [2:0]rd_wr_mem_mem,    
);
    always_ff @( posedge clock ) begin 
        if reset begin
            pc_mem <=32'b0;
            alu_mem <=32'b0;
            mem_wdata_mem <=32'b0;
            instruction_mem <=32'h00000013;
            waddr_mem <=1'b0;
            wb_sel_mem <=1'b0;
            mem_wr_mem <=1'b0;
            rd_wr_mem_mem <=3'b0;
        end
        else begin
             pc_mem <= pc_execute;
            alu_mem <= alu_execute;
            mem_wdata_mem <= mem_wdata_execute;
            instruction_mem <= instruction_execute;
            mem_wr_mem <=mem_wr_execute;
            wb_sel_mem <= wb_sel_execute;
            rd_wr_mem_mem <=rd_wr_mem_execute;
        end
    end
endmodule