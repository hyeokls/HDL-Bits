module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

fa u_fa0(a[0],b[0],cin,cout[0],sum[0]);
fa u_fa1(a[1],b[1],cout[0],cout[1],sum[1]);
fa u_fa2(a[2],b[2],cout[1],cout[2],sum[2]);


endmodule

module fa(
input i_a,i_b,i_c,
output o_c,o_sum
);
assign o_c = (i_a & i_b) | ((i_a ^ i_b ) & i_c);
assign o_sum = i_a ^ i_b ^ i_c;
endmodule