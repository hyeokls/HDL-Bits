module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);

reg [2:0] state, n_state;
parameter IDLE = 3'b000, S0 = 3'b001 , S1 = 3'b010, S2 = 3'b011, S3 = 3'b100;

always@(posedge clk) begin
    if(reset) begin
        state <= S0;
    end else begin
        state <= n_state;
    end
end


always@(*) begin
n_state = state;
    case(state)
        IDLE: n_state = reset ? S0 : IDLE;
        S0 : n_state = S1;
        S1 : n_state = S2;
        S2 : n_state = S3;
        S3 : n_state = IDLE;
    endcase
end

assign  shift_ena = (state != IDLE );

endmodule