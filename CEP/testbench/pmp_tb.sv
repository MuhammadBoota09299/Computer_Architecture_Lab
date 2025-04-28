import cep_define ::*;
module pmp_tb ();
  logic clock, reset, wr_en;
  logic [1:0] priv_mode, size, oper, permission;
  logic [31:0] wdata, rw_addr, addr, rdata;

  // Instantiate the PMP module
  pmp PMP(.*);

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // Toggle clock every 5ns (100MHz clock)
  end

  // Reset and test sequence
  initial begin
    // Initialize all inputs
    reset = 1'b1;
    oper = 2'b0;
    wr_en = 1'b0;
    priv_mode = 2'b01;
    size = 2'b00;
    wdata = 32'b0;
    rw_addr = 32'b0;
    addr = 32'b0;
    
    // Apply reset
    #20 reset = 1'b0;
      


    // Test case 1: Basic write and read
    wr_en = 1'b1;
    oper = 2'b01; // Write operation
    priv_mode = 2'b00;
    rw_addr = CSR_PMPADDR0;
    wdata = 32'h12345678;
    #10;
    rw_addr = CSR_PMPCFG0;
    wdata = 32'h12345678;
    #10;

    $stop;
  end

  // Waveform dumping (for debugging)
  initial begin
    $dumpfile("pmp_tb.vcd");
    $dumpvars(0, pmp_tb);
  end

endmodule