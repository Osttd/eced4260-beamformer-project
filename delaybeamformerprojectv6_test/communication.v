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
	wire [31:0] TX_DATA;
	reg TX_START;
	reg [31:0] DATA_BUFF = 0;
	reg [11:0] rd_addr = 0;
	reg [11:0] wr_addr = 0;
	reg [11:0] wr_addr_2 = 0;
	wire rd_en;
	reg TX_BUSY_BUFF;
	//reg [1:0] RX_STATE = 0;
	reg [3:0] TX_STATE = 0;
	reg START_EN;
	wire [31:0] out_w;
	reg [31:0] out_r;
	wire [31:0] out_w_2;
	reg [31:0] out_r_2;
	reg rd_en_2;
	wire [31:0] DATA_BUFF_1;
	// map components that handle transmit and receive
	TX C1 (
		.CLK(CLOCK),
		.START(START),
		.BUSY(TX_BUSY),
		.DATA(SW[7:0]),
		.TX_LINE(UART_TXD));

	RX C2 (
		.CLK(CLOCK),
		.RX_LINE(UART_RXD),
		.DATA(RX_DATA),
		.BUSY(RX_BUSY));
		
	DPRAM R1 (
		.clock(CLOCK),
		.data(DATA_BUFF),
		.rdaddress(rd_addr),
		.rden(rd_en),
		.wraddress(wr_addr),
		.wren(wr_en),
		.q(DATA_BUFF_1[15:0]));
		
	OPRAM R2 (
		.address(wr_addr),
		.clock(CLOCK),
		.data(DATA_BUFF),
		.wren(rd_en),
		.q(out_w));
		
//	RAMCHECK R3 (
//		.address(wr_addr_2),
//		.clock(CLOCK),
//		.data(DATA_BUFF_3),
//		.wren(rd_en_2),
//		.q(LEDR));
	
	//TX
	
	assign wr_en = (!TX_BUSY & START_EN);
	
	always @(posedge CLOCK) begin
		TX_BUSY_REG<=TX_BUSY;
		if (TX_BUSY == 1'b0) begin // on key press and while a stream isn't happening
			
			TX_START <= 1'b1; //start
			out_r <= out_w;
			TX_BUSY_BUFF <= TX_BUSY;
			
			if (TX_BUSY_BUFF & !TX_BUSY) begin
				
				if(wr_addr == 767) begin
					TX_START <= 0;
					wr_addr <= 0;
				end else if (TX_STATE == 0) begin
					DATA_BUFF[7:0] <= TX_DATA;
					TX_STATE <= TX_STATE + 1;
				end else if (TX_STATE == 1) begin
					DATA_BUFF[15:8] <= TX_DATA[7:0];
					TX_STATE <= TX_STATE + 1;
				end else if (TX_STATE == 2 ) begin
					DATA_BUFF[23:16] <= TX_DATA[7:0];
					TX_STATE <= TX_STATE + 1;
				end else if (TX_STATE == 3) begin
					DATA_BUFF[31:24] <= TX_DATA[7:0];
					TX_STATE <= TX_STATE + 1;
					wr_addr <= wr_addr + 1;
				end
			end
		end
			
		
			if (START) begin
				START_EN <= 1;
			end else if (STOP) begin
				START_EN <= 0;
				rd_addr <= 0;
				wr_addr <= 0;
			end else begin
				TX_START <= 1'b0; //set back to zero when busy goes back to 0
			end
		end
	
endmodule 