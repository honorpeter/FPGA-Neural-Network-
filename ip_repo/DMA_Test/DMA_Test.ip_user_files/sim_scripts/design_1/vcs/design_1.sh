#!/bin/bash -f
#*********************************************************************************************************
# Vivado (TM) v2017.3 (64-bit)
#
# Filename    : design_1.sh
# Simulator   : Synopsys Verilog Compiler Simulator
# Description : Simulation script for compiling, elaborating and verifying the project source files.
#               The script will automatically create the design libraries sub-directories in the run
#               directory, add the library logical mappings in the simulator setup file, create default
#               'do/prj' file, execute compilation, elaboration and simulation steps.
#
# Generated by Vivado on Tue May 08 01:36:10 -0500 2018
# SW Build 2018833 on Wed Oct  4 19:58:22 MDT 2017
#
# Copyright 1986-2017 Xilinx, Inc. All Rights Reserved. 
#
# usage: design_1.sh [-help]
# usage: design_1.sh [-lib_map_path]
# usage: design_1.sh [-noclean_files]
# usage: design_1.sh [-reset_run]
#
# Prerequisite:- To compile and run simulation, you must compile the Xilinx simulation libraries using the
# 'compile_simlib' TCL command. For more information about this command, run 'compile_simlib -help' in the
# Vivado Tcl Shell. Once the libraries have been compiled successfully, specify the -lib_map_path switch
# that points to these libraries and rerun export_simulation. For more information about this switch please
# type 'export_simulation -help' in the Tcl shell.
#
# You can also point to the simulation libraries by either replacing the <SPECIFY_COMPILED_LIB_PATH> in this
# script with the compiled library directory path or specify this path with the '-lib_map_path' switch when
# executing this script. Please type 'design_1.sh -help' for more information.
#
# Additional references - 'Xilinx Vivado Design Suite User Guide:Logic simulation (UG900)'
#
#*********************************************************************************************************

# Directory path for design sources and include directories (if any) wrt this path
ref_dir="."

# Override directory with 'export_sim_ref_dir' env path value if set in the shell
if [[ (! -z "$export_sim_ref_dir") && ($export_sim_ref_dir != "") ]]; then
  ref_dir="$export_sim_ref_dir"
fi

# Command line options
vlogan_opts="-full64"
vhdlan_opts="-full64"
vcs_elab_opts="-full64 -debug_pp -t ps -licqueue -l elaborate.log"
vcs_sim_opts="-ucli -licqueue -l simulate.log"

# Design libraries
design_libs=(xil_defaultlib xpm axi_infrastructure_v1_1_0 smartconnect_v1_0 axi_protocol_checker_v2_0_0 axi_vip_v1_1_0 processing_system7_vip_v1_0_2 lib_pkg_v1_0_2 fifo_generator_v13_2_0 lib_fifo_v1_0_9 lib_srl_fifo_v1_0_2 lib_cdc_v1_0_2 axi_datamover_v5_1_16 axi_sg_v4_1_7 axi_dma_v7_1_15 xlconstant_v1_1_3 proc_sys_reset_v5_0_12 xlconcat_v2_1_1 generic_baseblocks_v2_1_0 axi_data_fifo_v2_1_13 axi_register_slice_v2_1_14 axi_protocol_converter_v2_1_14)

# Simulation root library directory
sim_lib_dir="vcs_lib"

# Script info
echo -e "design_1.sh - Script generated by export_simulation (Vivado v2017.3 (64-bit)-id)\n"

# Main steps
run()
{
  check_args $# $1
  setup $1 $2
  compile
  elaborate
  simulate
}

