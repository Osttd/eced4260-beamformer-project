
module brambeamformer(
	input clk,
	input [10:0] readin_address,
	input [10:0] sumout_address,
	input startbeamformer,
	input readinen,
	input sumouten,
	output [11:0] output_value,
	output usedataflag
);

	wire [11:0] inbramout_signal_raw;
	reg [15:0] sample_index=-1;//handle delay on the bram reading in
	wire [11:0] beamformerout_signal;

	
	signalram in_signalram(
		.address(readin_address),
		.clock(clk),
		.data(0),
		.rden(readinen),
		.wren(0),
		.q(inbramout_signal_raw)
	);

	delaybeamformer delaybeamformer_inst(
		.clk(clk),
		.input_value(inbramout_signal_raw),
		.input_index(sample_index),
		.startbeamformer(startbeamformer),
		.output_value(beamformerout_signal),
		.data_good(usedataflag)
	);

	signalram_nomem out_signalram(
		.address(sumout_address),
		.clock(clk),
		.data(beamformerout_signal),
		.rden(sumouten),
		.wren(usedataflag),
		.q(output_value)
	);


	always @(posedge clk) begin
		if (startbeamformer===1) begin
				sample_index = sample_index+1;
		end
	end

endmodule
