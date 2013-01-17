library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity and_2 is
  port ( a        : in  std_ulogic;
	 b	: in std_ulogic;
	 clock  : in std_ulogic;
	 z 	: out std_ulogic);
end and_2;


-------------------------------------------------------------------------------
architecture ar_and_2 of and_2 is
begin  --  rtl 

  clocked_and_process : process (a,b,clock )
  begin
    if (clock'EVENT and clock = '1') then
       z <= a and b;
    end if;
  end process;
end ar_and_2;
