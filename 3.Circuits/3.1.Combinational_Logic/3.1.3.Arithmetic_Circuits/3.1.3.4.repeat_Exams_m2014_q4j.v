/*못 풀었*/
module top_module( 
   input [3:0] x,
    input [3:0] y, 
    output [4:0] sum); 

sum = x+ y;

endmodule


    wire [3:0] c; // 자리올림 저장
    
    // 비트별 전가산기 구현
    assign sum[0] = x[0] ^ y[0];
    assign c[0] = x[0] & y[0];
    
    assign sum[1] = x[1] ^ y[1] ^ c[0];
    assign c[1] = (x[1] & y[1]) | (x[1] & c[0]) | (y[1] & c[0]);
    
    assign sum[2] = x[2] ^ y[2] ^ c[1];
    assign c[2] = (x[2] & y[2]) | (x[2] & c[1]) | (y[2] & c[1]);
    
    assign sum[3] = x[3] ^ y[3] ^ c[2];
    assign c[3] = (x[3] & y[3]) | (x[3] & c[2]) | (y[3] & c[2]);
    
    assign sum[4] = c[3]; // 최종 자리올림


