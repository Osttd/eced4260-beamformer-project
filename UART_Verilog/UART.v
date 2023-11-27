module UART(
  input CLOCK_50,
  input [9:0] SW, //set transmit data
  input [3:0] KEY, // used to start transmission
  output reg [9:0] LEDR, // display received data
  output reg [7:0] LEDG, // display transmit data
  output UART_TXD, // transmit bit
  input UART_RXD); // recieve bit

	wire TX_BUSY; // used to prevent a transmit event during transmit stream
	wire [7:0] RX_DATA; // store recieved data
	reg TX_START;
	wire RX_BUSY; // used to prevent a receive event during receive stream

	// map components that handle transmit and receive
	TX C1 (
		.CLK(CLOCK_50),
		.START(TX_START),
		.BUSY(TX_BUSY),
		.DATA(SW[7:0]),
		.TX_LINE(UART_TXD));

	RX C2 (
		.CLK(CLOCK_50),
		.RX_LINE(UART_RXD),
		.DATA(RX_DATA),
		.BUSY(RX_BUSY));

	always @(posedge CLOCK_50) begin
		if (KEY[0] == 1'b0 && TX_BUSY == 1'b0) begin // on key press and while a stream isn't happening
			TX_START <= 1'b1; //start
			LEDG <= SW[7:0];
		end else begin
			TX_START <= 1'b0; //set back to zero when busy goes back to 0
		end
	end

	always @(negedge RX_BUSY) begin // set leds to received data
		LEDR[7:0] <= RX_DATA;
	end

endmodule
