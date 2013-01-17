-- MIPS Processor VHDL Behavioral Model
--
-- ALU module (implements the data ALU and Branch Address Adder)
--
-- 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY  ZEROfinder IS
	PORT(	Read_data_1 		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Read_data_2 		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Zero				: OUT	STD_LOGIC);
END ZEROfinder;

ARCHITECTURE behavior OF ZEROfinder IS
BEGIN
	Zero <= '1' 
		WHEN ( Read_data_1 = Read_data_2  )
		ELSE '0';    
END behavior;