`timescale 1ns / 1ps

module brambeamformer_tb();

    reg clk;
    reg [10:0] readin_address=0;
    reg [10:0] sumout_address=0;
    reg start=0;
    reg readinen=1;
    reg sumouten=0;

    wire [11:0] output_value;

    brambeamformer delaybeamformer_inst(
    .clk(clk),
    .in_signal_address(input_address),
    .start(start),
    .output_value(output_value)
    );

	initial begin
		clk <= 0;
		forever #1 clk <= !clk;
	end

	initial begin
        #20 //delay to allow memory to load initially
		start <= 1;
        fork
		    forever #10 input_address <= input_address+1;
        join
	end


endmodule












