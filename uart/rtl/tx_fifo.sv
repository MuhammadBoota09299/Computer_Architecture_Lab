module tx_fifo #(parameter DEPTH =16)(
    input logic clock,reset,tx_fifo_rd_en,tx_fifo_wr_en,
    input logic [7:0]tx_fifo_data,
    output logic  tx_fifo_empty, tx_fifo_full,
    output logic [7:0] tx_data
);
  logic [7:0]tx_fifo [DEPTH-1:0];
  logic [$clog2(DEPTH):0] fifo_count;
  logic [$clog2(DEPTH)-1:0] wr_ptr,rd_ptr;

  assign tx_fifo_full=(fifo_count==DEPTH);
  assign tx_fifo_empty=(fifo_count==0);
  assign tx_data=tx_fifo[rd_ptr];

  always_ff @( posedge clock ) begin 
    if (reset) begin
        rd_ptr<=0;
        wr_ptr<=0;
        fifo_count<=0;
    end
    else begin
        if (tx_fifo_rd_en && !tx_fifo_empty) begin
            rd_ptr<=rd_ptr+1;
            fifo_count<=fifo_count-1;
            end
        if (tx_fifo_wr_en && !tx_fifo_full) begin
            tx_fifo[wr_ptr]<=tx_fifo_data;
            wr_ptr<=wr_ptr+1;
            fifo_count<=fifo_count+1;
        end
    end

  end

endmodule