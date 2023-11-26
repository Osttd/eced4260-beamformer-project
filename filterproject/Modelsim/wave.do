onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /FIR_Filter_tb/clk
add wave -noupdate /FIR_Filter_tb/clk2
add wave -noupdate /FIR_Filter_tb/rst
add wave -noupdate -format Analog-Step -height 74 -max 2048.0 -min -2048.0 /FIR_Filter_tb/data_in
add wave -noupdate /FIR_Filter_tb/start
add wave -noupdate -format Analog-Step -height 74 -max 1.6486999999999998e+30 -min -1.5899599999999999e+30 /FIR_Filter_tb/data_out
add wave -noupdate /FIR_Filter_tb/x
add wave -noupdate -format Analog-Step -height 74 -max 2048.0 -min -2048.0 /FIR_Filter_tb/y
add wave -noupdate /FIR_Filter_tb/data_cast
add wave -noupdate /FIR_Filter_tb/U1/valid_out
add wave -noupdate /FIR_Filter_tb/U1/buffer_in
add wave -noupdate /FIR_Filter_tb/U1/err_out
add wave -noupdate /FIR_Filter_tb/U1/filt/ast_source_error
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {70010000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 185
configure wave -valuecolwidth 476
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
WaveRestoreZoom {0 ps} {646487603 ps}
