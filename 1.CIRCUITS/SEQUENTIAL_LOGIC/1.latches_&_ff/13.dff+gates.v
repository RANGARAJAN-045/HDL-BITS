module top_module (
    input clk,
    input x,
    output z
); 
    reg q1=0,q2=0,q3=0;
    dff d0(clk,x^q1,q1);
    dff d1(clk,x&~q2,q2);
    dff d2(clk,x|~q3,q3);
    assign z=~(q1|q2|q3);
endmodule
module dff(input clk,d,output reg q);
    always@(posedge clk)begin
        q<=d;
    end
endmodule
