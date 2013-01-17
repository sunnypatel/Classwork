library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------------

entity instruction_memory is
generic(	width:	integer:=32;
		depth:	integer:=61;
		addr:	integer:=32);
port(	Clock:		in std_logic;	
	Read_Addr:	in unsigned(addr-1 downto 0):="00000000000000000000000000000000";
	Data_out: 	out unsigned(width-1 downto 0)
);
end instruction_memory;

--------------------------------------------------------------

architecture behav of instruction_memory is

-- use array to define the bunch of internal temparary signals

type ram_type is array (0 to depth-1) of 
	unsigned(width-1 downto 0);
signal tmp_ram: ram_type;

-- convert memory addr to integer for memory array addr!
function conv_integer(X: unsigned) return INTEGER is
variable result: INTEGER;
begin
    result := 0;
    for i in X'range loop
        result := result * 2;
        case X(i) is
            when '0' | 'L' => null;
            when '1' | 'H' => result := result + 1;
            when others => null;
        end case;
    end loop;
    return result;
end conv_integer;


begin	
	-- init. instruction memory array			   
	tmp_ram(0) <= "00100000000000010000000000000111"; -- addi $r1, $r0, 7
	tmp_ram(4) <= "00000000000000000001000000100000"; -- add $r2, $r0, $r0
	tmp_ram(8) <= "00100000000000110000000000000000"; -- addi $r3, $r0, 0
	tmp_ram(12) <= "00100000000001000000000000000100"; --addi $r4, $r0, 4
	tmp_ram(16) <= "00000000000000100010100010000000"; -- sll $r5, $r2, 2 **LOOP**
	tmp_ram(20) <= "00000000101000110010100000100000"; -- add $r5, $r5, $r3
	tmp_ram(24) <= "10001100101001100000000000000000"; -- lw $r6, 0($r5) 
	tmp_ram(28) <= "00010000100001100000000000110000"; -- beq $r4, $r6, Found
	tmp_ram(32) <= "00100000010000100000000000000001"; -- addi $r2, $r2, 1
	tmp_ram(36) <= "00000000010000010011100000101010"; -- slt $r7, $r2, $r1
	tmp_ram(40) <= "00010000000001110000000000111100"; -- beq $r0, $r7, Exit
	tmp_ram(44) <= "00001000000000000000000000001100"; -- j Loop
	tmp_ram(48) <= "10101100000001010000000000011100"; -- sw $r5, 1C($r0); **FOUND**
	tmp_ram(52) <= "00001000000000000000000000001100"; -- j Done
	tmp_ram(56) <= "10101100000000000000000000011100"; -- sw $r0, 1C($r0)
	tmp_ram(60) <= "00000000000000000000000000100000"; -- add $r0, $r0, $r0 **DONE**

    
	
    process(Clock)
    begin
	if (Clock'event and Clock='1') then
		    -- buildin function conv_integer change the type
		    -- from unsigned to integer
		    Data_out <= tmp_ram(conv_integer(Read_Addr)); 
	end if;
    end process;
	
end behav;
----------------------------------------------------------------
