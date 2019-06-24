`include "fourbitadder.v"

module fourbitaddsub(
    output crry,
    output [3:0]sum,
    input [3:0]in1,
    input [3:0]in2,
    input ctrl ); //If ctrl =1 then sub else add.

    wire [3:0]intm;

    // XOR outputs for the adder.
    xor xor1(intm[0], in2[0], ctrl);
    xor xor2(intm[1], in2[1], ctrl);
    xor xor3(intm[2], in2[2], ctrl);
    xor xor4(intm[3], in2[3], ctrl);

    fourbitadder fba(crry, sum, in1, intm, ctrl);
endmodule