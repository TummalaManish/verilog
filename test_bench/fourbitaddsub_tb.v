`include "../verilog_files/fourbitaddsub.v"

module fourbitaddsub_tb;

reg [3:0]in1, in2;
reg ctrl;

wire [3:0]sum;
wire crry;

integer v1, v2;

fourbitaddsub ins1(crry, sum, in1, in2, ctrl);

initial begin
    $dumpfile("fourbitaddsub_dump.vcd");
    $dumpvars(0,ins1);
    $monitor("in1: %b | in2: %b | ctrl: %b || crry: %b | sum: %b",in1, in2, ctrl, crry, sum);
    for (v1 = 4'b0000; v1 < 16; v1=v1+4'b0001) begin
        for (v2 = 4'b0000; v2 < 16; v2=v2+4'b0001) begin
            #10 in1 = v1; in2 = v2; ctrl = 1'b0;
            #10 in1 = v1; in2 = v2; ctrl = 1'b1;
        end
    end
    #10 $finish;
end
endmodule