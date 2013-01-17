library IEEE;
use IEEE.std_logic_1164.all;

entity tb is
end entity;

architecture behavioral of tb is

	component clock is
		port(clock : inout bit);
	end component;
	
	component pc is
		port( new_pc : in std_logic_vector(31 downto 0);
			clock : in bit;
			pc_val : out std_logic_vector(31 downto 0);
	end component;

	signal clock_tb : bit;
	signal new_pc_tb, pc_val_tb : std_logic_vector(31 downto 0);

begin
	mapping: pc port map(
			new_pc => new_pc_tb,
			pc_val => pc_val_tb,
			clock => clock_tb
		);

	if(clock'EVENT and clock ='1') then
		pc_val_tb <= new_pc_tb;
	end if;
end tb;  
