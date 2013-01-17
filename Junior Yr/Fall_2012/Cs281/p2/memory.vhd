library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory is
	port (
		address, write_data: in unsigned (31 downto 0);
		MemWrite, MemRead: in STD_LOGIC;
		CLK : in std_logic;
		read_data: out unsigned (31 downto 0)
	);
end memory;

architecture behavioral of memory is	  


type mem_array is array(0 to 7) of unsigned (31 downto 0);


begin
  
  mem_process: process(address, write_data)
  variable data_mem: mem_array := (
    X"00000001", -- initialize data memory
    X"00000010", -- 2
    X"00000011", -- 3
    X"00000100", -- 4
    X"00000101", -- 5
    X"00000110", -- 6 
    X"00000111", -- 7
    X"00001000"); -- 8
  variable addr: integer;  
  
  function to_integer(X: unsigned) return INTEGER is
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
  end to_integer;
  
  begin
	  addr := to_integer(address(2 downto 0));
	  if (MemWrite = '1' and CLK = '1') then
		  data_mem(addr) := write_data;
	  elsif (MemRead = '1' and CLK = '1') then
		  read_data <= data_mem(addr) after 10 ns;
	  end if;

  end process mem_process;
end behavioral;
