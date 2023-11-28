

module delaybeamformer(
	input clk,
	input [11:0] input_value,
	input [15:0] input_index, //modify this to be counted in the module based on input value changing?
	input start,
	output reg [11:0] output_value,
	output reg data_good
);

	reg [9:0] indexnumtoread = 0;
	wire [15:0] desiredindex;
	//reg [15:0] desiredindexbuffer;
	
	indexram indexram_inst( //takes 2 clk cycles to read out, with numtoread, total 3 cycles
	.address(indexnumtoread),
	.clock(clk),
	.data(0),
	.rden(1),
	.wren(0),
	.q(desiredindex)
	);

	always @(posedge clk) begin
		if (start===1) begin
			if (input_index === desiredindex) begin
				data_good=1;
				indexnumtoread=indexnumtoread+1;
			end else begin
				data_good=0;
			end
		end
		output_value=input_value;
	end

	
endmodule
