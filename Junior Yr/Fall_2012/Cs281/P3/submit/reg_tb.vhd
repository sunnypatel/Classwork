library ieee;
use ieee.std_logic_1164.all;

entity reg_tb is
end entity;

-- =================================================

architecture tb of reg_tb is

	component reg is
	port(
		I : in std_logic_vector (31 downto 0);
		CLK, RegWrite : in std_logic;
		O : out std_logic_vector (31 downto 0)
	);
	end component;

	signal i_t,o_t : std_logic_vector (31 downto 0);
	signal regwrite_t : std_logic;
	signal clk_t : std_logic := '0';

begin
	TopLevelToBeTested : reg port map (
		I => i_t,
		CLK =>  clk_t,
		RegWrite => regwrite_t,
		O => o_t
	);

	process begin
		clk_t <= '0';
		wait for 5 ns;
		clk_t <= '1';
		wait for 5 ns;
	end process;

	process begin

	-- set input signal equal to 37
	i_t <= "00000000000000000000000000100101";
	regwrite_t <= '0'; -- reg write flag is turned off to start
	
	-- case 1 : register write flag is on, and clk should be 0 for the first 5ns
	-- 	    and then clk should be on, and i_t == o_t
	regwrite_t <= '1';
	wait for 10 ns;

	-- case 2 : register write flag is off, and clk should be 0 for the next 5ns(11-15ns)
	-- 	    and then clk should be on, and i_t != o_t
	regwrite_t <= '0';
	wait for 10 ns;
	wait;
	end process;
	
	
end tb;		
