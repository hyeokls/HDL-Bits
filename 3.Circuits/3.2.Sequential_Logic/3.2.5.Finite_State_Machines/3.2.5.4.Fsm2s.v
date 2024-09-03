module top_module(
    input clk,
    input reset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
      case (state)
       OFF : if(j)begin
       next_state <= ON;
       end 
       else begin next_state <= OFF;

       end
       ON : if(k)begin
        next_state <= OFF;
       end else begin
        next_state <= ON;
       end

      endcase  
    end

    always @(posedge)  begin
        if(reset)begin
        state <=OFF;
        end else begin
        state<= next_state;
        end
    end

    assign out = (state == ON);

endmodule
