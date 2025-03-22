import packages::*;
module branch (
    input logic [31:0]rdata1,rdata2,
    input logic [2:0]br_type,
    output logic br_taken
);
    always_comb begin
        case (br_type)
            BEQ : br_taken = (rdata1 == rdata2) ? 2'b1 : 2'b0;
            BNE : br_taken = (rdata1 != rdata2) ? 2'b1 : 2'b0;
            BLT : br_taken = ($signed(rdata1) < $signed(rdata2)) ? 1'b1 : 1'b0;
            BGE : br_taken = ($signed(rdata1) >= $signed(rdata2)) ? 1'b1 : 1'b0;
            BLTU: br_taken = (rdata1 < rdata2) ? 1'b1 : 1'b0; 
            BGEU: br_taken = (rdata1 >= rdata2) ? 1'b1 : 1'b0;
            PC  : br_taken =  1'b0;
            ALU : br_taken =  1'b1;
            default: br_taken=1'b0;
        endcase
    end
endmodule