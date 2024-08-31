module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);

wire D;
assign D = (L) ? r_in : q_in;
always @(posedge clk) begin
    Q<=D;
end

endmodule


/*
always @ (posedge clk) begin
        case (L)
            1'b0 : Q <= q_in;
            1'b1 : Q <= r_in;
        endcase    
    end
*/