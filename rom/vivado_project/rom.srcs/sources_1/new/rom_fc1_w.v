module rom_fc1_w
(
   input  wire         sys_clk  ,
   input  wire [12:0]  addr     ,
   output wire [31:0]  dout    

    );
    
rom_fc_w_32x6464 rom_fc_w_32x6464 
(
  .clka(sys_clk),    // input wire clka
  .addra(addr),      // input wire [12 : 0] addra
  .douta(dout)       // output wire [31 : 0] douta
);  
    
 
endmodule
