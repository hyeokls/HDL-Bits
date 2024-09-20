module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
);

//-------------------------//
wire odd;
wire p_rst;
reg [7:0] cnt_data;
reg[3:0] cnt_num;
reg [2:0] state, next_state;
reg [7:0] cap_cnt_data;
//-------------------------//

localparam IDLE = 3'b000, START = 3'b001 , DATA = 3'b010;
localparam  UN = 3'b100 , PRT = 3'b101,STOP = 3'b110;


//-------------------------//
//FSM 선언
always @(*) begin
    next_state = IDLE;
    case(state)
    IDLE: begin
        if (in) begin 
            next_state = IDLE;  
        end else begin
            next_state = START;  
        end
    end

    START: begin
            next_state = DATA;   
    end

    DATA : begin
        if(cnt_num == 8)begin
            next_state = PRT;
        end else begin
            next_state = DATA;
        end  
    end

    PRT  : begin
        if(in)begin //? odd
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


//sync rst pos clk 처리
always @(posedge clk ) begin
    if(reset)begin
        state <= 0;
    end else begin
        state <= next_state;
    end
end

// data 신호 처리 
always @(posedge clk ) begin
    if(reset)begin
        cnt_data <= 0;
        cnt_num <= 0;
    end else if(next_state == DATA) begin
        cnt_num <= cnt_num + 1'b1;
        cnt_data[cnt_num] <= in;
    
    end else begin
        cnt_num <= 0;
        cap_cnt_data <= cnt_data;
    end
       
end

// done 신호 처리
always @(posedge clk ) begin
    if(reset)begin
        done <= 1'b0;
    end else if(next_state == STOP && odd == 1'b1) begin
        done <= 1'b1;
    end else begin
        done <= 1'b0;
    end
       
end

// out_byte 신호 처리
always @(posedge clk ) begin
    if(reset)begin
        out_byte <= 8'd0;
    end else if(next_state == STOP && odd == 1'b1) begin
        out_byte <= cap_cnt_data;
    end else begin
        out_byte <= 8'd0;
    end
       
end

assign p_rst =(reset == 1'b1 || state ==IDLE || state == STOP || state == UN);
//assign p_rst =(reset == 1'b1 || next_state ==IDLE || next_state == START);
parity u_prt(clk,p_rst,in,odd);
endmodule

//https://blog.csdn.net/wangkai_2019/article/details/106432095