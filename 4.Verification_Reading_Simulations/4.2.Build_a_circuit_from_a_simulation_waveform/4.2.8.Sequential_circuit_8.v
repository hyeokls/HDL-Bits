module top_module (
    input clock,
    input a,
    output p,
    output q );
    
    reg r_p, r_q;

    always@(*) begin
        if(clock) begin
            r_p = a;
        end else begin
            r_p = r_p;
        end
    end


    always@(negedge clock) begin
        r_q <= p;
    end

    assign p = r_p;
    assign q = r_q;
endmodule