-- AND
library IEEE;
use IEEE.std_logic_1164.all;

entity and_3 is 
   port( a, b,c : in std_logic;
               d : out std_logic);
end and_3;

architecture func of and_3 is 
begin
   d <= a and b and c; 
end func;

--OR 

library IEEE;
use IEEE.std_logic_1164.all;

entity or_3 is 
   port( a, b : in std_logic;
            c : out std_logic);
end or_3;

architecture func of or_3 is 
begin
   c <= a or b;
end func;

--NOT

library IEEE;
use IEEE.std_logic_1164.all;

entity not_3 is 
   port( i : in std_logic;
         o : out std_logic);
end not_3;
--
architecture func of not_3 is 
begin
   o <= not i;
end func;

library IEEE;
use IEEE.std_logic_1164.all;

entity mux4 is 
	port (I0,I1,I2,I3: in std_logic;
		S0,S1 	: in std_logic;
		F	: out std_logic);
end mux4;

architecture structural of mux4 is
	component and_3 is
	   port ( a, b, c : in std_logic;
			F : out std_logic);
	end component;

	component or_3 is
	   port (a, b : in std_logic;
		    f : out std_logic);
	end component; 

	component not_3 is
	   port (inBit : in std_logic;
		outBit : out std_logic);
	end component;

signal notOut0, notOut1 : STD_LOGIC;
signal andOut1, andOut2, andOut3, andOut4 : STD_LOGIC;
signal or1, or2, or3 	: STD_LOGIC;

begin
	F1: not_3 port map (S0, notOut0);
	F2: not_3 port map (S1, notOut1);
	
	F3: and_3 port map (notOut1, notOut0, I0, andOut1);
	F4: and_3 port map (notOut1, S0, I1, andOut2);
	F5: and_3 port map (S1, notOut0, I2, andOut3);
	F6: and_3 port map (S1, S0, I3, andOut4);
	F7: or_3 port map (andOut1, andOut2, or1);
	F8: or_3 port map (andOut3, andOut4, or2);
	F9: or_3 port map (or1, or2, F);
end structural;	
