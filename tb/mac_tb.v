`timescale 1ns/1ps

module mac_tb;

reg clk;
reg [7:0] a;
reg [7:0] b;
reg [15:0] acc_in;

wire [15:0] result;

mac_unit uut (
    .clk(clk),
    .a(a),
    .b(b),
    .acc_in(acc_in),
    .result(result)
);

always #5 clk = ~clk;

initial
begin
    $dumpfile("mac.vcd");
    $dumpvars(0, mac_tb);

    clk = 0;

    a = 3;
    b = 4;
    acc_in = 5;

    #10;

    a = 2;
    b = 5;
    acc_in = result;

    #10;

    $finish;
end

endmodule