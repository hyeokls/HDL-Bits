module top_module (
    input clk,
    input x,
    output z
);
wire w21,w22,w23;

always @(posedge clk) begin
    w21 <= (x^w21);
    w22 <= (x & ~w22);
    w23 <= (x | ~w23);
end

assign z = ~(w21|w22|w23);

endmodule
