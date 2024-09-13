module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); 

reg [3:0] state, next_state;
reg [7:0] save;
parameter IDLE = 4'd0, START = 4'd1;
parameter D0 = 4'd2, D1 = 4'd3 , D2 = 4'd4 , D3 = 4'd5, D4 = 4'd6 , D5 = 4'd7, D6 = 4'd8, D7 = 4'd9;
parameter STOP = 4'd10 , UN = 4'd11;
always @(*) begin
    case(state)
    IDLE: begin
        if (in) begin  
            next_state = IDLE;
        end else begin
            next_state = START; 
        end
    end

    START: begin
        next_state = D0;
        save[0] = in;
    end

    D0 : begin
        next_state = D1;
        save[1] = in;
    end
    D1 : begin
        next_state = D2;
        save[2] = in;
    end
    D2 : begin
        next_state = D3;
        save[3] = in;
    end
    D3 : begin
        next_state = D4;
        save[4] = in;
    end
    D4 : begin
        next_state = D5;
        save[5] = in;
    end
    D5 : begin
        next_state = D6;
        save[6] = in;
    end
    D6 : begin
        next_state = D7;
        save[7] = in;
    end
   
    D7 : begin
        if(in)begin
            next_state = STOP; 
        end else begin
            next_state = UN; 
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
    end else begin 
        state <= next_state;
        end
    end



assign done =(state ==STOP);
assign out_byte = (done==1) ? save : 0;


endmodule
