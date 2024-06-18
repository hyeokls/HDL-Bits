module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire e_o,l_o;

    
    assign e_o = (E==0) ? Q : w;
    assign l_o = (L==0) ? e_o : R;
    always@(posedge clk)begin
     Q <=l_o;
        
    end
    

endmodule

//-----------------------------------//
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
endmodule
