library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instruction_memory_tb is
end entity;

architecture tb of instruction_memory_tb is

component instruction_memory is
generic(    width:  integer:=32;
        depth:  integer:=61;
        addr:   integer:=32);
port(   Clock:      in std_logic;
    Read_Addr:  in unsigned(addr-1 downto 0):="00000000000000000000000000000000";
    Data_out:   out unsigned(width-1 downto 0)
);

end component;
    component clock is
    port(CLK : out std_ulogic := '1');
    end component;

signal clk : std_ulogic;
signal read_addr : unsigned(31 downto 0);
signal data_out : unsigned(31 downto 0);

begin
clk_1 : clock port map(clk);
  IR : instruction_memory port map(clk,read_addr,data_out);

	process(clk)
	begin
		if(clk'EVENT AND clk = '1') then
			read_addr <= "00000000000000000000000000000000";
		end if;
	end process;

end tb;	
		
