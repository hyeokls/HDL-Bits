module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);
    always@(posedge clk,posedge areset)
        if(areset==1)
            q<=0;
    	else
            q<=d;
endmodule
