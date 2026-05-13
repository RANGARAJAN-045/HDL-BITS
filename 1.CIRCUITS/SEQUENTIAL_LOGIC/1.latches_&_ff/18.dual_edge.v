module top_module (
    input clk,
    input d,
    output q
);
    
    reg posedge_clk,negedge_clk;
    always@(posedge clk )begin
        posedge_clk<=d;
    end
    always@(negedge clk )begin
        negedge_clk<=d;
    end
    always@(*)begin
        if(clk)
            q<=posedge_clk;
        else
            q<=negedge_clk;
    end
            
endmodule
