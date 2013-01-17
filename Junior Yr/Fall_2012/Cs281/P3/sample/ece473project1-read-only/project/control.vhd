-- MIPS Processor VHDL Behavioral Model
--		
-- control module (implements MIPS control unit)
--
-- 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY control IS
   PORT( 	
	SIGNAL instruction		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL instruction_ex	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL branch_ctl		: OUT 	STD_LOGIC;
	SIGNAL jump_ctl			: OUT 	STD_LOGIC;
	SIGNAL RegWrite			: OUT 	STD_LOGIC;
	SIGNAL RegDst 			: OUT 	STD_LOGIC;
	SIGNAL sh_reg_ctl		: OUT 	STD_LOGIC;
	SIGNAL reg_imm_ctl		: OUT 	STD_LOGIC;
	SIGNAL MemRead 			: OUT 	STD_LOGIC;
	SIGNAL MemWrite 		: OUT 	STD_LOGIC;
	SIGNAL alu_mem_ctl		: OUT 	STD_LOGIC;
	SIGNAL jal				: OUT 	STD_LOGIC;
	SIGNAL ALUop 			: OUT 	STD_LOGIC_VECTOR( 3 DOWNTO 0 );
	SIGNAL rl	 			: OUT 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	SIGNAL shamt 			: OUT 	STD_LOGIC_VECTOR( 4 DOWNTO 0 );
	SIGNAL clock, reset		: IN 	STD_LOGIC; 
	SIGNAL stall_ctl		: OUT STD_LOGIC;
	SIGNAL zero				: IN 	STD_LOGIC);

END control;

ARCHITECTURE behavior OF control IS

SIGNAL opcode		: STD_LOGIC_VECTOR( 5 DOWNTO 0);
SIGNAL old_opcode	: STD_LOGIC_VECTOR( 5 DOWNTO 0);
SIGNAL funct		: STD_LOGIC_VECTOR( 5 DOWNTO 0);
SIGNAL shamti		: STD_LOGIC_VECTOR( 4 DOWNTO 0);
SIGNAL write_addr	: STD_LOGIC_VECTOR( 4 DOWNTO 0);
SIGNAL read_addr1	: STD_LOGIC_VECTOR( 4 DOWNTO 0);
SIGNAL read_addr2	: STD_LOGIC_VECTOR( 4 DOWNTO 0);

BEGIN       
	opcode <= instruction(31 DOWNTO 26);
	old_opcode <= instruction_ex(31 DOWNTO 26);
	funct <= instruction(5 DOWNTO 0);
	shamti <= instruction(10 DOWNTO 6);
    write_addr <= instruction_ex( 20 DOWNTO 16 );
	read_addr1 <= instruction( 25 DOWNTO 21 );
   	read_addr2 <= instruction( 20 DOWNTO 16 );
	

