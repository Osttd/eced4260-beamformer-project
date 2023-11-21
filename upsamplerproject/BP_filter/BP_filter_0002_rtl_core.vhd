-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 20.1 (Release Build #711)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2020 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from BP_filter_0002_rtl_core
-- VHDL created on Mon Nov 20 22:16:08 2023


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity BP_filter_0002_rtl_core is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(15 downto 0);  -- sfix16
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(31 downto 0);  -- sfix32
        xOut_1 : out std_logic_vector(31 downto 0);  -- sfix32
        xOut_2 : out std_logic_vector(31 downto 0);  -- sfix32
        clk : in std_logic;
        areset : in std_logic
    );
end BP_filter_0002_rtl_core;

architecture normal of BP_filter_0002_rtl_core is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_wi0_r0_phasedelay0_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_phasedelay0_q_12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr1_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr1_q_12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr2_q_12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr3_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr3_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr3_q_12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr4_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr4_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr5_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr6_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr6_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr6_q_12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr8_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr8_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr9_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr10_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr10_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr11_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr12_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr12_q_12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr13_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm5_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_sym_add0_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add0_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add0_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add1_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add1_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add1_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal d_u0_m0_wo0_sym_add1_q_13_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add3_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add3_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add3_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add3_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add4_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add4_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add4_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add4_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add5_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add5_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add5_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add5_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_a0 : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_s1 : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add0_0_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_0_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_0_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_1_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add0_1_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add0_1_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add0_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add1_0_a : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add1_0_b : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add1_0_o : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add1_0_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add1_1_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_1_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_1_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add2_0_a : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add2_0_b : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add2_0_o : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo1_cm5_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo1_cm6_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_s1 : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_reset : std_logic;
    signal u0_m0_wo1_mtree_mult1_6_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_s1 : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_reset : std_logic;
    signal u0_m0_wo1_mtree_mult1_5_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add0_1_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_add0_1_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_add0_1_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_add0_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_add0_3_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_add0_3_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_add0_3_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_add0_3_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_add0_5_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_add0_5_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_add0_5_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_add0_5_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_add1_0_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add1_0_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add1_0_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add1_0_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add1_1_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_add1_1_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_add1_1_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_add1_1_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_add1_2_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_add1_2_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_add1_2_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_add1_2_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_add2_0_a : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo1_mtree_add2_0_b : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo1_mtree_add2_0_o : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo1_mtree_add2_0_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo1_mtree_add3_0_a : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_mtree_add3_0_b : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_mtree_add3_0_o : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_mtree_add3_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_s1 : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_reset : std_logic;
    signal u0_m0_wo2_mtree_mult1_6_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_s1 : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_reset : std_logic;
    signal u0_m0_wo2_mtree_mult1_5_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add0_0_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_add0_0_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_add0_0_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_add0_0_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_add0_2_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add0_2_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add0_2_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add0_2_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add0_4_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_add0_4_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_add0_4_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_add0_4_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_add1_0_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_add1_0_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_add1_0_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_add1_0_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_add1_1_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo2_mtree_add1_1_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo2_mtree_add1_1_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo2_mtree_add1_1_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo2_mtree_add1_2_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add1_2_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add1_2_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add1_2_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add2_0_a : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo2_mtree_add2_0_b : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo2_mtree_add2_0_o : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo2_mtree_add2_0_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo2_mtree_add3_0_a : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo2_mtree_add3_0_b : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo2_mtree_add3_0_o : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo2_mtree_add3_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_1_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_1_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_1_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_1_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_1_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_1_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_3_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_3_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_3_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_3_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_3_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_3_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_3_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_3_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_5_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_5_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_5_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_5_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_sub_1_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_sub_1_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_sub_1_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_sub_1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_sub_3_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_sub_3_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_sub_3_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_sub_3_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_add_5_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_add_5_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_add_5_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_add_5_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_sub_1_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_sub_1_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_sub_1_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_sub_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_mult1_11_add_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_11_add_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_11_add_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_11_add_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_11_sub_3_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_11_sub_3_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_11_sub_3_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_11_sub_3_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_sub_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_sub_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_sub_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_sub_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_sub_3_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_sub_3_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_sub_3_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_sub_3_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_add_5_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_add_5_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_add_5_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_add_5_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_sub_1_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_sub_1_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_sub_1_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_sub_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_add_3_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_add_3_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_add_3_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_add_3_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_add_5_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_add_5_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_add_5_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_add_5_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_add_1_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_add_1_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_add_1_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_add_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_sub_3_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_sub_3_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_sub_3_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_sub_3_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_sub_1_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_sub_1_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_sub_1_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_sub_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_sub_3_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_sub_3_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_sub_3_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_sub_3_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_add_1_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_add_1_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_add_1_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_add_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_sub_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_sub_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_sub_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_sub_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_add_3_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_add_3_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_add_3_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_add_3_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_sub_5_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_sub_5_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_sub_5_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_sub_5_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_sub_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_sub_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_sub_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_sub_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_add_3_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_add_3_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_add_3_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_add_3_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_sub_5_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_sub_5_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_sub_5_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_sub_5_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_9_add_1_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_9_add_1_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_9_add_1_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_9_add_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_sub_1_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_sub_1_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_sub_1_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_sub_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_sub_3_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_sub_3_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_sub_3_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_sub_3_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_add_1_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_add_1_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_add_1_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_add_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_sub_3_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_sub_3_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_sub_3_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_sub_3_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_sub_1_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_sub_1_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_sub_1_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_sub_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_add_3_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_add_3_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_add_3_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_add_3_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_add_5_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_add_5_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_add_5_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_add_5_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_sub_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_sub_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_sub_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_sub_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_sub_3_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_sub_3_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_sub_3_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_sub_3_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_add_5_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_add_5_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_add_5_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_add_5_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_add_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_add_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_add_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_add_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_sub_3_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_sub_3_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_sub_3_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_sub_3_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_11_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_11_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_11_shift2_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_11_shift2_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_shift2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_shift2_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_shift2_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_shift2_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_shift2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_shift2_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_9_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_9_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_shift2_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_shift2_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_shift2_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_shift2_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_shift0_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_shift0_qint : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_shift2_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_shift2_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_shift2_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_shift2_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_shift2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_shift2_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_shift2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_shift2_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_shift2_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_shift2_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_shift2_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_shift2_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift2_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift2_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_shift2_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_shift2_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift2_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift2_qint : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift4_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift4_qint : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift4_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift4_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift6_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift6_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_shift4_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_shift4_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_shift6_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_shift6_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_mult1_11_shift4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_11_shift4_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_shift4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_shift4_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_shift6_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_10_shift6_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_shift4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_shift4_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_shift4_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_shift4_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_shift2_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_shift2_qint : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_shift4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_shift4_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_shift4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_shift4_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_9_shift2_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_9_shift2_qint : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_shift4_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_shift4_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_shift4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_shift4_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_shift4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_shift4_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_shift6_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_shift6_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_shift4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_shift4_qint : STD_LOGIC_VECTOR (23 downto 0);

