library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ShiftRegister4 is
	port
	(
		clk     : in  std_logic;
		sin     : in  std_logic;
		toleft  : in  std_logic;
		dataOut : out std_logic_vector(3 downto 0)
	);
end ShiftRegister4;

architecture Behav of ShiftRegister4 is
	signal aux : std_logic_vector(3 downto 0) := "0000";
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			if (toleft = '1') then
				aux <= aux(2 downto 0) & sin; -- deslocamento à esquerda
			else
				aux <= sin & aux(3 downto 1); -- deslocamento à direita
			end if;
		end if;
	end process;
	dataOut <= aux;
end Behav;