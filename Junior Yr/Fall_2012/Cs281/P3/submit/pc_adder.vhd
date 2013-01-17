library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------------------------
entity pc_adder is
	-- define the number of bits the adder will be adding
	generic( n: natural := 32);
	port(
			A: in unsigned(n-1 downto 0);
			sum: out unsigned(n-1 downto 0)
	);
end pc_adder;

----------------------------------------------

architecture behavioral of pc_adder is

signal result: unsigned(n-1 downto 0);

begin
	result <= A + "00000000000000000000000000000100";
	sum <= result(n-1 downto 0);

end behavioral;
