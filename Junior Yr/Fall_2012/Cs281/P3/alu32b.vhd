library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--use IEEE._logic_unsigned.all;
--use IEEE._logic_arith.all;

entity alu32b is
	port(A,B : in unsigned (31 downto 0);
	     CarryIn : in unsigned (31 downto 0);
		Op : in unsigned (2 downto 0);
		Result : out unsigned (31 downto 0);
		CarryOut : out unsigned (31 downto 0);
		Zero 	: out std_logic
	);
end alu32b;

-- ======================================================
-- ======================================================
architecture behavioral of alu32b is

	signal C,res : unsigned (31 downto 0);
	signal zero_t : std_logic;
-- =====================================================
begin
alu32_processed : process(A,B,Op)
begin
  case Op is
	-- perform AND
	when "000" => 
	  res <= A and B;
	-- perform OR
	when "001" =>
	  res <= A or B;
	-- perform addition
	when "010" =>
	  res <= A + B;
	-- perform subtraction 
	when "110" =>
--	  res <= A + (not B) + 1;
	  res <= A - B;
	-- perform SLT
	when "111" =>
	  if (A < B) then
	    res <= "00000000000000000000000000000001";
	  else
	    res <= "00000000000000000000000000000000";
	  end if;
  when others =>
		res <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	end case;

  -- set zero
  case res is
	when "00000000000000000000000000000000" =>
	    zero_t <= '1';
	when others =>
	    zero_t <= '0';
  end case;
  --else
  --  zero_t <= '0';
--  end if;
  
end process;

process(res)
begin
if(res = "00000000000000000000000000000000") then
  Zero <= '1';
else
  Zero <= '0';
end if;
end process;

-- concurrent instruction
Result <= res;

end behavioral;
