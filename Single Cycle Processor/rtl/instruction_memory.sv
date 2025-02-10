module INSTRUCTION_MEMORY (
    input logic [31:0]addr,
    output logic [31:0]inst
);
    logic [31:0]instruction_memory [31:0];
    always_comb begin
        inst=instruction_memory[addr>>2];
    end

    initial begin
        instruction_memory[0]=32'b0;
        
    end
endmodule