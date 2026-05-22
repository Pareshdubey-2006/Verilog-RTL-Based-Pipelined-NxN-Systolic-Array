`timescale 1ns/1ps

module matrix_mul_tb;

reg clk;

reg [7:0] a11, a12, a21, a22;
reg [7:0] b11, b12, b21, b22;

wire [15:0] c11, c12, c21, c22;

matrix_mul uut(
    .clk(clk),

    .a11(a11),
    .a12(a12),
    .a21(a21),
    .a22(a22),

    .b11(b11),
    .b12(b12),
    .b21(b21),
    .b22(b22),

    .c11(c11),
    .c12(c12),
    .c21(c21),
    .c22(c22)
);

always #5 clk = ~clk;

initial
begin

    $dumpfile("matrix.vcd");
    $dumpvars(0, matrix_mul_tb);

    clk = 0;

    // Matrix A
    a11 = 1; a12 = 2;
    a21 = 3; a22 = 4;

    // Matrix B
    b11 = 5; b12 = 6;
    b21 = 7; b22 = 8;

    #20;

    $finish;

end

endmodule