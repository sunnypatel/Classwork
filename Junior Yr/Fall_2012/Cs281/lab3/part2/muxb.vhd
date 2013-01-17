library IEEE;
use IEEE.std_logic_1164.all;

entity mux4 is
	port(I0, I1, I2, I3 : in std_ulogic;
		Sel: in std_ulogic_vector (1 downto 0);
		Z: out std_ulogic);
end mux4;

architecture behavioral of mux4 is
begin

process(I0,I1,I2,I3,sel)
begin
case Sel is
	when "00" => Z <= I0;
	when "01" => Z <= I1;
	when "10" => Z <= I2;
	when others => Z <= I3;
end case;
end process;

end behavioral;
