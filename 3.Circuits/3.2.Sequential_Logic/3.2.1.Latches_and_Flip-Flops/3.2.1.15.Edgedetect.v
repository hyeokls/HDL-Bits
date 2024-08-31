module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
wire [7:0] p1,p2;
always@(posedge clk)begin

p1 <= in;
p2 <=p1;
end

assign pedge = ~p2 & p1;
endmodule



//answer

always @(posedge clk) begin
		d_last <= in;			
		pedge <= in & ~d_last;	
	end