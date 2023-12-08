// Written by Owen Stuttard B00830020 and Abraham El-Jakl B00805351
module delaybeamformer(
	input clk,
	input [31:0] input_value,
	input [15:0] input_index, 
	input startbeamformer,
	output reg [31:0] output_value,
	output reg data_good
);

	reg [9:0] indexnumtoread = 0;
	wire [15:0] desiredindex;
	reg [15:0] last_input_index;

	//takes 2 clk cycles to read out, with numtoread, total 3 cycles
	indexrom indexram_inst(  
	.address(indexnumtoread),
	.clock(clk),
	.rden(1'b1),
	.q(desiredindex)
	)/* synthesis keep */;

	always @(posedge clk) begin
		if (startbeamformer===1) begin
			if (input_index === desiredindex) begin
				if (input_index !== last_input_index) begin
					data_good=1;
					indexnumtoread=indexnumtoread+10'd1;
				end
			end else begin
				data_good=0;
			end
		end else begin
			data_good=0;
		end
		output_value=input_value;
		last_input_index=input_index;
	end

	
endmodule
