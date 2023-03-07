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

-- DATE "03/07/2023 22:35:04"

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

ENTITY 	Mux4_1 IS
    PORT (
	dataIn0 : IN std_logic;
	dataIn1 : IN std_logic;
	dataIn2 : IN std_logic;
	dataIn3 : IN std_logic;
	sel : IN std_logic_vector(1 DOWNTO 0);
	dataOut : OUT std_logic
	);
END Mux4_1;

ARCHITECTURE structure OF Mux4_1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_dataIn0 : std_logic;
SIGNAL ww_dataIn1 : std_logic;
SIGNAL ww_dataIn2 : std_logic;
SIGNAL ww_dataIn3 : std_logic;
SIGNAL ww_sel : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_dataOut : std_logic;
SIGNAL \dataOut~output_o\ : std_logic;
SIGNAL \dataIn2~input_o\ : std_logic;
SIGNAL \sel[1]~input_o\ : std_logic;
SIGNAL \dataIn1~input_o\ : std_logic;
SIGNAL \sel[0]~input_o\ : std_logic;
SIGNAL \dataIn0~input_o\ : std_logic;
SIGNAL \dataOut~0_combout\ : std_logic;
SIGNAL \dataIn3~input_o\ : std_logic;
SIGNAL \dataOut~1_combout\ : std_logic;

BEGIN

ww_dataIn0 <= dataIn0;
ww_dataIn1 <= dataIn1;
ww_dataIn2 <= dataIn2;
ww_dataIn3 <= dataIn3;
ww_sel <= sel;
dataOut <= ww_dataOut;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\dataOut~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dataOut~1_combout\,
	devoe => ww_devoe,
	o => \dataOut~output_o\);

\dataIn2~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn2,
	o => \dataIn2~input_o\);

\sel[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel(1),
	o => \sel[1]~input_o\);

\dataIn1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn1,
	o => \dataIn1~input_o\);

\sel[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel(0),
	o => \sel[0]~input_o\);

\dataIn0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn0,
	o => \dataIn0~input_o\);

\dataOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut~0_combout\ = (\sel[1]~input_o\ & (((\sel[0]~input_o\)))) # (!\sel[1]~input_o\ & ((\sel[0]~input_o\ & (\dataIn1~input_o\)) # (!\sel[0]~input_o\ & ((\dataIn0~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sel[1]~input_o\,
	datab => \dataIn1~input_o\,
	datac => \sel[0]~input_o\,
	datad => \dataIn0~input_o\,
	combout => \dataOut~0_combout\);

\dataIn3~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn3,
	o => \dataIn3~input_o\);

\dataOut~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut~1_combout\ = (\sel[1]~input_o\ & ((\dataOut~0_combout\ & ((\dataIn3~input_o\))) # (!\dataOut~0_combout\ & (\dataIn2~input_o\)))) # (!\sel[1]~input_o\ & (((\dataOut~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dataIn2~input_o\,
	datab => \sel[1]~input_o\,
	datac => \dataOut~0_combout\,
	datad => \dataIn3~input_o\,
	combout => \dataOut~1_combout\);

ww_dataOut <= \dataOut~output_o\;
END structure;


