module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    full_adder full_adder_1(a[0],b[0],cin,cout[0],sum[0]);
    full_adder full_adder_2(a[1],b[1],cout[0],cout[1],sum[1]);   
    full_adder full_adder_3(a[2],b[2],cout[1],cout[2],sum[2]);
    
    
    
endmodule

module full_adder(input a,b,input cin, output cout,output sum);
	assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);

endmodule
