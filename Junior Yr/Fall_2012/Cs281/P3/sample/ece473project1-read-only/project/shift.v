module shift (DI, rl, sel, SO); 
input  [31:0] DI; 

input [1:0] rl;
input  [4:0] sel; 
output [31:0] SO; 
reg    [31:0] SO; 

//this module handles all of the shift calculations done by the processor
//rl has three valid cases for shifting.
// '00' : arithmatic right shift
// '01' : logical right shift
// '10' : logical left shift
// '11' : space for later processor functionality

  always @(DI or sel) 
  begin 
	case (rl)
		2'b00	: SO <= ((DI >> sel) + (((1 << sel) - 1) << (32 - sel)));
		2'b01	: SO <= (DI >> sel);
		2'b10	: SO <= DI << sel;
	endcase
  end 
endmodule
