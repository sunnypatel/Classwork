library IEEE;
use IEEE.std_logic_1164.all;

entity clock is
port(CLK : out std_ulogic := '1');
end clock;

architecture arclock of clock is
constant num_cycles : integer := 320;
signal clock : std_ulogic := '1';

begin

process
begin
	for i in 1 to num_cycles loop
	  CLK <= clock;
	  wait for 25 ns;--change value after half period
	  clock <= not clock;
	  CLK <= clock;
	  wait for 25 ns;
	end loop;
	
	wait;
end process;
end arclock;

