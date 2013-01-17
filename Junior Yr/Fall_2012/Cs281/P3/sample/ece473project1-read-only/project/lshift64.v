module lshift64 (DI, DII, SO); 
input  [31:0] DI; 
input  [31:0] DII; 

output [63:0] SO; 
wire    [63:0] SO; 

//this module is used to connect both an instruction and another 32-bit
//input to the lcd using one bus
assign SO = (DI << 32) | DII;
endmodule
