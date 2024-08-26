module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
wire  w_cout_0;

add16 u_add16_0(a[15:0],b[15:0],0,sum[15:0],w_cout_0);
add16 u_add16_1(a[31:16],b[31:16],w_cout_0,sum[31:16],);

endmodule
