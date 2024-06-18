module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    reg [15:0] s;
    always@(posedge clk)
        if(resetn==0)
            q<=0;
    else if(byteena==3)begin
        q<=d;
    end
    else if(byteena==2)begin      
        q[15:8]<=d[15:8];
    end
    else if(byteena==1)begin       	
        q[7:0]<=d[7:0];
    end
endmodule

/*
always @ (posedge clk) begin

if(resetn==1'b0)
  q<=1b'0;
  
  else begin
    case(byteena)
      2'b00 : q <= q;
      2'b01 : q[7:0]  <= d[7:0]; 
      2'b10 : q[15:8] <= d[15:8];
      2'b11 : q <= d;
      
  end
end
*/
