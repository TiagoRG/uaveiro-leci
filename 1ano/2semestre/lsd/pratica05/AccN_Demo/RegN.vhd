library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RegN is
	generic ( N : positive := 8);
	port
	(
		dataIn  : in  std_logic_vector((N-1) downto 0);
		enable, reset, clk : in std_logic;
		dataOut : out std_logic_vector((N-1) downto 0)
	);
end RegN;

architecture Behavioral of RegN is
begin
	process (clk, reset)
	begin
		if (reset = '1') then
			dataOut <= (others => '0');
		elsif (rising_edge(clk)) then
			if (enable = '1') then
				dataOut <= dataIn;
			end if;
		end if;
	end process;
end Behavioral;