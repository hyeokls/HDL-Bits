module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);


reg [2:0] state, n_state;
parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100 ,F = 3'b101;

always@(posedge clk) begin
    if(reset) begin
        state <= A;
    end else begin
        state <= n_state;
    end
end

always@(*) begin
    case(state)
        A : begin
            if(w) begin
                n_state = A;
            end else begin
                n_state = B;
            end
        end

        B :begin
            if(w) begin
                n_state = D;
            end else begin
                n_state = C;
            end
        end

        C : begin
            if(w) begin
                n_state = D;
            end else begin
                n_state = E;
            end
        end

        D : begin
            if(w) begin
                n_state = A;
            end else begin
                n_state = F;
            end
        end

        E : begin
            if(w) begin
                n_state = D;
            end else begin
                n_state = E;
            end
        end

        F : begin
            if(w) begin
                n_state = D;
            end else begin
                n_state = C;
            end
        end

    endcase
end


assign z = (state == F || state == E);

endmodule