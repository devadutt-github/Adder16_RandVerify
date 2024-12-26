module adder_16(
    input wire clk, rst_n,
    input wire [15:0] A, B,
    output reg [16:0] C
);  
  reg [15:0] reg_A, reg_B;

  always @(posedge clk) begin
      if (~rst_n) begin
          reg_A <= 0;
          reg_B <= 0;
          C <= 0; // Reset output as well
      end else begin
          reg_A <= A; // Capture inputs into registers
          reg_B <= B;
         
      end
  end
  
  always @(*)begin 
	 C = reg_A + reg_B; // Perform addition using registered values
  end

endmodule
