module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);

always @(*) begin
    
if(ring && vibrate_mode== 1 )begin
 motor = 1'b1;
 ringer= 1'b0;
 end
else if (ring ==1)begin
ringer =1'b1;
motor = 1'b0;
end
else begin
ringer =1'b0;
motor = 1'b0;
end

end
endmodule



/*
assign ringer = ring & ~vibrate_mode;
assign motor = ring & vibrate_mode;
*/