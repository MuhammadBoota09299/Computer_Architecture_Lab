module parity_calculate (
    input logic party,parity_enableable,
    input logic [7:0] rx_data,tx_data,
    output logic rx_parity_add,tx_parity_add
);
    logic rx_parity,tx_parity;
    assign rx_parity=^rx_data;
    assign tx_parity=^tx_data;
    assign rx_parity_add = (parity_enableable) ? ~rx_parity : rx_parity;
    assign tx_parity_add = (parity_enableable) ? ~tx_parity : tx_parity;
endmodule