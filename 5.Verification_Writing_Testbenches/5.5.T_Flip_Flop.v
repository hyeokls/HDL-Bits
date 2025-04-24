module top_module ();
reg clk, reset, t;
wire q;

initial clk = 0;
always #5 clk = ~clk;

initial begin
    reset = 1;
    t = 0;
#10
    reset = 0;
    t = 1;

end

tff u_tff(clk,reset,t,q);
endmodule