module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
reg [3:0] state, n_state;
parameter IDLE = 4'b0000, MNTx0 = 4'b0001, MNTx1 = 4'b0010, MNTx2 = 4'b0011, MNTy0 = 4'b0100, MNTy1 = 4'b0101, F = 4'b0110, MNTy = 4'b0111, MNTyn = 4'b1000;

always@(posedge clk) begin
    if(!resetn) begin
        state <= IDLE;
    end else begin
        state <= n_state;
    end
end
/*
reg r_d0, r_d1;
always@(posedge clk) begin
    if(!resetn) begin
        r_d0 <= 0;
        r_d1 <= 0;
    end else begin
        r_d0 <= 1;
        r_d1 <= r_d0;
    end
end

assign f = r_d0 & !r_d1;
*/

always@(*) begin
    n_state = state;
    case(state)
        IDLE : begin
            n_state = F;
        end

        F : begin
            n_state = MNTx0;
        end
        MNTx0 : begin
            if(x) begin
                n_state = MNTx1;
            end else begin
                n_state = MNTx0;
            end
        end

        MNTx1 : begin 
            if(!x) begin
                n_state = MNTx2;
            end else begin
                n_state = MNTx1;
            end
        end
    
        MNTx2 : begin
            if(x) begin
                n_state = MNTy0;
            end else begin 
                n_state = MNTx0;
            end
        end

        MNTy0 : begin
            if(y) begin
                n_state = MNTy;
            end else begin
                n_state = MNTy1;
            end
        end

        MNTy1 : begin
            if(y) begin
                n_state = MNTy;
            end else begin 
                n_state = MNTyn;
            end
        end

    
        MNTy : begin
                n_state = MNTy;
        end

        MNTyn : begin
                n_state = MNTyn;
        end

    
    endcase
end

assign f = (state == F);
assign g = (state == MNTy0 | state == MNTy1 | state == MNTy);


endmodule