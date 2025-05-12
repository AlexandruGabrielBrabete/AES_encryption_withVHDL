--MixColumns
library ieee;
use ieee.std_logic_1164.all;

entity MixColumns is
	port (
		inp_data : in std_logic_vector(127 downto 0);
		outp_data : out std_logic_vector(127 downto 0)
	);
end MixColumns;

architecture rtl of MixColumns is
	
begin
	MixColumns_inst0 : entity work.GaloisFinal
		port map(
			inp_data  => inp_data(31 downto 0),
			outp_data => outp_data(31 downto 0)
		);
	MixColumns_inst1 : entity work.GaloisFinal
		port map(
			inp_data  => inp_data(63 downto 32),
			outp_data => outp_data(63 downto 32)
		);		
	MixColumns_inst2 : entity work.GaloisFinal
		port map(
			inp_data  => inp_data(95 downto 64),
			outp_data => outp_data(95 downto 64)
		);
	MixColumns_inst3 : entity work.GaloisFinal
		port map(
			inp_data  => inp_data(127 downto 96),
			outp_data => outp_data(127 downto 96)
		);	
end architecture rtl;