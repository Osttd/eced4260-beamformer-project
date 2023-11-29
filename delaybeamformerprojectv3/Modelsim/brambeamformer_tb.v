`timescale 1ns / 1ps

module brambeamformer_tb();

    reg clk;
    reg [10:0] readin_address=0;
    reg [10:0] sumout_address=0;
    reg startbeamformer=0;
    reg readinen=1;
    reg sumouten=0;
    reg [15:0] sample_index=-1;//handle delay on the bram reading in

    wire [11:0] output_value;
    wire usedataflag;

	parameter slice_idle_delay=0, slice1=1, slice2=2, slice3=3;
    reg [1:0] control_state=slice_idle_delay;


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
	end
    initial begin
        #630
        startbeamformer=0;
        readinen=0;
        sumouten=1;
        sumout_address=0;
        forever #4 sumout_address <= sumout_address+1;

    end


    //This stuff will likely end up in the controller in the end
    always @(negedge usedataflag) begin
        if (startbeamformer===1) begin
            sumout_address=sumout_address+1;
        end
    end

	always @(posedge clk) begin
		if (startbeamformer===1) begin
				case(control_state)
                    slice_idle_delay: begin
                        control_state<=slice1;
                        readinen<=0;
                    end
                    slice1: begin
                        control_state<=slice2;
                        readinen<=1;
                        sample_index<=sample_index+1;
                    end
                    slice2: begin
                        control_state<=slice3;
                        sample_index = sample_index+1;
                    end
                    slice3: begin
                        control_state<=slice_idle_delay;
                        sample_index = sample_index+1;
                        readin_address <= readin_address+1
                    end
                endcase
		end
	end


endmodule












