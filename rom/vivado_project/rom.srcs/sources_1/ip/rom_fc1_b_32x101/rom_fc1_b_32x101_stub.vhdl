-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Fri Apr  4 01:10:07 2025
-- Host        : Irving-Wang running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/18740/Desktop/Project_Vivado/rom/vivado_project/rom.srcs/sources_1/ip/rom_fc1_b_32x101/rom_fc1_b_32x101_stub.vhdl
-- Design      : rom_fc1_b_32x101
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rom_fc1_b_32x101 is
  Port ( 
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 6 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end rom_fc1_b_32x101;

architecture stub of rom_fc1_b_32x101 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,addra[6:0],douta[31:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_4_2,Vivado 2018.3";
begin
end;
