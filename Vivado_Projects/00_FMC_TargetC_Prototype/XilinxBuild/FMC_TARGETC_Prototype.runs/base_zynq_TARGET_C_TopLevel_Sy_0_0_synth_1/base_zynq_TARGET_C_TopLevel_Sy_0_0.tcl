# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
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
set_param project.vivado.isBlockSynthRun true
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir V:/XilinxBuild/FMC_TARGETC_Prototype.cache/wt [current_project]
set_property parent.project_path V:/XilinxBuild/FMC_TARGETC_Prototype.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo v:/XilinxBuild/FMC_TARGETC_Prototype.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
set_property include_dirs V:/hw/src [current_fileset]
read_vhdl -library xil_defaultlib {
  V:/hw/src/99_Packages/AXI_Lite_pkg.vhd
  V:/hw/src/FiFo_Manager/AddressDecoder.vhdl
  V:/hw/src/Round_Buffer/BitSelector.vhd
  V:/hw/src/99_Packages/WindowCPU_pkg.vhd
  V:/hw/src/99_Packages/TARGETC_pkg.vhd
  V:/hw/src/Round_Buffer/BlockDelay.vhd
  V:/hw/src/Clock_Management/CLOCK_MANAGEMENT.vhd
  V:/hw/src/98_Basic_Component/CNT_EN.vhdl
  V:/hw/src/Round_Buffer/CPU_CONTROLLERV3.vhd
  V:/hw/src/98_Basic_Component/DFF.vhd
  V:/hw/src/FiFo_Manager/DataDecoder.vhdl
  V:/hw/src/FiFo_Manager/FIFO_MANAGER.vhdl
  V:/hw/src/Round_Buffer/GrayDecoder.vhd
  V:/hw/src/Round_Buffer/GrayEncoder.vhd
  V:/hw/src/Round_Buffer/HammingDecoderV2.vhd
  V:/hw/src/Round_Buffer/LookupTable_LE.vhd
  V:/hw/src/Digitization_Readout/READOUT_DIGITIZATION_SAMPLE.vhd
  V:/hw/src/Register_Handler/REGISTER_HANDLER.vhd
  V:/hw/src/99_Packages/Register_pkg.vhd
  V:/hw/src/Round_Buffer/RoundBufferV6.vhd
  V:/hw/src/Round_Buffer/SingleTrigger.vhd
  V:/hw/src/TargetC_Control/TARGETC_Control.vhd
  V:/hw/src/Round_Buffer/TRIGGER_CONTROLLER.vhd
  V:/hw/src/Round_Buffer/WindowStoreV4.vhd
  V:/hw/src/Round_Buffer/Window_BrainV2.vhd
  V:/hw/src/98_Basic_Component/afifoV2.vhdl
  V:/hw/src/98_Basic_Component/clockcrossing_Buffer.vhd
  V:/hw/src/98_Basic_Component/counter.vhdl
  V:/hw/src/98_Basic_Component/fifo.vhdl
  V:/hw/src/TARGETC_TOPLEVEL.vhd
}
read_ip -quiet V:/hw/bd/base_zynq/ip/base_zynq_TARGET_C_TopLevel_Sy_0_0/base_zynq_TARGET_C_TopLevel_Sy_0_0.xci

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
set_param ips.enableIPCacheLiteLoad 0

set cached_ip [config_ip_cache -export -no_bom -use_project_ipc -dir V:/XilinxBuild/FMC_TARGETC_Prototype.runs/base_zynq_TARGET_C_TopLevel_Sy_0_0_synth_1 -new_name base_zynq_TARGET_C_TopLevel_Sy_0_0 -ip [get_ips base_zynq_TARGET_C_TopLevel_Sy_0_0]]

