module TX (
	input CLK,
	input START,
	output BUSY,
	input [7:0] DATA,
	output reg TX_LINE);

	reg [12:0] PRSCL; // counter for baud rate of 9600
	reg [3:0] INDEX; // index to tell which bit in word has been send
	reg [9:0] DATAFLL; // data with stop bit
	reg TX_FLG;
	
	assign BUSY = TX_FLG; // minor optimization
	
	always @(posedge CLK) begin
		if (!TX_FLG && START) begin //start transmit
			TX_FLG <= 1'b1;
			DATAFLL[0] <= 1'b0; //set start and stop bits
			DATAFLL[9] <= 1'b1;
			DATAFLL[8:1] <= DATA; //set data bits
		end
  
		if (TX_FLG) begin
			if (PRSCL < 13'd5207) begin // used to set baud rate 50M/5207 approx = 9600
												 // it is not exact which leads to the occasional erroneous bit
				PRSCL <= PRSCL + 1;
			end else begin
				PRSCL <= 13'b0;
			end

			if (PRSCL == 13'd2607) begin //prepare data for transmit, allows for slack for data to latch
				TX_LINE <= DATAFLL[INDEX];
				if (INDEX < 4'd9) begin
					INDEX <= INDEX + 1;
				end else begin
					TX_FLG <= 1'b0;
					INDEX <= 4'b0;
				end
			end
		end
	end
	
endmodule 