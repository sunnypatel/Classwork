library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

---------------------------------------
entity shiftl2_jump is
	port(
			Instruction : in unsigned(31 downto 0);
			PC_plus4	: in unsigned(31 downto 0);
			Output : out unsigned(31 downto 0)
	);
end shiftl2_jump;

---------------------------------------
architecture behavioral of shiftl2_jump is
signal input_tmp : unsigned(27 downto 0);
begin

input_tmp <= Instruction(25 downto 0) & "00";
Output <= PC_plus4(31 downto 28) & input_tmp;
end behavioral;
