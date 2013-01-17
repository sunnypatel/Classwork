-- behavioral model of the 1-bit ALU on page 234

library IEEE;
use IEEE.std_logic_1164.all;

entity alu1b is 
 port(
      a,b,CarryIn : in std_logic;
      Operation : in std_logic_vector (2 downto 0);
	 Result, CarryOut, Less, Overflow : out std_logic);
end alu1b;

architecture behavioral of alu1b is
constant gate_delay: Time:=0 ns;
signal ovfw,cout,res,rb : std_logic;
begin
with Operation select
  res <= (a and b) after gate_delay when "000",
            (a or b) after gate_delay when "001",
            (a xor b xor CarryIn) after gate_delay when "010",
	    (a xor (not b) xor CarryIn) after gate_delay when "110",
            'X' after gate_delay when others;

with Operation select 
  cout <=
  ((a and not b) or (a and CarryIn) or (not b and CarryIn)) when "110",
  ((a and b) or (a and CarryIn) or (b and CarryIn)) after gate_delay when others;
  CarryOut <= cout;
  ovfw <= (cout xor CarryIn);
  Less <=(ovfw xor res) after gate_delay;
  Overflow <= ovfw;
  Result <= res;
end behavioral;	 
