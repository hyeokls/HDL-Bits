module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
wire w_cout_0;
wire [31:0] w_b_0;
add16 u_add16_0(a[15:0],w_b_0[15:0],sub,sum[15:0],w_cout_0);
add16 u_add16_1(a[31:16],w_b_0[31:16],w_cout_0,sum[31:16],);
assign w_b_0 = b ^ {32{sub}};
endmodule
