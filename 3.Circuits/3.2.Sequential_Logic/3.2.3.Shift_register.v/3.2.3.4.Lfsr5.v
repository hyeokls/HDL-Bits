//linear feedback shift register

module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
); 

always @(posedge clk ) begin
    if(reset)begin
        q[4:0] <= 5'h1;
    end
    
    else begin
        q[0] <= q[1];
        q[1] <= q[2];
        q[2] <= q[3] ^q[0];
        q[3] <= q[4];
        q[4] <= 0 ^ q[0];
    end
end

endmodule


//answer
/*
lways @(*) begin
		q_next = q[4:1];	
		q_next[4] = q[0];	
		q_next[2] = q[3] ^ q[0];
	end
	always @(posedge clk) begin
		if (reset)
			q <= 5'h1;
		else
			q <= q_next;
	end
*/