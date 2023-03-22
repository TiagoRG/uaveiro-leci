library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity AccN is
	generic ( N : positive := 8 );
	port (
		dataIn  : in  std_logic_vector((N-1) downto 0);
		reset, enable, clk : std_logic;
		dataOut : out std_logic_vector((N-1) downto 0)
	);
end AccN;

architecture Behavioral of AccN is
	signal s_adderOut : std_logic_vector((N-1) downto 0);
	signal s_regOut   : std_logic_vector((N-1) downto 0);
begin

	adder : entity work.AdderN(Behavioral)
	generic map ( N => N )
	port map
	(
		operand1 => dataIn,
		operand2 => s_regOut,
		result   => s_adderOut
	);
	
	reg : entity work.RegN(Behavioral)
	generic map ( N => N )
	port map
	(
		dataIn  => s_adderOut,
		reset   => reset, enable => enable, clk => clk,
		dataOut => s_regOut
	);
	
	dataOut <= s_regOut;
	
end Behavioral;