module sinegen #(
    parameter WIDTH = 8
) (
    input logic [WIDTH-1:0] incr,
    input logic rst,
    input logic en,
    input logic clk,
    output logic [WIDTH-1:0] dout
);

logic [WIDTH-1:0] addr;

counter myCounter(
    .incr (incr),
    .rst (rst),
    .en (en),
    .clk (clk),
    .count (addr)
);

rom myRom(
    .clk (clk),
    .addr (addr),
    .dout (dout)
);

endmodule
