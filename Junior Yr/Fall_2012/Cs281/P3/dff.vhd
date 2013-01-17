library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dff is
port(
	Input_data:	in std_logic;
	Clock:		in std_logic;
	Output_data:	out std_logic
);
end dff;


architecture behavioral of dff is
begin

    process(Input_data, Clock)
    begin

	if (Clock='1' and clock'event) then
	    Output_data <= Input_data;
	end if;

    end process;	
end behavioral;
