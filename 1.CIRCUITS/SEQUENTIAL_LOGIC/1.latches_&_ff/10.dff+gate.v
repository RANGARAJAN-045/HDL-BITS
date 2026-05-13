module top_module (
    input clk,
    input in, 
    output out);
    wire p;
   assign p=in^out;
    always@(posedge clk)begin
            out<=p;
    end

endmodule
