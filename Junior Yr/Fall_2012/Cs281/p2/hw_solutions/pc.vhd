-- structural model of the 1-bit ALU on page 234

library IEEE;
use IEEE.std_logic_1164.all;




entity ProgramCounter is 
 port(clock,pcwrite : in std_logic;
      new_pc : in std_logic_vector(31 downto 0);
      pc_value : out std_logic_vector(31 downto 0));
end ProgramCounter;

architecture structural of ProgramCounter is
signal internalPC : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
begin 
clocked_process: process(clock)
begin
  if clock = '1' then
     pc_value <= new_pc;
  end if;
  pc_value <= new_pc;
 --   pc_value <= internalPC;
end process;


end structural;

	 
