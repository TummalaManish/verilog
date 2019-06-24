`include "fulladder.v"


module fourbitadder(
    output crry,
    output [3:0]sum,
    input [3:0]in1,
    input [3:0]in2,
    input cin );

wire [2:0]intm;

fulladder fa1(intm[0], sum[0], in1[0], in2[0], cin);
fulladder fa2(intm[1], sum[1], in1[1], in2[1], intm[0]);
fulladder fa3(intm[2], sum[2], in1[2], in2[2], intm[1]);
fulladder fa4(crry, sum[3], in1[3], in2[3], intm[2]);
endmodule