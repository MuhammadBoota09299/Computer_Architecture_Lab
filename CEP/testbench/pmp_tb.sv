import cep_define ::*;
module pmp_tb #(parameter NUM_OF_TEST = 1000) ();
  logic clock, reset, wr_en;
  logic [1:0] priv_mode, size, oper, permission;
  logic [31:0] wdata, rw_addr, addr, rdata, base,offset;    
  pmpcfg cfg[15:0];      // Array of 16 pmpcfg structures: cfg[0] to cfg[15]
  logic [31:0]_pmpcfg_reg_data;
  logic [31:0] _pmpaddr_reg_data;
  logic [4:0]width;     
  logic [31:0] pmpaddr[15:0]; // Array of 16 32-bit PMP addresses: pmpaddr[0] to pmpaddr[15]
  logic [31:0] _pmpcfg[3:0];
  integer i;

  assign {cfg[3],cfg[2],cfg[1],cfg[0]}    =_pmpcfg[0];
  assign {cfg[7],cfg[6],cfg[5],cfg[4]}    =_pmpcfg[1];
  assign {cfg[11],cfg[10],cfg[9],cfg[8]}  =_pmpcfg[2];
  assign {cfg[15],cfg[14],cfg[13],cfg[12]}=_pmpcfg[3];
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
    _pmpcfg={8'b0,8'b0,8'b0,8'b0};
    pmpaddr={32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0};
    oper = READ;
    wr_en = 1'b0;
    priv_mode = 2'b01;
    size = 2'b00;
    wdata = 32'b0;
    rw_addr = 32'b0;
    addr = 32'b0;
    // Apply reset
    #4;
    @(posedge clock)
      reset = 1'b0;
     
                                              // Test case 1: Basic write and read
    @(posedge clock)
      pmp_test(NUM_OF_TEST); //no of tests
    @(posedge clock)
    $stop;
  end
//
task automatic pmp_test(input int test_num);
for ( int j=0 ;j<=test_num ;j++ ) begin
    pmp_register_write();
    repeat(10) begin
    @(posedge clock)
    addr=$urandom;
    priv_mode=$urandom_range(0,3);
    size=$urandom;
    oper=$urandom_range(0,2);
    @(posedge clock)
    error_check();
    #20;
  end
  @(posedge clock)
  reset=1'b1;
  _pmpcfg={8'b0,8'b0,8'b0,8'b0};
  pmpaddr={32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0};
  @(posedge clock)
  reset=1'b0;
end
endtask

