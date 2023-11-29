module FIR_Filter (
	input clk,
	input rst,
	input	[10:0]  input_address;
	input input_read
	input start,
	input output_read,
	output reg [92:0] data_out
	output valid_out
	output filter_ram_out
	);
	
	reg [1:0] err_in = 2'b00;
	wire	[11:0] data_in;
	wire [1:0] err_out;
	reg [11:0] buffer_in = 0;
	wire [92:0] buffer_out;
	
	input_ram store (
		.address(input_address), .clock(clk), .data(0), .rden(input_read),
		.wden(0), .q(data_in)
	);
	
	BP_Filt filt (
		.clk(clk), .reset_n(rst), .ast_sink_data(data_in),
		.ast_sink_valid(start), .ast_sink_error(err_in),
		.ast_source_data(buffer_out), .ast_source_valid(valid_out),
		.ast_source_error(error_out)
	);
	
	output_ram store (
		.address(buffer_out), .clock(clk), .data(0), .rden(0),
		.wden(output_read), .q(filter_ram_out)
	);
	
	
	//State machine to control instead
	
	/*always @ (posedge clk) begin
		if (data_in !== buffer_in) begin
			start <= 1;
		end else begin
			start <= 0;
		end
		
		if (valid_out) begin
			data_out <= buffer_out;
		end
		
		buffer_in <= data_in;
	end/*
endmodule 