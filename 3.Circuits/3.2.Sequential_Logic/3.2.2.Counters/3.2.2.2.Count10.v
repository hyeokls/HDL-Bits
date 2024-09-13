module top_module(
	input clk,
	input reset,
	output reg [3:0] q);
	
	always @(posedge clk)
		if (reset)	
			q <= 0;
		else if(q < 9)
			q <= q+1;
        else
            q<=0;
	
endmodule