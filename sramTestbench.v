/*
Michael Von Hippel
SRAM testbench
tests signals coming from controller
*/

module sramTestbench();
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
		clk = 1;
		reset <= 1;
		read <= 1;
		write <= 0;
		#(Delay * 2);
		reset <= 0;
		#(Delay * 2);

		// Read stuff
		#(Delay * 4);		

		reset <= 1;
		read <= 0;
		write <= 1;
		#(Delay * 2) 
		reset <= 0;
		#(Delay * 2);

		// Write stuff
		#(Delay * 4);

		reset <= 1;
		read <= 0;
		write <= 0;
		#(Delay * 2); 
		reset <= 0;
		#(Delay * 2);

		// Should idle...
		#(Delay * 4);		

		reset <= 1;
		read <= 1;
		write <= 1;
		#(Delay * 2);
		reset <= 0;
		#(Delay * 2);

		// Should still idle
		#(Delay * 4)

		#(Delay * 2) 

		#(Delay * 2);

		$stop;
	end

	always #(Delay) clk = ~clk;
endmodule