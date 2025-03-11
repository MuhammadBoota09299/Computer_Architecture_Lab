module mux2_1 (
    input logic [31:0]input0,input1,
    input logic sel,
    output logic [31:0]out
);
assign out = (sel) ? input1 : input0;
endmodule