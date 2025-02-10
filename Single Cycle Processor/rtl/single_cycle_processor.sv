module SINGLE_CYCLE_PROCESSOR (
    input logic reset,clock
);
logic [31:0]inst,pc,pc_next,result,rdata1,raddr2;
logic [3:0]alu_op;
logic reg_wr;
//pc
PC pc(.clock,.reset,.pc_next,.pc);
PC_ADD pc_4_add(.pc,.pc_next);
//instruction memory
INSTRUCTION_MEMORY instruction_memory(.addr(pc_next),.inst);
//registerfile
REGISTERFILE registerfile(.addr1(inst[19:15]),.addr2(inst[24:20]),.waddr(inst[11:7]),.wdata(result),.reg_wr,.raddr1,.rdata2,.clock,.reset);
//decoder
DECODER decoder(.instruction(inst),.reg_wr,.alu_op);
endmodule