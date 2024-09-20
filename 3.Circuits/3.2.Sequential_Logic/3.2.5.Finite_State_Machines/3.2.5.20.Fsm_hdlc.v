//high_level_data_link_control
module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);

localparam DISC = 4'd1, FLAG = 4'd2 ,ERR = 4'd3, IDLE = 4'd0,CHK=4'd4;
localparam DISC_DONE = 4'd5, FLAG_DONE = 4'd6 ,ERR_DONE = 4'd7;
reg [3:0]state,next_state;
reg[4:0] cnt;


always @(* ) begin
    case(state)
    IDLE : begin
        if(in) begin
            next_state =CHK;
        end else begin 
            next_state =IDLE;
        end
    end
    CHK : begin
        if(in && cnt == 4)begin
            next_state = DISC;
        end else if (in)begin
            next_state= CHK;     
        end else begin 
            next_state =IDLE;
        end
    end

    DISC: begin
        if(in) begin
            next_state = FLAG;
        end else begin
            next_state = DISC_DONE;
        end 
    end
    
    FLAG: begin
        if(in) begin
            next_state = ERR;
        end else begin
            next_state = FLAG_DONE;
        end 
    end 

    ERR: begin
        if(in) begin
            next_state = ERR;
        end else begin
            next_state = ERR_DONE;
        end 
    end 
    
    DISC_DONE : begin 
        if(in) begin
            next_state =CHK;
        end else begin 
            next_state =IDLE;
        end
    end

    FLAG_DONE : begin 
        if(in) begin
            next_state =CHK;
        end else begin 
            next_state =IDLE;
        end
    end
    ERR_DONE : begin 
        if(in) begin
            next_state =CHK;
        end else begin 
            next_state =IDLE;
        end
    end
    
    endcase
end
// clk
always @(posedge clk ) begin
    if(reset)begin
        state<= IDLE;
    end else begin
        state<= next_state;
    end
end

//1 카운팅
always @(posedge clk ) begin
    if(reset)begin
        cnt <= 0;
    end else if(next_state == CHK || next_state == DISC ||next_state == FLAG|| next_state == ERR) begin
        cnt <= cnt + 1'b1;     
    end else begin 
        cnt <= 0;
    end
end

 

assign disc = (state == DISC_DONE);
assign flag = (state == FLAG_DONE);
assign err  = (state == ERR || next_state == ERR_DONE);




endmodule
