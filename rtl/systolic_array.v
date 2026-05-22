module systolic_array #(
    parameter WIDTH = 8
)(
    input clk,

    input [WIDTH-1:0] a_in,
    input [WIDTH-1:0] b_in,

    output [(2*WIDTH)-1:0] final_out
);

wire [WIDTH-1:0] a_wire1;
wire [WIDTH-1:0] b_wire1;

wire [(2*WIDTH)-1:0] acc_wire1;

pe #(WIDTH) pe1(
    .clk(clk),

    .a_in(a_in),
    .b_in(b_in),

    .acc_in(0),

    .a_out(a_wire1),
    .b_out(b_wire1),

    .acc_out(acc_wire1)
);

pe #(WIDTH) pe2(
    .clk(clk),

    .a_in(a_wire1),
    .b_in(b_wire1),

    .acc_in(acc_wire1),

    .a_out(),
    .b_out(),

    .acc_out(final_out)
);

endmodule