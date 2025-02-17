import packages::*;
module decoder (
    input logic [31:0]instruction,
    output logic reg_wr,sel_B,mem_wr,
    output logic [1:0]wb_sel,
    output logic [2:0]rd_wr_mem,
    output logic [31:0]immediate,
    output logic [3:0]alu_op
);
logic [2:0]funct3;
logic [6:0]opcode;
always_comb begin 
opcode = instruction[6:0];
funct3=instruction[14:12];
rd_wr_mem=funct3;
    case (opcode)
        R_TYPE:begin
            alu_op={funct3,instruction[30]};
            reg_wr=1'b1;
            sel_B=1'b0;
            mem_wr=1'b0;
            wb_sel=2'b0;
        end 
        I_TYPE || LOAD:begin
            alu_op=ADD;
            reg_wr=1'b1;
            immediate = { {20{instruction[31]}}, instruction[31:20] };
            sel_B=1'b1;
            wb_sel = (opcode == LOAD) ? 2'b1 : 2'b0;
            mem_wr=1'b0;
        end
        default:begin
            alu_op=4'b0;
            reg_wr=1'b0;
            immediate =32'b0;
            sel_B=1'b0;
            wb_sel=1'b0;
            mem_wr=1'b0;
            end 
    endcase
        
end 
endmodule
