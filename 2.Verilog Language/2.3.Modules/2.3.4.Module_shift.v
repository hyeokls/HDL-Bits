module top_module ( input clk, input d, output q );

wire w_0,w_1;
my_dff u_my_dff0(
.clk (clk),
.d (d),
.q (w_0)
);
my_dff U_my_dff1(
.clk (clk),
.d (w_0),
.q (w_1)
);

my_dff U_my_dff2(
.clk (clk),
.d (w_1),
.q (q)
);



endmodule
