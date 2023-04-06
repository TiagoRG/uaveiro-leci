library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CombShiftUnit_Demo is
	port
	(
		CLOCK_50 : in  std_logic;
		SW       : in  std_logic_vector(17 downto 0);
		KEY      : in  std_logic_vector(2 downto 0);
		LEDR     : out std_logic_vector(7 downto 0)
	);
end CombShiftUnit_Demo;

architecture Shell of CombShiftUnit_Demo is
	signal clk : std_logic;
begin
	freq : entity work.FreqDivider(Behavioral)
	generic map (divFactor => 12_500_000)
	port map (clkIn => CLOCK_50, clkOut => clk);

	core : entity work.CombShiftUnit(Behavioral)
	port map
	(
		clk      => clk,
		dataIn   => SW(7 downto 0),
		loadEn   => SW(8),
		rotate   => KEY(0),
		dirLeft  => KEY(1),
		shArith  => KEY(2),
		shAmount => SW(17 downto 15),
		dataOut  => LEDR
	);
end Shell;