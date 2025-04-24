module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );

parameter IDLE = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011 , SHIFT = 3'b101, CNT = 3'b110, DONE = 3'b111;

reg [2:0] state , n_state;
reg [1:0] shift;
reg [9:0] cnt;
reg [3:0] r_count;
    always@(posedge clk) begin
        if(reset) begin
            state <= IDLE;
        end else begin
            state <= n_state;
        end
    end


    always@(posedge clk) begin
        if(reset) begin
            shift <= 0;
            r_count <= 0;
            cnt <= 0;
        end else begin
            if(state == SHIFT) begin 
                r_count <= {r_count[2:0],data};
                shift <= shift + 1'b1;
            end else if (state == CNT) begin
                if(cnt == 10'd999) begin
                    r_count <= r_count - 1'b1;
                    cnt <= 0;
                end else begin
                    cnt <= cnt + 1'b1;
                end
            end else begin
                shift <= 0;        
            end
        end
    end


    wire done_counting = ((r_count == 4'b0) && (cnt == 10'd999));

    always@(*) begin
    n_state = state;
        case(state) 
            IDLE : n_state = data ? B : IDLE;
            B : n_state = data ? C : IDLE;
            C : n_state = data ? C : D;
            D : n_state = data ? SHIFT : IDLE;
           
            SHIFT : begin
                if(shift == 2'b11) begin
                    n_state = CNT;
                end else begin
                    n_state = SHIFT;
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

    assign count = r_count;
    assign counting = (state == CNT);
    assign done = (state == DONE);

endmodule