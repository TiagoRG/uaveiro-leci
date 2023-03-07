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
-- Generated on "03/07/2023 22:35:03"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Mux4_1
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Mux4_1_vhd_vec_tst IS
END Mux4_1_vhd_vec_tst;
ARCHITECTURE Mux4_1_arch OF Mux4_1_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL dataIn0 : STD_LOGIC;
SIGNAL dataIn1 : STD_LOGIC;
SIGNAL dataIn2 : STD_LOGIC;
SIGNAL dataIn3 : STD_LOGIC;
SIGNAL dataOut : STD_LOGIC;
SIGNAL sel : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT Mux4_1
	PORT (
	dataIn0 : IN STD_LOGIC;
	dataIn1 : IN STD_LOGIC;
	dataIn2 : IN STD_LOGIC;
	dataIn3 : IN STD_LOGIC;
	dataOut : OUT STD_LOGIC;
	sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Mux4_1
	PORT MAP (
-- list connections between master ports and signals
	dataIn0 => dataIn0,
	dataIn1 => dataIn1,
	dataIn2 => dataIn2,
	dataIn3 => dataIn3,
	dataOut => dataOut,
	sel => sel
	);

-- dataIn3
t_prcs_dataIn3: PROCESS
BEGIN
LOOP
	dataIn3 <= '0';
	WAIT FOR 100000 ps;
	dataIn3 <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_dataIn3;

-- dataIn2
t_prcs_dataIn2: PROCESS
BEGIN
LOOP
	dataIn2 <= '0';
	WAIT FOR 50000 ps;
	dataIn2 <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_dataIn2;

-- dataIn1
t_prcs_dataIn1: PROCESS
BEGIN
LOOP
	dataIn1 <= '0';
	WAIT FOR 25000 ps;
	dataIn1 <= '1';
	WAIT FOR 25000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_dataIn1;

-- dataIn0
t_prcs_dataIn0: PROCESS
BEGIN
LOOP
	dataIn0 <= '0';
	WAIT FOR 12500 ps;
	dataIn0 <= '1';
	WAIT FOR 12500 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_dataIn0;
-- sel[1]
t_prcs_sel_1: PROCESS
BEGIN
	sel(1) <= '0';
	WAIT FOR 400000 ps;
	sel(1) <= '1';
	WAIT FOR 400000 ps;
	sel(1) <= '0';
WAIT;
END PROCESS t_prcs_sel_1;
-- sel[0]
t_prcs_sel_0: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		sel(0) <= '0';
		WAIT FOR 200000 ps;
		sel(0) <= '1';
		WAIT FOR 200000 ps;
	END LOOP;
	sel(0) <= '0';
WAIT;
END PROCESS t_prcs_sel_0;
END Mux4_1_arch;
