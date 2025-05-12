--SubBytes
library ieee;
use ieee.std_logic_1164.all;

entity SubBytes is
	port (
		inp_data : in std_logic_vector(127 downto 0);
		outp_data : out std_logic_vector(127 downto 0)
	);
end SubBytes;

architecture behavioral of SubBytes is
	
begin
	gen : for i in 0 to 15 generate
		SBox_inst : entity work.SBox
			port map(
				input_byte  => inp_data((i + 1)*8 - 1 downto i*8),
				output_byte => outp_data((i + 1)*8 - 1 downto i*8)
			);		
	end generate gen;
	
end architecture behavioral;