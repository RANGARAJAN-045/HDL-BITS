module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire c0,c1,c2,c3;
    a mod1(x[0],y[0],1'b0,c0,sum[0]);
    a mod2(x[1],y[1],c0,c1,sum[1]);
    a mod3(x[2],y[2],c1,c2,sum[2]);
    a mod4(x[3],y[3],c2,c3,sum[3]);
    assign sum[4]=c3;

endmodule
module a(input a, b,cin,output cout,sum);
    assign sum=a^b^cin;
    assign cout=(a&b)|(b&cin)|(cin&a);
endmodule
