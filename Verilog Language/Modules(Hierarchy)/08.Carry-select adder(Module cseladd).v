module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0]sum1,sum2,sum_s;
    wire sel,cout1,cout2;
    add16 m ( a[15:0],b[15:0], 0, sum [15:0],sel);
    add16 a1 ( a[31:16],b[31:16], 0, sum1 [15:0],cout1);
    add16 a2 ( a[31:16],b[31:16], 1, sum2 [15:0],cout2);
    assign sum_s = (sel ==0) ? sum1 : sum2;
    assign sum[31:16] = sum_s;
    
endmodule
