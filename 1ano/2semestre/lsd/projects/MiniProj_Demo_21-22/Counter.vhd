library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Counter is
	port
	(
		clk   : in  std_logic;
		reset : in  std_logic;
		count : out std_logic_vector(3 downto 0)
	);
end Counter;

architecture Behavioral of Counter is
	signal up : std_logic := '1';
	signal s_count : unsigned(3 downto 0) := to_unsigned(0, 4);
begin
	process(clk, reset)
	begin
		if (reset = '1') then
			s_count <= to_unsigned(0, 4);
			up <= '1';
		elsif (rising_edge(clk)) then
			if (up = '1') then
				if (std_logic_vector(s_count) = "1111") then
					s_count <= s_count - 1;
					up <= '0';
				else
					s_count <= s_count + 1;
				end if;
			else
				if (std_logic_vector(s_count) = "0000") then
					s_count <= s_count + 1;
					up <= '1';
				else
					s_count <= s_count - 1;
				end if;
			end if;
		end if;
	end process;
	count <= std_logic_vector(s_count);
end Behavioral;