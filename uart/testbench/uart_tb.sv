module uart_tb ();
    // Declarations
    logic rx_bit, clock, reset, tx_bit, uart_wr_enable, uart_sel;
    logic [3:0] uart_addr;
    logic [31:0] wdata_mem, uart_data;
    
    // Instantiate DUT
    uart dut (.*);
    
    // Clock generation (10ns period -> 100MHz)
    initial begin
        clock = 1'b0;
        forever begin
            #5 clock = ~clock;  // 5ns half-period
        end
    end
    
    // Reset and test sequence
    initial begin
        // Initialize signals
        reset = 1'b1;
        uart_wr_enable = 1'b0;
        uart_sel = 1'b0;
        uart_addr = 4'b0;
        wdata_mem = 32'b0;
        #20;
        // Release reset after 10 clock cycles
        @(posedge clock );
        reset = 1'b0;
        

         @(posedge clock );
        uart_addr = 4'hC;       //
        wdata_mem = 32'd103;     // 
        uart_wr_enable = 1'b1;
         @(posedge clock );
        uart_wr_enable = 1'b0;
        
        
         @(posedge clock );
        uart_addr = 4'h8;       // DATA_REG address
        wdata_mem = 32'h31;
        uart_wr_enable = 1'b1;
         @(posedge clock );
        uart_wr_enable = 1'b0;
        
         @(posedge clock );
        uart_addr = 4'h4;       // DATA_REG address
        wdata_mem = 32'hD;
        uart_wr_enable = 1'b1;

        @(posedge clock );
        uart_wr_enable = 1'b0;
        
        
         @(posedge clock );
        uart_addr = 4'h4;       // DATA_REG address
        wdata_mem = 32'h43;
        uart_wr_enable = 1'b1;
         @(posedge clock );
        uart_wr_enable = 1'b0;
        #30000;
        uart_sel = 1'b1;
        #2000;
        $finish;
    end
    
    // Dump waveforms
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, uart_tb);
    end
    always_comb begin 
        rx_bit = tx_bit;
    end
    // Monitor for display
    always @(posedge clock) begin
        if (uart_wr_enable) begin
            $display("[%0t] Write Addr: 0x%h, Data: 0x%h", $time, uart_addr, wdata_mem);
        end
        if (uart_sel) begin
            $display("[%0t] Read Data: 0x%h", $time, uart_data);
        end
    end
endmodule