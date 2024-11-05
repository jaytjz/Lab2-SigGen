module counter #(
    parameter   WIDTH = 8
) (
    input logic [WIDTH-1:0] incr,
    input logic rst,
    input logic en,
    input logic clk,
    output logic [WIDTH-1:0] count
);

always_ff @(posedge clk or posedge rst)
    if (rst) count <= {WIDTH{1'b0}};
    else if (en) count <= count + incr;
    else count <= count;

endmodule
