module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );

    integer i;
    always@(*)begin
        out=0;
        for(i=0; i<256;i++)begin
            if(sel==i) begin
                out =in[i];
        	end  
   		end
    end
endmodule


//assign out=in[sel];
