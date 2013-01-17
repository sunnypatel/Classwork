library IEEE;
use IEEE.std_logic_1164.all;

entity tb_clock is
end entity;

architecture behavioral of tb_clock is

component clock is
	port (
	CLK: inout std_logic := '1'
		);
end component;

signal clk_in_sig : std_logic := '1';

begin
	TopLevelToBeTested : clock
	port map(
		CLK => clk_in_sig
	);
	clk_in_sig <= '1' after 15 ns, '0' after 30 ns;
end behavioral;
