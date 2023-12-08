//Communication module code provided by Justin Greige
// Heavily modified by Owen Stuttard B00830020 and Abraham El-Jakl B00805351

module communication (
	input CLOCK,
	input START,
	input STOP,
	input [7:0] SW, //set transmit data
	output UART_TXD, // transmit bit
	output reg TX_BUSY_REG
);
	
	//set up wires and registers
	wire TX_BUSY; // used to prevent a transmit event during transmit stream
	//component that handle transmit
	TX C1 (
		.CLK(CLOCK),
		.START(START),
		.BUSY(TX_BUSY),
		.DATA(SW[7:0]),
		.TX_LINE(UART_TXD));
	
	always @(posedge CLOCK) begin
		TX_BUSY_REG<=TX_BUSY;
	end
	
endmodule 