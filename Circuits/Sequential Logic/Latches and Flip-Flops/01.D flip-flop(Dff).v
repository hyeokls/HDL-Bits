module top_module (
    input clk,    // Clocks are used in sequential circuits
    input d,
    output reg q );

    always@(posedge clk)
        q<=d;

endmodule

//1. 엣지 트리거된 always blocks에는 non-blocking assignment 사용
//2. 에지 트리거가 두 개 이상 있는 경우 정의되지 않은 시뮬레이션 동작이 발생할 수 있음
