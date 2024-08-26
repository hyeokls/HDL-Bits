`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
wire w_ab_1;
wire w_cd_1;
wire w_or_2;
assign w_ab_1 = a & b;
assign w_cd_1 = c & d;
assign w_or_2 = w_ab_1 | w_cd_1;
assign out = w_or_2;
assign out_n = ~(w_or_2);



endmodule
