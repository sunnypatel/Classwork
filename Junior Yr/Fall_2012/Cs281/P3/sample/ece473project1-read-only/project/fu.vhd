library IEEE; 			
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FU is
	port( read_data_1, read_data_2, result_mem, result_alu: in std_logic_vector ( 31 downto 0 );
	      RegDst_alu, RegDst_mem : in std_logic;
	      inst_mem, inst_alu, inst_reg : in std_logic_vector ( 31 downto 0);
	      forward_rd1, forward_rd2 : out std_logic_vector ( 31 downto 0);
	      forward_status : out std_logic_vector ( 3 downto 0) );

end FU;

architecture behavior of FU is
	signal w_addr_alu, w_addr_mem		: std_logic_vector ( 4 downto 0);
	signal temp_rd1, temp_rd2			: std_logic_vector ( 31 downto 0);
	

begin
	w_addr_alu <= inst_alu ( 20 downto 16)
		when RegDst_alu = '1' ELSE inst_alu ( 15 downto 11);
		
	w_addr_mem <= inst_mem ( 20 downto 16)
		when RegDst_mem = '1' ELSE inst_mem ( 15 downto 11);

	temp_rd2 <= result_mem
		when (inst_reg (20 downto 16) = w_addr_mem) and (inst_reg(20 downto 16) /= "00000")
		else read_data_2;

	forward_rd2 <= result_alu
		when (inst_reg (20 downto 16) = w_addr_alu) and (inst_reg(20 downto 16) /= "00000")
		else temp_rd2;

	forward_status(0) <= '1'
		when (inst_reg (20 downto 16) = w_addr_mem) and (inst_reg(20 downto 16) /= "00000")
		else '0';

	forward_status(1) <= '1'
		when (inst_reg (20 downto 16) = w_addr_alu) and (inst_reg(20 downto 16) /= "00000")
		else '0';

	temp_rd1 <= result_mem
		when inst_reg (25 downto 21) = w_addr_mem and (inst_reg(25 downto 21) /= "00000")
		else read_data_1;

	forward_rd1 <= result_alu
		when inst_reg (25 downto 21) = w_addr_alu and (inst_reg(25 downto 21) /= "00000")
		else temp_rd1;
		
	forward_status(2) <= '1'
		when inst_reg (25 downto 21) = w_addr_mem and (inst_reg(25 downto 21) /= "00000")
		else '0';

	forward_status(3) <= '1'
		when inst_reg (25 downto 21) = w_addr_alu and (inst_reg(25 downto 21) /= "00000")
		else '0';

end behavior;
	
		
	
	
			

