library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ShiftRegister_Demo is
	generic ( size : positive := 18);
	port
	(
		SW       : in  std_logic_vector(2 downto 0);
		CLOCK_50 : in  std_logic;
		LEDR     : out std_logic_vector((size-1) downto 0)
	);
end ShiftRegister_Demo;

architecture Shell of ShiftRegister_Demo is
	signal clk   : std_logic;
begin
	freqDevider : entity work.FreqDivider(Behavioral)
	generic map (divFactor => 25_000_000)
	port map
	(
		clkIn  => CLOCK_50,
		clkOut => clk
	);
	
	system : entity work.ShiftRegisterN(Behav)
	generic map (size => size)
	port map
	(
		clk     => clk,
		sin     => SW(0),
		toleft  => SW(1),
		enable  => SW(2),
		dataOut => LEDR
	);
	
end Shell;