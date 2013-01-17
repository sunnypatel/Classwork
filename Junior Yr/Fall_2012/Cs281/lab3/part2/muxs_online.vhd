
-------------------------------------------------------------
-- Author   : http://www.teahlab.com/
--
-- Circuit  : Four-to-One Multiplexer
--
-- Structure:
-- 
--     From a basic gates perspective, a 4-to-1 Mux is 
--     constituted of four 3-input AND gates, three OR gates,
--     and two Inverters. When we speak of structural design 
--     in VHDL, we mean precisely the description a circuit 
--     by presenting its constituent components and 
--     interconnecting wires. The following VHDL program is a
--     structural design of the 4-to-1 multiplexer. As such
--     the circuit is designed in two stages:
--
--     In stage one we define the basic entities: 
--     AND, OR, NOT. 
--     In stage two we use the basic entities to construct 
--     the Mux.					
--					 
--     One of the advantages of structural designs is that
--     from the VHDL program you can tell what the physical 
--     circuit looks like.
--
--     It is very important to learn structural design (RTL)
--     strategies because as your assignments become larger 
--     and larger, knowledge of register transfer level (RTL)
--     design strategies become indispensable.
-------------------------------------------------------------

                        -- This is the AND gate
library ieee;
use ieee.std_logic_1164.all;

entity andGate is 
   port( A, B, C : in std_logic;
               F : out std_logic);
end andGate;

architecture func of andGate is 
begin
   F <= A and B and C; 
end func;
--*============================
                        -- This is the OR gate
library ieee;
use ieee.std_logic_1164.all;

entity orGate is 
   port( A, B : in std_logic;
            F : out std_logic);
end orGate;

architecture func of orGate is 
begin
   F <= A or B;
end func;
--*============================
                        -- This is the NOT gate
library ieee;
use ieee.std_logic_1164.all;

entity notGate is 
   port( inPort : in std_logic;
        outPort : out std_logic);
end notGate;
--
architecture func of notGate is 
begin
   outPort <= not inPort;
end func;
--*==========================*=========================

-- Now we write the RTL definition for the 4-to-1 Mux
library ieee;
use ieee.std_logic_1164.all;

entity Mux_4_to_1 is
   port( D0, D1, D2, D3: in std_logic; -- the data lines
        S0, S1 : in std_logic; -- the selector switches
             F : out std_logic);-- the output
end Mux_4_to_1;
--
architecture Func of Mux_4_to_1 is

   component andGate is         --import AND Gate entity
      port( A, B, C : in std_logic;
                  F : out std_logic);
   end component;
 
   component orGate is          --import OR Gate entity
      port( A, B : in std_logic;
               F : out std_logic);
   end component;

   component notGate is         --import NOT Gate entity
      port( inPort : in std_logic;
           outPort : out std_logic);
   end component;

   signal invOut0, invOut1  : std_logic;
   signal andOut1, andOut2, andOut3, andOut4 : std_logic;
   signal orTop, orBot, orOut  : std_logic;

begin
   -- Just like the real circuit, there are 
   -- four components: G1 to G4
   GI1: notGate  port map(S0, invOut0);
   GI2: notGate  port map(S1, invOut1);

   GA1: andGate  port map(invOut1, invOut0, D0, andOut1);
   GA2: andGate  port map(invOut1, S0, D1, andOut2);
   GA3: andGate  port map(S1, invOut0, D2, andOut3);
   GA4: andGate  port map(S1, S0, D3, andOut4);

   GO1: orGate   port map(andOut1, andOut2, orTop);
   GO2: orGate   port map(andOut3, andOut4, orBot);
   GO3: orGate   port map(orTop, orBot, F);           -- F

end Func;
---------------------------------------------------------END
---------------------------------------------------------END
