--------------------------------------------------------------
-- 32*8 ROM module (ESD Book Chapter 5)
-- by Weijun Zhang, 04/2001
--
-- ROM model has predefined content for read only purpose
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;		 
use ieee.std_logic_unsigned.all;

entity ROM is
port(	Clock   : in std_logic;
	Reset	: in std_logic;	
	Enable	: in std_logic;
	Read	: in std_logic;
	Address	: in std_logic_vector(4 downto 0);
	Data_out: out std_logic_vector(7 downto 0)
);
end ROM;

--------------------------------------------------------------

architecture Behav of ROM is

    type ROM_Array is array (0 to 31) 
	of std_logic_vector(7 downto 0);

    constant Content: ROM_Array := (
        0 => "00000001",		-- Suppose ROM has 
        1 => "00000010",		-- prestored value
        2 => "00000011",		-- like this table
        3 => "00000100",       		--
        4 => "00000101",		--
        5 => "00000110",       		--
        6 => "00000111",		--
        7 => "00001000",       		--
        8 => "00001001",       		--
        9 => "00001010",       		--
        10 => "00001011",		--
	11 => "00001100",       	--
        12 => "00001101",      		--
        13 => "00001110",		--
	14 => "00001111",		--
	OTHERS => "11111111"		--
	);       

begin
    process(Clock, Reset, Read, Address)
    begin
        if( Reset = '1' ) then
	    Data_out <= "ZZZZZZZZ";
        elsif( Clock'event and Clock = '1' ) then
	    if Enable = '1' then
		if( Read = '1' ) then
		    Data_out <= Content(conv_integer(Address));
            	else
                    Data_out <= "ZZZZZZZZ";
            	end if;
	    end if;
        end if;
    end process;
end Behav;

--------------------------------------------------------------
