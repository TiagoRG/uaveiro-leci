library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity AdderN is
	generic ( N : positive := 8);
	port
	(
		operand1 : in  std_logic_vector((N-1) downto 0 );
		operand2 : in  std_logic_vector((N-1) downto 0 ) := (others => '0');
		result   : out std_logic_vector((N-1) downto 0 )
	);
end AdderN;

architecture Behavioral of AdderN is
begin
	result <= operand1 + operand2;
end Behavioral;