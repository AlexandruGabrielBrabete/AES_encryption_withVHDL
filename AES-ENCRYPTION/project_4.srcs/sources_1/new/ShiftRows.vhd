--ShiftRows
library ieee;
use ieee.std_logic_1164.all;

entity ShiftRows is
	port (
		inp : in std_logic_vector(127 downto 0);
		outp : out std_logic_vector(127 downto 0)
	);
end ShiftRows;

architecture rtl of ShiftRows is
	
begin
	outp(8*16 - 1 downto 8*15) <= inp(8*12 - 1 downto 8*11);
	outp(8*15 - 1 downto 8*14) <= inp(8*7 - 1 downto 8*6);
	outp(8*14 - 1 downto 8*13) <= inp(8*2 - 1   downto  8*1); 
	outp(8*13 - 1 downto 8*12) <= inp(8*13 - 1  downto  8*12);
	outp(8*12 - 1 downto 8*11) <= inp(8*8 - 1   downto  8*7);
	outp(8*11 - 1 downto 8*10) <= inp(8*3 - 1   downto  8*2); 
	outp(8*10 - 1 downto 8*9) <= inp(8*14 - 1  downto  8*13);
	outp(8*9 - 1 downto 8*8) <= inp(8*9 - 1   downto  8*8);
	outp(8*8 - 1 downto 8*7) <= inp(8*4 - 1   downto  8*3);
	outp(8*7 - 1 downto 8*6) <= inp(8*15 - 1  downto  8*14);
	outp(8*6 - 1 downto 8*5) <= inp(8*10 - 1  downto  8*9);
	outp(8*5 - 1 downto 8*4) <= inp(8*5 - 1   downto  8*4);
	outp(8*4 - 1 downto 8*3) <= inp(8*16 - 1  downto  8*15);
	outp(8*3 - 1 downto 8*2) <= inp(8*11 - 1  downto  8*10);
	outp(8*2 - 1 downto 8*1) <= inp(8*6 - 1   downto  8*5);
	outp(8*1 - 1 downto 8*0) <= inp(8*1 - 1   downto  8*0); 	
end architecture rtl;