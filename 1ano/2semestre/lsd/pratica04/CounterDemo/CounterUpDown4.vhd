library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CounterUpDown4 is
	port
	(
		clock  : in  std_logic;
		reset  : in  std_logic;
		upDown : in  std_logic;
		count  : out std_logic_vector(3 downto 0)
	);
end CounterUpDown4;

architecture Behavioral of CounterUpDown4 is
	signal s_count : unsigned(3 downto 0);
begin
	process(clock, reset, upDown)
	begin
		if (reset = '1') then
			s_count <= to_unsigned(0, 4);
		elsif (rising_edge(clock)) then
			if (upDown = '1') then
				s_count <= s_count - 1;
			else
				s_count <= s_count + 1;
			end if;
		end if;
	end process;
	count <= std_logic_vector(s_count);
end Behavioral;