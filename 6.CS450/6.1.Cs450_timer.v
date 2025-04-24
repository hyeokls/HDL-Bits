module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);

reg [9:0] r_data;
reg r_tc;

always@(posedge clk) begin
    if(load) begin
        r_data <= data;
    end else if(r_data == 0) begin
        r_data <= r_data;
    end else begin
        r_data <= r_data - 1'b1;
    end 
end

always@(*)begin
    if(r_data == 0) begin
        r_tc = 1;
    end else begin
        r_tc = 0;
    end
end

assign tc = r_tc;

endmodule