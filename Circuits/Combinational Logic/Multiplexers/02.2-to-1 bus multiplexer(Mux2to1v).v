module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );

    assign out = sel ? b: a;
endmodule


//assign out =  (~sel & a) | (sel & b); 
//위와 같은 방식으로는 오류가 나옴 
//그 이유는 bit wise 연산자에서 대응되는 비트가 sel은 1 또는 0 뿐임 
//따라서 다음과 방식으로 사용하고 싶으면 확장을 해야함
/*
wire [99:0] sel_vector;
	assign sel_vector = {100{sel}};
	assign out = (sel_vector & b) | (~sel_vector & a);
*/
//다음과 같은 방식으로 사용할 수는 있음
