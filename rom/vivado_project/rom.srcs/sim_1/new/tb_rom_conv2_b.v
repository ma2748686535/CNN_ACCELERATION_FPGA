`timescale 1ns / 1ps

module tb_rom_conv2_b( );

// reg define
reg sys_clk;
reg sys_rst_n;
reg [5:0] addr;

// wire define
wire [31:0] dout;

initial begin
    sys_clk    = 1'b1;
    sys_rst_n <= 1'b0;
    #20;
    sys_rst_n <= 1'b1;
end

always #10 sys_clk = ~sys_clk;

// 地址 addra 从 0~63 逐步循环
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (sys_rst_n == 1'b0)
        addr <= 8'd0;
    else if (addr == 8'd63)
        addr <= 8'd0;
    else
        addr <= addr + 1'b1;
end

rom_conv2_b rom_conv2_b_inst
(
  .sys_clk    (sys_clk),
  .addr       (addr),
  .dout       (dout)
 );
 
endmodule
