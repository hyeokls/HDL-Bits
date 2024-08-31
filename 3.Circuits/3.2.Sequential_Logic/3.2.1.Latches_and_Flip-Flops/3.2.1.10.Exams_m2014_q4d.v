module top_module (
    input clk,
    input in, 
    output out);

wire w1,w2;
assign w1 = in ^ w2;

always@(posedge clk)begin
 out <= w1;
 w2 <=w1;
end

endmodule

/*
    always@(posedge clk)begin 
        out<=( out^in );
    end
    
    */