module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);

always @(posedge clk) begin
    if(reset)begin
    q<=0;
    end
    else if(q<16)begin
    q<= q+1'b1;
    end
    else begin
    q<=0;
    end
end


endmodule
