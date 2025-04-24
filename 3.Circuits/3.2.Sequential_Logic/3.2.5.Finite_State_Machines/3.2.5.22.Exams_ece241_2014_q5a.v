module top_module (
    input clk,
    input areset,
    input x,
    output z
); 

parameter DATA0 = 2'b00, DATA1 = 2'b01, CONV0 = 2'b10, CONV1 = 2'b11;
//
reg [1:0] state , n_state;


always@(posedge clk , posedge areset) begin
    if(areset) begin
        state <= DATA0;
    end else begin
        state <= n_state;
    end
end

always@(*) begin
    case(state) 
        DATA0 : begin
            if(x) begin
                n_state = DATA1;
            end else begin
                n_state = DATA0;
            end
        end

        DATA1 : begin
            if(x) begin
                n_state = CONV1;
            end else begin
                n_state = CONV0;
            end
        end

        CONV0 : begin
            if(x) begin
                n_state = CONV1;
            end else begin
                n_state = CONV0;
            end
        end

        CONV1 : begin
            if(x) begin
                n_state = CONV1;
            end else begin
                n_state = CONV0;
            end
        end


        default : n_state = DATA0;
    endcase
end

assign z = (state == DATA0) ? 1'b0 : 
           (state == DATA1) ? 1'b1 : 
           (state == CONV0) ? 1'b1 :
           (state == CONV1) ? 1'b0 : 1'b0;

endmodule