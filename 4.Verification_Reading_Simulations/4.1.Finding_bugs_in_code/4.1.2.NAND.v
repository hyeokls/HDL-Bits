module top_module (input a, input b, input c, output out);//
    wire w_out;
    andgate inst1 (w_out, a, b, c, 1'b1, 1'b1 );

    assign out = ~ w_out;
endmodule