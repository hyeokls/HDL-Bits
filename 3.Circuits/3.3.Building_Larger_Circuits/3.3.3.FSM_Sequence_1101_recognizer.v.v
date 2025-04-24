module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);

parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011 , DONE = 3'b100;

reg [2:0] state , n_state;
reg r_o;
    always@(posedge clk) begin
        if(reset) begin
            state <= A;
        end else begin
            state <= n_state;
        end
    end

    always@(posedge clk) begin
        if(reset) begin
            r_o <= 1'b0;
        end else if (n_state == DONE)begin
            r_o <= 1'b1;
        end
    end


    always@(*) begin
    n_state = state;
        case(state) 
            A : n_state = data ? B : A;
            B : n_state = data ? C : A;
            C : n_state = data ? C : D;
            D : n_state = data ? DONE : A;
            DONE : n_state = DONE;
        endcase
    end

    assign start_shifting = r_o;
endmodule