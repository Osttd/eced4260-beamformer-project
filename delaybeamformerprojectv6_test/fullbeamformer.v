

module fullbeamformer(
    input clk,
    input locked,
    output [39:0] summed_value,
    output reg sumflag
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
    reg [15:0] sample_index=-16'd1;//handle delay on the bram reading in
    reg signed [39:0] summed_value_buffer; //multiple of 8 so it can be sliced up for the UART nicely
    reg signed [33:0] summed_value_buffer_1;
    reg signed [33:0] summed_value_buffer_2;
    reg signed [33:0] summed_value_buffer_3;
    reg signed [33:0] summed_value_buffer_4;



    reg [2:0] sumcounter=0;

    wire signed [31:0] output_value_1;
    wire signed [31:0] output_value_2;
    wire signed [31:0] output_value_3;
    wire signed [31:0] output_value_4;
    wire signed [31:0] output_value_5;
    wire signed [31:0] output_value_6;
    wire signed [31:0] output_value_7;
    wire signed [31:0] output_value_8;

    wire beamformdone;
    wire beamformdone_1;
    wire beamformdone_2;
    wire beamformdone_3;
    wire beamformdone_4;
    wire beamformdone_5;
    wire beamformdone_6;
    wire beamformdone_7;
    wire beamformdone_8; 

    reg valid_out=0;
    wire valid_out_1;
    wire valid_out_2;
    wire valid_out_3;
    wire valid_out_4;
    wire valid_out_5;
    wire valid_out_6;
    wire valid_out_7;
    wire valid_out_8;

    wire [127:0] signal_in;



	localparam slice_idle_delay=2'd0, slice1=2'd1, slice2=2'd2, slice3=2'd3;
    localparam loadin=3'd0, filtering=3'd1, finishfiltering=3'd2, beamforming=3'd3, summing=3'd4, done=3'd5;
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
    .beamformdone(beamformdone_1),
    .valid_out(valid_out)
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
    .beamformdone(beamformdone_2),
    .valid_out(valid_out)
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
    .beamformdone(beamformdone_3),
    .valid_out(valid_out)
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
    .beamformdone(beamformdone_4),
    .valid_out(valid_out)
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
    .beamformdone(beamformdone_5),
    .valid_out(valid_out)
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
    .beamformdone(beamformdone_6),
    .valid_out(valid_out)
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
    .beamformdone(beamformdone_7),
    .valid_out(valid_out)
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
    .beamformdone(beamformdone_8),
    .valid_out(valid_out)
    )/* synthesis keep */;

    always @(posedge clk) begin
        control_state=next_control_state;
        case(control_state)
            loadin: begin
                //this will be the pll state
                if (locked===1'b1) begin
                    signalinen<=1;
                    rst<=1;
                    next_control_state=filtering;
                end
            end
            filtering: begin
                start<=1;
                if (filterfinishcounter===8) begin
                    valid_out=1'd1;
                end else begin
                    filterfinishcounter=filterfinishcounter+4'd1;                    
                end

                signal_address=signal_address+11'd1;
                if (signal_address===11'd2047) begin
                    filterfinishcounter=4'd0;
                    next_control_state=finishfiltering;
                end
                if (valid_out!==1'd0) begin
                    readin_address=readin_address+11'd1;
                end
            end
            finishfiltering: begin
                //this state may be unnecessary if the last few samples are not useful
                if (valid_out!==0) begin
                    readin_address=readin_address+11'd1;
                end
                if (filterfinishcounter===8) begin
                    readin_address=11'd0;
                    valid_out=4'd0;
                    next_control_state=beamforming;
                end
                filterfinishcounter=filterfinishcounter+4'd1;
            end

            beamforming: begin
                rst<=0;
                start<=0;
                output_read_en<=1;
                if (beamformdone===1'b1) begin
                    sumout_address=10'd0;
                    next_control_state=summing;
                end
                startbeamformer <= 1;

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
                sumflag=1;
                if (sumcounter===3'd1) begin
                    if (sumout_address===10'd539) begin
                        sumout_address=10'd0;
                        next_control_state=done;
                    end
                    summed_value_buffer_1=output_value_1+output_value_2;
                    summed_value_buffer_2=output_value_3+output_value_4;
                    summed_value_buffer_3=output_value_5+output_value_6;
                    summed_value_buffer_4=output_value_7+output_value_8;
                    sumout_address=sumout_address+10'd1;
                    sumcounter=3'd0;
                end else begin
                    sumcounter=sumcounter+3'd1;
                    summed_value_buffer=summed_value_buffer_1+summed_value_buffer_2+summed_value_buffer_3+summed_value_buffer_4;
                end
            end
            done: begin
                sumflag=0;
                sumouten=0;
            end

        endcase
    end



    assign summed_value=summed_value_buffer;
	//assign valid_out=valid_out_1&&valid_out_2&&valid_out_3&&valid_out_4&&valid_out_5&&valid_out_6&&valid_out_7&&valid_out_8;
    assign beamformdone=beamformdone_1&&beamformdone_2&&beamformdone_3&&beamformdone_4&&beamformdone_5&&beamformdone_6&&beamformdone_7&&beamformdone_8;

	 
    defparam channel1.delaybeamformer_inst.indexram_inst.altsyncram_component.init_file = "indexes_1.mif";
    defparam channel2.delaybeamformer_inst.indexram_inst.altsyncram_component.init_file = "indexes_2.mif";
    defparam channel3.delaybeamformer_inst.indexram_inst.altsyncram_component.init_file = "indexes_3.mif";
    defparam channel4.delaybeamformer_inst.indexram_inst.altsyncram_component.init_file = "indexes_4.mif";
    defparam channel5.delaybeamformer_inst.indexram_inst.altsyncram_component.init_file = "indexes_5.mif";
    defparam channel6.delaybeamformer_inst.indexram_inst.altsyncram_component.init_file = "indexes_6.mif";
    defparam channel7.delaybeamformer_inst.indexram_inst.altsyncram_component.init_file = "indexes_7.mif";
    defparam channel8.delaybeamformer_inst.indexram_inst.altsyncram_component.init_file = "indexes_8.mif";

endmodule

