library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controlb is
	port( Instr : in unsigned (31 downto 0);
				Jump : out std_logic := '0';
				RegDst : out std_logic;
				Branch : out std_logic;
				MemRead : out std_logic;
				MemtoReg : out std_logic;
				ALUOp	 : out unsigned (1 downto 0);
				MemWrite : out std_logic;
				ALUSrc	 : out std_logic;
				RegWrite : out std_logic;
				Operation : out unsigned( 2 downto 0)
	);
end controlb;

-- ===============================================
architecture behavioral of controlb is

	-- 6-bit opcode and 6-bit function for R-type
	signal opCode, func : unsigned (5 downto 0);

-- ===============================================
begin
	
	-- parse the opCode
	opCode <= Instr(31 downto 26);
	-- parse the func code
	func <= Instr(5 downto 0);

	opCode_decoding : process(opCode,func)
	begin
	case opCode is
		-- R-type
		when "000000" =>
			RegDst <= '1';
			ALUOp <= "10";
			ALUSrc <= '0';
			Branch <= '0';
			MemRead <= '0';
			MemWrite <= '0';
			RegWrite <= '1';
			MemtoReg <= '0';
			
			-- ALU op
			case func is
				when "000000" =>
				Operation <= "010";
				when "000010" =>
				Operation <= "110";
				when "000100" =>
				Operation <= "000";
				when "000101" =>
				Operation <= "001";
				when "001010" =>
				Operation <= "111";
				when others =>

			end case;

		-- J-type
		when "000010" =>
			ALUSrc <= '0';
			RegWrite <= '0';
			MemRead <= '0';
			MemWrite <= '0';
			Branch <= '1';
			ALUOp <= "01";
			Jump <= '0';	
			Operation <= "110";

		-- J-type again	
		when "000011" =>
            ALUSrc <= '0';
            RegWrite <= '0';
            MemRead <= '0';
            MemWrite <= '0';
            Branch <= '1';
            ALUOp <= "01";
           	Jump <= '1'; 
            Operation <= "110";

		-- I-type sw
		when "101011" =>
			ALUSrc <= '1';
			RegWrite <= '0';
			MemRead <= '0';
			MemWrite <= '1';
			Branch <= '0';
			ALUOp <= "00";
			Operation <= "010";

		-- I-type lw
		when "100011" =>
			RegDst <= '0';
			ALUSrc <= '1';
			MemtoReg <= '1';
			RegWrite <= '1';
			MemRead <= '1';
			MemWrite <= '0';
			Branch <= '0';
			ALUOp <= "00";
			Operation <= "010";

		when others =>
		end case;
	end process;	
end behavioral;
