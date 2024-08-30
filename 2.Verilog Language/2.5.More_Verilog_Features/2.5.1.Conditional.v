module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
wire [7:0]w_1,w_2;
assign w_1 = (a < b) ? a : b;
assign w_2 = (c < d) ? c : d;

assign min = (w_1 < w_2) ? w_1 : w_2;



endmodule
