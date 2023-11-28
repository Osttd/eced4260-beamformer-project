onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /brambeamformer_tb/clk
add wave -noupdate -label start /brambeamformer_tb/start
add wave -noupdate -label input_address /brambeamformer_tb/input_address
add wave -noupdate -label output_value /brambeamformer_tb/output_value
add wave -noupdate -divider brambeamformer
add wave -noupdate -label sample_index /brambeamformer_tb/delaybeamformer_inst/sample_index
add wave -noupdate -label usedataflag /brambeamformer_tb/delaybeamformer_inst/usedataflag
add wave -noupdate -label beamformerout_signal /brambeamformer_tb/delaybeamformer_inst/beamformerout_signal
add wave -noupdate -label in_buffer /brambeamformer_tb/delaybeamformer_inst/inbramout_signal_raw
add wave -noupdate -label in_raw /brambeamformer_tb/delaybeamformer_inst/inbramout_signal_buffer
add wave -noupdate -divider beamformer
add wave -noupdate -label desiredindex /brambeamformer_tb/delaybeamformer_inst/delaybeamformer_inst/desiredindex
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {455102 ps} 0}
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
WaveRestoreZoom {445017 ps} {489677 ps}
