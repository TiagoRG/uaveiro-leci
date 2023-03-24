-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "03/22/2023 12:51:10"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	AccN_Demo IS
    PORT (
	LEDR : OUT std_logic_vector(16 DOWNTO 0);
	KEY : IN std_logic_vector(1 DOWNTO 1);
	SW : IN std_logic_vector(17 DOWNTO 0);
	CLOCK_50 : IN std_logic
	);
END AccN_Demo;

-- Design Ports Information
-- LEDR[16]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[15]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[14]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[13]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[12]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[11]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[10]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[9]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[8]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[7]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[6]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[5]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[4]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[3]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[16]	=>  Location: PIN_Y24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[15]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[14]	=>  Location: PIN_AA23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[13]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[12]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[11]	=>  Location: PIN_AB24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[10]	=>  Location: PIN_AC24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_AC26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[1]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[17]	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF AccN_Demo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_LEDR : std_logic_vector(16 DOWNTO 0);
SIGNAL ww_KEY : std_logic_vector(1 DOWNTO 1);
SIGNAL ww_SW : std_logic_vector(17 DOWNTO 0);
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst2|clkOut~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \LEDR[16]~output_o\ : std_logic;
SIGNAL \LEDR[15]~output_o\ : std_logic;
SIGNAL \LEDR[14]~output_o\ : std_logic;
SIGNAL \LEDR[13]~output_o\ : std_logic;
SIGNAL \LEDR[12]~output_o\ : std_logic;
SIGNAL \LEDR[11]~output_o\ : std_logic;
SIGNAL \LEDR[10]~output_o\ : std_logic;
SIGNAL \LEDR[9]~output_o\ : std_logic;
SIGNAL \LEDR[8]~output_o\ : std_logic;
SIGNAL \LEDR[7]~output_o\ : std_logic;
SIGNAL \LEDR[6]~output_o\ : std_logic;
SIGNAL \LEDR[5]~output_o\ : std_logic;
SIGNAL \LEDR[4]~output_o\ : std_logic;
SIGNAL \LEDR[3]~output_o\ : std_logic;
SIGNAL \LEDR[2]~output_o\ : std_logic;
SIGNAL \LEDR[1]~output_o\ : std_logic;
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst2|Add2~0_combout\ : std_logic;
SIGNAL \inst2|Add2~1\ : std_logic;
SIGNAL \inst2|Add2~2_combout\ : std_logic;
SIGNAL \inst2|Add2~3\ : std_logic;
SIGNAL \inst2|Add2~4_combout\ : std_logic;
SIGNAL \inst2|Add2~5\ : std_logic;
SIGNAL \inst2|Add2~6_combout\ : std_logic;
SIGNAL \inst2|Add2~7\ : std_logic;
SIGNAL \inst2|Add2~8_combout\ : std_logic;
SIGNAL \inst2|Equal0~5_combout\ : std_logic;
SIGNAL \inst2|Add2~9\ : std_logic;
SIGNAL \inst2|Add2~10_combout\ : std_logic;
SIGNAL \inst2|Add2~11\ : std_logic;
SIGNAL \inst2|Add2~12_combout\ : std_logic;
SIGNAL \inst2|s_counter~10_combout\ : std_logic;
SIGNAL \inst2|Add2~13\ : std_logic;
SIGNAL \inst2|Add2~14_combout\ : std_logic;
SIGNAL \inst2|Add2~15\ : std_logic;
SIGNAL \inst2|Add2~16_combout\ : std_logic;
SIGNAL \inst2|Add2~17\ : std_logic;
SIGNAL \inst2|Add2~18_combout\ : std_logic;
SIGNAL \inst2|Add2~19\ : std_logic;
SIGNAL \inst2|Add2~20_combout\ : std_logic;
SIGNAL \inst2|Add2~21\ : std_logic;
SIGNAL \inst2|Add2~22_combout\ : std_logic;
SIGNAL \inst2|s_counter~9_combout\ : std_logic;
SIGNAL \inst2|Add2~23\ : std_logic;
SIGNAL \inst2|Add2~24_combout\ : std_logic;
SIGNAL \inst2|s_counter~8_combout\ : std_logic;
SIGNAL \inst2|Add2~25\ : std_logic;
SIGNAL \inst2|Add2~26_combout\ : std_logic;
SIGNAL \inst2|s_counter~7_combout\ : std_logic;
SIGNAL \inst2|Add2~27\ : std_logic;
SIGNAL \inst2|Add2~28_combout\ : std_logic;
SIGNAL \inst2|s_counter~4_combout\ : std_logic;
SIGNAL \inst2|Add2~29\ : std_logic;
SIGNAL \inst2|Add2~30_combout\ : std_logic;
SIGNAL \inst2|Add2~31\ : std_logic;
SIGNAL \inst2|Add2~32_combout\ : std_logic;
SIGNAL \inst2|s_counter~3_combout\ : std_logic;
SIGNAL \inst2|Add2~33\ : std_logic;
SIGNAL \inst2|Add2~34_combout\ : std_logic;
SIGNAL \inst2|Add2~35\ : std_logic;
SIGNAL \inst2|Add2~36_combout\ : std_logic;
SIGNAL \inst2|s_counter~6_combout\ : std_logic;
SIGNAL \inst2|Equal0~2_combout\ : std_logic;
SIGNAL \inst2|Equal0~3_combout\ : std_logic;
SIGNAL \inst2|Add2~37\ : std_logic;
SIGNAL \inst2|Add2~38_combout\ : std_logic;
SIGNAL \inst2|s_counter~2_combout\ : std_logic;
SIGNAL \inst2|Add2~39\ : std_logic;
SIGNAL \inst2|Add2~40_combout\ : std_logic;
SIGNAL \inst2|Add2~41\ : std_logic;
SIGNAL \inst2|Add2~43\ : std_logic;
SIGNAL \inst2|Add2~44_combout\ : std_logic;
SIGNAL \inst2|Add2~45\ : std_logic;
SIGNAL \inst2|Add2~46_combout\ : std_logic;
SIGNAL \inst2|s_counter~5_combout\ : std_logic;
SIGNAL \inst2|Add2~47\ : std_logic;
SIGNAL \inst2|Add2~48_combout\ : std_logic;
SIGNAL \inst2|s_counter~0_combout\ : std_logic;
SIGNAL \inst2|Add2~49\ : std_logic;
SIGNAL \inst2|Add2~50_combout\ : std_logic;
SIGNAL \inst2|Add2~51\ : std_logic;
SIGNAL \inst2|Add2~52_combout\ : std_logic;
SIGNAL \inst2|Add2~53\ : std_logic;
SIGNAL \inst2|Add2~54_combout\ : std_logic;
SIGNAL \inst2|Add2~55\ : std_logic;
SIGNAL \inst2|Add2~56_combout\ : std_logic;
SIGNAL \inst2|Add2~57\ : std_logic;
SIGNAL \inst2|Add2~58_combout\ : std_logic;
SIGNAL \inst2|Add2~59\ : std_logic;
SIGNAL \inst2|Add2~60_combout\ : std_logic;
SIGNAL \inst2|Add2~61\ : std_logic;
SIGNAL \inst2|Add2~62_combout\ : std_logic;
SIGNAL \inst2|Equal0~0_combout\ : std_logic;
SIGNAL \inst2|Equal0~1_combout\ : std_logic;
SIGNAL \inst2|Equal0~4_combout\ : std_logic;
SIGNAL \inst2|Equal0~11_combout\ : std_logic;
SIGNAL \inst2|Add2~42_combout\ : std_logic;
SIGNAL \inst2|s_counter~1_combout\ : std_logic;
SIGNAL \inst2|Equal0~7_combout\ : std_logic;
SIGNAL \inst2|Equal0~8_combout\ : std_logic;
SIGNAL \inst2|Equal0~9_combout\ : std_logic;
SIGNAL \inst2|Equal0~10_combout\ : std_logic;
SIGNAL \inst2|clkOut~0_combout\ : std_logic;
SIGNAL \inst2|clkOut~2_combout\ : std_logic;
SIGNAL \inst2|clkOut~1_combout\ : std_logic;
SIGNAL \inst2|clkOut~3_combout\ : std_logic;
SIGNAL \inst2|Equal0~6_combout\ : std_logic;
SIGNAL \inst2|clkOut~4_combout\ : std_logic;
SIGNAL \inst2|clkOut~feeder_combout\ : std_logic;
SIGNAL \inst2|clkOut~q\ : std_logic;
SIGNAL \inst2|clkOut~clkctrl_outclk\ : std_logic;
SIGNAL \SW[16]~input_o\ : std_logic;
SIGNAL \SW[15]~input_o\ : std_logic;
SIGNAL \SW[14]~input_o\ : std_logic;
SIGNAL \SW[13]~input_o\ : std_logic;
SIGNAL \SW[12]~input_o\ : std_logic;
SIGNAL \SW[11]~input_o\ : std_logic;
SIGNAL \SW[10]~input_o\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \inst|reg|dataOut[0]~17_combout\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \SW[17]~input_o\ : std_logic;
SIGNAL \inst|reg|dataOut[0]~18\ : std_logic;
SIGNAL \inst|reg|dataOut[1]~19_combout\ : std_logic;
SIGNAL \inst|reg|dataOut[1]~20\ : std_logic;
SIGNAL \inst|reg|dataOut[2]~21_combout\ : std_logic;
SIGNAL \inst|reg|dataOut[2]~22\ : std_logic;
SIGNAL \inst|reg|dataOut[3]~23_combout\ : std_logic;
SIGNAL \inst|reg|dataOut[3]~24\ : std_logic;
SIGNAL \inst|reg|dataOut[4]~25_combout\ : std_logic;
SIGNAL \inst|reg|dataOut[4]~26\ : std_logic;
SIGNAL \inst|reg|dataOut[5]~27_combout\ : std_logic;
SIGNAL \inst|reg|dataOut[5]~28\ : std_logic;
SIGNAL \inst|reg|dataOut[6]~29_combout\ : std_logic;
SIGNAL \inst|reg|dataOut[6]~30\ : std_logic;
SIGNAL \inst|reg|dataOut[7]~31_combout\ : std_logic;
SIGNAL \inst|reg|dataOut[7]~32\ : std_logic;
SIGNAL \inst|reg|dataOut[8]~33_combout\ : std_logic;
SIGNAL \inst|reg|dataOut[8]~34\ : std_logic;
SIGNAL \inst|reg|dataOut[9]~35_combout\ : std_logic;
SIGNAL \inst|reg|dataOut[9]~36\ : std_logic;
SIGNAL \inst|reg|dataOut[10]~37_combout\ : std_logic;
SIGNAL \inst|reg|dataOut[10]~38\ : std_logic;
SIGNAL \inst|reg|dataOut[11]~39_combout\ : std_logic;
SIGNAL \inst|reg|dataOut[11]~40\ : std_logic;
SIGNAL \inst|reg|dataOut[12]~41_combout\ : std_logic;
SIGNAL \inst|reg|dataOut[12]~42\ : std_logic;
SIGNAL \inst|reg|dataOut[13]~43_combout\ : std_logic;
SIGNAL \inst|reg|dataOut[13]~44\ : std_logic;
SIGNAL \inst|reg|dataOut[14]~45_combout\ : std_logic;
SIGNAL \inst|reg|dataOut[14]~46\ : std_logic;
SIGNAL \inst|reg|dataOut[15]~47_combout\ : std_logic;
SIGNAL \inst|reg|dataOut[15]~48\ : std_logic;
SIGNAL \inst|reg|dataOut[16]~49_combout\ : std_logic;
SIGNAL \inst2|s_counter\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \inst|reg|dataOut\ : std_logic_vector(16 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

LEDR <= ww_LEDR;
ww_KEY <= KEY;
ww_SW <= SW;
ww_CLOCK_50 <= CLOCK_50;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);

