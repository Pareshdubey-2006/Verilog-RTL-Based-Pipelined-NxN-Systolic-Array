module pipelined_mac(
    input clk,
    input [7:0] a,
    input [7:0] b,
    input [15:0] acc_in,
    output reg [15:0] result
);

reg [15:0] mult_stage;

always @(posedge clk)
begin
    mult_stage <= a * b;
    result <= mult_stage + acc_in;
end

endmodule