library IEEE;
use IEEE.std_logic_1164.all;

entity tb_clock is
end entity;

architecture behavioral of tb_clock is

component clock is
	port (
		clock_out: out std_ulogic := '0' 
		);
end component;

signal clk_in_sig : std_ulogic := '0';

begin
	TopLevelToBeTested : clock
	port map(
		clock_out => clk_in_sig
	);
	tb:process
	begin	
	clk_in_sig <= '1' after 15 ns, '0' after 30 ns;
	wait;
	end process;
end behavioral;
