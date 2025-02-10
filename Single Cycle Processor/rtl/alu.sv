module ALU 
import package::*;
(
    input logic [31:0]a,b,
    input logic [3:0]alu_op,
    output logic [31:0]result
);
    always_comb begin 
        case (alu_op)
            ADD:  result = rs1 + rs2;                             // Addition
            SUB:  result = rs1 - rs2;                             // Subtraction
            XOR:  result = rs1 ^ rs2;                             // XOR
            OR:   result = rs1 | rs2;                             // OR
            AND:  result = rs1 & rs2;                             // AND
            SLL:  result = rs1 << rs2[4:0];                       // Shift Left Logical
            SRL:  result = rs1 >> rs2[4:0];                       // Shift Right Logical
            SRA:  result = $signed(rs1) >>> rs2[4:0];             // Shift Right Arithmetic
            SLT:  result = ($signed(rs1) < $signed(rs2)) ? 1 : 0; // Set Less Than (signed)
            SLTU: result = (rs1 < rs2) ? 1 : 0;                   // Set Less Than Unsigned
            default: result = 32'b0;                              // Default case
        endcase
    end
endmodule