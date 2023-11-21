`timescale 1ns / 1ps

module BRAM_tb ();

	reg rst;
	reg clock;
	reg load;
	reg start;
	reg [3:0] data_in;
	//reg [2:0] read_addr;
	//reg [2:0] write_addr;
	wire [3:0] data_out;
	
	BRAM UU1 (rst, clock, load, start, data_in,
		data_out);
	
	initial begin
		clock <= 0;
		forever #5 clock <= !clock;
	end
	
	initial begin
		data_in <= 4'b0000;
		forever #5 data_in <= data_in+1;
	end
	
	initial begin
		rst <= 1;
		start <= 0;
		load <= 0;
		
		#20 
		rst <= 0;
		#100
		load <= 1;
		#40
		load <= 0;
		#400
		start <= 1;
		#40
		start <= 0;
	end
	
endmodule
