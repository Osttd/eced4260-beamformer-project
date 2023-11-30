`timescale 1ns / 1ps

module FIR_Filter_tb ();
	
	reg clk;
	reg rst=0;
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
		#50
		rst <= 1;
		input_read<=1;
		#10
		start<=1;
		fork
			forever #2 input_address<=input_address+1;
		join
		
		initial begin
		#50
		rst <= 1;
		output_read_en<=1;
		#10
		start<=1;
		fork
			forever #2 output_address<=output_address+1;
		join



	end
	
	initial begin


		#3000
		input_read<=0;
		rst=0;
	end
	
endmodule 