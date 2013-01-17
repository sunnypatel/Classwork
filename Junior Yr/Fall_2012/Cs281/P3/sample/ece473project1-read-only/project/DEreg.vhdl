LIBRARY IEEE;                         
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY DEreg IS
    PORT(        clock                      : IN        STD_LOGIC;
                 RegDst 					: IN	STD_LOGIC;
                 reg_imm_ctl				: IN	STD_LOGIC;
                 instruction				: IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
                 rd1						: IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
                 aluin2						: IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
                 PC_plus_4					: IN 	STD_LOGIC_VECTOR(9 DOWNTO 0);
                 shiftin					: IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
                 mem_read					: IN 	STD_LOGIC;
                 mem_write					: IN 	STD_LOGIC;
                 alu_mem_ctl				: IN 	STD_LOGIC;
                 reg_w_ctl					: IN 	STD_LOGIC;
                 stall_ctl					: IN 	STD_LOGIC;
                 RegDst_de					: OUT 	STD_LOGIC;
                 reg_imm_ctl_de				: OUT	STD_LOGIC;
                 instruction_de				: OUT 	STD_LOGIC_VECTOR(31 DOWNTO 0);
                 rd1_de						: OUT 	STD_LOGIC_VECTOR(31 DOWNTO 0);
                 aluin2_de					: OUT 	STD_LOGIC_VECTOR(31 DOWNTO 0);
                 PC_plus_4_de				: OUT 	STD_LOGIC_VECTOR(9 DOWNTO 0);
                 shiftin_de					: OUT 	STD_LOGIC_VECTOR(31 DOWNTO 0);
                 mem_read_de				: OUT 	STD_LOGIC;
                 mem_write_de				: OUT 	STD_LOGIC;
                 alu_mem_ctl_de				: OUT 	STD_LOGIC;
                 reg_w_ctl_de				: OUT 	STD_LOGIC;
                 branch_ctl					: IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
                 branch_ctl_de				: OUT	STD_LOGIC_VECTOR(1 DOWNTO 0);
                 ALU_op						: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
                 ALU_op_de					: OUT	STD_LOGIC_VECTOR(3 DOWNTO 0)  );
END DEreg;

ARCHITECTURE behavior OF DEreg IS
	SIGNAL RegDst_int					:	STD_LOGIC;	
	SIGNAL instruction_int				:  	STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL rd1_int						:  	STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL aluin2_int					:  	STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL PC_plus_4_int				:  	STD_LOGIC_VECTOR(9 DOWNTO 0);
	SIGNAL shiftin_int					:  	STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL branch_ctl_int				: 	STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL mem_read_int					:  	STD_LOGIC;
	SIGNAL mem_write_int				:  	STD_LOGIC;
	SIGNAL alu_mem_ctl_int				:  	STD_LOGIC;
	SIGNAL reg_w_ctl_int				: 	STD_LOGIC;
	SIGNAL ALU_op_int				: 	STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
       RegDst_de <= RegDst_int;
       instruction_de <= instruction_int;
       PC_plus_4_de <= PC_plus_4_int;
       rd1_de <= rd1_int;
       aluin2_de <= aluin2_int;
       shiftin_de <= shiftin_int;
       mem_read_de <= mem_read_int;
       mem_write_de <= mem_write_int;
       alu_mem_ctl_de <= alu_mem_ctl_int;
       reg_w_ctl_de <= reg_w_ctl_int;
       branch_ctl_de <= branch_ctl_int;
       ALU_op_de <= ALU_op_int;


PROCESS
       BEGIN
         WAIT UNTIL RISING_EDGE(clock);
		 instruction_int <= instruction;
		 PC_plus_4_int <= PC_plus_4;
		 RegDst_int <= RegDst;
		 rd1_int <= rd1;
		 aluin2_int <= aluin2;
		 shiftin_int <= shiftin;
		 mem_read_int <= mem_read;
		 mem_write_int <= mem_write;
		 alu_mem_ctl_int <= alu_mem_ctl;
		 reg_w_ctl_int <= reg_w_ctl;
		 branch_ctl_int <= branch_ctl;
		 ALU_op_int <= ALU_op;
       END PROCESS;
END behavior;