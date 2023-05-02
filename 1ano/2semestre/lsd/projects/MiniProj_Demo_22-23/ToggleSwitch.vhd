library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ToggleSwitch is
	port
	(
		toggle     : in  std_logic;
		reset      : in  std_logic;
		startStop  : out std_logic := '1'
	);
end ToggleSwitch;

architecture Behavioral of ToggleSwitch is
	signal current_state : std_logic := '1';
begin
	process(toggle, reset)
	begin
		if (reset = '1') then
			current_state <= '1';
		else
			if (toggle = '1') then
				if (current_state = '1') then
					current_state <= '0';
				else
					current_state <= '1';
				end if;
			end if;
		end if;
	end process;
	startStop <= current_state;
end Behavioral;