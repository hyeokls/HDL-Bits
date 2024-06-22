module top_module (
    input clk,
    input reset,      // Synchronous activea-high reset
    output [3:0] q);
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
