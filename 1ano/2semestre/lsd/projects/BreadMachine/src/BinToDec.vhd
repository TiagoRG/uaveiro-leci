library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity BinToDec is
	port
	(
		binIn   : in  std_logic_vector(6 downto 0);
		decOut0 : out std_logic_vector(3 downto 0);
		decOut1 : out std_logic_vector(3 downto 0)
	);
end BinToDec;

architecture Behavioral of BinToDec is
	signal s_binIn : unsigned(6 downto 0);
begin
	s_binIn <= unsigned(binIn);
	decOut0 <= std_logic_vector(s_binIn rem 10)(3 downto 0);
	decOut1 <= std_logic_vector(s_binIn / 10)(3 downto 0);
end Behavioral;