module inst_select (
	input wire [2:0] select,
	input wire [31:0] inst, 
	input wire [31:0] inst_f,
	input wire [31:0] inst_d,
	input wire [31:0] inst_e,
	input wire [31:0] inst_m,
	output reg [31:0] out_inst );
	
	always @ (*)
	begin
		if ( select == 3'b000) begin
			out_inst = inst_m;
		end
		
		if ( select == 3'b001) begin
			out_inst = inst_f;
		end
		
		if ( select == 3'b010) begin
			out_inst = inst_d;
		end
		
		if ( select == 3'b011) begin
			out_inst = inst_e;
		end
		
		if ( select == 3'b100) begin
			out_inst = inst;
		end
		
	end
endmodule
