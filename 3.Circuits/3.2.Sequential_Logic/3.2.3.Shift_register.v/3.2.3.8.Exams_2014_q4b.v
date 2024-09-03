module top_module (
    input [3:0] SW,
    input [3:0] KEY, 
    output [3:0] LEDR
); 
//clk KEY[0], E KEY[1] L KEY[2] W KEY[3] Q LEDR[3:0] 
MUXDFF U_0(KEY[0],KEY[3],KEY[1],SW[3],KEY[2],LEDR[3]);
MUXDFF u_1(KEY[0],LEDR[3],KEY[1],SW[2],KEY[2],LEDR[2]);
MUXDFF u_2(KEY[0],LEDR[2],KEY[1],SW[1],KEY[2],LEDR[1]);
MUXDFF u_3(KEY[0],LEDR[1],KEY[1],SW[0],KEY[2],LEDR[0]);

endmodule



module MUXDFF (
input clk,W,E,R,L,
output Q
);
wire [1:0]sel = {E,L};

always@(posedge clk)begin

case(sel)
2'b00 : Q <= Q;
2'b01 : Q <= R;
2'b10 : Q <= W;
2'b11 : Q <= R;
endcase
end

endmodule
