module pmp_tb ();
  logic clock,reset,wr_en;
  logic [1:0]priv_mode,size,oper,permission;
  logic [31:0]wdata,rw_addr,addr,rdata;


pmp PMP(.*);

initial begin
    clock = 0;
    forever #5 clock = ~clock; // Toggle clock every 5ns
end

initial begin
    reset=1'b1;
    oper=1'b0;
    wr_en=1'b0;
    priv_mode=2'b1;
    size=2'b0;
    wdata=32'b0;
    rw_addr=32'b0;
    addr=32'b0;
    $finish;
end


endmodule