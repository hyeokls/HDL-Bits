module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
reg [1:0] state, next_state;
reg [1:0] save_state;
parameter LEFT = 2'b00, RIGHT = 2'b01, AAAH_L = 2'b10 ,AAAH_R = 2'b11;
always @(*) begin
    case (state)
        LEFT : if(bump_left && ground)begin
            next_state = RIGHT;
            end
            else if(bump_right && ground)begin
            next_state = LEFT;
            end
            else if(bump_right && bump_left && ground || !(bump_left && bump_right) && ground)begin
            next_state = LEFT;
            end
            else if(!ground)begin
            next_state = AAAH_L;
          
            end
        RIGHT : if(bump_right && ground)begin
            next_state = LEFT; 
            end
            else if(bump_left && ground)begin
            next_state = RIGHT;
            end
            else if(bump_right && bump_left && ground || (!bump_left && !bump_right) && ground)begin
            next_state = RIGHT;
            end
            else if (!ground) begin
            next_state = AAAH_R;
           
            end
        
        AAAH_L: if(!ground)begin
            next_state = AAAH_L;
        end
        else if(ground)begin
            next_state = LEFT;
        end
        AAAH_R: if(!ground)begin
                next_state = AAAH_R;
            end
            else if(ground)begin
                next_state = RIGHT;
            end
    endcase
end

always @(posedge clk,posedge areset ) begin
    if(areset)begin
        state <=LEFT;
    end
    else begin
        state <=next_state;
    end
end

assign walk_left =(state==LEFT);
assign walk_right =(state==RIGHT);
assign aaah = (state==AAAH_L || state==AAAH_R);
endmodule