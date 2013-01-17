library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

---------------------------------------------------------------

entity pc is
port (
		Clock: in std_logic := '0';
		PCInc : in std_logic := '0';
		PCClr : in std_logic := '0';
		PCIn : in unsigned(31 downto 0) := "00000000000000000000000000000000";
		PCOut : out unsigned(31 downto 0) := "00000000000000000000000000000000"
);
end pc;

architecture behavioral of pc is

signal tmp_pc: unsigned(31 downto 0);

begin
	process(PCInc,PCIn,PCClr,Clock)
	begin
		if PCClr='1' then
			tmp_pc <= "00000000000000000000000000000000";
		elsif ( Clock'event and Clock = '1') then
			tmp_pc <= PCIn;
		elsif ( Clock'event and PCInc = '1') then
			tmp_pc <= tmp_pc + 1;
		end if;
	end process;

	PCOut <= tmp_pc;

end behavioral;
