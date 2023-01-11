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
-- Generated on "12/02/2022 12:28:52"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Teste1
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Teste1_vhd_vec_tst IS
END Teste1_vhd_vec_tst;
ARCHITECTURE Teste1_arch OF Teste1_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL S : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL X0 : STD_LOGIC;
SIGNAL X1 : STD_LOGIC;
SIGNAL X2 : STD_LOGIC;
SIGNAL X3 : STD_LOGIC;
SIGNAL X4 : STD_LOGIC;
SIGNAL X5 : STD_LOGIC;
SIGNAL X6 : STD_LOGIC;
SIGNAL X7 : STD_LOGIC;
SIGNAL Y : STD_LOGIC;
COMPONENT Teste1
	PORT (
	S : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	X0 : IN STD_LOGIC;
	X1 : IN STD_LOGIC;
	X2 : IN STD_LOGIC;
	X3 : IN STD_LOGIC;
	X4 : IN STD_LOGIC;
	X5 : IN STD_LOGIC;
	X6 : IN STD_LOGIC;
	X7 : IN STD_LOGIC;
	Y : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Teste1
	PORT MAP (
-- list connections between master ports and signals
	S => S,
	X0 => X0,
	X1 => X1,
	X2 => X2,
	X3 => X3,
	X4 => X4,
	X5 => X5,
	X6 => X6,
	X7 => X7,
	Y => Y
	);
-- S[2]
t_prcs_S_2: PROCESS
BEGIN
	S(2) <= '0';
	WAIT FOR 400000 ps;
	S(2) <= '1';
	WAIT FOR 400000 ps;
	S(2) <= '0';
WAIT;
END PROCESS t_prcs_S_2;
-- S[1]
t_prcs_S_1: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		S(1) <= '0';
		WAIT FOR 200000 ps;
		S(1) <= '1';
		WAIT FOR 200000 ps;
	END LOOP;
	S(1) <= '0';
WAIT;
END PROCESS t_prcs_S_1;
-- S[0]
t_prcs_S_0: PROCESS
BEGIN
LOOP
	S(0) <= '0';
	WAIT FOR 100000 ps;
	S(0) <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_S_0;

-- X0
t_prcs_X0: PROCESS
BEGIN
LOOP
	X0 <= '0';
	WAIT FOR 3125 ps;
	X0 <= '1';
	WAIT FOR 3125 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_X0;

-- X1
t_prcs_X1: PROCESS
BEGIN
LOOP
	X1 <= '0';
	WAIT FOR 6250 ps;
	X1 <= '1';
	WAIT FOR 6250 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_X1;

-- X2
t_prcs_X2: PROCESS
BEGIN
LOOP
	X2 <= '0';
	WAIT FOR 12500 ps;
	X2 <= '1';
	WAIT FOR 12500 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_X2;

-- X3
t_prcs_X3: PROCESS
BEGIN
LOOP
	X3 <= '0';
	WAIT FOR 25000 ps;
	X3 <= '1';
	WAIT FOR 25000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_X3;

-- X4
t_prcs_X4: PROCESS
BEGIN
LOOP
	X4 <= '0';
	WAIT FOR 50000 ps;
	X4 <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_X4;

-- X5
t_prcs_X5: PROCESS
BEGIN
LOOP
	X5 <= '0';
	WAIT FOR 100000 ps;
	X5 <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_X5;

-- X6
t_prcs_X6: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		X6 <= '0';
		WAIT FOR 200000 ps;
		X6 <= '1';
		WAIT FOR 200000 ps;
	END LOOP;
	X6 <= '0';
WAIT;
END PROCESS t_prcs_X6;

-- X7
t_prcs_X7: PROCESS
BEGIN
	X7 <= '0';
	WAIT FOR 400000 ps;
	X7 <= '1';
	WAIT FOR 400000 ps;
	X7 <= '0';
WAIT;
END PROCESS t_prcs_X7;
END Teste1_arch;
