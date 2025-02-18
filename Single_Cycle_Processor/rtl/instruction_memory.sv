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
        inst_memory[1]=32'h05400413;
        inst_memory[2]=32'h03c00493;
        inst_memory[3]=32'h00940c63;
        inst_memory[4]=32'h00944663;
        inst_memory[5]=32'h40940433;
        inst_memory[6]=32'hff5ff06f;
        inst_memory[7]=32'h408484b3;
        inst_memory[8]=32'hfedff06f;
        inst_memory[9]=32'h00802423;
        inst_memory[10]=32'h00802503;
        inst_memory[11]=32'h0000006f;
    end
endmodule
