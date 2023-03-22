library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Register8 is
	port
	(
		dataIn  : in  std_logic_vector(7 downto 0);
		clk     : in  std_logic;
		wrEn    : in  std_logic;
		dataOut : out std_logic_vector(7 downto 0)
	);
end Register8;

architecture Behavioral of Register8 is
begin
	process (clk)
	begin
		if (rising_edge(clk)) then
			if (wrEn = '1') then
				dataOut <= dataIn;
			end if;
		end if;
	end process;
end Behavioral;