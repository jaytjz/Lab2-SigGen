module sinegen #(
  parameter WIDTH = 8
)(
  input  logic clk,
  input  logic rst,
  input  logic en,
  input logic [WIDTH-1:0] incr,
  input logic [WIDTH-1:0] offset,
  output logic [WIDTH-1:0] dout1,
  output logic [WIDTH-1:0] dout2
);

  logic [WIDTH-1:0] address1;
  logic [WIDTH-1:0] address2;

counter myCounter (
  .clk (clk),
  .rst (rst),
  .en (en),
  .incr (incr),
  .offset (offset),
  .count1 (address1),
  .count2 (address2)
);

dual_rom myDualRom (
  .clk (clk),
  .addr1 (address1),
  .addr2 (address2),
  .dout1 (dout1),
  .dout2 (dout2)
);

endmodule
