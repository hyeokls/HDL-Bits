module top_module(
	input clk,
	input d,
	output q);
	
	reg p, n;
	
    always @(posedge clk)
        p <= d ^ n;
        
    always @(negedge clk)
        n <= d ^ p;
    
    assign q = p ^ n;
    
endmodule

/*
 reg tmp1,tmp2;
    always@(posedge clk)
        tmp1 <= d;
    always@(negedge clk)
        tmp2 <= d;
    
    always@(*)begin
        if(clk)
            q = tmp1;
        else
            q = tmp2;
    end
*/