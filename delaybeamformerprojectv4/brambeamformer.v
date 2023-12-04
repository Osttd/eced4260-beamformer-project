
module brambeamformer(
	input clk,
	input rst,
	input start,
	input [10:0] signal_address,
	input [10:0] readin_address,
	input [9:0] sumout_address,
	input filter_bram_output_write_en,
	input output_read_en,
	input startbeamformer,
	input signalinen,
	input sumouten,
	input [15:0] sample_index,
	input [1:0] slice_state,
	output [31:0] output_value,
	output usedataflag,
	output valid_out
);

	parameter slice_idle_delay=0, slice1=1, slice2=2, slice3=3;

	wire [15:0] inbramout_signal_raw;
	reg [31:0] inbramout_signal_buffer;
	//reg [15:0] sample_index=-1;//handle delay on the bram reading in
	wire [31:0] beamformerout_signal;

	reg [31:0] data_out;
	wire [95:0] filter_ram_out;
	
	reg [1:0] err_in = 2'b00;
	wire [15:0] data_in;
	wire [1:0] err_out;
	reg [15:0] buffer_in = 0;
	wire [95:0] buffer_out;


	signalram in_signalram(
		.address(signal_address),
		.clock(clk),
		.data(0),
		.rden(signalinen),
		.wren(0),
		.q(data_in)
	);


	BP_Filt filt (
		.clk(clk), .reset_n(rst), .ast_sink_data(data_in),
		.ast_sink_valid(start), .ast_sink_error(err_in),
		.ast_source_data(buffer_out), .ast_source_valid(valid_out),
		.ast_source_error(error_out)
	);
	
	output_ram outram (
		.address(readin_address),
		.clock(clk),
		.data(buffer_out),
		.rden(output_read_en),
		.wren(filter_bram_output_write_en),
		.q(filter_ram_out)
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
                        //inbramout_signal_buffer<=1;
                    end
                    slice1: begin
						inbramout_signal_buffer<=filter_ram_out[31:0];
                    end
                    slice2: begin
						inbramout_signal_buffer<=filter_ram_out[63:32];
                    end
                    slice3: begin
						inbramout_signal_buffer<=filter_ram_out[95:64];
                    end
				endcase
		end
	end


endmodule
