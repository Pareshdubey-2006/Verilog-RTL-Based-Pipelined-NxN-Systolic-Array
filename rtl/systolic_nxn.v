module systolic_nxn #(
    parameter WIDTH = 8,
    parameter N = 2
)(

    input clk,

    input [WIDTH-1:0] a_in [0:N-1],
    input [WIDTH-1:0] b_in [0:N-1],

    output [(2*WIDTH)-1:0] out [0:N-1][0:N-1]

);

genvar i, j;

// Internal wires
wire [WIDTH-1:0] a_bus [0:N-1][0:N-1];
wire [WIDTH-1:0] b_bus [0:N-1][0:N-1];

wire [(2*WIDTH)-1:0] acc_bus [0:N-1][0:N-1];

generate

for(i = 0; i < N; i = i + 1)
begin : rows

    for(j = 0; j < N; j = j + 1)
    begin : cols

        // TOP-LEFT PE
        if(i == 0 && j == 0)
        begin

            pe #(WIDTH) pe_inst(

                .clk(clk),

                .a_in(a_in[i]),
                .b_in(b_in[j]),

                .acc_in({(2*WIDTH){1'b0}}),

                .a_out(a_bus[i][j]),
                .b_out(b_bus[i][j]),

                .acc_out(acc_bus[i][j])

            );

        end

        // FIRST COLUMN
        else if(j == 0)
        begin

            pe #(WIDTH) pe_inst(

                .clk(clk),

                .a_in(a_in[i]),
                .b_in(b_bus[i-1][j]),

                .acc_in({(2*WIDTH){1'b0}}),

                .a_out(a_bus[i][j]),
                .b_out(b_bus[i][j]),

                .acc_out(acc_bus[i][j])

            );

        end

        // FIRST ROW
        else if(i == 0)
        begin

            pe #(WIDTH) pe_inst(

                .clk(clk),

                .a_in(a_bus[i][j-1]),
                .b_in(b_in[j]),

                .acc_in(acc_bus[i][j-1]),

                .a_out(a_bus[i][j]),
                .b_out(b_bus[i][j]),

                .acc_out(acc_bus[i][j])

            );

        end

        // ALL OTHER PEs
        else
        begin

            pe #(WIDTH) pe_inst(

                .clk(clk),

                .a_in(a_bus[i][j-1]),
                .b_in(b_bus[i-1][j]),

                .acc_in(acc_bus[i][j-1]),

                .a_out(a_bus[i][j]),
                .b_out(b_bus[i][j]),

                .acc_out(acc_bus[i][j])

            );

        end

        // Final outputs
        assign out[i][j] = acc_bus[i][j];

    end

end

endgenerate

endmodule