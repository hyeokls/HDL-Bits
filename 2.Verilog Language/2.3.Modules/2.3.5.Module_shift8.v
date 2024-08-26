module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
wire [7:0] w_0,w_1,w_2;
my_dff8 u_my_0(clk,d,w_0);
my_dff8 u_my_1(clk,w_0,w_1);
my_dff8 u_my_2(clk,w_1,w_2);
always @(*) begin
    case (sel)
    2'b00 : q = d;
    2'b01 : q = w_0;
    2'b10 : q = w_1;
        default: q= w_2;
    endcase
end
endmodule