\inst2|clkOut~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \inst2|clkOut~q\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X67_Y73_N2
\LEDR[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|reg|dataOut\(16),
	devoe => ww_devoe,
	o => \LEDR[16]~output_o\);

-- Location: IOOBUF_X65_Y73_N9
\LEDR[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|reg|dataOut\(15),
	devoe => ww_devoe,
	o => \LEDR[15]~output_o\);

-- Location: IOOBUF_X58_Y73_N2
\LEDR[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|reg|dataOut\(14),
	devoe => ww_devoe,
	o => \LEDR[14]~output_o\);

-- Location: IOOBUF_X67_Y73_N9
\LEDR[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|reg|dataOut\(13),
	devoe => ww_devoe,
	o => \LEDR[13]~output_o\);

-- Location: IOOBUF_X65_Y73_N16
\LEDR[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|reg|dataOut\(12),
	devoe => ww_devoe,
	o => \LEDR[12]~output_o\);

-- Location: IOOBUF_X65_Y73_N23
\LEDR[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|reg|dataOut\(11),
	devoe => ww_devoe,
	o => \LEDR[11]~output_o\);

-- Location: IOOBUF_X60_Y73_N23
\LEDR[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|reg|dataOut\(10),
	devoe => ww_devoe,
	o => \LEDR[10]~output_o\);

-- Location: IOOBUF_X83_Y73_N23
\LEDR[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|reg|dataOut\(9),
	devoe => ww_devoe,
	o => \LEDR[9]~output_o\);

-- Location: IOOBUF_X69_Y73_N2
\LEDR[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|reg|dataOut\(8),
	devoe => ww_devoe,
	o => \LEDR[8]~output_o\);

-- Location: IOOBUF_X72_Y73_N2
\LEDR[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|reg|dataOut\(7),
	devoe => ww_devoe,
	o => \LEDR[7]~output_o\);

-- Location: IOOBUF_X72_Y73_N9
\LEDR[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|reg|dataOut\(6),
	devoe => ww_devoe,
	o => \LEDR[6]~output_o\);

-- Location: IOOBUF_X87_Y73_N9
\LEDR[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|reg|dataOut\(5),
	devoe => ww_devoe,
	o => \LEDR[5]~output_o\);

-- Location: IOOBUF_X87_Y73_N16
\LEDR[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|reg|dataOut\(4),
	devoe => ww_devoe,
	o => \LEDR[4]~output_o\);

-- Location: IOOBUF_X107_Y73_N16
\LEDR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|reg|dataOut\(3),
	devoe => ww_devoe,
	o => \LEDR[3]~output_o\);

-- Location: IOOBUF_X94_Y73_N9
\LEDR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|reg|dataOut\(2),
	devoe => ww_devoe,
	o => \LEDR[2]~output_o\);

-- Location: IOOBUF_X94_Y73_N2
\LEDR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|reg|dataOut\(1),
	devoe => ww_devoe,
	o => \LEDR[1]~output_o\);

-- Location: IOOBUF_X69_Y73_N16
\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|reg|dataOut\(0),
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G4
\CLOCK_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: LCCOMB_X24_Y36_N0
\inst2|Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~0_combout\ = \inst2|s_counter\(0) $ (VCC)
-- \inst2|Add2~1\ = CARRY(\inst2|s_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|s_counter\(0),
	datad => VCC,
	combout => \inst2|Add2~0_combout\,
	cout => \inst2|Add2~1\);

-- Location: FF_X24_Y36_N1
\inst2|s_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|Add2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(0));

-- Location: LCCOMB_X24_Y36_N2
\inst2|Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~2_combout\ = (\inst2|s_counter\(1) & (!\inst2|Add2~1\)) # (!\inst2|s_counter\(1) & ((\inst2|Add2~1\) # (GND)))
-- \inst2|Add2~3\ = CARRY((!\inst2|Add2~1\) # (!\inst2|s_counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|s_counter\(1),
	datad => VCC,
	cin => \inst2|Add2~1\,
	combout => \inst2|Add2~2_combout\,
	cout => \inst2|Add2~3\);

-- Location: FF_X24_Y36_N3
\inst2|s_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|Add2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(1));

-- Location: LCCOMB_X24_Y36_N4
\inst2|Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~4_combout\ = (\inst2|s_counter\(2) & (\inst2|Add2~3\ $ (GND))) # (!\inst2|s_counter\(2) & (!\inst2|Add2~3\ & VCC))
-- \inst2|Add2~5\ = CARRY((\inst2|s_counter\(2) & !\inst2|Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|s_counter\(2),
	datad => VCC,
	cin => \inst2|Add2~3\,
	combout => \inst2|Add2~4_combout\,
	cout => \inst2|Add2~5\);

-- Location: FF_X24_Y36_N5
\inst2|s_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|Add2~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(2));

-- Location: LCCOMB_X24_Y36_N6
\inst2|Add2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~6_combout\ = (\inst2|s_counter\(3) & (!\inst2|Add2~5\)) # (!\inst2|s_counter\(3) & ((\inst2|Add2~5\) # (GND)))
-- \inst2|Add2~7\ = CARRY((!\inst2|Add2~5\) # (!\inst2|s_counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(3),
	datad => VCC,
	cin => \inst2|Add2~5\,
	combout => \inst2|Add2~6_combout\,
	cout => \inst2|Add2~7\);

-- Location: FF_X24_Y36_N7
\inst2|s_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|Add2~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(3));

-- Location: LCCOMB_X24_Y36_N8
\inst2|Add2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~8_combout\ = (\inst2|s_counter\(4) & (\inst2|Add2~7\ $ (GND))) # (!\inst2|s_counter\(4) & (!\inst2|Add2~7\ & VCC))
-- \inst2|Add2~9\ = CARRY((\inst2|s_counter\(4) & !\inst2|Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|s_counter\(4),
	datad => VCC,
	cin => \inst2|Add2~7\,
	combout => \inst2|Add2~8_combout\,
	cout => \inst2|Add2~9\);

-- Location: FF_X24_Y36_N9
\inst2|s_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|Add2~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(4));

