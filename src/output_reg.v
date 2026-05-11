module outregister(
    input  wire       LO,              // load enable
    input  wire       CLK,             // clock
    input  wire [7:0] out_bus_in,      // input bus
    output wire [7:0] out_reg_bus_out,  // output bus
    input wire rst_n
);

    reg [7:0] out_reg = 8'b0;

    // Load process
    always @(posedge CLK or negedge rst_n) begin
        if (!rst_n)
            out_reg <= 8'b0;
        else if (LO)
            out_reg <= out_bus_in;
    end


    // Output
    assign out_reg_bus_out = out_reg;

endmodule