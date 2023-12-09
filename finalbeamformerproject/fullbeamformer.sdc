## Generated SDC file "fullbeamformer.sdc"

## Copyright (C) 2023  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 22.1std.2 Build 922 07/20/2023 SC Lite Edition"

## DATE    "Fri Dec  8 11:55:26 2023"

##
## DEVICE  "EP4CE115F29C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {mainpll_inst|altpll_component|auto_generated|pll1|clk[0]} -period 10.000 -waveform { 0.000 5.000 } 
create_clock -name {CLOCK_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK_50}]
create_clock -name {communication:uart|TX_BUSY_REG} -period 10.000 -waveform { 0.000 5.000 } 
create_clock -name {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good} -period 10.000 -waveform { 0.000 5.000 }  [get_registers {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}]
create_clock -name {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good} -period 10.000 -waveform { 0.000 5.000 }  [get_registers {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}]
create_clock -name {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good} -period 10.000 -waveform { 0.000 5.000 }  [get_registers {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}]
create_clock -name {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good} -period 10.000 -waveform { 0.000 5.000 }  [get_registers {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}]
create_clock -name {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good} -period 10.000 -waveform { 0.000 5.000 }  [get_registers {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}]
create_clock -name {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good} -period 10.000 -waveform { 0.000 5.000 }  [get_registers {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}]
create_clock -name {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good} -period 10.000 -waveform { 0.000 5.000 }  [get_registers {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}]
create_clock -name {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good} -period 10.000 -waveform { 0.000 5.000 }  [get_registers {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}] -rise_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}] -fall_to [get_clocks {CLOCK_50}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {CLOCK_50}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {CLOCK_50}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel8|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel7|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel5|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel6|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel2|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel4|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel1|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {fullbeamformer:fullbeamformer_inst|brambeamformer:channel3|delaybeamformer:delaybeamformer_inst|data_good}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {CLOCK_50}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {CLOCK_50}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

