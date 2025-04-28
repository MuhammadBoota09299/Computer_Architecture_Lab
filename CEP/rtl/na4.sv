module na4 (
    input logic [31:0] addr,addr_n,
    input logic [1:0]size,
    output logic na4_out
    );
    assign na4_out=(addr>=(addr_n))  && ((addr+size) <= (addr_n+3));
endmodule