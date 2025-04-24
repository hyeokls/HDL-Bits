module top_module (
    input clk,
    input reset,
    output [9:0] q);

wire [9:0] d = 10'd999;
always@(posedge clk) begin
    if(reset) begin
        q <= 0;
    end else if(q == d) begin
        q <= 0;
    end else begin
        q <= q + 1'b1;
    end
end

endmodule