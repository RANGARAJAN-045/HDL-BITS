module top_module();
    reg [2:0] in;
    wire      out;
    
    andgate dut(in,out);
    
    initial begin
        in=0;
        #10 in=2'b01;
        #10 in=2'b10;
        #10 in=2'b11;
    end
endmodule
