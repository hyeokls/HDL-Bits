module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
assign {cout,sum} = a+b+cin;
endmodule


/*
genvar i;
wire [99:0] w;
generate
   assign w[0] = ((a[0]& b[0]) | ( (a[0] ^ b[0])  & cin ));
   assign sum[0] = (a[0] ^ b[0] ^ cin);
        for (i =1; i<99; i++  )begin : fa
           assign w[i] = (a[i] & b[i]) | (b[i] & w[i-1]) | (w[i-1] & a[i]);
            assign sum[i] = a[i] ^ b[i] ^ w[i-1];   
        end

endgenerate
assign cout = w[99];


*/