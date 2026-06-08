module top_module();
    reg in;
    reg [2:0]s;
    reg clk;
    wire out;
    
    q7 uut (clk,in,s,out);
    
    always #5 clk=~clk;
    
    initial begin
        in=0;s=3'b010;clk=0;
        #10 s=3'b110;
        #10 in=1;s=3'b010;
        #10 in=0;s=3'b111;
        #10 in=1;s=3'b000;
        #30 in=0;
    end

endmodule
