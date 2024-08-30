module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

wire [99:0] w_cout;
genvar i;
generate
    bcd_fadd u_bcd_fadd0(a[3:0],b[3:0],cin,w_cout[0],sum[3:0]);
        for(i=4; i<400; i=i+4) begin : bcd_fa
            bcd_fadd u_bcd_fadd1(a[i+3:i],b[i+3:i],w_cout[i/4-1],w_cout[i/4],sum[i+3:i]);
        end
endgenerate

assign cout = w_cout[99];

endmodule