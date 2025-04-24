module top_module( 
    input a,b,c,
    output w,x,y,z );
    assign w = a, x =b, y=b, z=c;

endmodule


/*

2. 
assign w = a;
assign x = b;
assign y = b;
assign z = c;

3.
assign {w,x,y,z} = {a,b,b,c};



*/