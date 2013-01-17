-- MIPS Processor VHDL Behavioral Model
--
-- this module calculates the sum for relative branch instructions
--
-- 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY  pccalc IS
	PORT(	Add_Result 		: OUT	STD_LOGIC_VECTOR( 9 DOWNTO 0 );	
			Sign_extend 	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );			
			PC_plus_4 		: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 )	);
END pccalc;

ARCHITECTURE behavior OF pccalc IS
SIGNAL Branch_Add 			: STD_LOGIC_VECTOR( 9 DOWNTO 0 );
BEGIN
	Branch_Add	<= PC_plus_4( 9 DOWNTO 0 ) +  Sign_extend( 9 DOWNTO 0 ) ;
-- put the calculated sum on the output
	Add_result 	<= Branch_Add( 9 DOWNTO 0 );

END behavior;
