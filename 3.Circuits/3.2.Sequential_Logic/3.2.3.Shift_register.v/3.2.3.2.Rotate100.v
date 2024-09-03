module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 


always @(posedge clk ) begin
    if(load)begin
    q[99:0] <= data[99:0];
    end
    else begin
    case(ena)
    2'b01 : q[99:0] <={q[0],q[99:1]};
    2'b10 : q[99:0] <={q[98:0],q[99]}; 
    endcase    
    end

end
endmodule

/*
always @(posedge clk) begin
		if (load)		// Load
			q <= data;
		else if (ena == 2'h1)	// Rotate right
			q <= {q[0], q[99:1]};
		else if (ena == 2'h2)	// Rotate left
			q <= {q[98:0], q[99]};
	end

*/