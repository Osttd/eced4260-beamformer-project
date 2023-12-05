

module fullbeamformer(
    input clk,
    input [2:0] ext_next_control_state,
    output [35:0] summed_value
);


    reg rst=0;
    reg start=0;
    reg [10:0] signal_address=0;
    reg [10:0] readin_address=0;
    reg [9:0] sumout_address=0;
    reg output_read_en=0;
    reg startbeamformer=0;
    reg signalinen=1;
    reg sumouten=0;
    reg [15:0] sample_index=-16'd2;//handle delay on the bram reading in
    reg [35:0] summed_value_buffer;



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

    wire [127:0] signal_in;



	 parameter slice_idle_delay=2'd0, slice1=2'd1, slice2=2'd2, slice3=2'd3;
    parameter loadin=3'd0, filtering=3'd1, finishfiltering=3'd2, beamforming=3'd3, summing=3'd4, done=3'd5;
    reg [2:0] control_state=loadin;
    reg [2:0] next_control_state=loadin;
    reg [1:0] slice_state=slice_idle_delay;
    reg [1:0] next_slice_state=slice_idle_delay;

    reg [3:0] filterfinishcounter=0;

	signalram in_signalram(
		.address(signal_address),
		.clock(clk),
		.data(0),
		.rden(signalinen),
		.wren(0),
		.q(signal_in)
	)/* synthesis keep */;



    brambeamformer channel1(
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(signal_in[15:0]),
    .readin_address(readin_address),
    .sumout_address(sumout_address),
    .output_read_en(output_read_en),
    .startbeamformer(startbeamformer),
    .sumouten(sumouten),
    .sample_index(sample_index),
    .slice_state(slice_state),
    .output_value(output_value_1),
    .usedataflag(usedataflag)
    )/* synthesis keep */;

    brambeamformer channel2(
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(signal_in[31:16]),
    .readin_address(readin_address),
    .sumout_address(sumout_address),
    .output_read_en(output_read_en),
    .startbeamformer(startbeamformer),
    .sumouten(sumouten),
    .sample_index(sample_index),
    .slice_state(slice_state),
    .output_value(output_value_2),
    .usedataflag(usedataflag)
    )/* synthesis keep */;

    brambeamformer channel3(
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(signal_in[47:32]),
    .readin_address(readin_address),
    .sumout_address(sumout_address),
    .output_read_en(output_read_en),
    .startbeamformer(startbeamformer),
    .sumouten(sumouten),
    .sample_index(sample_index),
    .slice_state(slice_state),
    .output_value(output_value_3),
    .usedataflag(usedataflag)
    )/* synthesis keep */;

    brambeamformer channel4(
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(signal_in[63:48]),
    .readin_address(readin_address),
    .sumout_address(sumout_address),
    .output_read_en(output_read_en),
    .startbeamformer(startbeamformer),
    .sumouten(sumouten),
    .sample_index(sample_index),
    .slice_state(slice_state),
    .output_value(output_value_4),
    .usedataflag(usedataflag)
    )/* synthesis keep */;

    brambeamformer channel5(
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(signal_in[79:64]),
    .readin_address(readin_address),
    .sumout_address(sumout_address),
    .output_read_en(output_read_en),
    .startbeamformer(startbeamformer),
    .sumouten(sumouten),
    .sample_index(sample_index),
    .slice_state(slice_state),
    .output_value(output_value_5),
    .usedataflag(usedataflag)
    )/* synthesis keep */;


    brambeamformer channel6(
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(signal_in[95:80]),
    .readin_address(readin_address),
    .sumout_address(sumout_address),
    .output_read_en(output_read_en),
    .startbeamformer(startbeamformer),
    .sumouten(sumouten),
    .sample_index(sample_index),
    .slice_state(slice_state),
    .output_value(output_value_6),
    .usedataflag(usedataflag)
    )/* synthesis keep */;

    brambeamformer channel7(
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(signal_in[111:96]),
    .readin_address(readin_address),
    .sumout_address(sumout_address),
    .output_read_en(output_read_en),
    .startbeamformer(startbeamformer),
    .sumouten(sumouten),
    .sample_index(sample_index),
    .slice_state(slice_state),
    .output_value(output_value_7),
    .usedataflag(usedataflag)
    )/* synthesis keep */;

    brambeamformer channel8(
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(signal_in[127:112]),
    .readin_address(readin_address),
    .sumout_address(sumout_address),
    .output_read_en(output_read_en),
    .startbeamformer(startbeamformer),
    .sumouten(sumouten),
    .sample_index(sample_index),
    .slice_state(slice_state),
    .output_value(output_value_8),
    .usedataflag(usedataflag)
    )/* synthesis keep */;

    always @(posedge clk) begin
        control_state=next_control_state;
        case(control_state)
            loadin: begin
                //this will be the pll state
                signalinen<=1;
                rst<=1;
					 next_control_state=filtering;
            end
            filtering: begin
                start<=1;

                signal_address=signal_address+11'd1;
                if (signal_address===11'd2047) begin
                    next_control_state=finishfiltering;
                end
                if (valid_out!==0) begin
                    readin_address=readin_address+11'd1;
                end
            end
            finishfiltering: begin
                //this state may be unnesscary if the last few samples are not useful
                if (valid_out!==0) begin
                    readin_address=readin_address+11'd1;
                end
                if (filterfinishcounter===5) begin
                    readin_address=11'd0;
                    next_control_state=beamforming;
                end
                filterfinishcounter=filterfinishcounter+4'd1;
            end



            beamforming: begin
                rst<=0;
                start<=0;
                output_read_en<=1;
                startbeamformer <= 1;
                if (sumout_address===10'd539) begin
                    sumout_address=10'd0;
                    next_control_state=summing;
                end
                sumout_address=sumout_address+10'd1;
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
                        sample_index<=sample_index+16'd1;
                    end
                    slice2: begin
                        next_slice_state<=slice3;
                        sample_index = sample_index+16'd1;
                    end
                    slice3: begin
                        next_slice_state<=slice_idle_delay;
                        sample_index = sample_index+16'd1;
                        readin_address <= readin_address+11'd1;
                    end
                endcase
            end
            summing: begin
                startbeamformer=0;
                output_read_en=0;
                sumouten=1;
                if (sumout_address===10'd539) begin
                    sumout_address=10'd0;
                    next_control_state=done;
                end
				sumout_address=sumout_address+10'd1;
                summed_value_buffer=output_value_1+output_value_2+output_value_3+output_value_4+output_value_5+output_value_6+output_value_7+output_value_8;
            end
            done: begin
                sumouten=0;
            end

        endcase
    end

    // always @(negedge clk) begin
    //     if (sumouten!==0) begin
    //         sumout_address<=sumout_address+1;
    //     end
    // end

    // always @(negedge clk) begin
    //     if (valid_out!==0) begin
    //         readin_address<=readin_address+1;
    //     end
    // end

    // always @(negedge usedataflag) begin
    //     if (startbeamformer===1) begin
    //         sumout_address=sumout_address+1;
    //     end
    // end

	// always @(posedge clk) begin
        
	// 	if (startbeamformer===1) begin
    //             slice_state=next_slice_state;
	// 			case(slice_state)
    //                 slice_idle_delay: begin
    //                     next_slice_state<=slice1;
    //                     output_read_en<=1;//making this 0 does not do really anything
    //                     //having the state as a delay works well though
    //                 end
    //                 slice1: begin
    //                     next_slice_state<=slice2;
    //                     output_read_en<=1;
    //                     sample_index<=sample_index+1;
    //                 end
    //                 slice2: begin
    //                     next_slice_state<=slice3;
    //                     sample_index = sample_index+1;
    //                 end
    //                 slice3: begin
    //                     next_slice_state<=slice_idle_delay;
    //                     sample_index = sample_index+1;
    //                     readin_address <= readin_address+1;
    //                 end
    //             endcase
	// 	end
	// end


    assign summed_value=summed_value_buffer;


	 
    defparam channel1.delaybeamformer_inst.indexram_inst.altsyncram_component.init_file = "indexes_1.mif";
    defparam channel2.delaybeamformer_inst.indexram_inst.altsyncram_component.init_file = "indexes_2.mif";
    defparam channel3.delaybeamformer_inst.indexram_inst.altsyncram_component.init_file = "indexes_3.mif";
    defparam channel4.delaybeamformer_inst.indexram_inst.altsyncram_component.init_file = "indexes_4.mif";
    defparam channel5.delaybeamformer_inst.indexram_inst.altsyncram_component.init_file = "indexes_5.mif";
    defparam channel6.delaybeamformer_inst.indexram_inst.altsyncram_component.init_file = "indexes_6.mif";
    defparam channel7.delaybeamformer_inst.indexram_inst.altsyncram_component.init_file = "indexes_7.mif";
    defparam channel8.delaybeamformer_inst.indexram_inst.altsyncram_component.init_file = "indexes_8.mif";

endmodule

