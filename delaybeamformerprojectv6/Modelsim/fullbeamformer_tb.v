`timescale 1ns / 1ps

module fullbeamformer_tb();


    reg clk;

    parameter loadin=0, filtering=1, finishfiltering=2, beamforming=3, summing=4, done=5;

    wire [35:0] summed_value;


    fullbeamformer fullbeamformer_inst(
        .clk(clk),
        .summed_value(summed_value)

    );

	initial begin
		clk <= 0;
		forever #1 clk <= !clk;
	end





endmodule