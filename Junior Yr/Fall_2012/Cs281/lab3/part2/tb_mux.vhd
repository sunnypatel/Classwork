library IEEE;
use IEEE.std_logic_1164.all;

entity tb_mux is
end tb_mux;

architecture behavior of tb_mux is
	
	component mux4 is
		port(
			I0, I1, I2, I3 : in std_logic;
			S0		: in std_logic;
			F		: out std_logic);
	end component;

	signal I0_tb,I1_tb,I2_tb,I3_tb,S0_tb,F_tb : std_logic;
	signal selectors : std_logic_vector(1 downto 0);

begin
	mapping: mux4 port map(
			I0 => I0_tb,
			I1 => I1_tb,
			I2 => I2_tb,
			I3 => I3_tb,
			S0 => S0_tb,
			F  => F_tb);
	
	S0_tb <= '0'; I0_tb <= '0'; I1_tb <= '0'; I2_tb <= '0'; I3_tb <= '0' after 0 ns;			
	S0_tb <= '0'; I0_tb <= '0'; I1_tb <= '0'; I2_tb <= '0'; I3_tb <= '1' after 5 ns;			
	S0_tb <= '0'; I0_tb <= '0'; I1_tb <= '0'; I2_tb <= '0'; I3_tb <= '0' after 10 ns;			
	S0_tb <= '0'; I0_tb <= '0'; I1_tb <= '0'; I2_tb <= '0'; I3_tb <= '1' after 15 ns;
	S0_tb <= '0'; I0_tb <= '0'; I1_tb <= '0'; I2_tb <= '1'; I3_tb <= '0' after 20 ns;			
	S0_tb <= '0'; I0_tb <= '0'; I1_tb <= '0'; I2_tb <= '1'; I3_tb <= '1' after 25 ns;			
	S0_tb <= '0'; I0_tb <= '0'; I1_tb <= '0'; I2_tb <= '1'; I3_tb <= '0' after 30 ns;			
	S0_tb <= '0'; I0_tb <= '0'; I1_tb <= '0'; I2_tb <= '1'; I3_tb <= '1' after 35 ns;
	S0_tb <= '0'; I0_tb <= '0'; I1_tb <= '1'; I2_tb <= '0'; I3_tb <= '0' after 40 ns;			
	S0_tb <= '0'; I0_tb <= '0'; I1_tb <= '1'; I2_tb <= '0'; I3_tb <= '1' after 45 ns;			
	S0_tb <= '0'; I0_tb <= '0'; I1_tb <= '1'; I2_tb <= '0'; I3_tb <= '0' after 50 ns;			
	S0_tb <= '0'; I0_tb <= '0'; I1_tb <= '1'; I2_tb <= '0'; I3_tb <= '1' after 65 ns;
	S0_tb <= '0'; I0_tb <= '0'; I1_tb <= '1'; I2_tb <= '1'; I3_tb <= '0' after 70 ns;			
	S0_tb <= '0'; I0_tb <= '0'; I1_tb <= '1'; I2_tb <= '1'; I3_tb <= '1' after 75 ns;			
	S0_tb <= '0'; I0_tb <= '0'; I1_tb <= '1'; I2_tb <= '1'; I3_tb <= '0' after 80 ns;			
	S0_tb <= '0'; I0_tb <= '0'; I1_tb <= '1'; I2_tb <= '1'; I3_tb <= '1' after 85 ns;
	S0_tb <= '0'; I0_tb <= '1'; I1_tb <= '0'; I2_tb <= '0'; I3_tb <= '0' after 90 ns;			
	S0_tb <= '0'; I0_tb <= '1'; I1_tb <= '0'; I2_tb <= '0'; I3_tb <= '1' after 95 ns;			
	S0_tb <= '0'; I0_tb <= '1'; I1_tb <= '0'; I2_tb <= '0'; I3_tb <= '0' after 100 ns;			
	S0_tb <= '0'; I0_tb <= '1'; I1_tb <= '0'; I2_tb <= '0'; I3_tb <= '1' after 105 ns;
	S0_tb <= '0'; I0_tb <= '1'; I1_tb <= '0'; I2_tb <= '1'; I3_tb <= '0' after 110 ns;		
	S0_tb <= '0'; I0_tb <= '1'; I1_tb <= '0'; I2_tb <= '1'; I3_tb <= '1' after 115 ns;			
	S0_tb <= '0'; I0_tb <= '1'; I1_tb <= '0'; I2_tb <= '1'; I3_tb <= '0' after 120 ns;			
	S0_tb <= '0'; I0_tb <= '1'; I1_tb <= '0'; I2_tb <= '1'; I3_tb <= '1' after 125 ns;
	S0_tb <= '0'; I0_tb <= '1'; I1_tb <= '1'; I2_tb <= '0'; I3_tb <= '0' after 130 ns;			
	S0_tb <= '0'; I0_tb <= '1'; I1_tb <= '1'; I2_tb <= '0'; I3_tb <= '1' after 135 ns;			
	S0_tb <= '0'; I0_tb <= '1'; I1_tb <= '1'; I2_tb <= '0'; I3_tb <= '0' after 140 ns;			
	S0_tb <= '0'; I0_tb <= '1'; I1_tb <= '1'; I2_tb <= '0'; I3_tb <= '1' after 145 ns;
	S0_tb <= '0'; I0_tb <= '1'; I1_tb <= '1'; I2_tb <= '1'; I3_tb <= '0' after 150 ns;			
	S0_tb <= '0'; I0_tb <= '1'; I1_tb <= '1'; I2_tb <= '1'; I3_tb <= '1' after 155 ns;			
	S0_tb <= '0'; I0_tb <= '1'; I1_tb <= '1'; I2_tb <= '1'; I3_tb <= '0' after 160 ns;			
	S0_tb <= '0'; I0_tb <= '1'; I1_tb <= '1'; I2_tb <= '1'; I3_tb <= '1' after 165 ns;

	S0_tb <= '1'; I0_tb <= '0'; I1_tb <= '0'; I2_tb <= '0'; I3_tb <= '0' after 170 ns;			
	S0_tb <= '1'; I0_tb <= '0'; I1_tb <= '0'; I2_tb <= '0'; I3_tb <= '1' after 175 ns;			
	S0_tb <= '1'; I0_tb <= '0'; I1_tb <= '0'; I2_tb <= '0'; I3_tb <= '0' after 180 ns;			
	S0_tb <= '1'; I0_tb <= '0'; I1_tb <= '0'; I2_tb <= '0'; I3_tb <= '1' after 185 ns;
	S0_tb <= '1'; I0_tb <= '0'; I1_tb <= '0'; I2_tb <= '1'; I3_tb <= '0' after 190 ns;			
	S0_tb <= '1'; I0_tb <= '0'; I1_tb <= '0'; I2_tb <= '1'; I3_tb <= '1' after 195 ns;			
	S0_tb <= '1'; I0_tb <= '0'; I1_tb <= '0'; I2_tb <= '1'; I3_tb <= '0' after 200 ns;			
	S0_tb <= '1'; I0_tb <= '0'; I1_tb <= '0'; I2_tb <= '1'; I3_tb <= '1' after 205 ns;
	S0_tb <= '1'; I0_tb <= '0'; I1_tb <= '1'; I2_tb <= '0'; I3_tb <= '0' after 210 ns;			
	S0_tb <= '1'; I0_tb <= '0'; I1_tb <= '1'; I2_tb <= '0'; I3_tb <= '1' after 215 ns;			
	S0_tb <= '1'; I0_tb <= '0'; I1_tb <= '1'; I2_tb <= '0'; I3_tb <= '0' after 220 ns;			
	S0_tb <= '1'; I0_tb <= '0'; I1_tb <= '1'; I2_tb <= '0'; I3_tb <= '1' after 225 ns;
	S0_tb <= '1'; I0_tb <= '0'; I1_tb <= '1'; I2_tb <= '1'; I3_tb <= '0' after 230 ns;			
	S0_tb <= '1'; I0_tb <= '0'; I1_tb <= '1'; I2_tb <= '1'; I3_tb <= '1' after 235 ns;			
	S0_tb <= '1'; I0_tb <= '0'; I1_tb <= '1'; I2_tb <= '1'; I3_tb <= '0' after 240 ns;			
	S0_tb <= '1'; I0_tb <= '0'; I1_tb <= '1'; I2_tb <= '1'; I3_tb <= '1' after 245 ns;
	S0_tb <= '1'; I0_tb <= '1'; I1_tb <= '0'; I2_tb <= '0'; I3_tb <= '0' after 250 ns;			
	S0_tb <= '1'; I0_tb <= '1'; I1_tb <= '0'; I2_tb <= '0'; I3_tb <= '1' after 255 ns;			
	S0_tb <= '1'; I0_tb <= '1'; I1_tb <= '0'; I2_tb <= '0'; I3_tb <= '0' after 260 ns;			
	S0_tb <= '1'; I0_tb <= '1'; I1_tb <= '0'; I2_tb <= '0'; I3_tb <= '1' after 265 ns;
	S0_tb <= '1'; I0_tb <= '1'; I1_tb <= '0'; I2_tb <= '1'; I3_tb <= '0' after 270 ns;		
	S0_tb <= '1'; I0_tb <= '1'; I1_tb <= '0'; I2_tb <= '1'; I3_tb <= '1' after 275 ns;			
	S0_tb <= '1'; I0_tb <= '1'; I1_tb <= '0'; I2_tb <= '1'; I3_tb <= '0' after 280 ns;			
	S0_tb <= '1'; I0_tb <= '1'; I1_tb <= '0'; I2_tb <= '1'; I3_tb <= '1' after 285 ns;
	S0_tb <= '1'; I0_tb <= '1'; I1_tb <= '1'; I2_tb <= '0'; I3_tb <= '0' after 290 ns;			
	S0_tb <= '1'; I0_tb <= '1'; I1_tb <= '1'; I2_tb <= '0'; I3_tb <= '1' after 295 ns;			
	S0_tb <= '1'; I0_tb <= '1'; I1_tb <= '1'; I2_tb <= '0'; I3_tb <= '0' after 300 ns;			
	S0_tb <= '1'; I0_tb <= '1'; I1_tb <= '1'; I2_tb <= '0'; I3_tb <= '1' after 305 ns;
	S0_tb <= '1'; I0_tb <= '1'; I1_tb <= '1'; I2_tb <= '1'; I3_tb <= '0' after 310 ns;			
	S0_tb <= '1'; I0_tb <= '1'; I1_tb <= '1'; I2_tb <= '1'; I3_tb <= '1' after 315 ns;			
	S0_tb <= '1'; I0_tb <= '1'; I1_tb <= '1'; I2_tb <= '1'; I3_tb <= '0' after 320 ns;			
	S0_tb <= '1'; I0_tb <= '1'; I1_tb <= '1'; I2_tb <= '1'; I3_tb <= '1' after 325 ns;

end;
