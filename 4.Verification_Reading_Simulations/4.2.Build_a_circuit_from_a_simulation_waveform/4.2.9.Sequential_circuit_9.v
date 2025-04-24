module top_module (
    input clk,
    input a,
    output [3:0] q );

reg [3:0] r_q;

    always@(posedge clk) begin
        if(a) begin
            r_q <= 4'd4;
        end else if (r_q == 6) begin
            r_q <= 4'd0;
        end else begin
            r_q <= r_q + 1'b1;
        end
    end 

assign q = r_q;
endmodule 