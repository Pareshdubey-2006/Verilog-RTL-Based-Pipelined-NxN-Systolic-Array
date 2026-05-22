`timescale 1ns/1ps

module mac_array_tb;

reg clk;

reg [7:0] a1,b1,a2,b2,a3,b3,a4,b4;
reg [15:0] acc1,acc2,acc3,acc4;

wire [15:0] result1,result2,result3,result4;

mac_array uut(
    .clk(clk),

    .a1(a1), .b1(b1), .acc1(acc1),
    .a2(a2), .b2(b2), .acc2(acc2),
    .a3(a3), .b3(b3), .acc3(acc3),
    .a4(a4), .b4(b4), .acc4(acc4),

    .result1(result1),
    .result2(result2),
    .result3(result3),
    .result4(result4)
);

always #5 clk = ~clk;

initial
begin

    $dumpfile("mac_array.vcd");
    $dumpvars(0, mac_array_tb);

    clk = 0;

    a1=1; b1=2; acc1=0;
    a2=2; b2=3; acc2=0;
    a3=3; b3=4; acc3=0;
    a4=4; b4=5; acc4=0;

    #10;

    a1=5; b1=5; acc1=result1;
    a2=6; b2=6; acc2=result2;
    a3=7; b3=7; acc3=result3;
    a4=8; b4=8; acc4=result4;

    #10;

    $finish;

end

endmodule