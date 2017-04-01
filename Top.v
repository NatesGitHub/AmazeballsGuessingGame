`timescale 1ns / 1ns // `timescale time_unit/time_precision
//===============================================
// TOP MODULE
//===============================================
module Top(
	input CLOCK_50, enable, resetn, // Input Ports
	input [17:0] SW, // Selection
	input [3:0] KEY,

	output [7:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7
	);

	//------------------------------------------
	
	Guess new_guess
	(
	.clk(KEY[0]),
	.clk2(KEY[3]),
	.guess_number(SW[3:0]),
	.initial_number(SW[17:14]),
	.hex(HEX4),
	.hex_L(HEX3),
	.hex_O(HEX2),
	.hex_S(HEX1),
	.hex_E(HEX0),
	.hex_fill(HEX5),
	.hex_score1(HEX6),
	.hex_score10(HEX7)
	);

endmodule

	