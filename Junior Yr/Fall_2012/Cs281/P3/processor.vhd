library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------------------------------
entity processor is
end entity;
------------------------------------------

architecture struct of processor is

	-- PC
	component pc is
port (
        Clock: in std_logic := '0';
        PCInc : in std_logic := '0';
        PCClr : in std_logic := '0';
        PCIn : in unsigned(31 downto 0) := "00000000000000000000000000000000";
        PCOut : out unsigned(31 downto 0) := "00000000000000000000000000000000"
);

	end component;

	-- Instruction memory
	component instruction_memory is
generic(    width:  integer:=32;
        depth:  integer:=61;
        addr:   integer:=32);
port(   Clock:      in std_logic;
    Read_Addr:  in unsigned(addr-1 downto 0):="00000000000000000000000000000000";
    Data_out:   out unsigned(width-1 downto 0)
);

	end component;

	-- Control
	component control is

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

	end component;

	-- PC_adder
	component pc_adder is
    -- define the number of bits the adder will be adding
    generic( n: natural := 32);
    port(
            A: in unsigned(n-1 downto 0);
            sum: out unsigned(n-1 downto 0)
    );

	end component;

	-- Shiftl2
	component shiftl2 is
	port(
            Input : in unsigned(31 downto 0);
            Output : out unsigned(31 downto 0)

	);
	end component;

	-- shift left 2 for jump
	component shiftl2_jump is
	port(
            Instruction : in unsigned(31 downto 0);
            PC_plus4    : in unsigned(31 downto 0);
            Output : out unsigned(31 downto 0)
    );
	end component;

	-- adder
	component adder is
	generic(n: natural := 32);
	port(
            A: in unsigned(n-1 downto 0);
            B: in unsigned(n-1 downto 0);
            carry : out std_logic;
            sum: out unsigned(n-1 downto 0)

		);
	end component;
	
	-- Register file
	component reg is
    port(
        Clock,RegWrite,RegDst : in std_logic;
        Instruction : in unsigned (31 downto 0);
        Write_data : in unsigned (31 downto 0);
        Read_data_1 : out unsigned (31 downto 0);
        Read_data_2 : out unsigned (31 downto 0)

    );
	end component;

	-- Sign-extend
	component sign_extend is
	port(
		Input : in unsigned(31 downto 0);
		Output : out unsigned(31 downto 0)
		);
	end component;

	-- data memory
	component memory is
    port (
        address, write_data: in unsigned (31 downto 0);
        MemWrite, MemRead: in STD_LOGIC;
        CLK : in std_logic;
        read_data: out unsigned (31 downto 0)
    );
	end component;

	-- and gate
	component and2 is
	port(
		 x: in std_logic;
        y : in std_logic;
        f : out std_logic
	);	
	end component;
	
	component clock is
	port(CLK : out std_ulogic := '1');
	end component;

	component mux21
		port(a,b : in unsigned(31 downto 0);
			sel : in std_logic;
			z : out unsigned(31 downto 0)
		);
	end component;

	component alu32b is
    port(A,B : in unsigned (31 downto 0);
         CarryIn : in unsigned (31 downto 0);
        Op : in unsigned (2 downto 0);
        Result : out unsigned (31 downto 0);
        CarryOut : out unsigned (31 downto 0);
        Zero    : out std_logic
    );
	end component;
---------------------------------------------------------

signal clock_internal : std_ulogic;
-- signals for pc
signal pc_current,pc_out : unsigned(31 downto 0):= "00000000000000000000000000000000";
signal pcInc,pcClr : std_logic := '0';
-- signals for instruction memory
signal instruction_ir : unsigned(31 downto 0):= "00000000000000000000000000000000";
-- signals for pc_adder
signal pc_plus4 : unsigned(31 downto 0)  := "00000000000000000000000000000000";

