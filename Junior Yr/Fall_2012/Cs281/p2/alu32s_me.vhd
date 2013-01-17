library IEEE;
use IEEE.std_logic_1164.all;

entity alu32s_me is
	port(a,b : in std_logic_vector (31 downto 0);
		bInvert : in std_logic;
		carryIn : in std_logic;
		operation : in std_logic_vector (4 downto 0);
		answer : out std_logic_vector (31 downto 0); 
		carryOut,overflow,less,zero : out std_logic);
end alu32s_me;

architecture structural of alu32s_me is

component isZero
	port(ans : in std_logic_vector(31 downto 0);
		z : out std_logic);
end component;

component alu1s
	port( a,b : in std_logic;
	      carryIn : in std_logic;
	      operation      : in std_logic_vector(3 downto 0);
	      bInvert	: in std_logic;
	      answer	: out std_logic;
	      carryOut,overflow,less	 : out std_logic 
	);
end component;
signal C,ans : std_logic_vector (31 downto 0);
begin

-- the first alu of the 32 alu seqence
box1 : alu1s port map( a=>a(0),b=>b(0), answer=>ans(0),bInvert=>bInvert,carryIn=>carryIn,carryOut=>C(0),operation=>operation(3 downto 0));

  gen: for i in 1 to 30 generate
	box: alu1s port map( 
		a => a(i),
		b => b(i),
		bInvert => bInvert,
		carryIn => C(i),
		carryOut => C(i+1),
		operation => operation(3 downto 0),
		answer => ans(i)
	);
  end generate;

box32 : alu1s port map(
		a => a(31),
		b => b(31),
		bInvert => bInvert,
		carryIn => C(31),
		carryOut => carryOut,
		operation => operation(3 downto 0),
		answer => ans(31),
		overflow => overflow
		);

zeroBits : isZero port map (ans => ans, z=>zero);

end structural;	
