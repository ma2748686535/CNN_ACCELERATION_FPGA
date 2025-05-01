`timescale 1ns / 1ps

module tb_floating_point_divide();

reg         aclk;
reg [31:0]  float0_data;
reg [31:0]  float1_data;

wire [31:0] div_data;
wire        float_valid;

    // DUT (Device Under Test)
floating_point_divide dut (
        .aclk(aclk),
        .float0_data(float0_data),
        .float1_data(float1_data),
        .div_data(div_data),
        .float_valid(float_valid)
    );

initial aclk = 0;
always #10 aclk = ~aclk;  // 50 MHz


initial begin

    float0_data = 32'h00000000;
    float1_data = 32'h00000000;

    #50;

    float0_data = 32'h40400000; // 3.0
    float1_data = 32'h40000000; // 2.0

    #1000;

    $stop;
end

endmodule



