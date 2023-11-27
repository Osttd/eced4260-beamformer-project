`timescale 1ns / 1ps

module delaybeamformer_tb();

    reg clk;
    reg [15:0] input_value;
    reg [15:0] input_index; 
    wire [15:0] output_value;
    wire data_good;

    delaybeamformer delaybeamformer_inst(
    .clk(clk),
    .input_value(input_value),
    .input_index(input_index),
    .output_value(output_value),
    .data_good(data_good)
    );

	initial begin
		clk <= 0;
		forever #1 clk <= !clk;
	end

	initial begin
        #20 //delay to allow memory to load initially
		input_value <= 0;
        input_index <= 0;
        fork
		    forever #2 input_value <= input_value+1;
            forever #2 input_index <= input_index+1;
        join
	end


endmodule












