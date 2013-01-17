library ieee;
use ieee.std_logic_1164.all;

entity and2 is 
	port( x: in std_logic;
		y : in std_logic;
		f : out std_logic
	);
end and2;

architecture behavioral of and2 is
begin
	process(x,y)
	begin
		if((x='1') and (y='1')) then
			F <= '1';
		else
			F <= '0';
		end if;
	end process;
end behavioral;
