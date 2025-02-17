module pc_add (
    input logic [31:0]pc,
    output logic [31:0]pc_next
);
always_comb begin
    pc_next=pc+4;
end
    
endmodule
