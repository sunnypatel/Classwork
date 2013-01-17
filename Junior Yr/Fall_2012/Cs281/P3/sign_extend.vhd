library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------------------------------
entity sign_extend is
	port(
			Input : in unsigned(31 downto 0);
			Output : out unsigned(31 downto 0)
		);
end sign_extend;

------------------------------------------
architecture behavioral of sign_extend is
signal input_tmp : unsigned(15 downto 0);

begin
	input_tmp <= Input(15 downto 0);
	Output <= resize(input_tmp,32);
end behavioral;
