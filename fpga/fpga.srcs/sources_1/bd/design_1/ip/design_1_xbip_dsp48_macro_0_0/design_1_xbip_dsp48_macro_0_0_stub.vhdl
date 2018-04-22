-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
-- Date        : Sun Apr 22 15:47:57 2018
-- Host        : CS-S118 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               h:/FPGA-Neural-Network-/fpga/fpga.srcs/sources_1/bd/design_1/ip/design_1_xbip_dsp48_macro_0_0/design_1_xbip_dsp48_macro_0_0_stub.vhdl
-- Design      : design_1_xbip_dsp48_macro_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_xbip_dsp48_macro_0_0 is
  Port ( 
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 7 downto 0 );
    B : in STD_LOGIC_VECTOR ( 8 downto 0 );
    P : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end design_1_xbip_dsp48_macro_0_0;

architecture stub of design_1_xbip_dsp48_macro_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK,A[7:0],B[8:0],P[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "xbip_dsp48_macro_v3_0_15,Vivado 2017.3";
begin
end;