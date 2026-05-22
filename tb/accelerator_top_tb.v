`timescale 1ns/1ps

module accelerator_top_tb;

reg clk;
reg reset;

accelerator_top uut(
    .clk(clk),
    .reset(reset)
);

always #5 clk = ~clk;

initial
begin

    $dumpfile("accelerator.vcd");
    $dumpvars(0, accelerator_top_tb);

    clk = 0;
    reset = 1;

    #10;

    reset = 0;

    #100;

    $finish;

end

endmodule