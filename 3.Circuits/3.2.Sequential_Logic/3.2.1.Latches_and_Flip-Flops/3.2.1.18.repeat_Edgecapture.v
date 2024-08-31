module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
wire [31:0] p1;
always @(posedge clk) begin
   p1 <= in;
  
   if(reset)begin
   out <= 0;
   end
   
   else begin

  
   out <= (~in & p1) | out;
end
end

 


endmodule
