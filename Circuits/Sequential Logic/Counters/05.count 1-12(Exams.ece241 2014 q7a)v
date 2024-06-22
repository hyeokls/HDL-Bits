/문제 다시 풀어보기

module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
);
    count4 the_counter (clk, c_enable, c_load, c_d ,Q);
    //assign c_enable = enable && ~c_load;
    always@(*)begin
        c_load = reset ||(Q ==12 && enable ==1);
        c_enable = enable && ~c_load;
        if(c_load==1)
            c_d<=1;
    end
   
   

    

endmodule
