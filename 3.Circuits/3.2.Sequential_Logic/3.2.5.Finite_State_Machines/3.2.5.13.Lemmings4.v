module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 



reg [2:0] state, next_state;
integer i;
parameter LEFT = 3'b000 ,  RIGHT = 3'b001, AAAH_L = 3'b010;
parameter AAAH_R = 3'b011, DIG_L = 3'b100, DIG_R =3'b101 ,HELP=3'b110;




always @(*) begin
    case (state)
    LEFT  : if(!ground)begin
                next_state = AAAH_L;
            end else if(dig && ground)begin
                next_state = DIG_L;
            end else if((ground && bump_right && bump_left))begin
                next_state = RIGHT;
            end else if((ground && !bump_right && !bump_left))begin
                next_state = LEFT;
            end else if(ground && bump_right) begin
                next_state = LEFT;        
            end else if(ground && bump_left)begin
                next_state = RIGHT;
            end
    RIGHT : if(!ground)begin
                next_state = AAAH_R; 
            end else if(dig && ground)begin
                next_state = DIG_R;
            end else if((ground && bump_right && bump_left))begin
                next_state = LEFT;
            end else if((ground && !bump_right && !bump_left))begin
                next_state = RIGHT;
            end else if(ground && bump_left &&!bump_right) begin
                next_state = RIGHT;        
            end else if(ground && bump_right && !bump_left) begin
                next_state = LEFT;
            end
    AAAH_L: if(!ground)begin
               next_state = AAAH_L;
            end else if(ground) begin
                    if(i >= 5'b10100)begin
                    next_state = HELP;
                    end else if(i < 5'b10100) begin
                    next_state = LEFT;
                end
            end

    AAAH_R: if(!ground)begin
               next_state = AAAH_R;
            end else if(ground) begin
                if(i >= 5'b10100)begin
                    next_state = HELP;
                end else if( i < 5'b10100)begin
                next_state = RIGHT;
                end
            end
   
    DIG_L : if((ground && dig) || (ground && !dig))begin
                next_state = DIG_L;
            end else if(!ground)begin
                next_state =AAAH_L;
            end
    DIG_R : if((ground && dig) || (ground && !dig))begin
                next_state = DIG_R;
            end else if(!ground)begin
                next_state = AAAH_R;
            end
    HELP  : if(areset) begin 
            next_state = LEFT;
            end else if(!areset && ground) begin
            next_state = HELP;    
            end
    endcase
end

always @(posedge clk , posedge areset ) begin
    if(areset)begin
        state <= LEFT;
    end else if(state == AAAH_L || state ==AAAH_R)begin
        i <= i + 1;
        state <= next_state;
    end else begin
        state <=next_state;
        i <=0;
    end
end

/*
always @(posedge clk , posedge areset ) begin
    if(areset)begin
        state <= LEFT;
    end else begin
        state <=next_state;
    end
end
    always@(posedge clk) begin
      if(state == AAAH_L || state ==AAAH_R)begin
        i <= i + 1;
      end else begin
        i <= 0;
          end
      end
*/

assign walk_left  = (state == LEFT) && (state != HELP);
assign walk_right = (state == RIGHT) && (state != HELP);
assign aaah       = (state == AAAH_L || state == AAAH_R) && (state != HELP);
assign digging    = (state == DIG_L || state == DIG_R) && (state != HELP);

endmodule
