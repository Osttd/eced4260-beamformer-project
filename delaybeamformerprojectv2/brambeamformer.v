
module brambeamformer(
	input clk,
	input [10:0] in_signal_address,
	output reg [31:0] output_value,
	output reg data_good
);

	wire [31:0] inbramout_signal;
	reg [15:0] sample_index;
	wire [31:0] beamformerout_signal;
	wire usedataflag;
	reg [10:0] out_signal_address;
	wire [31:0] outbramout_signal;
	
	signalram in_signalram(
		.address(in_signal_address),
		.clock(clk),
		.data(0),
		.rden(1),
		.wren(0),
		.q(inbramout_signal)
	);

	delaybeamformer delaybeamformer_inst(
		.clk(clk),
		.input_value(inbramout_signal),
		.input_index(sample_index),
		.output_value(beamformerout_signal),
		.data_good(usedataflag)
	);

	signalram_nomem out_signalram(
		.address(out_signal_address),
		.clock(clk),
		.data(beamformerout_signal),
		.rden(0),
		.wren(usedataflag),
		.q(outbramout_signal)
	);







endmodule
