module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 

    reg r_z;

    reg [1:0] state ,n_state;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;

    always@(posedge clk, negedge aresetn) begin
        if(!aresetn) begin
            state <= S0;
        end else begin
            state <= n_state;
        end
    end

    always@(*) begin
    n_state = state;
        case(state)
            S0 : begin
                if(x) begin
                    n_state = S1;
                end else begin
                    n_state = S0;
                end
            end

            S1 : begin
                if(!x) begin
                    n_state = S2;
                end else begin
                    n_state = S1;
                end
            end

            S2 : begin
                if(x) begin
                    n_state = S1;
                end else begin
                    n_state = S0;
                end
            end

        endcase
    end

assign z = (state == S2 && x == 1);

endmodule