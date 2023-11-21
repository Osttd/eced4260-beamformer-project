onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Filtering_tb/clk
add wave -noupdate /Filtering_tb/clk2
add wave -noupdate /Filtering_tb/rst
add wave -noupdate -format Analog-Step -height 74 -max 499.99999999999994 -min -500.0 /Filtering_tb/data_in
add wave -noupdate /Filtering_tb/start
add wave -noupdate -format Analog-Step -height 74 -max 600000.0 -min -600000.0 /Filtering_tb/data_out
add wave -noupdate /Filtering_tb/x
add wave -noupdate /Filtering_tb/y
add wave -noupdate /Filtering_tb/data_cast
add wave -noupdate /Filtering_tb/U1/valid_out
add wave -noupdate /Filtering_tb/U1/buffer_in
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {371370000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {160247494 ps} {1650247494 ps}
