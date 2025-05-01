module rom_fc1_b
(

   input  wire         sys_clk  ,
   input  wire [6:0]   addr     ,
   output wire [31:0]  dout   

 );
    
rom_fc1_b_32x101 rom_fc1_b_32x101 
(
  .clka(sys_clk),    // input wire clka
  .addra(addr),  // input wire [6 : 0] addra
  .douta(dout)  // output wire [31 : 0] douta
);  
    
endmodule
