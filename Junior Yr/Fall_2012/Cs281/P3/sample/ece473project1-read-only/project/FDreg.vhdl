LIBRARY IEEE;                         
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY FDreg IS
    PORT(        clock                      : IN    STD_LOGIC;
                 instruction				: IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
                 PC							: IN 	STD_LOGIC_VECTOR(9 DOWNTO 0);
                 PC_plus_4					: IN 	STD_LOGIC_VECTOR(9 DOWNTO 0);
                 instruction_fd				: OUT 	STD_LOGIC_VECTOR(31 DOWNTO 0);
                 PC_fd						: OUT 	STD_LOGIC_VECTOR(9 DOWNTO 0);
                 PC_plus_4_fd				: OUT 	STD_LOGIC_VECTOR(9 DOWNTO 0) );
END FDreg;

ARCHITECTURE behavior OF FDreg IS
    SIGNAL RegDst_int			: STD_LOGIC;
	SIGNAL instruction_int		: STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL PC_int				: STD_LOGIC_VECTOR(9 DOWNTO 0);
    SIGNAL PC_plus_4_int		: STD_LOGIC_VECTOR(9 DOWNTO 0);
       
BEGIN
       instruction_fd <= instruction_int;
       PC_fd <= PC_int;
       PC_plus_4_fd <= PC_plus_4_int;

PROCESS
       BEGIN
          WAIT UNTIL RISING_EDGE(clock);
          instruction_int <= instruction;
          PC_int <= PC;
          PC_plus_4_int <= PC_plus_4;
       END PROCESS;
END behavior;