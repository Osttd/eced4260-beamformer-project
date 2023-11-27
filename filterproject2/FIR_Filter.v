module FIR_Filter (
	input clk,
	input rst,
	input [15:0] data_in,
	output reg [110:0] data_out);
	
	reg [1:0] err_in = 2'b00;
	wire [1:0] err_out;
	reg start;
	wire valid_out;
	reg [15:0] buffer_in = 0;
	wire [110:0] buffer_out;
	
	BP_Filt filt (
		.clk(clk), .reset_n(rst), .ast_sink_data(data_in),
		.ast_sink_valid(start), .ast_sink_error(err_in),
		.ast_source_data(buffer_out), .ast_source_valid(valid_out),
		.ast_source_error(error_out)
	);
	
	
	
	
	
	always @ (posedge clk) begin
		if (data_in !== buffer_in) begin
			start <= 1;
		end else begin
			start <= 0;
		end
		
		if (valid_out) begin
			data_out <= buffer_out;
		end
		
		buffer_in <= data_in;
	end
endmodule 