`timescale 1ns / 1ps

module FIR_Filter_tb ();
	
	reg clk;
	reg rst=1;
	reg	[10:0]  input_address=0;
	reg input_read=0;
	reg start=0;
	reg output_write_en=0;
	reg output_read_en=0;
	reg	[10:0]  output_address=0;


	wire [92:0] data_out;
	wire valid_out;
	wire [92:0] filter_ram_out;
	
	FIR_Filter U1 (
	.clk(clk),
	.rst(rst),
	.input_address(input_address),
	.input_read(input_read),
	.start(start),
	.output_write_en(output_write_en),
	.output_read_en(output_read_en),
	.output_address(output_address),
	.data_out(data_out),
	.valid_out(valid_out),
	.filter_ram_out(filter_ram_out)
	);
	
	initial begin
		clk <= 0;
		forever #1 clk <= !clk;
	end
	
	
	initial begin
		#100 
		rst <= 1;
		input_read<=1;
		start<=1;
		fork
			forever #8 input_address<=input_address+1;
		join



	end
	
	initial begin
	end
	
endmodule 