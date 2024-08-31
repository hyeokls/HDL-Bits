module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
wire [15:0] w;
bcd_fadd u_bf0(a[3:0],b[3:0],cin,w[3:0],sum[3:0]);
bcd_fadd u_bf1(a[7:4],b[7:4],w[3:0],w[7:4],sum[7:4]);
bcd_fadd u_bf2(a[11:8],b[11:8],w[7:4],w[11:8],sum[11:8]);
bcd_fadd u_bf3(a[15:12],b[15:12],w[11:8],w[15:12],sum[15:12]);
assign cout = w[15:12];
endmodule