-- the following section defines how the processor will react to each 
-- instruction it encounters. the first section below controls r-type, followed
-- by the i and j types respectively. 
-- commented out control lines represent don't care signals in the controller
-- for the given instruction.
-- the shamt and shamti lines exist to handle the dual purpose of the shifting
-- module. the shift module is used for any r-type shift operations where shamt
-- is connected to shamti (shamt in the r-type instruction). the shift module
-- is reused for the lui instruction where the shamt has to be changed to a
-- constant of 16 to get the immediate value into the upper half. 
PROCESS ( opcode, funct )
	BEGIN 
	
	IF old_opcode = "100011" THEN --lw
		IF opcode = "000000" OR opcode = "000100" OR opcode = "000101" THEN --r-type
			IF read_addr1 = write_addr OR read_addr2 = write_addr THEN
				stall_ctl <= '1';
			ELSE
				stall_ctl <= '0';
			END IF;
		ELSIF opcode = "101011" THEN --sw
			IF read_addr1 = write_addr OR read_addr2 = write_addr THEN
				stall_ctl <= '1';
			ELSE 
				stall_ctl <= '0';
			END IF;
		ELSIF read_addr1 = write_addr THEN --i-type
			stall_ctl <= '1';
		ELSE --no stall
			stall_ctl <= '0';
		END IF;
	ELSE
	
		stall_ctl <= '0';
	END IF;
	
	case opcode is


	when "000000" =>
		-- the following control signals are the same for all r type instructions
		shamt <= shamti;
		MemRead <= '0';
		MemWrite <= '0';
		reg_imm_ctl <= '1';
		alu_mem_ctl <= '1';
		sh_reg_ctl <= '1';
		jal <= '0';

		  case funct is
                        when "000000" => --sll
                                branch_ctl <= '0';
                                jump_ctl <= '1';
                                RegWrite <= '1';
                                RegDst <= '0';
                                ALUOp <= "1000";
                                rl <= "10";
                        when "000010" => --srl
                                branch_ctl <= '0';
                                jump_ctl <= '1';
                                RegWrite <= '1';
                                RegDst <= '0';
                                ALUOp <= "1000";
                                rl <= "01";
                        when "000011" => --sra
                                branch_ctl <= '0';
                                jump_ctl <= '1';
                                RegWrite <= '1';
                                RegDst <= '0';
                                ALUOp <= "1000";
                                rl <= "00";
                        when "001000" => --jr
                                branch_ctl <= '0';
                                jump_ctl <= '0';
                                RegWrite <= '0';
                                --RegDst <= '0';
                                ALUOp <= "0111";
                                --rl <= "10";
                        when "100000" => --add
                                branch_ctl <= '0';
                                jump_ctl <= '1';
                                RegWrite <= '1';
                                RegDst <= '0';
                                ALUOp <= "0000";
                                --rl <= "10";
                        when "100001" => --addu
                                branch_ctl <= '0';
                                jump_ctl <= '1';
                                RegWrite <= '1';
                                RegDst <= '0';
                                ALUOp <= "0001";
                                --rl <= "10";
                        when "100010" => --sub
                                branch_ctl <= '0';
                                jump_ctl <= '1';
                                RegWrite <= '1';
                                RegDst <= '0';
                                ALUOp <= "0010";
                                --rl <= "10";
                        when "100011" => --subu
                                branch_ctl <= '0';
                                jump_ctl <= '1';
                                RegWrite <= '1';
                                RegDst <= '0';
                                ALUOp <= "0011";
                                --rl <= "10";
                        when "100100" => --and
                                branch_ctl <= '0';
                                jump_ctl <= '1';
                                RegWrite <= '1';
                                RegDst <= '0';
                                ALUOp <= "0100";
                                --rl <= "10";
                        when "100101" => --or
                                branch_ctl <= '0';
                                jump_ctl <= '1';
                                RegWrite <= '1';
                                RegDst <= '0';
                                ALUOp <= "0101";
                                --rl <= "10";
                        when "100111" => --nor
                                branch_ctl <= '0';
                                jump_ctl <= '1';
                                RegWrite <= '1';
                                RegDst <= '0';
                                ALUOp <= "0110";
                                --rl <= "10";
                        when "101010" => --slt
                                branch_ctl <= '0';
                                jump_ctl <= '1';
                                RegWrite <= '1';
                                RegDst <= '0';
                                ALUOp <= "0111";
                                --rl <= "10";
                        when others =>
                                jal <= '0';
                                branch_ctl <= '1';
                                jump_ctl <= '1';
                                RegWrite <= '0';
                                RegDst <= '1';
                                --sh_reg_ctl <= '0';
                                reg_imm_ctl <= '0';
                                alu_mem_ctl <= '1';
                                ALUOp <= "0100";
                                --rl <= "00";
                                --shamt <= shamti;
                                MemRead <= '0';
                                MemWrite <= '0';
                end case;
        
        when "001100" => --andi
                        jal <= '0';
                        branch_ctl <= '0';
                        jump_ctl <= '1';
                        RegWrite <= '1';
                        RegDst <= '1';
                        --sh_reg_ctl <= '0';
                        reg_imm_ctl <= '0';
                        alu_mem_ctl <= '1';
                        ALUOp <= "0100";
                        --rl <= "00";
                        --shamt <= shamti;
                        MemRead <= '0';
                        MemWrite <= '0';
        when "001101" => --ori
                        jal <= '0';
                        branch_ctl <= '0';
                        jump_ctl <= '1';
                        RegWrite <= '1';
                        RegDst <= '1';
                        --sh_reg_ctl <= '0';
                        reg_imm_ctl <= '0';
                        alu_mem_ctl <= '1';
                        ALUOp <= "0101";
                        --rl <= "00";
                        shamt <= shamti;
                        MemRead <= '0';
                        MemWrite <= '0';
        when "001010" => --slti
                        jal <= '0';
                        branch_ctl <= '0';
                        jump_ctl <= '1';
                        RegWrite <= '1';
                        RegDst <= '1';
                        --sh_reg_ctl <= '0';
                        reg_imm_ctl <= '0';
                        alu_mem_ctl <= '1';
                        ALUOp <= "0111";
                        --rl <= "00";
                        shamt <= shamti;
                        MemRead <= '0';
                        MemWrite <= '0';
        when "001000" => --addi
                        jal <= '0';
                        branch_ctl <= '0';
                        jump_ctl <= '1';
                        RegWrite <= '1';
                        RegDst <= '1';
                        --sh_reg_ctl <= '0';
                        reg_imm_ctl <= '0';
                        alu_mem_ctl <= '1';
                        ALUOp <= "0000";
                        --rl <= "00";
                        shamt <= shamti;
                        MemRead <= '0';
                        MemWrite <= '0';
        --when "001001" => --addiu
        --              jal <= '0';
        --              branch_ctl <= '0';
        --              jump_ctl <= '1';
        --              RegWrite <= '1';
        --              RegDst <= '1';
                        --sh_reg_ctl <= '0';
        --              reg_imm_ctl <= '0';
        --              alu_mem_ctl <= '1';
        --              ALUOp <= "0000";
                        --rl <= "00";
        --              shamt <= shamti;
        --              MemRead <= '0';
        --              MemWrite <= '0';
        when "001001" => --subi
                        jal <= '0';
                        branch_ctl <= '0';
                        jump_ctl <= '1';
                        RegWrite <= '1';
                        RegDst <= '1';
                        --sh_reg_ctl <= '0';
                        reg_imm_ctl <= '0';
                        alu_mem_ctl <= '1';
                        ALUOp <= "0010";
                        --rl <= "00";
                        shamt <= shamti;
                        MemRead <= '0';
                        MemWrite <= '0';
        when "000100" => --beq
                        jal <= '0';
                        branch_ctl <= zero;
                        jump_ctl <= '1';
                        RegWrite <= '0';
                        --RegDst <= '0';
                        --sh_reg_ctl <= '0';
                        reg_imm_ctl <= '1';
                        --alu_mem_ctl <= '0';
                        --ALUOp <= "0000";
                        --rl <= "00";
                        shamt <= shamti;
                        MemRead <= '0';
                        MemWrite <= '0';
        when "000101" => --bne
                        jal <= '0';
                        branch_ctl <= NOT zero;
                        jump_ctl <= '1';
                        RegWrite <= '0';
                        --RegDst <= '0';
                        --sh_reg_ctl <= '0';
                        reg_imm_ctl <= '1';
                        --alu_mem_ctl <= '0';
                        --ALUOp <= "0000";
                        --rl <= "00";
                        shamt <= shamti;
                        MemRead <= '0';
                        MemWrite <= '0';
        when "100011" => --lw
                        jal <= '0';
                        branch_ctl <= '0';
                        jump_ctl <= '1';
                        RegWrite <= '1';
                        RegDst <= '1';
                        --sh_reg_ctl <= '0';
                        reg_imm_ctl <= '0';
                        alu_mem_ctl <= '0';
                        ALUOp <= "0000";
                        --rl <= "00";
                        shamt <= shamti;
                        MemRead <= '1';
                        MemWrite <= '0';
        when "101011" => --sw
                        jal <= '0';
                        branch_ctl <= '0';
                        jump_ctl <= '1';
                        RegWrite <= '0';
                        RegDst <= '1';
                        --sh_reg_ctl <= '0';
                        reg_imm_ctl <= '0';
                        --alu_mem_ctl <= '0';
                        ALUOp <= "0000";
                        --rl <= "00";
                        shamt <= shamti;
                        MemRead <= '0';
                        MemWrite <= '1';
        when "001111" => --lui
                        jal <= '0';
                        branch_ctl <= '0';
                        jump_ctl <= '1';
                        RegWrite <= '1';
                        RegDst <= '1';
                        sh_reg_ctl <= '0';
                        --reg_imm_ctl <= '0';
                        alu_mem_ctl <= '1';
                        ALUOp <= "1000";
                        rl <= "10";
                        shamt <= "10000";
                        MemRead <= '0';
                        MemWrite <= '0';
        when "000010" => --j
                        jal <= '0';
                        branch_ctl <= '1';
                        jump_ctl <= '0';
                        RegWrite <= '0';
                        RegDst <= '0';
                        --sh_reg_ctl <= '0';
                        --reg_imm_ctl <= '0';
                        --alu_mem_ctl <= '0';
                        --ALUOp <= "0000";
                        --rl <= "00";
                        shamt <= shamti;
                        MemRead <= '0';
                        MemWrite <= '0';
        when "000011" => --jal
                        jal <= '1';
                        branch_ctl <= '1';
                        jump_ctl <= '0';
                        RegWrite <= '1';
                        RegDst <= '0';
                        --sh_reg_ctl <= '0';
                        --reg_imm_ctl <= '0';
                        --alu_mem_ctl <= '0';
                        --ALUOp <= "0000";
                        --rl <= "00";
                        shamt <= shamti;
                        MemRead <= '0';
                        MemWrite <= '0';
        when others =>
                        jal <= '0';
                        branch_ctl <= '0';
                        jump_ctl <= '1';
                        RegWrite <= '0';
                        RegDst <= '1';
                        --sh_reg_ctl <= '0';
                        reg_imm_ctl <= '0';
                        alu_mem_ctl <= '1';
                        ALUOp <= "0100";
                        --rl <= "00";
                        --shamt <= shamti;
			MemRead <= '0';
			MemWrite <= '0';
		
	end case;
end process;
END behavior;
   


