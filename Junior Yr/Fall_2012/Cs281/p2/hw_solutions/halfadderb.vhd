library IEEE;
use IEEE.std_logic_1164.all;

entity half_adder is
	port (
		a: in STD_LOGIC;
		b: in STD_LOGIC;
		sum: out STD_LOGIC;
		carry: out STD_LOGIC
	);
end half_adder;

architecture concurrent_behavior of half_adder is
begin
  sum <= (a xor b) after 5 ns;
  carry <= (a and b) after 5 ns;
end concurrent_behavior;
