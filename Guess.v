//===============================================
// GUESS
//===============================================
module Guess(
	input clk, clk2, reset,
	input [3:0] guess_number, initial_number,

	output reg [7:0] hex, hex_L, hex_O, hex_S, hex_E, hex_fill, hex_score1, hex_score10
	);
	
	reg [3:0] lives = 4'b1001;
	reg [3:0] score1 = 4'b0000;
	reg [3:0] score10 = 4'b0000;
	reg [3:0] actual_number = 4'b0000;
	
	always @(posedge clk2) begin
		actual_number = initial_number;
	end
	
	always @(posedge clk) begin
		hex_fill = 7'b1000000; // 0
		
		case(lives[3:0])
			4'b0000: hex = 7'b1000000; // 0
			4'b0001: hex = 7'b1111001; // 1
			4'b0010: hex = 7'b0100100; // 2
			4'b0011: hex = 7'b0110000; // 3
			4'b0100: hex = 7'b0011001; // 4
			4'b0101: hex = 7'b0010010; // 5
			4'b0110: hex = 7'b0000010; // 6
			4'b0111: hex = 7'b1111000; // 7
			4'b1000: hex = 7'b0000000; // 8
			4'b1001: hex = 7'b0011000; // 9
			
			default: hex = 7'b0011000; // 9
		endcase
		
		case(score1[3:0])
			4'b0000: hex_score1 = 7'b1000000; // 0
			4'b0001: hex_score1 = 7'b1111001; // 1
			4'b0010: hex_score1 = 7'b0100100; // 2
			4'b0011: hex_score1 = 7'b0110000; // 3
			4'b0100: hex_score1 = 7'b0011001; // 4
			4'b0101: hex_score1 = 7'b0010010; // 5
			4'b0110: hex_score1 = 7'b0000010; // 6
			4'b0111: hex_score1 = 7'b1111000; // 7
			4'b1000: hex_score1 = 7'b0000000; // 8
			4'b1001: hex_score1 = 7'b0011000; // 9
			
			default: hex_score1 = 7'b1000000; // 0
		endcase
		
		case(score10[3:0])
			4'b0000: hex_score10 = 7'b1000000; // 0
			4'b0001: hex_score10 = 7'b1111001; // 1
			4'b0010: hex_score10 = 7'b0100100; // 2
			4'b0011: hex_score10 = 7'b0110000; // 3
			4'b0100: hex_score10 = 7'b0011001; // 4
			4'b0101: hex_score10 = 7'b0010010; // 5
			4'b0110: hex_score10 = 7'b0000010; // 6
			4'b0111: hex_score10 = 7'b1111000; // 7
			4'b1000: hex_score10 = 7'b0000000; // 8
			4'b1001: hex_score10 = 7'b0011000; // 9
			
			default: hex_score10 = 7'b1000000; // 0
		endcase
		
		// --------GFEDCBA
		hex_L = 7'b0001100;
		hex_O = 7'b1000111;
		hex_S = 7'b0001000;
		hex_E = 7'b0010001;
	
		if (~(guess_number == actual_number) && ~(lives == 4'b0000)) begin
			lives = lives - 1'b1;
		end
		else if (lives == 4'b0000) begin
			hex_L = 7'b1000111;
			hex_O = 7'b1000000;
			hex_S = 7'b0010010;
			hex_E = 7'b0000110;
		end
		else begin
			// --------GFEDCBA
			hex_L = 7'b1000110;
			hex_O = 7'b1000000;
			hex_S = 7'b1000000;
			hex_E = 7'b1000111;
			
			if (score1 == 4'b1001) begin
				score10 = score10 + 1'b1;
				score1 = 4'b0000;
			end
			else
				score1 = score1 + 1'b1;
		end
	end
	
endmodule
