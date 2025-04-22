module tor0 (
    input logic [31:0] addr,addr_n_plus,adrr_n
    input logic [4:0]size,
    output logic tor0_out
    );
    assign tor0_out=(addr>=addr_n) &&((addr+size-1)< (addr_n_plus<<2));
endmodule