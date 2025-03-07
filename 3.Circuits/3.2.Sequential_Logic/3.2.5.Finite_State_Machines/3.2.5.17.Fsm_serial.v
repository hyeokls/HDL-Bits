module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 

reg [2:0] state, next_state;
parameter IDLE = 3'b000, START = 3'b001 , DATA = 3'b010;
parameter STOP = 3'b011, UN = 3'b100;
reg[4:0] cnt;
always @(*) begin
    case(state)
    IDLE: begin
        if (!in) begin  
            next_state = START;
        end else begin
            next_state = IDLE;  
        end
    end

    START: begin
        if (in == 0) begin  
            next_state = DATA;
            
        end
    end


    DATA : begin
        if(cnt == 7 )begin
            if(in)begin
            next_state = STOP;
            end else begin
            next_state = UN;
            end
        end else begin
            next_state = DATA;
        end  
    end

    
    STOP : begin
        if(in)begin
            next_state = IDLE;
        end else begin
            next_state = START;
        end
    end

    UN : begin
        if(in)begin
            next_state = IDLE;
        end else begin
            next_state = UN;
        end


    end



    endcase
end



always @(posedge clk ) begin
    if(reset)begin
        state <= 0;
    end else if(state==DATA)begin
        cnt <= cnt + 1;
        state <= next_state;
    end else begin 
        cnt <= 0;
        state <= next_state;
        end
    end



assign done =(state==STOP);


endmodule