# RUN_STEP: <compile>
compile()
{
  # Compile design files
  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "C:/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
    "C:/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
    "C:/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
  2>&1 | tee -a vlogan.log

  vhdlan -work xpm $vhdlan_opts \
    "C:/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_VCOMP.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work axi_infrastructure_v1_1_0 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/sc_util_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_protocol_checker_v2_0_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5c1/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_vip_v1_1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/8b42/hdl/axi_vip_v1_1_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work processing_system7_vip_v1_0_2 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work lib_pkg_v1_0_2 $vhdlan_opts \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work fifo_generator_v13_2_0 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/0798/simulation/fifo_generator_vlog_beh.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work fifo_generator_v13_2_0 $vhdlan_opts \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/0798/hdl/fifo_generator_v13_2_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work fifo_generator_v13_2_0 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/0798/hdl/fifo_generator_v13_2_rfs.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work lib_fifo_v1_0_9 $vhdlan_opts \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/462e/hdl/lib_fifo_v1_0_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work lib_srl_fifo_v1_0_2 $vhdlan_opts \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work lib_cdc_v1_0_2 $vhdlan_opts \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work axi_datamover_v5_1_16 $vhdlan_opts \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/0377/hdl/axi_datamover_v5_1_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work axi_sg_v4_1_7 $vhdlan_opts \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/8316/hdl/axi_sg_v4_1_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work axi_dma_v7_1_15 $vhdlan_opts \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/9eb7/hdl/axi_dma_v7_1_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_dma_0_0/sim/design_1_axi_dma_0_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ipshared/b4e0/hdl/axis_fifo_test_v1_0_M00_AXIS.v" \
    "$ref_dir/../../../bd/design_1/ipshared/b4e0/hdl/axis_fifo_test_v1_0_S00_AXIS.v" \
    "$ref_dir/../../../bd/design_1/ipshared/b4e0/hdl/axis_fifo_test_v1_0.v" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axis_fifo_test_0_0/sim/design_1_axis_fifo_test_0_0.v" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/sim/bd_48ac.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/786b/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_10/sim/bd_48ac_s00a2s_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_19/sim/bd_48ac_s01a2s_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_25/sim/bd_48ac_s02a2s_0.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/92d2/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_29/sim/bd_48ac_m00s2a_0.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/fa70/hdl/sc_exit_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_35/sim/bd_48ac_m00e_0.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/sc_node_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_30/sim/bd_48ac_m00arn_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_31/sim/bd_48ac_m00rn_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_32/sim/bd_48ac_m00awn_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_33/sim/bd_48ac_m00wn_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_34/sim/bd_48ac_m00bn_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_26/sim/bd_48ac_sawn_1.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_27/sim/bd_48ac_swn_1.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_28/sim/bd_48ac_sbn_1.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/8ad6/hdl/sc_mmu_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_22/sim/bd_48ac_s02mmu_0.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/0f5f/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_23/sim/bd_48ac_s02tr_0.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/925a/hdl/sc_si_converter_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_24/sim/bd_48ac_s02sic_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_20/sim/bd_48ac_sarn_1.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_21/sim/bd_48ac_srn_1.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_16/sim/bd_48ac_s01mmu_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_17/sim/bd_48ac_s01tr_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_18/sim/bd_48ac_s01sic_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_11/sim/bd_48ac_sarn_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_12/sim/bd_48ac_srn_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_13/sim/bd_48ac_sawn_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_14/sim/bd_48ac_swn_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_15/sim/bd_48ac_sbn_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_7/sim/bd_48ac_s00mmu_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_8/sim/bd_48ac_s00tr_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_9/sim/bd_48ac_s00sic_0.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/1b0c/hdl/sc_switchboard_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_2/sim/bd_48ac_arsw_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_3/sim/bd_48ac_rsw_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_4/sim/bd_48ac_awsw_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_5/sim/bd_48ac_wsw_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_6/sim/bd_48ac_bsw_0.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xlconstant_v1_1_3 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/0750/hdl/xlconstant_v1_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_0/sim/bd_48ac_one_0.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work proc_sys_reset_v5_0_12 $vhdlan_opts \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_1/sim/bd_48ac_psr_aclk_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_smartconnect_0_0/sim/design_1_smartconnect_0_0.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xlconcat_v2_1_1 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/2f66/hdl/xlconcat_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_xlconcat_0_0/sim/design_1_xlconcat_0_0.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_rst_ps7_0_50M_0/sim/design_1_rst_ps7_0_50M_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/sim/design_1.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work generic_baseblocks_v2_1_0 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_data_fifo_v2_1_13 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/74ae/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_register_slice_v2_1_14 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/a259/hdl/axi_register_slice_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_protocol_converter_v2_1_14 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/33cc/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"$ref_dir/../../../../DMA_Test.srcs/sources_1/bd/design_1/ipshared/571c/hdl/verilog" +incdir+"C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \
  2>&1 | tee -a vlogan.log


  vlogan -work xil_defaultlib $vlogan_opts +v2k \
    glbl.v \
  2>&1 | tee -a vlogan.log

}

