-- this block is used to count the number of clock pulses that have 
-- gone by since the last reset. the inputs are reset and clock,
-- and the output is a 16 bit count of the number of clock pulses.

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY accumulator IS
	PORT( clock : IN STD_LOGIC;
		  reset : IN STD_LOGIC;
		  count : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
end accumulator;

ARCHITECTURE behavior of accumulator IS
SIGNAL int_count : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN

	-- setup output
	count <= int_count;
	PROCESS
		BEGIN
			

        WAIT UNTIL clock'EVENT AND clock = '1';
        IF reset = '1' THEN
			-- reset count to zero
			int_count <= X"0000";
		ELSE
			-- increment the count
			int_count <= int_count + X"0001";
        END IF;
	END PROCESS;
END behavior;
