-- structural model of a full adder

library IEEE;
use IEEE.std_logic_1164.all;

entity full_adders is 
 port(a,b,c_in : in std_logic;
	 sum,c_out: out std_logic);
end full_adders;

architecture structural of full_adders is

component half_adder
  port(a,b : in std_logic;
       sum,carry : out std_logic);
end component;

component or2
  port(a,b : in std_logic;
       c : out std_logic);
end component;

signal s1, s2, s3 : std_logic;

begin
  HA1 : half_adder port map(a => a, b => b, sum => s1, carry => s3);
  HA2 : half_adder port map(a => s1, b => c_in, sum => sum, carry => s2);
  O1  : or2 port map(a => s2, b => s3, c => c_out);
end structural;

	 
