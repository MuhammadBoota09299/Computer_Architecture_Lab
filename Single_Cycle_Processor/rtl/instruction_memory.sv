module instruction_memory (
    input logic [31:0]addr,
    output logic [31:0]inst
);
    logic [31:0]inst_memory [31:0]='{default:0};
    always_comb begin
        inst=inst_memory[addr>>2];
    end

    initial begin
        inst_memory[0]=32'b0;
        
    end
endmodule
