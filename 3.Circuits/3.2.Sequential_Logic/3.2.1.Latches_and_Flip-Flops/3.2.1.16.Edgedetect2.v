module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
wire [7:0] p1,p2;
always@(posedge clk)begin

p1 <= in;
p2 <=p1;
end

assign anyedge = (~p2 & p1) | (p2 & ~p1);
endmodule

