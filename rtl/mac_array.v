module mac_array(
    input clk,

    input [7:0] a1,
    input [7:0] b1,
    input [15:0] acc1,

    input [7:0] a2,
    input [7:0] b2,
    input [15:0] acc2,

    input [7:0] a3,
    input [7:0] b3,
    input [15:0] acc3,

    input [7:0] a4,
    input [7:0] b4,
    input [15:0] acc4,

    output [15:0] result1,
    output [15:0] result2,
    output [15:0] result3,
    output [15:0] result4
);

mac_unit mac1(
    .clk(clk),
    .a(a1),
    .b(b1),
    .acc_in(acc1),
    .result(result1)
);

mac_unit mac2(
    .clk(clk),
    .a(a2),
    .b(b2),
    .acc_in(acc2),
    .result(result2)
);

mac_unit mac3(
    .clk(clk),
    .a(a3),
    .b(b3),
    .acc_in(acc3),
    .result(result3)
);

mac_unit mac4(
    .clk(clk),
    .a(a4),
    .b(b4),
    .acc_in(acc4),
    .result(result4)
);

endmodule