-- Location: LCCOMB_X23_Y36_N28
\inst2|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Equal0~5_combout\ = (\inst2|s_counter\(4) & (\inst2|s_counter\(3) & (\inst2|s_counter\(1) & \inst2|s_counter\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(4),
	datab => \inst2|s_counter\(3),
	datac => \inst2|s_counter\(1),
	datad => \inst2|s_counter\(2),
	combout => \inst2|Equal0~5_combout\);

-- Location: LCCOMB_X24_Y36_N10
\inst2|Add2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~10_combout\ = (\inst2|s_counter\(5) & (!\inst2|Add2~9\)) # (!\inst2|s_counter\(5) & ((\inst2|Add2~9\) # (GND)))
-- \inst2|Add2~11\ = CARRY((!\inst2|Add2~9\) # (!\inst2|s_counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(5),
	datad => VCC,
	cin => \inst2|Add2~9\,
	combout => \inst2|Add2~10_combout\,
	cout => \inst2|Add2~11\);

-- Location: FF_X24_Y36_N11
\inst2|s_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|Add2~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(5));

-- Location: LCCOMB_X24_Y36_N12
\inst2|Add2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~12_combout\ = (\inst2|s_counter\(6) & (\inst2|Add2~11\ $ (GND))) # (!\inst2|s_counter\(6) & (!\inst2|Add2~11\ & VCC))
-- \inst2|Add2~13\ = CARRY((\inst2|s_counter\(6) & !\inst2|Add2~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|s_counter\(6),
	datad => VCC,
	cin => \inst2|Add2~11\,
	combout => \inst2|Add2~12_combout\,
	cout => \inst2|Add2~13\);

-- Location: LCCOMB_X23_Y36_N6
\inst2|s_counter~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|s_counter~10_combout\ = (\inst2|Add2~12_combout\ & !\inst2|Equal0~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|Add2~12_combout\,
	datac => \inst2|Equal0~11_combout\,
	combout => \inst2|s_counter~10_combout\);

-- Location: FF_X23_Y36_N7
\inst2|s_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|s_counter~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(6));

-- Location: LCCOMB_X24_Y36_N14
\inst2|Add2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~14_combout\ = (\inst2|s_counter\(7) & (!\inst2|Add2~13\)) # (!\inst2|s_counter\(7) & ((\inst2|Add2~13\) # (GND)))
-- \inst2|Add2~15\ = CARRY((!\inst2|Add2~13\) # (!\inst2|s_counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|s_counter\(7),
	datad => VCC,
	cin => \inst2|Add2~13\,
	combout => \inst2|Add2~14_combout\,
	cout => \inst2|Add2~15\);

-- Location: FF_X24_Y36_N15
\inst2|s_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|Add2~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(7));

-- Location: LCCOMB_X24_Y36_N16
\inst2|Add2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~16_combout\ = (\inst2|s_counter\(8) & (\inst2|Add2~15\ $ (GND))) # (!\inst2|s_counter\(8) & (!\inst2|Add2~15\ & VCC))
-- \inst2|Add2~17\ = CARRY((\inst2|s_counter\(8) & !\inst2|Add2~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|s_counter\(8),
	datad => VCC,
	cin => \inst2|Add2~15\,
	combout => \inst2|Add2~16_combout\,
	cout => \inst2|Add2~17\);

-- Location: FF_X24_Y36_N17
\inst2|s_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|Add2~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(8));

-- Location: LCCOMB_X24_Y36_N18
\inst2|Add2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~18_combout\ = (\inst2|s_counter\(9) & (!\inst2|Add2~17\)) # (!\inst2|s_counter\(9) & ((\inst2|Add2~17\) # (GND)))
-- \inst2|Add2~19\ = CARRY((!\inst2|Add2~17\) # (!\inst2|s_counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|s_counter\(9),
	datad => VCC,
	cin => \inst2|Add2~17\,
	combout => \inst2|Add2~18_combout\,
	cout => \inst2|Add2~19\);

-- Location: FF_X24_Y36_N19
\inst2|s_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|Add2~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(9));

-- Location: LCCOMB_X24_Y36_N20
\inst2|Add2~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~20_combout\ = (\inst2|s_counter\(10) & (\inst2|Add2~19\ $ (GND))) # (!\inst2|s_counter\(10) & (!\inst2|Add2~19\ & VCC))
-- \inst2|Add2~21\ = CARRY((\inst2|s_counter\(10) & !\inst2|Add2~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|s_counter\(10),
	datad => VCC,
	cin => \inst2|Add2~19\,
	combout => \inst2|Add2~20_combout\,
	cout => \inst2|Add2~21\);

-- Location: FF_X24_Y36_N21
\inst2|s_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|Add2~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(10));

-- Location: LCCOMB_X24_Y36_N22
\inst2|Add2~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~22_combout\ = (\inst2|s_counter\(11) & (!\inst2|Add2~21\)) # (!\inst2|s_counter\(11) & ((\inst2|Add2~21\) # (GND)))
-- \inst2|Add2~23\ = CARRY((!\inst2|Add2~21\) # (!\inst2|s_counter\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(11),
	datad => VCC,
	cin => \inst2|Add2~21\,
	combout => \inst2|Add2~22_combout\,
	cout => \inst2|Add2~23\);

-- Location: LCCOMB_X23_Y36_N14
\inst2|s_counter~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|s_counter~9_combout\ = (!\inst2|Equal0~11_combout\ & \inst2|Add2~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|Equal0~11_combout\,
	datad => \inst2|Add2~22_combout\,
	combout => \inst2|s_counter~9_combout\);

-- Location: FF_X23_Y36_N15
\inst2|s_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|s_counter~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(11));

-- Location: LCCOMB_X24_Y36_N24
\inst2|Add2~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~24_combout\ = (\inst2|s_counter\(12) & (\inst2|Add2~23\ $ (GND))) # (!\inst2|s_counter\(12) & (!\inst2|Add2~23\ & VCC))
-- \inst2|Add2~25\ = CARRY((\inst2|s_counter\(12) & !\inst2|Add2~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(12),
	datad => VCC,
	cin => \inst2|Add2~23\,
	combout => \inst2|Add2~24_combout\,
	cout => \inst2|Add2~25\);

-- Location: LCCOMB_X23_Y36_N10
\inst2|s_counter~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|s_counter~8_combout\ = (!\inst2|Equal0~11_combout\ & \inst2|Add2~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|Equal0~11_combout\,
	datad => \inst2|Add2~24_combout\,
	combout => \inst2|s_counter~8_combout\);

-- Location: FF_X23_Y36_N11
\inst2|s_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|s_counter~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(12));

-- Location: LCCOMB_X24_Y36_N26
\inst2|Add2~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~26_combout\ = (\inst2|s_counter\(13) & (!\inst2|Add2~25\)) # (!\inst2|s_counter\(13) & ((\inst2|Add2~25\) # (GND)))
-- \inst2|Add2~27\ = CARRY((!\inst2|Add2~25\) # (!\inst2|s_counter\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|s_counter\(13),
	datad => VCC,
	cin => \inst2|Add2~25\,
	combout => \inst2|Add2~26_combout\,
	cout => \inst2|Add2~27\);

-- Location: LCCOMB_X23_Y36_N22
\inst2|s_counter~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|s_counter~7_combout\ = (!\inst2|Equal0~11_combout\ & \inst2|Add2~26_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|Equal0~11_combout\,
	datad => \inst2|Add2~26_combout\,
	combout => \inst2|s_counter~7_combout\);

-- Location: FF_X23_Y36_N23
\inst2|s_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|s_counter~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(13));

-- Location: LCCOMB_X24_Y36_N28
\inst2|Add2~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~28_combout\ = (\inst2|s_counter\(14) & (\inst2|Add2~27\ $ (GND))) # (!\inst2|s_counter\(14) & (!\inst2|Add2~27\ & VCC))
-- \inst2|Add2~29\ = CARRY((\inst2|s_counter\(14) & !\inst2|Add2~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(14),
	datad => VCC,
	cin => \inst2|Add2~27\,
	combout => \inst2|Add2~28_combout\,
	cout => \inst2|Add2~29\);

-- Location: LCCOMB_X23_Y35_N24
\inst2|s_counter~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|s_counter~4_combout\ = (!\inst2|Equal0~11_combout\ & \inst2|Add2~28_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|Equal0~11_combout\,
	datad => \inst2|Add2~28_combout\,
	combout => \inst2|s_counter~4_combout\);

-- Location: FF_X23_Y35_N25
\inst2|s_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|s_counter~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(14));

-- Location: LCCOMB_X24_Y36_N30
\inst2|Add2~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~30_combout\ = (\inst2|s_counter\(15) & (!\inst2|Add2~29\)) # (!\inst2|s_counter\(15) & ((\inst2|Add2~29\) # (GND)))
-- \inst2|Add2~31\ = CARRY((!\inst2|Add2~29\) # (!\inst2|s_counter\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(15),
	datad => VCC,
	cin => \inst2|Add2~29\,
	combout => \inst2|Add2~30_combout\,
	cout => \inst2|Add2~31\);

