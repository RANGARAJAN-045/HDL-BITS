module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

Write your solution here

module top_module(

    input clk,

    input areset,    // Freshly brainwashed Lemmings walk left.

    input bump_left,

    input bump_right,

    input ground,

    input dig,

    output walk_left,

    output walk_right,

    output aaah,

    output digging ); 

    

    parameter [2:0] left=0,right=1,left_gnd=2,right_gnd=3,dig_l=4,dig_r=5;

    reg [2:0] state , next;

    always @(posedge areset or posedge clk)

        begin

            if(areset)

                state <= 0;

            else

                state <= next; 

        end

    always @(*)

        begin

            case(state)

                left : next = !ground ? left_gnd :(dig ? dig_l : (bump_left ? right : left) );

                right : next = !ground ? right_gnd :(dig ? dig_r :(bump_right ? left : right));

                left_gnd : next = ground ? left : left_gnd;

                right_gnd : next = ground ? right : right_gnd;

                dig_l : next = !ground ? left_gnd : dig_l;

                dig_r : next = !ground ? right_gnd : dig_r;

                default : next = left;

            endcase

        end

    

    assign walk_left = (state == left);

    assign walk_right =(state == right);

    assign aaah = (state == left_gnd || state == right_gnd);

    assign digging = (state == dig_l  || state == dig_r);

​

endmodule

Upload a source file...

    fsm2s fsm3comb fsm3onehot fsm3 fsm3s exams/ece241_2013_q4 lemmings1 lemmings2 · 

lemmings3

    · lemmings4 fsm_onehot fsm_ps2 fsm_ps2data fsm_serial fsm_serialdata fsm_serialdp fsm_hdlc 

lemmings2Previous
Nextlemmings4

    This page was last edited on 18 November 2015, at 05:21.
    About HDLBits

