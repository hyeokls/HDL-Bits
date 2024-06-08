module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire cout1,cout2;
    wire [31:0] b_out;
    assign b_out = ({32{sub}} ^ b);   //**** key point
    add16 sub1( a[15:0],b_out[15:0], sub, sum [15:0],cout1);
    add16 sub2( a[31:16],b_out[31:16], cout1, sum [31:16],cout2);

endmodule
