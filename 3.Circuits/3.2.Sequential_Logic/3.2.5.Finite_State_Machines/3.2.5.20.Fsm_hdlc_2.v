module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);

//----- F0 => in == 0  R1 => Rising in == 1 
reg [3:0] state, next_state;
localparam F0 = 4'd0, R1 = 4'd1 , R2 = 4'd2 , R3 = 4'd3 , R4 =4'd4;
localparam R5 = 4'd5, R6 =4'd6,  ERR = 4'd7, DISC = 4'd8, FLAG = 4'd9; 

always @(*) begin
    case(state)
        F0 : begin // 현재 상태는 0인 상태
            next_state = in ? R1 : F0;
        end

        R1 : begin //1   || F0에서 in 1 을 받고 F1을 옴 이미 1을 1개 가지고 있음 
            next_state = in ? R2 : F0;
        end

        R2 : begin //1
            next_state = in ? R3 : F0;
        end

        R3 : begin //1
            next_state = in ? R4 : F0;
        end

        R4 : begin //1
            next_state = in ? R5 : F0;
        end

        R5 : begin //1
            next_state = in ? R6 : DISC;
        end

        R6 : begin //1
            next_state = in ? ERR : FLAG;
        end
        
        DISC : begin // F0 상태인 느낌
            next_state = in ? R1 : F0;
        end

        FLAG : begin //F0 상태인 느낌
            next_state = in ? R1 : F0;
        end

        ERR : begin //F
            next_state = in ? ERR : F0;
        end

    endcase
end

always @(posedge clk ) begin
    if(reset) begin
        state <= F0;
    end else begin 
        state <= next_state;
    end
end

assign disc = (state == DISC);
assign flag = (state == FLAG);
assign err  = (state == ERR);

endmodule

