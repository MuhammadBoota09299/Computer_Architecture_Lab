module core_tb;

    // Signals
    logic clock;
    logic reset;

    // Instantiate the processor
    core uut (
        .clock(clock),
        .reset(reset)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock; // Toggle clock every 5ns
    end

    // Test stimulus
    initial begin
        reset = 1;
        #10 reset = 0;  // De-assert reset after 10ns

        #300;  // Run simulation for 100ns
        $finish; // End simulation
    end

    // Dump waveforms
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, core_tb);
    end

endmodule
