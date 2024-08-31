module top_module (input x, input y, output z);

wire w_11,w_12,w_21,w_22,w_31,w_32;

A IA1(
    .x(x),
    .y(y),
    .z(w_11));
B IB1(
    .x(x),
    .y(y),
    .z(w_12));
A IA2(
    .x(x),
    .y(y),
    .z(w_21));
B IB2(
    .x(x),
    .y(y),
    .z(w_22));
assign w_31 = w_11 | w_12;
assign w_32 = w_21 & w_22;

assign z = w_31 ^ w_32;


endmodule

module A (
	input x,
	input y,
	output z);

	assign z = (x^y) & x;
	
endmodule

module B (
	input x,
	input y,
	output z);

	assign z = ~(x^y);

endmodule