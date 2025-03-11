module mux3_1 (
    input logic [31:0]input0,input1,input2,
    input logic [1:0]sel,
    output logic [31:0]out
);
always_comb begin
    case (sel)
        2'b00:out=input0;
        2'b01:out=input1;
        2'b10:out=input2;
        default: out=input0;
    endcase
end
endmodule