begin


    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- u0_m0_wo2_mtree_mult1_10_shift2(BITSHIFT,297)@12
    u0_m0_wo2_mtree_mult1_10_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr1_q_12_q & "000";
    u0_m0_wo2_mtree_mult1_10_shift2_q <= u0_m0_wo2_mtree_mult1_10_shift2_qint(18 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr1(DELAY,20)@10
    u0_m0_wo0_wi0_r0_delayr1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => u0_m0_wo0_wi0_r0_delayr1_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr1_q_11(DELAY,439)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr1_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr1_q, xout => d_u0_m0_wo0_wi0_r0_delayr1_q_11_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr1_q_12(DELAY,440)@11 + 1
    d_u0_m0_wo0_wi0_r0_delayr1_q_12 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr1_q_11_q, xout => d_u0_m0_wo0_wi0_r0_delayr1_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_10_add_3(ADD,298)@12 + 1
    u0_m0_wo2_mtree_mult1_10_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => d_u0_m0_wo0_wi0_r0_delayr1_q_12_q(15)) & d_u0_m0_wo0_wi0_r0_delayr1_q_12_q));
    u0_m0_wo2_mtree_mult1_10_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo2_mtree_mult1_10_shift2_q(18)) & u0_m0_wo2_mtree_mult1_10_shift2_q));
    u0_m0_wo2_mtree_mult1_10_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_10_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_10_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_10_add_3_a) + SIGNED(u0_m0_wo2_mtree_mult1_10_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_10_add_3_q <= u0_m0_wo2_mtree_mult1_10_add_3_o(19 downto 0);

    -- u0_m0_wo2_mtree_mult1_10_shift4(BITSHIFT,299)@13
    u0_m0_wo2_mtree_mult1_10_shift4_qint <= u0_m0_wo2_mtree_mult1_10_add_3_q & "0000";
    u0_m0_wo2_mtree_mult1_10_shift4_q <= u0_m0_wo2_mtree_mult1_10_shift4_qint(23 downto 0);

    -- u0_m0_wo2_mtree_mult1_10_shift0(BITSHIFT,295)@12
    u0_m0_wo2_mtree_mult1_10_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr1_q_12_q & "00";
    u0_m0_wo2_mtree_mult1_10_shift0_q <= u0_m0_wo2_mtree_mult1_10_shift0_qint(17 downto 0);

    -- u0_m0_wo2_mtree_mult1_10_sub_1(SUB,296)@12 + 1
    u0_m0_wo2_mtree_mult1_10_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo2_mtree_mult1_10_shift0_q(17)) & u0_m0_wo2_mtree_mult1_10_shift0_q));
    u0_m0_wo2_mtree_mult1_10_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => d_u0_m0_wo0_wi0_r0_delayr1_q_12_q(15)) & d_u0_m0_wo0_wi0_r0_delayr1_q_12_q));
    u0_m0_wo2_mtree_mult1_10_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_10_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_10_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_10_sub_1_a) - SIGNED(u0_m0_wo2_mtree_mult1_10_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_10_sub_1_q <= u0_m0_wo2_mtree_mult1_10_sub_1_o(18 downto 0);

    -- u0_m0_wo2_mtree_mult1_10_sub_5(SUB,300)@13 + 1
    u0_m0_wo2_mtree_mult1_10_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 19 => u0_m0_wo2_mtree_mult1_10_sub_1_q(18)) & u0_m0_wo2_mtree_mult1_10_sub_1_q));
    u0_m0_wo2_mtree_mult1_10_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo2_mtree_mult1_10_shift4_q(23)) & u0_m0_wo2_mtree_mult1_10_shift4_q));
    u0_m0_wo2_mtree_mult1_10_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_10_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_10_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_10_sub_5_a) - SIGNED(u0_m0_wo2_mtree_mult1_10_sub_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_10_sub_5_q <= u0_m0_wo2_mtree_mult1_10_sub_5_o(24 downto 0);

    -- u0_m0_wo2_mtree_mult1_9_shift0(BITSHIFT,301)@12
    u0_m0_wo2_mtree_mult1_9_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr2_q_12_q & "000000";
    u0_m0_wo2_mtree_mult1_9_shift0_q <= u0_m0_wo2_mtree_mult1_9_shift0_qint(21 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr2(DELAY,21)@10
    u0_m0_wo0_wi0_r0_delayr2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr1_q, xout => u0_m0_wo0_wi0_r0_delayr2_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr2_q_12(DELAY,441)@10 + 2
    d_u0_m0_wo0_wi0_r0_delayr2_q_12 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr2_q, xout => d_u0_m0_wo0_wi0_r0_delayr2_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_9_add_1(ADD,302)@12 + 1
    u0_m0_wo2_mtree_mult1_9_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 16 => d_u0_m0_wo0_wi0_r0_delayr2_q_12_q(15)) & d_u0_m0_wo0_wi0_r0_delayr2_q_12_q));
    u0_m0_wo2_mtree_mult1_9_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo2_mtree_mult1_9_shift0_q(21)) & u0_m0_wo2_mtree_mult1_9_shift0_q));
    u0_m0_wo2_mtree_mult1_9_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_9_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_9_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_9_add_1_a) + SIGNED(u0_m0_wo2_mtree_mult1_9_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_9_add_1_q <= u0_m0_wo2_mtree_mult1_9_add_1_o(22 downto 0);

    -- u0_m0_wo2_mtree_mult1_9_shift2(BITSHIFT,303)@13
    u0_m0_wo2_mtree_mult1_9_shift2_qint <= u0_m0_wo2_mtree_mult1_9_add_1_q & "00";
    u0_m0_wo2_mtree_mult1_9_shift2_q <= u0_m0_wo2_mtree_mult1_9_shift2_qint(24 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr3(DELAY,22)@10
    u0_m0_wo0_wi0_r0_delayr3 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr2_q, xout => u0_m0_wo0_wi0_r0_delayr3_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr3_q_11(DELAY,442)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr3_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr3_q, xout => d_u0_m0_wo0_wi0_r0_delayr3_q_11_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr3_q_12(DELAY,443)@11 + 1
    d_u0_m0_wo0_wi0_r0_delayr3_q_12 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr3_q_11_q, xout => d_u0_m0_wo0_wi0_r0_delayr3_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_8_shift2(BITSHIFT,306)@12
    u0_m0_wo2_mtree_mult1_8_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr3_q_12_q & "00000000";
    u0_m0_wo2_mtree_mult1_8_shift2_q <= u0_m0_wo2_mtree_mult1_8_shift2_qint(23 downto 0);

    -- u0_m0_wo2_mtree_mult1_8_shift0(BITSHIFT,304)@11
    u0_m0_wo2_mtree_mult1_8_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr3_q_11_q & "000";
    u0_m0_wo2_mtree_mult1_8_shift0_q <= u0_m0_wo2_mtree_mult1_8_shift0_qint(18 downto 0);

    -- u0_m0_wo2_mtree_mult1_8_sub_1(SUB,305)@11 + 1
    u0_m0_wo2_mtree_mult1_8_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => d_u0_m0_wo0_wi0_r0_delayr3_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr3_q_11_q));
    u0_m0_wo2_mtree_mult1_8_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo2_mtree_mult1_8_shift0_q(18)) & u0_m0_wo2_mtree_mult1_8_shift0_q));
    u0_m0_wo2_mtree_mult1_8_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_8_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_8_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_8_sub_1_a) - SIGNED(u0_m0_wo2_mtree_mult1_8_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_8_sub_1_q <= u0_m0_wo2_mtree_mult1_8_sub_1_o(19 downto 0);

    -- u0_m0_wo2_mtree_mult1_8_sub_3(SUB,307)@12 + 1
    u0_m0_wo2_mtree_mult1_8_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 20 => u0_m0_wo2_mtree_mult1_8_sub_1_q(19)) & u0_m0_wo2_mtree_mult1_8_sub_1_q));
    u0_m0_wo2_mtree_mult1_8_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo2_mtree_mult1_8_shift2_q(23)) & u0_m0_wo2_mtree_mult1_8_shift2_q));
    u0_m0_wo2_mtree_mult1_8_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_8_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_8_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_8_sub_3_a) - SIGNED(u0_m0_wo2_mtree_mult1_8_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_8_sub_3_q <= u0_m0_wo2_mtree_mult1_8_sub_3_o(24 downto 0);

    -- u0_m0_wo2_mtree_add0_4(ADD,180)@13 + 1
    u0_m0_wo2_mtree_add0_4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo2_mtree_mult1_8_sub_3_q(24)) & u0_m0_wo2_mtree_mult1_8_sub_3_q));
    u0_m0_wo2_mtree_add0_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo2_mtree_mult1_9_shift2_q(24)) & u0_m0_wo2_mtree_mult1_9_shift2_q));
    u0_m0_wo2_mtree_add0_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_4_a) + SIGNED(u0_m0_wo2_mtree_add0_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_4_q <= u0_m0_wo2_mtree_add0_4_o(25 downto 0);

    -- u0_m0_wo2_mtree_add1_2(ADD,184)@14 + 1
    u0_m0_wo2_mtree_add1_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 26 => u0_m0_wo2_mtree_add0_4_q(25)) & u0_m0_wo2_mtree_add0_4_q));
    u0_m0_wo2_mtree_add1_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 25 => u0_m0_wo2_mtree_mult1_10_sub_5_q(24)) & u0_m0_wo2_mtree_mult1_10_sub_5_q));
    u0_m0_wo2_mtree_add1_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add1_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add1_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add1_2_a) + SIGNED(u0_m0_wo2_mtree_add1_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add1_2_q <= u0_m0_wo2_mtree_add1_2_o(27 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr4(DELAY,23)@10
    u0_m0_wo0_wi0_r0_delayr4 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr3_q, xout => u0_m0_wo0_wi0_r0_delayr4_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr5(DELAY,24)@10
    u0_m0_wo0_wi0_r0_delayr5 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr4_q, xout => u0_m0_wo0_wi0_r0_delayr5_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr5_q_11(DELAY,445)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr5_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr5_q, xout => d_u0_m0_wo0_wi0_r0_delayr5_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_cm6(CONSTANT,96)@0
    u0_m0_wo1_cm6_q <= "011100110010";

    -- u0_m0_wo2_mtree_mult1_6(MULT,169)@11 + 2
    u0_m0_wo2_mtree_mult1_6_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm6_q);
    u0_m0_wo2_mtree_mult1_6_b0 <= STD_LOGIC_VECTOR(d_u0_m0_wo0_wi0_r0_delayr5_q_11_q);
    u0_m0_wo2_mtree_mult1_6_reset <= areset;
    u0_m0_wo2_mtree_mult1_6_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 12,
        lpm_widthb => 16,
        lpm_widthp => 28,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo2_mtree_mult1_6_a0,
        datab => u0_m0_wo2_mtree_mult1_6_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo2_mtree_mult1_6_reset,
        clock => clk,
        result => u0_m0_wo2_mtree_mult1_6_s1
    );
    u0_m0_wo2_mtree_mult1_6_q <= u0_m0_wo2_mtree_mult1_6_s1;

    -- u0_m0_wo0_wi0_r0_delayr6(DELAY,25)@10
    u0_m0_wo0_wi0_r0_delayr6 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr5_q, xout => u0_m0_wo0_wi0_r0_delayr6_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo1_cm5(CONSTANT,95)@0
    u0_m0_wo1_cm5_q <= "010100010111";

    -- u0_m0_wo2_mtree_mult1_5(MULT,170)@10 + 2
    u0_m0_wo2_mtree_mult1_5_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm5_q);
    u0_m0_wo2_mtree_mult1_5_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr6_q);
    u0_m0_wo2_mtree_mult1_5_reset <= areset;
    u0_m0_wo2_mtree_mult1_5_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 12,
        lpm_widthb => 16,
        lpm_widthp => 28,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo2_mtree_mult1_5_a0,
        datab => u0_m0_wo2_mtree_mult1_5_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo2_mtree_mult1_5_reset,
        clock => clk,
        result => u0_m0_wo2_mtree_mult1_5_s1
    );
    u0_m0_wo2_mtree_mult1_5_q <= u0_m0_wo2_mtree_mult1_5_s1;

    -- u0_m0_wo0_wi0_r0_delayr8(DELAY,27)@10
    u0_m0_wo0_wi0_r0_delayr8 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr6_q, xout => u0_m0_wo0_wi0_r0_delayr8_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr8_q_11(DELAY,448)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr8_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr8_q, xout => d_u0_m0_wo0_wi0_r0_delayr8_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_4_shift2(BITSHIFT,327)@11
    u0_m0_wo2_mtree_mult1_4_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr8_q_11_q & "00000";
    u0_m0_wo2_mtree_mult1_4_shift2_q <= u0_m0_wo2_mtree_mult1_4_shift2_qint(20 downto 0);

    -- u0_m0_wo2_mtree_mult1_4_shift0(BITSHIFT,325)@10
    u0_m0_wo2_mtree_mult1_4_shift0_qint <= u0_m0_wo0_wi0_r0_delayr8_q & "000";
    u0_m0_wo2_mtree_mult1_4_shift0_q <= u0_m0_wo2_mtree_mult1_4_shift0_qint(18 downto 0);

    -- u0_m0_wo2_mtree_mult1_4_add_1(ADD,326)@10 + 1
    u0_m0_wo2_mtree_mult1_4_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => u0_m0_wo0_wi0_r0_delayr8_q(15)) & u0_m0_wo0_wi0_r0_delayr8_q));
    u0_m0_wo2_mtree_mult1_4_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo2_mtree_mult1_4_shift0_q(18)) & u0_m0_wo2_mtree_mult1_4_shift0_q));
    u0_m0_wo2_mtree_mult1_4_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_4_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_4_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_4_add_1_a) + SIGNED(u0_m0_wo2_mtree_mult1_4_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_4_add_1_q <= u0_m0_wo2_mtree_mult1_4_add_1_o(19 downto 0);

    -- u0_m0_wo2_mtree_mult1_4_sub_3(SUB,328)@11 + 1
    u0_m0_wo2_mtree_mult1_4_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => u0_m0_wo2_mtree_mult1_4_add_1_q(19)) & u0_m0_wo2_mtree_mult1_4_add_1_q));
    u0_m0_wo2_mtree_mult1_4_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo2_mtree_mult1_4_shift2_q(20)) & u0_m0_wo2_mtree_mult1_4_shift2_q));
    u0_m0_wo2_mtree_mult1_4_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_4_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_4_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_4_sub_3_a) - SIGNED(u0_m0_wo2_mtree_mult1_4_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_4_sub_3_q <= u0_m0_wo2_mtree_mult1_4_sub_3_o(21 downto 0);

    -- u0_m0_wo2_mtree_mult1_4_shift4(BITSHIFT,329)@12
    u0_m0_wo2_mtree_mult1_4_shift4_qint <= u0_m0_wo2_mtree_mult1_4_sub_3_q & "0000";
    u0_m0_wo2_mtree_mult1_4_shift4_q <= u0_m0_wo2_mtree_mult1_4_shift4_qint(25 downto 0);

    -- u0_m0_wo2_mtree_add0_2(ADD,178)@12 + 1
    u0_m0_wo2_mtree_add0_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 26 => u0_m0_wo2_mtree_mult1_4_shift4_q(25)) & u0_m0_wo2_mtree_mult1_4_shift4_q));
    u0_m0_wo2_mtree_add0_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo2_mtree_mult1_5_q(27)) & u0_m0_wo2_mtree_mult1_5_q));
    u0_m0_wo2_mtree_add0_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_2_a) + SIGNED(u0_m0_wo2_mtree_add0_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_2_q <= u0_m0_wo2_mtree_add0_2_o(28 downto 0);

    -- u0_m0_wo2_mtree_add1_1(ADD,183)@13 + 1
    u0_m0_wo2_mtree_add1_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo2_mtree_add0_2_q(28)) & u0_m0_wo2_mtree_add0_2_q));
    u0_m0_wo2_mtree_add1_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 28 => u0_m0_wo2_mtree_mult1_6_q(27)) & u0_m0_wo2_mtree_mult1_6_q));
    u0_m0_wo2_mtree_add1_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add1_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add1_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add1_1_a) + SIGNED(u0_m0_wo2_mtree_add1_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add1_1_q <= u0_m0_wo2_mtree_add1_1_o(29 downto 0);

    -- u0_m0_wo2_mtree_mult1_2_shift2(BITSHIFT,332)@11
    u0_m0_wo2_mtree_mult1_2_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr10_q_11_q & "00";
    u0_m0_wo2_mtree_mult1_2_shift2_q <= u0_m0_wo2_mtree_mult1_2_shift2_qint(17 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr9(DELAY,28)@10
    u0_m0_wo0_wi0_r0_delayr9 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr8_q, xout => u0_m0_wo0_wi0_r0_delayr9_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr10(DELAY,29)@10
    u0_m0_wo0_wi0_r0_delayr10 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr9_q, xout => u0_m0_wo0_wi0_r0_delayr10_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr10_q_11(DELAY,450)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr10_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr10_q, xout => d_u0_m0_wo0_wi0_r0_delayr10_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_2_add_3(ADD,333)@11 + 1
    u0_m0_wo2_mtree_mult1_2_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => d_u0_m0_wo0_wi0_r0_delayr10_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr10_q_11_q));
    u0_m0_wo2_mtree_mult1_2_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo2_mtree_mult1_2_shift2_q(17)) & u0_m0_wo2_mtree_mult1_2_shift2_q));
    u0_m0_wo2_mtree_mult1_2_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_2_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_2_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_2_add_3_a) + SIGNED(u0_m0_wo2_mtree_mult1_2_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_2_add_3_q <= u0_m0_wo2_mtree_mult1_2_add_3_o(18 downto 0);

    -- u0_m0_wo2_mtree_mult1_2_shift4(BITSHIFT,334)@12
    u0_m0_wo2_mtree_mult1_2_shift4_qint <= u0_m0_wo2_mtree_mult1_2_add_3_q & "00000";
    u0_m0_wo2_mtree_mult1_2_shift4_q <= u0_m0_wo2_mtree_mult1_2_shift4_qint(23 downto 0);

    -- u0_m0_wo2_mtree_mult1_2_shift0(BITSHIFT,330)@11
    u0_m0_wo2_mtree_mult1_2_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr10_q_11_q & "000";
    u0_m0_wo2_mtree_mult1_2_shift0_q <= u0_m0_wo2_mtree_mult1_2_shift0_qint(18 downto 0);

    -- u0_m0_wo2_mtree_mult1_2_sub_1(SUB,331)@11 + 1
    u0_m0_wo2_mtree_mult1_2_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo2_mtree_mult1_2_shift0_q(18)) & u0_m0_wo2_mtree_mult1_2_shift0_q));
    u0_m0_wo2_mtree_mult1_2_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => d_u0_m0_wo0_wi0_r0_delayr10_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr10_q_11_q));
    u0_m0_wo2_mtree_mult1_2_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_2_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_2_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_2_sub_1_a) - SIGNED(u0_m0_wo2_mtree_mult1_2_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_2_sub_1_q <= u0_m0_wo2_mtree_mult1_2_sub_1_o(19 downto 0);

    -- u0_m0_wo2_mtree_mult1_2_add_5(ADD,335)@12 + 1
    u0_m0_wo2_mtree_mult1_2_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 20 => u0_m0_wo2_mtree_mult1_2_sub_1_q(19)) & u0_m0_wo2_mtree_mult1_2_sub_1_q));
    u0_m0_wo2_mtree_mult1_2_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo2_mtree_mult1_2_shift4_q(23)) & u0_m0_wo2_mtree_mult1_2_shift4_q));
    u0_m0_wo2_mtree_mult1_2_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_2_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_2_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_2_add_5_a) + SIGNED(u0_m0_wo2_mtree_mult1_2_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_2_add_5_q <= u0_m0_wo2_mtree_mult1_2_add_5_o(24 downto 0);

    -- u0_m0_wo2_mtree_mult1_1_shift2(BITSHIFT,338)@10
    u0_m0_wo2_mtree_mult1_1_shift2_qint <= u0_m0_wo0_wi0_r0_delayr11_q & "00";
    u0_m0_wo2_mtree_mult1_1_shift2_q <= u0_m0_wo2_mtree_mult1_1_shift2_qint(17 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr11(DELAY,30)@10
    u0_m0_wo0_wi0_r0_delayr11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr10_q, xout => u0_m0_wo0_wi0_r0_delayr11_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_1_sub_3(SUB,339)@10 + 1
    u0_m0_wo2_mtree_mult1_1_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => u0_m0_wo0_wi0_r0_delayr11_q(15)) & u0_m0_wo0_wi0_r0_delayr11_q));
    u0_m0_wo2_mtree_mult1_1_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo2_mtree_mult1_1_shift2_q(17)) & u0_m0_wo2_mtree_mult1_1_shift2_q));
    u0_m0_wo2_mtree_mult1_1_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_1_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_1_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_1_sub_3_a) - SIGNED(u0_m0_wo2_mtree_mult1_1_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_1_sub_3_q <= u0_m0_wo2_mtree_mult1_1_sub_3_o(18 downto 0);

    -- u0_m0_wo2_mtree_mult1_1_shift4(BITSHIFT,340)@11
    u0_m0_wo2_mtree_mult1_1_shift4_qint <= u0_m0_wo2_mtree_mult1_1_sub_3_q & "00000";
    u0_m0_wo2_mtree_mult1_1_shift4_q <= u0_m0_wo2_mtree_mult1_1_shift4_qint(23 downto 0);

    -- u0_m0_wo2_mtree_mult1_1_shift0(BITSHIFT,336)@10
    u0_m0_wo2_mtree_mult1_1_shift0_qint <= u0_m0_wo0_wi0_r0_delayr11_q & "00";
    u0_m0_wo2_mtree_mult1_1_shift0_q <= u0_m0_wo2_mtree_mult1_1_shift0_qint(17 downto 0);

    -- u0_m0_wo2_mtree_mult1_1_sub_1(SUB,337)@10 + 1
    u0_m0_wo2_mtree_mult1_1_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo2_mtree_mult1_1_shift0_q(17)) & u0_m0_wo2_mtree_mult1_1_shift0_q));
    u0_m0_wo2_mtree_mult1_1_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => u0_m0_wo0_wi0_r0_delayr11_q(15)) & u0_m0_wo0_wi0_r0_delayr11_q));
    u0_m0_wo2_mtree_mult1_1_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_1_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_1_sub_1_a) - SIGNED(u0_m0_wo2_mtree_mult1_1_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_1_sub_1_q <= u0_m0_wo2_mtree_mult1_1_sub_1_o(18 downto 0);

    -- u0_m0_wo2_mtree_mult1_1_add_5(ADD,341)@11 + 1
    u0_m0_wo2_mtree_mult1_1_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 19 => u0_m0_wo2_mtree_mult1_1_sub_1_q(18)) & u0_m0_wo2_mtree_mult1_1_sub_1_q));
    u0_m0_wo2_mtree_mult1_1_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo2_mtree_mult1_1_shift4_q(23)) & u0_m0_wo2_mtree_mult1_1_shift4_q));
    u0_m0_wo2_mtree_mult1_1_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_1_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_1_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_1_add_5_a) + SIGNED(u0_m0_wo2_mtree_mult1_1_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_1_add_5_q <= u0_m0_wo2_mtree_mult1_1_add_5_o(24 downto 0);

    -- u0_m0_wo2_mtree_mult1_1_shift6(BITSHIFT,342)@12
    u0_m0_wo2_mtree_mult1_1_shift6_qint <= u0_m0_wo2_mtree_mult1_1_add_5_q & "0";
    u0_m0_wo2_mtree_mult1_1_shift6_q <= u0_m0_wo2_mtree_mult1_1_shift6_qint(25 downto 0);

    -- u0_m0_wo2_mtree_mult1_0_shift0(BITSHIFT,343)@10
    u0_m0_wo2_mtree_mult1_0_shift0_qint <= u0_m0_wo0_wi0_r0_delayr12_q & "00";
    u0_m0_wo2_mtree_mult1_0_shift0_q <= u0_m0_wo2_mtree_mult1_0_shift0_qint(17 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr12(DELAY,31)@10
    u0_m0_wo0_wi0_r0_delayr12 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr11_q, xout => u0_m0_wo0_wi0_r0_delayr12_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_0_add_1(ADD,344)@10 + 1
    u0_m0_wo2_mtree_mult1_0_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => u0_m0_wo0_wi0_r0_delayr12_q(15)) & u0_m0_wo0_wi0_r0_delayr12_q));
    u0_m0_wo2_mtree_mult1_0_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo2_mtree_mult1_0_shift0_q(17)) & u0_m0_wo2_mtree_mult1_0_shift0_q));
    u0_m0_wo2_mtree_mult1_0_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_0_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_0_add_1_a) + SIGNED(u0_m0_wo2_mtree_mult1_0_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_0_add_1_q <= u0_m0_wo2_mtree_mult1_0_add_1_o(18 downto 0);

    -- d_u0_m0_wo0_wi0_r0_delayr12_q_11(DELAY,452)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr12_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr12_q, xout => d_u0_m0_wo0_wi0_r0_delayr12_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_0_shift2(BITSHIFT,345)@11
    u0_m0_wo2_mtree_mult1_0_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr12_q_11_q & "00000";
    u0_m0_wo2_mtree_mult1_0_shift2_q <= u0_m0_wo2_mtree_mult1_0_shift2_qint(20 downto 0);

    -- u0_m0_wo2_mtree_mult1_0_sub_3(SUB,346)@11 + 1
    u0_m0_wo2_mtree_mult1_0_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo2_mtree_mult1_0_shift2_q(20)) & u0_m0_wo2_mtree_mult1_0_shift2_q));
    u0_m0_wo2_mtree_mult1_0_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 19 => u0_m0_wo2_mtree_mult1_0_add_1_q(18)) & u0_m0_wo2_mtree_mult1_0_add_1_q));
    u0_m0_wo2_mtree_mult1_0_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_0_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_0_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_0_sub_3_a) - SIGNED(u0_m0_wo2_mtree_mult1_0_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_0_sub_3_q <= u0_m0_wo2_mtree_mult1_0_sub_3_o(21 downto 0);

    -- u0_m0_wo2_mtree_mult1_0_shift4(BITSHIFT,347)@12
    u0_m0_wo2_mtree_mult1_0_shift4_qint <= u0_m0_wo2_mtree_mult1_0_sub_3_q & "00";
    u0_m0_wo2_mtree_mult1_0_shift4_q <= u0_m0_wo2_mtree_mult1_0_shift4_qint(23 downto 0);

    -- u0_m0_wo2_mtree_add0_0(ADD,176)@12 + 1
    u0_m0_wo2_mtree_add0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 24 => u0_m0_wo2_mtree_mult1_0_shift4_q(23)) & u0_m0_wo2_mtree_mult1_0_shift4_q));
    u0_m0_wo2_mtree_add0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo2_mtree_mult1_1_shift6_q);
    u0_m0_wo2_mtree_add0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_0_a) + SIGNED(u0_m0_wo2_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_0_q <= u0_m0_wo2_mtree_add0_0_o(25 downto 0);

    -- u0_m0_wo2_mtree_add1_0(ADD,182)@13 + 1
    u0_m0_wo2_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo2_mtree_add0_0_q(25)) & u0_m0_wo2_mtree_add0_0_q));
    u0_m0_wo2_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => u0_m0_wo2_mtree_mult1_2_add_5_q(24)) & u0_m0_wo2_mtree_mult1_2_add_5_q));
    u0_m0_wo2_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add1_0_a) + SIGNED(u0_m0_wo2_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add1_0_q <= u0_m0_wo2_mtree_add1_0_o(26 downto 0);

    -- u0_m0_wo2_mtree_add2_0(ADD,185)@14 + 1
    u0_m0_wo2_mtree_add2_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 27 => u0_m0_wo2_mtree_add1_0_q(26)) & u0_m0_wo2_mtree_add1_0_q));
    u0_m0_wo2_mtree_add2_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo2_mtree_add1_1_q(29)) & u0_m0_wo2_mtree_add1_1_q));
    u0_m0_wo2_mtree_add2_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add2_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add2_0_a) + SIGNED(u0_m0_wo2_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add2_0_q <= u0_m0_wo2_mtree_add2_0_o(30 downto 0);

    -- u0_m0_wo2_mtree_add3_0(ADD,186)@15 + 1
    u0_m0_wo2_mtree_add3_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo2_mtree_add2_0_q(30)) & u0_m0_wo2_mtree_add2_0_q));
    u0_m0_wo2_mtree_add3_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 28 => u0_m0_wo2_mtree_add1_2_q(27)) & u0_m0_wo2_mtree_add1_2_q));
    u0_m0_wo2_mtree_add3_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add3_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add3_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add3_0_a) + SIGNED(u0_m0_wo2_mtree_add3_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add3_0_q <= u0_m0_wo2_mtree_add3_0_o(31 downto 0);

    -- u0_m0_wo1_mtree_mult1_11_shift0(BITSHIFT,242)@11
    u0_m0_wo1_mtree_mult1_11_shift0_qint <= d_u0_m0_wo0_wi0_r0_phasedelay0_q_11_q & "00";
    u0_m0_wo1_mtree_mult1_11_shift0_q <= u0_m0_wo1_mtree_mult1_11_shift0_qint(17 downto 0);

    -- d_u0_m0_wo0_wi0_r0_phasedelay0_q_11(DELAY,437)@10 + 1
    d_u0_m0_wo0_wi0_r0_phasedelay0_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => d_u0_m0_wo0_wi0_r0_phasedelay0_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_mtree_mult1_11_add_1(ADD,243)@11 + 1
    u0_m0_wo1_mtree_mult1_11_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => d_u0_m0_wo0_wi0_r0_phasedelay0_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_phasedelay0_q_11_q));
    u0_m0_wo1_mtree_mult1_11_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo1_mtree_mult1_11_shift0_q(17)) & u0_m0_wo1_mtree_mult1_11_shift0_q));
    u0_m0_wo1_mtree_mult1_11_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_11_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_11_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_11_add_1_a) + SIGNED(u0_m0_wo1_mtree_mult1_11_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_11_add_1_q <= u0_m0_wo1_mtree_mult1_11_add_1_o(18 downto 0);

    -- d_u0_m0_wo0_wi0_r0_phasedelay0_q_12(DELAY,438)@11 + 1
    d_u0_m0_wo0_wi0_r0_phasedelay0_q_12 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_phasedelay0_q_11_q, xout => d_u0_m0_wo0_wi0_r0_phasedelay0_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_mtree_mult1_11_shift2(BITSHIFT,244)@12
    u0_m0_wo1_mtree_mult1_11_shift2_qint <= d_u0_m0_wo0_wi0_r0_phasedelay0_q_12_q & "00000";
    u0_m0_wo1_mtree_mult1_11_shift2_q <= u0_m0_wo1_mtree_mult1_11_shift2_qint(20 downto 0);

    -- u0_m0_wo1_mtree_mult1_11_sub_3(SUB,245)@12 + 1
    u0_m0_wo1_mtree_mult1_11_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo1_mtree_mult1_11_shift2_q(20)) & u0_m0_wo1_mtree_mult1_11_shift2_q));
    u0_m0_wo1_mtree_mult1_11_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 19 => u0_m0_wo1_mtree_mult1_11_add_1_q(18)) & u0_m0_wo1_mtree_mult1_11_add_1_q));
    u0_m0_wo1_mtree_mult1_11_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_11_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_11_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_11_sub_3_a) - SIGNED(u0_m0_wo1_mtree_mult1_11_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_11_sub_3_q <= u0_m0_wo1_mtree_mult1_11_sub_3_o(21 downto 0);

    -- u0_m0_wo1_mtree_mult1_11_shift4(BITSHIFT,246)@13
    u0_m0_wo1_mtree_mult1_11_shift4_qint <= u0_m0_wo1_mtree_mult1_11_sub_3_q & "00";
    u0_m0_wo1_mtree_mult1_11_shift4_q <= u0_m0_wo1_mtree_mult1_11_shift4_qint(23 downto 0);

    -- u0_m0_wo1_mtree_mult1_10_shift2(BITSHIFT,249)@11
    u0_m0_wo1_mtree_mult1_10_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr1_q_11_q & "00";
    u0_m0_wo1_mtree_mult1_10_shift2_q <= u0_m0_wo1_mtree_mult1_10_shift2_qint(17 downto 0);

    -- u0_m0_wo1_mtree_mult1_10_sub_3(SUB,250)@11 + 1
    u0_m0_wo1_mtree_mult1_10_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => d_u0_m0_wo0_wi0_r0_delayr1_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr1_q_11_q));
    u0_m0_wo1_mtree_mult1_10_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo1_mtree_mult1_10_shift2_q(17)) & u0_m0_wo1_mtree_mult1_10_shift2_q));
    u0_m0_wo1_mtree_mult1_10_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_10_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_10_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_10_sub_3_a) - SIGNED(u0_m0_wo1_mtree_mult1_10_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_10_sub_3_q <= u0_m0_wo1_mtree_mult1_10_sub_3_o(18 downto 0);

    -- u0_m0_wo1_mtree_mult1_10_shift4(BITSHIFT,251)@12
    u0_m0_wo1_mtree_mult1_10_shift4_qint <= u0_m0_wo1_mtree_mult1_10_sub_3_q & "00000";
    u0_m0_wo1_mtree_mult1_10_shift4_q <= u0_m0_wo1_mtree_mult1_10_shift4_qint(23 downto 0);

    -- u0_m0_wo1_mtree_mult1_10_shift0(BITSHIFT,247)@11
    u0_m0_wo1_mtree_mult1_10_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr1_q_11_q & "00";
    u0_m0_wo1_mtree_mult1_10_shift0_q <= u0_m0_wo1_mtree_mult1_10_shift0_qint(17 downto 0);

    -- u0_m0_wo1_mtree_mult1_10_sub_1(SUB,248)@11 + 1
    u0_m0_wo1_mtree_mult1_10_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo1_mtree_mult1_10_shift0_q(17)) & u0_m0_wo1_mtree_mult1_10_shift0_q));
    u0_m0_wo1_mtree_mult1_10_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => d_u0_m0_wo0_wi0_r0_delayr1_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr1_q_11_q));
    u0_m0_wo1_mtree_mult1_10_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_10_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_10_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_10_sub_1_a) - SIGNED(u0_m0_wo1_mtree_mult1_10_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_10_sub_1_q <= u0_m0_wo1_mtree_mult1_10_sub_1_o(18 downto 0);

    -- u0_m0_wo1_mtree_mult1_10_add_5(ADD,252)@12 + 1
    u0_m0_wo1_mtree_mult1_10_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 19 => u0_m0_wo1_mtree_mult1_10_sub_1_q(18)) & u0_m0_wo1_mtree_mult1_10_sub_1_q));
    u0_m0_wo1_mtree_mult1_10_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo1_mtree_mult1_10_shift4_q(23)) & u0_m0_wo1_mtree_mult1_10_shift4_q));
    u0_m0_wo1_mtree_mult1_10_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_10_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_10_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_10_add_5_a) + SIGNED(u0_m0_wo1_mtree_mult1_10_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_10_add_5_q <= u0_m0_wo1_mtree_mult1_10_add_5_o(24 downto 0);

    -- u0_m0_wo1_mtree_mult1_10_shift6(BITSHIFT,253)@13
    u0_m0_wo1_mtree_mult1_10_shift6_qint <= u0_m0_wo1_mtree_mult1_10_add_5_q & "0";
    u0_m0_wo1_mtree_mult1_10_shift6_q <= u0_m0_wo1_mtree_mult1_10_shift6_qint(25 downto 0);

    -- u0_m0_wo1_mtree_add0_5(ADD,119)@13 + 1
    u0_m0_wo1_mtree_add0_5_a <= STD_LOGIC_VECTOR(u0_m0_wo1_mtree_mult1_10_shift6_q);
    u0_m0_wo1_mtree_add0_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 24 => u0_m0_wo1_mtree_mult1_11_shift4_q(23)) & u0_m0_wo1_mtree_mult1_11_shift4_q));
    u0_m0_wo1_mtree_add0_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add0_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add0_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add0_5_a) + SIGNED(u0_m0_wo1_mtree_add0_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add0_5_q <= u0_m0_wo1_mtree_add0_5_o(25 downto 0);

    -- u0_m0_wo1_mtree_mult1_9_shift2(BITSHIFT,256)@12
    u0_m0_wo1_mtree_mult1_9_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr2_q_12_q & "00";
    u0_m0_wo1_mtree_mult1_9_shift2_q <= u0_m0_wo1_mtree_mult1_9_shift2_qint(17 downto 0);

    -- u0_m0_wo1_mtree_mult1_9_add_3(ADD,257)@12 + 1
    u0_m0_wo1_mtree_mult1_9_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => d_u0_m0_wo0_wi0_r0_delayr2_q_12_q(15)) & d_u0_m0_wo0_wi0_r0_delayr2_q_12_q));
    u0_m0_wo1_mtree_mult1_9_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo1_mtree_mult1_9_shift2_q(17)) & u0_m0_wo1_mtree_mult1_9_shift2_q));
    u0_m0_wo1_mtree_mult1_9_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_9_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_9_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_9_add_3_a) + SIGNED(u0_m0_wo1_mtree_mult1_9_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_9_add_3_q <= u0_m0_wo1_mtree_mult1_9_add_3_o(18 downto 0);

    -- u0_m0_wo1_mtree_mult1_9_shift4(BITSHIFT,258)@13
    u0_m0_wo1_mtree_mult1_9_shift4_qint <= u0_m0_wo1_mtree_mult1_9_add_3_q & "00000";
    u0_m0_wo1_mtree_mult1_9_shift4_q <= u0_m0_wo1_mtree_mult1_9_shift4_qint(23 downto 0);

    -- u0_m0_wo1_mtree_mult1_9_shift0(BITSHIFT,254)@12
    u0_m0_wo1_mtree_mult1_9_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr2_q_12_q & "000";
    u0_m0_wo1_mtree_mult1_9_shift0_q <= u0_m0_wo1_mtree_mult1_9_shift0_qint(18 downto 0);

    -- u0_m0_wo1_mtree_mult1_9_sub_1(SUB,255)@12 + 1
    u0_m0_wo1_mtree_mult1_9_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo1_mtree_mult1_9_shift0_q(18)) & u0_m0_wo1_mtree_mult1_9_shift0_q));
    u0_m0_wo1_mtree_mult1_9_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => d_u0_m0_wo0_wi0_r0_delayr2_q_12_q(15)) & d_u0_m0_wo0_wi0_r0_delayr2_q_12_q));
    u0_m0_wo1_mtree_mult1_9_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_9_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_9_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_9_sub_1_a) - SIGNED(u0_m0_wo1_mtree_mult1_9_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_9_sub_1_q <= u0_m0_wo1_mtree_mult1_9_sub_1_o(19 downto 0);

    -- u0_m0_wo1_mtree_mult1_9_add_5(ADD,259)@13 + 1
    u0_m0_wo1_mtree_mult1_9_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 20 => u0_m0_wo1_mtree_mult1_9_sub_1_q(19)) & u0_m0_wo1_mtree_mult1_9_sub_1_q));
    u0_m0_wo1_mtree_mult1_9_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo1_mtree_mult1_9_shift4_q(23)) & u0_m0_wo1_mtree_mult1_9_shift4_q));
    u0_m0_wo1_mtree_mult1_9_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_9_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_9_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_9_add_5_a) + SIGNED(u0_m0_wo1_mtree_mult1_9_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_9_add_5_q <= u0_m0_wo1_mtree_mult1_9_add_5_o(24 downto 0);

    -- u0_m0_wo1_mtree_add1_2(ADD,122)@14 + 1
    u0_m0_wo1_mtree_add1_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => u0_m0_wo1_mtree_mult1_9_add_5_q(24)) & u0_m0_wo1_mtree_mult1_9_add_5_q));
    u0_m0_wo1_mtree_add1_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo1_mtree_add0_5_q(25)) & u0_m0_wo1_mtree_add0_5_q));
    u0_m0_wo1_mtree_add1_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add1_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add1_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add1_2_a) + SIGNED(u0_m0_wo1_mtree_add1_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add1_2_q <= u0_m0_wo1_mtree_add1_2_o(26 downto 0);

    -- d_u0_m0_wo0_wi0_r0_delayr4_q_11(DELAY,444)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr4_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr4_q, xout => d_u0_m0_wo0_wi0_r0_delayr4_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_mtree_mult1_7_shift2(BITSHIFT,262)@11
    u0_m0_wo1_mtree_mult1_7_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr4_q_11_q & "00000";
    u0_m0_wo1_mtree_mult1_7_shift2_q <= u0_m0_wo1_mtree_mult1_7_shift2_qint(20 downto 0);

    -- u0_m0_wo1_mtree_mult1_7_shift0(BITSHIFT,260)@10
    u0_m0_wo1_mtree_mult1_7_shift0_qint <= u0_m0_wo0_wi0_r0_delayr4_q & "000";
    u0_m0_wo1_mtree_mult1_7_shift0_q <= u0_m0_wo1_mtree_mult1_7_shift0_qint(18 downto 0);

    -- u0_m0_wo1_mtree_mult1_7_add_1(ADD,261)@10 + 1
    u0_m0_wo1_mtree_mult1_7_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => u0_m0_wo0_wi0_r0_delayr4_q(15)) & u0_m0_wo0_wi0_r0_delayr4_q));
    u0_m0_wo1_mtree_mult1_7_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo1_mtree_mult1_7_shift0_q(18)) & u0_m0_wo1_mtree_mult1_7_shift0_q));
    u0_m0_wo1_mtree_mult1_7_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_7_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_7_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_7_add_1_a) + SIGNED(u0_m0_wo1_mtree_mult1_7_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_7_add_1_q <= u0_m0_wo1_mtree_mult1_7_add_1_o(19 downto 0);

    -- u0_m0_wo1_mtree_mult1_7_sub_3(SUB,263)@11 + 1
    u0_m0_wo1_mtree_mult1_7_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => u0_m0_wo1_mtree_mult1_7_add_1_q(19)) & u0_m0_wo1_mtree_mult1_7_add_1_q));
    u0_m0_wo1_mtree_mult1_7_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo1_mtree_mult1_7_shift2_q(20)) & u0_m0_wo1_mtree_mult1_7_shift2_q));
    u0_m0_wo1_mtree_mult1_7_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_7_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_7_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_7_sub_3_a) - SIGNED(u0_m0_wo1_mtree_mult1_7_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_7_sub_3_q <= u0_m0_wo1_mtree_mult1_7_sub_3_o(21 downto 0);

    -- u0_m0_wo1_mtree_mult1_7_shift4(BITSHIFT,264)@12
    u0_m0_wo1_mtree_mult1_7_shift4_qint <= u0_m0_wo1_mtree_mult1_7_sub_3_q & "0000";
    u0_m0_wo1_mtree_mult1_7_shift4_q <= u0_m0_wo1_mtree_mult1_7_shift4_qint(25 downto 0);

    -- u0_m0_wo1_mtree_mult1_6(MULT,107)@10 + 2
    u0_m0_wo1_mtree_mult1_6_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm5_q);
    u0_m0_wo1_mtree_mult1_6_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr5_q);
    u0_m0_wo1_mtree_mult1_6_reset <= areset;
    u0_m0_wo1_mtree_mult1_6_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 12,
        lpm_widthb => 16,
        lpm_widthp => 28,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo1_mtree_mult1_6_a0,
        datab => u0_m0_wo1_mtree_mult1_6_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo1_mtree_mult1_6_reset,
        clock => clk,
        result => u0_m0_wo1_mtree_mult1_6_s1
    );
    u0_m0_wo1_mtree_mult1_6_q <= u0_m0_wo1_mtree_mult1_6_s1;

    -- u0_m0_wo1_mtree_add0_3(ADD,117)@12 + 1
    u0_m0_wo1_mtree_add0_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo1_mtree_mult1_6_q(27)) & u0_m0_wo1_mtree_mult1_6_q));
    u0_m0_wo1_mtree_add0_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 26 => u0_m0_wo1_mtree_mult1_7_shift4_q(25)) & u0_m0_wo1_mtree_mult1_7_shift4_q));
    u0_m0_wo1_mtree_add0_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add0_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add0_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add0_3_a) + SIGNED(u0_m0_wo1_mtree_add0_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add0_3_q <= u0_m0_wo1_mtree_add0_3_o(28 downto 0);

    -- d_u0_m0_wo0_wi0_r0_delayr6_q_11(DELAY,446)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr6_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr6_q, xout => d_u0_m0_wo0_wi0_r0_delayr6_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_mtree_mult1_5(MULT,108)@11 + 2
    u0_m0_wo1_mtree_mult1_5_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm6_q);
    u0_m0_wo1_mtree_mult1_5_b0 <= STD_LOGIC_VECTOR(d_u0_m0_wo0_wi0_r0_delayr6_q_11_q);
    u0_m0_wo1_mtree_mult1_5_reset <= areset;
    u0_m0_wo1_mtree_mult1_5_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 12,
        lpm_widthb => 16,
        lpm_widthp => 28,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo1_mtree_mult1_5_a0,
        datab => u0_m0_wo1_mtree_mult1_5_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo1_mtree_mult1_5_reset,
        clock => clk,
        result => u0_m0_wo1_mtree_mult1_5_s1
    );
    u0_m0_wo1_mtree_mult1_5_q <= u0_m0_wo1_mtree_mult1_5_s1;

    -- u0_m0_wo1_mtree_add1_1(ADD,121)@13 + 1
    u0_m0_wo1_mtree_add1_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 28 => u0_m0_wo1_mtree_mult1_5_q(27)) & u0_m0_wo1_mtree_mult1_5_q));
    u0_m0_wo1_mtree_add1_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo1_mtree_add0_3_q(28)) & u0_m0_wo1_mtree_add0_3_q));
    u0_m0_wo1_mtree_add1_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add1_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add1_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add1_1_a) + SIGNED(u0_m0_wo1_mtree_add1_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add1_1_q <= u0_m0_wo1_mtree_add1_1_o(29 downto 0);

    -- d_u0_m0_wo0_wi0_r0_delayr9_q_11(DELAY,449)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr9_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr9_q, xout => d_u0_m0_wo0_wi0_r0_delayr9_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_mtree_mult1_3_shift2(BITSHIFT,284)@11
    u0_m0_wo1_mtree_mult1_3_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr9_q_11_q & "00000000";
    u0_m0_wo1_mtree_mult1_3_shift2_q <= u0_m0_wo1_mtree_mult1_3_shift2_qint(23 downto 0);

    -- u0_m0_wo1_mtree_mult1_3_shift0(BITSHIFT,282)@10
    u0_m0_wo1_mtree_mult1_3_shift0_qint <= u0_m0_wo0_wi0_r0_delayr9_q & "000";
    u0_m0_wo1_mtree_mult1_3_shift0_q <= u0_m0_wo1_mtree_mult1_3_shift0_qint(18 downto 0);

    -- u0_m0_wo1_mtree_mult1_3_sub_1(SUB,283)@10 + 1
    u0_m0_wo1_mtree_mult1_3_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => u0_m0_wo0_wi0_r0_delayr9_q(15)) & u0_m0_wo0_wi0_r0_delayr9_q));
    u0_m0_wo1_mtree_mult1_3_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo1_mtree_mult1_3_shift0_q(18)) & u0_m0_wo1_mtree_mult1_3_shift0_q));
    u0_m0_wo1_mtree_mult1_3_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_3_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_3_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_3_sub_1_a) - SIGNED(u0_m0_wo1_mtree_mult1_3_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_3_sub_1_q <= u0_m0_wo1_mtree_mult1_3_sub_1_o(19 downto 0);

    -- u0_m0_wo1_mtree_mult1_3_sub_3(SUB,285)@11 + 1
    u0_m0_wo1_mtree_mult1_3_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 20 => u0_m0_wo1_mtree_mult1_3_sub_1_q(19)) & u0_m0_wo1_mtree_mult1_3_sub_1_q));
    u0_m0_wo1_mtree_mult1_3_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo1_mtree_mult1_3_shift2_q(23)) & u0_m0_wo1_mtree_mult1_3_shift2_q));
    u0_m0_wo1_mtree_mult1_3_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_3_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_3_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_3_sub_3_a) - SIGNED(u0_m0_wo1_mtree_mult1_3_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_3_sub_3_q <= u0_m0_wo1_mtree_mult1_3_sub_3_o(24 downto 0);

    -- u0_m0_wo1_mtree_mult1_2_shift0(BITSHIFT,286)@11
    u0_m0_wo1_mtree_mult1_2_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr10_q_11_q & "000000";
    u0_m0_wo1_mtree_mult1_2_shift0_q <= u0_m0_wo1_mtree_mult1_2_shift0_qint(21 downto 0);

    -- u0_m0_wo1_mtree_mult1_2_add_1(ADD,287)@11 + 1
    u0_m0_wo1_mtree_mult1_2_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 16 => d_u0_m0_wo0_wi0_r0_delayr10_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr10_q_11_q));
    u0_m0_wo1_mtree_mult1_2_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo1_mtree_mult1_2_shift0_q(21)) & u0_m0_wo1_mtree_mult1_2_shift0_q));
    u0_m0_wo1_mtree_mult1_2_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_2_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_2_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_2_add_1_a) + SIGNED(u0_m0_wo1_mtree_mult1_2_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_2_add_1_q <= u0_m0_wo1_mtree_mult1_2_add_1_o(22 downto 0);

    -- u0_m0_wo1_mtree_mult1_2_shift2(BITSHIFT,288)@12
    u0_m0_wo1_mtree_mult1_2_shift2_qint <= u0_m0_wo1_mtree_mult1_2_add_1_q & "00";
    u0_m0_wo1_mtree_mult1_2_shift2_q <= u0_m0_wo1_mtree_mult1_2_shift2_qint(24 downto 0);

    -- u0_m0_wo1_mtree_add0_1(ADD,115)@12 + 1
    u0_m0_wo1_mtree_add0_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo1_mtree_mult1_2_shift2_q(24)) & u0_m0_wo1_mtree_mult1_2_shift2_q));
    u0_m0_wo1_mtree_add0_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo1_mtree_mult1_3_sub_3_q(24)) & u0_m0_wo1_mtree_mult1_3_sub_3_q));
    u0_m0_wo1_mtree_add0_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add0_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add0_1_a) + SIGNED(u0_m0_wo1_mtree_add0_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add0_1_q <= u0_m0_wo1_mtree_add0_1_o(25 downto 0);

    -- u0_m0_wo1_mtree_mult1_1_shift2(BITSHIFT,291)@11
    u0_m0_wo1_mtree_mult1_1_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr11_q_11_q & "000";
    u0_m0_wo1_mtree_mult1_1_shift2_q <= u0_m0_wo1_mtree_mult1_1_shift2_qint(18 downto 0);

    -- d_u0_m0_wo0_wi0_r0_delayr11_q_11(DELAY,451)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr11_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr11_q, xout => d_u0_m0_wo0_wi0_r0_delayr11_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_mtree_mult1_1_add_3(ADD,292)@11 + 1
    u0_m0_wo1_mtree_mult1_1_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => d_u0_m0_wo0_wi0_r0_delayr11_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr11_q_11_q));
    u0_m0_wo1_mtree_mult1_1_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo1_mtree_mult1_1_shift2_q(18)) & u0_m0_wo1_mtree_mult1_1_shift2_q));
    u0_m0_wo1_mtree_mult1_1_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_1_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_1_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_1_add_3_a) + SIGNED(u0_m0_wo1_mtree_mult1_1_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_1_add_3_q <= u0_m0_wo1_mtree_mult1_1_add_3_o(19 downto 0);

    -- u0_m0_wo1_mtree_mult1_1_shift4(BITSHIFT,293)@12
    u0_m0_wo1_mtree_mult1_1_shift4_qint <= u0_m0_wo1_mtree_mult1_1_add_3_q & "0000";
    u0_m0_wo1_mtree_mult1_1_shift4_q <= u0_m0_wo1_mtree_mult1_1_shift4_qint(23 downto 0);

    -- u0_m0_wo1_mtree_mult1_1_shift0(BITSHIFT,289)@11
    u0_m0_wo1_mtree_mult1_1_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr11_q_11_q & "00";
    u0_m0_wo1_mtree_mult1_1_shift0_q <= u0_m0_wo1_mtree_mult1_1_shift0_qint(17 downto 0);

    -- u0_m0_wo1_mtree_mult1_1_sub_1(SUB,290)@11 + 1
    u0_m0_wo1_mtree_mult1_1_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo1_mtree_mult1_1_shift0_q(17)) & u0_m0_wo1_mtree_mult1_1_shift0_q));
    u0_m0_wo1_mtree_mult1_1_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => d_u0_m0_wo0_wi0_r0_delayr11_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr11_q_11_q));
    u0_m0_wo1_mtree_mult1_1_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_1_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_1_sub_1_a) - SIGNED(u0_m0_wo1_mtree_mult1_1_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_1_sub_1_q <= u0_m0_wo1_mtree_mult1_1_sub_1_o(18 downto 0);

    -- u0_m0_wo1_mtree_mult1_1_sub_5(SUB,294)@12 + 1
    u0_m0_wo1_mtree_mult1_1_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 19 => u0_m0_wo1_mtree_mult1_1_sub_1_q(18)) & u0_m0_wo1_mtree_mult1_1_sub_1_q));
    u0_m0_wo1_mtree_mult1_1_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo1_mtree_mult1_1_shift4_q(23)) & u0_m0_wo1_mtree_mult1_1_shift4_q));
    u0_m0_wo1_mtree_mult1_1_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_1_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_1_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_1_sub_5_a) - SIGNED(u0_m0_wo1_mtree_mult1_1_sub_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_1_sub_5_q <= u0_m0_wo1_mtree_mult1_1_sub_5_o(24 downto 0);

    -- u0_m0_wo1_mtree_add1_0(ADD,120)@13 + 1
    u0_m0_wo1_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 25 => u0_m0_wo1_mtree_mult1_1_sub_5_q(24)) & u0_m0_wo1_mtree_mult1_1_sub_5_q));
    u0_m0_wo1_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 26 => u0_m0_wo1_mtree_add0_1_q(25)) & u0_m0_wo1_mtree_add0_1_q));
    u0_m0_wo1_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add1_0_a) + SIGNED(u0_m0_wo1_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add1_0_q <= u0_m0_wo1_mtree_add1_0_o(27 downto 0);

    -- u0_m0_wo1_mtree_add2_0(ADD,123)@14 + 1
    u0_m0_wo1_mtree_add2_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 28 => u0_m0_wo1_mtree_add1_0_q(27)) & u0_m0_wo1_mtree_add1_0_q));
    u0_m0_wo1_mtree_add2_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo1_mtree_add1_1_q(29)) & u0_m0_wo1_mtree_add1_1_q));
    u0_m0_wo1_mtree_add2_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add2_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add2_0_a) + SIGNED(u0_m0_wo1_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add2_0_q <= u0_m0_wo1_mtree_add2_0_o(30 downto 0);

    -- u0_m0_wo1_mtree_add3_0(ADD,124)@15 + 1
    u0_m0_wo1_mtree_add3_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo1_mtree_add2_0_q(30)) & u0_m0_wo1_mtree_add2_0_q));
    u0_m0_wo1_mtree_add3_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 27 => u0_m0_wo1_mtree_add1_2_q(26)) & u0_m0_wo1_mtree_add1_2_q));
    u0_m0_wo1_mtree_add3_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add3_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add3_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add3_0_a) + SIGNED(u0_m0_wo1_mtree_add3_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add3_0_q <= u0_m0_wo1_mtree_add3_0_o(31 downto 0);

    -- u0_m0_wo0_mtree_mult1_6_shift0(BITSHIFT,209)@13
    u0_m0_wo0_mtree_mult1_6_shift0_qint <= u0_m0_wo0_sym_add0_q & "000";
    u0_m0_wo0_mtree_mult1_6_shift0_q <= u0_m0_wo0_mtree_mult1_6_shift0_qint(19 downto 0);

    -- d_u0_m0_wo0_memread_q_12(DELAY,434)@10 + 2
    d_u0_m0_wo0_memread_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_u0_m0_wo0_memread_q_12_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_12(DELAY,435)@10 + 2
    d_u0_m0_wo0_compute_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_u0_m0_wo0_compute_q_12_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr12_q_12(DELAY,453)@11 + 1
    d_u0_m0_wo0_wi0_r0_delayr12_q_12 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr12_q_11_q, xout => d_u0_m0_wo0_wi0_r0_delayr12_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr13(DELAY,32)@12
    u0_m0_wo0_wi0_r0_delayr13 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr12_q_12_q, xout => u0_m0_wo0_wi0_r0_delayr13_q, ena => d_u0_m0_wo0_compute_q_12_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_sym_add0(ADD,43)@12 + 1
    u0_m0_wo0_sym_add0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => d_u0_m0_wo0_wi0_r0_phasedelay0_q_12_q(15)) & d_u0_m0_wo0_wi0_r0_phasedelay0_q_12_q));
    u0_m0_wo0_sym_add0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr13_q(15)) & u0_m0_wo0_wi0_r0_delayr13_q));
    u0_m0_wo0_sym_add0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add0_a) + SIGNED(u0_m0_wo0_sym_add0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add0_q <= u0_m0_wo0_sym_add0_o(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_6_add_1(ADD,210)@13 + 1
    u0_m0_wo0_mtree_mult1_6_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 17 => u0_m0_wo0_sym_add0_q(16)) & u0_m0_wo0_sym_add0_q));
    u0_m0_wo0_mtree_mult1_6_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_mult1_6_shift0_q(19)) & u0_m0_wo0_mtree_mult1_6_shift0_q));
    u0_m0_wo0_mtree_mult1_6_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_6_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_6_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_6_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_6_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_6_add_1_q <= u0_m0_wo0_mtree_mult1_6_add_1_o(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_6_shift2(BITSHIFT,211)@14
    u0_m0_wo0_mtree_mult1_6_shift2_qint <= u0_m0_wo0_mtree_mult1_6_add_1_q & "0000";
    u0_m0_wo0_mtree_mult1_6_shift2_q <= u0_m0_wo0_mtree_mult1_6_shift2_qint(24 downto 0);

    -- u0_m0_wo0_sym_add1(ADD,44)@11 + 1
    u0_m0_wo0_sym_add1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => d_u0_m0_wo0_wi0_r0_delayr1_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr1_q_11_q));
    u0_m0_wo0_sym_add1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => d_u0_m0_wo0_wi0_r0_delayr12_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr12_q_11_q));
    u0_m0_wo0_sym_add1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add1_a) + SIGNED(u0_m0_wo0_sym_add1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add1_q <= u0_m0_wo0_sym_add1_o(16 downto 0);

    -- d_u0_m0_wo0_sym_add1_q_13(DELAY,454)@12 + 1
    d_u0_m0_wo0_sym_add1_q_13 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_sym_add1_q, xout => d_u0_m0_wo0_sym_add1_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_5_shift2(BITSHIFT,214)@13
    u0_m0_wo0_mtree_mult1_5_shift2_qint <= d_u0_m0_wo0_sym_add1_q_13_q & "000000";
    u0_m0_wo0_mtree_mult1_5_shift2_q <= u0_m0_wo0_mtree_mult1_5_shift2_qint(22 downto 0);

    -- u0_m0_wo0_mtree_mult1_5_shift0(BITSHIFT,212)@12
    u0_m0_wo0_mtree_mult1_5_shift0_qint <= u0_m0_wo0_sym_add1_q & "00";
    u0_m0_wo0_mtree_mult1_5_shift0_q <= u0_m0_wo0_mtree_mult1_5_shift0_qint(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_5_sub_1(SUB,213)@12 + 1
    u0_m0_wo0_mtree_mult1_5_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_mult1_5_shift0_q(18)) & u0_m0_wo0_mtree_mult1_5_shift0_q));
    u0_m0_wo0_mtree_mult1_5_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 17 => u0_m0_wo0_sym_add1_q(16)) & u0_m0_wo0_sym_add1_q));
    u0_m0_wo0_mtree_mult1_5_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_5_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_5_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_5_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_5_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_5_sub_1_q <= u0_m0_wo0_mtree_mult1_5_sub_1_o(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_5_sub_3(SUB,215)@13 + 1
    u0_m0_wo0_mtree_mult1_5_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 20 => u0_m0_wo0_mtree_mult1_5_sub_1_q(19)) & u0_m0_wo0_mtree_mult1_5_sub_1_q));
    u0_m0_wo0_mtree_mult1_5_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo0_mtree_mult1_5_shift2_q(22)) & u0_m0_wo0_mtree_mult1_5_shift2_q));
    u0_m0_wo0_mtree_mult1_5_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_5_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_5_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_5_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_5_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_5_sub_3_q <= u0_m0_wo0_mtree_mult1_5_sub_3_o(23 downto 0);

    -- u0_m0_wo0_mtree_mult1_5_shift4(BITSHIFT,216)@14
    u0_m0_wo0_mtree_mult1_5_shift4_qint <= u0_m0_wo0_mtree_mult1_5_sub_3_q & "0";
    u0_m0_wo0_mtree_mult1_5_shift4_q <= u0_m0_wo0_mtree_mult1_5_shift4_qint(24 downto 0);

    -- u0_m0_wo0_mtree_add1_1(ADD,61)@14 + 1
    u0_m0_wo0_mtree_add1_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => u0_m0_wo0_mtree_mult1_5_shift4_q(24)) & u0_m0_wo0_mtree_mult1_5_shift4_q));
    u0_m0_wo0_mtree_add1_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => u0_m0_wo0_mtree_mult1_6_shift2_q(24)) & u0_m0_wo0_mtree_mult1_6_shift2_q));
    u0_m0_wo0_mtree_add1_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_1_a) + SIGNED(u0_m0_wo0_mtree_add1_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_1_q <= u0_m0_wo0_mtree_add1_1_o(26 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_shift2(BITSHIFT,219)@11
    u0_m0_wo0_mtree_mult1_3_shift2_qint <= u0_m0_wo0_sym_add3_q & "0";
    u0_m0_wo0_mtree_mult1_3_shift2_q <= u0_m0_wo0_mtree_mult1_3_shift2_qint(17 downto 0);

    -- u0_m0_wo0_sym_add3(ADD,46)@10 + 1
    u0_m0_wo0_sym_add3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr3_q(15)) & u0_m0_wo0_wi0_r0_delayr3_q));
    u0_m0_wo0_sym_add3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr10_q(15)) & u0_m0_wo0_wi0_r0_delayr10_q));
    u0_m0_wo0_sym_add3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add3_a) + SIGNED(u0_m0_wo0_sym_add3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add3_q <= u0_m0_wo0_sym_add3_o(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_add_3(ADD,220)@11 + 1
    u0_m0_wo0_mtree_mult1_3_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 17 => u0_m0_wo0_sym_add3_q(16)) & u0_m0_wo0_sym_add3_q));
    u0_m0_wo0_mtree_mult1_3_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_mult1_3_shift2_q(17)) & u0_m0_wo0_mtree_mult1_3_shift2_q));
    u0_m0_wo0_mtree_mult1_3_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_3_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_3_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_3_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_3_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_3_add_3_q <= u0_m0_wo0_mtree_mult1_3_add_3_o(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_shift4(BITSHIFT,221)@12
    u0_m0_wo0_mtree_mult1_3_shift4_qint <= u0_m0_wo0_mtree_mult1_3_add_3_q & "0000";
    u0_m0_wo0_mtree_mult1_3_shift4_q <= u0_m0_wo0_mtree_mult1_3_shift4_qint(22 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_shift0(BITSHIFT,217)@11
    u0_m0_wo0_mtree_mult1_3_shift0_qint <= u0_m0_wo0_sym_add3_q & "0";
    u0_m0_wo0_mtree_mult1_3_shift0_q <= u0_m0_wo0_mtree_mult1_3_shift0_qint(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_add_1(ADD,218)@11 + 1
    u0_m0_wo0_mtree_mult1_3_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 17 => u0_m0_wo0_sym_add3_q(16)) & u0_m0_wo0_sym_add3_q));
    u0_m0_wo0_mtree_mult1_3_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_mult1_3_shift0_q(17)) & u0_m0_wo0_mtree_mult1_3_shift0_q));
    u0_m0_wo0_mtree_mult1_3_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_3_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_3_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_3_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_3_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_3_add_1_q <= u0_m0_wo0_mtree_mult1_3_add_1_o(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_add_5(ADD,222)@12 + 1
    u0_m0_wo0_mtree_mult1_3_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 19 => u0_m0_wo0_mtree_mult1_3_add_1_q(18)) & u0_m0_wo0_mtree_mult1_3_add_1_q));
    u0_m0_wo0_mtree_mult1_3_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo0_mtree_mult1_3_shift4_q(22)) & u0_m0_wo0_mtree_mult1_3_shift4_q));
    u0_m0_wo0_mtree_mult1_3_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_3_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_3_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_3_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_3_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_3_add_5_q <= u0_m0_wo0_mtree_mult1_3_add_5_o(23 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_shift6(BITSHIFT,223)@13
    u0_m0_wo0_mtree_mult1_3_shift6_qint <= u0_m0_wo0_mtree_mult1_3_add_5_q & "00";
    u0_m0_wo0_mtree_mult1_3_shift6_q <= u0_m0_wo0_mtree_mult1_3_shift6_qint(25 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_shift2(BITSHIFT,226)@11
    u0_m0_wo0_mtree_mult1_2_shift2_qint <= u0_m0_wo0_sym_add4_q & "000";
    u0_m0_wo0_mtree_mult1_2_shift2_q <= u0_m0_wo0_mtree_mult1_2_shift2_qint(19 downto 0);

    -- u0_m0_wo0_sym_add4(ADD,47)@10 + 1
    u0_m0_wo0_sym_add4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr4_q(15)) & u0_m0_wo0_wi0_r0_delayr4_q));
    u0_m0_wo0_sym_add4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr9_q(15)) & u0_m0_wo0_wi0_r0_delayr9_q));
    u0_m0_wo0_sym_add4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add4_a) + SIGNED(u0_m0_wo0_sym_add4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add4_q <= u0_m0_wo0_sym_add4_o(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_sub_3(SUB,227)@11 + 1
    u0_m0_wo0_mtree_mult1_2_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 17 => u0_m0_wo0_sym_add4_q(16)) & u0_m0_wo0_sym_add4_q));
    u0_m0_wo0_mtree_mult1_2_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_mult1_2_shift2_q(19)) & u0_m0_wo0_mtree_mult1_2_shift2_q));
    u0_m0_wo0_mtree_mult1_2_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_2_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_2_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_2_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_2_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_2_sub_3_q <= u0_m0_wo0_mtree_mult1_2_sub_3_o(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_shift4(BITSHIFT,228)@12
    u0_m0_wo0_mtree_mult1_2_shift4_qint <= u0_m0_wo0_mtree_mult1_2_sub_3_q & "00000";
    u0_m0_wo0_mtree_mult1_2_shift4_q <= u0_m0_wo0_mtree_mult1_2_shift4_qint(25 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_shift0(BITSHIFT,224)@11
    u0_m0_wo0_mtree_mult1_2_shift0_qint <= u0_m0_wo0_sym_add4_q & "000";
    u0_m0_wo0_mtree_mult1_2_shift0_q <= u0_m0_wo0_mtree_mult1_2_shift0_qint(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_sub_1(SUB,225)@11 + 1
    u0_m0_wo0_mtree_mult1_2_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_mult1_2_shift0_q(19)) & u0_m0_wo0_mtree_mult1_2_shift0_q));
    u0_m0_wo0_mtree_mult1_2_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 17 => u0_m0_wo0_sym_add4_q(16)) & u0_m0_wo0_sym_add4_q));
    u0_m0_wo0_mtree_mult1_2_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_2_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_2_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_2_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_2_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_2_sub_1_q <= u0_m0_wo0_mtree_mult1_2_sub_1_o(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_add_5(ADD,229)@12 + 1
    u0_m0_wo0_mtree_mult1_2_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 21 => u0_m0_wo0_mtree_mult1_2_sub_1_q(20)) & u0_m0_wo0_mtree_mult1_2_sub_1_q));
    u0_m0_wo0_mtree_mult1_2_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_mult1_2_shift4_q(25)) & u0_m0_wo0_mtree_mult1_2_shift4_q));
    u0_m0_wo0_mtree_mult1_2_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_2_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_2_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_2_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_2_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_2_add_5_q <= u0_m0_wo0_mtree_mult1_2_add_5_o(26 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_shift6(BITSHIFT,230)@13
    u0_m0_wo0_mtree_mult1_2_shift6_qint <= u0_m0_wo0_mtree_mult1_2_add_5_q & "0";
    u0_m0_wo0_mtree_mult1_2_shift6_q <= u0_m0_wo0_mtree_mult1_2_shift6_qint(27 downto 0);

    -- u0_m0_wo0_mtree_add0_1(ADD,58)@13 + 1
    u0_m0_wo0_mtree_add0_1_a <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_2_shift6_q);
    u0_m0_wo0_mtree_add0_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 26 => u0_m0_wo0_mtree_mult1_3_shift6_q(25)) & u0_m0_wo0_mtree_mult1_3_shift6_q));
    u0_m0_wo0_mtree_add0_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_1_a) + SIGNED(u0_m0_wo0_mtree_add0_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_1_q <= u0_m0_wo0_mtree_add0_1_o(27 downto 0);

    -- u0_m0_wo0_sym_add5(ADD,48)@10 + 1
    u0_m0_wo0_sym_add5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr5_q(15)) & u0_m0_wo0_wi0_r0_delayr5_q));
    u0_m0_wo0_sym_add5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_delayr8_q(15)) & u0_m0_wo0_wi0_r0_delayr8_q));
    u0_m0_wo0_sym_add5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add5_a) + SIGNED(u0_m0_wo0_sym_add5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add5_q <= u0_m0_wo0_sym_add5_o(16 downto 0);

    -- u0_m0_wo0_cm5(CONSTANT,41)@0
    u0_m0_wo0_cm5_q <= "01001100110";

    -- u0_m0_wo0_mtree_mult1_1(MULT,55)@11 + 2
    u0_m0_wo0_mtree_mult1_1_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm5_q);
    u0_m0_wo0_mtree_mult1_1_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add5_q);
    u0_m0_wo0_mtree_mult1_1_reset <= areset;
    u0_m0_wo0_mtree_mult1_1_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 11,
        lpm_widthb => 17,
        lpm_widthp => 28,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_1_a0,
        datab => u0_m0_wo0_mtree_mult1_1_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_1_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_1_s1
    );
    u0_m0_wo0_mtree_mult1_1_q <= u0_m0_wo0_mtree_mult1_1_s1;

    -- d_u0_m0_wo0_wi0_r0_delayr6_q_12(DELAY,447)@11 + 1
    d_u0_m0_wo0_wi0_r0_delayr6_q_12 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr6_q_11_q, xout => d_u0_m0_wo0_wi0_r0_delayr6_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_0_shift0(BITSHIFT,240)@12
    u0_m0_wo0_mtree_mult1_0_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr6_q_12_q & "00000000000";
    u0_m0_wo0_mtree_mult1_0_shift0_q <= u0_m0_wo0_mtree_mult1_0_shift0_qint(26 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_sub_1(SUB,241)@12 + 1
    u0_m0_wo0_mtree_mult1_0_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_mult1_0_shift0_q(26)) & u0_m0_wo0_mtree_mult1_0_shift0_q));
    u0_m0_wo0_mtree_mult1_0_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 16 => d_u0_m0_wo0_wi0_r0_delayr6_q_12_q(15)) & d_u0_m0_wo0_wi0_r0_delayr6_q_12_q));
    u0_m0_wo0_mtree_mult1_0_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_0_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_0_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_0_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_sub_1_q <= u0_m0_wo0_mtree_mult1_0_sub_1_o(27 downto 0);

    -- u0_m0_wo0_mtree_add0_0(ADD,57)@13 + 1
    u0_m0_wo0_mtree_add0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_mult1_0_sub_1_q(27)) & u0_m0_wo0_mtree_mult1_0_sub_1_q));
    u0_m0_wo0_mtree_add0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_mult1_1_q(27)) & u0_m0_wo0_mtree_mult1_1_q));
    u0_m0_wo0_mtree_add0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_0_a) + SIGNED(u0_m0_wo0_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_q <= u0_m0_wo0_mtree_add0_0_o(28 downto 0);

    -- u0_m0_wo0_mtree_add1_0(ADD,60)@14 + 1
    u0_m0_wo0_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => u0_m0_wo0_mtree_add0_0_q(28)) & u0_m0_wo0_mtree_add0_0_q));
    u0_m0_wo0_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 28 => u0_m0_wo0_mtree_add0_1_q(27)) & u0_m0_wo0_mtree_add0_1_q));
    u0_m0_wo0_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_0_a) + SIGNED(u0_m0_wo0_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_0_q <= u0_m0_wo0_mtree_add1_0_o(30 downto 0);

    -- u0_m0_wo0_mtree_add2_0(ADD,62)@15 + 1
    u0_m0_wo0_mtree_add2_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo0_mtree_add1_0_q(30)) & u0_m0_wo0_mtree_add1_0_q));
    u0_m0_wo0_mtree_add2_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 27 => u0_m0_wo0_mtree_add1_1_q(26)) & u0_m0_wo0_mtree_add1_1_q));
    u0_m0_wo0_mtree_add2_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_0_a) + SIGNED(u0_m0_wo0_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_0_q <= u0_m0_wo0_mtree_add2_0_o(31 downto 0);

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- d_u0_m0_wo0_compute_q_15(DELAY,436)@12 + 3
    d_u0_m0_wo0_compute_q_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_12_q, xout => d_u0_m0_wo0_compute_q_15_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_oseq_gated_reg(REG,63)@15 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(d_u0_m0_wo0_compute_q_15_q);
        END IF;
    END PROCESS;

    -- xOut(PORTOUT,200)@16 + 1
    xOut_v <= u0_m0_wo0_oseq_gated_reg_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_mtree_add2_0_q;
    xOut_1 <= u0_m0_wo1_mtree_add3_0_q;
    xOut_2 <= u0_m0_wo2_mtree_add3_0_q;

END normal;
