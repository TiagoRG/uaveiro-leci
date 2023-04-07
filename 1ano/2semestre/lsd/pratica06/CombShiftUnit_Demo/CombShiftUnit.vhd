library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CombShiftUnit is
	port
	(
		clk      : in  std_logic;
		dataIn   : in  std_logic_vector(7 downto 0);
		loadEn, rotate, dirLeft, shArith : in  std_logic;
		shAmount : in  std_logic_vector(2 downto 0);
		dataOut  : out std_logic_vector(7 downto 0)
	);
end CombShiftUnit;

architecture Behavioral of CombShiftUnit is
	signal s_shiftReg : std_logic_vector(7 downto 0);
begin
	process (clk)
	begin
		if (falling_edge(clk)) then
			if (loaden = '1') then 
				s_shiftReg <= datain;
			
			elsif (rotate = '1') then 
				if (dirleft = '1') then 
					s_shiftReg <= std_logic_vector( rotate_left ( unsigned(s_shiftReg), to_integer(unsigned(shAmount)) ) );
				else 
					s_shiftReg <= std_logic_vector( rotate_right( unsigned(s_shiftReg), to_integer(unsigned(shAmount)) ) ); 
				end if;
			
			elsif (sharith = '1') then 
				if (dirleft = '1') then 
					s_shiftReg <= std_logic_vector( shift_left (    signed(s_shiftReg), to_integer(unsigned(shAmount)) ) );
				else 
					s_shiftReg <= std_logic_vector( shift_right(    signed(s_shiftReg), to_integer(unsigned(shAmount)) ) ); 
				end if;
			
			else
				if (dirleft = '1') then 
					s_shiftReg <= std_logic_vector( shift_left (  unsigned(s_shiftReg), to_integer(unsigned(shAmount)) ) ); 
				else 
					s_shiftReg <= std_logic_vector( shift_right(  unsigned(s_shiftReg), to_integer(unsigned(shAmount)) ) ); 
				end if;
			end if;
		end if;
	end process;
	
	dataOut <= s_shiftReg;
end Behavioral;