library IEEE;
use IEEE.std_logic_1164.all;

entity adder_testbench is
--	port (
--		sum, carry: out std_ulogic
--	);
end adder_testbench;

architecture structural of adder_testbench is

component half_adder
 port(a,b : in std_ulogic;
	 sum,carry: out std_ulogic);
end component;

   signal myA, myB, mySum, myC_out : std_ulogic;

begin
   TB: half_adder 
	port map (
	a => myA,
	b => myB,
	sum => mySum,
	carry => myC_out
	);
   
--   sum <= mySum;
--   carry <= myC_out;
      
        myA <= '0' after 0 ns,  '1' after 30 ns, '0' after 60 ns;
        myB <= '0' after 0 ns,  '1' after 15 ns, '0' after 30 ns, '1' after 45 ns, '0' after 60 ns, '1' after 75 ns;

end structural;

