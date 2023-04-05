library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity LedDisplayer is
	port
	(
		count  : in  std_logic_vector(3  downto 0);
		ledOut : out std_logic_vector(14 downto 0)
	);
end LedDisplayer;

architecture Behavioral of LedDisplayer is
begin
	with count select
		ledOut <= "000000000000000" when "0000",
					 "000000000000001" when "0001",
					 "000000000000011" when "0010",
					 "000000000000111" when "0011",
					 "000000000001111" when "0100",
					 "000000000011111" when "0101",
					 "000000000111111" when "0110",
					 "000000001111111" when "0111",
					 "000000011111111" when "1000",
					 "000000111111111" when "1001",
					 "000001111111111" when "1010",
					 "000011111111111" when "1011",
					 "000111111111111" when "1100",
					 "001111111111111" when "1101",
					 "011111111111111" when "1110",
					 "111111111111111" when "1111";
end Behavioral;