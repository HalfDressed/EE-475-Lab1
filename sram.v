/*
EE 475 Lab 1
Michael Von Hippel
State Machine for reading and writing SRAM using counter
*/
module SRAM(read, write, clk, reset, latch, dataEnable, csBar, oeBar, weBar);
	input read, write, clk, reset;
	output reg latch, dataEnable, csBar, oeBar, weBar;
	// State within read/write cycle
	reg [1:0] currState;
	reg [1:0] readState;
	always @(posedge clk) begin
		if (reset) begin
			// Set to initial state, neither reading nor writing
			currState <= 0;
			// Set to idle state
			readState <= 0;
			// Do not yet latch a value yet
			latch <= 0;
			// Do not select chip
			csBar <= 1;
			// Do not output
			oeBar <= 1;
			// Do not enable write
			weBar <= 1;
			// Do not enable data input
			dataEnable <= 0; 
		end
		case(readState)
			// Idle
			0: begin
				// Do not yet latch a value yet
				latch <= 0;
				// Do not select chip
				csBar <= 1;
				// Do not output
				oeBar <= 1;
				// Do not enable write
				weBar <= 1;
				// Do not enable data input
				dataEnable <= 0;
				if (read & ~write) begin
					// Set to read
					readState <= 1;
					currState <= 0;
				end
				else if (write & ~read) begin
					// Set to write
					readState <= 2;
					currState <= 0;
				end
			end
			// Read
			1: begin
				case(currState)
					// Read information here
					0: begin
						// Disable writes
						weBar <= 1;
						// Disable chip select
						csBar <= 1;
						// Disable output
						oeBar <= 1;
						// Unlatch address
						latch <= 0;
						// Enable data input
						dataEnable <= 0;
						currState <= 1;
					end
					1: begin
						// Select chip
						csBar <= 0;
						// latch address
						latch <= 1;
						currState <= 2;
					end
					2: begin
						// Enable output
						oeBar <= 0;
						currState <= 0;
					end 
					default: begin
						currState <= 0;
					end 
				endcase	
			end
			// Write
			2: begin
				case(currState)
					0: begin
						// Disable output
						oeBar <= 1;
						// Disable chip select
						csBar <= 1;
						// Unlatch address
						latch <= 0;
						// Disable write
						weBar <= 1;
						// set data as output
						dataEnable <= 1;
						currState <= 1;
					end
					1: begin
						// Toggle chip select
						csBar <= 0;
						// Get new address value
						latch <= 1;
						currState <= 2;
					end
					2: begin
						// Enable writes
						weBar <= 0;
						currState <= 0;
					end 
					default: begin
						currState <= 0;
					end 
				endcase
			end
			// Plz no
			default: begin
				// Set to Idle
				readState <= 0;
				// Set to initial state, neither reading nor writing
				currState <= 0;
				// Do not yet latch a value yet
				latch <= 0;
				// Do not select chip
				csBar <= 1;
				// Do not output
				oeBar <= 1;
				// Do not enable write
				weBar <= 1;
				// Do not enable data input
				dataEnable <= 0; 
			end
		endcase	
	end
endmodule