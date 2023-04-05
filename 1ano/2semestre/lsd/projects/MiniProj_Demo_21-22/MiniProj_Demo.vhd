library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MiniProj_Demo is
	port
	(
		CLOCK_50 : in  std_logic;
		KEY      : in  std_logic_vector(1  downto 0);
		LEDR     : out std_logic_vector(14 downto 0);
		HEX0     : out std_logic_vector(6  downto 0);
		HEX1     : out std_logic_vector(6  downto 0)
	);
end MiniProj_Demo;

architecture Shell of MiniProj_Demo is
	signal s_clk_def, s_clk_div : std_logic;
	signal s_speed : positive := 4;
	signal s_reset : std_logic;

	signal s_count : std_logic_vector(3 downto 0);
	
	signal s_display0, s_display1 : std_logic_vector(3 downto 0);
begin
	s_clk_def <= CLOCK_50;
	s_reset   <= not KEY(0);

	speed_select : entity work.SpeedSelect(Behavioral)
	port map
	(
		toggle => not KEY(1),
		reset  => s_reset,
		speed  => s_speed
	);
	
	freq_divider : entity work.FreqDivider(Behavioral)
	generic map (divFactor => 50_000_000)
	port map
	(
		clkIn  => s_clk_def,
		multi  => s_speed,
		clkOut => s_clk_div
	);
	
	counter : entity work.Counter(Behavioral)
	port map
	(
		clk   => s_clk_div,
		reset => s_reset,
		count => s_count
	);
	
	led_display : entity work.LedDisplayer(Behavioral)
	port map
	(
		count  => s_count,
		ledOut => LEDR
	);

	hex_to_dec : entity work.HexToDec4Bit(Behavioral)
	port map
	(
		hexIn   => s_count,
		cin     => '0',
		decOut0 => s_display0,
		decOut1 => s_display1
	);
	
	display0 : entity work.Bin7SegDecoder(Behavioral)
	port map
	(
		enable   => '1',
		binInput => s_display0,
		decOut_n => HEX0
	);
	
	display1 : entity work.Bin7SegDecoder(Behavioral)
	port map
	(
		enable   => '1',
		binInput => s_display1,
		decOut_n => HEX1
	);
	
end Shell;