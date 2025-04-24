module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);

reg [2:0] state , n_state;
reg r_z;

    always@(posedge clk) begin
        if(reset) begin
            state <= 3'b000;
        end else begin
            state <= n_state;
        end
    end

    always@(*) begin
        case(state) 
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
                    n_state = 3'b010;
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
        endcase
    end

    always@(*) begin
        case(state) 
        
        3'b000 : r_z = 0;
        3'b001 : r_z = 0;
        3'b010 : r_z = 0;
        3'b011 : r_z = 1;
        3'b100 : r_z = 1;
        endcase
    end

    assign r = r_z;

endmodule