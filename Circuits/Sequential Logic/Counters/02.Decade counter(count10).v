module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output reg [3:0] q);
	
    always@(posedge clk)
        if(reset==1)
            q<=0;
    else if(q==9)
        q<=0;
    else 
        q=q+1'b1;
endmodule


//
always @(posedge clk)
		if (reset || q == 9)	// Count to 10 requires rolling over 9->0 instead of the more natural 15->0
			q <= 0;
		else
			q <= q+1;
