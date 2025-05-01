`timescale 1ns/1ps

module fpu_32_tb;

    reg clk;
    reg rst_n;

    // DUT inputs
    reg [31:0] data_a;
    reg [31:0] data_b;
    reg [31:0] partial_sum;
    reg mul_enable;
    reg add_enable;
    reg mul_ack;
    reg add_ack;

    // DUT outputs
    wire [31:0] multi_res;
    wire [31:0] add_results;
    wire mul_valid;
    wire add_valid_out;
    wire mul_ready;
    wire add_ready;

    // Instantiate DUT
    fpu_32 uut (
        .clk(clk),
        .rst_n(rst_n),
        .data_a(data_a),
        .data_b(data_b),
        .partial_sum(partial_sum),
        .mul_enable(mul_enable),
        .add_enable(add_enable),
        .mul_ack(mul_ack),
        .add_ack(add_ack),
        .multi_res(multi_res),
        .add_results(add_results),
        .mul_valid(mul_valid),
        .add_valid_out(add_valid_out),
        .mul_ready(mul_ready),
        .add_ready(add_ready)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Test process
    initial begin
        // Initialize
        rst_n = 0;
        mul_enable = 0;
        add_enable = 0;
        mul_ack = 0;
        add_ack = 0;
        data_a = 0;
        data_b = 0;
        partial_sum = 0;

        // Reset
        #20;
        rst_n = 1;

        // Wait a bit
        #20;

        // === TEST CASE 1 ===
        // 0.5 * 0.75 + 1.0 = 1.375 => 0x3FF00000

        data_a = 32'h3F000000;      // 0.5
        data_b = 32'h3F400000;      // 0.75
        partial_sum = 32'h3F800000; // 1.0

        @(posedge clk);
        mul_enable = 1;
        @(posedge clk);
        mul_enable = 0;

        wait (mul_valid == 1);
        @(posedge clk);

        add_enable = 1;
        @(posedge clk);
        add_enable = 0;

        wait (add_valid_out == 1);
        @(posedge clk);

        mul_ack = 1;
        add_ack = 1;
        @(posedge clk);
        mul_ack = 0;
        add_ack = 0;

        // === TEST CASE 2 ===
        // 0.625 * 0.875 + 1.25 = 1.796875 => approx 0x3FE60000

        data_a = 32'h3F200000;      // 0.625
        data_b = 32'h3F600000;      // 0.875
        partial_sum = 32'h3FA00000; // 1.25

        @(posedge clk);
        mul_enable = 1;
        @(posedge clk);
        mul_enable = 0;

        wait (mul_valid == 1);
        @(posedge clk);

        add_enable = 1;
        @(posedge clk);
        add_enable = 0;

        wait (add_valid_out == 1);
        @(posedge clk);

        mul_ack = 1;
        add_ack = 1;
        @(posedge clk);
        mul_ack = 0;
        add_ack = 0;

        // Wait and finish
        #100;
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("T=%0t | A=%h B=%h PS=%h | MUL=%h ADD=%h | Mv=%b Av=%b",
                 $time, data_a, data_b, partial_sum, multi_res, add_results, mul_valid, add_valid_out);
    end

endmodule
