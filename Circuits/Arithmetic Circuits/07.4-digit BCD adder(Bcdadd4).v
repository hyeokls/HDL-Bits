module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [3:0]cout_w;
    genvar i;
    
    generate
        bcd_fadd bcd_fadd1(a[3:0],b[3:0],cin,cout_w[0],sum[3:0]);
        for(i=4;i<16; i=i+4) begin:fadd_instance
            bcd_fadd bcd_fadd2(a[i+3:i],b[i+3:i],cout_w[i/4-1],cout_w[i/4],sum[i+3:i]);
        end
    endgenerate
    
    assign cout =cout_w[3];
endmodule


