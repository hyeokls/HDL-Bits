module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    // FSM from fsm_ps2
reg [7:0 ] state, next_state;
reg [23:0] cap_data;
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

always @(posedge clk) begin
   if(reset)begin
    state <= 0;
    end else begin
    state <= next_state;   
    end
end
always @(posedge clk) begin
   if(reset)begin
    cap_data <= 0;
    end else if ((state==STOP && in[3]==1) || (state==DONE && in[3]==1))begin
    cap_data[23:16]  <= in;
    end else if (state==START1)begin
    cap_data[15:8] <= in;
    end else if(state==START2)begin
    cap_data[7:0] <= in;
    end else begin
    cap_data <=0;
    end
end

assign done = (state == DONE);
assign out_bytes[23:16] = cap_data[23:16];
assign out_bytes[15:8] = cap_data[15:8];
assign out_bytes[7:0] = cap_data[7:0];
    // New: Datapath to store incoming bytes.







endmodule