-- MIPS Processor VHDL Behavioral Model
--
-- Ifetch module (provides the PC and instruction memory) 
-- 

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Ifetch IS
        PORT(   SIGNAL Instruction              : OUT   STD_LOGIC_VECTOR( 31 DOWNTO 0 );
                SIGNAL PC_plus_4        : OUT   STD_LOGIC_VECTOR( 9 DOWNTO 0 );
                SIGNAL PC                       : IN    STD_LOGIC_VECTOR( 9 DOWNTO 0 );
                SIGNAL PC_out                   : OUT   STD_LOGIC_VECTOR( 9 DOWNTO 0 );
                SIGNAL clock, reset     : IN    STD_LOGIC;
				SIGNAL program			: IN STD_LOGIC_VECTOR(2 DOWNTO 0));
END Ifetch;

ARCHITECTURE behavior OF Ifetch IS
   SIGNAL MemAddr : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL Zero    : STD_LOGIC_VECTOR(7 DOWNTO 0);
   TYPE INST_MEM_1 IS ARRAY (0 to 7) of STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL iram_1 : INST_MEM_1 := (
X"3c011001",
X"34280000",
X"00008020",
X"8d0a0000",
X"020a8020",
X"21080004",
X"1540fffc",
X"08100007");
   TYPE INST_MEM_2 IS ARRAY (0 to 19) of STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL iram_2 : INST_MEM_2 := (
X"3c011001", 
X"34280000", 
X"8d090000", 
X"8d0a0004", 
X"00001020", 
X"00006820", 
X"20030004", 
X"314c0001", 
X"34010000", 
X"102c0002", 
X"20630001", 
X"00491020", 
X"000a5042", 
X"00094840", 
X"21ad0001", 
X"20630008", 
X"34010010", 
X"142dfff5", 
X"20630002",
X"08100013");
   TYPE INST_MEM_3 IS ARRAY (0 to 40) of STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL iram_3 : INST_MEM_3 := (
X"001f8021", 
X"3c010000", 
X"34310007", 
X"3c011001", 
X"34240000", 
X"02202821", 
X"0c100010", 
X"00a04821",
X"00804021",
X"8d0d0000",
X"2129ffff",
X"21080004",
X"34010000",
X"1429fffc",
X"00000000",
X"0810000f",
X"00a06021", 
X"01804821", 
X"00804021", 
X"8d0a0000", 
X"8d0b0004", 
X"016a082a", 
X"10200003", 
X"00000000", 
X"ad0a0004", 
X"ad0b0000", 
X"21080004", 
X"8d0a0000", 
X"2129ffff", 
X"34010001", 
X"1429fff4", 
X"00000000", 
X"218cffff", 
X"34010001", 
X"142cffee", 
X"00804021", 
X"00a04821", 
X"00094880", 
X"01094820", 
X"8d22fffc", 
X"03e00008");
   TYPE INST_MEM_4 IS ARRAY (0 to 33) of STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL iram_4 : INST_MEM_4 := (
X"3c010000", 
X"3424002a", 
X"3c011001", 
X"34250000", 
X"3c011001", 
X"34260060", 
X"20c6fffc", 
X"0c100009", 
X"08100008",
X"23bdfffc", 
X"afbf0000", 
X"00c54023", 
X"15000006", 
X"00051021", 
X"8c480000", 
X"1088000f", 
X"3c010000", 
X"34220000", 
X"0810001f", 
X"000840c2", 
X"00084080", 
X"00a81021", 
X"8c480000", 
X"10880007", 
X"0088082a", 
X"14200003",
X"20450004", 
X"0c100009", 
X"0810001f", 
X"00023021", 
X"0c100009", 
X"8fbf0000", 
X"23bd0004",
X"03e00008");
   TYPE INST_MEM_5 IS ARRAY (0 to 26) of STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL iram_5 : INST_MEM_5 := (
X"3c011001", 
X"34250000", 
X"3c011001", 
X"34260070", 
X"20110000", 
X"20120000", 
X"00a04825", 
X"01205025", 
X"8d4b0000", 
X"11600002", 
X"214a0004", 
X"08100008", 
X"214afffc", 
X"0149082a",
X"14200006", 
X"8d2b0000", 
X"8d4c0000", 
X"156c0005", 
X"21290004", 
X"214afffc", 
X"0810000d", 
X"20110001", 
X"08100019", 
X"2011ffff", 
X"08100019",
X"20120001", 
X"0810001a"

   );

BEGIN                                           
                                                
-- set the memory address
-- start the Zero flag as Zero
        MemAddr <= PC(9 DOWNTO 2);
        Zero <= X"00";
        PROCESS
                BEGIN
                        WAIT UNTIL ( clock'EVENT ) AND ( clock = '1' );
-- if reset then need to reset the program counter and print the first
-- instruction for selected program
                        IF reset = '1' THEN
                            PC_out <= "0000000000" ;
                            PC_plus_4 <= "0000000000"; 
							case program is
								when "000" => 
									Instruction <= iram_1(CONV_INTEGER(Zero));
								when "001" => 
									Instruction <= iram_2(CONV_INTEGER(Zero));
								when "010" => 
									Instruction <= iram_3(CONV_INTEGER(Zero));
								when "011" => 
									Instruction <= iram_4(CONV_INTEGER(Zero));
								when "100" => 
									Instruction <= iram_5(CONV_INTEGER(Zero));
								when others =>
									Instruction <= iram_1(CONV_INTEGER(Zero));
							end case;

                        ELSE
-- if not reseting copy the PC to the output and the incremented pc
                                        PC_out <= PC;
                                        -- copy output signals - allows read inside module
   
                                        PC_plus_4( 9 DOWNTO 2 )  <= PC( 9 DOWNTO 2 ) + 1;
                                        PC_plus_4( 1 DOWNTO 0 )  <= "00";
-- output the corresponding instruction for selected program
							case program is
								when "000" => 
									Instruction <= iram_1(CONV_INTEGER(MemAddr));
								when "001" => 
									Instruction <= iram_2(CONV_INTEGER(MemAddr));
								when "010" => 
									Instruction <= iram_3(CONV_INTEGER(MemAddr));
								when "011" => 
									Instruction <= iram_4(CONV_INTEGER(MemAddr));
								when "100" => 
									Instruction <= iram_5(CONV_INTEGER(MemAddr));
								when others =>
									Instruction <= iram_1(CONV_INTEGER(MemAddr));
							end case;
                        END IF;
        END PROCESS;
END behavior;
