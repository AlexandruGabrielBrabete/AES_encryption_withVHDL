--Add_Round_Key
library ieee;
use ieee.std_logic_1164.all;

entity Add_Round_Key is
	port (
		inp1 : in std_logic_vector(127 downto 0);
		inp2 : in std_logic_vector(127 downto 0);
		outp : out std_logic_vector(127 downto 0)
	);
end Add_Round_Key;

architecture rtl of Add_Round_Key is
	
begin
	outp <= inp1 xor inp2;		
end architecture rtl;