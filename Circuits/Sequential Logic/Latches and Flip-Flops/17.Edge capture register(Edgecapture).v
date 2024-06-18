module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    always@(posedge clk)
        if(reset==1)
endmodule
