import packages::*;
module data_memory (
    input logic [31:0]wdata_mem,addr_mem,
    input logic [2:0]rd_wr_mem,
    input logic mem_wr,clock,reset,
    output logic [31:0]rdata_mem
);
logic [7:0]memory[100:0];
    always_ff @( negedge clock ) begin 
        if (reset) begin
            memory<=$readmemh("/home/aziz/Documents/Computer_Architecture_Lab/core/testbench/data_memory.txt",register_file);;
        end
        else if (mem_wr && addr_mem > 32'b0)begin
            case (rd_wr_mem)
                LB_SB:memory[addr_mem]   <= wdata_mem[7:0];
                LH_SH:begin
                    memory[addr_mem]     <= wdata_mem[7:0];
                    memory[addr_mem + 1] <= wdata_mem[15:8];
                end
                LW_SW:begin
                    memory[addr_mem]     <= wdata_mem[7:0];
                    memory[addr_mem + 1] <= wdata_mem[15:8];
                    memory[addr_mem + 2] <= wdata_mem[23:16];
                    memory[addr_mem + 3] <= wdata_mem[31:24];
                end
                default: memory[addr_mem]<= wdata_mem[7:0];
            endcase
        end
    end
    always_comb begin 
        case (rd_wr_mem)
            LB_SB  : rdata_mem = {{24{memory[addr_mem][7]}}, memory[addr_mem]};
            LBU    : rdata_mem = {24'b0,memory[addr_mem]};
            LH_SH  : rdata_mem = {{16{memory[addr_mem+1][7]}}, memory[addr_mem+1], memory[addr_mem]};
            LHU    : rdata_mem = {16'b0,memory[addr_mem+1],memory[addr_mem]};
            LW_SW  : rdata_mem = {memory[addr_mem+3],memory[addr_mem +2],memory[addr_mem+1],memory[addr_mem]};
            default: rdata_mem = {{24{memory[addr_mem][7]}}, memory[addr_mem]};
        endcase
    end
    initial begin
        $readmemh("/home/aziz/Documents/Computer_Architecture_Lab/core/testbench/data_memory.txt",memory);
    end
endmodule