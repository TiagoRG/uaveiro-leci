library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity DisplaysManager is
	port
	(
		bin_delay : in  std_logic_vector(6 downto 0);
		bin_total : in  std_logic_vector(6 downto 0);
		bin_extra : in  std_logic_vector(3 downto 0);
		
		D_HEX2    : out std_logic_vector(6 downto 0);
		D_HEX3    : out std_logic_vector(6 downto 0);
		D_HEX4    : out std_logic_vector(6 downto 0);
		D_HEX6    : out std_logic_vector(6 downto 0);
		D_HEX7    : out std_logic_vector(6 downto 0)
	);
end DisplaysManager;

architecture Behavioral of DisplaysManager is

	signal s_display2, s_display3, s_display6, s_display7 : std_logic_vector(3 downto 0);

begin
	binToDec_delay  : entity work.BinToDec(Behavioral)
	port map
	(
		binIn   => bin_delay,
		decOut0 => s_display6,
		decOut1 => s_display7
	);
	
	display6 : entity work.Bin7SegDecoder(Behavioral)
	port map
	(
		binInput => s_display6,
		enable   => '1',
		decOut_n => D_HEX6
	);
	
	display7 : entity work.Bin7SegDecoder(Behavioral)
	port map
	(
		binInput => s_display7,
		enable   => '1',
		decOut_n => D_HEX7
	);
	
	binToDec_normal : entity work.BinToDec(Behavioral)
	port map
	(
		binIn   => bin_total,
		decOut0 => s_display2,
		decOut1 => s_display3
	);
	
	display2 : entity work.Bin7SegDecoder(Behavioral)
	port map
	(
		binInput => s_display2,
		enable   => '1',
		decOut_n => D_HEX2
	);
	
	display3 : entity work.Bin7SegDecoder(Behavioral)
	port map
	(
		binInput => s_display3,
		enable   => '1',
		decOut_n => D_HEX3
	);
	
	extra_time_display : entity work.Bin7SegDecoder(Behavioral)
	port map
	(
		binInput => bin_extra,
		enable   => '1',
		decOut_n => D_HEX4
	);
end Behavioral;