-- Location: FF_X24_Y36_N31
\inst2|s_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|Add2~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(15));

-- Location: LCCOMB_X24_Y35_N0
\inst2|Add2~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~32_combout\ = (\inst2|s_counter\(16) & (\inst2|Add2~31\ $ (GND))) # (!\inst2|s_counter\(16) & (!\inst2|Add2~31\ & VCC))
-- \inst2|Add2~33\ = CARRY((\inst2|s_counter\(16) & !\inst2|Add2~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(16),
	datad => VCC,
	cin => \inst2|Add2~31\,
	combout => \inst2|Add2~32_combout\,
	cout => \inst2|Add2~33\);

-- Location: LCCOMB_X23_Y35_N16
\inst2|s_counter~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|s_counter~3_combout\ = (!\inst2|Equal0~11_combout\ & \inst2|Add2~32_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Equal0~11_combout\,
	datac => \inst2|Add2~32_combout\,
	combout => \inst2|s_counter~3_combout\);

-- Location: FF_X23_Y35_N17
\inst2|s_counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|s_counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(16));

-- Location: LCCOMB_X24_Y35_N2
\inst2|Add2~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~34_combout\ = (\inst2|s_counter\(17) & (!\inst2|Add2~33\)) # (!\inst2|s_counter\(17) & ((\inst2|Add2~33\) # (GND)))
-- \inst2|Add2~35\ = CARRY((!\inst2|Add2~33\) # (!\inst2|s_counter\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|s_counter\(17),
	datad => VCC,
	cin => \inst2|Add2~33\,
	combout => \inst2|Add2~34_combout\,
	cout => \inst2|Add2~35\);

-- Location: FF_X24_Y35_N3
\inst2|s_counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|Add2~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(17));

-- Location: LCCOMB_X24_Y35_N4
\inst2|Add2~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~36_combout\ = (\inst2|s_counter\(18) & (\inst2|Add2~35\ $ (GND))) # (!\inst2|s_counter\(18) & (!\inst2|Add2~35\ & VCC))
-- \inst2|Add2~37\ = CARRY((\inst2|s_counter\(18) & !\inst2|Add2~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(18),
	datad => VCC,
	cin => \inst2|Add2~35\,
	combout => \inst2|Add2~36_combout\,
	cout => \inst2|Add2~37\);

-- Location: LCCOMB_X23_Y36_N18
\inst2|s_counter~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|s_counter~6_combout\ = (!\inst2|Equal0~11_combout\ & \inst2|Add2~36_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|Equal0~11_combout\,
	datad => \inst2|Add2~36_combout\,
	combout => \inst2|s_counter~6_combout\);

-- Location: FF_X23_Y36_N19
\inst2|s_counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|s_counter~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(18));