if { $cached_ip eq {} } {
close [open __synthesis_is_running__ w]

synth_design -top base_zynq_TARGET_C_TopLevel_Sy_0_0 -part xc7z010clg400-1 -mode out_of_context

#---------------------------------------------------------
# Generate Checkpoint/Stub/Simulation Files For IP Cache
#---------------------------------------------------------
# disable binary constraint mode for IPCache checkpoints
set_param constraints.enableBinaryConstraints false

catch {
 write_checkpoint -force -noxdef -rename_prefix base_zynq_TARGET_C_TopLevel_Sy_0_0_ base_zynq_TARGET_C_TopLevel_Sy_0_0.dcp

 set ipCachedFiles {}
 write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ base_zynq_TARGET_C_TopLevel_Sy_0_0_stub.v
 lappend ipCachedFiles base_zynq_TARGET_C_TopLevel_Sy_0_0_stub.v

 write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ base_zynq_TARGET_C_TopLevel_Sy_0_0_stub.vhdl
 lappend ipCachedFiles base_zynq_TARGET_C_TopLevel_Sy_0_0_stub.vhdl

 write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ base_zynq_TARGET_C_TopLevel_Sy_0_0_sim_netlist.v
 lappend ipCachedFiles base_zynq_TARGET_C_TopLevel_Sy_0_0_sim_netlist.v

 write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ base_zynq_TARGET_C_TopLevel_Sy_0_0_sim_netlist.vhdl
 lappend ipCachedFiles base_zynq_TARGET_C_TopLevel_Sy_0_0_sim_netlist.vhdl
set TIME_taken [expr [clock seconds] - $TIME_start]

 config_ip_cache -add -dcp base_zynq_TARGET_C_TopLevel_Sy_0_0.dcp -move_files $ipCachedFiles -use_project_ipc  -synth_runtime $TIME_taken  -ip [get_ips base_zynq_TARGET_C_TopLevel_Sy_0_0]
}

rename_ref -prefix_all base_zynq_TARGET_C_TopLevel_Sy_0_0_

# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef base_zynq_TARGET_C_TopLevel_Sy_0_0.dcp
create_report "base_zynq_TARGET_C_TopLevel_Sy_0_0_synth_1_synth_report_utilization_0" "report_utilization -file base_zynq_TARGET_C_TopLevel_Sy_0_0_utilization_synth.rpt -pb base_zynq_TARGET_C_TopLevel_Sy_0_0_utilization_synth.pb"

if { [catch {
  file copy -force V:/XilinxBuild/FMC_TARGETC_Prototype.runs/base_zynq_TARGET_C_TopLevel_Sy_0_0_synth_1/base_zynq_TARGET_C_TopLevel_Sy_0_0.dcp V:/hw/bd/base_zynq/ip/base_zynq_TARGET_C_TopLevel_Sy_0_0/base_zynq_TARGET_C_TopLevel_Sy_0_0.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub V:/hw/bd/base_zynq/ip/base_zynq_TARGET_C_TopLevel_Sy_0_0/base_zynq_TARGET_C_TopLevel_Sy_0_0_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub V:/hw/bd/base_zynq/ip/base_zynq_TARGET_C_TopLevel_Sy_0_0/base_zynq_TARGET_C_TopLevel_Sy_0_0_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim V:/hw/bd/base_zynq/ip/base_zynq_TARGET_C_TopLevel_Sy_0_0/base_zynq_TARGET_C_TopLevel_Sy_0_0_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim V:/hw/bd/base_zynq/ip/base_zynq_TARGET_C_TopLevel_Sy_0_0/base_zynq_TARGET_C_TopLevel_Sy_0_0_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}


} else {


if { [catch {
  file copy -force V:/XilinxBuild/FMC_TARGETC_Prototype.runs/base_zynq_TARGET_C_TopLevel_Sy_0_0_synth_1/base_zynq_TARGET_C_TopLevel_Sy_0_0.dcp V:/hw/bd/base_zynq/ip/base_zynq_TARGET_C_TopLevel_Sy_0_0/base_zynq_TARGET_C_TopLevel_Sy_0_0.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  file rename -force V:/XilinxBuild/FMC_TARGETC_Prototype.runs/base_zynq_TARGET_C_TopLevel_Sy_0_0_synth_1/base_zynq_TARGET_C_TopLevel_Sy_0_0_stub.v V:/hw/bd/base_zynq/ip/base_zynq_TARGET_C_TopLevel_Sy_0_0/base_zynq_TARGET_C_TopLevel_Sy_0_0_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force V:/XilinxBuild/FMC_TARGETC_Prototype.runs/base_zynq_TARGET_C_TopLevel_Sy_0_0_synth_1/base_zynq_TARGET_C_TopLevel_Sy_0_0_stub.vhdl V:/hw/bd/base_zynq/ip/base_zynq_TARGET_C_TopLevel_Sy_0_0/base_zynq_TARGET_C_TopLevel_Sy_0_0_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force V:/XilinxBuild/FMC_TARGETC_Prototype.runs/base_zynq_TARGET_C_TopLevel_Sy_0_0_synth_1/base_zynq_TARGET_C_TopLevel_Sy_0_0_sim_netlist.v V:/hw/bd/base_zynq/ip/base_zynq_TARGET_C_TopLevel_Sy_0_0/base_zynq_TARGET_C_TopLevel_Sy_0_0_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  file rename -force V:/XilinxBuild/FMC_TARGETC_Prototype.runs/base_zynq_TARGET_C_TopLevel_Sy_0_0_synth_1/base_zynq_TARGET_C_TopLevel_Sy_0_0_sim_netlist.vhdl V:/hw/bd/base_zynq/ip/base_zynq_TARGET_C_TopLevel_Sy_0_0/base_zynq_TARGET_C_TopLevel_Sy_0_0_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

}; # end if cached_ip 

if {[file isdir V:/XilinxBuild/FMC_TARGETC_Prototype.ip_user_files/ip/base_zynq_TARGET_C_TopLevel_Sy_0_0]} {
  catch { 
    file copy -force V:/hw/bd/base_zynq/ip/base_zynq_TARGET_C_TopLevel_Sy_0_0/base_zynq_TARGET_C_TopLevel_Sy_0_0_stub.v V:/XilinxBuild/FMC_TARGETC_Prototype.ip_user_files/ip/base_zynq_TARGET_C_TopLevel_Sy_0_0
  }
}

if {[file isdir V:/XilinxBuild/FMC_TARGETC_Prototype.ip_user_files/ip/base_zynq_TARGET_C_TopLevel_Sy_0_0]} {
  catch { 
    file copy -force V:/hw/bd/base_zynq/ip/base_zynq_TARGET_C_TopLevel_Sy_0_0/base_zynq_TARGET_C_TopLevel_Sy_0_0_stub.vhdl V:/XilinxBuild/FMC_TARGETC_Prototype.ip_user_files/ip/base_zynq_TARGET_C_TopLevel_Sy_0_0
  }
}
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
