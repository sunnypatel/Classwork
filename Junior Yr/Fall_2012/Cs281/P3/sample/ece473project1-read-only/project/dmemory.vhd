-- MIPS Processor VHDL Behavioral Model
--                                              
--  Dmemory module (implements the data
--  memory for the MIPS computer)
--
-- 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY dmemory IS
        PORT(   read_data                       : OUT  STD_LOGIC_VECTOR( 31 DOWNTO 0 );
				write_data                      : IN   STD_LOGIC_VECTOR( 31 DOWNTO 0 );
                address                         : IN   STD_LOGIC_VECTOR( 7 DOWNTO 0 );         
                MemRead, Memwrite       		: IN   STD_LOGIC;
				clock,reset                 	: IN   STD_LOGIC;
                read_in                         : IN   STD_LOGIC_VECTOR(4 DOWNTO 0);
                read_out                        : OUT  STD_LOGIC_VECTOR(31 DOWNTO 0) ;
				program							: IN   STD_LOGIC_VECTOR(2 DOWNTO 0));
END dmemory;

ARCHITECTURE behavior OF dmemory IS 
   SIGNAL read_addr : STD_LOGIC_VECTOR (7 DOWNTO 0);
   TYPE DATA_RAM_5 IS ARRAY (0 to 111) OF STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL ram_5: DATA_RAM_5 := (
        X"02",
        X"00",
        X"00",
        X"00",
        X"03",
        X"00",
        X"00",
        X"00",
        X"08",
        X"00",
        X"00",
        X"00",
        X"0a",
        X"00",
        X"00",
        X"00",
        X"10",
        X"00",
        X"00",
        X"00",
        X"15",
        X"00",
        X"00",
        X"00",
        X"23",
        X"00",
        X"00",
        X"00",
        X"24",
        X"00",
        X"00",
        X"00",
        X"27",
        X"00",
        X"00",
        X"00",
        X"33",
        X"00",
        X"00",
        X"00",
        X"01",
        X"00",
        X"00",
        X"00",
        X"00",
        X"01",
        X"00",
        X"00",
        X"00",
        X"04",
        X"00",
        X"00",
        X"2d",
        X"00",
        X"00",
        X"00",
        X"00",
        X"04",
        X"00",
        X"00",
        X"00",
        X"01",
        X"00",
        X"00",
        X"01",
        X"00",
        X"00",
        X"00",
        X"33",
        X"00",
        X"00",
        X"00",
        X"27",
        X"00",
        X"00",
        X"00",
        X"24",
        X"00",
        X"00",
        X"00",
        X"23",
        X"00",
        X"00",
        X"00",
        X"15",
        X"00",
        X"00",
        X"00",
        X"10",
        X"00",
        X"00",
        X"00",
        X"0a",
        X"00",
        X"00",
        X"00",
        X"08",
        X"00",
        X"00",
        X"00",
        X"03",
        X"00",
        X"00",
        X"00",
        X"02",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00"
);
   TYPE DATA_RAM_4 IS ARRAY (0 to 255) OF STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL ram_4: DATA_RAM_4 := (
        X"08",
        X"00",
        X"00",
        X"00",
        X"0a",
        X"00",
        X"00",
        X"00",
        X"10",
        X"00",
        X"00",
        X"00",
        X"15",
        X"00",
        X"00",
        X"00",
        X"23",
        X"00",
        X"00",
        X"00",
        X"2a",
        X"00",
        X"00",
        X"00",
        X"2b",
        X"00",
        X"00",
        X"00",
        X"32",
        X"00",
        X"00",
        X"00",
        X"40",
        X"00",
        X"00",
        X"00",
        X"45",
        X"00",
        X"00",
        X"00",
        X"46",
        X"00",
        X"00",
        X"00",
        X"4d",
        X"00",
        X"00",
        X"00",
        X"52",
        X"00",
        X"00",
        X"00",
        X"53",
        X"00",
        X"00",
        X"00",
        X"54",
        X"00",
        X"00",
        X"00",
        X"5a",
        X"00",
        X"00",
        X"00",
        X"60",
        X"00",
        X"00",
        X"00",
        X"63",
        X"00",
        X"00",
        X"00",
        X"64",
        X"00",
        X"00",
        X"00",
        X"69",
        X"00",
        X"00",
        X"00",
        X"6f",
        X"00",
        X"00",
        X"00",
        X"78",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00"
	);
   TYPE DATA_RAM_3 IS ARRAY (0 to 31) OF STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL ram_3: DATA_RAM_3 := (
        X"01",
        X"00",
        X"00",
        X"00",
        X"09",
        X"00",
        X"00",
        X"00",
        X"02",
        X"00",
        X"00",
        X"00",
        X"08",
        X"00",
        X"00",
        X"00",
        X"05",
        X"00",
        X"00",
        X"00",
        X"06",
        X"00",
        X"00",
        X"00",
        X"07",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00"
   );
   TYPE DATA_RAM_2 IS ARRAY (0 to 7) OF STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL ram_2: DATA_RAM_2 := (
        X"33",
        X"00",
        X"00",
        X"00",
        X"2c",
        X"00",
        X"00",
        X"00"
   );
   TYPE DATA_RAM_1 IS ARRAY (0 to 43) OF STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL ram_1: DATA_RAM_1 := (
        X"01",
        X"00",
        X"00",
        X"00",
        X"02",
        X"00",
        X"00",
        X"00",
        X"03",
        X"00",
        X"00",
        X"00",
        X"04",
        X"00",
        X"00",
        X"00",
        X"05",
        X"00",
        X"00",
        X"00",
        X"06",
        X"00",
        X"00",
        X"00",
        X"07",
        X"00",
        X"00",
        X"00",
        X"08",
        X"00",
        X"00",
        X"00",
        X"09",
        X"00",
        X"00",
        X"00",
        X"0a",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00",
        X"00"
   );
   BEGIN
                read_addr(7 DOWNTO 7) <= "0";
                read_addr(6 DOWNTO 2) <= (read_in);
                read_addr(1 DOWNTO 0) <= "00";
       PROCESS(clock, MemRead, Memwrite, address)
           BEGIN
               IF (clock = '0' and clock'EVENT) THEN
                   IF (MemRead = '1') THEN
					  case program is
						when "000" =>
						  read_data (7 DOWNTO 0) <= ram_1(CONV_INTEGER(address));
						  read_data (15 DOWNTO 8) <= ram_1(CONV_INTEGER(address+1));
						  read_data (23 DOWNTO 16) <= ram_1(CONV_INTEGER(address+2));
						  read_data (31 DOWNTO 24) <= ram_1(CONV_INTEGER(address+3));
						when "001" =>
						  read_data (7 DOWNTO 0) <= ram_2(CONV_INTEGER(address));
						  read_data (15 DOWNTO 8) <= ram_2(CONV_INTEGER(address+1));
						  read_data (23 DOWNTO 16) <= ram_2(CONV_INTEGER(address+2));
						  read_data (31 DOWNTO 24) <= ram_2(CONV_INTEGER(address+3));
						when "010" =>
						  read_data (7 DOWNTO 0) <= ram_3(CONV_INTEGER(address));
						  read_data (15 DOWNTO 8) <= ram_3(CONV_INTEGER(address+1));
						  read_data (23 DOWNTO 16) <= ram_3(CONV_INTEGER(address+2));
						  read_data (31 DOWNTO 24) <= ram_3(CONV_INTEGER(address+3));
						when "011" =>
						  read_data (7 DOWNTO 0) <= ram_4(CONV_INTEGER(address));
						  read_data (15 DOWNTO 8) <= ram_4(CONV_INTEGER(address+1));
						  read_data (23 DOWNTO 16) <= ram_4(CONV_INTEGER(address+2));
						  read_data (31 DOWNTO 24) <= ram_4(CONV_INTEGER(address+3));
						when "100" =>
						  read_data (7 DOWNTO 0) <= ram_5(CONV_INTEGER(address));
						  read_data (15 DOWNTO 8) <= ram_5(CONV_INTEGER(address+1));
						  read_data (23 DOWNTO 16) <= ram_5(CONV_INTEGER(address+2));
						  read_data (31 DOWNTO 24) <= ram_5(CONV_INTEGER(address+3));
						when others =>
						 read_data (7 DOWNTO 0) <= ram_1(CONV_INTEGER(address));
						  read_data (15 DOWNTO 8) <= ram_1(CONV_INTEGER(address+1));
						  read_data (23 DOWNTO 16) <= ram_1(CONV_INTEGER(address+2));
						  read_data (31 DOWNTO 24) <= ram_1(CONV_INTEGER(address+3));
						end case;
                   ELSIF (Memwrite = '1') THEN
					  case program is
						when "000" =>
						  ram_1(CONV_INTEGER(address)) <= write_data (7 DOWNTO 0);
						  ram_1(CONV_INTEGER(address+1)) <= write_data (15 DOWNTO 8);
						  ram_1(CONV_INTEGER(address+2)) <= write_data (23 DOWNTO 16);
						  ram_1(CONV_INTEGER(address+3)) <= write_data (31 DOWNTO 24);   
						when "001" =>
						  ram_2(CONV_INTEGER(address)) <= write_data (7 DOWNTO 0);
						  ram_2(CONV_INTEGER(address+1)) <= write_data (15 DOWNTO 8);
						  ram_2(CONV_INTEGER(address+2)) <= write_data (23 DOWNTO 16);
						  ram_2(CONV_INTEGER(address+3)) <= write_data (31 DOWNTO 24);   
						when "010" =>
						  ram_3(CONV_INTEGER(address)) <= write_data (7 DOWNTO 0);
						  ram_3(CONV_INTEGER(address+1)) <= write_data (15 DOWNTO 8);
						  ram_3(CONV_INTEGER(address+2)) <= write_data (23 DOWNTO 16);
						  ram_3(CONV_INTEGER(address+3)) <= write_data (31 DOWNTO 24);   
						when "011" =>
						  ram_4(CONV_INTEGER(address)) <= write_data (7 DOWNTO 0);
						  ram_4(CONV_INTEGER(address+1)) <= write_data (15 DOWNTO 8);
						  ram_4(CONV_INTEGER(address+2)) <= write_data (23 DOWNTO 16);
						  ram_4(CONV_INTEGER(address+3)) <= write_data (31 DOWNTO 24);   
						when "100" =>
						  ram_5(CONV_INTEGER(address)) <= write_data (7 DOWNTO 0);
						  ram_5(CONV_INTEGER(address+1)) <= write_data (15 DOWNTO 8);
						  ram_5(CONV_INTEGER(address+2)) <= write_data (23 DOWNTO 16);
						  ram_5(CONV_INTEGER(address+3)) <= write_data (31 DOWNTO 24); 
						when others =>
							ram_1(CONV_INTEGER(address)) <= write_data (7 DOWNTO 0);
						  ram_1(CONV_INTEGER(address+1)) <= write_data (15 DOWNTO 8);
						  ram_1(CONV_INTEGER(address+2)) <= write_data (23 DOWNTO 16);
						  ram_1(CONV_INTEGER(address+3)) <= write_data (31 DOWNTO 24);
						end case;
                   END IF;
               
               
             case program is
					when "000" =>
						read_out (7 DOWNTO 0) <= ram_1(CONV_INTEGER(read_addr));
						read_out (15 DOWNTO 8) <= ram_1(CONV_INTEGER(read_addr+1));
						read_out (23 DOWNTO 16) <= ram_1(CONV_INTEGER(read_addr+2));
						read_out (31 DOWNTO 24) <= ram_1(CONV_INTEGER(read_addr+3));
					when "001" =>
						read_out (7 DOWNTO 0) <= ram_2(CONV_INTEGER(read_addr));
						read_out (15 DOWNTO 8) <= ram_2(CONV_INTEGER(read_addr+1));
						read_out (23 DOWNTO 16) <= ram_2(CONV_INTEGER(read_addr+2));
						read_out (31 DOWNTO 24) <= ram_2(CONV_INTEGER(read_addr+3));
					when "010" =>
						read_out (7 DOWNTO 0) <= ram_3(CONV_INTEGER(read_addr));
						read_out (15 DOWNTO 8) <= ram_3(CONV_INTEGER(read_addr+1));
						read_out (23 DOWNTO 16) <= ram_3(CONV_INTEGER(read_addr+2));
						read_out (31 DOWNTO 24) <= ram_3(CONV_INTEGER(read_addr+3));
					when "011" =>
						read_out (7 DOWNTO 0) <= ram_4(CONV_INTEGER(read_addr));
						read_out (15 DOWNTO 8) <= ram_4(CONV_INTEGER(read_addr+1));
						read_out (23 DOWNTO 16) <= ram_4(CONV_INTEGER(read_addr+2));
						read_out (31 DOWNTO 24) <= ram_4(CONV_INTEGER(read_addr+3));
					when "100" =>
						read_out (7 DOWNTO 0) <= ram_5(CONV_INTEGER(read_addr));
						read_out (15 DOWNTO 8) <= ram_5(CONV_INTEGER(read_addr+1));
						read_out (23 DOWNTO 16) <= ram_5(CONV_INTEGER(read_addr+2));
						read_out (31 DOWNTO 24) <= ram_5(CONV_INTEGER(read_addr+3));
				    when others =>
				      read_out (7 DOWNTO 0) <= ram_1(CONV_INTEGER(read_addr));
						read_out (15 DOWNTO 8) <= ram_1(CONV_INTEGER(read_addr+1));
						read_out (23 DOWNTO 16) <= ram_1(CONV_INTEGER(read_addr+2));
						read_out (31 DOWNTO 24) <= ram_1(CONV_INTEGER(read_addr+3));
			end case;              
			END IF; 
       END PROCESS;
   END behavior;
  