-- Location: LCCOMB_X23_Y36_N26
\inst2|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Equal0~2_combout\ = (\inst2|s_counter\(12) & (\inst2|s_counter\(11) & (\inst2|s_counter\(13) & \inst2|s_counter\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(12),
	datab => \inst2|s_counter\(11),
	datac => \inst2|s_counter\(13),
	datad => \inst2|s_counter\(18),
	combout => \inst2|Equal0~2_combout\);

-- Location: LCCOMB_X23_Y36_N8
\inst2|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Equal0~3_combout\ = (!\inst2|s_counter\(6) & (!\inst2|s_counter\(8) & (!\inst2|s_counter\(7) & !\inst2|s_counter\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(6),
	datab => \inst2|s_counter\(8),
	datac => \inst2|s_counter\(7),
	datad => \inst2|s_counter\(9),
	combout => \inst2|Equal0~3_combout\);

-- Location: LCCOMB_X24_Y35_N6
\inst2|Add2~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~38_combout\ = (\inst2|s_counter\(19) & (!\inst2|Add2~37\)) # (!\inst2|s_counter\(19) & ((\inst2|Add2~37\) # (GND)))
-- \inst2|Add2~39\ = CARRY((!\inst2|Add2~37\) # (!\inst2|s_counter\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|s_counter\(19),
	datad => VCC,
	cin => \inst2|Add2~37\,
	combout => \inst2|Add2~38_combout\,
	cout => \inst2|Add2~39\);

-- Location: LCCOMB_X23_Y35_N6
\inst2|s_counter~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|s_counter~2_combout\ = (!\inst2|Equal0~11_combout\ & \inst2|Add2~38_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|Equal0~11_combout\,
	datad => \inst2|Add2~38_combout\,
	combout => \inst2|s_counter~2_combout\);

-- Location: FF_X23_Y35_N7
\inst2|s_counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|s_counter~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(19));

-- Location: LCCOMB_X24_Y35_N8
\inst2|Add2~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~40_combout\ = (\inst2|s_counter\(20) & (\inst2|Add2~39\ $ (GND))) # (!\inst2|s_counter\(20) & (!\inst2|Add2~39\ & VCC))
-- \inst2|Add2~41\ = CARRY((\inst2|s_counter\(20) & !\inst2|Add2~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|s_counter\(20),
	datad => VCC,
	cin => \inst2|Add2~39\,
	combout => \inst2|Add2~40_combout\,
	cout => \inst2|Add2~41\);

-- Location: FF_X24_Y35_N9
\inst2|s_counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|Add2~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(20));

-- Location: LCCOMB_X24_Y35_N10
\inst2|Add2~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~42_combout\ = (\inst2|s_counter\(21) & (!\inst2|Add2~41\)) # (!\inst2|s_counter\(21) & ((\inst2|Add2~41\) # (GND)))
-- \inst2|Add2~43\ = CARRY((!\inst2|Add2~41\) # (!\inst2|s_counter\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|s_counter\(21),
	datad => VCC,
	cin => \inst2|Add2~41\,
	combout => \inst2|Add2~42_combout\,
	cout => \inst2|Add2~43\);

-- Location: LCCOMB_X24_Y35_N12
\inst2|Add2~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~44_combout\ = (\inst2|s_counter\(22) & (\inst2|Add2~43\ $ (GND))) # (!\inst2|s_counter\(22) & (!\inst2|Add2~43\ & VCC))
-- \inst2|Add2~45\ = CARRY((\inst2|s_counter\(22) & !\inst2|Add2~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(22),
	datad => VCC,
	cin => \inst2|Add2~43\,
	combout => \inst2|Add2~44_combout\,
	cout => \inst2|Add2~45\);

-- Location: FF_X24_Y35_N13
\inst2|s_counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|Add2~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(22));

-- Location: LCCOMB_X24_Y35_N14
\inst2|Add2~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~46_combout\ = (\inst2|s_counter\(23) & (!\inst2|Add2~45\)) # (!\inst2|s_counter\(23) & ((\inst2|Add2~45\) # (GND)))
-- \inst2|Add2~47\ = CARRY((!\inst2|Add2~45\) # (!\inst2|s_counter\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(23),
	datad => VCC,
	cin => \inst2|Add2~45\,
	combout => \inst2|Add2~46_combout\,
	cout => \inst2|Add2~47\);

-- Location: LCCOMB_X23_Y36_N4
\inst2|s_counter~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|s_counter~5_combout\ = (!\inst2|Equal0~11_combout\ & \inst2|Add2~46_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|Equal0~11_combout\,
	datad => \inst2|Add2~46_combout\,
	combout => \inst2|s_counter~5_combout\);

-- Location: FF_X23_Y36_N5
\inst2|s_counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|s_counter~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(23));

-- Location: LCCOMB_X24_Y35_N16
\inst2|Add2~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~48_combout\ = (\inst2|s_counter\(24) & (\inst2|Add2~47\ $ (GND))) # (!\inst2|s_counter\(24) & (!\inst2|Add2~47\ & VCC))
-- \inst2|Add2~49\ = CARRY((\inst2|s_counter\(24) & !\inst2|Add2~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|s_counter\(24),
	datad => VCC,
	cin => \inst2|Add2~47\,
	combout => \inst2|Add2~48_combout\,
	cout => \inst2|Add2~49\);

-- Location: LCCOMB_X23_Y35_N28
\inst2|s_counter~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|s_counter~0_combout\ = (!\inst2|Equal0~11_combout\ & \inst2|Add2~48_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|Equal0~11_combout\,
	datad => \inst2|Add2~48_combout\,
	combout => \inst2|s_counter~0_combout\);

-- Location: FF_X23_Y35_N29
\inst2|s_counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|s_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(24));

-- Location: LCCOMB_X24_Y35_N18
\inst2|Add2~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~50_combout\ = (\inst2|s_counter\(25) & (!\inst2|Add2~49\)) # (!\inst2|s_counter\(25) & ((\inst2|Add2~49\) # (GND)))
-- \inst2|Add2~51\ = CARRY((!\inst2|Add2~49\) # (!\inst2|s_counter\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|s_counter\(25),
	datad => VCC,
	cin => \inst2|Add2~49\,
	combout => \inst2|Add2~50_combout\,
	cout => \inst2|Add2~51\);

-- Location: FF_X24_Y35_N19
\inst2|s_counter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|Add2~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(25));

-- Location: LCCOMB_X24_Y35_N20
\inst2|Add2~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~52_combout\ = (\inst2|s_counter\(26) & (\inst2|Add2~51\ $ (GND))) # (!\inst2|s_counter\(26) & (!\inst2|Add2~51\ & VCC))
-- \inst2|Add2~53\ = CARRY((\inst2|s_counter\(26) & !\inst2|Add2~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|s_counter\(26),
	datad => VCC,
	cin => \inst2|Add2~51\,
	combout => \inst2|Add2~52_combout\,
	cout => \inst2|Add2~53\);

-- Location: FF_X24_Y35_N21
\inst2|s_counter[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|Add2~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(26));

-- Location: LCCOMB_X24_Y35_N22
\inst2|Add2~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~54_combout\ = (\inst2|s_counter\(27) & (!\inst2|Add2~53\)) # (!\inst2|s_counter\(27) & ((\inst2|Add2~53\) # (GND)))
-- \inst2|Add2~55\ = CARRY((!\inst2|Add2~53\) # (!\inst2|s_counter\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(27),
	datad => VCC,
	cin => \inst2|Add2~53\,
	combout => \inst2|Add2~54_combout\,
	cout => \inst2|Add2~55\);

-- Location: FF_X24_Y35_N23
\inst2|s_counter[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|Add2~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(27));

-- Location: LCCOMB_X24_Y35_N24
\inst2|Add2~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~56_combout\ = (\inst2|s_counter\(28) & (\inst2|Add2~55\ $ (GND))) # (!\inst2|s_counter\(28) & (!\inst2|Add2~55\ & VCC))
-- \inst2|Add2~57\ = CARRY((\inst2|s_counter\(28) & !\inst2|Add2~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|s_counter\(28),
	datad => VCC,
	cin => \inst2|Add2~55\,
	combout => \inst2|Add2~56_combout\,
	cout => \inst2|Add2~57\);

-- Location: FF_X24_Y35_N25
\inst2|s_counter[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|Add2~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(28));

-- Location: LCCOMB_X24_Y35_N26
\inst2|Add2~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~58_combout\ = (\inst2|s_counter\(29) & (!\inst2|Add2~57\)) # (!\inst2|s_counter\(29) & ((\inst2|Add2~57\) # (GND)))
-- \inst2|Add2~59\ = CARRY((!\inst2|Add2~57\) # (!\inst2|s_counter\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(29),
	datad => VCC,
	cin => \inst2|Add2~57\,
	combout => \inst2|Add2~58_combout\,
	cout => \inst2|Add2~59\);

-- Location: FF_X24_Y35_N27
\inst2|s_counter[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|Add2~58_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(29));

-- Location: LCCOMB_X24_Y35_N28
\inst2|Add2~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~60_combout\ = (\inst2|s_counter\(30) & (\inst2|Add2~59\ $ (GND))) # (!\inst2|s_counter\(30) & (!\inst2|Add2~59\ & VCC))
-- \inst2|Add2~61\ = CARRY((\inst2|s_counter\(30) & !\inst2|Add2~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|s_counter\(30),
	datad => VCC,
	cin => \inst2|Add2~59\,
	combout => \inst2|Add2~60_combout\,
	cout => \inst2|Add2~61\);

-- Location: FF_X24_Y35_N29
\inst2|s_counter[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|Add2~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(30));

-- Location: LCCOMB_X24_Y35_N30
\inst2|Add2~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Add2~62_combout\ = \inst2|s_counter\(31) $ (\inst2|Add2~61\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(31),
	cin => \inst2|Add2~61\,
	combout => \inst2|Add2~62_combout\);

-- Location: FF_X24_Y35_N31
\inst2|s_counter[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|Add2~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(31));

-- Location: LCCOMB_X23_Y35_N10
\inst2|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Equal0~0_combout\ = (!\inst2|s_counter\(31) & (!\inst2|s_counter\(30) & (!\inst2|s_counter\(29) & !\inst2|s_counter\(28))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(31),
	datab => \inst2|s_counter\(30),
	datac => \inst2|s_counter\(29),
	datad => \inst2|s_counter\(28),
	combout => \inst2|Equal0~0_combout\);

-- Location: LCCOMB_X23_Y36_N24
\inst2|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Equal0~1_combout\ = (!\inst2|s_counter\(27) & (!\inst2|s_counter\(26) & (\inst2|s_counter\(23) & !\inst2|s_counter\(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(27),
	datab => \inst2|s_counter\(26),
	datac => \inst2|s_counter\(23),
	datad => \inst2|s_counter\(25),
	combout => \inst2|Equal0~1_combout\);

-- Location: LCCOMB_X23_Y36_N20
\inst2|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Equal0~4_combout\ = (\inst2|Equal0~2_combout\ & (\inst2|Equal0~3_combout\ & (\inst2|Equal0~0_combout\ & \inst2|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Equal0~2_combout\,
	datab => \inst2|Equal0~3_combout\,
	datac => \inst2|Equal0~0_combout\,
	datad => \inst2|Equal0~1_combout\,
	combout => \inst2|Equal0~4_combout\);

-- Location: LCCOMB_X23_Y36_N30
\inst2|Equal0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Equal0~11_combout\ = (\inst2|s_counter\(0) & (\inst2|Equal0~5_combout\ & (\inst2|Equal0~10_combout\ & \inst2|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(0),
	datab => \inst2|Equal0~5_combout\,
	datac => \inst2|Equal0~10_combout\,
	datad => \inst2|Equal0~4_combout\,
	combout => \inst2|Equal0~11_combout\);

-- Location: LCCOMB_X23_Y35_N22
\inst2|s_counter~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|s_counter~1_combout\ = (!\inst2|Equal0~11_combout\ & \inst2|Add2~42_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Equal0~11_combout\,
	datac => \inst2|Add2~42_combout\,
	combout => \inst2|s_counter~1_combout\);

-- Location: FF_X23_Y35_N23
\inst2|s_counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|s_counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_counter\(21));

-- Location: LCCOMB_X23_Y35_N4
\inst2|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Equal0~7_combout\ = (\inst2|s_counter\(21) & (!\inst2|s_counter\(22) & (!\inst2|s_counter\(20) & \inst2|s_counter\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(21),
	datab => \inst2|s_counter\(22),
	datac => \inst2|s_counter\(20),
	datad => \inst2|s_counter\(24),
	combout => \inst2|Equal0~7_combout\);

-- Location: LCCOMB_X23_Y35_N26
\inst2|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Equal0~8_combout\ = (\inst2|s_counter\(19) & (\inst2|s_counter\(16) & (!\inst2|s_counter\(15) & !\inst2|s_counter\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(19),
	datab => \inst2|s_counter\(16),
	datac => \inst2|s_counter\(15),
	datad => \inst2|s_counter\(17),
	combout => \inst2|Equal0~8_combout\);

-- Location: LCCOMB_X23_Y35_N12
\inst2|Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Equal0~9_combout\ = (\inst2|s_counter\(14) & (\inst2|s_counter\(5) & !\inst2|s_counter\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|s_counter\(14),
	datac => \inst2|s_counter\(5),
	datad => \inst2|s_counter\(10),
	combout => \inst2|Equal0~9_combout\);

-- Location: LCCOMB_X23_Y35_N2
\inst2|Equal0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Equal0~10_combout\ = (\inst2|Equal0~7_combout\ & (\inst2|Equal0~8_combout\ & \inst2|Equal0~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|Equal0~7_combout\,
	datac => \inst2|Equal0~8_combout\,
	datad => \inst2|Equal0~9_combout\,
	combout => \inst2|Equal0~10_combout\);

-- Location: LCCOMB_X23_Y35_N20
\inst2|clkOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|clkOut~0_combout\ = (!\inst2|s_counter\(21) & (\inst2|s_counter\(22) & (\inst2|s_counter\(20) & !\inst2|s_counter\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(21),
	datab => \inst2|s_counter\(22),
	datac => \inst2|s_counter\(20),
	datad => \inst2|s_counter\(24),
	combout => \inst2|clkOut~0_combout\);

-- Location: LCCOMB_X23_Y35_N14
\inst2|clkOut~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|clkOut~2_combout\ = (!\inst2|s_counter\(14) & (!\inst2|s_counter\(5) & \inst2|s_counter\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|s_counter\(14),
	datac => \inst2|s_counter\(5),
	datad => \inst2|s_counter\(10),
	combout => \inst2|clkOut~2_combout\);

-- Location: LCCOMB_X23_Y35_N18
\inst2|clkOut~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|clkOut~1_combout\ = (!\inst2|s_counter\(19) & (!\inst2|s_counter\(16) & (\inst2|s_counter\(15) & \inst2|s_counter\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_counter\(19),
	datab => \inst2|s_counter\(16),
	datac => \inst2|s_counter\(15),
	datad => \inst2|s_counter\(17),
	combout => \inst2|clkOut~1_combout\);

-- Location: LCCOMB_X23_Y35_N0
\inst2|clkOut~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|clkOut~3_combout\ = (\inst2|clkOut~0_combout\ & (\inst2|clkOut~2_combout\ & \inst2|clkOut~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|clkOut~0_combout\,
	datac => \inst2|clkOut~2_combout\,
	datad => \inst2|clkOut~1_combout\,
	combout => \inst2|clkOut~3_combout\);

-- Location: LCCOMB_X23_Y36_N12
\inst2|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Equal0~6_combout\ = (\inst2|Equal0~5_combout\ & (\inst2|s_counter\(0) & \inst2|Equal0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|Equal0~5_combout\,
	datac => \inst2|s_counter\(0),
	datad => \inst2|Equal0~4_combout\,
	combout => \inst2|Equal0~6_combout\);

-- Location: LCCOMB_X23_Y36_N16
\inst2|clkOut~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|clkOut~4_combout\ = (\inst2|Equal0~6_combout\ & (!\inst2|Equal0~10_combout\ & ((\inst2|clkOut~3_combout\) # (\inst2|clkOut~q\)))) # (!\inst2|Equal0~6_combout\ & (((\inst2|clkOut~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Equal0~10_combout\,
	datab => \inst2|clkOut~3_combout\,
	datac => \inst2|clkOut~q\,
	datad => \inst2|Equal0~6_combout\,
	combout => \inst2|clkOut~4_combout\);

-- Location: LCCOMB_X23_Y36_N2
\inst2|clkOut~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|clkOut~feeder_combout\ = \inst2|clkOut~4_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|clkOut~4_combout\,
	combout => \inst2|clkOut~feeder_combout\);

-- Location: FF_X23_Y36_N3
\inst2|clkOut\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|clkOut~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|clkOut~q\);

-- Location: CLKCTRL_G0
\inst2|clkOut~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst2|clkOut~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst2|clkOut~clkctrl_outclk\);

-- Location: IOIBUF_X115_Y13_N1
\SW[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(16),
	o => \SW[16]~input_o\);

-- Location: IOIBUF_X115_Y6_N15
\SW[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(15),
	o => \SW[15]~input_o\);

-- Location: IOIBUF_X115_Y10_N8
\SW[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(14),
	o => \SW[14]~input_o\);

-- Location: IOIBUF_X115_Y9_N22
\SW[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(13),
	o => \SW[13]~input_o\);

-- Location: IOIBUF_X115_Y7_N15
\SW[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(12),
	o => \SW[12]~input_o\);

-- Location: IOIBUF_X115_Y5_N15
\SW[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(11),
	o => \SW[11]~input_o\);

-- Location: IOIBUF_X115_Y4_N15
\SW[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(10),
	o => \SW[10]~input_o\);

-- Location: IOIBUF_X115_Y16_N8
\SW[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

-- Location: IOIBUF_X115_Y4_N22
\SW[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

-- Location: IOIBUF_X115_Y15_N1
\SW[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: IOIBUF_X115_Y10_N1
\SW[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: IOIBUF_X115_Y11_N8
\SW[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: IOIBUF_X115_Y18_N8
\SW[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: IOIBUF_X115_Y13_N8
\SW[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: IOIBUF_X115_Y15_N8
\SW[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: IOIBUF_X115_Y14_N1
\SW[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: IOIBUF_X115_Y17_N1
\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: LCCOMB_X114_Y42_N16
\inst|reg|dataOut[0]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg|dataOut[0]~17_combout\ = (\SW[0]~input_o\ & (\inst|reg|dataOut\(0) $ (VCC))) # (!\SW[0]~input_o\ & (\inst|reg|dataOut\(0) & VCC))
-- \inst|reg|dataOut[0]~18\ = CARRY((\SW[0]~input_o\ & \inst|reg|dataOut\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \inst|reg|dataOut\(0),
	datad => VCC,
	combout => \inst|reg|dataOut[0]~17_combout\,
	cout => \inst|reg|dataOut[0]~18\);

-- Location: IOIBUF_X115_Y53_N15
\KEY[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: IOIBUF_X115_Y14_N8
\SW[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(17),
	o => \SW[17]~input_o\);

-- Location: FF_X114_Y42_N17
\inst|reg|dataOut[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|clkOut~clkctrl_outclk\,
	d => \inst|reg|dataOut[0]~17_combout\,
	clrn => \KEY[1]~input_o\,
	ena => \SW[17]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg|dataOut\(0));

-- Location: LCCOMB_X114_Y42_N18
\inst|reg|dataOut[1]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg|dataOut[1]~19_combout\ = (\SW[1]~input_o\ & ((\inst|reg|dataOut\(1) & (\inst|reg|dataOut[0]~18\ & VCC)) # (!\inst|reg|dataOut\(1) & (!\inst|reg|dataOut[0]~18\)))) # (!\SW[1]~input_o\ & ((\inst|reg|dataOut\(1) & (!\inst|reg|dataOut[0]~18\)) # 
-- (!\inst|reg|dataOut\(1) & ((\inst|reg|dataOut[0]~18\) # (GND)))))
-- \inst|reg|dataOut[1]~20\ = CARRY((\SW[1]~input_o\ & (!\inst|reg|dataOut\(1) & !\inst|reg|dataOut[0]~18\)) # (!\SW[1]~input_o\ & ((!\inst|reg|dataOut[0]~18\) # (!\inst|reg|dataOut\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datab => \inst|reg|dataOut\(1),
	datad => VCC,
	cin => \inst|reg|dataOut[0]~18\,
	combout => \inst|reg|dataOut[1]~19_combout\,
	cout => \inst|reg|dataOut[1]~20\);

-- Location: FF_X114_Y42_N19
\inst|reg|dataOut[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|clkOut~clkctrl_outclk\,
	d => \inst|reg|dataOut[1]~19_combout\,
	clrn => \KEY[1]~input_o\,
	ena => \SW[17]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg|dataOut\(1));

-- Location: LCCOMB_X114_Y42_N20
\inst|reg|dataOut[2]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg|dataOut[2]~21_combout\ = ((\SW[2]~input_o\ $ (\inst|reg|dataOut\(2) $ (!\inst|reg|dataOut[1]~20\)))) # (GND)
-- \inst|reg|dataOut[2]~22\ = CARRY((\SW[2]~input_o\ & ((\inst|reg|dataOut\(2)) # (!\inst|reg|dataOut[1]~20\))) # (!\SW[2]~input_o\ & (\inst|reg|dataOut\(2) & !\inst|reg|dataOut[1]~20\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \SW[2]~input_o\,
	datab => \inst|reg|dataOut\(2),
	datad => VCC,
	cin => \inst|reg|dataOut[1]~20\,
	combout => \inst|reg|dataOut[2]~21_combout\,
	cout => \inst|reg|dataOut[2]~22\);

-- Location: FF_X114_Y42_N21
\inst|reg|dataOut[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|clkOut~clkctrl_outclk\,
	d => \inst|reg|dataOut[2]~21_combout\,
	clrn => \KEY[1]~input_o\,
	ena => \SW[17]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg|dataOut\(2));

-- Location: LCCOMB_X114_Y42_N22
\inst|reg|dataOut[3]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg|dataOut[3]~23_combout\ = (\inst|reg|dataOut\(3) & ((\SW[3]~input_o\ & (\inst|reg|dataOut[2]~22\ & VCC)) # (!\SW[3]~input_o\ & (!\inst|reg|dataOut[2]~22\)))) # (!\inst|reg|dataOut\(3) & ((\SW[3]~input_o\ & (!\inst|reg|dataOut[2]~22\)) # 
-- (!\SW[3]~input_o\ & ((\inst|reg|dataOut[2]~22\) # (GND)))))
-- \inst|reg|dataOut[3]~24\ = CARRY((\inst|reg|dataOut\(3) & (!\SW[3]~input_o\ & !\inst|reg|dataOut[2]~22\)) # (!\inst|reg|dataOut\(3) & ((!\inst|reg|dataOut[2]~22\) # (!\SW[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg|dataOut\(3),
	datab => \SW[3]~input_o\,
	datad => VCC,
	cin => \inst|reg|dataOut[2]~22\,
	combout => \inst|reg|dataOut[3]~23_combout\,
	cout => \inst|reg|dataOut[3]~24\);

-- Location: FF_X114_Y42_N23
\inst|reg|dataOut[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|clkOut~clkctrl_outclk\,
	d => \inst|reg|dataOut[3]~23_combout\,
	clrn => \KEY[1]~input_o\,
	ena => \SW[17]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg|dataOut\(3));

-- Location: LCCOMB_X114_Y42_N24
\inst|reg|dataOut[4]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg|dataOut[4]~25_combout\ = ((\SW[4]~input_o\ $ (\inst|reg|dataOut\(4) $ (!\inst|reg|dataOut[3]~24\)))) # (GND)
-- \inst|reg|dataOut[4]~26\ = CARRY((\SW[4]~input_o\ & ((\inst|reg|dataOut\(4)) # (!\inst|reg|dataOut[3]~24\))) # (!\SW[4]~input_o\ & (\inst|reg|dataOut\(4) & !\inst|reg|dataOut[3]~24\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \SW[4]~input_o\,
	datab => \inst|reg|dataOut\(4),
	datad => VCC,
	cin => \inst|reg|dataOut[3]~24\,
	combout => \inst|reg|dataOut[4]~25_combout\,
	cout => \inst|reg|dataOut[4]~26\);

-- Location: FF_X114_Y42_N25
\inst|reg|dataOut[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|clkOut~clkctrl_outclk\,
	d => \inst|reg|dataOut[4]~25_combout\,
	clrn => \KEY[1]~input_o\,
	ena => \SW[17]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg|dataOut\(4));

-- Location: LCCOMB_X114_Y42_N26
\inst|reg|dataOut[5]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg|dataOut[5]~27_combout\ = (\inst|reg|dataOut\(5) & ((\SW[5]~input_o\ & (\inst|reg|dataOut[4]~26\ & VCC)) # (!\SW[5]~input_o\ & (!\inst|reg|dataOut[4]~26\)))) # (!\inst|reg|dataOut\(5) & ((\SW[5]~input_o\ & (!\inst|reg|dataOut[4]~26\)) # 
-- (!\SW[5]~input_o\ & ((\inst|reg|dataOut[4]~26\) # (GND)))))
-- \inst|reg|dataOut[5]~28\ = CARRY((\inst|reg|dataOut\(5) & (!\SW[5]~input_o\ & !\inst|reg|dataOut[4]~26\)) # (!\inst|reg|dataOut\(5) & ((!\inst|reg|dataOut[4]~26\) # (!\SW[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg|dataOut\(5),
	datab => \SW[5]~input_o\,
	datad => VCC,
	cin => \inst|reg|dataOut[4]~26\,
	combout => \inst|reg|dataOut[5]~27_combout\,
	cout => \inst|reg|dataOut[5]~28\);

-- Location: FF_X114_Y42_N27
\inst|reg|dataOut[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|clkOut~clkctrl_outclk\,
	d => \inst|reg|dataOut[5]~27_combout\,
	clrn => \KEY[1]~input_o\,
	ena => \SW[17]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg|dataOut\(5));

-- Location: LCCOMB_X114_Y42_N28
\inst|reg|dataOut[6]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg|dataOut[6]~29_combout\ = ((\SW[6]~input_o\ $ (\inst|reg|dataOut\(6) $ (!\inst|reg|dataOut[5]~28\)))) # (GND)
-- \inst|reg|dataOut[6]~30\ = CARRY((\SW[6]~input_o\ & ((\inst|reg|dataOut\(6)) # (!\inst|reg|dataOut[5]~28\))) # (!\SW[6]~input_o\ & (\inst|reg|dataOut\(6) & !\inst|reg|dataOut[5]~28\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \SW[6]~input_o\,
	datab => \inst|reg|dataOut\(6),
	datad => VCC,
	cin => \inst|reg|dataOut[5]~28\,
	combout => \inst|reg|dataOut[6]~29_combout\,
	cout => \inst|reg|dataOut[6]~30\);

-- Location: FF_X114_Y42_N29
\inst|reg|dataOut[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|clkOut~clkctrl_outclk\,
	d => \inst|reg|dataOut[6]~29_combout\,
	clrn => \KEY[1]~input_o\,
	ena => \SW[17]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg|dataOut\(6));

-- Location: LCCOMB_X114_Y42_N30
\inst|reg|dataOut[7]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg|dataOut[7]~31_combout\ = (\inst|reg|dataOut\(7) & ((\SW[7]~input_o\ & (\inst|reg|dataOut[6]~30\ & VCC)) # (!\SW[7]~input_o\ & (!\inst|reg|dataOut[6]~30\)))) # (!\inst|reg|dataOut\(7) & ((\SW[7]~input_o\ & (!\inst|reg|dataOut[6]~30\)) # 
-- (!\SW[7]~input_o\ & ((\inst|reg|dataOut[6]~30\) # (GND)))))
-- \inst|reg|dataOut[7]~32\ = CARRY((\inst|reg|dataOut\(7) & (!\SW[7]~input_o\ & !\inst|reg|dataOut[6]~30\)) # (!\inst|reg|dataOut\(7) & ((!\inst|reg|dataOut[6]~30\) # (!\SW[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg|dataOut\(7),
	datab => \SW[7]~input_o\,
	datad => VCC,
	cin => \inst|reg|dataOut[6]~30\,
	combout => \inst|reg|dataOut[7]~31_combout\,
	cout => \inst|reg|dataOut[7]~32\);

-- Location: FF_X114_Y42_N31
\inst|reg|dataOut[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|clkOut~clkctrl_outclk\,
	d => \inst|reg|dataOut[7]~31_combout\,
	clrn => \KEY[1]~input_o\,
	ena => \SW[17]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg|dataOut\(7));

-- Location: LCCOMB_X114_Y41_N0
\inst|reg|dataOut[8]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg|dataOut[8]~33_combout\ = ((\SW[8]~input_o\ $ (\inst|reg|dataOut\(8) $ (!\inst|reg|dataOut[7]~32\)))) # (GND)
-- \inst|reg|dataOut[8]~34\ = CARRY((\SW[8]~input_o\ & ((\inst|reg|dataOut\(8)) # (!\inst|reg|dataOut[7]~32\))) # (!\SW[8]~input_o\ & (\inst|reg|dataOut\(8) & !\inst|reg|dataOut[7]~32\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \SW[8]~input_o\,
	datab => \inst|reg|dataOut\(8),
	datad => VCC,
	cin => \inst|reg|dataOut[7]~32\,
	combout => \inst|reg|dataOut[8]~33_combout\,
	cout => \inst|reg|dataOut[8]~34\);

-- Location: FF_X114_Y41_N1
\inst|reg|dataOut[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|clkOut~clkctrl_outclk\,
	d => \inst|reg|dataOut[8]~33_combout\,
	clrn => \KEY[1]~input_o\,
	ena => \SW[17]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg|dataOut\(8));

-- Location: LCCOMB_X114_Y41_N2
\inst|reg|dataOut[9]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg|dataOut[9]~35_combout\ = (\SW[9]~input_o\ & ((\inst|reg|dataOut\(9) & (\inst|reg|dataOut[8]~34\ & VCC)) # (!\inst|reg|dataOut\(9) & (!\inst|reg|dataOut[8]~34\)))) # (!\SW[9]~input_o\ & ((\inst|reg|dataOut\(9) & (!\inst|reg|dataOut[8]~34\)) # 
-- (!\inst|reg|dataOut\(9) & ((\inst|reg|dataOut[8]~34\) # (GND)))))
-- \inst|reg|dataOut[9]~36\ = CARRY((\SW[9]~input_o\ & (!\inst|reg|dataOut\(9) & !\inst|reg|dataOut[8]~34\)) # (!\SW[9]~input_o\ & ((!\inst|reg|dataOut[8]~34\) # (!\inst|reg|dataOut\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \SW[9]~input_o\,
	datab => \inst|reg|dataOut\(9),
	datad => VCC,
	cin => \inst|reg|dataOut[8]~34\,
	combout => \inst|reg|dataOut[9]~35_combout\,
	cout => \inst|reg|dataOut[9]~36\);

-- Location: FF_X114_Y41_N3
\inst|reg|dataOut[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|clkOut~clkctrl_outclk\,
	d => \inst|reg|dataOut[9]~35_combout\,
	clrn => \KEY[1]~input_o\,
	ena => \SW[17]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg|dataOut\(9));

-- Location: LCCOMB_X114_Y41_N4
\inst|reg|dataOut[10]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg|dataOut[10]~37_combout\ = ((\SW[10]~input_o\ $ (\inst|reg|dataOut\(10) $ (!\inst|reg|dataOut[9]~36\)))) # (GND)
-- \inst|reg|dataOut[10]~38\ = CARRY((\SW[10]~input_o\ & ((\inst|reg|dataOut\(10)) # (!\inst|reg|dataOut[9]~36\))) # (!\SW[10]~input_o\ & (\inst|reg|dataOut\(10) & !\inst|reg|dataOut[9]~36\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \SW[10]~input_o\,
	datab => \inst|reg|dataOut\(10),
	datad => VCC,
	cin => \inst|reg|dataOut[9]~36\,
	combout => \inst|reg|dataOut[10]~37_combout\,
	cout => \inst|reg|dataOut[10]~38\);

-- Location: FF_X114_Y41_N5
\inst|reg|dataOut[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|clkOut~clkctrl_outclk\,
	d => \inst|reg|dataOut[10]~37_combout\,
	clrn => \KEY[1]~input_o\,
	ena => \SW[17]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg|dataOut\(10));

-- Location: LCCOMB_X114_Y41_N6
\inst|reg|dataOut[11]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg|dataOut[11]~39_combout\ = (\inst|reg|dataOut\(11) & ((\SW[11]~input_o\ & (\inst|reg|dataOut[10]~38\ & VCC)) # (!\SW[11]~input_o\ & (!\inst|reg|dataOut[10]~38\)))) # (!\inst|reg|dataOut\(11) & ((\SW[11]~input_o\ & (!\inst|reg|dataOut[10]~38\)) # 
-- (!\SW[11]~input_o\ & ((\inst|reg|dataOut[10]~38\) # (GND)))))
-- \inst|reg|dataOut[11]~40\ = CARRY((\inst|reg|dataOut\(11) & (!\SW[11]~input_o\ & !\inst|reg|dataOut[10]~38\)) # (!\inst|reg|dataOut\(11) & ((!\inst|reg|dataOut[10]~38\) # (!\SW[11]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg|dataOut\(11),
	datab => \SW[11]~input_o\,
	datad => VCC,
	cin => \inst|reg|dataOut[10]~38\,
	combout => \inst|reg|dataOut[11]~39_combout\,
	cout => \inst|reg|dataOut[11]~40\);

-- Location: FF_X114_Y41_N7
\inst|reg|dataOut[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|clkOut~clkctrl_outclk\,
	d => \inst|reg|dataOut[11]~39_combout\,
	clrn => \KEY[1]~input_o\,
	ena => \SW[17]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg|dataOut\(11));

-- Location: LCCOMB_X114_Y41_N8
\inst|reg|dataOut[12]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg|dataOut[12]~41_combout\ = ((\SW[12]~input_o\ $ (\inst|reg|dataOut\(12) $ (!\inst|reg|dataOut[11]~40\)))) # (GND)
-- \inst|reg|dataOut[12]~42\ = CARRY((\SW[12]~input_o\ & ((\inst|reg|dataOut\(12)) # (!\inst|reg|dataOut[11]~40\))) # (!\SW[12]~input_o\ & (\inst|reg|dataOut\(12) & !\inst|reg|dataOut[11]~40\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \SW[12]~input_o\,
	datab => \inst|reg|dataOut\(12),
	datad => VCC,
	cin => \inst|reg|dataOut[11]~40\,
	combout => \inst|reg|dataOut[12]~41_combout\,
	cout => \inst|reg|dataOut[12]~42\);

-- Location: FF_X114_Y41_N9
\inst|reg|dataOut[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|clkOut~clkctrl_outclk\,
	d => \inst|reg|dataOut[12]~41_combout\,
	clrn => \KEY[1]~input_o\,
	ena => \SW[17]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg|dataOut\(12));

-- Location: LCCOMB_X114_Y41_N10
\inst|reg|dataOut[13]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg|dataOut[13]~43_combout\ = (\inst|reg|dataOut\(13) & ((\SW[13]~input_o\ & (\inst|reg|dataOut[12]~42\ & VCC)) # (!\SW[13]~input_o\ & (!\inst|reg|dataOut[12]~42\)))) # (!\inst|reg|dataOut\(13) & ((\SW[13]~input_o\ & (!\inst|reg|dataOut[12]~42\)) # 
-- (!\SW[13]~input_o\ & ((\inst|reg|dataOut[12]~42\) # (GND)))))
-- \inst|reg|dataOut[13]~44\ = CARRY((\inst|reg|dataOut\(13) & (!\SW[13]~input_o\ & !\inst|reg|dataOut[12]~42\)) # (!\inst|reg|dataOut\(13) & ((!\inst|reg|dataOut[12]~42\) # (!\SW[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg|dataOut\(13),
	datab => \SW[13]~input_o\,
	datad => VCC,
	cin => \inst|reg|dataOut[12]~42\,
	combout => \inst|reg|dataOut[13]~43_combout\,
	cout => \inst|reg|dataOut[13]~44\);

-- Location: FF_X114_Y41_N11
\inst|reg|dataOut[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|clkOut~clkctrl_outclk\,
	d => \inst|reg|dataOut[13]~43_combout\,
	clrn => \KEY[1]~input_o\,
	ena => \SW[17]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg|dataOut\(13));

-- Location: LCCOMB_X114_Y41_N12
\inst|reg|dataOut[14]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg|dataOut[14]~45_combout\ = ((\inst|reg|dataOut\(14) $ (\SW[14]~input_o\ $ (!\inst|reg|dataOut[13]~44\)))) # (GND)
-- \inst|reg|dataOut[14]~46\ = CARRY((\inst|reg|dataOut\(14) & ((\SW[14]~input_o\) # (!\inst|reg|dataOut[13]~44\))) # (!\inst|reg|dataOut\(14) & (\SW[14]~input_o\ & !\inst|reg|dataOut[13]~44\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reg|dataOut\(14),
	datab => \SW[14]~input_o\,
	datad => VCC,
	cin => \inst|reg|dataOut[13]~44\,
	combout => \inst|reg|dataOut[14]~45_combout\,
	cout => \inst|reg|dataOut[14]~46\);

-- Location: FF_X114_Y41_N13
\inst|reg|dataOut[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|clkOut~clkctrl_outclk\,
	d => \inst|reg|dataOut[14]~45_combout\,
	clrn => \KEY[1]~input_o\,
	ena => \SW[17]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg|dataOut\(14));

-- Location: LCCOMB_X114_Y41_N14
\inst|reg|dataOut[15]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg|dataOut[15]~47_combout\ = (\SW[15]~input_o\ & ((\inst|reg|dataOut\(15) & (\inst|reg|dataOut[14]~46\ & VCC)) # (!\inst|reg|dataOut\(15) & (!\inst|reg|dataOut[14]~46\)))) # (!\SW[15]~input_o\ & ((\inst|reg|dataOut\(15) & 
-- (!\inst|reg|dataOut[14]~46\)) # (!\inst|reg|dataOut\(15) & ((\inst|reg|dataOut[14]~46\) # (GND)))))
-- \inst|reg|dataOut[15]~48\ = CARRY((\SW[15]~input_o\ & (!\inst|reg|dataOut\(15) & !\inst|reg|dataOut[14]~46\)) # (!\SW[15]~input_o\ & ((!\inst|reg|dataOut[14]~46\) # (!\inst|reg|dataOut\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \SW[15]~input_o\,
	datab => \inst|reg|dataOut\(15),
	datad => VCC,
	cin => \inst|reg|dataOut[14]~46\,
	combout => \inst|reg|dataOut[15]~47_combout\,
	cout => \inst|reg|dataOut[15]~48\);

-- Location: FF_X114_Y41_N15
\inst|reg|dataOut[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|clkOut~clkctrl_outclk\,
	d => \inst|reg|dataOut[15]~47_combout\,
	clrn => \KEY[1]~input_o\,
	ena => \SW[17]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg|dataOut\(15));

-- Location: LCCOMB_X114_Y41_N16
\inst|reg|dataOut[16]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|reg|dataOut[16]~49_combout\ = \inst|reg|dataOut\(16) $ (\inst|reg|dataOut[15]~48\ $ (!\SW[16]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|reg|dataOut\(16),
	datad => \SW[16]~input_o\,
	cin => \inst|reg|dataOut[15]~48\,
	combout => \inst|reg|dataOut[16]~49_combout\);

-- Location: FF_X114_Y41_N17
\inst|reg|dataOut[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|clkOut~clkctrl_outclk\,
	d => \inst|reg|dataOut[16]~49_combout\,
	clrn => \KEY[1]~input_o\,
	ena => \SW[17]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|reg|dataOut\(16));

ww_LEDR(16) <= \LEDR[16]~output_o\;

ww_LEDR(15) <= \LEDR[15]~output_o\;

ww_LEDR(14) <= \LEDR[14]~output_o\;

ww_LEDR(13) <= \LEDR[13]~output_o\;

ww_LEDR(12) <= \LEDR[12]~output_o\;

ww_LEDR(11) <= \LEDR[11]~output_o\;

ww_LEDR(10) <= \LEDR[10]~output_o\;

ww_LEDR(9) <= \LEDR[9]~output_o\;

ww_LEDR(8) <= \LEDR[8]~output_o\;

ww_LEDR(7) <= \LEDR[7]~output_o\;

ww_LEDR(6) <= \LEDR[6]~output_o\;

ww_LEDR(5) <= \LEDR[5]~output_o\;

ww_LEDR(4) <= \LEDR[4]~output_o\;

ww_LEDR(3) <= \LEDR[3]~output_o\;

ww_LEDR(2) <= \LEDR[2]~output_o\;

ww_LEDR(1) <= \LEDR[1]~output_o\;

ww_LEDR(0) <= \LEDR[0]~output_o\;
END structure;


