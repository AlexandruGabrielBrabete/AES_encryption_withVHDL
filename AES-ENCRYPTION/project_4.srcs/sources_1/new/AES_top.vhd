--AES_top
library ieee;
use ieee.std_logic_1164.all;

entity AES_top is 
	port (
		clk : in std_logic;
		rst : in std_logic;
		key : in std_logic_vector(127 downto 0);
		plaintext : in std_logic_vector(127 downto 0);
		ciphertext : out std_logic_vector(127 downto 0);
		done : out std_logic		
	);
end AES_top;

architecture behavioral of AES_top is
	signal reg_input : std_logic_vector(127 downto 0);
	signal reg_output : std_logic_vector(127 downto 0);
	signal subbox_input : std_logic_vector(127 downto 0);
	signal subbox_output : std_logic_vector(127 downto 0);
	signal shiftrows_output : std_logic_vector(127 downto 0);
	signal mixcol_output : std_logic_vector(127 downto 0);
	signal feedback : std_logic_vector(127 downto 0);
	signal round_key : std_logic_vector(127 downto 0);
	signal round_const : std_logic_vector(7 downto 0);
	signal sel : std_logic;
begin
	reg_input <= plaintext when rst = '0' else feedback;
	reg_inst : entity work.reg
		generic map(
			size => 128
		)
		port map(
			clk => clk,
			d   => reg_input,
			q   => reg_output
		);
	-- Encryption body
	Add_Round_Key_inst : entity work.Add_Round_Key
		port map(
			inp1 => reg_output,
			inp2 => round_key,
			outp => subbox_input
		);
	SubBytes_inst : entity work.SubBytes
		port map(
			inp_data  => subbox_input,
			outp_data => subbox_output
			
		);
	ShiftRows_inst : entity work.ShiftRows
		port map(
			inp  => subbox_output,
			outp => shiftrows_output
		);
	MixColumns_inst : entity work.MixColumns
		port map(
			inp_data  => shiftrows_output,
			outp_data => mixcol_output
		);
	feedback <= mixcol_output when sel = '0' else shiftrows_output;
	ciphertext <= subbox_input;	
	-- Controller
	Controller_inst : entity work.Controller
		port map(
			clk            => clk,
			rst            => rst,
			rconst         => round_const,
			is_final_round => sel,
			done           => done
		);
	-- Keyschedule
	KeyGenerator_inst : entity work.KeyGenerator
		port map(
			clk         => clk,
			rst         => rst,
			key         => key,
			round_const => round_const,
			round_key   => round_key
		);	
end architecture behavioral;