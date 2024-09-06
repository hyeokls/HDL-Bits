module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 

reg [2:0] state , next_state;
parameter A=3'b111, B=3'b011, C=3'b001, D=3'b000;
// 물 수위 높이 측정 
/*
A :111 Above s3               s1,s2,s3
B :011 Between s3 and s2      s1,s2
C :001 Between s2 and s1      s1
D :000 Below s1               none
*/
always @(*) begin
    case(s)
        A: next_state = A;
        B: next_state = B;
        C: next_state = C; 
        D: next_state = D;
        default : next_state = D;
    endcase
end
// FR on/off 측정 
always @(posedge clk ) begin
    if(reset) begin
        {fr3,fr2,fr1} <= 3'b111; // Sensor Asserted None
    end
    else
        case(next_state)
        A : {fr3,fr2,fr1} <= 3'b000; //Sensor Asserted A s1,s2,s3 | None
        B : {fr3,fr2,fr1} <= 3'b001; //Sensor Asserted B s1,s2    | FR1->1
        C : {fr3,fr2,fr1} <= 3'b011; //Sensor Asserted C S1  |FR1,FR2 ->1
        D : {fr3,fr2,fr1} <= 3'b111; //Sensor Asserted None |FR1,2,3 ->1
        endcase
end

always @(posedge clk ) begin
    if(reset) begin
        state <=D; // Below s1
    end
    else begin
        state <= next_state;
    end
end

always @(posedge clk ) begin
    if(reset) begin
        dfr <=1; 
    end
       
    else if(next_state< state)begin
        dfr <=1;
    end
    else if(next_state>state)begin
        dfr <=0;
    end
    else
        dfr <=dfr;
end
endmodule


module top_module (
	input clk,
	input reset,
	input [3:1] s,
	output reg fr3,
	output reg fr2,
	output reg fr1,
	output reg dfr
);


	// Give state names and assignments. I'm lazy, so I like to use decimal numbers.
	// It doesn't really matter what assignment is used, as long as they're unique.
	// We have 6 states here.
	parameter A2=0, B1=1, B2=2, C1=3, C2=4, D1=5;
	reg [2:0] state, next;		// Make sure these are big enough to hold the state encodings.
	


    // Edge-triggered always block (DFFs) for state flip-flops. Synchronous reset.	
	always @(posedge clk) begin
		if (reset) state <= A2;
		else state <= next;
	end



    // Combinational always block for state transition logic. Given the current state and inputs,
    // what should be next state be?
    // Combinational always block: Use blocking assignments.    
	always@(*) begin
		case (state)
			A2: next = s[1] ? B1 : A2;
			B1: next = s[2] ? C1 : (s[1] ? B1 : A2);
			B2: next = s[2] ? C1 : (s[1] ? B2 : A2);
			C1: next = s[3] ? D1 : (s[2] ? C1 : B2);
			C2: next = s[3] ? D1 : (s[2] ? C2 : B2);
			D1: next = s[3] ? D1 : C2;
			default: next = 'x;
		endcase
	end
	
	
	
	// Combinational output logic. In this problem, a procedural block (combinational always block) 
	// is more convenient. Be careful not to create a latch.
	always@(*) begin
		case (state)
			A2: {fr3, fr2, fr1, dfr} = 4'b1111;
			B1: {fr3, fr2, fr1, dfr} = 4'b0110;
			B2: {fr3, fr2, fr1, dfr} = 4'b0111;
			C1: {fr3, fr2, fr1, dfr} = 4'b0010;
			C2: {fr3, fr2, fr1, dfr} = 4'b0011;
			D1: {fr3, fr2, fr1, dfr} = 4'b0000;
			default: {fr3, fr2, fr1, dfr} = 'x;
		endcase
	end
	
endmodule
