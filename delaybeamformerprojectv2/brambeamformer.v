
module brambeamformer(
	input clk,
	input [10:0] readin_address,
	reg [10:0] sumout_address,
	input start,
	input readinen,
	input sumouten,
	output reg [11:0] output_value
);

	wire [11:0] inbramout_signal_raw;
	reg [15:0] sample_index=0;
	wire [11:0] beamformerout_signal;
	wire usedataflag;
	reg [10:0] out_signal_address=0;
	wire [11:0] outbramout_signal;
	
	signalram in_signalram(
		.address(in_signal_address),
		.clock(clk),
		.data(0),
		.rden(1),
		.wren(0),
		.q(inbramout_signal_raw)
	);

	delaybeamformer delaybeamformer_inst(
		.clk(clk),
		.input_value(inbramout_signal_raw),
		.input_index(sample_index),
		.start(start),
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


	always @(negedge usedataflag) begin
		if (start===1) begin
			out_signal_address=out_signal_address+1;
		end
	end

	//this potentially has the added benefit of the first sample index being 1 which matches MATLAB
	always @(posedge clk) begin
		if (start===1) begin
				sample_index = sample_index+1;
		end
	end

endmodule
