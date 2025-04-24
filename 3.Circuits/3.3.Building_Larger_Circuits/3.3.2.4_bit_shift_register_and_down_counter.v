module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);

reg [3:0]r_data;
wire [2:0] sel = {data,shift_ena,count_ena};

    always@(posedge clk) begin
        r_data <= 0;
        case(sel)
            3'b001 : begin
                r_data <= r_data - 1'b1;
            end

            3'b010 : begin
                r_data <= {r_data[2:0],1'b0};
            end


            3'b101 : begin
                r_data <= r_data - 1'b1;
            end

            3'b110 : begin
                r_data <= {r_data[2:0],data};
            end
        endcase
    end

    assign q = r_data;

endmodule