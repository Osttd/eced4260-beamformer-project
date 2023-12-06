`timescale 1ns / 1ps

module brambeamformer_tb();

    reg clk;
    reg rst=0;
    reg start=0;
    reg [10:0] signal_address=0;
    reg [10:0] readin_address=0;
    reg [9:0] sumout_address=0;
    reg filter_bram_output_write_en=0;
    reg output_read_en=0;
    reg startbeamformer=0;
    reg signalinen=0;
    reg sumouten=0;
    reg [15:0] sample_index=-2;//handle delay on the bram reading in




    wire [31:0] output_value;
    wire usedataflag;
    wire valid_out;





	parameter slice_idle_delay=0, slice1=1, slice2=2, slice3=3;
    parameter loadin=0, filtering=1, finishfiltering=2, beamforming=3, summing=4, done=5;
    reg [2:0] control_state=loadin;
    reg [2:0] next_control_state=loadin;
    reg [1:0] slice_state=slice_idle_delay;
    reg [1:0] next_slice_state=slice_idle_delay;

    reg [3:0] filterfinishcounter=0;


    brambeamformer brambeamformer_inst(
    .clk(clk),
    .rst(rst),
    .start(start),
    .signal_address(signal_address),
    .readin_address(readin_address),
    .sumout_address(sumout_address),
    .filter_bram_output_write_en(filter_bram_output_write_en),
    .output_read_en(output_read_en),
    .startbeamformer(startbeamformer),
    .signalinen(signalinen),
    .sumouten(sumouten),
    .sample_index(sample_index),
    .slice_state(slice_state),
    .output_value(output_value),
    .usedataflag(usedataflag),
    .valid_out(valid_out)
    );

	initial begin
		clk <= 0;
		forever #1 clk <= !clk;
	end

	initial begin
        #20
        next_control_state<=loadin;
        #4
        next_control_state<=filtering;

		
        // #8030
        // next_control_state=summing;
        // forever #4 sumout_address <= sumout_address+1;

    end


    //This stuff will likely end up in the controller in the end




endmodule












