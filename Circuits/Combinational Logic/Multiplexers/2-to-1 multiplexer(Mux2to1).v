module top_module( 
    input a, b, sel,
    output out ); 

    assign out = (~sel & a) | (sel & b);
  //assign out = (sel==0) ? a : b;
  //assign out = sel ? b : a;
endmodule
