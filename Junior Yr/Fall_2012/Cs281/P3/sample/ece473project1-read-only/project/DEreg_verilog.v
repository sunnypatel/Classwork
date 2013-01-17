module DEreg_verilog (
	input wire clock,
	input wire RegDst,
	input wire reg_imm_ctl,
	input wire [31:0] instruction,
	input wire [31:0] rd1,
	input wire [31:0] aluin2,
	input wire [9:0] PC_plus_4,
	input wire [31:0] shiftin,
	input wire mem_read,
	input wire mem_write,
	input wire alu_mem_ctl,
	input wire reg_w_ctl,
	input wire stall_ctl,
	output reg RegDst_de,
	output reg reg_imm_ctl_de,
	output reg [31:0] instruction_de,
	output reg [31:0] rd1_de,
	output reg [31:0] aluin2_de,
	output reg [9:0] PC_plus_4_de,
	output reg [31:0] shiftin_de,
	output reg mem_read_de,
	output reg mem_write_de,
	output reg alu_mem_ctl_de,
	output reg reg_w_ctl_de,
	input wire [1:0] branch_ctl,
	output reg [1:0] branch_ctl_de,
	input wire [3:0] ALU_op,
	output reg [3:0] ALU_op_de,
	input wire [31:0] rd2,
	output reg [31:0] rd2_de );
		
	always @ (posedge(clock))
	begin
		if (stall_ctl == 1)
			begin
				instruction_de = 8'h00000000;
				reg_imm_ctl_de = 1'b0;
				RegDst_de = 1'b0;
				rd1_de = 8'h00000000;
				aluin2_de = 8'h00000000;
				PC_plus_4_de = 10'b0000000000;
				shiftin_de = 8'h00000000;
				mem_read_de = 1'b0;
				mem_write_de = 1'b0;
				alu_mem_ctl_de = 1'b0;
				reg_w_ctl_de = 1'b0;
				branch_ctl_de = branch_ctl;
				ALU_op_de = 4'b0000;
				rd2_de = 8'h00000000;
			end
		else
			begin
				instruction_de = instruction;
				reg_imm_ctl_de = reg_imm_ctl;
				RegDst_de = RegDst;
				rd1_de = rd1;
				aluin2_de = aluin2;
				PC_plus_4_de = PC_plus_4;
				shiftin_de = shiftin;
				mem_read_de = mem_read;
				mem_write_de = mem_write;
				alu_mem_ctl_de = alu_mem_ctl;
				reg_w_ctl_de = reg_w_ctl;
				branch_ctl_de = branch_ctl;
				ALU_op_de = ALU_op;
				rd2_de = rd2;
			end
		end
endmodule
