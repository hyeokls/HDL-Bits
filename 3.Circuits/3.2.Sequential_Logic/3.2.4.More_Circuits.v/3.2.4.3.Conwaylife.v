module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 

    reg [255:0] r_q; 
    reg [255:0] n_q;

    integer row, col, i, j, n_r, n_c, idx ,neighbors;

    always@(posedge clk) begin      
        if(load) begin
            r_q <= data;
        end else begin
            r_q <=n_q;
        end
    end


    always@(*) begin
        n_q = 256'b0;

        for( row = 0; row < 16; row++) begin
            for( col = 0; col < 16; col++ ) begin
                idx = row * 16 + col;
                neighbors = 0;

                for( i = -1; i<= 1; i++ ) begin
                    for( j = -1; j<=1; j++) begin
                        if(!( i == 0 && j == 0)) begin
                            n_r = (row + i + 16) % 16;
                            n_c = (col + j + 16) % 16;
                            neighbors = neighbors + r_q[n_r * 16 + n_c];
                        end
                    end
                end

                if(r_q[idx] == 1'b1) begin
                    n_q[idx] = (neighbors == 2 || neighbors == 3) ? 1'b1 : 1'b0;
                end else begin
                    n_q[idx] = (neighbors == 3) ? 1'b1 : 1'b0;
                end
            end
        end
    end

    assign q = r_q;

endmodule