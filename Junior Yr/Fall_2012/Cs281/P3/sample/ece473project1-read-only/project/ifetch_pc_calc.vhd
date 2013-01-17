-- MIPS Processor VHDL Behavioral Model
--
-- Ifetch module (provides the PC and instruction memory) 
-- 

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ifetch_pc_calc IS
	PORT(	SIGNAL PC_plus_4 			: OUT	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
        	SIGNAL PC 					: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
      		SIGNAL PC_out 				: OUT	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
        	SIGNAL clock, reset		 	: IN 	STD_LOGIC);
END ifetch_pc_calc;

ARCHITECTURE behavior OF ifetch_pc_calc IS 	
BEGIN 						

	PROCESS
		BEGIN
			WAIT UNTIL ( clock'EVENT ) AND ( clock = '1' );
			IF reset = '1' THEN
				   PC_out <= "0000000000" ;
					PC_plus_4 <= "0000000000";
			ELSE
					PC_out <= PC;
					-- copy output signals - allows read inside module
   
					PC_plus_4( 9 DOWNTO 2 )  <= PC( 9 DOWNTO 2 ) + 1;
					PC_plus_4( 1 DOWNTO 0 )  <= "00";
			END IF;
	END PROCESS;
END behavior;


