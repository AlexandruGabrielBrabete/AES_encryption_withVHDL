--GaloisFinal
library ieee;
use ieee.std_logic_1164.all;

entity GaloisFinal is
	port (
		inp_data : in std_logic_vector(31 downto 0);
		outp_data : out std_logic_vector(31 downto 0)
	);
end GaloisFinal;

architecture rtl of GaloisFinal is
	signal temp : std_logic_vector(7 downto 0);
	signal temp0 : std_logic_vector(7 downto 0);
	signal temp1 : std_logic_vector(7 downto 0);
	signal temp2 : std_logic_vector(7 downto 0);
	signal temp3 : std_logic_vector(7 downto 0);
	signal temp0x2 : std_logic_vector(7 downto 0);
	signal temp1x2 : std_logic_vector(7 downto 0);
	signal temp2x2 : std_logic_vector(7 downto 0);
	signal temp3x2 : std_logic_vector(7 downto 0);	
begin
	temp <= inp_data(31 downto 24) xor inp_data(23 downto 16) xor inp_data(15 downto 8) xor inp_data(7 downto 0);
	temp0 <= inp_data(7 downto 0) xor inp_data(15 downto 8);
	temp1 <= inp_data(15 downto 8) xor inp_data(23 downto 16);
	temp2 <= inp_data(23 downto 16) xor inp_data(31 downto 24);
	temp3 <= inp_data(31 downto 24) xor inp_data(7 downto 0);
	Galois_by2_inst0 : entity work.Galois_by2
		port map(
			input_byte  => temp0,
			output_byte => temp0x2
		);
	Galois_by2_inst1 : entity work.Galois_by2
		port map(
			input_byte  => temp1,
			output_byte => temp1x2
		);
	Galois_by2_inst2 : entity work.Galois_by2
		port map(
			input_byte  => temp2,
			output_byte => temp2x2
		);
	Galois_by2_inst3 : entity work.Galois_by2
		port map(
			input_byte  => temp3,
			output_byte => temp3x2
		);
	outp_data(7 downto 0) <= inp_data(7 downto 0) xor temp0x2 xor temp;
	outp_data(15 downto 8) <= inp_data(15 downto 8) xor temp1x2 xor temp;
	outp_data(23 downto 16) <= inp_data(23 downto 16) xor temp2x2 xor temp;
	outp_data(31 downto 24) <= inp_data(31 downto 24) xor temp3x2 xor temp; 	
	
end architecture rtl;