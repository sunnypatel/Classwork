module signext(input wire [15:0] in, output wire [31:0] out);

// this module simply takes a signed 16 bit input and has a signed 16 bit
// output. the output is the upper 16 bits tied to the sign bit of the input
assign out[15:0] = in[15:0];
assign 	out[16] = in[15];
assign 	out[17] = in[15];
assign 	out[18] = in[15];
assign 	out[19] = in[15];
assign 	out[20] = in[15];
assign 	out[21] = in[15];
assign 	out[22] = in[15];
assign 	out[23] = in[15];
assign 	out[24] = in[15];
assign 	out[25] = in[15];
assign 	out[26] = in[15];
assign 	out[27] = in[15];
assign 	out[28] = in[15];
assign 	out[29] = in[15];
assign 	out[30] = in[15];
assign 	out[31] = in[15];
endmodule
