library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory_tb is
end entity;

-- ================================================
architecture behavioral of memory_tb is
	
component memory is
	port(
	  address,write_data : in unsigned(31 downto 0);
	  MemWrite, MemRead : in std_logic;
	  CLK : in std_logic;
	  read_data : out unsigned(31 downto 0)
	);
end component;

signal address_t,write_data_t,read_data_t : unsigned(31 downto 0);
signal memwrite_t, memread_t : std_logic;
signal clk_t : std_logic;

-- ================================================

begin
	ToBeTested : memory port map(
		address => address_t,
		write_data => write_data_t,
		MemWrite => memwrite_t,
		MemRead => memread_t,
		read_data => read_data_t,
		CLK => clk_t
	);

	process begin
		clk_t <= '0';
		wait for 5 ns;
		clk_t <= '1';
		wait for 5 ns;
	end process;

	process begin
	address_t <= (address_t'range => '0');
	memread_t <= '0';
	write_data_t <= (write_data_t'range => '1');
	wait for 5 ns;

	-- check read mem
	memread_t <= '1';
	  
	wait for 5 ns;
	address_t <= "00000000000000000000000000000001";

        wait for 5 ns;
        address_t <= "00000000000000000000000000000010";

	wait for 5 ns;
	address_t <= "00000000000000000000000000000011";

	wait for 5 ns;
	address_t <= "00000000000000000000000000000100";

        wait for 5 ns;
        address_t <= "00000000000000000000000000000101";
        wait for 5 ns;
        address_t <= "00000000000000000000000000000110";
        wait for 5 ns;
        address_t <= "00000000000000000000000000000111";

	
	-- check write mem	
	wait for 5 ns;
	memwrite_t <= '1';
	
	-- set write data to = 23
	write_data_t <= "00000000000000000000000000010111";
        wait for 5 ns;
        address_t <= "00000000000000000000000000000001";
        wait for 5 ns;
        address_t <= "00000000000000000000000000000010";
        wait for 5 ns;
        address_t <= "00000000000000000000000000000011";
        wait for 5 ns;
        address_t <= "00000000000000000000000000000100";
        wait for 5 ns;
        address_t <= "00000000000000000000000000000101";
        wait for 5 ns;
        address_t <= "00000000000000000000000000000110";
        wait for 5 ns;
        address_t <= "00000000000000000000000000000111";

	end process;

end behavioral;
