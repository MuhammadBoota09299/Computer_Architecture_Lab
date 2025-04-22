module pmp_check (
    input logic [31:0]pmpaddr0_data,pmpaddr1_data1,pmpaddr2_data,pmpaddr3_data,pmpaddr4_data,pmpaddr5_data,pmpaddr6_data,
    pmpaddr7_data,pmpaddr8_data,pmpaddr9_data,pmpaddr10_data,pmpaddr11_data,pmpaddr12_data,pmpaddr13_data14,pmpaddr_data,
    pmpaddr15_data,
    input logic [31:0] pmpcfg0_data, pmpcfg1_data, pmpcfg2_data, pmpcfg3_data
    input logic [4:0]size,
    input logic [1:0]prive_mode,
    input logic [31:0]addr,
    output logic [1:0]permission
);
    logic out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15; 
    
    logic [15:0]pri;
    logic [3:0]entry_num;

    pmpcfg pmp0cfg,pmp1cfg,pmp2cfg,pmp3cfg,pmp4cfg,pmp5cfg,pmp6cfg,pmp7cfg,pmp8cfg,pmp9cfg,pmp10cfg,pmp11cfg,
    pmp12cfg,pmp13cfg,pmp14cfg,,pmp15cfg;

    assign {pmp3cfg,  pmp2cfg,  pmp1cfg,  pmp0cfg}   = pmpcfg0_data;
    assign {pmp7cfg,  pmp6cfg,  pmp5cfg,  pmp4cfg}   = pmpcfg1_data;
    assign {pmp11cfg, pmp10cfg, pmp9cfg,  pmp8cfg}   = pmpcfg2_data;
    assign {pmp15cfg, pmp14cfg, pmp13cfg, pmp12cfg}  = pmpcfg3_data;


    addr_check_n Addr_Check_0 (.adrr, .a_n(pmp0cfg.A),  .addr_n(32'b0),          .addr_n_plus(pmpaddr1_data),  .size, .out(out0));
    addr_check_n Addr_Check_1 (.adrr, .a_n(pmp1cfg.A),  .addr_n(pmpaddr1_data),  .addr_n_plus(pmpaddr2_data),  .size, .out(out1));
    addr_check_n Addr_Check_2 (.adrr, .a_n(pmp2cfg.A),  .addr_n(pmpaddr2_data),  .addr_n_plus(pmpaddr3_data),  .size, .out(out2));
    addr_check_n Addr_Check_3 (.adrr, .a_n(pmp3cfg.A),  .addr_n(pmpaddr3_data),  .addr_n_plus(pmpaddr4_data),  .size, .out(out3));
    addr_check_n Addr_Check_4 (.adrr, .a_n(pmp4cfg.A),  .addr_n(pmpaddr4_data),  .addr_n_plus(pmpaddr5_data),  .size, .out(out4));
    addr_check_n Addr_Check_5 (.adrr, .a_n(pmp5cfg.A),  .addr_n(pmpaddr5_data),  .addr_n_plus(pmpaddr6_data),  .size, .out(out5));
    addr_check_n Addr_Check_6 (.adrr, .a_n(pmp6cfg.A),  .addr_n(pmpaddr6_data),  .addr_n_plus(pmpaddr7_data),  .size, .out(out6));
    addr_check_n Addr_Check_7 (.adrr, .a_n(pmp7cfg.A),  .addr_n(pmpaddr7_data),  .addr_n_plus(pmpaddr8_data),  .size, .out(out7));
    addr_check_n Addr_Check_8 (.adrr, .a_n(pmp8cfg.A),  .addr_n(pmpaddr8_data),  .addr_n_plus(pmpaddr9_data),  .size, .out(out8));
    addr_check_n Addr_Check_9 (.adrr, .a_n(pmp9cfg.A),  .addr_n(pmpaddr9_data),  .addr_n_plus(pmpaddr10_data), .size, .out(out9));
    addr_check_n Addr_Check_10(.adrr, .a_n(pmp10cfg.A), .addr_n(pmpaddr10_data), .addr_n_plus(pmpaddr11_data), .size, .out(out10));
    addr_check_n Addr_Check_11(.adrr, .a_n(pmp11cfg.A), .addr_n(pmpaddr11_data), .addr_n_plus(pmpaddr12_data), .size, .out(out11));
    addr_check_n Addr_Check_12(.adrr, .a_n(pmp12cfg.A), .addr_n(pmpaddr12_data), .addr_n_plus(pmpaddr13_data), .size, .out(out12));
    addr_check_n Addr_Check_13(.adrr, .a_n(pmp13cfg.A), .addr_n(pmpaddr13_data), .addr_n_plus(pmpaddr14_data), .size, .out(out13));
    addr_check_n Addr_Check_14(.adrr, .a_n(pmp14cfg.A), .addr_n(pmpaddr14_data), .addr_n_plus(pmpaddr15_data), .size, .out(out14));
    addr_check_n Addr_Check_15(.adrr, .a_n(pmp15cfg.A), .addr_n(pmpaddr15_data), .addr_n_plus(32'hFFFFFFFF),   .size, .out(out15));



always_comb begin : priority circuit
    pri={out15,out14,out13,out12,out11,out10,out9,out8,out7,out6,out5,out4,out3,out2,out1,out0};
    casez (pri)  // casez allows ? for don't-care bits
        16'b???????????????1: entry_num = 4'd0;
        16'b??????????????10: entry_num = 4'd1;
        16'b?????????????100: entry_num = 4'd2;
        16'b????????????1000: entry_num = 4'd3;
        16'b???????????10000: entry_num = 4'd4;
        16'b??????????100000: entry_num = 4'd5;
        16'b?????????1000000: entry_num = 4'd6;
        16'b????????10000000: entry_num = 4'd7;
        16'b???????100000000: entry_num = 4'd8;
        16'b??????1000000000: entry_num = 4'd9;
        16'b?????10000000000: entry_num = 4'd10;
        16'b????100000000000: entry_num = 4'd11;
        16'b???1000000000000: entry_num = 4'd12;
        16'b??10000000000000: entry_num = 4'd13;
        16'b?100000000000000: entry_num = 4'd14;
        16'b1000000000000000: entry_num = 4'd15;
        default=position=4'b0;
    endcase
end
endmodule