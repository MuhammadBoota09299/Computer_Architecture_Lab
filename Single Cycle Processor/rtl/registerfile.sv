module registerfile (
    input logic [4:0]raddr1,raddr2,waddr,
    input logic [31:0]wdata,
    input logic reg_wr,clock,reset,
    output logic [31:0]rdata1,rdata2
);
    logic [31:0]register_file [31:0]='{default:0};
    always_ff @( posedge clock ) begin 
        if (waddr==0) begin
            register_file[0]<=32'b0;
        end
        else if(reg_wr) begin
            register_file[waddr]<=wdata;
        end
    end
    always_comb begin 
        rdata1=register_file[raddr1];
        rdata2=register_file[raddr2];
    end

endmodule
