module top_module (
    input d, 
    input ena,
    output q);

always @(*) begin
    if(!ena)begin
        q<=q;
    end
    else if (ena)begin
        q<=d;
end
end


endmodule
