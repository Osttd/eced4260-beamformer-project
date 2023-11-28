onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /brambeamformer_tb/clk
add wave -noupdate -label output_value -radix decimal /brambeamformer_tb/output_value
add wave -noupdate -label sumout_address -radix unsigned /brambeamformer_tb/sumout_address
add wave -noupdate -label readin_address -radix unsigned /brambeamformer_tb/readin_address
add wave -noupdate -label readinen /brambeamformer_tb/readinen
add wave -noupdate -label sumouten /brambeamformer_tb/sumouten
add wave -noupdate -divider brambeamformer
add wave -noupdate -label sample_index -radix unsigned /brambeamformer_tb/delaybeamformer_inst/sample_index
add wave -noupdate -label usedataflag /brambeamformer_tb/delaybeamformer_inst/usedataflag
add wave -noupdate -label beamformerout_signal -radix decimal /brambeamformer_tb/delaybeamformer_inst/beamformerout_signal
add wave -noupdate -label in_buffer -radix decimal /brambeamformer_tb/delaybeamformer_inst/inbramout_signal_raw
add wave -noupdate -divider beamformer
add wave -noupdate -label desiredindex /brambeamformer_tb/delaybeamformer_inst/delaybeamformer_inst/desiredindex
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {668899 ps} 0}
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
WaveRestoreZoom {657573 ps} {702233 ps}
