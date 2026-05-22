`timescale 1ns/1ps

module pipelined_mac_tb;

reg clk;
reg [7:0] a;
reg [7:0] b;
reg [15:0] acc_in;

wire [15:0] result;

pipelined_mac uut(
    .clk(clk),
    .a(a),
    .b(b),
    .acc_in(acc_in),
    .result(result)
);

always #5 clk = ~clk;

initial
begin

    $dumpfile("pipe.vcd");
    $dumpvars(0, pipelined_mac_tb);

    clk = 0;

    a = 3;
    b = 4;
    acc_in = 5;

    #10;

    a = 2;
    b = 5;
    acc_in = 10;

    #10;

    a = 4;
    b = 4;
    acc_in = 2;

    #20;

    $finish;

end

endmodule