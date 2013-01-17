library IEEE;
use IEEE.std_logic_1164.all;

entity  tb_halfadderb is
end entity;

architecture behavioral of  tb_halfadderb is

component half_adder is
	port (
		a: in STD_LOGIC;
		b: in STD_LOGIC;
		sum: out STD_LOGIC;
		carry: out STD_LOGIC
	);
end component;

signal a_in, b_in, sum_out, carry_out  :  STD_LOGIC;

begin

  TopLevelToBeTested : half_adder
    port map(
    a => a_in,
    b => b_in, 
    sum => sum_out,
    carry => carry_out
    );

    	a_in <= '0' after 0 ns,  '1' after 30 ns, '0' after 60 ns;
    	b_in <= '0' after 0 ns,  '1' after 15 ns, '0' after 30 ns, '1' after 45 ns, '0' after 60 ns, '1' after 75 ns;

end behavioral;



