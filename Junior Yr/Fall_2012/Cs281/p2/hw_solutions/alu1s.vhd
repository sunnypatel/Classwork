-- structural model of the 1-bit ALU on page 234

library IEEE;
use IEEE.std_logic_1164.all;




entity alu1s is 
 port(a,b,CarryIn : in std_logic;
      Operation : in std_logic_vector (3 downto 0);
	 Result, CarryOut, Overflow, Less : out std_logic);
end alu1s;

architecture structural of alu1s is
component invert
  port(a : in std_logic;
         z : out std_logic);
end component;
component and2
  port(a,b : in std_logic;
         c : out std_logic);
end component;

component or2
  port(a,b : in std_logic;
         c : out std_logic);
end component;

component and3
  port(a,b,c : in std_logic;
         z : out std_logic);
end component;

component or3
  port(a,b,c : in std_logic;
         z : out std_logic);
end component;

component full_adder
 port(a,b,c_in : in std_logic;
	 sum,c_out: out std_logic);
end component;

component xor2
	port (
		a: in std_logic;
		b: in std_logic;
		z: out std_logic
	);
end component;

component mux41
	port(I0,I1,I2,I3 : in std_logic;
		 Sel : in std_logic_vector(1 downto 0);
		 Z : out std_logic);
end component;

component mux21
	port(A,B : in std_logic;
		 S : in std_logic;
		 Z : out std_logic);
end component;

component noop
  port (a:in std_logic; z : out std_logic);
end component;

signal s1, s2, s3, bim,res,aim: std_logic;
signal ovfw : std_logic := 'X';
signal s4 : std_logic := 'X';
signal zero : std_logic := '0';
signal cout : std_logic := 'X';
signal bi : std_logic; --:= not b;
signal ai : std_logic;
begin 
  in1 : invert port map(a=>b,z=>bi);
  in2 : invert port map(a=>a,z=>ai);
  BI1  : mux21 port map(A => b, B => bi,S => Operation(2),Z => bim);
  AI1  : mux21 port map(A => a, B => ai,S => Operation(3),Z => aim);                            
  aag : and2 port map(a => aim, b => bim, c => s1);
  OG   : or2 port map(a => aim, b => bim, c => s2);
  
  FA  : full_adder port map(a => aim, b => bim, c_in => CarryIn, sum => s3, c_out => cout);
  ofw : xor2 port map(a=>cout,b=>CarryIn,z=>ovfw);
  CarryOut <= cout;
  Overflow <= ovfw;
  MUX : mux41 port map(I0 => s1, I1 => s2, I2 => s3, I3 => s4, Sel => Operation(1 downto 0), Z => res);
  
  slt : xor2 port map (a=>ovfw,b=>res,z=>Less);
  Result <= res;
end structural;

	 
