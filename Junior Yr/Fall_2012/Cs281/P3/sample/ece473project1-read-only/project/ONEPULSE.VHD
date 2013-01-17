LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

-- Single Pulse circuit 
-- the output will go high for only one clock cycle

ENTITY onepulse IS
	
	PORT(PB_debounced, clock	: IN	STD_LOGIC;
		 PB_single_pulse		: OUT	STD_LOGIC);

END onepulse;

ARCHITECTURE a OF onepulse IS
	SIGNAL PB_debounced_delay, Power_on : STD_LOGIC;

BEGIN
 PROCESS
 BEGIN
    WAIT UNTIL (CLOCK'event) AND (CLOCK='1');
			-- Power_on will be initialized to '0' at power up
    IF Power_on='0' THEN
			-- This code resets the critical signals once at power up
  	  PB_single_pulse 		<= '0';
  	  PB_debounced_delay 	<= '1';
	  Power_on 				<= '1';

    ELSE
			-- A single clock cycle pulse is produced when the switch is hit
			-- No matter how long the switch is held down
			-- The switch input must already be debounced
  		IF PB_debounced = '1' AND PB_debounced_delay = '0' THEN
   			PB_single_pulse <= '1';
  		ELSE
   			PB_single_pulse <= '0';
  		END IF;

  		PB_debounced_delay <= PB_debounced;

    END IF;

 END PROCESS;

END a;

