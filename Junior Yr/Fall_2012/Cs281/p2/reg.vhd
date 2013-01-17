library ieee;
use ieee.std_logic_1164.all;

entity reg is
	port( I	: in std_logic_vector (31 downto 0);
		CLK,RegWrite : in std_logic;
	      O : out std_logic_vector (31 downto 0)
	);
end reg;

-- ======================================================
-- ======================================================
architecture behavioral of reg is 

signal o_temp : std_logic_vector (31 downto 0);

-- =====================================================
begin 
  
  clocked_process : process(I,CLK,RegWrite)
  begin
	if(CLK = '1' and CLK'event) then
	  if(RegWrite = '1') then
	    o_temp <= I;
	  end if;
	end if;
  end process;
  -- result

  O <= o_temp; 
--  O <= "00000000000000000000000000000001";
end behavioral;
