library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------------------------
entity adder is
	-- define the number of bits the adder will be adding
	generic( n: natural := 32);
	port(
			A: in unsigned(n-1 downto 0);
			B: in unsigned(n-1 downto 0);
			carry: out std_logic;
			sum: out unsigned(n-1 downto 0)
	);
end adder;

----------------------------------------------

architecture behavioral of adder is

signal result: unsigned(n downto 0);

begin
	-- the left most bit will be the carry.  If the carry is > 0 it will be set as
	-- 1, otherwise it will be 0.  
	result <= ('0' & A)+('0' & B);
	sum <= result(n-1 downto 0);
	carry <= result(n);

end behavioral;
