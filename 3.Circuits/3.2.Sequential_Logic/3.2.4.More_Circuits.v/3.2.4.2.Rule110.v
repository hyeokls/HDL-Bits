module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 
integer i;
always @(posedge clk ) begin
    if(load)begin
        q<=data;
    end

    else begin
        q[0]<= q[0];
        q[511] <=( q[510] | q[511]);
        for(i=1; i<511; i++)begin
        case({q[i+1],q[i],q[i-1]})
        3'b000 : q[i] <= 0;
        3'b001 : q[i] <= 1;
        3'b010 : q[i] <= 1;
        3'b011 : q[i] <= 1;
        3'b100 : q[i] <= 0;
        3'b101 : q[i] <= 1;
        3'b110 : q[i] <= 1;
        3'b111 : q[i] <= 0;
        endcase
        end
    end
end 
endmodule



// reg m[2:0]; 선언 뒤
m<={q[i+1],q[i],q[i-1]};
case(m) 하니까 안되더라 이거 해결방안은?