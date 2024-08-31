module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
wire d1,d2;
assign d1 = (L) ? R : d2;
assign d2 = (E) ? w : Q;

always @(posedge clk) begin
    Q <= d1;
end

endmodule


wire [1:0] con;
assign con ={E,L}
  always@(posedge clk)begin
    case(con)
      2'b00 : Q <= Q; 
      2'b01 : Q <= R;
      2'b10 : Q <= w;
      2'b11 : Q <= R;
    endcase
  end