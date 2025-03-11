import packages::*;
module decoder (
    input logic [31:0]instruction,
    output logic reg_wr,sel_B,mem_wr,sel_A,stall,
    output logic [1:0]wb_sel,
    output logic [2:0]rd_wr_mem,br_type,
    output logic [31:0]immediate,
    output logic [3:0]alu_op
);
logic [2:0]funct3;
logic [6:0]opcode;
always_comb begin 
opcode = instruction[6:0];
funct3=instruction[14:12];
rd_wr_mem=funct3;
stall=1'b0;
    case (opcode)
        R_TYPE:begin
            alu_op={funct3,instruction[30]};
            reg_wr=1'b1;
            sel_B=1'b0;
            sel_A=1'b0;
            mem_wr=1'b0;
            wb_sel=2'b0;
            br_type=PC;
        end 
        I_TYPE , LOAD:begin
            alu_op=ADD;
            reg_wr=1'b1;
            immediate = { {20{instruction[31]}}, instruction[31:20] };
            sel_B=1'b1;
            sel_A=1'b0;
            wb_sel = (opcode == LOAD) ? 2'b1 : 2'b0;
            mem_wr=1'b0;
            br_type=PC;
        end
        STORE:begin
            alu_op=ADD;
            reg_wr=1'b0;
            mem_wr=1'b1;
            sel_B=1'b1;
            sel_A=1'b0;
            immediate={{20{instruction[31]}},instruction[31:25], instruction[11:7]};
            br_type=PC;
        end
        BRANCH:begin
            br_type=funct3;
            alu_op=ADD;
            reg_wr=1'b0;
            sel_A=1'b1;
            sel_B=1'b1;
            mem_wr=1'b0;
            immediate={{19{instruction[31]}},instruction[31],instruction[7],instruction[30:25],instruction[11:8],1'b0};
        end
        LUI , AUIPC :begin
            alu_op=(opcode==LUI) ? PASS: ADD;
            reg_wr=1'b1;
            sel_A =1'b1;
            sel_B =1'b1;
            br_type=PC;
            wb_sel =2'b0;
            immediate={instruction[31:12], 12'b0};
            mem_wr=1'b0;
        end
        JAL,JALR:begin
            alu_op=ADD;
            reg_wr=1'b1;
            sel_A=(opcode==JAL) ? 1'b1:1'b0;
            sel_B=1'b1;
            br_type=ALU;
            wb_sel=2'b10;
            mem_wr=1'b0;
            stall=1'b1;
            immediate=(opcode==JAL) ? {{19{instruction[31]}},instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0} :{ {20{instruction[31]}}, instruction[31:20] };
        end
        default:begin
            alu_op=4'b0;
            reg_wr=1'b0;
            immediate =32'b0;
            sel_B=1'b0;
            sel_A=1'b0;
            wb_sel=1'b0;
            mem_wr=1'b0;
            br_type=PC;
            end 
    endcase
        
end 
endmodule
