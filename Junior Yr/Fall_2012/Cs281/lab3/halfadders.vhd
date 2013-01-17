library IEEE;
use IEEE.std_logic_1164.all;

entity and_2 is
	port ( a, b : in STD_LOGIC;
		  c : out STD_LOGIC);
end and_2;

architecture func of and_2 is
begin
	c <= a and b;
end func;


library IEEE;
use IEEE.std_logic_1164.all;

entity xor_2 is
	port ( a, b : in STD_LOGIC;
		  c : out STD_LOGIC);
end xor_2;

architecture func of xor_2 is
begin
	c <= a xor b;
end func;

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
  
architecture structural of half_adder is	

  component xor_2
	  port(a,b : in std_logic;
	       c   : out std_logic);
  end component;
  
  component and_2
	  port(a,b : in std_logic;
		c   : out std_logic);
  end component;
  
begin
--	X1 : xor_2 port map(a => a, b => b, c => sum);
--	A1 : and_2 port map(a => a, b => b, c => carry);
	X1 : xor_2 port map(a,b,sum);
	A1 : and_2 port map(a,b,carry);
	
end structural;
