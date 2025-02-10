module PC_ADD (
    input logic [31:0]pc_next,
    output logic [31:0]pc
);
always_comb begin
    pc=pc_next+4;
end
    
endmodule