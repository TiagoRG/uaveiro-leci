library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity BreadMachine is
	port
	(
		CLOCK_50 : in  std_logic;
		KEY      : in  std_logic_vector(3 downto 0);
		SW       : in  std_logic_vector(17 downto 0);
		
		LEDR     : out std_logic_vector(0 downto 0);
		LEDG     : out std_logic_vector(2 downto 0);
		
		HEX2     : out std_logic_vector(6 downto 0);
		HEX3     : out std_logic_vector(6 downto 0);
		HEX4     : out std_logic_vector(6 downto 0);
		HEX6     : out std_logic_vector(6 downto 0);
		HEX7     : out std_logic_vector(6 downto 0)
	);
end BreadMachine;

architecture Demo of BreadMachine is

	-- global main signals
	signal s_reset : std_logic := '0';
	
	-- processed signals
	signal s_program, s_timeAdj, s_startStop, s_finished : std_logic;
	
	signal current_delay, current_time : std_logic_vector(6 downto 0);
	signal s_extra_time : std_logic_vector(3 downto 0);
	
	signal s_display7, s_display6, s_display1, s_display0 : std_logic_vector(3 downto 0);
	
	signal s_phase : std_logic_vector(1 downto 0);

begin
	-- Debounces all the keys
	keys_debouncer : entity work.Debouncers(Debounce)
	port map
	(
		clock => CLOCK_50,
		
		reset_btn       => KEY(3),
		start_stop_btn  => KEY(1),
		time_adjust_btn => KEY(0),
		
		reset_out       => s_reset,
		start_stop_out  => s_startStop,
		time_adjust_out => s_timeAdj
	);
	
	fsm : entity work.BreadMachineFSM(Behavioral)
	port map
	(
		clock          => CLOCK_50,
		reset          => s_reset,
		delayer_sw     => SW(17 downto 11),
		program_sw     => SW(0),
		time_adj_but   => s_timeAdj,
		start_stop_but => s_startStop,
		
		in_progress    => LEDR(0),
		leds_phase     => LEDG,
		
		current_delay  => current_delay,
		current_time   => current_time,
		extra_time     => s_extra_time
	);
	
	displays : entity work.DisplaysManager(Behavioral)
	port map
	(
		bin_delay => current_delay,
		bin_total => current_time,
		bin_extra => s_extra_time,
		
		D_HEX2    => HEX2,
		D_HEX3    => HEX3,
		D_HEX4    => HEX4,
		D_HEX6    => HEX6,
		D_HEX7    => HEX7
	);
end Demo;