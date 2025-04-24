module instruction_memory (
    input logic [31:0]addr,
    output logic [31:0]inst
);
    logic [31:0]inst_memory [300:0];
    always_comb begin
        inst=inst_memory[addr>>2];
    end
    
    initial begin
    $readmemh("/home/aziz/Documents/Computer_Architecture_Lab/assembly/c_commands/build/main.txt",inst_memory);
    //$readmemh("/home/aziz/Documents/Computer_Architecture_Lab/assembly/riscv_commands/build//gcd.txt",inst_memory);
    end
endmodule
