onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider tb
add wave -noupdate -label next_control_state -radix unsigned /fullbeamformer_tb/next_control_state
add wave -noupdate -label summed_value -radix decimal /fullbeamformer_tb/summed_value
add wave -noupdate -divider beamformer
add wave -noupdate -divider delaybeamformer
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {24330425 ps} 0}
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
WaveRestoreZoom {24314218 ps} {24391703 ps}
