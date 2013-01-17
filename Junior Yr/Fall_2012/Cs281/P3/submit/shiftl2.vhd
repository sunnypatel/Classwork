library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

---------------------------------------
entity shiftl2 is
	port(
			Input : in unsigned(31 downto 0);
			Output : out unsigned(31 downto 0)
	);
end shiftl2;

---------------------------------------
architecture behavioral of shiftl2 is
begin
Output <= Input sll 2;
end behavioral;
