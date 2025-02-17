module single_cycle_processor (
    input logic reset,clock
);
logic [31:0]inst,pc,pc_next,result,rdata1,rdata2,rs2,immediate,mem_rdata,reg_data;
logic [3:0]alu_op;
logic [2:0]rd_wr_mem;
logic [1:0]wb_sel;
logic reg_wr,sel_B,mem_wr;
//pc
pc _pc(.clock,.reset,.pc_next,.pc);
pc_add pc_4_add(.pc,.pc_next);
//instruction memory
instruction_memory _instruction_memory(.addr(pc),.inst);
//registerfile
registerfile _registerfile(.raddr1(inst[19:15]),.raddr2(inst[24:20]),.waddr(inst[11:7]),.wdata(reg_data),.reg_wr,.rdata1,.rdata2,.clock,.reset);
//decoder
decoder _decoder(.instruction(inst),.reg_wr,.alu_op,.immediate,.sel_B,.mem_wr,.wb_sel,.rd_wr_mem);
//sel_B
mux2_1 Sel_B(.input0(rdata2),.input1(immediate),.out(rs2),.sel(sel_B));
//Alu
alu _alu(.rs1(rdata1),.rs2,.result,.alu_op);
//data memory
data_memory Data_memory(.clock,.reset,.addr_mem(result>>1),.wdata_mem(rdata2),.rdata(mem_rdata),.mem_wr,.rd_wr_mem);
//writeback mux
mux3_1 writeback_mux(.input0(result),.input1(mem_rdata),.input2(pc_next),.out(reg_data),.sel(wb_sel));
endmodule
