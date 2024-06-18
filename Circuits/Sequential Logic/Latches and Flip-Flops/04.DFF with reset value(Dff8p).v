module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output [7:0] q
);
    always@(negedge clk)
        if(reset==1)
            q<='h34;
    	else
      		q<=d;
endmodule

//neg clk에 초기화시 0x34로 초기화
