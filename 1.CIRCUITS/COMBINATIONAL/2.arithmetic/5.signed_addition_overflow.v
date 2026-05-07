module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
);  wire c0,c1,c2,c3,c4,c5,c6,c7;
    a mod1(a[0],b[0],1'b0,c0,s[0]);
    a mod2(a[1],b[1],c0,c1,s[1]);
    a mod3(a[2],b[2],c1,c2,s[2]);
    a mod4(a[3],b[3],c2,c3,s[3]);
    a mod5(a[4],b[4],c3,c4,s[4]);
    a mod6(a[5],b[5],c4,c5,s[5]);
    a mod7(a[6],b[6],c5,c6,s[6]);
    a mod8(a[7],b[7],c6,c7,s[7]);
    assign overflow=c7^c6;
    
endmodule
module a(input a, b,cin,output cout,sum);
    assign sum=a^b^cin;
    assign cout=(a&b)|(b&cin)|(cin&a);
endmodule
