// sunny
module lshift (DI, SO); 
input  [31:0] DI; 

output [31:0] SO; 
reg    [31:0] SO; 

//this left shifts DI by 2 and outputs it on SO
  always @(DI) 
  begin 
	SO <= DI << 2;
  end 
endmodule
