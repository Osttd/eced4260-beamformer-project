module RX (
	input CLK,
	input RX_LINE,
	output reg [7:0] DATA,
	output BUSY);
	
	reg [12:0] PRSCL = 0; // counter for baud rate of 9600
	reg [3:0] INDEX = 0; // index to tell which bit in word has been received
	reg [9:0] DATAFLL; // data with stop bit
	reg RX_FLG = 0;
	
	assign BUSY = RX_FLG; // minor optimization
	
	always @(posedge CLK) begin
		if (!RX_FLG && RX_LINE == 1'b0) begin //tell fpga when data is present on RX line
			INDEX <= 4'b0;
			PRSCL <= 13'b0;
			RX_FLG <= 1'b1;
		end
		
		if (RX_FLG) begin
			DATAFLL[INDEX] <= RX_LINE;
			if (PRSCL < 13'd5207) begin // used to set baud rate 50M/5207 approx = 9600
												 // it is not exact which leads to the occasional erroneous bit
				PRSCL <= PRSCL + 1;
			end else begin
				PRSCL <= 13'b0;
			end
			
			if (PRSCL == 13'd2500) begin //prepare data for transmit, allows for slack for data to latch
												  // needs more slack than transmit
				if (INDEX < 4'd9) begin
					INDEX <= INDEX + 1;
				end else begin
					if (DATAFLL[0] == 1'b0 && DATAFLL[9] == 1'b1) begin //recieve data based on start bit
						DATA <= DATAFLL[8:1];
					end else begin
						DATA <= 8'b0; // otherwise clear data register
					end
					RX_FLG <= 1'b0;
				end
			end
		end
	end
endmodule