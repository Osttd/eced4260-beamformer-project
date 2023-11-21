module BRAM (
	input rst,
	input clock,
	input load,
	input start,
	input [3:0] data_in,
	input [2:0] read_addr,
	input [2:0] write_addr,
	output [3:0] data_out);
	
	parameter [2:0] end_read = 7;
	reg rd_en = 0;
	reg wr_en = 0;
	
	DPRAM dpram_inst (
		.clock(clock), .data(data_in), .rdaddress(read_addr),
		.rden(rd_en), .wraddress(write_addr),
		.wren(wr_en), .q(data_out));
		
		always @ (posedge clock) begin
			if (rst) begin
				rd_en <= 0;
				wr_en <= 0;
			end else if (load) begin
				wr_en <= 1;
			end else if (start) begin
				rd_en <= 1;
			end else begin
				rd_en <= 0;
				wr_en <= 0;
			end
		end
	
endmodule