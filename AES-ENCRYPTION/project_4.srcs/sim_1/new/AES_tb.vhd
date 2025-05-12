--AES_tb
library ieee;
use ieee.std_logic_1164.all;

entity AES_tb is 
end AES_tb;

architecture behavior of AES_tb is
	component AES_top
		port(
			clk        : in  std_logic;
			rst        : in  std_logic;
			key        : in  std_logic_vector(127 downto 0);
			plaintext  : in  std_logic_vector(127 downto 0);
			ciphertext : out std_logic_vector(127 downto 0);
			done       : out std_logic
		);		
	end component AES_top;	
	-- Input signals
	signal clk : std_logic := '0';
	signal rst : std_logic := '0';
	signal plaintext : std_logic_vector(127 downto 0);
	signal key : std_logic_vector(127 downto 0);	
	
	-- Output signals
	signal done : std_logic;
	signal ciphertext : std_logic_vector(127 downto 0);	
	
	-- Clock period definition
	constant clk_period : time := 10 ns;
	
begin
	enc_inst : AES_top
		port map(
			clk        => clk,
			rst        => rst,
			key        => key,
			plaintext  => plaintext,
			ciphertext => ciphertext,
			done       => done
		);	
	-- clock process definitions
	clk_process : process is
	begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
	end process clk_process;

	-- Simulation process
	sim_proc : process is
	begin

		plaintext <= x"340737e0a29831318d305a88a8f64332";
		key <= x"3c4fcf098815f7aba6d2ae2816157e2b";
		rst <= '0';
				
		wait for clk_period * 1;
		rst <= '1';
		wait until done = '1';
		wait for clk_period/2;
	
		rst <= '0';

		wait for clk_period * 1;
		rst <= '1';
		wait until done = '1';
		wait for clk_period/2;
		
		end process;			
	
end architecture behavior;
