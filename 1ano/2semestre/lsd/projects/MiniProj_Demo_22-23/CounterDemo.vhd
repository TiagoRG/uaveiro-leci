library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CounterDemo is
	port
	(
		CLOCK_50 : in  std_logic;
		KEY      : in  std_logic_vector(1 downto 0);
		HEX0     : out std_logic_vector(6 downto 0);
		HEX1     : out std_logic_vector(6 downto 0)
	);
end CounterDemo;

architecture Shell of CounterDemo is
	signal s_pulse, s_reset, s_toggle : std_logic;
	signal s_count : std_logic_vector(3 downto 0);
	
	signal s_startStop : std_logic := '1';
	
	signal s_display0, s_display1 : std_logic_vector(3 downto 0);
begin
	s_reset <= not KEY(1);

	pulse_gen : entity work.pulse_gen(Behavioral)
	generic map (MAX => 20_000_000)
	port map
	(
		clk   => CLOCK_50,
		pulse => s_pulse
	);
	
	key_debounce : entity work.Debouncer(Behavioral)
	port map
	(
		refClk => CLOCK_50,
		dirtyIn => KEY(0),
		pulsedOut => s_toggle
	);
	
	start_stop : entity work.ToggleSwitch(Behavioral)
	port map
	(
		toggle    => s_toggle,
		reset     => s_reset,
		startStop => s_startStop
	);
	
	counter : entity work.Counter(Behavioral)
	port map
	(
		clk   => s_pulse,
		reset => s_reset,
		start => s_startStop,
		count => s_count
	);
	
	bin2bcd : entity work.Bin2Bcd(Behavioral)
	port map
	(
		hexIn   => s_count,
		decOut0 => s_display0,
		decOut1 => s_display1
	);
	
	display0 : entity work.Bin7SegDecoder(Behavioral)
	port map
	(
		binInput => s_display0,
		decOut_n => HEX0
	);
	
	display1 : entity work.Bin7SegDecoder(Behavioral)
	port map
	(
		binInput => s_display1,
		decOut_n => HEX1
	);
end Shell;