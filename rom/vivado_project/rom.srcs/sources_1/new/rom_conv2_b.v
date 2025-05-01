module rom_conv2_b(

   input  wire         sys_clk  ,
   input  wire [5:0]   addr     ,
   output wire [31:0]  dout    

    );
    
rom_conv2_b_32x64 rom_conv2_b_32x64 (

  .clka(sys_clk),    // input wire clka
  .addra(addr),  // input wire [5 : 0] addra
  .douta(dout)  // output wire [31 : 0] douta    
 
 );
 
endmodule


