module rom_conv1_b
(
   input  wire         sys_clk  ,
   input  wire [4:0]   addr     ,
   output wire [31:0]  dout    

    );
    
rom_conv1_b_32x32 rom_conv1_b_32x32 
(
  .clka(sys_clk),    // input wire clka
  .addra(addr),  // input wire [4 : 0] addra
  .douta(dout)  // output wire [31 : 0] douta
);    
    

endmodule
