library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Debouncers is
	port
	(
		clock : in std_logic;
		
		reset_btn       : in  std_logic;
		start_stop_btn  : in  std_logic;
		time_adjust_btn : in  std_logic;
		
		reset_out       : out std_logic;
		start_stop_out  : out std_logic;
		time_adjust_out : out std_logic
	);
end Debouncers;

architecture Debounce of Debouncers is

begin
	
	reset_debouncer : entity work.Debouncer(Behavioral)
	port map
	(
		refClk    => clock,
		dirtyIn   => reset_btn,
		pulsedOut => reset_out
	);
	
	timeAdjust_debouncer : entity work.Debouncer(Behavioral)
	port map
	(
		refClk    => clock,
		dirtyIn   => time_adjust_btn,
		pulsedOut => time_adjust_out
	);
	
	startStop_debouncer : entity work.Debouncer(Behavioral)
	port map
	(
		refClk    => clock,
		dirtyIn   => start_stop_btn,
		pulsedOut => start_stop_out
	);
	
end Debounce;