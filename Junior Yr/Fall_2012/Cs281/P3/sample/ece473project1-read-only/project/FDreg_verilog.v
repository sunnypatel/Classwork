module FDreg_verilog (
	input wire clock,
	input wire [31:0] instruction, 
	input wire [9:0] PC,
	input wire [9:0] PC_plus_4,
	output reg [31:0] instruction_fd,
	output reg [9:0] PC_fd,
	output reg [9:0] PC_plus_4_fd );
		
	always @ (posedge(clock))
	begin
	#50
	instruction_fd = instruction;
	PC_fd = PC;
	PC_plus_4_fd = PC_plus_4;
	end
endmodule
