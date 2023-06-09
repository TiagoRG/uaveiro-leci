library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity BreadMachineFSM_TB is
end BreadMachineFSM_TB;

architecture Stimulus of BreadMachineFSM_TB is
	-- Sinais para ligar às entradas da UUT
	signal s_clock, s_reset, s_start_stop_but, s_time_adj_but, s_program_sw : std_logic;
	signal s_delayer_sw : std_logic_vector(6 downto 0);

	-- Sinal para ligar às saídas da UUT
	signal s_in_progress : std_logic;
	signal s_leds_phase : std_logic_vector(2 downto 0);
	signal s_extra_time : std_logic_vector(3 downto 0);
	signal s_current_time, s_current_delay : std_logic_vector(6 downto 0);
begin
	-- Instanciação da Unit Under Test (UUT)
	uut: entity work.BreadMachineFSM(Behavioral)
	port map
	(
		clock => s_clock,
		reset => s_reset,
		start_stop_but => s_start_stop_but,
		time_adj_but => s_time_adj_but,
		delayer_sw => s_delayer_sw,
		program_sw => s_program_sw,
		
		in_progress => s_in_progress,
		leds_phase => s_leds_phase,
		
		current_delay => s_current_delay,
		current_time => s_current_time,
		extra_time => s_extra_time
	);
	
	clock_proc : process
	begin
		s_clock <= '0';
		wait for 10 ns;
		s_clock <= '1';
		wait for 10 ns;
	end process;
	
	--Process stim
	stim_proc : process
	begin
		s_delayer_sw <= "0000010";
		wait for 1 sec;
		s_program_sw <= '0';
		wait for 1 sec;
		s_program_sw <= '1';
		wait for 1 sec;
		s_program_sw <= '0';
		wait for 1 sec;
		s_start_stop_but <= '1';
		wait for 1 sec;
		s_start_stop_but <= '0';
		wait for 1 sec;
		s_delayer_sw <= "1111111";
		s_time_adj_but <= '1';
		wait for 1 sec;
		s_time_adj_but <= '0';
		wait for 1 sec;
		s_start_stop_but <= '0';
		wait for 1 sec;
		s_start_stop_but <= '1';
		wait for 10 sec;
		s_start_stop_but <= '0';
		wait for 1 sec;
		s_start_stop_but <= '1';
		wait for 15 sec;
		s_time_adj_but <= '1';
		wait for 1 sec;
		s_time_adj_but <= '0';
		wait for 1 sec;
		s_time_adj_but <= '1';
		wait for 1 sec;
		s_time_adj_but <= '0';
		wait for 1 sec;
		s_time_adj_but <= '1';
		wait for 1 sec;
		s_time_adj_but <= '0';
		wait for 1 sec;
		s_start_stop_but <= '1';
		wait for 2 sec;
		s_start_stop_but <= '0';
		wait for 1 sec;
		s_start_stop_but <= '1';
		wait for 2 sec;
		s_start_stop_but <= '1';
	end process;
end Stimulus;