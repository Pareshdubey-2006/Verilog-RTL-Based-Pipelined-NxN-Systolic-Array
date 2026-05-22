module matrix_mul #(
    parameter WIDTH = 8
)(
    input clk,

    input [WIDTH-1:0] a11, a12,
    input [WIDTH-1:0] a21, a22,

    input [WIDTH-1:0] b11, b12,
    input [WIDTH-1:0] b21, b22,

    output reg [(2*WIDTH)-1:0] c11,
    output reg [(2*WIDTH)-1:0] c12,
    output reg [(2*WIDTH)-1:0] c21,
    output reg [(2*WIDTH)-1:0] c22
);

always @(posedge clk)
begin 

    c11 <= (a11 * b11) + (a12 * b21);

    c12 <= (a11 * b12) + (a12 * b22);

    c21 <= (a21 * b11) + (a22 * b21);

    c22 <= (a21 * b12) + (a22 * b22);

end

endmodule