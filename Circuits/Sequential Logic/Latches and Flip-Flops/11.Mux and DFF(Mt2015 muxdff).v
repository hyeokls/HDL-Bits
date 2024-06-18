//그림에서 사용될 mux와 dff의 서브 모듈을 만들어라

module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    
    always @ (posedge clk) begin
        case (L)
            1'b0 : Q <= q_in;
            1'b1 : Q <= r_in;
        endcase    
    end

endmodule



/*
  	wire w_o;
	assign w_o = L ? r_in : q_in;
	
	always @(posedge clk) 
		Q <= w_o;
*/
