module decoder 
import package::*;
(
    input logic [31:0]instruction,
    output logic reg_wr,
    output logic [3:0]alu_op
);
logic [2,0]funct3;
logic [6:0]opcode;
always_comb begin 
funct3=instruction[12:14];
    case (opcode)
        R_TYPE:begin
            alu_op={funct3,instruction[30]};
            reg_wr=1'b1;
        end 
        default: 
    endcase
end 
endmodule