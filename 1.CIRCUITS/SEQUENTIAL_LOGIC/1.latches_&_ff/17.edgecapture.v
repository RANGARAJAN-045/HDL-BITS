module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output reg [31:0] out
);
    reg [31:0] p;
    always@(posedge clk)begin
            p  <=in;
        if(reset)begin
            out<=0;
        end
        else begin
            out<=out|p&~in;
        end
    end
    

endmodule
