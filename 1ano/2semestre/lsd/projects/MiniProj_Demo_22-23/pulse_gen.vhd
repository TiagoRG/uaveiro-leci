library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pulse_gen is
	generic (MAX : positive := 50_000_000);
	port
	(
		clk : in STD_LOGIC;
		pulse : out STD_LOGIC
	);
end pulse_gen;

architecture Behavioral of pulse_gen is
	signal s_cnt : natural range 0 to MAX-1;
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			pulse <= '0';
			s_cnt <= s_cnt + 1;
			if (s_cnt = MAX-1) then
				s_cnt <= 0;
				pulse <= '1';
			end if;
		end if;
	end process;
end Behavioral;