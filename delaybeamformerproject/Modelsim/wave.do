onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /delaybeamformer_tb/clk
add wave -noupdate -label input_value -radix unsigned /delaybeamformer_tb/input_value
add wave -noupdate -label input_index -radix unsigned /delaybeamformer_tb/input_index
add wave -noupdate -label data_good /delaybeamformer_tb/data_good
add wave -noupdate -label output_value -radix unsigned /delaybeamformer_tb/output_value
add wave -noupdate -divider delaybeamformer
add wave -noupdate -label indexnumtoread /delaybeamformer_tb/delaybeamformer_inst/indexnumtoread
add wave -noupdate -label desiredindex -radix unsigned /delaybeamformer_tb/delaybeamformer_inst/desiredindex
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9637 ps} 0}
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
WaveRestoreZoom {0 ps} {44660 ps}
