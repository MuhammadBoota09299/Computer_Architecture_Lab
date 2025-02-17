module pc (
    output logic [31:0]pc,
    input logic clock,reset,
    input logic [31:0]pc_next
);
    always_ff @( posedge clock ) begin 
        if (reset) begin
            pc<=32'b0;
        end
        else begin
            pc<=pc_next;
        end
        
    end
endmodule
