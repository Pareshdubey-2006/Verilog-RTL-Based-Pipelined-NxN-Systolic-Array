module controller(
    input clk,
    input reset,

    output reg load,
    output reg compute,
    output reg store,
    output reg done
);

reg [2:0] state;

parameter IDLE    = 3'b000;
parameter LOAD    = 3'b001;
parameter COMPUTE = 3'b010;
parameter STORE   = 3'b011;
parameter DONE    = 3'b100;

always @(posedge clk or posedge reset)
begin

    if(reset)
        state <= IDLE;

    else
    begin
        case(state)

            IDLE:
                state <= LOAD;

            LOAD:
                state <= COMPUTE;

            COMPUTE:
                state <= STORE;

            STORE:
                state <= DONE;

            DONE:
                state <= DONE;

            default:
                state <= IDLE;

        endcase
    end
end

always @(*)
begin

    load    = 0;
    compute = 0;
    store   = 0;
    done    = 0;

    case(state)

        LOAD:
            load = 1;

        COMPUTE:
            compute = 1;

        STORE:
            store = 1;

        DONE:
            done = 1;

    endcase

end

endmodule