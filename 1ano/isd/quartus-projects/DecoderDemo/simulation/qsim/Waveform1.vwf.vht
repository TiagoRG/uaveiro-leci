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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "11/14/2022 21:42:30"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Dec2_4
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Dec2_4_vhd_vec_tst IS
END Dec2_4_vhd_vec_tst;
ARCHITECTURE Dec2_4_arch OF Dec2_4_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL E0L : STD_LOGIC;
SIGNAL E1 : STD_LOGIC;
SIGNAL X0 : STD_LOGIC;
SIGNAL X1 : STD_LOGIC;
SIGNAL Y0 : STD_LOGIC;
SIGNAL Y1 : STD_LOGIC;
SIGNAL Y2 : STD_LOGIC;
SIGNAL Y3 : STD_LOGIC;
COMPONENT Dec2_4
	PORT (
	E0L : IN STD_LOGIC;
	E1 : IN STD_LOGIC;
	X0 : IN STD_LOGIC;
	X1 : IN STD_LOGIC;
	Y0 : OUT STD_LOGIC;
	Y1 : OUT STD_LOGIC;
	Y2 : OUT STD_LOGIC;
	Y3 : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Dec2_4
	PORT MAP (
-- list connections between master ports and signals
	E0L => E0L,
	E1 => E1,
	X0 => X0,
	X1 => X1,
	Y0 => Y0,
	Y1 => Y1,
	Y2 => Y2,
	Y3 => Y3
	);

-- E0L
t_prcs_E0L: PROCESS
BEGIN
LOOP
	E0L <= '0';
	WAIT FOR 12500 ps;
	E0L <= '1';
	WAIT FOR 12500 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_E0L;

-- E1
t_prcs_E1: PROCESS
BEGIN
LOOP
	E1 <= '0';
	WAIT FOR 25000 ps;
	E1 <= '1';
	WAIT FOR 25000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_E1;

-- X0
t_prcs_X0: PROCESS
BEGIN
LOOP
	X0 <= '0';
	WAIT FOR 50000 ps;
	X0 <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_X0;

-- X1
t_prcs_X1: PROCESS
BEGIN
LOOP
	X1 <= '0';
	WAIT FOR 100000 ps;
	X1 <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_X1;
END Dec2_4_arch;
