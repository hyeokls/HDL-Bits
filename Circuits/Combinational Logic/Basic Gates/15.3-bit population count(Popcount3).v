module top_module( 
    input [2:0] in,
    output [1:0] out );
	wire cnt0,cnt1,cnt2;
    assign cnt0 = (in[0]==1);
    assign cnt1 = (in[1]==1);
    assign cnt2 = (in[2]==1);
    assign out = cnt0+cnt1+cnt2;
endmodule

//-2-//
//truth table 
//assign out[0] = (~in[2] & ~in[1] & in[0]) | (~in[2] & in[1] & ~in[0]) | (in[2] & ~in[1] & ~in[0]) | (in[2] & in[1] & in[0]);
//assign out[1] = (in[1] & in[0]) | (in[2] & in[0]) | (in[2] & in[1]);

//-3-//
//case
/*
always @(*) begin
		case (in)
			3'd0: out = 2'd0;
			3'd1: out = 2'd1;
			3'd2: out = 2'd1;
			3'd3: out = 2'd2;
			3'd4: out = 2'd1;
			3'd5: out = 2'd2;
			3'd6: out = 2'd2;
			3'd7: out = 2'd3;
		endcase
	end
*/
