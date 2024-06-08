module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    reg cin,cout,cout1;
    add16 a_in(a[15:0],b[15:0],cin,sum[15:0],cout);
    add16 b_in(a[31:16],b[31:16],cout,sum[31:16],cout1);
    
   // assign sum = {sum[31:16],sum[15:0]};
    

endmodule
