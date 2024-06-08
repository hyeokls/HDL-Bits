module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    reg cin;
    wire cout,cout1;
    add16 a_1(a[15:0], b[15:0], cin,  sum[15:0],cout );
    add16 a_2(a[31:16], b[31:16], cout,  sum[31:16],cout1 );
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
           wire s1, c1, c2;
     	   xor  G1(s1, a, b);
           and  G2(c1, a, b);
           and  G3(c2, cin, s1);
           xor  G4(sum, s1, cin);
           xor  G5(cout, c1, c2);
endmodule
