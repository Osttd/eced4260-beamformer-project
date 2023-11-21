`timescale 1ns / 1ps

module FIR_Filter_tb ();
	
	reg clk;
	reg clk2;
	reg rst;
	reg [15:0] data_in;
	reg start = 0;
	wire [110:0] data_out;
	
	integer x = 0;
	real y = 0;
	reg [15:0] data_cast = 0;
	
	Filtering U1 (
	.clk(clk),
	.rst(rst),
	.data_in(data_in),
	.data_out(data_out));
	
	initial begin
		rst <= 1;
		data_in <= 8'b0000_0000;
	end
	
	initial begin
		clk <= 0;
		forever #10 clk <= !clk;
	end
	
	initial begin
		clk2 <= 0;
		forever #10000 clk2 <= !clk2;
	end
	
	initial begin
		forever @(posedge clk2) begin
			x <= x+1;	
			y <= $sin((3.1415926535)*(1/10.0)*x)*2048.0; //smaller number in sine = faster
			data_cast <= y;
		end
	end
	
	initial begin
		forever @(posedge clk) begin
			data_in <= data_cast;
		end
	end
	
	initial begin
		#1000 rst <= 0;
		#100 rst <= 1;
	end
	
endmodule 