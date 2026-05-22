module accelerator_top(
    input clk,
    input reset
);

wire load;
wire compute;
wire store;
wire done;

controller ctrl(
    .clk(clk),
    .reset(reset),
    .load(load),
    .compute(compute),
    .store(store),
    .done(done)
);

reg [7:0] a1,b1,a2,b2,a3,b3,a4,b4;
reg [15:0] acc1,acc2,acc3,acc4;

wire [15:0] result1,result2,result3,result4;

mac_array macarr(
    .clk(clk),

    .a1(a1), .b1(b1), .acc1(acc1),
    .a2(a2), .b2(b2), .acc2(acc2),
    .a3(a3), .b3(b3), .acc3(acc3),
    .a4(a4), .b4(b4), .acc4(acc4),

    .result1(result1),
    .result2(result2),
    .result3(result3),
    .result4(result4)
);

always @(posedge clk)
begin

    if(load)
    begin
        a1 <= 1; b1 <= 2; acc1 <= 0;
        a2 <= 2; b2 <= 3; acc2 <= 0;
        a3 <= 3; b3 <= 4; acc3 <= 0;
        a4 <= 4; b4 <= 5; acc4 <= 0;
    end

    if(compute)
    begin
        acc1 <= result1;
        acc2 <= result2;
        acc3 <= result3;
        acc4 <= result4;
    end

end

endmodule