/*
Michael Von Hippel
SRAM testbench
tests signals coming from controller
*/

module sramTestbench():
	read, write, clk, reset;
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
		
		#(Delay * 2);

		$stop;
	end

	always #(Delay) clk = ~clk;
endmodule