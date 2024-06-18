module top_module (
    input clk,
    input x,
    output z
); 
    reg [2:0] dout;
    
    dffa dff0(dout[0]^x,clk,dout[0],~dout[0]);
    dffa dff1(~dout[1]&x,clk,dout[1],~dout[1]);
    dffa dff2(~dout[2]|x,clk,dout[2],~dout[2]);
    assign z= ~|dout;
    
endmodule

module dffa(input D,clk ,output Q,Qbar);
    always@(posedge clk)begin
    	Q <= D;
    	Qbar <= ~D;
    end
endmodule
