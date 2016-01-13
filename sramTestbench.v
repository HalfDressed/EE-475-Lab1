/*
Michael Von Hippel
SRAM testbench
tests signals coming from controller
*/

module sramTestbench():
	reg read, write, clk, reset;
	wire latch, dataEnable, csBar, oeBar, weBar;

	SRAM sramController(
		.read(read), 
		.write(write),
		.clk(clk),
		.reset(reset), 
		.latch(latch),
		.dataEnable(dataEnable),
		.csBar(csBar),
		.oeBar(oeBar),
		.weBar(weBar)
	);

	parameter Delay = 500;
	
	// Run through instructions to test that each function works
	initial begin
		clk = 0;
		reset <= 1;
		#(Delay * 2)
		reset <= 0;
		#(Delay * 2) 

		// Read stuff
		read <= 1;
		write <= 0;
		#(Delay * 10)		

		reset <= 1;
		#(Delay * 2) 
		reset <= 0;
		#(Delay * 2) 

		// Write stuff
		read <= 0;
		write <= 1;
		#(Delay * 10)

		reset <= 1;
		#(Delay * 2) 
		reset <= 0;
		#(Delay * 2) 

		// Should idle...
		read <= 0;
		write <= 0;
		#(Delay * 10)		

		reset <= 1;
		#(Delay * 2) 
		reset <= 0;
		#(Delay * 2) 

		// Should still idle
		read <= 1;
		write <= 1;
		#(Delay * 10)

		#(Delay * 2) 

		#(Delay * 2);

		$stop;
	end

	always #(Delay) clk = ~clk;
endmodule