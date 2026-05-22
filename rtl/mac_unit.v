module mac_unit(
    input clk,
    input [7:0] a,
    input [7:0] b,
    input [15:0] acc_in,
    output reg [15:0] result
);

always @(posedge clk)
begin
    result <= (a * b) + acc_in;
end

endmodule