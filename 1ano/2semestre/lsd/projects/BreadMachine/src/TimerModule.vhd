library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity TimerModule is
	port
	(
		clock		: in  std_logic;
		reset		: in  std_logic;
		timerEnable : in  std_logic;
		timerNew    : in  std_logic; 
		timerValue  : in  std_logic_vector(6 downto 0);
		timerOut    : out std_logic_vector(6 downto 0)
	);
end TimerModule;

architecture Behavioral of TimerModule is

	signal s_clock, s_reset, s_pulse : std_logic;
	signal s_count : unsigned(6 downto 0);

begin
	s_clock <= clock;
	s_reset <= reset;

	pulse_gen : entity work.PulseGen(Behavioral)
	generic map (MAX => 50_000_000)
	port map
	(
		clock => s_clock,
		reset => s_reset,
		pulse => s_pulse
	);

	process(s_clock, timerNew, timerEnable)
	begin
		if (rising_edge(s_clock)) then
			if (s_reset = '1') then
				s_count <= unsigned(timerValue);
			else
				if ( timerNew = '1' ) then
					s_count <= unsigned(timerValue);
				else
					if ( s_pulse = '1' and timerEnable = '1' and s_count > 0 ) then
						s_count <= s_count - 1;
					end if;
				end if;
			end if;
		end if;
	end process;

	timerOut <= std_logic_vector(s_count);
end Behavioral;