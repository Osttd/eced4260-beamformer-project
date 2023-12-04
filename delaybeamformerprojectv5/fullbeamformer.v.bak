

module fullbeamformer(
    input clk,
    input [2:0] next_control_state,
    output [35:0] summed_value
);


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




    wire [31:0] output_value_1;
    wire [31:0] output_value_2;
    wire [31:0] output_value_3;
    wire [31:0] output_value_4;
    wire [31:0] output_value_5;
    wire [31:0] output_value_6;
    wire [31:0] output_value_7;
    wire [31:0] output_value_8;

    wire usedataflag;
    wire valid_out;

    wire [16*8-1:0] signal_in;


	signalram in_signalram(
		.address(signal_address),
		.clock(clk),
		.data(0),
		.rden(signalinen),
		.wren(0),
		.q(signal_in)
	);


	parameter slice_idle_delay=0, slice1=1, slice2=2, slice3=3;
    parameter loadin=0, filtering=1, finishfiltering=2, beamforming=3, summing=4, done=5;
    reg [2:0] control_state=loadin;
    //reg [2:0] next_control_state=loadin;
    reg [1:0] slice_state=slice_idle_delay;
    reg [1:0] next_slice_state=slice_idle_delay;

    reg [3:0] filterfinishcounter=0;


    reg [10:0] signal_address;



    brambeamformer channel1(
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(signal_in[15:0]),
    .readin_address(readin_address),
    .sumout_address(sumout_address),
    .filter_bram_output_write_en(filter_bram_output_write_en),
    .output_read_en(output_read_en),
    .startbeamformer(startbeamformer),
    .sumouten(sumouten),
    .sample_index(sample_index),
    .slice_state(slice_state),
    .output_value(output_value_1),
    .usedataflag(usedataflag),
    .valid_out(valid_out)
    );

    brambeamformer channel2(
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(signal_in[31:16]),
    .readin_address(readin_address),
    .sumout_address(sumout_address),
    .filter_bram_output_write_en(filter_bram_output_write_en),
    .output_read_en(output_read_en),
    .startbeamformer(startbeamformer),
    .sumouten(sumouten),
    .sample_index(sample_index),
    .slice_state(slice_state),
    .output_value(output_value_2),
    .usedataflag(usedataflag),
    .valid_out(valid_out)
    );

    brambeamformer channel3(
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(signal_in[47:32]),
    .readin_address(readin_address),
    .sumout_address(sumout_address),
    .filter_bram_output_write_en(filter_bram_output_write_en),
    .output_read_en(output_read_en),
    .startbeamformer(startbeamformer),
    .sumouten(sumouten),
    .sample_index(sample_index),
    .slice_state(slice_state),
    .output_value(output_value_3),
    .usedataflag(usedataflag),
    .valid_out(valid_out)
    );

    brambeamformer channel4(
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(signal_in[63:48]),
    .readin_address(readin_address),
    .sumout_address(sumout_address),
    .filter_bram_output_write_en(filter_bram_output_write_en),
    .output_read_en(output_read_en),
    .startbeamformer(startbeamformer),
    .sumouten(sumouten),
    .sample_index(sample_index),
    .slice_state(slice_state),
    .output_value(output_value_4),
    .usedataflag(usedataflag),
    .valid_out(valid_out)
    );

    brambeamformer channel5(
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(signal_in[79:64]),
    .readin_address(readin_address),
    .sumout_address(sumout_address),
    .filter_bram_output_write_en(filter_bram_output_write_en),
    .output_read_en(output_read_en),
    .startbeamformer(startbeamformer),
    .sumouten(sumouten),
    .sample_index(sample_index),
    .slice_state(slice_state),
    .output_value(output_value_5),
    .usedataflag(usedataflag),
    .valid_out(valid_out)
    );


    brambeamformer channel6(
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(signal_in[95:80]),
    .readin_address(readin_address),
    .sumout_address(sumout_address),
    .filter_bram_output_write_en(filter_bram_output_write_en),
    .output_read_en(output_read_en),
    .startbeamformer(startbeamformer),
    .sumouten(sumouten),
    .sample_index(sample_index),
    .slice_state(slice_state),
    .output_value(output_value_6),
    .usedataflag(usedataflag),
    .valid_out(valid_out)
    );

    brambeamformer channel7(
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(signal_in[111:96]),
    .readin_address(readin_address),
    .sumout_address(sumout_address),
    .filter_bram_output_write_en(filter_bram_output_write_en),
    .output_read_en(output_read_en),
    .startbeamformer(startbeamformer),
    .sumouten(sumouten),
    .sample_index(sample_index),
    .slice_state(slice_state),
    .output_value(output_value_7),
    .usedataflag(usedataflag),
    .valid_out(valid_out)
    );

    brambeamformer channel8(
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(signal_in[127:112]),
    .readin_address(readin_address),
    .sumout_address(sumout_address),
    .filter_bram_output_write_en(filter_bram_output_write_en),
    .output_read_en(output_read_en),
    .startbeamformer(startbeamformer),
    .sumouten(sumouten),
    .sample_index(sample_index),
    .slice_state(slice_state),
    .output_value(output_value_8),
    .usedataflag(usedataflag),
    .valid_out(valid_out)
    );

    always @(posedge clk) begin
        control_state=next_control_state;
        case(control_state)
            loadin: begin
                //this will be the pll state
                signalinen<=1;
                rst<=1;

            end
            filtering: begin
                start<=1;

                signal_address=signal_address+1;
                if (signal_address===2047) begin
                    next_control_state=finishfiltering;
                end

            end
            finishfiltering: begin
                //this state may be unnesscary if the last few samples are not useful

                if (filterfinishcounter===5) begin
                    readin_address=0;
                    next_control_state=beamforming;
                end
                filterfinishcounter=filterfinishcounter+1;
            end



            beamforming: begin
                rst<=0;
                start<=0;
                output_read_en<=1;
                startbeamformer <= 1;
                if (sumout_address===539) begin
                    sumout_address=0;
                    next_control_state=summing;
                end
            end
            summing: begin
                startbeamformer=0;
                output_read_en=0;
                sumouten=1;
                if (sumout_address===539) begin
                    sumout_address=0;
                    next_control_state=done;
                end
                summed_value=output_value_1+output_value_2+output_value_3+output_value_4+output_value_5+output_value_6+output_value_7+output_value_8;


            end
            done: begin
                sumouten=0;
            end

        endcase
    end

    always @(negedge clk) begin
        if (sumouten!==0) begin
            sumout_address<=sumout_address+1;
        end
    end

    always @(negedge clk) begin
        if (valid_out!==0) begin
            readin_address<=readin_address+1;
        end
    end

    always @(negedge usedataflag) begin
        if (startbeamformer===1) begin
            sumout_address=sumout_address+1;
        end
    end

	always @(posedge clk) begin
        
		if (startbeamformer===1) begin
                slice_state=next_slice_state;
				case(slice_state)
                    slice_idle_delay: begin
                        next_slice_state<=slice1;
                        output_read_en<=1;//making this 0 does not do really anything
                        //having the state as a delay works well though
                    end
                    slice1: begin
                        next_slice_state<=slice2;
                        output_read_en<=1;
                        sample_index<=sample_index+1;
                    end
                    slice2: begin
                        next_slice_state<=slice3;
                        sample_index = sample_index+1;
                    end
                    slice3: begin
                        next_slice_state<=slice_idle_delay;
                        sample_index = sample_index+1;
                        readin_address <= readin_address+1;
                    end
                endcase
		end
	end

    assign filter_bram_output_write_en=valid_out;




endmodule

