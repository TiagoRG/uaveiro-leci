library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity TimerN is
	generic (N : positive := 6);
	port
	(
		clk      : in  std_logic;
		enable   : in  std_logic;
		start    : in  std_logic;
		reset    : in  std_logic;
		timerOut : out std_logic
	);
end TimerN;

architecture Behavioral of TimerN is
	signal s_count : std_logic_vector(31 downto 0);
begin
	process (clk)
	begin
		if (rising_edge(clk)) then
			if (reset = '0' and enable = '1') then
				if (unsigned(s_count) < N and not (unsigned(s_count) = 0 and start = '0')) then
					s_count <= std_logic_vector(unsigned(s_count) + 1);
				else
					s_count <= (others => '0');
				end if;
			elsif (reset = '1') then
				s_count <= (others => '0');
			end if;
			
			if (unsigned(s_count) = 0) then
				timerOut <= '0';
			else
				timerOut <= '1';
			end if;
		end if;
	end process;
end Behavioral;