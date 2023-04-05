library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SpeedSelect is
	port
	(
		toggle : in  std_logic;
		reset  : in  std_logic;
		speed  : out positive := 4
	);
end SpeedSelect;

architecture Behavioral of SpeedSelect is
	signal current_speed : positive := 4;
begin
	process(toggle, reset)
	begin
		if (reset = '1') then
			current_speed <= 4;
		else
			if (toggle = '1') then
				if (current_speed = 1) then
					current_speed <= 4;
				else
					current_speed <= 1;
				end if;
			end if;
		end if;
	end process;
	speed <= current_speed;
end Behavioral;