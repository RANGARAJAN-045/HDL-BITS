

    HDLBits HDLBits

    Problem Set
        Browse Problem Set
        Problem Set Stats
        User Rank List
    Simulation
        Run a Simulation (Icarus Verilog)
    22ece45rangarajan's Profile
        Log in/out
        Profile Settings
        My Stats
    Help
        Getting Started
        About HDLBits
        Bugs and Suggestions
    01xz.net
        01xz.net Home
        HDLBits — Verilog practice
        ASMBits — Assembly language practice
        CPUlator — Nios II, ARMv7, and MIPS simulator

Lemmings3
lemmings2Previous
Nextlemmings4

See also: Lemmings1 and Lemmings2.

In addition to walking and falling, Lemmings can sometimes be told to do useful things, like dig (it starts digging when dig=1). A Lemming can dig if it is currently walking on ground (ground=1 and not falling), and will continue digging until it reaches the other side (ground=0). At that point, since there is no ground, it will fall (aaah!), then continue walking in its original direction once it hits ground again. As with falling, being bumped while digging has no effect, and being told to dig when falling or when there is no ground is ignored.

(In other words, a walking Lemming can fall, dig, or switch directions. If more than one of these conditions are satisfied, fall has higher precedence than dig, which has higher precedence than switching directions.)

Extend your finite state machine to model this behaviour.

bump ignoreddig ignoredclkbump_leftbump_rightgrounddigwalk_leftwalk_rightaaahdigging Inputs Outputs

See also: Lemmings4.
Module Declaration

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

