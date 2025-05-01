//iverilog -o sim fpu_32.sv fpu_32_tb.sv
//vvp sim

`timescale 1ns/1ps

module fpu_32_tb();
    // Clock and Reset signals
    reg clk;
    reg rst_n;
    
    // Input signals
    reg [31:0] data_a;
    reg [31:0] data_b;
    reg [31:0] partial_sum;
    reg mul_enable;
    reg add_enable;
    reg data_a_valid;
    reg data_b_valid;
    reg partial_sum_valid;
    
    // Output signals
    wire [31:0] multi_res;
    wire [31:0] add_results;
    wire mul_valid;
    wire add_valid_out;
    wire mul_ready;
    wire add_ready;
    reg  mul_ack;
    reg  add_ack;
    
    // Instantiate the DUT
    fpu_32 u_fpu_32(
        .clk(clk),
        .rst_n(rst_n),
        .data_a(data_a),
        .data_b(data_b),
        .partial_sum(partial_sum),
        .mul_enable(mul_enable),
        .add_enable(add_enable),
        .data_a_valid(data_a_valid),
        .data_b_valid(data_b_valid),
        .partial_sum_valid(partial_sum_valid),
        .multi_res(multi_res),
        .add_results(add_results),
        .mul_valid(mul_valid),
        .add_valid_out(add_valid_out),
        .mul_ready(mul_ready),
        .add_ready(add_ready),
        .mul_ack(mul_ack),
        .add_ack(add_ack)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Test process
    initial begin
        // Initialize signals
        rst_n = 1'b0;
        mul_enable = 1'b0;
        add_enable = 1'b0;
        data_a_valid = 1'b0;
        data_b_valid = 1'b0;
        partial_sum_valid = 1'b0;
        data_a = 32'h0;
        data_b = 32'h0;
        partial_sum = 32'h0;
        mul_ack = 1'b0;
        add_ack = 1'b0;
        
        // Apply reset
        #20;
        rst_n = 1'b1;
        
        // Wait for a few clock cycles
        #100;
        
        // Set input data
        data_a = 32'h3F000000; // 0.5
        data_b = 32'h3F400000; // 0.75
        partial_sum = 32'h3F800000; // 1.0
        
        // Set valid signals
        data_a_valid = 1'b1;
        data_b_valid = 1'b1;
        partial_sum_valid = 1'b1;
        
        // Wait for a clock cycle
        #10;
        
        // Set mul_enable high
        mul_enable = 1'b1;
       
        
        // Wait for multiplication to complete
        #50000;
        
        // Set add_enable high
        add_enable = 1'b1;
       
        
        // Wait for addition to complete
        #50000;
        
        // Acknowledge results
        mul_ack = 1'b1;
        add_ack = 1'b1;
        #10;
        mul_ack = 1'b0;
        add_ack = 1'b0;
        
        // Wait for ready signals
        #50000;
        
        // Disable enable signals
        mul_enable = 1'b0;
        add_enable = 1'b0;
        
        // Wait for a few clock cycles
        #100;

        // Disable enable signals
        mul_enable = 1'b0;
        add_enable = 1'b0;
        
        // Set second input data
        data_a = 32'h3F200000; // 0.625
        data_b = 32'h3F600000; // 0.875
        partial_sum = 32'h3FA00000; // 1.25
        
        // Wait for a clock cycle
        #10;
        
        // Set mul_enable high again
        mul_enable = 1'b1;
        $display("mul_enable set to 1 at time %0t", $time);
        
        // Wait for multiplication to complete
        #50000;
        
        // Set add_enable high again
        add_enable = 1'b1;
        $display("add_enable set to 1 at time %0t", $time);
        
        // Wait for addition to complete
        #50000;
        
        // Acknowledge results
        mul_ack = 1'b1;
        add_ack = 1'b1;
        #10;
        mul_ack = 1'b0;
        add_ack = 1'b0;
        
        // Wait for ready signals
        #50000;
        
        // Disable enable signals
        mul_enable = 1'b0;
        add_enable = 1'b0;
        
        // Wait for a few clock cycles
        #100;
        
        // End simulation
        $finish;
    end
    
    // Monitor output
    initial begin
        $monitor("Time=%0t | Input: data_a=%h data_b=%h partial_sum=%h | Control: mul_enable=%b add_enable=%b mul_valid=%b add_valid_out=%b mul_ready=%b add_ready=%b | Output: multi_res=%h add_results=%h",
                 $time, data_a, data_b, partial_sum, mul_enable, add_enable, mul_valid, add_valid_out, mul_ready, add_ready, multi_res, add_results);
    end
    
   
    // Waveform generation
    initial begin
        $dumpfile("fpu_32_tb.vcd");
        $dumpvars(0, fpu_32_tb);
    end
    
endmodule