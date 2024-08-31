module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
//hit mode 1 cool mode 0

always @(*) begin
    heater = 1'b0;
    aircon = 1'b0;
    fan = 1'b0;
    if(too_cold && mode) begin
    heater = 1'b1;
    aircon = 1'b0;
        if(too_cold || fan_on)begin
        fan = 1'b1;
        
        end
    end
    else if(too_hot && ~mode)begin
    heater = 1'b0;
    aircon = 1'b1;
        if(too_hot || fan_on)begin
        fan = 1'b1;
        end
    end
    else if(fan_on)begin
    fan = 1'b1;
    end 
end
endmodule


/* answer
assign fan = heater | aircon | fan_on;
	
	assign heater = (mode & too_cold);
	
	assign aircon = (~mode & too_hot);

*/