//-------------------------------------------------------------------------
//				www.verificationguide.com   testbench.sv
//-------------------------------------------------------------------------
// Testbench Top: DUT and Verification environment are connected here
//-------------------------------------------------------------------------

// Including interface and testcase files
`include "interface.sv"

// Uncomment the specific test to run
// `include "random_test.sv"
// `include "wr_rd_test.sv"
`include "default_rd_test.sv"

module tbench_top;
  
  // Clock and reset signal declaration
  bit clk;
  bit reset;
  
  // Clock generation
  always #5 clk = ~clk;
  
  // Reset generation
  initial begin
    reset = 1;
    #10 reset = 0; // Reset deasserted after 10 time units
  end
  
  // Create instance of interface to connect DUT and testbench
  mem_intf intf(clk, reset);
  
  // Testcase instance: Pass the interface handle to the test
  test t1(intf);
  
  // DUT instance: Connect interface signals to DUT ports
  adder_16 DUT (
    .clk(intf.clk),
    .rst_n(~intf.reset), // Invert the active-high reset signal
    .A(intf.A),          // Map interface signals to DUT ports
    .B(intf.B),
    .C(intf.C)
   );
  
  // Enabling waveform dump
  initial begin 
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end

endmodule
