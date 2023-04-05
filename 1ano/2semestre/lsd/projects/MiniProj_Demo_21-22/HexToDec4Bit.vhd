library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity HexToDec4Bit is
	port
	(
		hexIn   : in  std_logic_vector(3 downto 0);
		cin     : in  std_logic;
		decOut0 : out std_logic_vector(3 downto 0);
		decOut1 : out std_logic_vector(3 downto 0)
	);
end HexToDec4Bit;

architecture Behavioral of HexToDec4Bit is
begin
	process (hexIn, cin) is
	begin
		if cin = '1' then
			if hexIn = "0000" then
				decOut0 <= "0110";
			elsif hexIn = "0001" then
				decOut0 <= "0111";
			elsif hexIn = "0010" then
				decOut0 <= "1000";
			elsif hexIn = "0011" then
				decOut0 <= "1001";
			elsif hexIn = "0100" then
				decOut0 <= "0000";
			elsif hexIn = "0101" then
				decOut0 <= "0001";
			elsif hexIn = "0110" then
				decOut0 <= "0010";
			elsif hexIn = "0111" then
				decOut0 <= "0011";
			elsif hexIn = "1000" then
				decOut0 <= "0100";
			elsif hexIn = "1001" then
				decOut0 <= "0101";
			elsif hexIn = "1010" then
				decOut0 <= "0110";
			elsif hexIn = "1011" then
				decOut0 <= "0111";
			elsif hexIn = "1100" then
				decOut0 <= "1000";
			elsif hexIn = "1101" then
				decOut0 <= "1001";
			else
				decOut0 <= "0000";
			end if;
			
			if hexIn < "0100" then
				decOut1 <= "0001";
			elsif hexIn < "1110" then
				decOut1 <= "0010";
			else
				decOut1 <= "0011";
			end if;
		else
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
		end if;
	end process;
end Behavioral;
