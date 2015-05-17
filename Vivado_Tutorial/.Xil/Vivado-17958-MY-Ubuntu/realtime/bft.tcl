# 
# Synthesis run script generated by Vivado
# 

namespace eval rt {
    variable rc
}
set rt::rc [catch {
  uplevel #0 {
    set ::env(BUILTIN_SYNTH) true
    source $::env(HRT_TCL_PATH)/rtSynthPrep.tcl
    rt::HARTNDb_startJobStats
    set rt::cmdEcho 0
    rt::set_parameter writeXmsg true
    set ::env(RT_TMP) "./.Xil/Vivado-17958-MY-Ubuntu/realtime/tmp"
    if { [ info exists ::env(RT_TMP) ] } {
      file mkdir $::env(RT_TMP)
    }

    rt::delete_design

    set rt::partid xc7k70tfbg484-2

    set rt::multiChipSynthesisFlow false
    source $::env(SYNTH_COMMON)/common_vhdl.tcl
    set rt::defaultWorkLibName xil_defaultlib

    # Skipping read_* RTL commands because this is post-elab optimize flow
    set rt::useElabCache true
    if {$rt::useElabCache == false} {
      rt::read_verilog {
      /home/surendra/git/xilinx-vivado-tutorials/Vivado_Tutorial/Sources/hdl/top.v
      /home/surendra/git/xilinx-vivado-tutorials/Vivado_Tutorial/Sources/hdl/clock_generator.v
      /home/surendra/git/xilinx-vivado-tutorials/Vivado_Tutorial/Sources/hdl/async_fifo.v
      /home/surendra/git/xilinx-vivado-tutorials/Vivado_Tutorial/Sources/hdl/cpu_tb.v
      /home/surendra/git/xilinx-vivado-tutorials/Vivado_Tutorial/Sources/hdl/rtlRam.v
      /home/surendra/git/xilinx-vivado-tutorials/Vivado_Tutorial/Sources/hdl/timescale.v
      /home/surendra/git/xilinx-vivado-tutorials/Vivado_Tutorial/Sources/hdl/bft_tb.v
      /home/surendra/git/xilinx-vivado-tutorials/Vivado_Tutorial/Sources/hdl/fftTop.v
      /home/surendra/git/xilinx-vivado-tutorials/Vivado_Tutorial/Sources/hdl/mgtTop.v
      /home/surendra/git/xilinx-vivado-tutorials/Vivado_Tutorial/Sources/hdl/FifoBuffer.v
    }
      rt::read_vhdl -lib bftLib {
      /home/surendra/git/xilinx-vivado-tutorials/Vivado_Tutorial/Sources/hdl/bftLib/round_4.vhdl
      /home/surendra/git/xilinx-vivado-tutorials/Vivado_Tutorial/Sources/hdl/bftLib/core_transform.vhdl
      /home/surendra/git/xilinx-vivado-tutorials/Vivado_Tutorial/Sources/hdl/bftLib/round_3.vhdl
      /home/surendra/git/xilinx-vivado-tutorials/Vivado_Tutorial/Sources/hdl/bftLib/round_1.vhdl
      /home/surendra/git/xilinx-vivado-tutorials/Vivado_Tutorial/Sources/hdl/bftLib/bft_package.vhdl
      /home/surendra/git/xilinx-vivado-tutorials/Vivado_Tutorial/Sources/hdl/bftLib/round_2.vhdl
    }
      rt::read_vhdl -lib xil_defaultlib /home/surendra/git/xilinx-vivado-tutorials/Vivado_Tutorial/Sources/hdl/bft.vhdl
      rt::filesetChecksum
    }
    rt::set_parameter usePostFindUniquification true
    set rt::SDCFileList ./.Xil/Vivado-17958-MY-Ubuntu/realtime/bft_synth.xdc
    rt::sdcChecksum
    set rt::top bft
    set rt::reportTiming false
    rt::set_parameter elaborateOnly false
    rt::set_parameter elaborateRtl false
    rt::set_parameter eliminateRedundantBitOperator true
    rt::set_parameter writeBlackboxInterface true
    rt::set_parameter ramStyle auto
    rt::set_parameter merge_flipflops true
    rt::set_parameter webTalkPath {./.Xil/Vivado-17958-MY-Ubuntu/wt}
    rt::set_parameter enableSplitFlowPath "./.Xil/Vivado-17958-MY-Ubuntu/"
    if {$rt::useElabCache == false} {
      rt::run_synthesis -module $rt::top
    }

    set rt::flowresult [ source $::env(SYNTH_COMMON)/flow.tcl ]
    rt::HARTNDb_stopJobStats
    rt::HARTNDb_reportJobStats "Synthesis Optimization Runtime"
    if { $rt::flowresult == 1 } { return -code error }

    if { [ info exists ::env(RT_TMP) ] } {
      file delete -force $::env(RT_TMP)
    }


    source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  } ; #end uplevel
} rt::result]

if { $rt::rc } {
  $rt::db resetHdlParse
  source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  return -code "error" $rt::result
}