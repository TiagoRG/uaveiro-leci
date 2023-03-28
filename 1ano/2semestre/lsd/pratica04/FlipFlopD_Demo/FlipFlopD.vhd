library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FlipFlopD is
	port
	(
		clk : in  std_logic;
		d   : in  std_logic;
		set : in  std_logic;
		rst : in  std_logic;
		q   : out std_logic
	);
end FlipFlopD;

architecture BehavS of FlipFlopD is
begin
	process (clk)
	begin
		if (rising_edge(clk)) then
			if (rst = '1') then
				q <= '0';
			elsif (set = '1') then
				q <= '1';
			else
				q <= d;
			end if;
		end if;
	end process;
end BehavS;

architecture BehavAs of FlipFlopD is
begin
	process (clk, set, rst)
	begin
		if (rst = '1') then
			q <= '0';
		elsif (set = '1') then
			q <= '1';
		elsif (rising_edge(clk)) then
			q <= d;
		end if;
	end process;
end BehavAs;