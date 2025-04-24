module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );

parameter IDLE = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011 , SH_EN = 3'b101, CNT = 3'b110, DONE = 3'b111;

reg [2:0] state , n_state;


    always@(posedge clk) begin
        if(reset) begin
            state <= IDLE;
        end else begin
            state <= n_state;
        end
    end

reg [2:0] sh_cnt;
    always@(posedge clk) begin
        if(reset) begin
            sh_cnt <= 0;
        end else if (state == SH_EN)begin
            sh_cnt <= sh_cnt + 1'b1;
        end else begin
            sh_cnt <= 0;
        end
    end


    always@(*) begin
    n_state = state;
        case(state) 
            IDLE : n_state = data ? B : IDLE;
            B : n_state = data ? C : IDLE;
            C : n_state = data ? C : D;
            D : n_state = data ? SH_EN : IDLE;
           
            SH_EN : begin
                if(sh_cnt > 2) begin
                    n_state = CNT;
                end else begin
                    n_state = SH_EN;
                end
            end

            CNT : begin
                if(done_counting) begin
                    n_state = DONE;
                end else begin
                    n_state = CNT;
                end
            end
            

            DONE : begin
                if(ack) begin
                    n_state = IDLE; 
                end else begin
                    n_state  = DONE;
                end
            end
        endcase
    end

assign shift_ena = (state == SH_EN);
assign counting = (state == CNT);
assign done = (state == DONE);

endmodule