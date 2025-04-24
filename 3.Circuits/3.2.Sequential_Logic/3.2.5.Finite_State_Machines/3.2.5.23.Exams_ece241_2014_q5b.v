module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    reg  [1:0] state , n_state;
    parameter A = 0 , B = 1; // 원핫 인코딩 비트 위치를 의미

    always@(posedge clk, posedge areset) begin
        if(areset) begin
            state <= 2'b01;
        end else begin
            state <= n_state;
        end
    end
    
    assign n_state[A] =  (state[A] & ~x) || (areset);
    assign n_state[B] = (state[A] & x ) || (state[B]);

    assign z = (state[A] & x ) || (state[B] && ~x);
endmodule