module pipline_fetch (
    input clock,reset,
    input logic [31:0]pc_fetch,instruction_fetch,
    output logic [31:0]pc_execute,instruction_execute;
);
    always_ff @( posedge clock,posedge reset ) begin 
        if (reset) begin
            pc_execute<=32'b0;
            instruction_execute<=32'b00000013;
        end
        else begin
            pc_execute <=pc_fetch;
            instruction_execute <=instruction_fetch;
        end
    end
endmodule