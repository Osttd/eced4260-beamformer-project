onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider tb
add wave -noupdate -label clk /fullbeamformer_tb/clk
add wave -noupdate -label next_control_state -radix unsigned /fullbeamformer_tb/next_control_state
add wave -noupdate -format Analog-Step -height 74 -label summed_value -max 177439166.00000003 -min -165703252.0 -radix decimal /fullbeamformer_tb/summed_value
add wave -noupdate -divider beamformer
add wave -noupdate -label control_state -radix unsigned /fullbeamformer_tb/fullbeamformer_inst/control_state
add wave -noupdate -label signal_address -radix unsigned /fullbeamformer_tb/fullbeamformer_inst/signal_address
add wave -noupdate -label readin_address -radix unsigned /fullbeamformer_tb/fullbeamformer_inst/readin_address
add wave -noupdate -label sumouten /fullbeamformer_tb/fullbeamformer_inst/sumouten
add wave -noupdate -label sumout_address -radix unsigned /fullbeamformer_tb/fullbeamformer_inst/sumout_address
add wave -noupdate -label output_value_1 -radix decimal /fullbeamformer_tb/fullbeamformer_inst/output_value_1
add wave -noupdate -label output_value_2 -radix decimal /fullbeamformer_tb/fullbeamformer_inst/output_value_2
add wave -noupdate -label output_value_3 -radix decimal /fullbeamformer_tb/fullbeamformer_inst/output_value_3
add wave -noupdate -label output_value_4 -radix decimal /fullbeamformer_tb/fullbeamformer_inst/output_value_4
add wave -noupdate -label output_value_5 -radix decimal /fullbeamformer_tb/fullbeamformer_inst/output_value_5
add wave -noupdate -label output_value_6 -radix decimal /fullbeamformer_tb/fullbeamformer_inst/output_value_6
add wave -noupdate -label output_value_7 -radix decimal /fullbeamformer_tb/fullbeamformer_inst/output_value_7
add wave -noupdate -label output_value_8 -radix decimal /fullbeamformer_tb/fullbeamformer_inst/output_value_8
add wave -noupdate -divider channel1
add wave -noupdate -label data_in -radix decimal /fullbeamformer_tb/fullbeamformer_inst/channel1/data_in
add wave -noupdate -label buffer_out -radix decimal /fullbeamformer_tb/fullbeamformer_inst/channel1/buffer_out
add wave -noupdate -label sumout_address -radix unsigned /fullbeamformer_tb/fullbeamformer_inst/channel1/sumout_address
add wave -noupdate -label usedataflag /fullbeamformer_tb/fullbeamformer_inst/channel1/usedataflag
add wave -noupdate -label beamformerout_signal -radix decimal /fullbeamformer_tb/fullbeamformer_inst/channel1/beamformerout_signal
add wave -noupdate -label sumout_address_buffer -radix unsigned /fullbeamformer_tb/fullbeamformer_inst/channel1/sumout_address_buffer
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {54383 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 155
configure wave -valuecolwidth 123
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {186112 ps}
