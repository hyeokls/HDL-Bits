module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);

reg[2:0] q;

always @(posedge clk ) begin
    if(!resetn)begin
    out <= 0;
    q <= 0;
    end
    else begin
    q[0] <= in;
    q[1] <= q[0];
    q[2] <= q[1];
    out <= q[2];
    end
end

endmodule

/*
reg[3:0] sr
always @(posedge clk) begin
		if (~resetn)		// Synchronous active-low reset
			sr <= 0;
		else 
			sr <= {sr[2:0], in};
	end
	
	assign out = sr[3]


*/