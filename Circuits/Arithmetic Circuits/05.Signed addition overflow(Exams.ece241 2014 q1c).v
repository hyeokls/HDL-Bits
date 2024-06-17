module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s, 
    output overflow
);  
    
    assign s = a+b;
    assign overflow = (a[7] & b[7] & (~s[7])) | ((~a[7]) & (~b[7]) & s[7]);

endmodule

    //1000 0000  over flow
    //0000 0001  +1
    //0111 1111 +127
    //1111 1111 -127
    //1000 0001 -1
  //1 0000 0000 over flow
