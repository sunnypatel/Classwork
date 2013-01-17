LIBRARY IEEE;                         
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY EMreg IS
    PORT(        clock                      : IN    STD_LOGIC;
                 RegDst 					: IN	STD_LOGIC;
                 instruction				: IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
                 alu_result					: IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
                 alu_mem_ctl				: IN 	STD_LOGIC;
                 mem_write					: IN 	STD_LOGIC;
                 mem_read					: IN 	STD_LOGIC;
                 reg_w_ctl					: IN 	STD_LOGIC;
                 reg_imm_ctl				: IN 	STD_LOGIC;
                 RegDst_em					: OUT	STD_LOGIC;
                 instruction_em				: OUT 	STD_LOGIC_VECTOR(31 DOWNTO 0);
                 alu_result_em				: OUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
                 alu_mem_ctl_em				: OUT 	STD_LOGIC;
                 mem_write_em				: OUT 	STD_LOGIC;
                 mem_read_em				: OUT	STD_LOGIC;
                 reg_w_ctl_em				: OUT 	STD_LOGIC;
                 reg_imm_ctl_em				: OUT 	STD_LOGIC;
                 rd2						: IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
                 rd2_em						: OUT	STD_LOGIC_VECTOR(31 DOWNTO 0) );
END EMreg;

ARCHITECTURE behavior OF EMreg IS
    SIGNAL RegDst_int					: STD_LOGIC;
	SIGNAL instruction_int				: STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL alu_result_int				: STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL alu_mem_ctl_int				: STD_LOGIC;
	SIGNAL mem_write_int				: STD_LOGIC;
	SIGNAL mem_read_int					: STD_LOGIC;
	SIGNAL reg_w_ctl_int				: STD_LOGIC;
	SIGNAL reg_imm_ctl_int				: STD_LOGIC;
	SIGNAL rd2_int						: STD_LOGIC_VECTOR(31 DOWNTO 0);
	
       
BEGIN
	   RegDst_em <= RegDst_int;
       instruction_em <= instruction_int;
       alu_result_em <= alu_result_int;
       alu_mem_ctl_em <= alu_mem_ctl_int;
       mem_write_em <= mem_write_int;
       mem_read_em <= mem_read_int;
       reg_w_ctl_em <= reg_w_ctl_int;
       reg_imm_ctl_em <= reg_imm_ctl_int;
       rd2_em <= rd2_int;

PROCESS
       BEGIN
			WAIT UNTIL clock'EVENT AND clock = '1';
			RegDst_int <= RegDst;
			instruction_int <= instruction;
			alu_result_int <= alu_result;
			alu_mem_ctl_int <= alu_mem_ctl;
			mem_write_int <= mem_write;
			mem_read_int <= mem_read;
			reg_w_ctl_int <= reg_w_ctl;
			reg_imm_ctl_int <= reg_imm_ctl;
			rd2_int <= rd2;

       END PROCESS;
END behavior;