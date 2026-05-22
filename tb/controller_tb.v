`timescale 1ns/1ps

module controller_tb;

reg clk;
reg reset;

wire load;
wire compute;
wire store;
wire done;

controller uut(
    .clk(clk),
    .reset(reset),
    .load(load),
    .compute(compute),
    .store(store),
    .done(done)
);

always #5 clk = ~clk;

initial
begin

    $dumpfile("controllewhy there r.vcd");
    $dumpvars(0, controller_tb);

    clk = 0;
    reset = 1;

    #10;

    reset = 0;

    #50;

    $finish;

end

endmodule