


module brambeamformer(
	input clk,
	output reg [31:0] output_value,
	output reg data_good
);

	wire [31:0] bramout_signal;
	reg [10:0] signal_address;
	reg [15:0] sample_index;
	
	signalram in_signalram(
		.address(signal_address),
		.clock(clk),
		.data(0),
		.rden(1),
		.wren(0),
		.q(bramout_signal)
	);

	delaybeamformer delaybeamformer_inst(
		.clk(clk),
		.input_value(bramout_signal),
		input_index,
		output_value,
		data_good
	
	
	
	)









endmodule
