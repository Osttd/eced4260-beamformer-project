onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label rst /BRAM_tb/rst
add wave -noupdate -label clock /BRAM_tb/clock
add wave -noupdate -label load /BRAM_tb/load
add wave -noupdate -label start /BRAM_tb/start
add wave -noupdate -label data_in /BRAM_tb/data_in
add wave -noupdate -label data_out /BRAM_tb/data_out
add wave -noupdate -label read_addr /BRAM_tb/UU1/read_addr
add wave -noupdate -label write_addr /BRAM_tb/UU1/write_addr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {551952 ps} 0} {{Cursor 2} {147119 ps} 0}
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
WaveRestoreZoom {530 ns} {624865 ps}
