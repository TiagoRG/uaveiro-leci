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

-- DATE "11/04/2022 15:08:53"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
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
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_101,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


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


LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Dec2_4 IS
    PORT (
	Y3 : OUT std_logic;
	E0L : IN std_logic;
	E1 : IN std_logic;
	X1 : IN std_logic;
	X0 : IN std_logic;
	Y2 : OUT std_logic;
	Y1 : OUT std_logic;
	Y0 : OUT std_logic
	);
END Dec2_4;

-- Design Ports Information
-- Y3	=>  Location: PIN_33,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y2	=>  Location: PIN_32,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y1	=>  Location: PIN_28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y0	=>  Location: PIN_34,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- E1	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X0	=>  Location: PIN_25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X1	=>  Location: PIN_31,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- E0L	=>  Location: PIN_30,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Dec2_4 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Y3 : std_logic;
SIGNAL ww_E0L : std_logic;
SIGNAL ww_E1 : std_logic;
SIGNAL ww_X1 : std_logic;
SIGNAL ww_X0 : std_logic;
SIGNAL ww_Y2 : std_logic;
SIGNAL ww_Y1 : std_logic;
SIGNAL ww_Y0 : std_logic;
SIGNAL \Y3~output_o\ : std_logic;
SIGNAL \Y2~output_o\ : std_logic;
SIGNAL \Y1~output_o\ : std_logic;
SIGNAL \Y0~output_o\ : std_logic;
SIGNAL \E1~input_o\ : std_logic;
SIGNAL \X1~input_o\ : std_logic;
SIGNAL \X0~input_o\ : std_logic;
SIGNAL \E0L~input_o\ : std_logic;
SIGNAL \inst~combout\ : std_logic;
SIGNAL \inst1~combout\ : std_logic;
SIGNAL \inst2~combout\ : std_logic;
SIGNAL \inst3~combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

Y3 <= ww_Y3;
ww_E0L <= E0L;
ww_E1 <= E1;
ww_X1 <= X1;
ww_X0 <= X0;
Y2 <= ww_Y2;
Y1 <= ww_Y1;
Y0 <= ww_Y0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X0_Y6_N23
\Y3~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst~combout\,
	devoe => ww_devoe,
	o => \Y3~output_o\);

-- Location: IOOBUF_X0_Y6_N16
\Y2~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1~combout\,
	devoe => ww_devoe,
	o => \Y2~output_o\);

-- Location: IOOBUF_X0_Y9_N9
\Y1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2~combout\,
	devoe => ww_devoe,
	o => \Y1~output_o\);

-- Location: IOOBUF_X0_Y5_N16
\Y0~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3~combout\,
	devoe => ww_devoe,
	o => \Y0~output_o\);

-- Location: IOIBUF_X0_Y11_N15
\E1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_E1,
	o => \E1~input_o\);

-- Location: IOIBUF_X0_Y7_N1
\X1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X1,
	o => \X1~input_o\);

-- Location: IOIBUF_X0_Y11_N22
\X0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X0,
	o => \X0~input_o\);

-- Location: IOIBUF_X0_Y8_N15
\E0L~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_E0L,
	o => \E0L~input_o\);

-- Location: LCCOMB_X6_Y9_N8
inst : cycloneive_lcell_comb
-- Equation(s):
-- \inst~combout\ = (\E1~input_o\ & (!\X1~input_o\ & (!\X0~input_o\ & !\E0L~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \E1~input_o\,
	datab => \X1~input_o\,
	datac => \X0~input_o\,
	datad => \E0L~input_o\,
	combout => \inst~combout\);

-- Location: LCCOMB_X6_Y9_N2
inst1 : cycloneive_lcell_comb
-- Equation(s):
-- \inst1~combout\ = (\E1~input_o\ & (!\X1~input_o\ & (\X0~input_o\ & !\E0L~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \E1~input_o\,
	datab => \X1~input_o\,
	datac => \X0~input_o\,
	datad => \E0L~input_o\,
	combout => \inst1~combout\);

-- Location: LCCOMB_X6_Y9_N28
inst2 : cycloneive_lcell_comb
-- Equation(s):
-- \inst2~combout\ = (\E1~input_o\ & (\X1~input_o\ & (!\X0~input_o\ & !\E0L~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \E1~input_o\,
	datab => \X1~input_o\,
	datac => \X0~input_o\,
	datad => \E0L~input_o\,
	combout => \inst2~combout\);

-- Location: LCCOMB_X6_Y9_N30
inst3 : cycloneive_lcell_comb
-- Equation(s):
-- \inst3~combout\ = (\E1~input_o\ & (\X1~input_o\ & (\X0~input_o\ & !\E0L~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \E1~input_o\,
	datab => \X1~input_o\,
	datac => \X0~input_o\,
	datad => \E0L~input_o\,
	combout => \inst3~combout\);

ww_Y3 <= \Y3~output_o\;

ww_Y2 <= \Y2~output_o\;

ww_Y1 <= \Y1~output_o\;

ww_Y0 <= \Y0~output_o\;
END structure;


