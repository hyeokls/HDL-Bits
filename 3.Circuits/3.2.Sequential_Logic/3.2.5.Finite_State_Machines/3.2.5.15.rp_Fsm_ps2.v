module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

reg [7:0 ] state, next_state;
integer i;
parameter STOP = 3'b000, START1 = 3'b001,START2 = 3'b0101, DONE =3'b100;
  // State transition logic (combinational)
  always @(*) begin
    case (state)
    STOP  : if(in[3]==1)begin //byte 1
            next_state = START1;
            end
            else begin
            next_state =STOP;
            end
    START1 : next_state = START2; //byte 2
            
    START2 : next_state = DONE; //byte 3
    
    DONE  : if(in[3]==1) begin // if click -> byte 1
                next_state =START1;
            end
            else begin 
                next_state = STOP;
            end
    
    endcase
  end



    // State flip-flops (sequential)
always @(posedge clk ) begin
    if(reset)begin
        state <= 0;
    end else  begin
        state <= next_state;
    end
end

assign done = (state==DONE);


 


endmodule




/*

  always @(*) begin
    case (state)
    STOP  : if(in[3]==1)begin
            next_state = START;
            end
            else begin
            next_state =STOP;
            end
    START : if(i==2)begin
            next_state = DONE;
            end else begin
            next_state =START:    
            end
            
    DONE  : if(in[3]==1)begin
            next_state = START;
            end else begin
            next_state = STOP;
            end
    endcase

  always @(posedge clk ) begin
    if(reset)begin
        state <= 0;
        i <=0;
    end else if(i<3) begin
        state <= next_state;
        i<=0;
    end else begin
        state <=next_state;
        i<=i+1;
    end
end

assign done = (state==DONE);
  e*/