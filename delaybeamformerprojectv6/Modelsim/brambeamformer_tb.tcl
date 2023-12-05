quit -sim
vlib work;
vlog ../*.v
vlog *.v
vsim -L altera_mf_ver -L lpm_ver -L cyclonev_ver -L 220model_ver work.brambeamformer_tb
do wave.do
run 2400 ns

