set_global_assignment -entity "BP_Filt" -library "lib_BP_Filt" -name IP_TOOL_NAME "altera_fir_compiler_ii"
set_global_assignment -entity "BP_Filt" -library "lib_BP_Filt" -name IP_TOOL_VERSION "22.1"
set_global_assignment -entity "BP_Filt" -library "lib_BP_Filt" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_BP_Filt" -name SPD_FILE [file join $::quartus(sip_path) "BP_Filt.spd"]

set_global_assignment -library "lib_BP_Filt" -name MISC_FILE [file join $::quartus(sip_path) "BP_Filt_sim/dspba_library_package.vhd"]
set_global_assignment -library "lib_BP_Filt" -name MISC_FILE [file join $::quartus(sip_path) "BP_Filt_sim/dspba_library.vhd"]
set_global_assignment -library "lib_BP_Filt" -name MISC_FILE [file join $::quartus(sip_path) "BP_Filt_sim/auk_dspip_math_pkg_hpfir.vhd"]
set_global_assignment -library "lib_BP_Filt" -name MISC_FILE [file join $::quartus(sip_path) "BP_Filt_sim/auk_dspip_lib_pkg_hpfir.vhd"]
set_global_assignment -library "lib_BP_Filt" -name MISC_FILE [file join $::quartus(sip_path) "BP_Filt_sim/auk_dspip_avalon_streaming_controller_hpfir.vhd"]
set_global_assignment -library "lib_BP_Filt" -name MISC_FILE [file join $::quartus(sip_path) "BP_Filt_sim/auk_dspip_avalon_streaming_sink_hpfir.vhd"]
set_global_assignment -library "lib_BP_Filt" -name MISC_FILE [file join $::quartus(sip_path) "BP_Filt_sim/auk_dspip_avalon_streaming_source_hpfir.vhd"]
set_global_assignment -library "lib_BP_Filt" -name MISC_FILE [file join $::quartus(sip_path) "BP_Filt_sim/auk_dspip_roundsat_hpfir.vhd"]
set_global_assignment -library "lib_BP_Filt" -name MISC_FILE [file join $::quartus(sip_path) "BP_Filt_sim/altera_avalon_sc_fifo.v"]
set_global_assignment -library "lib_BP_Filt" -name MISC_FILE [file join $::quartus(sip_path) "BP_Filt_sim/BP_Filt_rtl_core.vhd"]
set_global_assignment -library "lib_BP_Filt" -name MISC_FILE [file join $::quartus(sip_path) "BP_Filt_sim/BP_Filt_ast.vhd"]
set_global_assignment -library "lib_BP_Filt" -name MISC_FILE [file join $::quartus(sip_path) "BP_Filt_sim/BP_Filt.vhd"]
set_global_assignment -library "lib_BP_Filt" -name MISC_FILE [file join $::quartus(sip_path) "BP_Filt_sim/BP_Filt_nativelink.tcl"]
set_global_assignment -library "lib_BP_Filt" -name MISC_FILE [file join $::quartus(sip_path) "BP_Filt_sim/BP_Filt_msim.tcl"]
set_global_assignment -library "lib_BP_Filt" -name MISC_FILE [file join $::quartus(sip_path) "BP_Filt_sim/BP_Filt_tb.vhd"]
set_global_assignment -library "lib_BP_Filt" -name MISC_FILE [file join $::quartus(sip_path) "BP_Filt_sim/BP_Filt_mlab.m"]
set_global_assignment -library "lib_BP_Filt" -name MISC_FILE [file join $::quartus(sip_path) "BP_Filt_sim/BP_Filt_model.m"]
set_global_assignment -library "lib_BP_Filt" -name MISC_FILE [file join $::quartus(sip_path) "BP_Filt_sim/BP_Filt_coef_int.txt"]
set_global_assignment -library "lib_BP_Filt" -name MISC_FILE [file join $::quartus(sip_path) "BP_Filt_sim/BP_Filt_input.txt"]
set_global_assignment -library "lib_BP_Filt" -name MISC_FILE [file join $::quartus(sip_path) "BP_Filt_sim/BP_Filt_param.txt"]
