quit -sim
vlib work;
vlog ../*.v
vlog *.v
#vsim work.BRAM_tb -Lf 220model_ver -Lf alterra_mf_ver -Lf verilog
vsim -L altera_mf_ver -L lpm_ver -L cyclonev_ver -L 220model_ver work.BRAM_tb
do wave.do
run 400 ns

# Start simulation silently

#set StdArithNoWarnings 1
#run 0 ns
#set StdArithNoWarnings 0
#catch {run -all} run_msg
#puts $run_msg
