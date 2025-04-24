module top_module ();

reg clk;

initial clk = 0;

always #5 clk = ~ clk;

dut u_dut(clk);

endmodule