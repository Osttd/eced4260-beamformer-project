onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider brambeamformer
add wave -noupdate -label clk /brambeamformer_tb/clk
add wave -noupdate -label control_state /brambeamformer_tb/control_state
add wave -noupdate -label readin_address -radix unsigned /brambeamformer_tb/readin_address
add wave -noupdate -label readinen /brambeamformer_tb/readinen
add wave -noupdate -label sample_index -radix unsigned /brambeamformer_tb/sample_index
add wave -noupdate -label startbeamformer /brambeamformer_tb/startbeamformer
add wave -noupdate -label sumouten /brambeamformer_tb/sumouten
add wave -noupdate -label sumout_address -radix unsigned /brambeamformer_tb/sumout_address
add wave -noupdate -label output_value -radix decimal /brambeamformer_tb/output_value
add wave -noupdate -label usedataflag /brambeamformer_tb/usedataflag
add wave -noupdate -divider beamformer
add wave -noupdate -label raw_in -radix decimal /brambeamformer_tb/brambeamformer_inst/inbramout_signal_raw
add wave -noupdate -label buffer_in -radix decimal /brambeamformer_tb/brambeamformer_inst/inbramout_signal_buffer
add wave -noupdate -label outbram_in -radix decimal /brambeamformer_tb/brambeamformer_inst/beamformerout_signal
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2000166 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 146
configure wave -valuecolwidth 100
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
WaveRestoreZoom {1987605 ps} {2032265 ps}
