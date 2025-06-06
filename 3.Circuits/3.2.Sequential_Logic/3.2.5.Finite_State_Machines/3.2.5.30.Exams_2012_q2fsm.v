module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    input w,
    output z
);


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
                n_state = B;
            end else begin
                n_state = A;
            end
        end

        B :begin
            if(w) begin
                n_state = C;
            end else begin
                n_state = D;
            end
        end

        C : begin
            if(w) begin
                n_state = E;
            end else begin
                n_state = D;
            end
        end

        D : begin
            if(w) begin
                n_state = F;
            end else begin
                n_state = A;
            end
        end

        E : begin
            if(w) begin
                n_state = E;
            end else begin
                n_state = D;
            end
        end

        F : begin
            if(w) begin
                n_state = C;
            end else begin
                n_state = D;
            end
        end

    endcase
end


assign z = (state == F || state == E);

endmodule