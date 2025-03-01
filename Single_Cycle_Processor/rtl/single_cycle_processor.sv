module single_cycle_processor (
    input logic reset,clock
);
logic [31:0]inst_decode,inst,instruction,pc,pc_decode,pc_next,result,rdata1,rdata2,rs1,rs2,immediate,mem_rdata,reg_data,pc_alu;
logic [3:0]alu_op;
logic [2:0]rd_wr_mem,br_type;
logic [1:0]wb_sel;
logic reg_wr,sel_B,sel_A,mem_wr,br_taken;

//-----------fetch phase----------------

//pc
pc _pc(.clock,.reset,.pc_in(pc_alu),.pc);
pc_add pc_4_add(.pc,.pc_next);
// PC or ALU slector mux
mux2_1 PC_ALU_sel(.sel(br_taken),.input0(pc_next),.input1(result),.out(pc_alu));
//instruction memory
instruction_memory _instruction_memory(.addr(pc),.inst);
//pipeline register
pipline_fetch_to_decode fetch_to_decode_reg(.clock,.reset,.pc_fetch(pc),.instruction_fetch(inst),
.pc_execute,.instruction_execute(instruction))


//--------------decode and execute phase-------------

//registerfile
registerfile _registerfile(.raddr1(instruction[19:15]),.raddr2(instruction[24:20]),
.waddr,.wdata(reg_data),.reg_wr(reg_wr_mem),.rdata1,.rdata2,.clock,.reset);
//decoder
decoder _decoder(.instruction,.reg_wr,.alu_op,.immediate,.sel_B,.sel_A,.mem_wr,.wb_sel,.rd_wr_mem,.br_type);
//sel_A mux for rs1 or pc
mux2_1 Sel_A(.input0(rdata1),.input1(pc_execute),.out(rs1),.sel(sel_A));
//sel_B mux for rs2 or immediate
mux2_1 Sel_B(.input0(rdata2),.input1(immediate),.out(rs2),.sel(sel_B));
//Alu
alu _alu(.rs1,.rs2,.result,.alu_op);
//branch condition check
branch branch_condition(.rdata1,.rdata2,.br_type,.br_taken);


//---------------memory and writeback phase---------------

pipline_execute_to_memory execute_to_memory_reg(.clock,.reset,.pc_execute,.alu_execute(result),
.mem_wdata_execute(raddr2),.instruction_execute(instruction), .waddr_execute(instruction[11:7]),
.reg_wr_execute(reg_wr),.mem_wr_execute(mem_wr),.rd_wr_mem_execute(rd_wr_mem),
.pc_mem, .alu_mem,.mem_wdata_mem(wdata_mem),.instruction_mem, .waddr_mem(waddr),.reg_wr_mem,.mem_wr_mem, rd_wr_mem_mem);
//data memory
data_memory Data_memory(.clock,.reset,.addr_mem(alu_mem>>1),.wdata_mem,.rdata(mem_rdata),.mem_wr(mem_wr_mem),.rd_wr_mem(rd_wr_mem_mem));
//writeback mux
mux3_1 writeback_mux(.input0(result),.input1(mem_rdata),.input2(pc_next),.out(reg_data),.sel(wb_sel));

endmodule
