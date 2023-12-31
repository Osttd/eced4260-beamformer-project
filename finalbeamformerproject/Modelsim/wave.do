onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider tb
add wave -noupdate -label clk /fullbeamformer_ext/clk
add wave -noupdate -format Analog-Step -height 74 -label summed_value -max 177439000.0 -min -165703000.0 -radix decimal /fullbeamformer_ext/summed_value
add wave -noupdate -label tx /fullbeamformer_ext/tx
add wave -noupdate -label uart_flag /fullbeamformer_ext/uart_flag
add wave -noupdate -label uartcounter -radix unsigned /fullbeamformer_ext/uartcounter
add wave -noupdate -label uartramaddress -radix unsigned /fullbeamformer_ext/uartramaddress
add wave -noupdate -label uart_msg -radix hexadecimal /fullbeamformer_ext/uart_msg
add wave -noupdate -label mode -radix unsigned /fullbeamformer_ext/mode
add wave -noupdate -divider beamformer
add wave -noupdate -label control_state -radix unsigned /fullbeamformer_ext/fullbeamformer_inst/control_state
add wave -noupdate -label signal_address -radix unsigned /fullbeamformer_ext/fullbeamformer_inst/signal_address
add wave -noupdate -label readin_address -radix unsigned /fullbeamformer_ext/fullbeamformer_inst/readin_address
add wave -noupdate -label sumouten /fullbeamformer_ext/fullbeamformer_inst/sumouten
add wave -noupdate -label sumout_address -radix unsigned /fullbeamformer_ext/fullbeamformer_inst/sumout_address
add wave -noupdate -label output_value_1 -radix decimal /fullbeamformer_ext/fullbeamformer_inst/output_value_1
add wave -noupdate -label output_value_2 -radix decimal /fullbeamformer_ext/fullbeamformer_inst/output_value_2
add wave -noupdate -label output_value_3 -radix decimal /fullbeamformer_ext/fullbeamformer_inst/output_value_3
add wave -noupdate -label output_value_4 -radix decimal /fullbeamformer_ext/fullbeamformer_inst/output_value_4
add wave -noupdate -label output_value_5 -radix decimal /fullbeamformer_ext/fullbeamformer_inst/output_value_5
add wave -noupdate -label output_value_6 -radix decimal /fullbeamformer_ext/fullbeamformer_inst/output_value_6
add wave -noupdate -label output_value_7 -radix decimal /fullbeamformer_ext/fullbeamformer_inst/output_value_7
add wave -noupdate -label output_value_8 -radix decimal /fullbeamformer_ext/fullbeamformer_inst/output_value_8
add wave -noupdate -divider channel1
add wave -noupdate -label data_in -radix decimal /fullbeamformer_ext/fullbeamformer_inst/channel1/data_in
add wave -noupdate -label buffer_out -radix decimal /fullbeamformer_ext/fullbeamformer_inst/channel1/buffer_out
add wave -noupdate -label sumout_address -radix unsigned /fullbeamformer_ext/fullbeamformer_inst/channel1/sumout_address
add wave -noupdate -label usedataflag /fullbeamformer_ext/fullbeamformer_inst/channel1/usedataflag
add wave -noupdate -label beamformerout_signal -radix decimal /fullbeamformer_ext/fullbeamformer_inst/channel1/beamformerout_signal
add wave -noupdate -label sumout_address_buffer -radix unsigned /fullbeamformer_ext/fullbeamformer_inst/channel1/sumout_address_buffer
add wave -noupdate -divider delaybeamformer1
add wave -noupdate -label input_index -radix unsigned /fullbeamformer_ext/fullbeamformer_inst/channel1/delaybeamformer_inst/input_index
add wave -noupdate -label desiredindex -radix unsigned /fullbeamformer_ext/fullbeamformer_inst/channel1/delaybeamformer_inst/desiredindex
add wave -noupdate -divider uart
add wave -noupdate -label PRSCL -radix unsigned -childformat {{{/fullbeamformer_ext/uart/C1/PRSCL[15]} -radix unsigned} {{/fullbeamformer_ext/uart/C1/PRSCL[14]} -radix unsigned} {{/fullbeamformer_ext/uart/C1/PRSCL[13]} -radix unsigned} {{/fullbeamformer_ext/uart/C1/PRSCL[12]} -radix unsigned} {{/fullbeamformer_ext/uart/C1/PRSCL[11]} -radix unsigned} {{/fullbeamformer_ext/uart/C1/PRSCL[10]} -radix unsigned} {{/fullbeamformer_ext/uart/C1/PRSCL[9]} -radix unsigned} {{/fullbeamformer_ext/uart/C1/PRSCL[8]} -radix unsigned} {{/fullbeamformer_ext/uart/C1/PRSCL[7]} -radix unsigned} {{/fullbeamformer_ext/uart/C1/PRSCL[6]} -radix unsigned} {{/fullbeamformer_ext/uart/C1/PRSCL[5]} -radix unsigned} {{/fullbeamformer_ext/uart/C1/PRSCL[4]} -radix unsigned} {{/fullbeamformer_ext/uart/C1/PRSCL[3]} -radix unsigned} {{/fullbeamformer_ext/uart/C1/PRSCL[2]} -radix unsigned} {{/fullbeamformer_ext/uart/C1/PRSCL[1]} -radix unsigned} {{/fullbeamformer_ext/uart/C1/PRSCL[0]} -radix unsigned}} -subitemconfig {{/fullbeamformer_ext/uart/C1/PRSCL[15]} {-height 15 -radix unsigned} {/fullbeamformer_ext/uart/C1/PRSCL[14]} {-height 15 -radix unsigned} {/fullbeamformer_ext/uart/C1/PRSCL[13]} {-height 15 -radix unsigned} {/fullbeamformer_ext/uart/C1/PRSCL[12]} {-height 15 -radix unsigned} {/fullbeamformer_ext/uart/C1/PRSCL[11]} {-height 15 -radix unsigned} {/fullbeamformer_ext/uart/C1/PRSCL[10]} {-height 15 -radix unsigned} {/fullbeamformer_ext/uart/C1/PRSCL[9]} {-height 15 -radix unsigned} {/fullbeamformer_ext/uart/C1/PRSCL[8]} {-height 15 -radix unsigned} {/fullbeamformer_ext/uart/C1/PRSCL[7]} {-height 15 -radix unsigned} {/fullbeamformer_ext/uart/C1/PRSCL[6]} {-height 15 -radix unsigned} {/fullbeamformer_ext/uart/C1/PRSCL[5]} {-height 15 -radix unsigned} {/fullbeamformer_ext/uart/C1/PRSCL[4]} {-height 15 -radix unsigned} {/fullbeamformer_ext/uart/C1/PRSCL[3]} {-height 15 -radix unsigned} {/fullbeamformer_ext/uart/C1/PRSCL[2]} {-height 15 -radix unsigned} {/fullbeamformer_ext/uart/C1/PRSCL[1]} {-height 15 -radix unsigned} {/fullbeamformer_ext/uart/C1/PRSCL[0]} {-height 15 -radix unsigned}} /fullbeamformer_ext/uart/C1/PRSCL
add wave -noupdate -label INDEX -radix unsigned /fullbeamformer_ext/uart/C1/INDEX
add wave -noupdate -label DATAFLL /fullbeamformer_ext/uart/C1/DATAFLL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {482242268 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 155
configure wave -valuecolwidth 60
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
WaveRestoreZoom {0 ps} {1417500 ns}
