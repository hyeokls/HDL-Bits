module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    always@(*)begin
    	if(mode ==1)begin //난방
            if(too_cold ==1)begin
            heater =1;
            aircon =0;
            fan=1;
            end
        
            else begin
            heater =0;
            aircon =0;
                if(fan_on==1)
                fan=1;
                else
                fan=0;
           
        	end
       	 
   		end
    
    	if(mode ==0)begin //냉방
       		if(too_hot==1)begin
          	heater=0;
          	aircon=1;
            fan=1;
        	end
        
            else begin
            heater=0;
        	aircon=0;
            	if(fan_on==1)
                fan=1;
                else
                fan=0;
                
        	end
    	end
    end

endmodule

//assign fan = heater | aircon | fan_on;
//assign heater = (mode & too_cold);
//assign aircon = (~mode & too_hot);
	
