module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    wire [7:0]p;
    always@(posedge clk)begin
        pedge<=in&(~p);
        p<=in;
    end
endmodule
