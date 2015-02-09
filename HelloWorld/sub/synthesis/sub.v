// sub.v

// Generated using ACDS version 12.1sp1 243 at 2015.02.08.20:37:05

`timescale 1 ps / 1 ps
module sub (
		output wire [6:0] my_sev_seg_0_conduit_end_0_export, // my_sev_seg_0_conduit_end_0.export
		input  wire       reset_reset_n,                     //                      reset.reset_n
		input  wire       clk_clk                            //                        clk.clk
	);

	wire    rst_controller_reset_out_reset; // rst_controller:reset_out -> my_sev_seg_0:reset_n

	my_sev_seg my_sev_seg_0 (
		.clk      (clk_clk),                           //         clock.clk
		.coe_hex1 (my_sev_seg_0_conduit_end_0_export), // conduit_end_0.export
		.reset_n  (~rst_controller_reset_out_reset)    //       reset_n.reset_n
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS        (1),
		.OUTPUT_RESET_SYNC_EDGES ("deassert"),
		.SYNC_DEPTH              (2)
	) rst_controller (
		.reset_in0  (~reset_reset_n),                 // reset_in0.reset
		.clk        (clk_clk),                        //       clk.clk
		.reset_out  (rst_controller_reset_out_reset), // reset_out.reset
		.reset_in1  (1'b0),                           // (terminated)
		.reset_in2  (1'b0),                           // (terminated)
		.reset_in3  (1'b0),                           // (terminated)
		.reset_in4  (1'b0),                           // (terminated)
		.reset_in5  (1'b0),                           // (terminated)
		.reset_in6  (1'b0),                           // (terminated)
		.reset_in7  (1'b0),                           // (terminated)
		.reset_in8  (1'b0),                           // (terminated)
		.reset_in9  (1'b0),                           // (terminated)
		.reset_in10 (1'b0),                           // (terminated)
		.reset_in11 (1'b0),                           // (terminated)
		.reset_in12 (1'b0),                           // (terminated)
		.reset_in13 (1'b0),                           // (terminated)
		.reset_in14 (1'b0),                           // (terminated)
		.reset_in15 (1'b0)                            // (terminated)
	);

endmodule
