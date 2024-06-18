module top_module (
    input d, 
    input ena,
    output q);

    always@(*)
        if(ena==1)
        q=d;
    	else
        q=q;
endmodule

/*
if(ena) q<=d;
*/
