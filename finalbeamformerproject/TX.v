// TX.v
// UART TX module code provided by Justin Greige
// Modified by Owen Stuttard B00830020 and Abraham El-Jakl B00805351
module TX (
	input CLK,
	input START,
	output BUSY,
	input [7:0] DATA,
	output reg TX_LINE);

	reg [15:0] PRSCL=0; // counter for baud rate of 9600
	reg [3:0] INDEX=0; // index to tell which bit in word has been send
	reg [9:0] DATAFLL=0; // data with stop bit
	reg TX_FLG=0;
	reg TX_reg=0;
	
	assign BUSY = TX_FLG; // minor optimization
	//negedge to catch the busy flag right in the controller
	always @(negedge CLK) begin
		if (!TX_FLG && START) begin //start transmit
			TX_FLG <= 1'b1;
			DATAFLL[0] <= 1'b0; //set start and stop bits
			DATAFLL[9] <= 1'b1;
			DATAFLL[8:1] <= DATA; //set data bits
		end
		//doubling prescalers from 5207 to 10414 and 2607 to 5214 to handle 100MHz
		if (TX_FLG) begin
			if (PRSCL < 16'd10414) begin // used to set baud rate 50M/5207 approx = 9600
												 // it is not exact which leads to the occasional erroneous bit
				PRSCL <= PRSCL + 16'd1;
			end else begin
				PRSCL <= 16'b0;
			end

			if (PRSCL === 16'd5214) begin //prepare data for transmit, allows for slack for data to latch
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