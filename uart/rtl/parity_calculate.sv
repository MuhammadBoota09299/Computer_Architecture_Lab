module parity_calculate (
    input logic party,
    input logic [7:0] rx_data,tx_data,
    output logic rx_parity_add,tx_parity_add
);
    logic rx_parity,tx_parity;
    assign rx_parity=^rx_data;
    assign tx_parity=^tx_data;
    assign rx_parity_add = (parity_enable) ? ~rx_parity : rx_parity;
    assign tx_parity_add = (parity_enable) ? ~tx_parity : tx_parity;
endmodule