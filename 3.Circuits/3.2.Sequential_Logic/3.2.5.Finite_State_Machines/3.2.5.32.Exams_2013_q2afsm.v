module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 

reg [1:0] state, n_state;
parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;


always@(posedge clk) begin
    if(!resetn) begin
        state <= A;
    end else begin
        state <= n_state;
    end
end


always@(*) begin
    case(state)
        A : begin
            if(r[1]) begin
                n_state = B;
            end else if(!r[1] & r[2]) begin
                n_state = C;
            end else if (!r[1] & !r[2] & r[3]) begin
                n_state = D;
            end else begin
                n_state = A;
            end
        end
        
        B : begin
            if(r[1]) begin
                n_state = B;
            end else begin
                n_state = A;
            end
        end

        C : begin
            if(r[2]) begin
                n_state = C;
            end else begin 
                n_state = A;
            end
        end

        D : begin
            if(r[3]) begin
                n_state = D;
            end else begin 
                n_state = A;
            end
        end
    endcase
end

assign g = {state == D, state == C, state == B};

endmodule