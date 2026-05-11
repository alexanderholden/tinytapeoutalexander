module mar(
    input  wire       LM,               // active high load from bus
    input  wire       CLK,              // clock
    input  wire [3:0] bus_in,           // 4-bit input bus
    output wire [3:0] mar_addr_bus_out,  // 4-bit address output
    input wire rst_n
);

    reg [3:0] mar_reg = 4'b0;

    // Load process
    always @(posedge CLK or negedge rst_n) begin
        if (!rst_n)
            mar_reg <= 4'b0;
        else if (LM)
            mar_reg <= bus_in;
    end

    // Output
    assign mar_addr_bus_out = mar_reg;

endmodule