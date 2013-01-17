library IEEE;
use IEEE.std_logic_1164.all;

entity pc is
	port(
		new_pc : in std_logic_vector(31 downto 0);
		clock  : in bit;
		pc_val : out std_logic_vector(31 downto 0)
	);
end pc;

architecture archpc of pc is
	

	signal internal_pc_signal : std_logic_vector(31 downto 0);
	signal a,b,z		  : std_ulogic;
begin

	clocked_pc_process : process( new_pc, clock)
	begin
	if (clock'EVENT and clock = '1') then
	  internal_pc_signal <= new_pc;
	  -- add some random things
	  z <= a and b;
	else
	  z <= 'u';
	end if;
	end process clocked_pc_process;
	
	pc_val <= internal_pc_signal;
end archpc;
