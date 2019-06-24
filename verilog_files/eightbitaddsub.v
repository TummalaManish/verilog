`include "fulladder.v"

module eightbitaddsub(
    output crry,
    output [7:0]sum,
    input [7:0]val1,
    input [7:0]val2,
    input ctrl_cin);

wire [7:0]intm;
wire [6:0]intm_fa;

xor xor1(intm[0], val1[0], ctrl_cin);
xor xor1(intm[1], val1[1], ctrl_cin);
xor xor1(intm[2], val1[2], ctrl_cin);
xor xor1(intm[3], val1[3], ctrl_cin);
xor xor1(intm[4], val1[4], ctrl_cin);
xor xor1(intm[5], val1[5], ctrl_cin);
xor xor1(intm[6], val1[6], ctrl_cin);
xor xor1(intm[7], val1[7], ctrl_cin);

fulladder fsb1(intm_fa[0], sum[0], intm[0], val2[0], ctrl_cin);
fulladder fsb2(intm_fa[1], sum[1], intm[1], val2[1], intm_fa[0]);
fulladder fsb3(intm_fa[2], sum[2], intm[2], val2[2], intm_fa[1]);
fulladder fsb4(intm_fa[3], sum[3], intm[3], val2[3], intm_fa[2]);
fulladder fsb5(intm_fa[4], sum[4], intm[4], val2[4], intm_fa[3]);
fulladder fsb6(intm_fa[5], sum[5], intm[5], val2[5], intm_fa[4]);
fulladder fsb7(intm_fa[6], sum[6], intm[6], val2[6], intm_fa[5]);
fulladder fsb8(crry, sum[7], intm[7], val2[7], intm_fa[6]);
endmodule