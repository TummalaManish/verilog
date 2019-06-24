`include "../verilog_files/fourbitadder.v"

module fourbitadder_tb;

reg [3:0]val1, val2;
reg cin;
wire [3:0]sum;
wire crry;

integer v1, v2, v3;


fourbitadder ins1(crry, sum, val1, val2, cin);

initial begin
    $dumpfile("fourbitadder_dump.vcd");
    $dumpvars(0,ins1);
    $monitor("val1: %b | val2: %b | cin: %b || crry: %b | sum: %b",val1, val2, cin, crry, sum);
    for (v1 = 4'b0000; v1 < 16; v1=v1+4'b0001) begin
        for (v2 = 4'b0000; v2 < 16; v2=v2+4'b0001) begin
            #10 val1 = v1; val2 = v2; cin = 1'b0;
            #10 val1 = v1; val2 = v2; cin = 1'b1;
        end
    end
    #10 $finish;
end
endmodule