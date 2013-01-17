-- structural model of the 1-bit ALU on page 234

library IEEE;
use IEEE.std_logic_1164.all;




entity clock is 
 port(clock : out std_logic);
end clock;

architecture structural of clock is

signal in_clock : std_logic:='1';
begin 
clocked_process: process(in_clock)
begin
    if (in_clock = '1') then
       clock <= '1';
    else
      clock <= '0';
    end if;
    in_clock <= not in_clock after 50 ns;
end process;


end structural;

	 
