module counter #(
    parameter WIDTH = 8
)(
    input logic clk,
    input logic rst,
    input logic en,
    input logic [WIDTH-1:0] offset,
    output logic [WIDTH-1:0] count1,
    output logic [WIDTH-1:0] count2
);

always_ff @ (posedge clk) begin
    if (rst) begin
        count1 <= {WIDTH{1'b0}};
        count2 <= {WIDTH{1'b0}} + offset;                
    end else begin
        count1 <= count1 + {{WIDTH-1{1'b0}}, en};
        count2 <= count1 + {{WIDTH-1{1'b0}}, en} + offset;
    end
end

endmodule
