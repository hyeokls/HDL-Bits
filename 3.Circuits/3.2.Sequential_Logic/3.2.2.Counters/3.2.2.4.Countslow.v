module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);

always @(posedge clk) begin
    if(reset)begin
    q<=0;
    end else if(!slowena)begin
    q<=q;
    end else if(q<9)begin
    q<=q+1;
    end else begin
    q<=0;
    end
end

endmodule

/*
if(reset)
    q<=0;
else if(q<9 && slowena==1)
    q<=q+1'b1;
else if (q==9 && slowena==1)
    q<=1'b0;

*/