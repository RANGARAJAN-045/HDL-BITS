module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire q1,q2;
    always@(posedge clk)begin
        q1=(E?w:Q);
        q2=(L?R:q1);
        Q<=q2;  
    end
endmodule
