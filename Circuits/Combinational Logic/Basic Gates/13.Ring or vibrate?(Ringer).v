module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
    
    always@(*)begin
        if(ring ==1)
            begin
                if(vibrate_mode ==1)
                    begin
                        motor =1;
    					ringer =0;
                    end
                else if(vibrate_mode ==0)
                    begin
                        motor=0;
                        ringer=1;
                    end
            end
        else
            begin
                motor =0;
                ringer=0;
            end
    end
    
     
    
endmodule

//assign ringer = ring & ~vibrate_mode;
//assign motor = ring & vibrate_mode;
