quit -sim
#vlib work;
#vlog ../*.v
#vlog *.v
#vsim work.Upsampler_tb -Lf 220model_ver -Lf alterra_mf_ver -Lf verilog
#vsim -L altera_mf_ver -L lpm_ver -L cyclonev_ver -L 220model_ver -L sgate -L altera_lnsim -L twentynm work.Upsampler_tb

# Compile all required simulation library files

transcript on
write transcript BP_filter_transcript

# START MEGAWIZARD INSERT VARIABLES
set top_entity BP_Filt
set sim_entity fullbeamformer
set timing_resolution "1ps"
set core_version 22.1
set device_family "Cyclone IV"
set quartus_rootdir D:/intelFPGA_lite/22.1std/quartus/
set projectpath "D:/DDal/5th Year Fall (2023)/ECED4260/project/git/eced4260-beamformer-project/delaybeamformerprojectv6"
# Change to "gate_level" for gate-level sim
set sim_type "rtl"
# END MEGAWIZARD INSERT VARIABLES
	
	set q_sim_lib [file join $quartus_rootdir eda sim_lib]
	
	 quit -sim

if {[file exists [file join simulation modelsim ${top_entity}.vo]] && [string match "gate_level" $sim_type]} {
    puts "Info: Gate Level ${top_entity}.vo found"
    set language_ext "vo"
    set use_ipfs 1
    set flow "gate_level"
} elseif {[file exists [file join simulation modelsim ${top_entity}.vho]] && [string match "gate_level" $sim_type]} {
    puts "Info: Gate Level ${top_entity}.vho found"
    set language_ext "vho"
    set use_ipfs 1
    set flow "gate_level"
} else {
    puts "Info: RTL simulation."
    set use_ipfs 0
    set flow "rtl"
}

if {[string match $flow "gate_level"] } {
    file copy ${top_entity}_input.txt simulation/modelsim
    cd simulation/modelsim
}

regsub {[ ]+} $device_family "" temp_device_family
regsub {[ ]+} $temp_device_family "" temp_device_family2
set device_lib_name [string tolower $temp_device_family2]

set libs [list \
    $device_lib_name \
    altera \
    work]

