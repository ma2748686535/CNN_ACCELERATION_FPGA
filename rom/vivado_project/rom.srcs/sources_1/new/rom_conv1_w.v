module rom_conv1_w
(
   input  wire        sys_clk  ,
   input  wire [9:0]  addr     ,
   output wire [31:0] dout     
);


rom_conv1_w_32x864 rom_conv1_w_32x864 
(
  .clka  (sys_clk   ),    // input wire clka
  .addra (addr      ),  // input wire [9 : 0] addra
  .douta (dout      )  // output wire [31 : 0] douta
);



endmodule
