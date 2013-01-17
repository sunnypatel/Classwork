library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ==================================================
entity alu32b_tb is
end entity;

-- ==================================================
architecture tb of alu32b_tb is
	component alu32b is
	port (
		A,B : in unsigned (31 downto 0);
		CarryIn : in unsigned (31 downto 0);
		Op : in unsigned (2 downto 0);
		Result : out unsigned (31 downto 0);
		Zero : out std_logic;
		CarryOut : out unsigned (31 downto 0)
	);
	end component;

	signal a_t,b_t : unsigned (31 downto 0);
	signal op_t : unsigned (2 downto 0);
	signal result_t : unsigned (31 downto 0);
	signal zero_t : std_logic;
	signal carryin_t,carryout_t : unsigned (31 downto 0);

-- ==================================================
begin
	ToBeTested : alu32b port map(
		A => a_t,
		B => b_t,
		Op => op_t,
		Result => result_t,
		Zero => zero_t,
		CarryIn => carryin_t,
		CarryOut => carryout_t
	);

	process begin

	-- zeros 00000000000000000000000000000000
	-- set A = 4
	a_t <= "00000000000000000000000000000100";
	-- set B = 2
	b_t <= "00000000000000000000000000000010";

	-- case 1 perform and
	wait for 5 ns;
	op_t <= "000";
	
	
	wait for 5 ns;
	-- case 2 perform or
	wait for 5 ns;
	op_t <= "001";
	
	
	wait for 5 ns;
	-- case 3 perform add
	wait for 5 ns;
	op_t <= "010";
		
	
	wait for 5 ns;
	-- case 4 perform sub
	wait for 5 ns;
	op_t <= "110";
	
	
	wait for 5 ns;
	-- case 5 perform slt
	op_t <= "111";
	wait for 5 ns;	
	
	-- case 6 perform slt but should be false
	-- set A = 6
	a_t <= "00000000000000000000000000000110";
	-- set B = 10
	b_t <= "00000000000000000000000000001010";
	op_t <= "111";
	wait for 5 ns;

	wait;

	end process;
end tb;
