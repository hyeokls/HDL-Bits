module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
wire sel;
wire [32:0]sum_o;
wire [15:0] w_sum_0,w_sum_1;
add16 u_add_0(a[15:0],b[15:0],0,sum[15:0],sel);
add16 u_add_1(a[31:16],b[31:16],0,w_sum_0[15:0],);
add16 u_add_2(a[31:16],b[31:16],1,w_sum_1[15:0],);
always @(*) begin
    case (sel)
    1'b0    : sum[31:16] = w_sum_0[15:0];
        default: sum[31:16] =w_sum_1[15:0];
    endcase
end
endmodule
