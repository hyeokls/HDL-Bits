module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);

reg [1:0] r_state;

always@(posedge clk, posedge areset) begin
    if(areset) begin
        r_state <= 2'b01;
    end else if(train_valid) begin
        if(train_taken) begin
            r_state <= (r_state == 2'b11) ? 2'b11 : r_state + 1'b1;
        end else begin
            r_state <= (r_state == 2'b00) ? 2'b00 : r_state - 1'b1;
        end
    end
end

assign state = r_state;

endmodule