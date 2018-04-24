// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
// Date        : Tue Apr 24 17:45:40 2018
// Host        : CS-S110 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               h:/FPGA-Neural-Network-/fpga/fpga.srcs/sources_1/bd/bram/ip/bram_blk_mem_gen_0_0/bram_blk_mem_gen_0_0_stub.v
// Design      : bram_blk_mem_gen_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_0,Vivado 2017.3" *)
module bram_blk_mem_gen_0_0(clka, ena, wea, addra, dina, clkb, enb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[7:0],dina[23:0],clkb,enb,addrb[7:0],doutb[23:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [7:0]addra;
  input [23:0]dina;
  input clkb;
  input enb;
  input [7:0]addrb;
  output [23:0]doutb;
endmodule
