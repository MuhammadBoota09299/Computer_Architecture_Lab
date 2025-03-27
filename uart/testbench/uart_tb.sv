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
        rx_bit = 1'b1;          // Idle state
        uart_wr_enable = 1'b0;
        uart_sel = 1'b0;
        uart_addr = 4'b0;
        wdata_mem = 32'b0;
        
        // Release reset after 10 clock cycles
        #50 reset = 1'b0;
        
        // Test sequence
        // 1. Configure baud rate (example for 115200 baud)
        #100;
        uart_addr = 4'h3;       // BAUD_REG address
        wdata_mem = 32'd87;     // Example divisor for 115200 baud @ 100MHz
        uart_wr_enable = 1'b1;
        #10;
        uart_wr_enable = 1'b0;
        
        // 2. Send a character (example: 'A' - 0x41)
        #100;
        uart_addr = 4'h1;       // DATA_REG address
        wdata_mem = 32'h41;
        uart_wr_enable = 1'b1;
        #10;
        uart_wr_enable = 1'b0;
        
        // 3. Monitor RX line (optional - you would need to drive rx_bit)
        // #1000;
        // rx_bit = 1'b0; // Start bit
        // #8680;         // Bit duration for 115200 baud
        // rx_bit = 1'b1; // Bit 0
        // ... (continue for all data bits)
        
        // End simulation after 10us
        #10000;
        $finish;
    end
    
    // Dump waveforms
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, uart_tb);
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