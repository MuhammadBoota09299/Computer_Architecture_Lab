module tor (
    input logic [31:0] addr,addr_n_plus,addr_n_plus_1,
    input logic [4:0]size,
    output logic tor_out
    );
    assign tor_out=(addr>=(addr_n_plus_1<<2)) &&((addr+size-1)<(addr_n_plus<<2));
endmodule