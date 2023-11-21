module BRAM (
	input rst,
	input clock,
	input load,
	input start,
	input [3:0] data_in,
	output [3:0] data_out);
	
	parameter [2:0] end_read = 7;
	reg [2:0] read_addr = 0;
	reg [2:0] write_addr = 0;
	reg rd_en = 0;
	reg wr_en = 0;
	
	DPBRAM flow (
		.clock(clock), .data(data_in), .rdaddress(read_addr),
		.rden(rd_en), .wraddress(write_addr),
		.wren(wr_en), .q(data_out));
		
		always @ (posedge clock) begin
			if (rst|(write_addr == end_read)) begin
				wr_en <= 0;
				write_addr <= 0;
			end else if (wr_en) begin
				write_addr <= write_addr +1;
			end else if (load) begin
				wr_en <= 1;
			end
			
			if (rst|(read_addr == end_read)) begin
				rd_en <= 0;
				read_addr <= 0;
			end else if (rd_en) begin
				read_addr <= read_addr +1;
			end else if (start) begin
				rd_en <= 1;
			end
			
		end
	
endmodule