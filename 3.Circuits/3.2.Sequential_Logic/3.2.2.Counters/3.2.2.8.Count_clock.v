module top_module(
    input clk,
    input reset,
    input ena,
    output pm,  //오전 0 오후 1
    output [7:0] hh, //01-12
    output [7:0] mm, //00-59
    output [7:0] ss);  //00-59  

reg [3:1]ct;

always @(posedge clk ) begin
//ena 신

if(reset) begin
        pm<=0;
        ss<=0;
        mm<=0;
        hh<=8'b00010010;
end
else if(ena) begin
    if(ss[7:0] == 8'h59) begin
        ss[7:0] <= 8'h00;
    end
    else if(ss[3:0] == 4'b1001) begin
        ss[7:4] <= ss[7:4] + 4'b0001;
        ss[3:0] <= 4'b0000; 
    end
    else begin
        ss[3:0] <= ss[3:0] + 4'b0001;
    end


    if(ct[1])begin
        if(mm[7:0] == 8'h59) begin
        mm[7:0] <= 8'h00;
        end
        else if(mm[3:0] == 4'b1001)begin
        mm[7:4] <= mm[7:4] + 4'b0001;
        mm[3:0] <= 4'b0000;
        end
        else begin
        mm[3:0] <= mm[3:0] + 4'b0001;
        end
    end

    if(ct[2])begin       
        if(hh[7:0] == 8'h12) begin
        hh[7:4] <= 4'b0000;
        hh[3:0] <= 4'b0001;
        end 
        else if(hh[3:0] == 4'b1001)begin
        hh[7:4] <=4'b0001;
        hh[3:0] <=4'b0000;
        end
        else begin
            hh[3:0] <= hh[3:0] + 4'b0001;
        end
        
        end
        

    if(ct[3]) begin
        if(!pm) begin
            pm <=1'b1;
        end 
        else if(pm)begin
            pm<= 1'b0;
        end
    end
end
end


always @(*) begin
    ct[1] = (ss[7:0] == 8'h59);           
    ct[2] = (mm[7:0] == 8'h59) && ct[1]; 
    ct[3] = (hh[7:0] == 8'h11) && ct[2]; 
end
endmodule




/*
if(ss == 8'h59)begin
            ss <= 8'h00;
        end
        else begin
            if(ss[3:0] ==4'b1001)
            ss[7:4] <= ss[7:4] + 4'b0001;
            ss[3:0] <= 4'b0000; 
            else if(ss =8'h59) begin
            ss <= 8'h00;
            end
            else begin
            ss[3:0] <= ss[3:0] + 4'b0001;
            end
        end
        */