module top
(
    input clk,
    output [5:0] led
);

localparam WAIT_TIME = 13500000;
reg [5:0] ledCounter = 1;
reg [23:0] clockCounter = 0;

reg direction = 0;

always @(posedge clk) begin
    // Count the number of clock cycles
    clockCounter <= clockCounter + 1;
    if (clockCounter == WAIT_TIME) begin
        clockCounter <= 0;

        // Set the direction of the counter
        if (ledCounter == 16)
            direction <= 1;
        else if (ledCounter == 2)
            direction <= 0;

        // Increment or decrement the counter
        if (direction == 0)
            ledCounter <= ledCounter * 2;
        else
            ledCounter <= ledCounter / 2;
    end
end

assign led = ledCounter;
endmodule
