module tor (
    input logic [31:0] addr,addr_n,
    input logic [4:0]size,
    output logic na4_out
    );
    assign na4_out=(addr>=(addr_n<<2))  && ((addr+size-1) <= (addr_n+3));
endmodule