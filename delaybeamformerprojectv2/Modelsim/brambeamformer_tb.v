`timescale 1ns / 1ps

module brambeamformer_tb();

    reg clk;
    reg [10:0] readin_address=0;
    reg [10:0] sumout_address=0;
    reg startbeamformer=0;
    reg readinen=1;
    reg sumouten=0;

    wire [11:0] output_value;
    wire usedataflag;

    brambeamformer delaybeamformer_inst(
    .clk(clk),
    .readin_address(readin_address),
    .sumout_address(sumout_address),
    .startbeamformer(startbeamformer),
    .readinen(readinen),
    .sumouten(sumouten),
    .output_value(output_value),
    .usedataflag(usedataflag)
    );

	initial begin
		clk <= 0;
		forever #1 clk <= !clk;
	end

	initial begin
        #20 //delay to allow memory to load initially
		startbeamformer <= 1;
        fork
		    forever #2 readin_address <= readin_address+1;
        join
	end
    initial begin
        #630
        readinen=0;
        startbeamformer=0;
        sumouten=1;
        sumout_address=0;
        forever #4 sumout_address <= sumout_address+1;

    end

    always @(negedge usedataflag) begin
        if (startbeamformer===1) begin
            sumout_address=sumout_address+1;
        end
    end



endmodule












