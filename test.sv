`include "../include/ldpc_encoder.svh"

module tb_ldpc_encoder;
    bit                     clk;
    logic                   arst_n;

    logic   [7:0]           src_msg;
    logic                   src_valid;
    logic                   src_start_frame;
    logic                   src_end_frame;
    logic                   src_err;
    logic                   src_ready;
    logic                   dst_dec_complete;

    logic   [4:0]           src_ctrl;

    logic                   dst_bits;
    logic                   dst_valid;
    logic                   dst_ready;

    string                  test_path;

    int rate_k[] = '{1, 1, 2, 1, 3, 2, 3, 4, 5, 8, 9};
    int rate_n[] = '{4, 3, 5, 2, 5, 3, 4, 5, 6, 9, 10};

    logic [7:0] const_q;
    logic [7:0] const_t;
    logic [12:0] num_msg_bytes;
    logic [`B_MAX_NZ-1:0] const_addr_limit;
    
    int cr, t, bits, num_bytes;

    initial begin     
        // Initialize signals
        init_signals;

        // Reset sequence
        reset_seq;

        for (cr = 0; cr < rate_k.size(); cr++) begin
            for (t = 1; t <= 10; t++) begin
                ctrl_sel(cr, t);

                fork
                    err_monitor;
                    src_driver;
                    monitor;
                join

                repeat(2) @(posedge clk);
            end
        end

        repeat(20) @(posedge clk);
        $stop;
    end

    task automatic err_monitor;
        while (1) begin
            @(posedge clk);
            if (src_err) begin
                $display("ERROR: src_err signal received from the core! Stopping execution.");
                repeat(2) @(posedge clk);
                $stop;
            end
        end
    endtask

    task automatic monitor;
        int fid, ref_fid, error_count = 0;
        logic ref_bit;

        fid = s_fopen({test_path, "dut_enc.txt"}, "wt");
        ref_fid = s_fopen({test_path, "ref_enc.txt"}, "rt"); // Reference output

        bits = 0;
        while (bits < 360 * (const_q - 1)) begin
            @(posedge clk);
            if (dst_valid && dst_ready) begin
                $fwrite(fid, "%x\n", dst_bits);

                // Compare with reference
                if ($fscanf(ref_fid, "%b\n", ref_bit) != 1 || ref_bit !== dst_bits) begin
                    error_count++;
                end

                bits++;
            end
        end

        $fclose(fid);
        $fclose(ref_fid);

        // **Pass/Fail Summary**
        if (error_count == 0)
            $display("[PASS] Rate: %0d/%0d, Test: %0d, p: %0d, q: %0d", rate_k[cr], rate_n[cr], t, const_t, const_q);
        else
            $display("[FAIL] Rate: %0d/%0d, Test: %0d, p: %0d, q: %0d, Errors: %0d", 
                      rate_k[cr], rate_n[cr], t, const_t, const_q, error_count);

        @(posedge clk);
        dst_dec_complete = 1;
        @(posedge clk);
        dst_dec_complete = 0;
    endtask

    task automatic src_driver;
        int fid, status, total_bytes = num_msg_bytes + 1;
        logic [7:0] msg_in;

        fid = s_fopen({test_path, "msg.txt"}, "rt");
        num_bytes = 0;

        while (!$feof(fid)) begin
            status = $fscanf(fid, "%h\n", msg_in);

            @(posedge clk);

            // Set control signals
            src_start_frame <= (num_bytes == 0);
            src_end_frame   <= (num_bytes == total_bytes - 1);
            src_valid       <= 1;
            src_msg         <= msg_in;

            @(posedge clk);
            while (!src_ready) @(posedge clk);

            src_valid       <= 0;
            src_start_frame <= 0;
            src_end_frame   <= 0;
            num_bytes++;
        end

        $fclose(fid);
    endtask

    task automatic init_signals;
        src_valid        = 0;
        src_msg          = 8'hAD;
        src_start_frame  = 0;
        src_end_frame    = 0;
        dst_dec_complete = 0;
        dst_ready        = 1;
    endtask

    task automatic reset_seq;
        arst_n = 1;
        #50 arst_n = 0;
        #100 arst_n = 1;
    endtask

    task automatic ctrl_sel(int cr, int t);
        int fid, status;

        test_path = $sformatf("./logs/64800_%0d_%0d/%0d/", rate_k[cr], rate_n[cr], t);
        fid = s_fopen({test_path, "config.txt"}, "r");
        status = $fscanf(fid, "%d\n", src_ctrl);
        $fclose(fid);

        compute_constants(src_ctrl, const_q, const_t, num_msg_bytes, const_addr_limit);
    endtask

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    ldpc_encoder inst_ldpc_encoder(
        .*
    );

    // File opening helper function
    function automatic int s_fopen(string fname, string flgs);
        int fid;
        fid = $fopen(fname, flgs);
        if (fid == 0) begin
            $error("%s could not be opened!", fname);
        end
        return fid;
    endfunction

endmodule
