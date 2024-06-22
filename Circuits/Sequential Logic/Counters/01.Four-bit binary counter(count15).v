module top_module (
    input clk,
    input reset,      // Synchronous activea-high reset
    output reg[3:0] q);
    wire[3:0] qin;
    always@(posedge clk)begin
        if(reset==1)begin
            q<=0;
            qin<=0;
        end
        else if( qin<16)
            q<=q+4'b0001;
        else if( qin==14)
            q<=0;
    
    end
    
endmodule

// Because q is 4 bits, it rolls over from 15 -> 0.
// If you want a counter that counts a range different from 0 to (2^n)-1, 
// then you need to add another rule to reset q to 0 when roll-over should occur.

always @(posedge clk)
		if (reset)
			q <= 0;
		else
			q <= q+1;	
