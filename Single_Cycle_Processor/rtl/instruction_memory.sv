module instruction_memory (
    input logic [31:0]addr,
    output logic [31:0]inst
);
    logic [31:0]inst_memory [31:0]='{default:0};
    always_comb begin
        inst=inst_memory[addr>>2];
    end

    initial begin
    //$readmemh("/home/aziz/Documents/Computer_Architecture_Lab/Single_Cycle_Processor/commands_c/build/main.txt",inst_memory);
    $readmemh("/home/aziz/Documents/Computer_Architecture_Lab/Single_Cycle_Processor/commands_riscv/build//gcd.txt",inst_memory);
    end
endmodule
