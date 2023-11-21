`timescale 1ns / 1ps

module BRAM_tb ();

	reg rst;
	reg clock;
	reg load;
	reg start;
	reg [3:0] data_in;
	reg [2:0] read_addr;
	reg [2:0] write_addr;
	wire [3:0] data_out;
	
	BRAM UU1 (rst, clock, load, start, data_in,
		read_addr, write_addr, data_out);
	
	initial begin
		clock <= 0;
		forever #5 clock <= !clock;
	end
	
	initial begin
		rst <= 1;
		start <= 0;
		load <= 0;
		data_in <= 0;
		read_addr <= 0;
		write_addr <= 0;
		
		#20 
		rst <= 0;
		#100
		read_addr <= 010;
		write_addr <= 110;
		data_in <= 0101;
		#20
		load <= 1;
		#10
		load <= 0;
		start <= 1;
		#10
		start <= 0;
		#20
		read_addr <= 110;
		write_addr <= 001;
		data_in <= 1010;
		#20
		load <= 1;
		#10
		load <= 0;
		#20
		read_addr <= 001;
		#20
		start <= 1;
		#20
		start <= 0;
	end
	
endmodule