task automatic error_check();
  for (int k = 0; k < 16; k++) begin
    case (cfg[k].A)
      TOR: begin
        if (k == 0) begin
          if ((0<=(addr+size))&&((addr+size)<pmpaddr[k])) begin
            #10;
            permission_check(k);
            #10;
            pmp_reg_check(k);
            break;
          end
        end 
        else if ((pmpaddr[k-1]<= (addr+size))&&((addr+size)<pmpaddr[k])) begin
          #10;
          permission_check(k);
          #10;
          pmp_reg_check(k);
          break;
        end
      end

      NA4: begin
        if ((pmpaddr[k] <=(addr+size))&&((addr+size) <(pmpaddr[k]+4))) begin
          #10;
          permission_check(k);
          #10;
          pmp_reg_check(k);
          break;
        end 
      end

      NAPOT: begin
        // NAPOT requires encoded size in address bits
        casez (pmpaddr[k])  // casez allows ? for don't-care bits
          32'b???????????????????????????????0: width = 5'd0;
          32'b??????????????????????????????01: width = 5'd1;
          32'b?????????????????????????????011: width = 5'd2;
          32'b????????????????????????????0111: width = 5'd3;
          32'b???????????????????????????01111: width = 5'd4;
          32'b??????????????????????????011111: width = 5'd5;
          32'b?????????????????????????0111111: width = 5'd6;
          32'b????????????????????????01111111: width = 5'd7;
          32'b???????????????????????011111111: width = 5'd8;
          32'b??????????????????????0111111111: width = 5'd9;
          32'b?????????????????????01111111111: width = 5'd10;
          32'b????????????????????011111111111: width = 5'd11;
          32'b???????????????????0111111111111: width = 5'd12;
          32'b??????????????????01111111111111: width = 5'd13;
          32'b?????????????????011111111111111: width = 5'd14;
          32'b????????????????0111111111111111: width = 5'd15;
          32'b???????????????01111111111111111: width = 5'd16;
          32'b??????????????011111111111111111: width = 5'd17;
          32'b?????????????0111111111111111111: width = 5'd18;
          32'b????????????01111111111111111111: width = 5'd19;
          32'b???????????011111111111111111111: width = 5'd20;
          32'b??????????0111111111111111111111: width = 5'd21;
          32'b?????????01111111111111111111111: width = 5'd22;
          32'b????????011111111111111111111111: width = 5'd23;
          32'b???????0111111111111111111111111: width = 5'd24;
          32'b??????01111111111111111111111111: width = 5'd25;
          32'b?????011111111111111111111111111: width = 5'd26;
          32'b????0111111111111111111111111111: width = 5'd27;
          32'b???01111111111111111111111111111: width = 5'd28;
          32'b??011111111111111111111111111111: width = 5'd29;
          32'b?0111111111111111111111111111111: width = 5'd30;
          32'b01111111111111111111111111111111: width = 5'd31;
                default: width = 5'd0;  // When no bits are set
    endcase
      base=pmpaddr[k]&((32'hFFFFFFFF)<<width);
      offset=8<<width;
      #10;
        if ((base<=(addr+size))&&((addr+size)<(base+offset))) begin
          #10;
          permission_check(k);
          #10;
          pmp_reg_check(k);
          break;
        end
      end
      default: begin
      end
    endcase
    #10;
  end
endtask

//                                  READ  FUNCTION                //
task pmpcfg_read(input logic [3:0] num, output logic [31:0] pmpcfg_reg_data );
    priv_mode = 2'b00;
    wr_en = 1'b0;
    rw_addr = 12'h3A0 + num[3:2]; // Accesses pmpcfg0, pmpcfg1, etc.
    #10;
    pmpcfg_reg_data = rdata; // Select the correct byte
    #10;
    priv_mode = 2'b01;
endtask

task pmpaddr_read(input logic [3:0]num ,output logic [31:0] pmpaddr_reg_data);
    priv_mode = 2'b00;
    wr_en = 1'b0;
    rw_addr = 12'h3B0 +num;
    #10;
    pmpaddr_reg_data=rdata;
    #10;
    priv_mode = 2'b01;
endtask

//                                  WRITE FUNCTION                // 

task automatic pmp_register_write();
    priv_mode = 2'b00;
    for (i = 0; i<16;i++ ) begin
      rw_addr = 12'h3B0 +i; 
      if (cfg[i].L == 1'b0) pmpaddr[i]=$urandom;
      wdata = pmpaddr[i] ;
      #5;
      wr_en = 1'b1;
      @(posedge clock)
      wr_en = 1'b0; // for pmpcfg register
      rw_addr = 12'h3A0 +i[3:2];
      if (cfg[{i[3:2],2'b00}].L ==1'b0 && cfg[{i[3:2],2'b01}].L ==1'b0 && cfg[{i[3:2],2'b10}].L ==1'b0 && cfg[{i[3:2],2'b11}].L ==1'b0) _pmpcfg[i[3:2]]=$urandom;
      wdata = _pmpcfg[i[3:2]] ;
      #5;
      wr_en=1'b1;
      @(posedge clock)
      wr_en=32'b0;
      #10;
    end
    priv_mode=2'b1;
endtask

task automatic permission_check(input logic[3:0] num);
  case (oper)
    2'b00:if ((cfg[num].R==1'b1 && permission==2'b11) || (cfg[num].R==1'b0 && permission==oper)) $display("Test has been passed");
    2'b01:if ((cfg[num].W==1'b1 && permission==2'b11) || (cfg[num].W==1'b0 && permission==oper)) $display("Test has been passed");
    2'b10:if ((cfg[num].X==1'b1 && permission==2'b11) || (cfg[num].X==1'b0 && permission==oper)) $display("Test has been passed");
    default: $display("Test has been FAILED");
  endcase;
endtask

task automatic pmp_reg_check(input logic [3:0]num);
  pmpcfg_read(num,_pmpcfg_reg_data);
  @(posedge clock)
  pmpaddr_read(num,_pmpaddr_reg_data);
  @(posedge clock)
  if ((_pmpcfg[num[3:2]]==_pmpcfg_reg_data) && (pmpaddr[num]==_pmpaddr_reg_data)) begin
    $display("Selected pmpcfg is L=%d,A=%d,X=%d,W=%d,R=%d, and pmpaddr is %b",cfg[num].L,cfg[num].A,cfg[num].X,cfg[num].W,cfg[num].R,pmpaddr[num]);
    $display("Our addr=%b , size=%h , oper=%d, and permission=%d",addr,size,oper,permission);
  end
  else $display("configurations does not matches");
endtask //automatic
endmodule