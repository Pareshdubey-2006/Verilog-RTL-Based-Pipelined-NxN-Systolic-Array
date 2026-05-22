`timescale 1ns/1ps

module systolic_nxn_tb;

parameter WIDTH = 8;
parameter N = 2;

reg clk;

// Input arrays
reg [WIDTH-1:0] a_in [0:N-1];
reg [WIDTH-1:0] b_in [0:N-1];

// Output array
wire [(2*WIDTH)-1:0] out [0:N-1][0:N-1];

// DUT Instantiation
systolic_nxn #(WIDTH, N) uut(

    .clk(clk),

    .a_in(a_in),
    .b_in(b_in),

    .out(out)

);

// Clock generation
always #5 clk = ~clk;

initial
begin

    $dumpfile("systolic_nxn");
    $dumpvars(0, systolic_nxn_tb);

    clk = 0;

    // Input matrix elements
    a_in[0] = 2;
    a_in[1] = 3;

    b_in[0] = 4;
    b_in[1] = 5;

    #50;

    // Display outputs
    $display("out[0][0] = %d", out[0][0]);
    $display("out[0][1] = %d", out[0][1]);
    $display("out[1][0] = %d", out[1][0]);
    $display("out[1][1] = %d", out[1][1]);

    $finish;

end

endmodule