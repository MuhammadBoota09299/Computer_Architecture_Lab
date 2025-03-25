module rx_fifo #(parameter DEPTH =16)(
    input logic clock,reset,rx_fifo_rd_en,rx_fifo_wr_en,
    input logic [7:0]rx_fifo_data,
    output logic  rx_fifo_empty, rx_fifo_full,
    output logic [7:0] rx_data
);
  logic [7:0]rx_fifo [DEPTH-1:0];
  logic [$clog2(DEPTH):0] fifo_count;
  logic [$clog2(DEPTH)-1:0] wr_ptr,rd_ptr;

  assign rx_fifo_full=(fifo_count==DEPTH);
  assign rx_fifo_empty=(fifo_count==0);
  assign rx_data=rx_fifo[rd_ptr];

  always_ff @( posedge clock ) begin 
    if (reset) begin
        rd_ptr<=0;
        wr_ptr<=0;
        fifo_count<=0;
    end
    else begin
        if (rx_fifo_rd_en && !rx_fifo_empty) begin
            rd_ptr<=rd_ptr+1;
            fifo_count<=fifo_count-1;
            end
        if (rx_fifo_wr_en && !rx_fifo_full) begin
            rx_fifo[wr_ptr]<=rx_fifo_data;
            wr_ptr<=wr_ptr+1;
            fifo_count<=fifo_count+1;
        end
    end

  end

endmodule