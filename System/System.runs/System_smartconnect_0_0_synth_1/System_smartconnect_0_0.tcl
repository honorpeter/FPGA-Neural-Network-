# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param synth.incrementalSynthesisCache C:/Users/rpolley/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado-103776-CS-S110/incrSyn
set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL-1065} -limit 10000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
set_param project.vivado.isBlockSynthRun true
set_msg_config -msgmgr_mode ooc_run
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir H:/FPGA-Neural-Network-/System/System.cache/wt [current_project]
set_property parent.project_path H:/FPGA-Neural-Network-/System/System.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:zybo-z7-10:part0:1.0 [current_project]
set_property ip_repo_paths h:/FPGA-Neural-Network-/ip_repo/axis_fifo_1.0 [current_project]
set_property ip_output_repo h:/FPGA-Neural-Network-/System/System.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_ip -quiet H:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/System_smartconnect_0_0.xci
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_10/bd_8800_s00a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_19/bd_8800_s01a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_25/bd_8800_s02a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_29/bd_8800_m00s2a_0_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_30/bd_8800_m00arn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_31/bd_8800_m00rn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_32/bd_8800_m00awn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_33/bd_8800_m00wn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_34/bd_8800_m00bn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_26/bd_8800_sawn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_27/bd_8800_swn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_28/bd_8800_sbn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_20/bd_8800_sarn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_21/bd_8800_srn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_11/bd_8800_sarn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_12/bd_8800_srn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_13/bd_8800_sawn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_14/bd_8800_swn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_15/bd_8800_sbn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_2/bd_8800_arsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_3/bd_8800_rsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_4/bd_8800_awsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_5/bd_8800_wsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_6/bd_8800_bsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_1/bd_8800_psr_aclk_0_board.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/bd_0/ip/ip_1/bd_8800_psr_aclk_0.xdc]
set_property used_in_implementation false [get_files -all h:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

set cached_ip [config_ip_cache -export -no_bom -use_project_ipc -dir H:/FPGA-Neural-Network-/System/System.runs/System_smartconnect_0_0_synth_1 -new_name System_smartconnect_0_0 -ip [get_ips System_smartconnect_0_0]]

if { $cached_ip eq {} } {

synth_design -top System_smartconnect_0_0 -part xc7z010clg400-1 -mode out_of_context

#---------------------------------------------------------
# Generate Checkpoint/Stub/Simulation Files For IP Cache
#---------------------------------------------------------
# disable binary constraint mode for IPCache checkpoints
set_param constraints.enableBinaryConstraints false

catch {
 write_checkpoint -force -noxdef -rename_prefix System_smartconnect_0_0_ System_smartconnect_0_0.dcp

 set ipCachedFiles {}
 write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ System_smartconnect_0_0_stub.v
 lappend ipCachedFiles System_smartconnect_0_0_stub.v

 write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ System_smartconnect_0_0_stub.vhdl
 lappend ipCachedFiles System_smartconnect_0_0_stub.vhdl

 write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ System_smartconnect_0_0_sim_netlist.v
 lappend ipCachedFiles System_smartconnect_0_0_sim_netlist.v

 write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ System_smartconnect_0_0_sim_netlist.vhdl
 lappend ipCachedFiles System_smartconnect_0_0_sim_netlist.vhdl

 config_ip_cache -add -dcp System_smartconnect_0_0.dcp -move_files $ipCachedFiles -use_project_ipc -ip [get_ips System_smartconnect_0_0]
}

rename_ref -prefix_all System_smartconnect_0_0_

# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef System_smartconnect_0_0.dcp
create_report "System_smartconnect_0_0_synth_1_synth_report_utilization_0" "report_utilization -file System_smartconnect_0_0_utilization_synth.rpt -pb System_smartconnect_0_0_utilization_synth.pb"

if { [catch {
  file copy -force H:/FPGA-Neural-Network-/System/System.runs/System_smartconnect_0_0_synth_1/System_smartconnect_0_0.dcp H:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/System_smartconnect_0_0.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub H:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/System_smartconnect_0_0_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub H:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/System_smartconnect_0_0_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim H:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/System_smartconnect_0_0_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim H:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/System_smartconnect_0_0_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}


} else {


if { [catch {
  file copy -force H:/FPGA-Neural-Network-/System/System.runs/System_smartconnect_0_0_synth_1/System_smartconnect_0_0.dcp H:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/System_smartconnect_0_0.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  file rename -force H:/FPGA-Neural-Network-/System/System.runs/System_smartconnect_0_0_synth_1/System_smartconnect_0_0_stub.v H:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/System_smartconnect_0_0_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force H:/FPGA-Neural-Network-/System/System.runs/System_smartconnect_0_0_synth_1/System_smartconnect_0_0_stub.vhdl H:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/System_smartconnect_0_0_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force H:/FPGA-Neural-Network-/System/System.runs/System_smartconnect_0_0_synth_1/System_smartconnect_0_0_sim_netlist.v H:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/System_smartconnect_0_0_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  file rename -force H:/FPGA-Neural-Network-/System/System.runs/System_smartconnect_0_0_synth_1/System_smartconnect_0_0_sim_netlist.vhdl H:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/System_smartconnect_0_0_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

}; # end if cached_ip 

if {[file isdir H:/FPGA-Neural-Network-/System/System.ip_user_files/ip/System_smartconnect_0_0]} {
  catch { 
    file copy -force H:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/System_smartconnect_0_0_stub.v H:/FPGA-Neural-Network-/System/System.ip_user_files/ip/System_smartconnect_0_0
  }
}

if {[file isdir H:/FPGA-Neural-Network-/System/System.ip_user_files/ip/System_smartconnect_0_0]} {
  catch { 
    file copy -force H:/FPGA-Neural-Network-/System/System.srcs/sources_1/bd/System/ip/System_smartconnect_0_0/System_smartconnect_0_0_stub.vhdl H:/FPGA-Neural-Network-/System/System.ip_user_files/ip/System_smartconnect_0_0
  }
}
