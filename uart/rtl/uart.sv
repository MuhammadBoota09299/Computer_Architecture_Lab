module uart (
    input logic clock,reset,rx_bit,
    output logic tx_bit
);

 bit_count_reg counter_reg(
  .*
);

 baud_rate_reg baud_reg(
    .*
);

parity_calculate parity_calculator(
    .*
);

rx_fifo r_fifo (
    .*
);

rx_shift_reg r_shift_reg(
    .*
);

tx_shift_reg t_shift(
    .*
);

tx_fifo t_fifo(
    .*
);

uart_controller uart_contr(
    .*
);

uart_registerfile uart_reg(
    .*
);

endmodule