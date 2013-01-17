module turbo_select(
	input wire [1:0] select,
	input wire clock_100Hz, 
	input wire clock_10Hz, 
	input wire clock_1Hz, 
	output reg out_clock );
	
	always @ (*)
	begin
		if ( select == 2'b00) begin
			out_clock = clock_1Hz;
		end
		
		if ( select == 2'b01) begin
			out_clock = clock_10Hz;
		end
		
		if ( select == 2'b10) begin
			out_clock = clock_100Hz;
		end
	end
endmodule
