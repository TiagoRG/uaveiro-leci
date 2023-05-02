library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Bin2Bcd is
	port
	(
		hexIn   : in  std_logic_vector(3 downto 0);
		decOut0 : out std_logic_vector(3 downto 0);
		decOut1 : out std_logic_vector(3 downto 0)
	);
end Bin2Bcd;

architecture Behavioral of Bin2Bcd is
begin
	process (hexIn) is
	begin
			if hexIn < "1010" then
				decOut0 <= hexIn;
				decOut1 <= "0000";
			else
				if hexIn = "1010" then
					decOut0 <= "0000";
				elsif hexIn = "1011" then
					decOut0 <= "0001";
				elsif hexIn = "1100" then
					decOut0 <= "0010";
				elsif hexIn = "1101" then
					decOut0 <= "0011";
				elsif hexIn = "1110" then
					decOut0 <= "0100";
				else
					decOut0 <= "0101";
				end if;
				decOut1 <= "0001";
		end if;
	end process;
end Behavioral;
