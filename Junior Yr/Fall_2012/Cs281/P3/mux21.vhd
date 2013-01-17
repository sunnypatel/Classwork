library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux21 is 
	port( a: in unsigned(31 downto 0);
		b : in unsigned(31 downto 0);
		sel : in std_logic;
		z : out unsigned(31 downto 0)
	);
end mux21;

architecture behavioral of mux21 is
begin
	process(sel)
	begin
		if(sel = '0') then
			z <= a;
		else
			z <= b;
		end if;
	end process;
end behavioral;
