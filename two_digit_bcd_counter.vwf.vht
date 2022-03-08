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
-- Generated on "03/08/2022 15:42:35"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          two_digit_bcd_counter
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY two_digit_bcd_counter_vhd_vec_tst IS
END two_digit_bcd_counter_vhd_vec_tst;
ARCHITECTURE two_digit_bcd_counter_arch OF two_digit_bcd_counter_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL bcd0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL bcd1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL clk : STD_LOGIC;
SIGNAL clr : STD_LOGIC;
SIGNAL v_cc : STD_LOGIC;
COMPONENT two_digit_bcd_counter
	PORT (
	bcd0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	bcd1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	clk : IN STD_LOGIC;
	clr : IN STD_LOGIC;
	v_cc : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : two_digit_bcd_counter
	PORT MAP (
-- list connections between master ports and signals
	bcd0 => bcd0,
	bcd1 => bcd1,
	clk => clk,
	clr => clr,
	v_cc => v_cc
	);

-- v_cc
t_prcs_v_cc: PROCESS
BEGIN
	v_cc <= '1';
WAIT;
END PROCESS t_prcs_v_cc;

-- clr
t_prcs_clr: PROCESS
BEGIN
	clr <= '0';
	WAIT FOR 800000 ps;
	clr <= '1';
WAIT;
END PROCESS t_prcs_clr;

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 20000 ps;
	clk <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;
END two_digit_bcd_counter_arch;
