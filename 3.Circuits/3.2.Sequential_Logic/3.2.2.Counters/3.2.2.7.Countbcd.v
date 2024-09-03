module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

always @(posedge clk ) begin
if(reset)begin
q<=16'h0000;
end else begin
    if(q[3:0]==4'b1001) begin
        q[3:0]<=0;
    end
    else begin
        q[3:0]<= q[3:0] + 4'b0001;
    end

    if(ena[1]) begin
        if(q[7:4]==4'b1001) begin
            q[7:4]<=0;
        end
        else begin
            q[7:4]<= q[7:4] + 4'b0001;
        end
    end

    if(ena[1] && ena[2]) begin
        if(q[11:8]==4'b1001) begin
            q[11:8]<=0;
        end
        else begin
            q[11:8]<= q[11:8] + 4'b0001;
        end
    end

    if(ena[1] && ena[2] && ena[3]) begin
        if(q[15:12]==4'b1001) begin
            q[15:12]<=0;
        end
        else begin
            q[15:12]<= q[15:12] + 4'b0001;
        end
    end
end
end
always @(*) begin
    ena[1] = (q[3:0] == 4'b1001);           
    ena[2] = (q[7:4] == 4'b1001) && ena[1]; 
    ena[3] = (q[11:8] == 4'b1001) && ena[2]; 
end


endmodule

/*
cnt_bcd u_0(clk,reset,1,q[3;0]);
cnt_bcd u_1(clk,reset,ena[1],q[7:4]);
cnt_bcd u_2(clk,reset,nea[2],q[11:8]);
cnt_bcd u_3(clk,reset,ena[3],q[15:12]);


module cnt_bcd(
input clk,reset,
input ena,
output [3:0] o_q
);
always @(posedge clk ) begin
    if (ena)begin
        if(reset || q==4'b1001) begin
            o_q<=0;
        end
        else begin
            o_q<= o_q + 4'b0001;
        end
    end
     
end
endmodule

genvar  i;
generate
    for (i =4 ;i<15 ;i+4 ) begin     
always @(posedge clk ) begin
    if (ena[i])begin
        if(reset || q==4'b1001) begin
            q[i+3:i]<=0;
        end
        else begin
            q[i+3:i]<= q[i+3:i] + 4'b0001;
        end
    end
     
end

    end
endgenerate
*/