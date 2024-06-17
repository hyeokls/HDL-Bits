module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
    
    integer i;
    always@(*)begin
    out=0;
        for(i=0; i<1024; i=i+4)begin
            if(sel== i/4)begin
                out= in[i+:4];
            end			
        end
  
    end
    
endmodule

//assign out = {in[sel*4+3], in[sel*4+2], in[sel*4+1], in[sel*4+0]};
