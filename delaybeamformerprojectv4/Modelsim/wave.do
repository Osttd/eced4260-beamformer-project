onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider tb
add wave -noupdate -label clk /FIR_Filter_tb/clk
add wave -noupdate -label rst /FIR_Filter_tb/rst
add wave -noupdate -label start /FIR_Filter_tb/start
add wave -noupdate -format Analog-Step -label data_out -max 7.0810999999999997e+39 -min -6.8288400000000006e+39 /FIR_Filter_tb/data_out
add wave -noupdate -label valid_out /FIR_Filter_tb/U1/valid_out
add wave -noupdate -label buffer_in /FIR_Filter_tb/U1/buffer_in
add wave -noupdate -label err_out /FIR_Filter_tb/U1/err_out
add wave -noupdate -label input_read /FIR_Filter_tb/U1/input_read
add wave -noupdate -label input_address -radix unsigned /FIR_Filter_tb/input_address
add wave -noupdate -label output_write_en /FIR_Filter_tb/output_write_en
add wave -noupdate -label output_read_en /FIR_Filter_tb/output_read_en
add wave -noupdate -label output_address -radix unsigned /FIR_Filter_tb/output_address
add wave -noupdate -label filter_ram_out /FIR_Filter_tb/filter_ram_out
add wave -noupdate -divider {fir filter}
add wave -noupdate -label data_in -radix decimal /FIR_Filter_tb/U1/data_in
add wave -noupdate -label buffer_out -radix decimal /FIR_Filter_tb/U1/buffer_out
add wave -noupdate -divider filter
add wave -noupdate -label input_data -radix decimal /FIR_Filter_tb/U1/filt/ast_sink_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3990000 ps} 0}
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
WaveRestoreZoom {3926390 ps} {4003875 ps}