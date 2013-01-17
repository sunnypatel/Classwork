library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg is
	port( 
		Clock,RegWrite,RegDst : in std_logic;
		Instruction : in unsigned (31 downto 0);
		Write_data : in unsigned (31 downto 0);
		Read_data_1 : out unsigned (31 downto 0);
		Read_data_2 : out unsigned (31 downto 0)
	
	);
end reg;

-- ======================================================
-- ======================================================
architecture behavioral of reg is 
type register_file is array ( 0 to 31 ) of unsigned (31 downto 0);

signal register_array : register_file;
signal write_reg_addr : unsigned( 4 downto 0);
signal read_reg_1_addr : unsigned( 4 downto 0);
signal read_reg_2_addr : unsigned( 4 downto 0);
signal write_reg_addr_1 : unsigned( 4 downto 0);
signal write_reg_addr_0 : unsigned( 4 downto 0);
signal write_data_1 : unsigned (31 downto 0);

-- convert memory addr to integer for memory array addr!
function conv_integer(X: unsigned) return INTEGER is
variable result: INTEGER;
begin
    result := 0;
    for i in X'range loop
        result := result * 2;
        case X(i) is
            when '0' | 'L' => null;
            when '1' | 'H' => result := result + 1;
            when others => null;
        end case;
    end loop;
    return result;
end conv_integer;


-- =====================================================
begin 
	read_reg_1_addr <= Instruction( 25 downto 21);
	read_reg_2_addr <= Instruction( 20 downto 16);
	-- the two possible write addresses
	write_reg_addr_0 <= Instruction( 15 downto 11); 
	write_reg_addr_1 <= Instruction( 20 downto 16);
	
	-- output register values
	Read_data_1 <= register_array( conv_integer(read_reg_1_addr));
	Read_data_2 <= register_array( conv_integer(read_reg_2_addr));

	-- mux for selecting the correct write address
	write_reg_addr <= write_reg_addr_1
		when RegDst ='1' else write_reg_addr_0;

		--=================================--
process
	begin
	wait until Clock'event and Clock = '1';
	if RegWrite = '1' and write_reg_addr /= 0 then
		register_array( conv_integer(write_reg_addr)) <= Write_data;
	end if;
end process;

end behavioral;