-- control
signal jump,regdst,branch,memread,memtoreg,memwrite,alusrc,regwrite : std_logic := '0';
signal aluop : unsigned (1 downto 0) := "00";
signal operation : unsigned(2 downto 0) := "000";
-- signals for reg
signal write_data : unsigned(31 downto 0) := "00000000000000000000000000000000";
signal write_reg : unsigned(4 downto 0);
signal read_data_1 : unsigned(31 downto 0):= "00000000000000000000000000000000";
signal read_data_2 : unsigned(31 downto 0):= "00000000000000000000000000000000";
-- signals for ALU32
signal alu32_inputB : unsigned(31 downto 0):= "00000000000000000000000000000000";
signal alu_result : unsigned(31 downto 0):= "00000000000000000000000000000000";
signal alu_zero : std_logic;
signal alu_carry_out,alu_carry_in : unsigned(31 downto 0):= "00000000000000000000000000000000";
-- singals for sign_extended
signal sign_extended_data : unsigned(31 downto 0):= "00000000000000000000000000000000";
-- signals for data memory
signal memory_data_out : unsigned(31 downto 0):= "00000000000000000000000000000000";
-- memry write back mux
signal memtoreg_data : unsigned(31 downto 0):= "00000000000000000000000000000000";
-- signal shift left 2 1
signal shift_left_2_1_out : unsigned(31 downto 0):= "00000000000000000000000000000000";
-- adder 
signal adder_out : unsigned(31 downto 0):= "00000000000000000000000000000000";
-- shift left 2
signal jump_addr : unsigned(31 downto 0):= "00000000000000000000000000000000"; 
-- brahcn mux && jump mux
signal branch_sel : std_logic := '0';
signal branch_mux_out : unsigned(31 downto 0):= "00000000000000000000000000000000";
signal jump_mux_out : unsigned(31 downto 0) := "00000000000000000000000000000000";
signal test : std_logic;
begin
	
	-- init clock
	clk_1 : clock port map(clock_internal);
	pc_1 : pc port map (clock_internal,pcInc,pcClr,pc_current,pc_out);
	IR : instruction_memory port map(clock_internal,pc_out,instruction_ir); 
	PC_ADDER_1 : pc_adder port map( pc_out, pc_plus4);
	
	CONTROL_1 : control port map(Instr => instruction_ir, RegDst => regdst,Jump => jump, Branch => branch, MemRead => memread, MemtoReg => memtoreg, MemWrite => memwrite, ALUSrc => alusrc, RegWrite => regwrite, ALUOp => aluop, Operation => operation);

	REGISTER_FILE : reg port map(Clock => clock_internal,RegWrite => regwrite,RegDst => regdst, Instruction => instruction_ir,Write_data => write_data, Read_data_1 => read_data_1, Read_data_2 => read_data_2);

	ALU32 : alu32b port map(A => read_data_1, B=> alu32_inputB, Op => operation, Result => alu_result,CarryOut => alu_carry_out, Zero => alu_zero,CarryIn => alu_carry_in);

	ALU_MUX : mux21 port map(a => read_data_2, b=>sign_extended_data, sel => alusrc, z => alu32_inputB);

	SIGN_EXTEND_1 : sign_extend port map(Input => instruction_ir, Output => sign_extended_data);

	DATA_MEMORY : memory port map(CLK => clock_internal,address => alu_result, write_data => read_data_2,MemWrite => memwrite, MemRead => memread, read_data => memory_data_out);

	-- Write back
	MEM_MUX : mux21 port map(a=>alu_result,b=>memory_data_out,sel=>memtoreg,z=>write_data);

	SHIFT_LEFT_2_1 : shiftl2 port map(Input =>sign_extended_data, Output => shift_left_2_1_out); 

	ADDER_1 : adder port map( A => pc_plus4, B => shift_left_2_1_out, sum => adder_out);

	SHIFT_LEFT_2_2 : shiftl2_jump port map(Instruction => instruction_ir, PC_plus4 => pc_plus4, Output => jump_addr);

	BRANCH_MUX : mux21 port map(a=> pc_plus4, b=>adder_out,sel=>branch_sel,z=>branch_mux_out);

	JUMP_MUX : mux21 port map(a=>branch_mux_out, b=>jump_addr, sel=>jump, z=> jump_mux_out);


	process(clock_internal)
	begin
		if clock_internal'event and clock_internal = '1' then
		if jump_mux_out = "00000000000000000000000000000000" then
			pcClr <= '1';
			test <= '0';
			pc_current <= "00000000000000000000000000000000";
		else
--			pc_current <= pc_plus4;
 pc_current <= "00000000000000000000000000010000";

			test <= '1';	
			branch_sel <= branch and alu_zero;	
		end if;
		end if;	
	end process;

end struct;
