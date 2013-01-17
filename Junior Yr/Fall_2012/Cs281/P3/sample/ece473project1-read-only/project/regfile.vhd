-- MIPS Processor VHDL Behavioral Model
--			
--  reg_file module (implements the register file)
--
-- 
LIBRARY IEEE; 			
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY regfile IS
	  PORT(	read_data_1	: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			read_data_2			: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Instruction 			: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Instruction_wb 			: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			write_data				: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			RegWrite 				: IN 	STD_LOGIC;
			RegDst 		: IN 	STD_LOGIC;
			clock,reset	: IN 	STD_LOGIC;
			PC_plus_4			: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			jal				: IN STD_LOGIC;
			read_out			: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			read_in				: IN 	STD_LOGIC_VECTOR( 4 DOWNTO 0 ));
END regfile;


ARCHITECTURE behavior OF regfile IS
TYPE register_file IS ARRAY ( 0 TO 31 ) OF STD_LOGIC_VECTOR( 31 DOWNTO 0 );

	SIGNAL register_array				: register_file;
	SIGNAL write_register_address 		: STD_LOGIC_VECTOR( 4 DOWNTO 0 );
	SIGNAL read_register_1_address		: STD_LOGIC_VECTOR( 4 DOWNTO 0 );
	SIGNAL read_register_2_address		: STD_LOGIC_VECTOR( 4 DOWNTO 0 );
	SIGNAL write_register_address_1		: STD_LOGIC_VECTOR( 4 DOWNTO 0 );
	SIGNAL write_register_address_0		: STD_LOGIC_VECTOR( 4 DOWNTO 0 );
	SIGNAL write_data_1					: STD_LOGIC_VECTOR( 31 DOWNTO 0);
BEGIN
	read_register_1_address 	<= Instruction( 25 DOWNTO 21 );
   	read_register_2_address 	<= Instruction( 20 DOWNTO 16 );
   	write_register_address_0	<= Instruction_wb( 15 DOWNTO 11 );
   	write_register_address_1 	<= Instruction_wb( 20 DOWNTO 16 );
					-- Read Register 1 Operation
	read_out <= register_array( CONV_INTEGER( read_in));
	read_data_1 <= register_array( 
			      CONV_INTEGER( read_register_1_address ) );
					-- Read Register 2 Operation		 
	read_data_2 <= register_array( 
			      CONV_INTEGER( read_register_2_address ) );
					-- Mux for Register Write Address

    write_register_address <= write_register_address_1 
			WHEN RegDst = '1'	ELSE write_register_address_0;
	

PROCESS
	BEGIN
		WAIT UNTIL clock'EVENT AND clock = '1';
		IF reset = '1' THEN
					-- Initial register values on reset are register = reg#
					-- use loop to automatically generate reset logic 
					-- for all registers

			FOR i IN 0 TO 31 LOOP
					register_array(i) <= CONV_STD_LOGIC_VECTOR( i, 32 );
 			END LOOP;
 			register_array(29) <= X"000000FC";
					-- Write back to register - don't write to register 0
  		ELSIF RegWrite = '1' AND write_register_address /= 0 THEN
		      register_array( CONV_INTEGER( write_register_address)) <= write_data;
		END IF;
		IF jal = '1' THEN
			register_array(31) <= PC_plus_4;
		END IF;
	END PROCESS;
END behavior;


