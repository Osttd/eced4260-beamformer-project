module upsampler (
	input clk,
	input rst,
	input [15:0] data_in,
	input start,
	output valid_out,
	output [95:0] data_out);
	
	reg [1:0] err_in = 2'b00;
	wire [1:0] err_out;
	
	BP_filter filt (
		.clk(clk), .reset_n(rst), .ast_sink_data(data_in),
		.ast_sink_valid(start), .ast_sink_error(err_in),
		.ast_source_data(data_out), .ast_source_valid(valid_out),
		.ast_source_error(error_out)
	);
	
endmodule
	
	