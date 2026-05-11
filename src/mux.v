module mux(
    input  wire [7:0] pc_bus_out,
    input  wire [7:0] acc_bus_out,
    input  wire [7:0] ADD_SUB_bus_out,
    input  wire [7:0] ram_bus_out,
    input  wire [7:0] ir_addr_out,  // zero-extended outside if needed

    input  wire EP,  // PC
    input  wire CE,  // RAM
    input  wire EI,  // IR
    input  wire EA,  // ACC
    input  wire EU,  // ALU

    output reg [7:0] bus
);

    always @(*) begin
        // priority: PC > RAM > IR > ACC > ALU > default
        case (1'b1)
            EP : bus = pc_bus_out;
            CE: bus = ram_bus_out;
            EI: bus = ir_addr_out;
            EA:bus = acc_bus_out;
            EU : bus = ADD_SUB_bus_out;
            
            default: bus = 8'b00000000;
        endcase
    end

endmodule
