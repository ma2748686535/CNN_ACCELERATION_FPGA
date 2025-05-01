`timescale 1ns / 1ps

module tb_floating_point_add_and_subtract;

reg         aclk;
reg [31:0]  float0_data;
reg [31:0]  float1_data;
reg         operation_sel;

wire [31:0] result_data;
wire        result_valid;

floating_point_add_and_subtract dut (
    .aclk(aclk),
    .float0_data(float0_data),
    .float1_data(float1_data),
    .operation_sel(operation_sel),
    .result_data(result_data),
    .result_valid(result_valid)
);

initial begin
    aclk = 0;
    forever #10 aclk = ~aclk;
end

initial begin
    float0_data = 32'h3F800000; // 1.0
    float1_data = 32'h40000000; // 2.0
    operation_sel = 1'b0;       // ¼Ó·¨

    #100;

    operation_sel = 1'b1;       // ¼õ·¨
    #200;

    $stop;
end

endmodule


