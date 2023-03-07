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
-- Generated on "03/07/2023 20:57:57"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          EqCmpDemo
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY EqCmpDemo_vhd_vec_tst IS
END EqCmpDemo_vhd_vec_tst;
ARCHITECTURE EqCmpDemo_arch OF EqCmpDemo_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL LEDG : STD_LOGIC_VECTOR(0 DOWNTO 0);
SIGNAL SW : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT EqCmpDemo
	PORT (
	LEDG : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
	SW : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : EqCmpDemo
	PORT MAP (
-- list connections between master ports and signals
	LEDG => LEDG,
	SW => SW
	);
-- SW[7]
t_prcs_SW_7: PROCESS
BEGIN
	SW(7) <= '0';
	WAIT FOR 400000 ps;
	SW(7) <= '1';
	WAIT FOR 400000 ps;
	SW(7) <= '0';
WAIT;
END PROCESS t_prcs_SW_7;
-- SW[6]
t_prcs_SW_6: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		SW(6) <= '0';
		WAIT FOR 200000 ps;
		SW(6) <= '1';
		WAIT FOR 200000 ps;
	END LOOP;
	SW(6) <= '0';
WAIT;
END PROCESS t_prcs_SW_6;
-- SW[5]
t_prcs_SW_5: PROCESS
BEGIN
LOOP
	SW(5) <= '0';
	WAIT FOR 100000 ps;
	SW(5) <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SW_5;
-- SW[4]
t_prcs_SW_4: PROCESS
BEGIN
LOOP
	SW(4) <= '0';
	WAIT FOR 50000 ps;
	SW(4) <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SW_4;
-- SW[3]
t_prcs_SW_3: PROCESS
BEGIN
LOOP
	SW(3) <= '0';
	WAIT FOR 25000 ps;
	SW(3) <= '1';
	WAIT FOR 25000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SW_3;
-- SW[2]
t_prcs_SW_2: PROCESS
BEGIN
LOOP
	SW(2) <= '0';
	WAIT FOR 12500 ps;
	SW(2) <= '1';
	WAIT FOR 12500 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SW_2;
-- SW[1]
t_prcs_SW_1: PROCESS
BEGIN
LOOP
	SW(1) <= '0';
	WAIT FOR 6250 ps;
	SW(1) <= '1';
	WAIT FOR 6250 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SW_1;
-- SW[0]
t_prcs_SW_0: PROCESS
BEGIN
	FOR i IN 1 TO 148
	LOOP
		SW(0) <= '0';
		WAIT FOR 3375 ps;
		SW(0) <= '1';
		WAIT FOR 3375 ps;
	END LOOP;
	SW(0) <= '0';
WAIT;
END PROCESS t_prcs_SW_0;
END EqCmpDemo_arch;
