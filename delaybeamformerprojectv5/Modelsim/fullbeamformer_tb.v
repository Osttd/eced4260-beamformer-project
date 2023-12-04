`timescale 1ns / 1ps

module fullbeamformer_tb();


    reg
    reg [2:0] next_control_state=loadin;
    parameter loadin=0, filtering=1, finishfiltering=2, beamforming=3, summing=4, done=5;

    wire [35:0] summed_value


    fullbeamformer fullbeamformer_inst(
        .clk(clk),
        .ext_next_control_state(next_control_state),
        .summed_value(summed_value)

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


    end




endmodule