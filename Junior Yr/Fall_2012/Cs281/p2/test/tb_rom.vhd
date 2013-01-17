-------------------------------------------------------------
-- Test Bench for 32*8 ROM module 
-- (ESD book Chapter 5 Example)
-- by Weijun Zhang, 04/2001 
------------------------------------------------------------- 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
 
entity ROM_TB is 			-- entity declaration
end ROM_TB; 

-------------------------------------------------------------
 
architecture TB of ROM_TB is 

component ROM is
port(	Clock   : in std_logic;
	Reset	: in std_logic;	
	Enable	: in std_logic;
	Read	: in std_logic;
	Address	: in std_logic_vector(4 downto 0);
	Data_out: out std_logic_vector(7 downto 0)
);
end component;

signal T_Clock, T_Reset, T_Read, T_Enable: std_logic;
signal T_Address: std_logic_vector(4 downto 0);
signal T_Data_out: std_logic_vector(7 downto 0);

begin 
	
    U_ROM: ROM port map (T_Clock, T_Reset, T_Enable, 
		T_Read, T_Address, T_Data_out);

    Clk_sig: process
    
    begin
        T_Clock<='1';			-- clock cycle 10 ns
        wait for 5 ns;
        T_Clock<='0';
        wait for 5 ns;
    end process;
							
    process

	variable err_cnt: integer := 0;

    begin

	T_Enable <= '1';
	T_Read <= '0';
	T_Reset <= '1';
	T_Address <= (T_Address'range => '0');
	wait for 20 ns;			
	assert(T_Data_out = "ZZZZZZZZ")
	report "Something wrong!" severity Error;		
	if (T_Data_out /= "ZZZZZZZZ") then
	    err_cnt := err_cnt + 1;
	end if;
		
	T_Reset <= '0';
	T_Read <= '1';
		
	for i in 0 to 31 loop
	    wait for 20 ns;
	    if T_Address < 15 then
		assert (T_Data_out = i + 1) 
		    report "Something wrong!" severity Error;
		if (T_Data_out /= i + 1) then
		    err_cnt := err_cnt + 1;
		end if;
	    else
		assert (T_Data_out = "11111111")
		report "Something wrong!" severity Error;
		if (T_Data_out /= "11111111") then
		    err_cnt := err_cnt + 1;
		end if;
	    end if;
	    T_Address <= T_Address + '1';			
	end loop;
		
        -- summary of all the tests
        if (err_cnt=0) then                     
            assert false 
            report "Testbench of ROM completed successfully!" 
            severity note; 
        else
            assert true
            report "Something wrong, try again"
            severity error;
        end if;
		
	wait;
    end process;

end TB;

--------------------------------------------------------------
configuration CFG_TB of ROM_TB is 
        for TB 
        end for; 
end CFG_TB; 
--------------------------------------------------------------


