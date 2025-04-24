module top_module (
    input clk,
    input a,
    output q );

reg r_q;

    always@(posedge clk) begin
        if(a) begin
            r_q <= 0;
        end else begin
            r_q <= 1;
        end
    end

    assign q = r_q;
endmodule