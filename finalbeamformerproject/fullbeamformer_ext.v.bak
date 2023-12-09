// Written by Owen Stuttard B00830020 and Abraham El-Jakl B00805351
`timescale 1ns / 1ps

module fullbeamformer_tb(
	input CLOCK_50,
	output tx
);

// When simulating, make sure to comment and uncomment the marked
//sections of code


    //for Simulation, comment
   wire clk;


    //for Simulation, uncomment
    // reg clk;
	// initial begin
	// 	clk <= 0;
	// 	forever #5 clk <= !clk;
	// end


    //for Simulation, include =1;
    // wire locked=1;
    wire locked;


	wire sumflag;


    reg [9:0] uartramaddress=0;
    reg [9:0] uartramaddress_buffer_1=0;
    reg [9:0] uartramaddress_buffer_2=0;
    reg uartram_wren=0;
    reg uartram_rden=0;
    wire [39:0] uartram_q;

    reg uart_stop=0;
    reg uart_start=0;
    reg [7:0] uart_msg=0;
    wire uart_flag;

    localparam processing=2'd0, storing=2'd1, readingout=2'd2, done=2'd3;
    reg [2:0] mode;
    reg [2:0] next_mode=processing;


    reg [2:0] uartcounter=3'd0;
    reg [2:0] sumcounter=3'd0;

    wire [39:0] summed_value;

    //for Simulation, comment
    mainpll mainpll_inst(
        .areset(1'b0),
        .inclk0(CLOCK_50),
        .c0(clk),
        .locked(locked)
    );


    fullbeamformer fullbeamformer_inst(
        .clk(clk),
        .locked(locked),
        .summed_value(summed_value),
        .sumflag(sumflag)
    );

    uartoutram uartoutram_inst(
        .address(uartramaddress),
        .clock(clk),
        .data(summed_value),
        .rden(uartram_rden),
        .wren(uartram_wren),
        .q(uartram_q)
    );

    communication uart(
        .CLOCK(clk),
        .START(uart_start),
        .STOP(uart_stop),
        .SW(uart_msg),
        .UART_TXD(tx),
        .TX_BUSY_REG(uart_flag)
    );


    always @(posedge clk) begin
        mode=next_mode;
        
        case(mode)
            processing: begin
                if (sumflag===1'b1) begin
                    uartram_wren=1;
                    next_mode=storing;
                end
            end
            storing: begin
                uartramaddress=uartramaddress_buffer_1;
                if (sumcounter===3'd1) begin
                    uartramaddress_buffer_1=uartramaddress_buffer_1+1;
                    sumcounter=3'd0;
                end else begin
                    sumcounter=sumcounter+3'd1;
                end
                if (sumflag===1'b0) begin
                    next_mode=readingout;
                    uartram_wren=0;
                    uartram_rden=1;
                    uartramaddress_buffer_1=0;
                    uartramaddress=0;
                end
            end
            readingout: begin
                uartramaddress=uartramaddress_buffer_2;
                if (uartramaddress===539) begin
                    next_mode=done;
                end
                case(uartcounter)
                    3'd0: begin
                        uart_msg=uartram_q[7:0];
                    end
                    3'd1: begin
                        uart_msg=uartram_q[15:8];
                    end                    
                    3'd2: begin
                        uart_msg=uartram_q[23:16];
                    end
                    3'd3: begin
                        uart_msg=uartram_q[31:24];
                    end
                    3'd4: begin
                        uart_msg=uartram_q[39:32];
                    end
                endcase
                uart_start=1;
                uart_stop=0;
            end
            done: begin
                uart_start=0;
                uart_stop=1;
                uartram_rden=0;
            end
        endcase
    end


    always @(negedge uart_flag) begin
        uartcounter=uartcounter+1;
        if (uartcounter===3'd5) begin
            uartcounter=0;
            uartramaddress_buffer_2=uartramaddress_buffer_2+1;
        end

    end





endmodule