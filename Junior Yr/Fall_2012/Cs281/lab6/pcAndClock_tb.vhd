library IEEE;
use IEEE.std_logic_1164.all;

entity pcandclock_tb is
	port(
		new_pc : in std_logic_vector(31 downto 0);
--		clock  : in bit;
		pc_val : out std_logic_vector(31 downto 0)
	);
end pcandclock_tb;

architecture archpc of pcandclock_tb is

component clock is
	port ( 
		CLK : out std_ulogic := '1'
	);
end component;

	signal CLK : std_ulogic := '1';
	signal internal_pc_signal : std_logic_vector(31 downto 0);
	signal a		  : std_ulogic := '1';
	signal b		  : std_ulogic := '1';
	signal z		  : std_ulogic;
begin
	clockLevel : clock
	port map(
		CLK => CLK
	);

	clocked_pc_process : process( new_pc,CLK)
	begin
	if (CLK'EVENT and CLK = '1') then
	  internal_pc_signal <= new_pc;
	  -- add some random things
	  z <= a and b;
	else
	  z <= '0';	
	end if;
	end process clocked_pc_process;
	
	pc_val <= internal_pc_signal;
end archpc;