# RUN_STEP: <elaborate>
elaborate()
{
  vcs $vcs_elab_opts xil_defaultlib.design_1 xil_defaultlib.glbl -o design_1_simv
}

# RUN_STEP: <simulate>
simulate()
{
  ./design_1_simv $vcs_sim_opts -do simulate.do
}

# STEP: setup
setup()
{
  case $1 in
    "-lib_map_path" )
      if [[ ($2 == "") ]]; then
        echo -e "ERROR: Simulation library directory path not specified (type \"./design_1.sh -help\" for more information)\n"
        exit 1
      fi
      create_lib_mappings $2
    ;;
    "-reset_run" )
      reset_run
      echo -e "INFO: Simulation run files deleted.\n"
      exit 0
    ;;
    "-noclean_files" )
      # do not remove previous data
    ;;
    * )
      create_lib_mappings $2
  esac

  create_lib_dir

  # Add any setup/initialization commands here:-

  # <user specific commands>

}

# Define design library mappings
create_lib_mappings()
{
  file="synopsys_sim.setup"
  if [[ -e $file ]]; then
    if [[ ($1 == "") ]]; then
      return
    else
      rm -rf $file
    fi
  fi

  touch $file

  lib_map_path=""
  if [[ ($1 != "") ]]; then
    lib_map_path="$1"
  fi

  for (( i=0; i<${#design_libs[*]}; i++ )); do
    lib="${design_libs[i]}"
    mapping="$lib:$sim_lib_dir/$lib"
    echo $mapping >> $file
  done

  if [[ ($lib_map_path != "") ]]; then
    incl_ref="OTHERS=$lib_map_path/synopsys_sim.setup"
    echo $incl_ref >> $file
  fi
}

# Create design library directory paths
create_lib_dir()
{
  if [[ -e $sim_lib_dir ]]; then
    rm -rf $sim_lib_dir
  fi

  for (( i=0; i<${#design_libs[*]}; i++ )); do
    lib="${design_libs[i]}"
    lib_dir="$sim_lib_dir/$lib"
    if [[ ! -e $lib_dir ]]; then
      mkdir -p $lib_dir
    fi
  done
}

# Delete generated data from the previous run
reset_run()
{
  files_to_remove=(ucli.key design_1_simv vlogan.log vhdlan.log compile.log elaborate.log simulate.log .vlogansetup.env .vlogansetup.args .vcs_lib_lock scirocco_command.log 64 AN.DB csrc design_1_simv.daidir)
  for (( i=0; i<${#files_to_remove[*]}; i++ )); do
    file="${files_to_remove[i]}"
    if [[ -e $file ]]; then
      rm -rf $file
    fi
  done

  create_lib_dir
}

# Check command line arguments
check_args()
{
  if [[ ($1 == 1 ) && ($2 != "-lib_map_path" && $2 != "-noclean_files" && $2 != "-reset_run" && $2 != "-help" && $2 != "-h") ]]; then
    echo -e "ERROR: Unknown option specified '$2' (type \"./design_1.sh -help\" for more information)\n"
    exit 1
  fi

  if [[ ($2 == "-help" || $2 == "-h") ]]; then
    usage
  fi
}

# Script usage
usage()
{
  msg="Usage: design_1.sh [-help]\n\
Usage: design_1.sh [-lib_map_path]\n\
Usage: design_1.sh [-reset_run]\n\
Usage: design_1.sh [-noclean_files]\n\n\
[-help] -- Print help information for this script\n\n\
[-lib_map_path <path>] -- Compiled simulation library directory path. The simulation library is compiled\n\
using the compile_simlib tcl command. Please see 'compile_simlib -help' for more information.\n\n\
[-reset_run] -- Recreate simulator setup files and library mappings for a clean run. The generated files\n\
from the previous run will be removed. If you don't want to remove the simulator generated files, use the\n\
-noclean_files switch.\n\n\
[-noclean_files] -- Reset previous run, but do not remove simulator generated files from the previous run.\n\n"
  echo -e $msg
  exit 1
}

# Launch script
run $1 $2