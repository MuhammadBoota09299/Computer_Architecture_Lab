import cep_define ::*;
module pmp_tb ();
  logic clock, reset, wr_en;
  logic [1:0] priv_mode, size, oper, permission;
  logic [31:0] wdata, rw_addr, addr, rdata;
  pmpcfg cfg0,cfg1,cfg2,cfg3,cfg4,cfg5,cfg6,cfg7,cfg8,cfg9,cfg10,cfg11,cfg12,cfg13,cfg14,cfg15;
  logic [31:0]pmpaddr0,pmpaddr1,pmpaddr2,pmpaddr3,pmpaddr4,pmpaddr5,pmpaddr6,pmpaddr7,
    pmpaddr8,pmpaddr9,pmpaddr10,pmpaddr11,pmpaddr12,pmpaddr13,pmpaddr14,pmpaddr15;

  logic [31:0] pmpcfg0, pmpcfg1, pmpcfg2, pmpcfg3;

  assign {cfg3,cfg2,cfg1,cfg0}    =pmpcfg0;
  assign {cfg6,cfg6,cfg5,cfg4}    =pmpcfg1;
  assign {cfg10,cfg9,cfg8,cfg7}   =pmpcfg2;
  assign {cfg14,cfg13,cfg12,cfg11}=pmpcfg3;
  
  // Instantiate the PMP module
  pmp PMP(.*);

  // Clock generation
  initial begin
    clock = 0;
    forever #1 clock = ~clock; // Toggle clock every 5ns (100MHz clock)
  end

  // Reset and test sequence
  initial begin
    // Initialize all inputs
    reset = 1'b1;
    oper = READ;
    wr_en = 1'b0;
    priv_mode = 2'b01;
    size = 2'b00;
    wdata = 32'b0;
    rw_addr = 32'b0;
    addr = 32'b0;
    // Initialize PMP configs
    cfg0 = '{default:0};
    cfg1 = '{default:0};
    cfg2 = '{default:0};
    cfg3 = '{default:0};
  
    // Apply reset
    #4;
    @(posedge clock)
     reset = 1'b0;
     
                                              // Test case 1: Basic write and read
    wr_en = 1'b1;
    oper = WRITE;
    priv_mode = 2'b00;
    rw_addr = CSR_PMPADDR0;
    wdata = 32'h20000000;
    @(posedge clock)
    wr_en=32'b0;
    rw_addr = CSR_PMPCFG0;
    cfg0.R=0;cfg0.W=0;cfg0.X=1;cfg0.A=NAPOT;cfg0.L=0;
    cfg1.R=0;cfg1.W=1;cfg1.X=0;cfg1.A=TOR;cfg1.L=1;
    cfg2.R=1;cfg2.W=0;cfg2.X=1;cfg2.A=NA4;cfg2.L=1;
    cfg3.R=0;cfg3.W=1;cfg3.X=0;cfg3.A=NAPOT;cfg3.L=0;
    @(posedge clock)
    wdata = pmpcfg_reg;
    wr_en=1'b1;
    @(posedge clock)
    wr_en=32'b0;
    priv_mode=2'b1;
    addr = 32'h20000000;
    @(posedge clock)
    oper=READ;
    @(posedge clock)
    oper=EXECUTE;

//                               address 2
    @(posedge clock)
    addr = 32'h20000001;
    oper = READ;
    @(posedge clock)
    oper=WRITE;
    @(posedge clock)
    oper=EXECUTE;
    @(posedge clock)

//                               address 3
    @(posedge clock)
    addr = 32'h20000003;
    oper = READ;
    @(posedge clock)
    oper=WRITE;
    @(posedge clock)
    oper=EXECUTE;
    @(posedge clock)

    //                               address 4
    @(posedge clock)
    addr = 32'h20000007;
    oper = READ;
    @(posedge clock)
    oper=WRITE;
    @(posedge clock)
    oper=EXECUTE;
    @(posedge clock)
    //                               address 5
    @(posedge clock)
    addr = 32'h2000000A;
    oper = READ;
    @(posedge clock)
    oper=WRITE;
    @(posedge clock)
    oper=EXECUTE;
    @(posedge clock)



    //                         test no.2
     wr_en = 1'b1;
    priv_mode = 2'b00;
    rw_addr = CSR_PMPADDR1;
    wdata = 32'h30000000;
    @(posedge clock)
    wr_en=32'b0;
    priv_mode=3'b01;
    //                               address 2
    @(posedge clock)
    addr = 32'h29000001;
    oper = READ;
    @(posedge clock)
    oper=WRITE;
    @(posedge clock)
    oper=EXECUTE;
    @(posedge clock)

//                               address 3
    @(posedge clock)
    addr = 32'h40000003;
    oper = READ;
    @(posedge clock)
    oper=WRITE;
    @(posedge clock)
    oper=EXECUTE;
    @(posedge clock)

    //                               address 4
    @(posedge clock)
    addr = 32'h20000002;
    oper = READ;
    @(posedge clock)
    oper=WRITE;
    @(posedge clock)
    oper=EXECUTE;
    @(posedge clock)
    //                               address 4
    @(posedge clock)
    addr = 32'h30000000;
    oper = READ;
    @(posedge clock)
    oper=WRITE;
    @(posedge clock)
    oper=EXECUTE;
    @(posedge clock)
    $stop;
  end

  // Waveform dumping (for debugging)
  initial begin
    $dumpfile("pmp_tb.vcd");
    $dumpvars(0, pmp_tb);
  end

endmodule