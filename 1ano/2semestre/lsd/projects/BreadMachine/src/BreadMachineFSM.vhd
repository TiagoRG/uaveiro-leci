library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity BreadMachineFSM is
	port
	(
		clock          : in std_logic;
		reset          : in std_logic;
		start_stop_but : in std_logic;
		time_adj_but   : in std_logic;
		delayer_sw     : in std_logic_vector(6 downto 0);
		program_sw     : in std_logic;
		
		in_progress   : out std_logic;
		leds_phase    : out std_logic_vector(2 downto 0);
		
		current_delay : out std_logic_vector(6 downto 0);
		current_time  : out std_logic_vector(6 downto 0);
		extra_time    : out std_logic_vector(3 downto 0)
	);
end BreadMachineFSM;

architecture Behavioral of BreadMachineFSM is
	-- Defines the times for each phase for each program
	subtype  Bin6Time is std_logic_vector(6 downto 0);
	type     Times    is array (0 to 2) of Bin6Time;
	constant Program1 : Times := ("0001010", "0000100", "0001010");
	constant Program2 : Times := ("0001111", "0001000", "0001010");
	
	-- Defines the current program config
	signal Current_Program : Times;
	signal initial_program : std_logic;
	
	-- General states signal
	signal s_reset : std_logic := '1';
	signal s_in_progress, s_extra_time_started, s_awaiting_finish : std_logic := '0';
	
	-- Current delayer signals
	signal s_delay_time    : Bin6Time;
	signal s_current_delay : Bin6Time;
	signal delayer_enable, delayer_new : std_logic := '0';
	
	-- Current total time signals
	signal s_total_time       : Bin6Time;
	signal current_total_time : Bin6Time;
	signal total_time_enable, total_time_new : std_logic := '0';
	
	-- Current extra time signals
	signal s_extra_time       : Bin6Time := "0000000";
	signal current_extra_time : Bin6Time;
	signal extra_time_enable, extra_time_new : std_logic := '0';
begin
	-- Gets the total time for this program
	s_total_time <= std_logic_vector(unsigned(Current_Program(0)) + unsigned(Current_Program(1)) + unsigned(Current_Program(2)));
	
	-- Delay timer
	s_delay_time <= "1011010" when (unsigned(delayer_sw) > to_unsigned(90, 7)) else delayer_sw;
	delayer : entity work.TimerModule(Behavioral)
	port map
	(
		clock       => clock,
		reset       => reset,
		timerEnable => delayer_enable,
		timerNew    => delayer_new,
		timerValue  => s_delay_time,
		timerOut    => s_current_delay
	);
	
	-- Total time timer
	totaltimetimer : entity work.TimerModule(Behavioral)
	port map
	(
		clock       => clock,
		reset       => reset,
		timerEnable => total_time_enable,
		timerNew    => total_time_new,
		timerValue  => s_total_time,
		timerOut    => current_total_time
	);
	
	-- Extra time timer
	extratimetimer : entity work.TimerModule(Behavioral)
	port map
	(
		clock       => clock,
		reset       => reset,
		timerEnable => extra_time_enable,
		timerNew    => extra_time_new,
		timerValue  => s_extra_time,
		timerOut    => current_extra_time
	);
	
	process (clock, reset, start_stop_but, time_adj_but)
	begin
		if (rising_edge(clock)) then
			if (reset = '1' or s_reset = '1') then
				Current_Program   <= Program1;
				initial_program   <= program_sw;
				s_extra_time      <= "0000000";
				
				delayer_enable    <= '0';
				total_time_enable <= '0';
				extra_time_enable <= '0';
				
				s_reset       <= '0';
				s_in_progress <= '0';
			else
				if (s_in_progress = '0') then
					delayer_new    <= '1';
					total_time_new <= '1';
					extra_time_new <= '0';
					
					if (program_sw = initial_program) then
						Current_Program <= Program1;
					else
						Current_Program <= Program2;
					end if;
					
					if (start_stop_but = '1') then
						delayer_new    <= '0';
						
						s_awaiting_finish    <= '0';
						s_extra_time_started <= '0';
						s_in_progress        <= '1';
						
						delayer_enable <= '1';
					end if;
				else
					if (start_stop_but = '1') then
						if (s_awaiting_finish = '1') then
							extra_time_new <= '0';
							if (current_extra_time = "0000000") then
								s_reset <= '1';
							else
								s_extra_time_started <= '1';
								extra_time_enable <= '1';
							end if;
						else
							if (s_current_delay = "0000000") then
								total_time_enable <= not total_time_enable;
								extra_time_enable <= not extra_time_enable;
							else
								delayer_enable    <= not delayer_enable;
							end if;
						end if;
					end if;
					
					if (s_current_delay = "0000000" and total_time_new = '1') then
						total_time_new <= '0';
						total_time_enable <= '1';
					end if;
					
					if (current_total_time = "0000000") then
						extra_time_new    <= '1';
						s_awaiting_finish <= '1';
						total_time_enable <= '0';
					end if;
					
					if (s_extra_time_started = '1') then
						extra_time_new <= '0';
						if (current_extra_time = "0000000") then
							s_extra_time         <= "0000000";
							s_awaiting_finish    <= '1';
							extra_time_new       <= '1';
							s_extra_time_started <= '0';
							extra_time_enable    <= '0';
						else
							s_awaiting_finish    <= '0';
						end if;
					end if;
					
					if (current_total_time = "0000000" and unsigned(s_extra_time) < to_unsigned(5, 7) and time_adj_but = '1') then
						s_extra_time <= std_logic_vector(unsigned(s_extra_time) + 1);
					end if;
				end if;
			end if;
		end if;
	end process;
	
	extra_time  <= current_extra_time(3 downto 0);
	current_time <= current_total_time;
	current_delay <= s_current_delay;
	
	in_progress <= not s_awaiting_finish when (s_current_delay = "0000000" and s_in_progress = '1') else '0';
	leds_phase  <= "111" when s_current_delay = "0000000" and s_in_progress = '1' and (unsigned(current_total_time) > (unsigned(Current_Program(1)) + unsigned(Current_Program(2)))) else
				   "011" when s_current_delay = "0000000" and s_in_progress = '1' and (unsigned(current_total_time) > unsigned(Current_Program(2))) else
				   "001" when s_current_delay = "0000000" and s_in_progress = '1' and (unsigned(current_total_time) > to_unsigned(0, 7) or (s_extra_time_started = '1' and s_awaiting_finish = '0')) else
				   "000";
end Behavioral;