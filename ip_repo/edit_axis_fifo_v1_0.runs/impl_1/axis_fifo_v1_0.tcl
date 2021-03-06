# 
# Report generation script generated by Vivado
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
proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
set_msg_config  -ruleid {1}  -id {IP_Flow 19-4963}  -string {{WARNING: [IP_Flow 19-4963] design_1_xbip_dsp48_macro_0_0 has board value specified. The packaged IP will be restricted to usage with board 'digilentinc.com:zybo-z7-10:part0:1.0'}}  -suppress 

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param synth.incrementalSynthesisCache C:/Users/rpolley/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado-11296-CS-S110/incrSyn
  create_project -in_memory -part xc7z010clg400-1
  set_property board_part digilentinc.com:zybo-z7-10:part0:1.0 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir H:/FPGA-Neural-Network-/ip_repo/edit_axis_fifo_v1_0.cache/wt [current_project]
  set_property parent.project_path H:/FPGA-Neural-Network-/ip_repo/edit_axis_fifo_v1_0.xpr [current_project]
  set_property ip_repo_paths {
  H:/FPGA-Neural-Network-/ip_repo/myip_1.0
  H:/FPGA-Neural-Network-/ip_repo/axis_fifo_1.0
  H:/FPGA-Neural-Network-/ip_repo/axis_fifo_1.0
  H:/FPGA-Neural-Network-/ip_repo/axis_fifo_1.0
} [current_project]
  set_property ip_output_repo H:/FPGA-Neural-Network-/ip_repo/edit_axis_fifo_v1_0.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  set_property XPM_LIBRARIES XPM_MEMORY [current_project]
  add_files -quiet H:/FPGA-Neural-Network-/ip_repo/edit_axis_fifo_v1_0.runs/synth_1/axis_fifo_v1_0.dcp
  set_msg_config -source 4 -id {BD 41-1661} -limit 0
  set_param project.isImplRun true
  add_files H:/FPGA-Neural-Network-/fpga/fpga.srcs/sources_1/bd/design_1/design_1.bd
  add_files H:/FPGA-Neural-Network-/fpga/fpga.srcs/sources_1/bd/bram/bram.bd
  set_param project.isImplRun false
  set_param project.isImplRun true
  link_design -top axis_fifo_v1_0 -part xc7z010clg400-1
  set_param project.isImplRun false
  write_hwdef -force -file axis_fifo_v1_0.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force axis_fifo_v1_0_opt.dcp
  create_report "impl_1_opt_report_drc_0" "report_drc -file axis_fifo_v1_0_drc_opted.rpt -pb axis_fifo_v1_0_drc_opted.pb -rpx axis_fifo_v1_0_drc_opted.rpx"
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force axis_fifo_v1_0_placed.dcp
  create_report "impl_1_place_report_io_0" "report_io -file axis_fifo_v1_0_io_placed.rpt"
  create_report "impl_1_place_report_utilization_0" "report_utilization -file axis_fifo_v1_0_utilization_placed.rpt -pb axis_fifo_v1_0_utilization_placed.pb"
  create_report "impl_1_place_report_control_sets_0" "report_control_sets -file axis_fifo_v1_0_control_sets_placed.rpt"
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force axis_fifo_v1_0_routed.dcp
  create_report "impl_1_route_report_drc_0" "report_drc -file axis_fifo_v1_0_drc_routed.rpt -pb axis_fifo_v1_0_drc_routed.pb -rpx axis_fifo_v1_0_drc_routed.rpx"
  create_report "impl_1_route_report_methodology_0" "report_methodology -file axis_fifo_v1_0_methodology_drc_routed.rpt -pb axis_fifo_v1_0_methodology_drc_routed.pb -rpx axis_fifo_v1_0_methodology_drc_routed.rpx"
  create_report "impl_1_route_report_power_0" "report_power -file axis_fifo_v1_0_power_routed.rpt -pb axis_fifo_v1_0_power_summary_routed.pb -rpx axis_fifo_v1_0_power_routed.rpx"
  create_report "impl_1_route_report_route_status_0" "report_route_status -file axis_fifo_v1_0_route_status.rpt -pb axis_fifo_v1_0_route_status.pb"
  create_report "impl_1_route_report_timing_summary_0" "report_timing_summary -file axis_fifo_v1_0_timing_summary_routed.rpt -warn_on_violation  -rpx axis_fifo_v1_0_timing_summary_routed.rpx"
  create_report "impl_1_route_report_incremental_reuse_0" "report_incremental_reuse -file axis_fifo_v1_0_incremental_reuse_routed.rpt"
  create_report "impl_1_route_report_clock_utilization_0" "report_clock_utilization -file axis_fifo_v1_0_clock_utilization_routed.rpt"
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force axis_fifo_v1_0_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

