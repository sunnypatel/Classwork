LIBRARY IEEE;                        
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY MWreg IS
   PORT(        clock                      : IN			STD_LOGIC;
                instruction                : IN         STD_LOGIC_VECTOR(31 DOWNTO 0);
                reg_w_ctl                  : IN         STD_LOGIC;
                reg_write_data             : IN         STD_LOGIC_VECTOR(31 DOWNTO 0);
                instruction_mw             : OUT        STD_LOGIC_VECTOR(31 DOWNTO 0);
                reg_w_ctl_mw               : OUT        STD_LOGIC;
                RegDst					   : IN			STD_LOGIC;
                reg_imm_ctl				   : IN			STD_LOGIC;
                RegDst_mw				   : OUT		STD_LOGIC;
                reg_write_data_mw          : OUT        STD_LOGIC_VECTOR(31 DOWNTO 0);
                reg_imm_ctl_mw			   : OUT			STD_LOGIC );
END MWreg;

ARCHITECTURE behavior OF MWreg IS
	SIGNAL instruction_int					: STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL reg_w_ctl_int					: STD_LOGIC;
	SIGNAL reg_write_data_int				: STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL reg_write_data_mw_int			: STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL reg_w_ctl_mw_int					: STD_LOGIC;
	SIGNAL reg_imm_ctl_int					: STD_LOGIC;
	SIGNAL RegDst_int						: STD_LOGIC;

     
BEGIN
      instruction_mw <= instruction_int;
      reg_w_ctl_mw <= reg_w_ctl_mw_int;
      reg_write_data_mw <= reg_write_data_mw_int;
      reg_imm_ctl_mw <= reg_imm_ctl_int;
      RegDst_mw <= RegDst_int;

PROCESS
      BEGIN
         WAIT UNTIL clock'EVENT AND clock = '1';
         instruction_int <= instruction;
         reg_w_ctl_mw_int <= reg_w_ctl;
         reg_write_data_mw_int <= reg_write_data;
		 reg_imm_ctl_int <= reg_imm_ctl;
		 RegDst_int <= RegDst;
      END PROCESS;
END behavior;
 

