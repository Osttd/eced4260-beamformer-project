
module brambeamformer(
	input clk,
	input [10:0] readin_address,
	input [10:0] sumout_address,
	input startbeamformer,
	input readinen,
	input sumouten,
	input [15:0] sample_index,
	input [1:0] slice_state,
	output [11:0] output_value,
	output usedataflag
);

	parameter slice_idle_delay=0, slice1=1, slice2=2, slice3=3;

	wire [11:0] inbramout_signal_raw;
	reg [11:0] inbramout_signal_buffer;
	//reg [15:0] sample_index=-1;//handle delay on the bram reading in
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
		.input_value(inbramout_signal_buffer),
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

	//check the delays on this
	always @(negedge clk) begin
		if (startbeamformer===1) begin
				case(slice_state)
                    slice_idle_delay: begin
                        inbramout_signal_buffer<=1;
                    end
                    slice1: begin
						inbramout_signal_buffer<=inbramout_signal_raw[30:0];
                    end
                    slice2: begin
						inbramout_signal_buffer<=inbramout_signal_raw[61:31];
                    end
                    slice3: begin
						inbramout_signal_buffer<=inbramout_signal_raw[92:62];
                    end
				endcase
		end
	end


endmodule
