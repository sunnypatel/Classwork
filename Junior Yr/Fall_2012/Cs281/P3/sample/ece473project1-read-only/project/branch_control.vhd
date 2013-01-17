-- MIPS Processor VHDL Behavioral Model
--		
-- control module (implements MIPS control unit)
--
-- 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY branch_control IS
   PORT( 	
	SIGNAL zero				: IN 	STD_LOGIC;
	SIGNAL branch_ctl_ex	: IN 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	SIGNAL branch_ctl_de	: IN	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	SIGNAL branch_ctl_out	: OUT 	STD_LOGIC);

END branch_control;

ARCHITECTURE behavior OF branch_control IS
SIGNAL zero_int				: STD_LOGIC;
SIGNAL branch_ctl_int		: STD_LOGIC;
BEGIN 

	zero_int <= zero
		WHEN branch_ctl_ex(0) = '0' ELSE NOT zero;
		
	branch_ctl_int <= branch_ctl_ex(0)
		WHEN branch_ctl_ex(1) = '0' ELSE zero_int;
		
	branch_ctl_out <= '1'
		WHEN branch_ctl_de = "01" ELSE branch_ctl_int;
	
END behavior;