foreach {lib} $libs {
    if {[file exist $lib]} {
        catch {eval "file delete -force -- $lib"} fid
        puts "file delete command returned $fid\n"
    }
    if {[file exist $lib] == 0} 	{
        vlib $lib
        vmap $lib $lib
    }
}

	 

    set quartus_libs [list \
        altera_mf    {altera_mf_components altera_mf} {} {} "$q_sim_lib" \
        lpm          {220pack 220model}               {220model} {}  "$q_sim_lib" \
        sgate        {sgate_pack sgate}               {sgate} {}     "$q_sim_lib" \
        altera_lnsim {altera_lnsim_components}     {}   {mentor/altera_lnsim_for_vhdl} "$q_sim_lib" \
        fiftyfivenm_atoms        {fiftyfivenm_atoms fiftyfivenm_components}               {} {}     "$q_sim_lib" \
		  cyclonev_atoms        {cyclonev_atoms cyclonev_components}               {} {}     "$q_sim_lib" \
    ]
	foreach {lib file_vhdl_list file_verilog_list file_sysverilog_list src_files_loc} $quartus_libs {
        if {[file exist $lib]} {
            catch {eval "file delete -force -- $lib"} fid
            puts "file delete command returned $fid\n"
        }
        if {[file exist $lib] == 0} 	{
            vlib $lib
            vmap $lib $lib
        }
		foreach file_item $file_vhdl_list {
		  catch {vcom -quiet -explicit -93 -work $lib [file join $src_files_loc ${file_item}.vhd]} err_msg
		  if {![string match "" $err_msg]} {return $err_msg}
		}
		foreach file_item $file_verilog_list {
		  catch {vlog -work $lib [file join $src_files_loc ${file_item}.v]} err_msg
		  if {![string match "" $err_msg]} {return $err_msg}
		}
		foreach file_item $file_sysverilog_list {
		  catch {vlog -work $lib [file join $src_files_loc ${file_item}.sv]} err_msg
		  if {![string match "" $err_msg]} {return $err_msg}
		}
	}

	vcom -93 -work altera $q_sim_lib/altera_primitives_components.vhd
	vcom -93 -work altera $q_sim_lib/altera_primitives.vhd

    # Compile all FIR Compiler II RTL files
    #vlog -work work C:/Users/julie/Desktop/Work/Year5/ICDesign/Project/Quartus/Individual_components/UPsampler/Modelsim/altera_avalon_sc_fifo.v
    #vcom -work work C:/Users/julie/Desktop/Work/Year5/ICDesign/Project/Quartus/Individual_components/UPsampler/Modelsim/dspba_library_package.vhd
    #vcom -work work C:/Users/julie/Desktop/Work/Year5/ICDesign/Project/Quartus/Individual_components/UPsampler/Modelsim/dspba_library.vhd
    #vcom -work work C:/Users/julie/Desktop/Work/Year5/ICDesign/Project/Quartus/Individual_components/UPsampler/Modelsim/auk_dspip_roundsat_hpfir.vhd
    #vcom -work work C:/Users/julie/Desktop/Work/Year5/ICDesign/Project/Quartus/Individual_components/UPsampler/Modelsim/auk_dspip_math_pkg_hpfir.vhd
    #vcom -work work C:/Users/julie/Desktop/Work/Year5/ICDesign/Project/Quartus/Individual_components/UPsampler/Modelsim/auk_dspip_lib_pkg_hpfir.vhd
    #vcom -work work C:/Users/julie/Desktop/Work/Year5/ICDesign/Project/Quartus/Individual_components/UPsampler/Modelsim/auk_dspip_avalon_streaming_controller_hpfir.vhd
    #vcom -work work C:/Users/julie/Desktop/Work/Year5/ICDesign/Project/Quartus/Individual_components/UPsampler/Modelsim/auk_dspip_avalon_streaming_sink_hpfir.vhd
    #vcom -work work C:/Users/julie/Desktop/Work/Year5/ICDesign/Project/Quartus/Individual_components/UPsampler/Modelsim/auk_dspip_avalon_streaming_source_hpfir.vhd
	
	#set file_list [glob ${top_entity}_0002_ast*.vhd]
	#foreach cur_file $file_list {
	#	vcom -work work $cur_file 
	#}
	
	#vcom -work work ${top_entity}_0002.vhd
	#vcom -work work ${top_entity}_0002_ast.vhd
	#vsim -work work ${sim_entity}.v

    #vsim -work work ${sim_entity}_tb.v



vlib work;
vlog ../*.v
vlog *.v

vlog -work work "${projectpath}/Modelsim/altera_avalon_sc_fifo.v"

vcom -work work "${projectpath}/Modelsim/dspba_library_package.vhd"
vcom -work work "${projectpath}/Modelsim/dspba_library.vhd"

vcom -work work "${projectpath}/Modelsim/auk_dspip_roundsat_hpfir.vhd"
vcom -work work "${projectpath}/Modelsim/auk_dspip_math_pkg_hpfir.vhd"
vcom -work work "${projectpath}/Modelsim/auk_dspip_lib_pkg_hpfir.vhd"

vcom -work work "${projectpath}/Modelsim/auk_dspip_avalon_streaming_controller_hpfir.vhd"
vcom -work work "${projectpath}/Modelsim/auk_dspip_avalon_streaming_sink_hpfir.vhd"
vcom -work work "${projectpath}/Modelsim/auk_dspip_avalon_streaming_source_hpfir.vhd"


vlog -work work "${projectpath}/FIR_Filter.v"
vcom -work work "${projectpath}/Modelsim/BP_filt_0002.vhd"
vcom -work work "${projectpath}/Modelsim/BP_filt_0002_ast.vhd"
vcom -work work "${projectpath}/Modelsim/BP_filt_0002_rtl_core.vhd"

vsim -L altera_mf_ver -L lpm_ver -L cycloneiv_ver -L 220model_ver -L sgate -L altera_lnsim -L twentynm work.${sim_entity}_ext 


if {[file exists "wave.do"]} {
    do wave.do
}

# Start simulation silently

set StdArithNoWarnings 1
run 150 us


