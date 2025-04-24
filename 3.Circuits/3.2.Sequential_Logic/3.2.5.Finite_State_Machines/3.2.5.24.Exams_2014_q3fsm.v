module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);

reg [1:0] state , n_state; 
reg r_z, r_z_d;
reg [2:0] cnt;
parameter A = 2'b00 , B0 = 2'b01, B1 = 2'b10 , B2 = 2'b11;

    always@(posedge clk) begin
        if(reset) begin
            state <= A;
        end else begin
            state <= n_state;
        end
    end 



    always@(*) begin
    n_state = state;
        case(state)
            A : begin
                if(s) begin
                    n_state = B0;
                end 
            end

            B0 : begin 
                    n_state = B1;
                    cnt[2] = w;
            end

            B1 : begin
                    n_state = B2;
                    cnt[1] = w;
            end 

            B2 : begin
                    n_state = B0;   
                    cnt[0] = w;
            end

            default : cnt = 0;




        endcase
    end

    always@(*) begin
        if(state == B2) begin
            r_z = (cnt == 3'b110 || cnt == 3'b101 || cnt == 3'b011) ? 1 : 0;
        end else begin
            r_z = 0;
        end
    end

    always@(posedge clk) begin
        if(reset) begin
            r_z_d <= 0;
        end else begin
        r_z_d <= r_z;
        end
    end

    assign z = r_z_d;

endmodule