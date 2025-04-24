module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );

    reg n_state;    

    always@(posedge clk) begin
        state <= n_state;
    end

    always@(*) begin
        case(state)
        1'b0 : n_state = a & b;
        1'b1 : n_state = a | b;
        default : n_state = 1'b0;
        endcase
    end


    assign q = state ? ~(a^b) : (a^b);
endmodule