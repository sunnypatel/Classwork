library IEEE;
use IEEE.std_logic_1164.all;

entity alu32 is
	port(a,b : in std_logic_vector (31 downto 0);
		CarryIn : in std_logic;lu32 is
component mux2_32

		Operation : in std_logic_vector (4 downto 0);
		Result : out std_logic_vector(31 downto 0);
		CarryOut, Overflow, Less, Zero : out std_logic);
end alu32;

----- structural code for alu32 -----
architecture structural of alu32 is
component mux2_32
	port ( a,b : in std_logic_vector(31 downto 0);
		sel: in std_logic;
		z  : out std_logic_vector(31 downto 0)
	);
end component;

component orBits
	port(a : in std_logic_vector (31 downto 0);
	     z : out std_logic);
end component;

component alu1s
 port(a,b : in std_logic;
	CarryIn : in std_logic;
	Operation : in std_logic_vector(3 downto 0);
	Result	  : out std_logic;	
	CarryOut, Overflow, Less : out std_logic);
end component;

signal ls : std_logic;
signal C,res : std_logic_vector (31 downto 0);

begin

alu1 : alu1s port map( a=> a(0),b=>b(0),Result=>res(0),CarryIn=> CarryIn,CarryOut=>C(1),Operation=>Operation(3 downto 0));

-- generate the connecting 1-bit alus
  g1: for i in 1 to 30 generate
	alu: alu1s
	port map(
		a => a(i),
		b => B(i),
		Result => res(i),
		CarryIn => C(i),
		Operation => Operation(3 downto 0),
		CarryOut => C(i+1));
  end generate;

  comp32 : alu1s port map( a=>a(31), b=>b(31),Result=>res(31),CarryIn=>C(31),CarryOut=>CarryOut,Operation=>Operation(3 downto 0),Overflow=>Overflow,Less=>ls);
  orb : orBits port map( a=>res,z=>Zero);
  Less <= ls;
  Muxx : mux2_32 port map ( a=>res, b(0)=>ls, b(31 downto 1) => "0000000000000000000000000000000", sel=>Operation(4), z=>Result);

end structural;
