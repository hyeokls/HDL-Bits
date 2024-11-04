module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
wire w11,w12,w21,w22;
    
assign w11 = p1f & p1e & p1d;
assign w12 = p1a & p1b & p1c;   
assign w21 = p2a & p2b;
assign w22 = p2c & p2d;    
assign p1y = w11 | w12;
assign p2y = w21 | w22;

endmodule
