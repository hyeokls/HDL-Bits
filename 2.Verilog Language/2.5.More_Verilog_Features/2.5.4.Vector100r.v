module top_module( 
    input [99:0] in,
    output [99:0] out
);
genvar i;
generate
    for (i = 0; i<100 ; i++) begin : gen_r

       assign  out[i] = in[99-i];
    end

endgenerate

endmodule


//generate 를 할 때는 assign 문을 사용해야함.
// for (i = 0; i<100 ; i++) begin
// for (i = 0; i<$bits(out); i++) begin