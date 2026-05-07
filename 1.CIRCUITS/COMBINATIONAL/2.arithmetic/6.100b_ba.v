module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    reg [99:0]c;   
 genvar i;
generate
    for(i = 0; i < 100; i = i + 1) begin:chain_loop
        if(i == 0)
            Fulladder fa (a[i], b[i], cin, sum[i], c[i]);
        else
            Fulladder fa (a[i], b[i], c[i-1], sum[i], c[i]);
    end
endgenerate
    assign cout=c[99];

endmodule
module Fulladder(input a,b,c,output s,cout);
  assign s=a^b^c;
  assign cout=(a&b)|(b&c)|(a&c);
endmodule
