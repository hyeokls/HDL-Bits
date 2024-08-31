module top_module (
    input clk,
    input reset, // high -> 1
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); 

    count4 the_counter (clk, c_enable, c_load, c_d ,Q );

    assign c_load = reset ||(Q==12 && enable ==1);
    assign c_enable = enable && ~c_load;
    assign c_d = (c_load) ? 1:0;


    
endmodule
