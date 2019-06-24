module fulladder(
    output crry,
    output sum,
    input in1,
    input in2,
    input cin);

assign {crry, sum} = in1 + in2 + cin;
endmodule