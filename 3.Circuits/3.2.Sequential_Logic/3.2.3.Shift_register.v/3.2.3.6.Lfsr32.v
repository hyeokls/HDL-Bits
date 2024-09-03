module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 

always @(posedge clk ) begin
    if(reset)begin
        q[31:0] <= 32'h1;
    end
    else begin
    q<= {q[0],q[31:1]};
        q[21] <= q[0] ^ q[22];
        q[1] <= q[0] ^ q[2];
        q[0] <= q[0] ^ q[1];
    end
end

endmodule


/*
always@(*)begin
q_next = {q[0],q[31:1]};
q_next[21] = q[0] ^ q[22];
q_next[1] = q[0] ^ q[2];
q_next[0] = q[0] ^ q[1];
end


always @(posedge clk ) begin
    if(reset)begin
    q[31:0] <= 32h'1;
    end
    else begin
    q <= q_next;
    end
end
*/
