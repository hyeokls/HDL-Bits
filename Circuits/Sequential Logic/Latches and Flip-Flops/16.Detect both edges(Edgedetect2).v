module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    wire [7:0] pl0,pl1;
    always@(posedge clk)begin
    	pl0<=in;
        pl1<=pl0;
    end
    assign anyedge = ( ~pl1 & pl0 ) | ( pl1 & ~pl0 );

endmodule
