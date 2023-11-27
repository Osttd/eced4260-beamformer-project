


module brambeamformer(
	input clk,
	output reg [31:0] output_value,
	output reg data_good
);

	wire [31:0] bramout_signal
	reg [10:0] signal_address
	
	indexram indexram_inst( //takes 2 clk cycles to read out, with numtoread, total 3 cycles
	.address(signal_address),
	.clock(clk),
	.data(0),
	.rden(1),
	.wren(0),
	.q(desiredindex)
	);










endmodule
