library IEEE;
use IEEE.std_logic_1164.all;

entity clock is
	port(CLK :in std_ulogic);
end clock;

architecture arclock of clock is
begin
  clock_process:process(CLK,clock)
  begin
    if (clock'EVENT and clock = '1') then
	CLK <= not CLK;
	wait for 25 ns;
    end if;
  end process;
end arclock;
