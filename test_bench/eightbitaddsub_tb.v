`include "../verilog_files/eightbitaddsub.v"

module eightbitaddsub_tb;

reg [7:0]in1, in2;
reg ctrl;

wire [7:0]sum;
wire crry;

integer v1, v2;

eightbitaddsub ins1(crry, sum, in1, in2, ctrl);

initial begin
    $dumpfile("eightbitaddsub_dump.lxt");
    $dumpvars(0,ins1);
    $monitor("in1: %b | in2: %b | ctrl: %b || crry: %b | sum: %b",in1, in2, ctrl, crry, sum);
    for (v1 = 8'b0000_0000; v1 < 256; v1=v1+8'b0000_0001) begin
        for (v2 = 8'b0000_0000; v2 < 256; v2=v2+8'b0000_0001) begin
            #10 in1 = v1; in2 = v2; ctrl = 1'b0;
            #10 in1 = v1; in2 = v2; ctrl = 1'b1;
        end
    end
    #10 $finish;
end
endmodule