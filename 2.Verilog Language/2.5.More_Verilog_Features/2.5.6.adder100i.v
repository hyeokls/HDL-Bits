module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );


genvar i;
generate
    assign sum[0] = a[0] ^ b[0] ^ cin;
    //assign  cout[0] = ((a[0] & b[0]) | (b[0] & cin) | (cin &a[0]));
    assign cout[0] = a[0] & b[0] | cin & (a[0]|b[0]);
   for (i = 1; i<100; i++ ) begin: fa_100
    assign sum[i] = a[i] ^ b[i] ^ cout[i-1];
    assign cout[i] = ((a[i] & b[i]) | (b[i] & cout[i-1]) | (cout[i-1] &a[i]));

   end
endgenerate


    endmodule