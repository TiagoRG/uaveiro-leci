library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ShiftRegisterN is
	generic ( size : positive := 4 );
	port
	(
		clk     : in  std_logic;
		sin     : in  std_logic;
		toleft  : in  std_logic;
		enable  : in  std_logic;
		dataOut : out std_logic_vector((size-1) downto 0)
	);
end ShiftRegisterN;

architecture Behav of ShiftRegisterN is
	signal aux : std_logic_vector((size-1) downto 0) := (others => '0');
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			if (enable = '1') then
				if (toleft = '1') then
					aux <= aux((size-2) downto 0) & sin; -- deslocamento à esquerda
				else
					aux <= sin & aux((size-1) downto 1); -- deslocamento à direita
				end if;
			end if;
		end if;
	end process;
	dataOut <= aux;
end Behav;