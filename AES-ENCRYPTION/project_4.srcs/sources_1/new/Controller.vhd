--Controller
library ieee;
use ieee.std_logic_1164.all;

entity Controller is
	port (
		clk : in std_logic;
		rst : in std_logic;
		rconst : out std_logic_vector(7 downto 0);
		is_final_round : out std_logic;
		done : out std_logic
	);
end Controller;

architecture behavioral of Controller is
	signal reg_inp : std_logic_vector(7 downto 0);
	signal reg_outp : std_logic_vector(7 downto 0);
	signal feedback : std_logic_vector(7 downto 0);
begin
	reg_inp <= x"01" when rst = '0' else feedback;
	reg_inst : entity work.reg
		generic map(
			size => 8
		)
		port map(
			clk => clk,
			d   => reg_inp,
			q   => reg_outp
		);
	--	register_with_reset : process(clk) is
	--	begin
	--		if rising_edge(clk) then
	--			if (rst = '0') then 
	--				reg_output <= x"01";				
	--			else 
	--				reg_output <= feedback;
	--			end if;
	--		end if;
	--    end process register_with_reset;

	Galois_by2_inst : entity work.Galois_by2
		port map(
			input_byte  => reg_outp,
			output_byte => feedback
		);
	rconst <= reg_outp;
	is_final_round <= '1' when reg_outp = x"36" else '0';
	done <= '1' when reg_outp = x"6c" else '0';
end architecture behavioral;