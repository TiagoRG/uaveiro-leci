library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FlipFlopD_Demo is
	port(
		SW   : in  std_logic_vector(2 downto 0);
		KEY  : in  std_logic_vector(1 downto 0);
		LEDR : out std_logic_vector(1 downto 0)
	);
end FlipFlopD_Demo;

architecture Shell of FlipFlopD_Demo is
begin
	ff_d : entity work.FlipFlopD(BehavS)
	port map(
		clk => not KEY(0),
		d   => SW(0),
		set => SW(1),
		rst => SW(2),
		q   => LEDR(0)
	);
end Shell;