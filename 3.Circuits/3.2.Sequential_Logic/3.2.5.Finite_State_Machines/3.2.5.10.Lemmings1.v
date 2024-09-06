module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter LEFT=0, RIGHT=1;
    reg [1:0] state, next_state;

    always @(*) begin
       case (state)
        LEFT: if(bump_left)begin
                next_state = RIGHT;
                end
              else if(bump_right)begin
                next_state = LEFT;
              end
                else if((bump_right && bump_left) ||!(bump_right && bump_left) ) begin
                next_state = LEFT;
              end
              
        RIGHT: if(bump_right)begin
                next_state = LEFT;
                end
              else if(bump_left)begin
                next_state = RIGHT;
              end
                else if((bump_right && bump_left) ||!(bump_right && bump_left) ) begin
                next_state = RIGHT;
              end

       endcase 
    end

    always @(posedge clk, posedge areset) begin
        if(areset)begin
            state <= 0;
        end
        else begin
            state <= next_state;
        end
    end

    // Output logic

    assign walk_left =  (state == LEFT );
    assign walk_right = (state == RIGHT);

endmodule
