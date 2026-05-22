`timescale 1ns/1ps

module systolic_array_tb;

reg clk;

reg [7:0] a_in;
reg [7:0] b_in;

wire [15:0] final_out;

systolic_array uut(
    .clk(clk),

    .a_in(a_in),
    .b_in(b_in),

    .final_out(final_out)
);

always #5 clk = ~clk;

initial
begin

    $dumpfile("systolic.vcd");
    $dumpvars(0, systolic_array_tb);

    clk = 0;

    a_in = 3;
    b_in = 4;

    #40;

    $finish;

end

endmodule