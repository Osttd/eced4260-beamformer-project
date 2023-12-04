onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider tb
add wave -noupdate -label clk /brambeamformer_tb/clk
add wave -noupdate -label control_state -radix unsigned /brambeamformer_tb/control_state
add wave -noupdate -label slice_state /brambeamformer_tb/slice_state
add wave -noupdate -label signalinen /brambeamformer_tb/signalinen
add wave -noupdate -label signal_address -radix unsigned /brambeamformer_tb/signal_address
add wave -noupdate -label sample_index -radix unsigned /brambeamformer_tb/sample_index
add wave -noupdate -label rst /brambeamformer_tb/rst
add wave -noupdate -label valid_out /brambeamformer_tb/valid_out
add wave -noupdate -label usedataflag /brambeamformer_tb/usedataflag
add wave -noupdate -label sumouten /brambeamformer_tb/sumouten
add wave -noupdate -label sumout_address -radix unsigned /brambeamformer_tb/sumout_address
add wave -noupdate -label output_read_en /brambeamformer_tb/output_read_en
add wave -noupdate -label readin_address -radix unsigned /brambeamformer_tb/readin_address
add wave -noupdate -label output_value -radix decimal /brambeamformer_tb/output_value
add wave -noupdate -label finishfiltercounter -radix decimal /brambeamformer_tb/filterfinishcounter
add wave -noupdate -divider beamformer
add wave -noupdate -label data_in -radix decimal /brambeamformer_tb/brambeamformer_inst/data_in
add wave -noupdate -label buffer_out -radix decimal /brambeamformer_tb/brambeamformer_inst/buffer_out
add wave -noupdate -label filter_ram_out -radix decimal /brambeamformer_tb/brambeamformer_inst/filter_ram_out
add wave -noupdate -label beamformerout_signal -radix decimal /brambeamformer_tb/brambeamformer_inst/beamformerout_signal
add wave -noupdate -divider delaybeamformer
add wave -noupdate -label desiredindex -radix unsigned /brambeamformer_tb/brambeamformer_inst/delaybeamformer_inst/desiredindex
add wave -noupdate -label input_index -radix unsigned /brambeamformer_tb/brambeamformer_inst/delaybeamformer_inst/input_index
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6122950 ps} 0}
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
WaveRestoreZoom {6107964 ps} {6185449 ps}
