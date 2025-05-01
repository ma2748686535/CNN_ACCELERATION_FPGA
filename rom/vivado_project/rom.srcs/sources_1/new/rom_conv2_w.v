module rom_conv2_w
(
   input  wire         sys_clk  ,
   input  wire [14:0]  addr     ,
   output wire [31:0]  dout     
);


rom_conv2_w_32x18432 rom_conv2_w_32x18432 
(
  .clka(sys_clk),    // input wire clka
  .addra(addr),  // input wire [14 : 0] addra
  .douta(dout)  // output wire [31 : 0] douta
);

endmodule
