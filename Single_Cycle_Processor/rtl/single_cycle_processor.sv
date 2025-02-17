module single_cycle_processor (
    input logic reset,clock
);
logic [31:0]inst,pc,pc_next,result,rdata1,rdata2,rs2,immediate;
logic [3:0]alu_op;
logic reg_wr,sel_B;
//pc
pc _pc(.clock,.reset,.pc_next,.pc);
pc_add pc_4_add(.pc,.pc_next);
//instruction memory
instruction_memory _instruction_memory(.addr(pc_next),.inst);
//registerfile
registerfile _registerfile(.raddr1(inst[19:15]),.raddr2(inst[24:20]),.waddr(inst[11:7]),.wdata(result),.reg_wr,.rdata1,.rdata2,.clock,.reset);
//decoder
decoder _decoder(.instruction(inst),.reg_wr,.alu_op,.immediate,.sel_B);
//sel_B
mux2_1 Sel_B(.input0(rdata2),.input1(immediate),.out(rs2),.sel(sel_B));
//Alu
alu _alu(.rs1(rdata1),.rs2,.result,.alu_op);
endmodule
