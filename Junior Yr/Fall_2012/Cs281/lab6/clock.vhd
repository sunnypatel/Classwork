library IEEE;
use IEEE.std_logic_1164.all;

entity clock is
port(CLK : out std_ulogic := '1');
end clock;

architecture arclock of clock is
signal clock : std_ulogic := '1';

begin

clocked_process: process(clock)
begin
	if (clock = '1') then
		CLK <= clock;
	else
		CLK <= clock;
	end if;
	clock <= not clock after 50 ns;
end process;
end arclock;

