module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);

reg [2:0] n_state;
reg r_z;
reg r_y;

always@(posedge clk) begin
    n_state <= y;
end

always@(*) begin
    case(y)
        3'b000 : begin
            if(x) begin
                n_state = 3'b001;
            end else begin
                n_state = 3'b000;
            end
        end

        3'b001 : begin
            if(x) begin
                n_state = 3'b100;
            end else begin
                n_state = 3'b001;
            end
        end

        3'b010 : begin
            if(x) begin
                n_state = 3'b001;
            end else begin
                n_state =  3'b010;
            end
        end

        3'b011 : begin
            if(x) begin
                n_state = 3'b010;
            end else begin
                n_state = 3'b001;
            end
        end

        3'b100 : begin
            if(x) begin
                n_state = 3'b100;
            end else begin
                n_state = 3'b011;
            end
        end
      
        default : begin
            n_state = 3'b000;
        end
    endcase
end


always@(*) begin
    r_z = 1'b0;
    case(y)
        3'b000 : r_z = 0;
        3'b001 : r_z = 0;
        3'b010 : r_z = 0;
        3'b011 : r_z = 1;
        3'b100 : r_z = 1;
        default : r_z = 0;
    endcase
end

always(*) begin
    r_y = 1'b0;
    case(y)
        3'b000 : r_y = x ? 1'b1 : 1'b0;
        3'b001 : r_y = x ? 1'b0 : 1'b1;
        3'b010 : r_y = x ? 1'b1 : 1'b0;
        3'b011 : r_y = x ? 1'b0 : 1'b1;
        3'b100 : r_y = x ? 1'b0 : 1'b1;
        default : r_y = 1'b0;
    endcase
end


assign z = r_z;
assign Y0 = r_y;

endmodule