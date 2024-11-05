module counter #(
    parameter WIDTH = 8
)(
    input logic clk,
    input logic rst,
    input logic en,
    input logic [WIDTH-1:0] incr,
    input logic [WIDTH-1:0] offset,
    output logic [WIDTH-1:0] count1,
    output logic [WIDTH-1:0] count2
);

always_ff @ (posedge clk) begin
    if (rst) begin
        count1 <= {WIDTH{1'b0}};
        count2 <= {WIDTH{1'b0}};                
    end else if (en) begin
        count1 <= count1 + incr;
        count2 <= count1 + incr + offset;
    end else begin
        count1 <= count1;
        count2 <= count2;
    end
end

endmodule
