-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 22.1std (Release Build #922)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2023 Intel Corporation.  All rights reserved.
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

-- VHDL created from BP_Filt_rtl_core
-- VHDL created on Mon Nov 27 15:24:50 2023


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

entity BP_Filt_rtl_core is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(11 downto 0);  -- sfix12
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(30 downto 0);  -- sfix31
        xOut_1 : out std_logic_vector(30 downto 0);  -- sfix31
        xOut_2 : out std_logic_vector(30 downto 0);  -- sfix31
        clk : in std_logic;
        areset : in std_logic
    );
end BP_Filt_rtl_core;

architecture normal of BP_Filt_rtl_core is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_wi0_r0_phasedelay0_q_12_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_phasedelay0_q_13_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr1_q_12_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr1_q_13_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr2_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr2_q_12_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr2_q_13_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr3_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr3_q_12_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr3_q_13_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr4_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr4_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr6_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr6_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr7_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr8_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr9_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr10_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr10_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr13_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr13_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr14_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr15_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr15_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr16_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr17_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr17_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr18_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr18_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr18_q_12_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr19_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr19_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr19_q_12_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_cm1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_cm4_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_cm7_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_cm9_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_cm11_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_cm12_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_cm14_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_cm17_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_a0 : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_b0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_s1 : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_18_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_a0 : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_b0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_s1 : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_15_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_a0 : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_b0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_s1 : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_12_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_a0 : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_b0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_s1 : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_10_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_a0 : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_b0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_s1 : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_8_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_b0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_7_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_a0 : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_b0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_s1 : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_5_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_a0 : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_b0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_s1 : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_add0_0_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_add0_0_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_add0_0_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_add0_0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_add0_1_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_1_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_1_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_2_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_2_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_2_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_3_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_3_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_3_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_3_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_4_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add0_4_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add0_4_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add0_4_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add0_5_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_5_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_5_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_5_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_6_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_add0_6_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_add0_6_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_add0_6_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_add0_7_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_7_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_7_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_7_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_8_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_add0_8_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_add0_8_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_add0_8_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_add0_9_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_9_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_9_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add0_9_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_add1_0_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_add1_0_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_add1_0_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_add1_0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_add1_1_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_1_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_1_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_2_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add1_2_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add1_2_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add1_2_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add1_3_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add1_3_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add1_3_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add1_3_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add1_4_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_add1_4_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_add1_4_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_add1_4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_add2_0_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add2_0_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add2_0_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add2_0_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add2_1_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add2_1_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add2_1_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add2_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add3_0_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add3_0_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add3_0_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add3_0_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add4_0_a : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add4_0_b : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add4_0_o : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add4_0_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo1_cm1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo1_cm6_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo1_cm9_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo1_sym_add0_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add0_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add0_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add0_q : STD_LOGIC_VECTOR (12 downto 0);
    signal d_u0_m0_wo1_sym_add0_q_14_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add1_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add1_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add1_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add2_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add2_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add2_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add2_q : STD_LOGIC_VECTOR (12 downto 0);
    signal d_u0_m0_wo1_sym_add2_q_12_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add3_q : STD_LOGIC_VECTOR (12 downto 0);
    signal d_u0_m0_wo1_sym_add3_q_12_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add4_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add4_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add4_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add4_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add5_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add5_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add5_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add5_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add6_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add6_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add6_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add6_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add7_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add7_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add7_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add7_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add8_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add8_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add8_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add8_q : STD_LOGIC_VECTOR (12 downto 0);
    signal d_u0_m0_wo1_sym_add8_q_12_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add9_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add9_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add9_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_sym_add9_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_mtree_mult1_8_a0 : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo1_mtree_mult1_8_b0 : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_mtree_mult1_8_s1 : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_8_reset : std_logic;
    signal u0_m0_wo1_mtree_mult1_8_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_a0 : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_b0 : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_3_reset : std_logic;
    signal u0_m0_wo1_mtree_mult1_3_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_b0 : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_s1 : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_reset : std_logic;
    signal u0_m0_wo1_mtree_mult1_0_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo1_mtree_add0_0_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add0_0_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add0_0_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add0_0_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo1_mtree_add0_1_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_add0_1_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_add0_1_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_add0_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_add0_2_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_add0_2_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_add0_2_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_add0_2_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo1_mtree_add0_3_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_add0_3_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_add0_3_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_add0_3_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_add0_4_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_add0_4_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_add0_4_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_add0_4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_add1_0_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_add1_0_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_add1_0_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_add1_0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo1_mtree_add1_1_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_add1_1_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_add1_1_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_add1_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo1_mtree_add2_0_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_add2_0_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_add2_0_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_add2_0_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_add3_0_a : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo1_mtree_add3_0_b : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo1_mtree_add3_0_o : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo1_mtree_add3_0_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo2_mtree_mult1_17_a0 : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo2_mtree_mult1_17_b0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo2_mtree_mult1_17_s1 : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_17_reset : std_logic;
    signal u0_m0_wo2_mtree_mult1_17_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_14_a0 : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo2_mtree_mult1_14_b0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo2_mtree_mult1_14_s1 : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_14_reset : std_logic;
    signal u0_m0_wo2_mtree_mult1_14_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_12_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo2_mtree_mult1_12_b0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo2_mtree_mult1_12_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_12_reset : std_logic;
    signal u0_m0_wo2_mtree_mult1_12_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_11_a0 : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo2_mtree_mult1_11_b0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo2_mtree_mult1_11_s1 : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_11_reset : std_logic;
    signal u0_m0_wo2_mtree_mult1_11_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_9_a0 : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo2_mtree_mult1_9_b0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo2_mtree_mult1_9_s1 : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_9_reset : std_logic;
    signal u0_m0_wo2_mtree_mult1_9_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_7_a0 : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo2_mtree_mult1_7_b0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo2_mtree_mult1_7_s1 : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_7_reset : std_logic;
    signal u0_m0_wo2_mtree_mult1_7_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_a0 : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_b0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_s1 : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_4_reset : std_logic;
    signal u0_m0_wo2_mtree_mult1_4_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_a0 : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_b0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_s1 : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_1_reset : std_logic;
    signal u0_m0_wo2_mtree_mult1_1_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_add0_0_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_add0_0_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_add0_0_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_add0_0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_add0_1_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_add0_1_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_add0_1_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_add0_1_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_add0_2_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_add0_2_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_add0_2_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_add0_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_add0_3_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_add0_3_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_add0_3_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_add0_3_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_add0_4_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_add0_4_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_add0_4_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_add0_4_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_add0_5_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_add0_5_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_add0_5_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_add0_5_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo2_mtree_add0_6_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_add0_6_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_add0_6_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_add0_6_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_add0_7_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_add0_7_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_add0_7_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_add0_7_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_add0_8_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_add0_8_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_add0_8_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_add0_8_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_add0_9_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_add0_9_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_add0_9_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_add0_9_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_add1_0_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_add1_0_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_add1_0_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_add1_0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_add1_1_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_add1_1_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_add1_1_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_add1_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_add1_2_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add1_2_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add1_2_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add1_2_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo2_mtree_add1_3_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_add1_3_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_add1_3_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_add1_3_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_add1_4_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_add1_4_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_add1_4_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_add1_4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_add2_0_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_add2_0_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_add2_0_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_add2_0_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_add2_1_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add2_1_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add2_1_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add2_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo2_mtree_add3_0_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo2_mtree_add3_0_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo2_mtree_add3_0_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo2_mtree_add3_0_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo2_mtree_add4_0_a : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo2_mtree_add4_0_b : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo2_mtree_add4_0_o : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo2_mtree_add4_0_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_add_1_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_add_1_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_add_1_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_add_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_sub_3_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_sub_3_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_sub_3_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_sub_3_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_add_1_a : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_add_1_b : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_add_1_o : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_add_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_sub_1_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_sub_1_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_sub_1_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_sub_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_sub_3_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_sub_3_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_sub_3_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_sub_3_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_sub_1_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_sub_1_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_sub_1_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_sub_1_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_sub_3_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_sub_3_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_sub_3_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_sub_3_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_add_5_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_add_5_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_add_5_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_add_5_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_add_1_a : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_add_1_b : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_add_1_o : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_add_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_add_3_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_add_3_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_add_3_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_add_3_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_1_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_1_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_1_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_3_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_3_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_3_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_3_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_add_5_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_add_5_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_add_5_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_add_5_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_sub_1_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_sub_1_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_sub_1_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_sub_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_1_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_1_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_1_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_1_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_sub_3_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_sub_3_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_sub_3_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_sub_3_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_5_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_5_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_5_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_5_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_1_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_1_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_1_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_1_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_3_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_3_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_3_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_3_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_1_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_1_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_3_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_3_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_3_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_3_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_1_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_1_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_3_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_3_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_3_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_3_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_sub_1_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_sub_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_sub_1_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_sub_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_add_1_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_add_1_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_add_1_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_add_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_add_3_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_add_3_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_add_3_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_add_3_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_sub_1_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_sub_1_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_sub_1_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_sub_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_sub_3_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_sub_3_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_sub_3_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_sub_3_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_add_1_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_add_1_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_add_1_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_add_1_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_add_3_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_add_3_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_add_3_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_add_3_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_add_1_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_add_1_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_add_1_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_add_1_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_add_3_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_add_3_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_add_3_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_add_3_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_add_5_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_add_5_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_add_5_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_add_5_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_add_1_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_add_1_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_add_1_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_add_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_add_3_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_add_3_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_add_3_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_add_3_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_sub_5_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_sub_5_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_sub_5_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_sub_5_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_sub_1_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_sub_1_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_sub_1_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_sub_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_add_3_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_add_3_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_add_3_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_add_3_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_sub_5_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_sub_5_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_sub_5_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_sub_5_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_sub_1_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_sub_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_sub_1_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_sub_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_sub_3_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_sub_3_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_sub_3_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_sub_3_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_sub_1_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_sub_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_sub_1_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_sub_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_sub_1_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_sub_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_sub_1_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_sub_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_add_3_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_add_3_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_add_3_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_add_3_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_sub_1_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_sub_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_sub_1_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_sub_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_add_3_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_add_3_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_add_3_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_add_3_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_sub_1_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_sub_1_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_sub_1_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_sub_1_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_sub_3_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_sub_3_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_sub_3_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_sub_3_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_add_1_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_add_1_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_add_1_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_add_1_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_sub_3_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_sub_3_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_sub_3_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_sub_3_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_add_5_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_add_5_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_add_5_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_add_5_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_sub_1_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_sub_1_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_sub_1_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_sub_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_sub_1_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_sub_1_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_sub_1_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_sub_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_sub_3_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_sub_3_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_sub_3_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_sub_3_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_add_5_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_add_5_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_add_5_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_add_5_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_add_1_a : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_add_1_b : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_add_1_o : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_add_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_add_3_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_add_3_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_add_3_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_add_3_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_sub_1_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_sub_1_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_sub_1_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_sub_1_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_sub_3_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_sub_3_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_sub_3_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_sub_3_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_add_5_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_add_5_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_add_5_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_add_5_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_3_sub_1_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_3_sub_1_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_3_sub_1_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_3_sub_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_3_sub_3_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_3_sub_3_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_3_sub_3_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_3_sub_3_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_add_1_a : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_add_1_b : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_add_1_o : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_add_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_add_1_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_add_1_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_add_1_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_add_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_sub_3_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_sub_3_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_sub_3_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_sub_3_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_shift0_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_shift0_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_shift2_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_shift2_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_shift2_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_18_shift2_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_shift0_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_shift0_qint : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_shift0_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_shift0_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_shift2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_shift2_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_shift2_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_16_shift2_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_shift0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_shift0_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_shift2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_shift2_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_shift0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_shift0_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_shift2_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_shift2_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_shift0_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_shift0_qint : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_shift0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_shift0_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_shift2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_shift2_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_shift2_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_shift2_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift0_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift2_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift2_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_shift0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_shift0_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_shift2_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_shift2_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift0_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift2_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_shift0_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_shift0_qint : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_shift2_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_6_shift2_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_shift0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_shift0_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_shift2_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_shift2_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift0_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift2_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_3_shift0_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo2_mtree_mult1_3_shift0_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift2_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift2_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_3_shift2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_3_shift2_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_shift0_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_shift0_qint : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift2_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift2_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_shift0_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_shift0_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_shift2_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_shift2_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_shift0_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_shift0_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_shift2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_shift2_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_shift0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_shift0_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_shift2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_shift2_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_shift0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_shift0_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_shift2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_6_shift2_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_shift0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_shift0_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_shift2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_shift2_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_shift0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_shift0_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_shift2_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_shift2_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_shift0_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_shift0_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_shift2_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_shift2_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_shift2_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_shift2_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_shift4_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_shift4_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_shift2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_shift2_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_shift4_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_shift4_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_shift4_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_shift4_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift4_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift4_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift6_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift6_qint : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_shift2_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_shift2_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift4_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift4_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift6_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift6_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift4_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift4_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_shift2_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_shift2_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_shift4_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_9_shift4_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_shift4_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_7_shift4_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_shift4_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_shift4_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_shift6_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_5_shift6_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_shift4_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_shift4_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_shift6_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_4_shift6_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_shift4_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_shift4_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_shift6_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_shift6_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_shift4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_shift4_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_shift2_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_19_shift2_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_shift4_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_15_shift4_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_shift4_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_shift4_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_shift6_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_13_shift6_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_shift2_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_10_shift2_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_shift4_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_shift4_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_shift6_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_8_shift6_qint : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_shift4_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_5_shift4_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo2_mtree_mult1_3_shift4_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_3_shift4_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_shift2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_2_shift2_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_shift4_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo2_mtree_mult1_0_shift4_qint : STD_LOGIC_VECTOR (18 downto 0);

begin


    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- d_u0_m0_wo0_wi0_r0_phasedelay0_q_12(DELAY,925)@10 + 2
    d_u0_m0_wo0_wi0_r0_phasedelay0_q_12 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => d_u0_m0_wo0_wi0_r0_phasedelay0_q_12_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_phasedelay0_q_13(DELAY,926)@12 + 1
    d_u0_m0_wo0_wi0_r0_phasedelay0_q_13 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_phasedelay0_q_12_q, xout => d_u0_m0_wo0_wi0_r0_phasedelay0_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_19_shift0(BITSHIFT,474)@13
    u0_m0_wo2_mtree_mult1_19_shift0_qint <= d_u0_m0_wo0_wi0_r0_phasedelay0_q_13_q & "00000";
    u0_m0_wo2_mtree_mult1_19_shift0_q <= u0_m0_wo2_mtree_mult1_19_shift0_qint(16 downto 0);

    -- u0_m0_wo2_mtree_mult1_19_sub_1(SUB,475)@13 + 1
    u0_m0_wo2_mtree_mult1_19_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo2_mtree_mult1_19_shift0_q(16)) & u0_m0_wo2_mtree_mult1_19_shift0_q));
    u0_m0_wo2_mtree_mult1_19_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 12 => d_u0_m0_wo0_wi0_r0_phasedelay0_q_13_q(11)) & d_u0_m0_wo0_wi0_r0_phasedelay0_q_13_q));
    u0_m0_wo2_mtree_mult1_19_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_19_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_19_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_19_sub_1_a) - SIGNED(u0_m0_wo2_mtree_mult1_19_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_19_sub_1_q <= u0_m0_wo2_mtree_mult1_19_sub_1_o(17 downto 0);

    -- u0_m0_wo2_mtree_mult1_19_shift2(BITSHIFT,476)@14
    u0_m0_wo2_mtree_mult1_19_shift2_qint <= u0_m0_wo2_mtree_mult1_19_sub_1_q & "000";
    u0_m0_wo2_mtree_mult1_19_shift2_q <= u0_m0_wo2_mtree_mult1_19_shift2_qint(20 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr1(DELAY,20)@10
    u0_m0_wo0_wi0_r0_delayr1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => u0_m0_wo0_wi0_r0_delayr1_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr1_q_12(DELAY,927)@10 + 2
    d_u0_m0_wo0_wi0_r0_delayr1_q_12 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr1_q, xout => d_u0_m0_wo0_wi0_r0_delayr1_q_12_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr1_q_13(DELAY,928)@12 + 1
    d_u0_m0_wo0_wi0_r0_delayr1_q_13 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr1_q_12_q, xout => d_u0_m0_wo0_wi0_r0_delayr1_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_18_shift2(BITSHIFT,479)@13
    u0_m0_wo2_mtree_mult1_18_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr1_q_13_q & "00000000";
    u0_m0_wo2_mtree_mult1_18_shift2_q <= u0_m0_wo2_mtree_mult1_18_shift2_qint(19 downto 0);

    -- u0_m0_wo2_mtree_mult1_18_shift0(BITSHIFT,477)@12
    u0_m0_wo2_mtree_mult1_18_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr1_q_12_q & "00000";
    u0_m0_wo2_mtree_mult1_18_shift0_q <= u0_m0_wo2_mtree_mult1_18_shift0_qint(16 downto 0);

    -- u0_m0_wo2_mtree_mult1_18_sub_1(SUB,478)@12 + 1
    u0_m0_wo2_mtree_mult1_18_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 12 => d_u0_m0_wo0_wi0_r0_delayr1_q_12_q(11)) & d_u0_m0_wo0_wi0_r0_delayr1_q_12_q));
    u0_m0_wo2_mtree_mult1_18_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo2_mtree_mult1_18_shift0_q(16)) & u0_m0_wo2_mtree_mult1_18_shift0_q));
    u0_m0_wo2_mtree_mult1_18_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_18_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_18_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_18_sub_1_a) - SIGNED(u0_m0_wo2_mtree_mult1_18_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_18_sub_1_q <= u0_m0_wo2_mtree_mult1_18_sub_1_o(17 downto 0);

    -- u0_m0_wo2_mtree_mult1_18_add_3(ADD,480)@13 + 1
    u0_m0_wo2_mtree_mult1_18_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 18 => u0_m0_wo2_mtree_mult1_18_sub_1_q(17)) & u0_m0_wo2_mtree_mult1_18_sub_1_q));
    u0_m0_wo2_mtree_mult1_18_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo2_mtree_mult1_18_shift2_q(19)) & u0_m0_wo2_mtree_mult1_18_shift2_q));
    u0_m0_wo2_mtree_mult1_18_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_18_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_18_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_18_add_3_a) + SIGNED(u0_m0_wo2_mtree_mult1_18_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_18_add_3_q <= u0_m0_wo2_mtree_mult1_18_add_3_o(20 downto 0);

    -- u0_m0_wo2_mtree_add0_9(ADD,259)@14 + 1
    u0_m0_wo2_mtree_add0_9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo2_mtree_mult1_18_add_3_q(20)) & u0_m0_wo2_mtree_mult1_18_add_3_q));
    u0_m0_wo2_mtree_add0_9_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo2_mtree_mult1_19_shift2_q(20)) & u0_m0_wo2_mtree_mult1_19_shift2_q));
    u0_m0_wo2_mtree_add0_9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_9_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_9_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_9_a) + SIGNED(u0_m0_wo2_mtree_add0_9_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_9_q <= u0_m0_wo2_mtree_add0_9_o(21 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr2(DELAY,21)@10
    u0_m0_wo0_wi0_r0_delayr2 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr1_q, xout => u0_m0_wo0_wi0_r0_delayr2_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr2_q_12(DELAY,929)@10 + 2
    d_u0_m0_wo0_wi0_r0_delayr2_q_12 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr2_q, xout => d_u0_m0_wo0_wi0_r0_delayr2_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_cm17(CONSTANT,59)@0
    u0_m0_wo0_cm17_q <= "1011001101";

    -- u0_m0_wo2_mtree_mult1_17(MULT,232)@12 + 2
    u0_m0_wo2_mtree_mult1_17_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm17_q);
    u0_m0_wo2_mtree_mult1_17_b0 <= STD_LOGIC_VECTOR(d_u0_m0_wo0_wi0_r0_delayr2_q_12_q);
    u0_m0_wo2_mtree_mult1_17_reset <= areset;
    u0_m0_wo2_mtree_mult1_17_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 10,
        lpm_widthb => 12,
        lpm_widthp => 22,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo2_mtree_mult1_17_a0,
        datab => u0_m0_wo2_mtree_mult1_17_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo2_mtree_mult1_17_reset,
        clock => clk,
        result => u0_m0_wo2_mtree_mult1_17_s1
    );
    u0_m0_wo2_mtree_mult1_17_q <= u0_m0_wo2_mtree_mult1_17_s1;

    -- u0_m0_wo0_wi0_r0_delayr3(DELAY,22)@10
    u0_m0_wo0_wi0_r0_delayr3 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr2_q, xout => u0_m0_wo0_wi0_r0_delayr3_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr3_q_12(DELAY,931)@10 + 2
    d_u0_m0_wo0_wi0_r0_delayr3_q_12 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr3_q, xout => d_u0_m0_wo0_wi0_r0_delayr3_q_12_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr3_q_13(DELAY,932)@12 + 1
    d_u0_m0_wo0_wi0_r0_delayr3_q_13 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr3_q_12_q, xout => d_u0_m0_wo0_wi0_r0_delayr3_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_16_shift2(BITSHIFT,491)@13
    u0_m0_wo2_mtree_mult1_16_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr3_q_13_q & "00000000";
    u0_m0_wo2_mtree_mult1_16_shift2_q <= u0_m0_wo2_mtree_mult1_16_shift2_qint(19 downto 0);

    -- u0_m0_wo2_mtree_mult1_16_shift0(BITSHIFT,489)@12
    u0_m0_wo2_mtree_mult1_16_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr3_q_12_q & "00000";
    u0_m0_wo2_mtree_mult1_16_shift0_q <= u0_m0_wo2_mtree_mult1_16_shift0_qint(16 downto 0);

    -- u0_m0_wo2_mtree_mult1_16_sub_1(SUB,490)@12 + 1
    u0_m0_wo2_mtree_mult1_16_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo2_mtree_mult1_16_shift0_q(16)) & u0_m0_wo2_mtree_mult1_16_shift0_q));
    u0_m0_wo2_mtree_mult1_16_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 12 => d_u0_m0_wo0_wi0_r0_delayr3_q_12_q(11)) & d_u0_m0_wo0_wi0_r0_delayr3_q_12_q));
    u0_m0_wo2_mtree_mult1_16_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_16_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_16_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_16_sub_1_a) - SIGNED(u0_m0_wo2_mtree_mult1_16_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_16_sub_1_q <= u0_m0_wo2_mtree_mult1_16_sub_1_o(17 downto 0);

    -- u0_m0_wo2_mtree_mult1_16_add_3(ADD,492)@13 + 1
    u0_m0_wo2_mtree_mult1_16_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 18 => u0_m0_wo2_mtree_mult1_16_sub_1_q(17)) & u0_m0_wo2_mtree_mult1_16_sub_1_q));
    u0_m0_wo2_mtree_mult1_16_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo2_mtree_mult1_16_shift2_q(19)) & u0_m0_wo2_mtree_mult1_16_shift2_q));
    u0_m0_wo2_mtree_mult1_16_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_16_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_16_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_16_add_3_a) + SIGNED(u0_m0_wo2_mtree_mult1_16_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_16_add_3_q <= u0_m0_wo2_mtree_mult1_16_add_3_o(20 downto 0);

    -- u0_m0_wo2_mtree_add0_8(ADD,258)@14 + 1
    u0_m0_wo2_mtree_add0_8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 21 => u0_m0_wo2_mtree_mult1_16_add_3_q(20)) & u0_m0_wo2_mtree_mult1_16_add_3_q));
    u0_m0_wo2_mtree_add0_8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo2_mtree_mult1_17_q(21)) & u0_m0_wo2_mtree_mult1_17_q));
    u0_m0_wo2_mtree_add0_8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_8_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_8_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_8_a) + SIGNED(u0_m0_wo2_mtree_add0_8_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_8_q <= u0_m0_wo2_mtree_add0_8_o(22 downto 0);

    -- u0_m0_wo2_mtree_add1_4(ADD,264)@15 + 1
    u0_m0_wo2_mtree_add1_4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo2_mtree_add0_8_q(22)) & u0_m0_wo2_mtree_add0_8_q));
    u0_m0_wo2_mtree_add1_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 22 => u0_m0_wo2_mtree_add0_9_q(21)) & u0_m0_wo2_mtree_add0_9_q));
    u0_m0_wo2_mtree_add1_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add1_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add1_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add1_4_a) + SIGNED(u0_m0_wo2_mtree_add1_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add1_4_q <= u0_m0_wo2_mtree_add1_4_o(23 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr4(DELAY,23)@10
    u0_m0_wo0_wi0_r0_delayr4 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr3_q, xout => u0_m0_wo0_wi0_r0_delayr4_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr4_q_11(DELAY,933)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr4_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr4_q, xout => d_u0_m0_wo0_wi0_r0_delayr4_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_15_shift2(BITSHIFT,495)@11
    u0_m0_wo2_mtree_mult1_15_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr4_q_11_q & "0000";
    u0_m0_wo2_mtree_mult1_15_shift2_q <= u0_m0_wo2_mtree_mult1_15_shift2_qint(15 downto 0);

    -- u0_m0_wo2_mtree_mult1_15_shift0(BITSHIFT,493)@10
    u0_m0_wo2_mtree_mult1_15_shift0_qint <= u0_m0_wo0_wi0_r0_delayr4_q & "00";
    u0_m0_wo2_mtree_mult1_15_shift0_q <= u0_m0_wo2_mtree_mult1_15_shift0_qint(13 downto 0);

    -- u0_m0_wo2_mtree_mult1_15_sub_1(SUB,494)@10 + 1
    u0_m0_wo2_mtree_mult1_15_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo2_mtree_mult1_15_shift0_q(13)) & u0_m0_wo2_mtree_mult1_15_shift0_q));
    u0_m0_wo2_mtree_mult1_15_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => u0_m0_wo0_wi0_r0_delayr4_q(11)) & u0_m0_wo0_wi0_r0_delayr4_q));
    u0_m0_wo2_mtree_mult1_15_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_15_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_15_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_15_sub_1_a) - SIGNED(u0_m0_wo2_mtree_mult1_15_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_15_sub_1_q <= u0_m0_wo2_mtree_mult1_15_sub_1_o(14 downto 0);

    -- u0_m0_wo2_mtree_mult1_15_sub_3(SUB,496)@11 + 1
    u0_m0_wo2_mtree_mult1_15_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => u0_m0_wo2_mtree_mult1_15_sub_1_q(14)) & u0_m0_wo2_mtree_mult1_15_sub_1_q));
    u0_m0_wo2_mtree_mult1_15_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo2_mtree_mult1_15_shift2_q(15)) & u0_m0_wo2_mtree_mult1_15_shift2_q));
    u0_m0_wo2_mtree_mult1_15_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_15_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_15_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_15_sub_3_a) - SIGNED(u0_m0_wo2_mtree_mult1_15_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_15_sub_3_q <= u0_m0_wo2_mtree_mult1_15_sub_3_o(16 downto 0);

    -- u0_m0_wo2_mtree_mult1_15_shift4(BITSHIFT,497)@12
    u0_m0_wo2_mtree_mult1_15_shift4_qint <= u0_m0_wo2_mtree_mult1_15_sub_3_q & "00";
    u0_m0_wo2_mtree_mult1_15_shift4_q <= u0_m0_wo2_mtree_mult1_15_shift4_qint(18 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr5(DELAY,24)@10
    u0_m0_wo0_wi0_r0_delayr5 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr4_q, xout => u0_m0_wo0_wi0_r0_delayr5_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm14(CONSTANT,56)@0
    u0_m0_wo0_cm14_q <= "1001100011";

    -- u0_m0_wo2_mtree_mult1_14(MULT,235)@10 + 2
    u0_m0_wo2_mtree_mult1_14_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm14_q);
    u0_m0_wo2_mtree_mult1_14_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr5_q);
    u0_m0_wo2_mtree_mult1_14_reset <= areset;
    u0_m0_wo2_mtree_mult1_14_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 10,
        lpm_widthb => 12,
        lpm_widthp => 22,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo2_mtree_mult1_14_a0,
        datab => u0_m0_wo2_mtree_mult1_14_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo2_mtree_mult1_14_reset,
        clock => clk,
        result => u0_m0_wo2_mtree_mult1_14_s1
    );
    u0_m0_wo2_mtree_mult1_14_q <= u0_m0_wo2_mtree_mult1_14_s1;

    -- u0_m0_wo2_mtree_add0_7(ADD,257)@12 + 1
    u0_m0_wo2_mtree_add0_7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo2_mtree_mult1_14_q(21)) & u0_m0_wo2_mtree_mult1_14_q));
    u0_m0_wo2_mtree_add0_7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 19 => u0_m0_wo2_mtree_mult1_15_shift4_q(18)) & u0_m0_wo2_mtree_mult1_15_shift4_q));
    u0_m0_wo2_mtree_add0_7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_7_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_7_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_7_a) + SIGNED(u0_m0_wo2_mtree_add0_7_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_7_q <= u0_m0_wo2_mtree_add0_7_o(22 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr6(DELAY,25)@10
    u0_m0_wo0_wi0_r0_delayr6 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr5_q, xout => u0_m0_wo0_wi0_r0_delayr6_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_13_shift2(BITSHIFT,508)@10
    u0_m0_wo2_mtree_mult1_13_shift2_qint <= u0_m0_wo0_wi0_r0_delayr6_q & "0000";
    u0_m0_wo2_mtree_mult1_13_shift2_q <= u0_m0_wo2_mtree_mult1_13_shift2_qint(15 downto 0);

    -- u0_m0_wo2_mtree_mult1_13_sub_3(SUB,509)@10 + 1
    u0_m0_wo2_mtree_mult1_13_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo2_mtree_mult1_13_shift2_q(15)) & u0_m0_wo2_mtree_mult1_13_shift2_q));
    u0_m0_wo2_mtree_mult1_13_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 12 => u0_m0_wo0_wi0_r0_delayr6_q(11)) & u0_m0_wo0_wi0_r0_delayr6_q));
    u0_m0_wo2_mtree_mult1_13_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_13_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_13_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_13_sub_3_a) - SIGNED(u0_m0_wo2_mtree_mult1_13_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_13_sub_3_q <= u0_m0_wo2_mtree_mult1_13_sub_3_o(16 downto 0);

    -- u0_m0_wo2_mtree_mult1_13_shift4(BITSHIFT,510)@11
    u0_m0_wo2_mtree_mult1_13_shift4_qint <= u0_m0_wo2_mtree_mult1_13_sub_3_q & "00000";
    u0_m0_wo2_mtree_mult1_13_shift4_q <= u0_m0_wo2_mtree_mult1_13_shift4_qint(21 downto 0);

    -- u0_m0_wo2_mtree_mult1_13_shift0(BITSHIFT,506)@10
    u0_m0_wo2_mtree_mult1_13_shift0_qint <= u0_m0_wo0_wi0_r0_delayr6_q & "00";
    u0_m0_wo2_mtree_mult1_13_shift0_q <= u0_m0_wo2_mtree_mult1_13_shift0_qint(13 downto 0);

    -- u0_m0_wo2_mtree_mult1_13_add_1(ADD,507)@10 + 1
    u0_m0_wo2_mtree_mult1_13_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => u0_m0_wo0_wi0_r0_delayr6_q(11)) & u0_m0_wo0_wi0_r0_delayr6_q));
    u0_m0_wo2_mtree_mult1_13_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo2_mtree_mult1_13_shift0_q(13)) & u0_m0_wo2_mtree_mult1_13_shift0_q));
    u0_m0_wo2_mtree_mult1_13_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_13_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_13_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_13_add_1_a) + SIGNED(u0_m0_wo2_mtree_mult1_13_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_13_add_1_q <= u0_m0_wo2_mtree_mult1_13_add_1_o(14 downto 0);

    -- u0_m0_wo2_mtree_mult1_13_add_5(ADD,511)@11 + 1
    u0_m0_wo2_mtree_mult1_13_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 15 => u0_m0_wo2_mtree_mult1_13_add_1_q(14)) & u0_m0_wo2_mtree_mult1_13_add_1_q));
    u0_m0_wo2_mtree_mult1_13_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo2_mtree_mult1_13_shift4_q(21)) & u0_m0_wo2_mtree_mult1_13_shift4_q));
    u0_m0_wo2_mtree_mult1_13_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_13_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_13_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_13_add_5_a) + SIGNED(u0_m0_wo2_mtree_mult1_13_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_13_add_5_q <= u0_m0_wo2_mtree_mult1_13_add_5_o(22 downto 0);

    -- u0_m0_wo2_mtree_mult1_13_shift6(BITSHIFT,512)@12
    u0_m0_wo2_mtree_mult1_13_shift6_qint <= u0_m0_wo2_mtree_mult1_13_add_5_q & "0";
    u0_m0_wo2_mtree_mult1_13_shift6_q <= u0_m0_wo2_mtree_mult1_13_shift6_qint(23 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr7(DELAY,26)@10
    u0_m0_wo0_wi0_r0_delayr7 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr6_q, xout => u0_m0_wo0_wi0_r0_delayr7_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm12(CONSTANT,54)@0
    u0_m0_wo0_cm12_q <= "101011010010";

    -- u0_m0_wo2_mtree_mult1_12(MULT,237)@10 + 2
    u0_m0_wo2_mtree_mult1_12_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm12_q);
    u0_m0_wo2_mtree_mult1_12_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr7_q);
    u0_m0_wo2_mtree_mult1_12_reset <= areset;
    u0_m0_wo2_mtree_mult1_12_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 12,
        lpm_widthb => 12,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo2_mtree_mult1_12_a0,
        datab => u0_m0_wo2_mtree_mult1_12_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo2_mtree_mult1_12_reset,
        clock => clk,
        result => u0_m0_wo2_mtree_mult1_12_s1
    );
    u0_m0_wo2_mtree_mult1_12_q <= u0_m0_wo2_mtree_mult1_12_s1;

    -- u0_m0_wo2_mtree_add0_6(ADD,256)@12 + 1
    u0_m0_wo2_mtree_add0_6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo2_mtree_mult1_12_q(23)) & u0_m0_wo2_mtree_mult1_12_q));
    u0_m0_wo2_mtree_add0_6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo2_mtree_mult1_13_shift6_q(23)) & u0_m0_wo2_mtree_mult1_13_shift6_q));
    u0_m0_wo2_mtree_add0_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_6_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_6_a) + SIGNED(u0_m0_wo2_mtree_add0_6_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_6_q <= u0_m0_wo2_mtree_add0_6_o(24 downto 0);

    -- u0_m0_wo2_mtree_add1_3(ADD,263)@13 + 1
    u0_m0_wo2_mtree_add1_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo2_mtree_add0_6_q(24)) & u0_m0_wo2_mtree_add0_6_q));
    u0_m0_wo2_mtree_add1_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 23 => u0_m0_wo2_mtree_add0_7_q(22)) & u0_m0_wo2_mtree_add0_7_q));
    u0_m0_wo2_mtree_add1_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add1_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add1_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add1_3_a) + SIGNED(u0_m0_wo2_mtree_add1_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add1_3_q <= u0_m0_wo2_mtree_add1_3_o(25 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr8(DELAY,27)@10
    u0_m0_wo0_wi0_r0_delayr8 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr7_q, xout => u0_m0_wo0_wi0_r0_delayr8_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm11(CONSTANT,53)@0
    u0_m0_wo0_cm11_q <= "01110100011";

    -- u0_m0_wo2_mtree_mult1_11(MULT,238)@10 + 2
    u0_m0_wo2_mtree_mult1_11_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm11_q);
    u0_m0_wo2_mtree_mult1_11_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr8_q);
    u0_m0_wo2_mtree_mult1_11_reset <= areset;
    u0_m0_wo2_mtree_mult1_11_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 11,
        lpm_widthb => 12,
        lpm_widthp => 23,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo2_mtree_mult1_11_a0,
        datab => u0_m0_wo2_mtree_mult1_11_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo2_mtree_mult1_11_reset,
        clock => clk,
        result => u0_m0_wo2_mtree_mult1_11_s1
    );
    u0_m0_wo2_mtree_mult1_11_q <= u0_m0_wo2_mtree_mult1_11_s1;

    -- u0_m0_wo0_wi0_r0_delayr9(DELAY,28)@10
    u0_m0_wo0_wi0_r0_delayr9 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr8_q, xout => u0_m0_wo0_wi0_r0_delayr9_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr9_q_11(DELAY,935)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr9_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr9_q, xout => d_u0_m0_wo0_wi0_r0_delayr9_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_10_shift0(BITSHIFT,530)@11
    u0_m0_wo2_mtree_mult1_10_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr9_q_11_q & "000000000000";
    u0_m0_wo2_mtree_mult1_10_shift0_q <= u0_m0_wo2_mtree_mult1_10_shift0_qint(23 downto 0);

    -- u0_m0_wo2_mtree_mult1_10_sub_1(SUB,531)@11 + 1
    u0_m0_wo2_mtree_mult1_10_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo2_mtree_mult1_10_shift0_q(23)) & u0_m0_wo2_mtree_mult1_10_shift0_q));
    u0_m0_wo2_mtree_mult1_10_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 12 => d_u0_m0_wo0_wi0_r0_delayr9_q_11_q(11)) & d_u0_m0_wo0_wi0_r0_delayr9_q_11_q));
    u0_m0_wo2_mtree_mult1_10_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_10_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_10_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_10_sub_1_a) - SIGNED(u0_m0_wo2_mtree_mult1_10_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_10_sub_1_q <= u0_m0_wo2_mtree_mult1_10_sub_1_o(24 downto 0);

    -- u0_m0_wo2_mtree_mult1_10_shift2(BITSHIFT,532)@12
    u0_m0_wo2_mtree_mult1_10_shift2_qint <= u0_m0_wo2_mtree_mult1_10_sub_1_q & "0";
    u0_m0_wo2_mtree_mult1_10_shift2_q <= u0_m0_wo2_mtree_mult1_10_shift2_qint(25 downto 0);

    -- u0_m0_wo2_mtree_add0_5(ADD,255)@12 + 1
    u0_m0_wo2_mtree_add0_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo2_mtree_mult1_10_shift2_q(25)) & u0_m0_wo2_mtree_mult1_10_shift2_q));
    u0_m0_wo2_mtree_add0_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 23 => u0_m0_wo2_mtree_mult1_11_q(22)) & u0_m0_wo2_mtree_mult1_11_q));
    u0_m0_wo2_mtree_add0_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_5_a) + SIGNED(u0_m0_wo2_mtree_add0_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_5_q <= u0_m0_wo2_mtree_add0_5_o(26 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr10(DELAY,29)@10
    u0_m0_wo0_wi0_r0_delayr10 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr9_q, xout => u0_m0_wo0_wi0_r0_delayr10_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm9(CONSTANT,51)@0
    u0_m0_wo0_cm9_q <= "0111010100100";

    -- u0_m0_wo2_mtree_mult1_9(MULT,240)@10 + 2
    u0_m0_wo2_mtree_mult1_9_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm9_q);
    u0_m0_wo2_mtree_mult1_9_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr10_q);
    u0_m0_wo2_mtree_mult1_9_reset <= areset;
    u0_m0_wo2_mtree_mult1_9_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 13,
        lpm_widthb => 12,
        lpm_widthp => 25,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo2_mtree_mult1_9_a0,
        datab => u0_m0_wo2_mtree_mult1_9_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo2_mtree_mult1_9_reset,
        clock => clk,
        result => u0_m0_wo2_mtree_mult1_9_s1
    );
    u0_m0_wo2_mtree_mult1_9_q <= u0_m0_wo2_mtree_mult1_9_s1;

    -- u0_m0_wo2_mtree_mult1_8_shift2(BITSHIFT,544)@10
    u0_m0_wo2_mtree_mult1_8_shift2_qint <= u0_m0_wo0_wi0_r0_delayr11_q & "000";
    u0_m0_wo2_mtree_mult1_8_shift2_q <= u0_m0_wo2_mtree_mult1_8_shift2_qint(14 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr11(DELAY,30)@10
    u0_m0_wo0_wi0_r0_delayr11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr10_q, xout => u0_m0_wo0_wi0_r0_delayr11_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_8_sub_3(SUB,545)@10 + 1
    u0_m0_wo2_mtree_mult1_8_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 12 => u0_m0_wo0_wi0_r0_delayr11_q(11)) & u0_m0_wo0_wi0_r0_delayr11_q));
    u0_m0_wo2_mtree_mult1_8_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo2_mtree_mult1_8_shift2_q(14)) & u0_m0_wo2_mtree_mult1_8_shift2_q));
    u0_m0_wo2_mtree_mult1_8_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_8_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_8_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_8_sub_3_a) - SIGNED(u0_m0_wo2_mtree_mult1_8_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_8_sub_3_q <= u0_m0_wo2_mtree_mult1_8_sub_3_o(15 downto 0);

    -- u0_m0_wo2_mtree_mult1_8_shift4(BITSHIFT,546)@11
    u0_m0_wo2_mtree_mult1_8_shift4_qint <= u0_m0_wo2_mtree_mult1_8_sub_3_q & "0000000";
    u0_m0_wo2_mtree_mult1_8_shift4_q <= u0_m0_wo2_mtree_mult1_8_shift4_qint(22 downto 0);

    -- u0_m0_wo2_mtree_mult1_8_shift0(BITSHIFT,542)@10
    u0_m0_wo2_mtree_mult1_8_shift0_qint <= u0_m0_wo0_wi0_r0_delayr11_q & "0000";
    u0_m0_wo2_mtree_mult1_8_shift0_q <= u0_m0_wo2_mtree_mult1_8_shift0_qint(15 downto 0);

    -- u0_m0_wo2_mtree_mult1_8_sub_1(SUB,543)@10 + 1
    u0_m0_wo2_mtree_mult1_8_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo2_mtree_mult1_8_shift0_q(15)) & u0_m0_wo2_mtree_mult1_8_shift0_q));
    u0_m0_wo2_mtree_mult1_8_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 12 => u0_m0_wo0_wi0_r0_delayr11_q(11)) & u0_m0_wo0_wi0_r0_delayr11_q));
    u0_m0_wo2_mtree_mult1_8_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_8_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_8_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_8_sub_1_a) - SIGNED(u0_m0_wo2_mtree_mult1_8_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_8_sub_1_q <= u0_m0_wo2_mtree_mult1_8_sub_1_o(16 downto 0);

    -- u0_m0_wo2_mtree_mult1_8_add_5(ADD,547)@11 + 1
    u0_m0_wo2_mtree_mult1_8_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 17 => u0_m0_wo2_mtree_mult1_8_sub_1_q(16)) & u0_m0_wo2_mtree_mult1_8_sub_1_q));
    u0_m0_wo2_mtree_mult1_8_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo2_mtree_mult1_8_shift4_q(22)) & u0_m0_wo2_mtree_mult1_8_shift4_q));
    u0_m0_wo2_mtree_mult1_8_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_8_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_8_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_8_add_5_a) + SIGNED(u0_m0_wo2_mtree_mult1_8_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_8_add_5_q <= u0_m0_wo2_mtree_mult1_8_add_5_o(23 downto 0);

    -- u0_m0_wo2_mtree_mult1_8_shift6(BITSHIFT,548)@12
    u0_m0_wo2_mtree_mult1_8_shift6_qint <= u0_m0_wo2_mtree_mult1_8_add_5_q & "0";
    u0_m0_wo2_mtree_mult1_8_shift6_q <= u0_m0_wo2_mtree_mult1_8_shift6_qint(24 downto 0);

    -- u0_m0_wo2_mtree_add0_4(ADD,254)@12 + 1
    u0_m0_wo2_mtree_add0_4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo2_mtree_mult1_8_shift6_q(24)) & u0_m0_wo2_mtree_mult1_8_shift6_q));
    u0_m0_wo2_mtree_add0_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo2_mtree_mult1_9_q(24)) & u0_m0_wo2_mtree_mult1_9_q));
    u0_m0_wo2_mtree_add0_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_4_a) + SIGNED(u0_m0_wo2_mtree_add0_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_4_q <= u0_m0_wo2_mtree_add0_4_o(25 downto 0);

    -- u0_m0_wo2_mtree_add1_2(ADD,262)@13 + 1
    u0_m0_wo2_mtree_add1_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 26 => u0_m0_wo2_mtree_add0_4_q(25)) & u0_m0_wo2_mtree_add0_4_q));
    u0_m0_wo2_mtree_add1_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo2_mtree_add0_5_q(26)) & u0_m0_wo2_mtree_add0_5_q));
    u0_m0_wo2_mtree_add1_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add1_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add1_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add1_2_a) + SIGNED(u0_m0_wo2_mtree_add1_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add1_2_q <= u0_m0_wo2_mtree_add1_2_o(27 downto 0);

    -- u0_m0_wo2_mtree_add2_1(ADD,266)@14 + 1
    u0_m0_wo2_mtree_add2_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo2_mtree_add1_2_q(27)) & u0_m0_wo2_mtree_add1_2_q));
    u0_m0_wo2_mtree_add2_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 26 => u0_m0_wo2_mtree_add1_3_q(25)) & u0_m0_wo2_mtree_add1_3_q));
    u0_m0_wo2_mtree_add2_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add2_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add2_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add2_1_a) + SIGNED(u0_m0_wo2_mtree_add2_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add2_1_q <= u0_m0_wo2_mtree_add2_1_o(28 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr12(DELAY,31)@10
    u0_m0_wo0_wi0_r0_delayr12 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr11_q, xout => u0_m0_wo0_wi0_r0_delayr12_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm7(CONSTANT,49)@0
    u0_m0_wo0_cm7_q <= "01001011010";

    -- u0_m0_wo2_mtree_mult1_7(MULT,242)@10 + 2
    u0_m0_wo2_mtree_mult1_7_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm7_q);
    u0_m0_wo2_mtree_mult1_7_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr12_q);
    u0_m0_wo2_mtree_mult1_7_reset <= areset;
    u0_m0_wo2_mtree_mult1_7_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 11,
        lpm_widthb => 12,
        lpm_widthp => 23,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo2_mtree_mult1_7_a0,
        datab => u0_m0_wo2_mtree_mult1_7_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo2_mtree_mult1_7_reset,
        clock => clk,
        result => u0_m0_wo2_mtree_mult1_7_s1
    );
    u0_m0_wo2_mtree_mult1_7_q <= u0_m0_wo2_mtree_mult1_7_s1;

    -- u0_m0_wo0_wi0_r0_delayr13(DELAY,32)@10
    u0_m0_wo0_wi0_r0_delayr13 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr12_q, xout => u0_m0_wo0_wi0_r0_delayr13_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr13_q_11(DELAY,937)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr13_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr13_q, xout => d_u0_m0_wo0_wi0_r0_delayr13_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_6_shift2(BITSHIFT,560)@11
    u0_m0_wo2_mtree_mult1_6_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr13_q_11_q & "0000000";
    u0_m0_wo2_mtree_mult1_6_shift2_q <= u0_m0_wo2_mtree_mult1_6_shift2_qint(18 downto 0);

    -- u0_m0_wo2_mtree_mult1_6_shift0(BITSHIFT,558)@10
    u0_m0_wo2_mtree_mult1_6_shift0_qint <= u0_m0_wo0_wi0_r0_delayr13_q & "0";
    u0_m0_wo2_mtree_mult1_6_shift0_q <= u0_m0_wo2_mtree_mult1_6_shift0_qint(12 downto 0);

    -- u0_m0_wo2_mtree_mult1_6_add_1(ADD,559)@10 + 1
    u0_m0_wo2_mtree_mult1_6_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => u0_m0_wo0_wi0_r0_delayr13_q(11)) & u0_m0_wo0_wi0_r0_delayr13_q));
    u0_m0_wo2_mtree_mult1_6_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 13 => u0_m0_wo2_mtree_mult1_6_shift0_q(12)) & u0_m0_wo2_mtree_mult1_6_shift0_q));
    u0_m0_wo2_mtree_mult1_6_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_6_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_6_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_6_add_1_a) + SIGNED(u0_m0_wo2_mtree_mult1_6_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_6_add_1_q <= u0_m0_wo2_mtree_mult1_6_add_1_o(13 downto 0);

    -- u0_m0_wo2_mtree_mult1_6_add_3(ADD,561)@11 + 1
    u0_m0_wo2_mtree_mult1_6_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 14 => u0_m0_wo2_mtree_mult1_6_add_1_q(13)) & u0_m0_wo2_mtree_mult1_6_add_1_q));
    u0_m0_wo2_mtree_mult1_6_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo2_mtree_mult1_6_shift2_q(18)) & u0_m0_wo2_mtree_mult1_6_shift2_q));
    u0_m0_wo2_mtree_mult1_6_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_6_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_6_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_6_add_3_a) + SIGNED(u0_m0_wo2_mtree_mult1_6_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_6_add_3_q <= u0_m0_wo2_mtree_mult1_6_add_3_o(19 downto 0);

    -- u0_m0_wo2_mtree_add0_3(ADD,253)@12 + 1
    u0_m0_wo2_mtree_add0_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 20 => u0_m0_wo2_mtree_mult1_6_add_3_q(19)) & u0_m0_wo2_mtree_mult1_6_add_3_q));
    u0_m0_wo2_mtree_add0_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo2_mtree_mult1_7_q(22)) & u0_m0_wo2_mtree_mult1_7_q));
    u0_m0_wo2_mtree_add0_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_3_a) + SIGNED(u0_m0_wo2_mtree_add0_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_3_q <= u0_m0_wo2_mtree_add0_3_o(23 downto 0);

    -- u0_m0_wo2_mtree_mult1_5_shift2(BITSHIFT,564)@10
    u0_m0_wo2_mtree_mult1_5_shift2_qint <= u0_m0_wo0_wi0_r0_delayr14_q & "000";
    u0_m0_wo2_mtree_mult1_5_shift2_q <= u0_m0_wo2_mtree_mult1_5_shift2_qint(14 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr14(DELAY,33)@10
    u0_m0_wo0_wi0_r0_delayr14 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr13_q, xout => u0_m0_wo0_wi0_r0_delayr14_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_5_sub_3(SUB,565)@10 + 1
    u0_m0_wo2_mtree_mult1_5_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 12 => u0_m0_wo0_wi0_r0_delayr14_q(11)) & u0_m0_wo0_wi0_r0_delayr14_q));
    u0_m0_wo2_mtree_mult1_5_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo2_mtree_mult1_5_shift2_q(14)) & u0_m0_wo2_mtree_mult1_5_shift2_q));
    u0_m0_wo2_mtree_mult1_5_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_5_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_5_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_5_sub_3_a) - SIGNED(u0_m0_wo2_mtree_mult1_5_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_5_sub_3_q <= u0_m0_wo2_mtree_mult1_5_sub_3_o(15 downto 0);

    -- u0_m0_wo2_mtree_mult1_5_shift4(BITSHIFT,566)@11
    u0_m0_wo2_mtree_mult1_5_shift4_qint <= u0_m0_wo2_mtree_mult1_5_sub_3_q & "000000";
    u0_m0_wo2_mtree_mult1_5_shift4_q <= u0_m0_wo2_mtree_mult1_5_shift4_qint(21 downto 0);

    -- u0_m0_wo2_mtree_mult1_5_shift0(BITSHIFT,562)@10
    u0_m0_wo2_mtree_mult1_5_shift0_qint <= u0_m0_wo0_wi0_r0_delayr14_q & "00";
    u0_m0_wo2_mtree_mult1_5_shift0_q <= u0_m0_wo2_mtree_mult1_5_shift0_qint(13 downto 0);

    -- u0_m0_wo2_mtree_mult1_5_sub_1(SUB,563)@10 + 1
    u0_m0_wo2_mtree_mult1_5_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo2_mtree_mult1_5_shift0_q(13)) & u0_m0_wo2_mtree_mult1_5_shift0_q));
    u0_m0_wo2_mtree_mult1_5_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => u0_m0_wo0_wi0_r0_delayr14_q(11)) & u0_m0_wo0_wi0_r0_delayr14_q));
    u0_m0_wo2_mtree_mult1_5_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_5_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_5_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_5_sub_1_a) - SIGNED(u0_m0_wo2_mtree_mult1_5_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_5_sub_1_q <= u0_m0_wo2_mtree_mult1_5_sub_1_o(14 downto 0);

    -- u0_m0_wo2_mtree_mult1_5_add_5(ADD,567)@11 + 1
    u0_m0_wo2_mtree_mult1_5_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 15 => u0_m0_wo2_mtree_mult1_5_sub_1_q(14)) & u0_m0_wo2_mtree_mult1_5_sub_1_q));
    u0_m0_wo2_mtree_mult1_5_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo2_mtree_mult1_5_shift4_q(21)) & u0_m0_wo2_mtree_mult1_5_shift4_q));
    u0_m0_wo2_mtree_mult1_5_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_5_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_5_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_5_add_5_a) + SIGNED(u0_m0_wo2_mtree_mult1_5_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_5_add_5_q <= u0_m0_wo2_mtree_mult1_5_add_5_o(22 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr15(DELAY,34)@10
    u0_m0_wo0_wi0_r0_delayr15 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr14_q, xout => u0_m0_wo0_wi0_r0_delayr15_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm4(CONSTANT,46)@0
    u0_m0_wo0_cm4_q <= "0110100110";

    -- u0_m0_wo2_mtree_mult1_4(MULT,245)@10 + 2
    u0_m0_wo2_mtree_mult1_4_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm4_q);
    u0_m0_wo2_mtree_mult1_4_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr15_q);
    u0_m0_wo2_mtree_mult1_4_reset <= areset;
    u0_m0_wo2_mtree_mult1_4_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 10,
        lpm_widthb => 12,
        lpm_widthp => 22,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo2_mtree_mult1_4_a0,
        datab => u0_m0_wo2_mtree_mult1_4_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo2_mtree_mult1_4_reset,
        clock => clk,
        result => u0_m0_wo2_mtree_mult1_4_s1
    );
    u0_m0_wo2_mtree_mult1_4_q <= u0_m0_wo2_mtree_mult1_4_s1;

    -- u0_m0_wo2_mtree_add0_2(ADD,252)@12 + 1
    u0_m0_wo2_mtree_add0_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo2_mtree_mult1_4_q(21)) & u0_m0_wo2_mtree_mult1_4_q));
    u0_m0_wo2_mtree_add0_2_b <= STD_LOGIC_VECTOR(u0_m0_wo2_mtree_mult1_5_add_5_q);
    u0_m0_wo2_mtree_add0_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_2_a) + SIGNED(u0_m0_wo2_mtree_add0_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_2_q <= u0_m0_wo2_mtree_add0_2_o(22 downto 0);

    -- u0_m0_wo2_mtree_add1_1(ADD,261)@13 + 1
    u0_m0_wo2_mtree_add1_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => u0_m0_wo2_mtree_add0_2_q(22)) & u0_m0_wo2_mtree_add0_2_q));
    u0_m0_wo2_mtree_add1_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo2_mtree_add0_3_q(23)) & u0_m0_wo2_mtree_add0_3_q));
    u0_m0_wo2_mtree_add1_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add1_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add1_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add1_1_a) + SIGNED(u0_m0_wo2_mtree_add1_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add1_1_q <= u0_m0_wo2_mtree_add1_1_o(24 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr16(DELAY,35)@10
    u0_m0_wo0_wi0_r0_delayr16 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr15_q, xout => u0_m0_wo0_wi0_r0_delayr16_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr16_q_11(DELAY,939)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr16_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr16_q, xout => d_u0_m0_wo0_wi0_r0_delayr16_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_3_shift2(BITSHIFT,579)@11
    u0_m0_wo2_mtree_mult1_3_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr16_q_11_q & "000000";
    u0_m0_wo2_mtree_mult1_3_shift2_q <= u0_m0_wo2_mtree_mult1_3_shift2_qint(17 downto 0);

    -- u0_m0_wo2_mtree_mult1_3_shift0(BITSHIFT,577)@10
    u0_m0_wo2_mtree_mult1_3_shift0_qint <= u0_m0_wo0_wi0_r0_delayr16_q & "000";
    u0_m0_wo2_mtree_mult1_3_shift0_q <= u0_m0_wo2_mtree_mult1_3_shift0_qint(14 downto 0);

    -- u0_m0_wo2_mtree_mult1_3_sub_1(SUB,578)@10 + 1
    u0_m0_wo2_mtree_mult1_3_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo2_mtree_mult1_3_shift0_q(14)) & u0_m0_wo2_mtree_mult1_3_shift0_q));
    u0_m0_wo2_mtree_mult1_3_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 12 => u0_m0_wo0_wi0_r0_delayr16_q(11)) & u0_m0_wo0_wi0_r0_delayr16_q));
    u0_m0_wo2_mtree_mult1_3_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_3_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_3_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_3_sub_1_a) - SIGNED(u0_m0_wo2_mtree_mult1_3_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_3_sub_1_q <= u0_m0_wo2_mtree_mult1_3_sub_1_o(15 downto 0);

    -- u0_m0_wo2_mtree_mult1_3_sub_3(SUB,580)@11 + 1
    u0_m0_wo2_mtree_mult1_3_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => u0_m0_wo2_mtree_mult1_3_sub_1_q(15)) & u0_m0_wo2_mtree_mult1_3_sub_1_q));
    u0_m0_wo2_mtree_mult1_3_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo2_mtree_mult1_3_shift2_q(17)) & u0_m0_wo2_mtree_mult1_3_shift2_q));
    u0_m0_wo2_mtree_mult1_3_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_3_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_3_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_3_sub_3_a) - SIGNED(u0_m0_wo2_mtree_mult1_3_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_3_sub_3_q <= u0_m0_wo2_mtree_mult1_3_sub_3_o(18 downto 0);

    -- u0_m0_wo2_mtree_mult1_3_shift4(BITSHIFT,581)@12
    u0_m0_wo2_mtree_mult1_3_shift4_qint <= u0_m0_wo2_mtree_mult1_3_sub_3_q & "00";
    u0_m0_wo2_mtree_mult1_3_shift4_q <= u0_m0_wo2_mtree_mult1_3_shift4_qint(20 downto 0);

    -- u0_m0_wo2_mtree_mult1_2_shift0(BITSHIFT,582)@11
    u0_m0_wo2_mtree_mult1_2_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr17_q_11_q & "0";
    u0_m0_wo2_mtree_mult1_2_shift0_q <= u0_m0_wo2_mtree_mult1_2_shift0_qint(12 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr17(DELAY,36)@10
    u0_m0_wo0_wi0_r0_delayr17 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr16_q, xout => u0_m0_wo0_wi0_r0_delayr17_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr17_q_11(DELAY,940)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr17_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr17_q, xout => d_u0_m0_wo0_wi0_r0_delayr17_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_2_add_1(ADD,583)@11 + 1
    u0_m0_wo2_mtree_mult1_2_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => d_u0_m0_wo0_wi0_r0_delayr17_q_11_q(11)) & d_u0_m0_wo0_wi0_r0_delayr17_q_11_q));
    u0_m0_wo2_mtree_mult1_2_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 13 => u0_m0_wo2_mtree_mult1_2_shift0_q(12)) & u0_m0_wo2_mtree_mult1_2_shift0_q));
    u0_m0_wo2_mtree_mult1_2_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_2_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_2_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_2_add_1_a) + SIGNED(u0_m0_wo2_mtree_mult1_2_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_2_add_1_q <= u0_m0_wo2_mtree_mult1_2_add_1_o(13 downto 0);

    -- u0_m0_wo2_mtree_mult1_2_shift2(BITSHIFT,584)@12
    u0_m0_wo2_mtree_mult1_2_shift2_qint <= u0_m0_wo2_mtree_mult1_2_add_1_q & "00";
    u0_m0_wo2_mtree_mult1_2_shift2_q <= u0_m0_wo2_mtree_mult1_2_shift2_qint(15 downto 0);

    -- u0_m0_wo2_mtree_add0_1(ADD,251)@12 + 1
    u0_m0_wo2_mtree_add0_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 16 => u0_m0_wo2_mtree_mult1_2_shift2_q(15)) & u0_m0_wo2_mtree_mult1_2_shift2_q));
    u0_m0_wo2_mtree_add0_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo2_mtree_mult1_3_shift4_q(20)) & u0_m0_wo2_mtree_mult1_3_shift4_q));
    u0_m0_wo2_mtree_add0_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_1_a) + SIGNED(u0_m0_wo2_mtree_add0_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_1_q <= u0_m0_wo2_mtree_add0_1_o(21 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr18(DELAY,37)@10
    u0_m0_wo0_wi0_r0_delayr18 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr17_q, xout => u0_m0_wo0_wi0_r0_delayr18_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm1(CONSTANT,43)@0
    u0_m0_wo0_cm1_q <= "0101010111";

    -- u0_m0_wo2_mtree_mult1_1(MULT,248)@10 + 2
    u0_m0_wo2_mtree_mult1_1_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm1_q);
    u0_m0_wo2_mtree_mult1_1_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr18_q);
    u0_m0_wo2_mtree_mult1_1_reset <= areset;
    u0_m0_wo2_mtree_mult1_1_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 10,
        lpm_widthb => 12,
        lpm_widthp => 22,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo2_mtree_mult1_1_a0,
        datab => u0_m0_wo2_mtree_mult1_1_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo2_mtree_mult1_1_reset,
        clock => clk,
        result => u0_m0_wo2_mtree_mult1_1_s1
    );
    u0_m0_wo2_mtree_mult1_1_q <= u0_m0_wo2_mtree_mult1_1_s1;

    -- u0_m0_wo2_mtree_mult1_0_shift0(BITSHIFT,593)@10
    u0_m0_wo2_mtree_mult1_0_shift0_qint <= u0_m0_wo0_wi0_r0_delayr19_q & "000";
    u0_m0_wo2_mtree_mult1_0_shift0_q <= u0_m0_wo2_mtree_mult1_0_shift0_qint(14 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr19(DELAY,38)@10
    u0_m0_wo0_wi0_r0_delayr19 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr18_q, xout => u0_m0_wo0_wi0_r0_delayr19_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_0_add_1(ADD,594)@10 + 1
    u0_m0_wo2_mtree_mult1_0_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 12 => u0_m0_wo0_wi0_r0_delayr19_q(11)) & u0_m0_wo0_wi0_r0_delayr19_q));
    u0_m0_wo2_mtree_mult1_0_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo2_mtree_mult1_0_shift0_q(14)) & u0_m0_wo2_mtree_mult1_0_shift0_q));
    u0_m0_wo2_mtree_mult1_0_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_0_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_0_add_1_a) + SIGNED(u0_m0_wo2_mtree_mult1_0_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_0_add_1_q <= u0_m0_wo2_mtree_mult1_0_add_1_o(15 downto 0);

    -- d_u0_m0_wo0_wi0_r0_delayr19_q_11(DELAY,943)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr19_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr19_q, xout => d_u0_m0_wo0_wi0_r0_delayr19_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo2_mtree_mult1_0_shift2(BITSHIFT,595)@11
    u0_m0_wo2_mtree_mult1_0_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr19_q_11_q & "00000";
    u0_m0_wo2_mtree_mult1_0_shift2_q <= u0_m0_wo2_mtree_mult1_0_shift2_qint(16 downto 0);

    -- u0_m0_wo2_mtree_mult1_0_sub_3(SUB,596)@11 + 1
    u0_m0_wo2_mtree_mult1_0_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo2_mtree_mult1_0_shift2_q(16)) & u0_m0_wo2_mtree_mult1_0_shift2_q));
    u0_m0_wo2_mtree_mult1_0_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => u0_m0_wo2_mtree_mult1_0_add_1_q(15)) & u0_m0_wo2_mtree_mult1_0_add_1_q));
    u0_m0_wo2_mtree_mult1_0_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_mult1_0_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_mult1_0_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_mult1_0_sub_3_a) - SIGNED(u0_m0_wo2_mtree_mult1_0_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_mult1_0_sub_3_q <= u0_m0_wo2_mtree_mult1_0_sub_3_o(17 downto 0);

    -- u0_m0_wo2_mtree_mult1_0_shift4(BITSHIFT,597)@12
    u0_m0_wo2_mtree_mult1_0_shift4_qint <= u0_m0_wo2_mtree_mult1_0_sub_3_q & "0";
    u0_m0_wo2_mtree_mult1_0_shift4_q <= u0_m0_wo2_mtree_mult1_0_shift4_qint(18 downto 0);

    -- u0_m0_wo2_mtree_add0_0(ADD,250)@12 + 1
    u0_m0_wo2_mtree_add0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 19 => u0_m0_wo2_mtree_mult1_0_shift4_q(18)) & u0_m0_wo2_mtree_mult1_0_shift4_q));
    u0_m0_wo2_mtree_add0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo2_mtree_mult1_1_q(21)) & u0_m0_wo2_mtree_mult1_1_q));
    u0_m0_wo2_mtree_add0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add0_0_a) + SIGNED(u0_m0_wo2_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add0_0_q <= u0_m0_wo2_mtree_add0_0_o(22 downto 0);

    -- u0_m0_wo2_mtree_add1_0(ADD,260)@13 + 1
    u0_m0_wo2_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo2_mtree_add0_0_q(22)) & u0_m0_wo2_mtree_add0_0_q));
    u0_m0_wo2_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 22 => u0_m0_wo2_mtree_add0_1_q(21)) & u0_m0_wo2_mtree_add0_1_q));
    u0_m0_wo2_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add1_0_a) + SIGNED(u0_m0_wo2_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add1_0_q <= u0_m0_wo2_mtree_add1_0_o(23 downto 0);

    -- u0_m0_wo2_mtree_add2_0(ADD,265)@14 + 1
    u0_m0_wo2_mtree_add2_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 24 => u0_m0_wo2_mtree_add1_0_q(23)) & u0_m0_wo2_mtree_add1_0_q));
    u0_m0_wo2_mtree_add2_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo2_mtree_add1_1_q(24)) & u0_m0_wo2_mtree_add1_1_q));
    u0_m0_wo2_mtree_add2_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add2_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add2_0_a) + SIGNED(u0_m0_wo2_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add2_0_q <= u0_m0_wo2_mtree_add2_0_o(25 downto 0);

    -- u0_m0_wo2_mtree_add3_0(ADD,267)@15 + 1
    u0_m0_wo2_mtree_add3_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 26 => u0_m0_wo2_mtree_add2_0_q(25)) & u0_m0_wo2_mtree_add2_0_q));
    u0_m0_wo2_mtree_add3_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo2_mtree_add2_1_q(28)) & u0_m0_wo2_mtree_add2_1_q));
    u0_m0_wo2_mtree_add3_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add3_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add3_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add3_0_a) + SIGNED(u0_m0_wo2_mtree_add3_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add3_0_q <= u0_m0_wo2_mtree_add3_0_o(29 downto 0);

    -- u0_m0_wo2_mtree_add4_0(ADD,268)@16 + 1
    u0_m0_wo2_mtree_add4_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo2_mtree_add3_0_q(29)) & u0_m0_wo2_mtree_add3_0_q));
    u0_m0_wo2_mtree_add4_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 24 => u0_m0_wo2_mtree_add1_4_q(23)) & u0_m0_wo2_mtree_add1_4_q));
    u0_m0_wo2_mtree_add4_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_add4_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_add4_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_add4_0_a) + SIGNED(u0_m0_wo2_mtree_add4_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_add4_0_q <= u0_m0_wo2_mtree_add4_0_o(30 downto 0);

    -- d_u0_m0_wo0_wi0_r0_delayr19_q_12(DELAY,944)@11 + 1
    d_u0_m0_wo0_wi0_r0_delayr19_q_12 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr19_q_11_q, xout => d_u0_m0_wo0_wi0_r0_delayr19_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_sym_add0(ADD,146)@12 + 1
    u0_m0_wo1_sym_add0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => d_u0_m0_wo0_wi0_r0_phasedelay0_q_12_q(11)) & d_u0_m0_wo0_wi0_r0_phasedelay0_q_12_q));
    u0_m0_wo1_sym_add0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => d_u0_m0_wo0_wi0_r0_delayr19_q_12_q(11)) & d_u0_m0_wo0_wi0_r0_delayr19_q_12_q));
    u0_m0_wo1_sym_add0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_sym_add0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_sym_add0_a) + SIGNED(u0_m0_wo1_sym_add0_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_sym_add0_q <= u0_m0_wo1_sym_add0_o(12 downto 0);

    -- d_u0_m0_wo1_sym_add0_q_14(DELAY,945)@13 + 1
    d_u0_m0_wo1_sym_add0_q_14 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo1_sym_add0_q, xout => d_u0_m0_wo1_sym_add0_q_14_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_mtree_mult1_9_shift2(BITSHIFT,409)@14
    u0_m0_wo1_mtree_mult1_9_shift2_qint <= d_u0_m0_wo1_sym_add0_q_14_q & "00000";
    u0_m0_wo1_mtree_mult1_9_shift2_q <= u0_m0_wo1_mtree_mult1_9_shift2_qint(17 downto 0);

    -- u0_m0_wo1_mtree_mult1_9_shift0(BITSHIFT,407)@13
    u0_m0_wo1_mtree_mult1_9_shift0_qint <= u0_m0_wo1_sym_add0_q & "00";
    u0_m0_wo1_mtree_mult1_9_shift0_q <= u0_m0_wo1_mtree_mult1_9_shift0_qint(14 downto 0);

    -- u0_m0_wo1_mtree_mult1_9_add_1(ADD,408)@13 + 1
    u0_m0_wo1_mtree_mult1_9_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 13 => u0_m0_wo1_sym_add0_q(12)) & u0_m0_wo1_sym_add0_q));
    u0_m0_wo1_mtree_mult1_9_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo1_mtree_mult1_9_shift0_q(14)) & u0_m0_wo1_mtree_mult1_9_shift0_q));
    u0_m0_wo1_mtree_mult1_9_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_9_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_9_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_9_add_1_a) + SIGNED(u0_m0_wo1_mtree_mult1_9_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_9_add_1_q <= u0_m0_wo1_mtree_mult1_9_add_1_o(15 downto 0);

    -- u0_m0_wo1_mtree_mult1_9_add_3(ADD,410)@14 + 1
    u0_m0_wo1_mtree_mult1_9_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => u0_m0_wo1_mtree_mult1_9_add_1_q(15)) & u0_m0_wo1_mtree_mult1_9_add_1_q));
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

    -- u0_m0_wo1_mtree_mult1_9_shift4(BITSHIFT,411)@15
    u0_m0_wo1_mtree_mult1_9_shift4_qint <= u0_m0_wo1_mtree_mult1_9_add_3_q & "00";
    u0_m0_wo1_mtree_mult1_9_shift4_q <= u0_m0_wo1_mtree_mult1_9_shift4_qint(20 downto 0);

    -- d_u0_m0_wo0_wi0_r0_delayr18_q_11(DELAY,941)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr18_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr18_q, xout => d_u0_m0_wo0_wi0_r0_delayr18_q_11_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr18_q_12(DELAY,942)@11 + 1
    d_u0_m0_wo0_wi0_r0_delayr18_q_12 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr18_q_11_q, xout => d_u0_m0_wo0_wi0_r0_delayr18_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_sym_add1(ADD,147)@12 + 1
    u0_m0_wo1_sym_add1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => d_u0_m0_wo0_wi0_r0_delayr1_q_12_q(11)) & d_u0_m0_wo0_wi0_r0_delayr1_q_12_q));
    u0_m0_wo1_sym_add1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => d_u0_m0_wo0_wi0_r0_delayr18_q_12_q(11)) & d_u0_m0_wo0_wi0_r0_delayr18_q_12_q));
    u0_m0_wo1_sym_add1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_sym_add1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_sym_add1_a) + SIGNED(u0_m0_wo1_sym_add1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_sym_add1_q <= u0_m0_wo1_sym_add1_o(12 downto 0);

    -- u0_m0_wo1_cm1(CONSTANT,137)@0
    u0_m0_wo1_cm1_q <= "0101010011";

    -- u0_m0_wo1_mtree_mult1_8(MULT,157)@13 + 2
    u0_m0_wo1_mtree_mult1_8_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm1_q);
    u0_m0_wo1_mtree_mult1_8_b0 <= STD_LOGIC_VECTOR(u0_m0_wo1_sym_add1_q);
    u0_m0_wo1_mtree_mult1_8_reset <= areset;
    u0_m0_wo1_mtree_mult1_8_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 10,
        lpm_widthb => 13,
        lpm_widthp => 23,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo1_mtree_mult1_8_a0,
        datab => u0_m0_wo1_mtree_mult1_8_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo1_mtree_mult1_8_reset,
        clock => clk,
        result => u0_m0_wo1_mtree_mult1_8_s1
    );
    u0_m0_wo1_mtree_mult1_8_q <= u0_m0_wo1_mtree_mult1_8_s1;

    -- u0_m0_wo1_mtree_add0_4(ADD,170)@15 + 1
    u0_m0_wo1_mtree_add0_4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo1_mtree_mult1_8_q(22)) & u0_m0_wo1_mtree_mult1_8_q));
    u0_m0_wo1_mtree_add0_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 21 => u0_m0_wo1_mtree_mult1_9_shift4_q(20)) & u0_m0_wo1_mtree_mult1_9_shift4_q));
    u0_m0_wo1_mtree_add0_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add0_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add0_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add0_4_a) + SIGNED(u0_m0_wo1_mtree_add0_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add0_4_q <= u0_m0_wo1_mtree_add0_4_o(23 downto 0);

    -- u0_m0_wo1_sym_add2(ADD,148)@10 + 1
    u0_m0_wo1_sym_add2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr2_q(11)) & u0_m0_wo0_wi0_r0_delayr2_q));
    u0_m0_wo1_sym_add2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr17_q(11)) & u0_m0_wo0_wi0_r0_delayr17_q));
    u0_m0_wo1_sym_add2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_sym_add2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_sym_add2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_sym_add2_a) + SIGNED(u0_m0_wo1_sym_add2_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_sym_add2_q <= u0_m0_wo1_sym_add2_o(12 downto 0);

    -- d_u0_m0_wo1_sym_add2_q_12(DELAY,946)@11 + 1
    d_u0_m0_wo1_sym_add2_q_12 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo1_sym_add2_q, xout => d_u0_m0_wo1_sym_add2_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_mtree_mult1_7_shift2(BITSHIFT,422)@12
    u0_m0_wo1_mtree_mult1_7_shift2_qint <= d_u0_m0_wo1_sym_add2_q_12_q & "00000";
    u0_m0_wo1_mtree_mult1_7_shift2_q <= u0_m0_wo1_mtree_mult1_7_shift2_qint(17 downto 0);

    -- u0_m0_wo1_mtree_mult1_7_shift0(BITSHIFT,420)@11
    u0_m0_wo1_mtree_mult1_7_shift0_qint <= u0_m0_wo1_sym_add2_q & "000";
    u0_m0_wo1_mtree_mult1_7_shift0_q <= u0_m0_wo1_mtree_mult1_7_shift0_qint(15 downto 0);

    -- u0_m0_wo1_mtree_mult1_7_sub_1(SUB,421)@11 + 1
    u0_m0_wo1_mtree_mult1_7_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo1_mtree_mult1_7_shift0_q(15)) & u0_m0_wo1_mtree_mult1_7_shift0_q));
    u0_m0_wo1_mtree_mult1_7_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 13 => u0_m0_wo1_sym_add2_q(12)) & u0_m0_wo1_sym_add2_q));
    u0_m0_wo1_mtree_mult1_7_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_7_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_7_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_7_sub_1_a) - SIGNED(u0_m0_wo1_mtree_mult1_7_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_7_sub_1_q <= u0_m0_wo1_mtree_mult1_7_sub_1_o(16 downto 0);

    -- u0_m0_wo1_mtree_mult1_7_sub_3(SUB,423)@12 + 1
    u0_m0_wo1_mtree_mult1_7_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 17 => u0_m0_wo1_mtree_mult1_7_sub_1_q(16)) & u0_m0_wo1_mtree_mult1_7_sub_1_q));
    u0_m0_wo1_mtree_mult1_7_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo1_mtree_mult1_7_shift2_q(17)) & u0_m0_wo1_mtree_mult1_7_shift2_q));
    u0_m0_wo1_mtree_mult1_7_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_7_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_7_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_7_sub_3_a) - SIGNED(u0_m0_wo1_mtree_mult1_7_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_7_sub_3_q <= u0_m0_wo1_mtree_mult1_7_sub_3_o(18 downto 0);

    -- u0_m0_wo1_mtree_mult1_7_shift4(BITSHIFT,424)@13
    u0_m0_wo1_mtree_mult1_7_shift4_qint <= u0_m0_wo1_mtree_mult1_7_sub_3_q & "000";
    u0_m0_wo1_mtree_mult1_7_shift4_q <= u0_m0_wo1_mtree_mult1_7_shift4_qint(21 downto 0);

    -- u0_m0_wo1_sym_add3(ADD,149)@10 + 1
    u0_m0_wo1_sym_add3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr3_q(11)) & u0_m0_wo0_wi0_r0_delayr3_q));
    u0_m0_wo1_sym_add3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr16_q(11)) & u0_m0_wo0_wi0_r0_delayr16_q));
    u0_m0_wo1_sym_add3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_sym_add3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_sym_add3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_sym_add3_a) + SIGNED(u0_m0_wo1_sym_add3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_sym_add3_q <= u0_m0_wo1_sym_add3_o(12 downto 0);

    -- d_u0_m0_wo1_sym_add3_q_12(DELAY,947)@11 + 1
    d_u0_m0_wo1_sym_add3_q_12 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo1_sym_add3_q, xout => d_u0_m0_wo1_sym_add3_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_mtree_mult1_6_shift2(BITSHIFT,427)@12
    u0_m0_wo1_mtree_mult1_6_shift2_qint <= d_u0_m0_wo1_sym_add3_q_12_q & "000";
    u0_m0_wo1_mtree_mult1_6_shift2_q <= u0_m0_wo1_mtree_mult1_6_shift2_qint(15 downto 0);

    -- u0_m0_wo1_mtree_mult1_6_shift0(BITSHIFT,425)@11
    u0_m0_wo1_mtree_mult1_6_shift0_qint <= u0_m0_wo1_sym_add3_q & "0";
    u0_m0_wo1_mtree_mult1_6_shift0_q <= u0_m0_wo1_mtree_mult1_6_shift0_qint(13 downto 0);

    -- u0_m0_wo1_mtree_mult1_6_add_1(ADD,426)@11 + 1
    u0_m0_wo1_mtree_mult1_6_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => u0_m0_wo1_sym_add3_q(12)) & u0_m0_wo1_sym_add3_q));
    u0_m0_wo1_mtree_mult1_6_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo1_mtree_mult1_6_shift0_q(13)) & u0_m0_wo1_mtree_mult1_6_shift0_q));
    u0_m0_wo1_mtree_mult1_6_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_6_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_6_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_6_add_1_a) + SIGNED(u0_m0_wo1_mtree_mult1_6_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_6_add_1_q <= u0_m0_wo1_mtree_mult1_6_add_1_o(14 downto 0);

    -- u0_m0_wo1_mtree_mult1_6_add_3(ADD,428)@12 + 1
    u0_m0_wo1_mtree_mult1_6_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => u0_m0_wo1_mtree_mult1_6_add_1_q(14)) & u0_m0_wo1_mtree_mult1_6_add_1_q));
    u0_m0_wo1_mtree_mult1_6_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo1_mtree_mult1_6_shift2_q(15)) & u0_m0_wo1_mtree_mult1_6_shift2_q));
    u0_m0_wo1_mtree_mult1_6_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_6_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_6_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_6_add_3_a) + SIGNED(u0_m0_wo1_mtree_mult1_6_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_6_add_3_q <= u0_m0_wo1_mtree_mult1_6_add_3_o(16 downto 0);

    -- u0_m0_wo1_mtree_add0_3(ADD,169)@13 + 1
    u0_m0_wo1_mtree_add0_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 17 => u0_m0_wo1_mtree_mult1_6_add_3_q(16)) & u0_m0_wo1_mtree_mult1_6_add_3_q));
    u0_m0_wo1_mtree_add0_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo1_mtree_mult1_7_shift4_q(21)) & u0_m0_wo1_mtree_mult1_7_shift4_q));
    u0_m0_wo1_mtree_add0_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add0_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add0_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add0_3_a) + SIGNED(u0_m0_wo1_mtree_add0_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add0_3_q <= u0_m0_wo1_mtree_add0_3_o(22 downto 0);

    -- u0_m0_wo1_mtree_mult1_5_shift2(BITSHIFT,431)@11
    u0_m0_wo1_mtree_mult1_5_shift2_qint <= u0_m0_wo1_sym_add4_q & "000";
    u0_m0_wo1_mtree_mult1_5_shift2_q <= u0_m0_wo1_mtree_mult1_5_shift2_qint(15 downto 0);

    -- u0_m0_wo1_sym_add4(ADD,150)@10 + 1
    u0_m0_wo1_sym_add4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr4_q(11)) & u0_m0_wo0_wi0_r0_delayr4_q));
    u0_m0_wo1_sym_add4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr15_q(11)) & u0_m0_wo0_wi0_r0_delayr15_q));
    u0_m0_wo1_sym_add4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_sym_add4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_sym_add4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_sym_add4_a) + SIGNED(u0_m0_wo1_sym_add4_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_sym_add4_q <= u0_m0_wo1_sym_add4_o(12 downto 0);

    -- u0_m0_wo1_mtree_mult1_5_add_3(ADD,432)@11 + 1
    u0_m0_wo1_mtree_mult1_5_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 13 => u0_m0_wo1_sym_add4_q(12)) & u0_m0_wo1_sym_add4_q));
    u0_m0_wo1_mtree_mult1_5_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo1_mtree_mult1_5_shift2_q(15)) & u0_m0_wo1_mtree_mult1_5_shift2_q));
    u0_m0_wo1_mtree_mult1_5_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_5_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_5_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_5_add_3_a) + SIGNED(u0_m0_wo1_mtree_mult1_5_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_5_add_3_q <= u0_m0_wo1_mtree_mult1_5_add_3_o(16 downto 0);

    -- u0_m0_wo1_mtree_mult1_5_shift4(BITSHIFT,433)@12
    u0_m0_wo1_mtree_mult1_5_shift4_qint <= u0_m0_wo1_mtree_mult1_5_add_3_q & "000";
    u0_m0_wo1_mtree_mult1_5_shift4_q <= u0_m0_wo1_mtree_mult1_5_shift4_qint(19 downto 0);

    -- u0_m0_wo1_mtree_mult1_5_shift0(BITSHIFT,429)@11
    u0_m0_wo1_mtree_mult1_5_shift0_qint <= u0_m0_wo1_sym_add4_q & "0";
    u0_m0_wo1_mtree_mult1_5_shift0_q <= u0_m0_wo1_mtree_mult1_5_shift0_qint(13 downto 0);

    -- u0_m0_wo1_mtree_mult1_5_add_1(ADD,430)@11 + 1
    u0_m0_wo1_mtree_mult1_5_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => u0_m0_wo1_sym_add4_q(12)) & u0_m0_wo1_sym_add4_q));
    u0_m0_wo1_mtree_mult1_5_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo1_mtree_mult1_5_shift0_q(13)) & u0_m0_wo1_mtree_mult1_5_shift0_q));
    u0_m0_wo1_mtree_mult1_5_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_5_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_5_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_5_add_1_a) + SIGNED(u0_m0_wo1_mtree_mult1_5_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_5_add_1_q <= u0_m0_wo1_mtree_mult1_5_add_1_o(14 downto 0);

    -- u0_m0_wo1_mtree_mult1_5_add_5(ADD,434)@12 + 1
    u0_m0_wo1_mtree_mult1_5_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 15 => u0_m0_wo1_mtree_mult1_5_add_1_q(14)) & u0_m0_wo1_mtree_mult1_5_add_1_q));
    u0_m0_wo1_mtree_mult1_5_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo1_mtree_mult1_5_shift4_q(19)) & u0_m0_wo1_mtree_mult1_5_shift4_q));
    u0_m0_wo1_mtree_mult1_5_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_5_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_5_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_5_add_5_a) + SIGNED(u0_m0_wo1_mtree_mult1_5_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_5_add_5_q <= u0_m0_wo1_mtree_mult1_5_add_5_o(20 downto 0);

    -- u0_m0_wo1_mtree_mult1_5_shift6(BITSHIFT,435)@13
    u0_m0_wo1_mtree_mult1_5_shift6_qint <= u0_m0_wo1_mtree_mult1_5_add_5_q & "00";
    u0_m0_wo1_mtree_mult1_5_shift6_q <= u0_m0_wo1_mtree_mult1_5_shift6_qint(22 downto 0);

    -- u0_m0_wo1_mtree_mult1_4_shift2(BITSHIFT,438)@11
    u0_m0_wo1_mtree_mult1_4_shift2_qint <= u0_m0_wo1_sym_add5_q & "00";
    u0_m0_wo1_mtree_mult1_4_shift2_q <= u0_m0_wo1_mtree_mult1_4_shift2_qint(14 downto 0);

    -- u0_m0_wo1_sym_add5(ADD,151)@10 + 1
    u0_m0_wo1_sym_add5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr5_q(11)) & u0_m0_wo0_wi0_r0_delayr5_q));
    u0_m0_wo1_sym_add5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr14_q(11)) & u0_m0_wo0_wi0_r0_delayr14_q));
    u0_m0_wo1_sym_add5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_sym_add5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_sym_add5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_sym_add5_a) + SIGNED(u0_m0_wo1_sym_add5_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_sym_add5_q <= u0_m0_wo1_sym_add5_o(12 downto 0);

    -- u0_m0_wo1_mtree_mult1_4_add_3(ADD,439)@11 + 1
    u0_m0_wo1_mtree_mult1_4_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 13 => u0_m0_wo1_sym_add5_q(12)) & u0_m0_wo1_sym_add5_q));
    u0_m0_wo1_mtree_mult1_4_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo1_mtree_mult1_4_shift2_q(14)) & u0_m0_wo1_mtree_mult1_4_shift2_q));
    u0_m0_wo1_mtree_mult1_4_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_4_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_4_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_4_add_3_a) + SIGNED(u0_m0_wo1_mtree_mult1_4_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_4_add_3_q <= u0_m0_wo1_mtree_mult1_4_add_3_o(15 downto 0);

    -- u0_m0_wo1_mtree_mult1_4_shift4(BITSHIFT,440)@12
    u0_m0_wo1_mtree_mult1_4_shift4_qint <= u0_m0_wo1_mtree_mult1_4_add_3_q & "000000";
    u0_m0_wo1_mtree_mult1_4_shift4_q <= u0_m0_wo1_mtree_mult1_4_shift4_qint(21 downto 0);

    -- u0_m0_wo1_mtree_mult1_4_shift0(BITSHIFT,436)@11
    u0_m0_wo1_mtree_mult1_4_shift0_qint <= u0_m0_wo1_sym_add5_q & "000";
    u0_m0_wo1_mtree_mult1_4_shift0_q <= u0_m0_wo1_mtree_mult1_4_shift0_qint(15 downto 0);

    -- u0_m0_wo1_mtree_mult1_4_add_1(ADD,437)@11 + 1
    u0_m0_wo1_mtree_mult1_4_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 13 => u0_m0_wo1_sym_add5_q(12)) & u0_m0_wo1_sym_add5_q));
    u0_m0_wo1_mtree_mult1_4_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo1_mtree_mult1_4_shift0_q(15)) & u0_m0_wo1_mtree_mult1_4_shift0_q));
    u0_m0_wo1_mtree_mult1_4_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_4_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_4_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_4_add_1_a) + SIGNED(u0_m0_wo1_mtree_mult1_4_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_4_add_1_q <= u0_m0_wo1_mtree_mult1_4_add_1_o(16 downto 0);

    -- u0_m0_wo1_mtree_mult1_4_sub_5(SUB,441)@12 + 1
    u0_m0_wo1_mtree_mult1_4_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 17 => u0_m0_wo1_mtree_mult1_4_add_1_q(16)) & u0_m0_wo1_mtree_mult1_4_add_1_q));
    u0_m0_wo1_mtree_mult1_4_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo1_mtree_mult1_4_shift4_q(21)) & u0_m0_wo1_mtree_mult1_4_shift4_q));
    u0_m0_wo1_mtree_mult1_4_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_4_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_4_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_4_sub_5_a) - SIGNED(u0_m0_wo1_mtree_mult1_4_sub_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_4_sub_5_q <= u0_m0_wo1_mtree_mult1_4_sub_5_o(22 downto 0);

    -- u0_m0_wo1_mtree_mult1_4_shift6(BITSHIFT,442)@13
    u0_m0_wo1_mtree_mult1_4_shift6_qint <= u0_m0_wo1_mtree_mult1_4_sub_5_q & "0";
    u0_m0_wo1_mtree_mult1_4_shift6_q <= u0_m0_wo1_mtree_mult1_4_shift6_qint(23 downto 0);

    -- u0_m0_wo1_mtree_add0_2(ADD,168)@13 + 1
    u0_m0_wo1_mtree_add0_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo1_mtree_mult1_4_shift6_q(23)) & u0_m0_wo1_mtree_mult1_4_shift6_q));
    u0_m0_wo1_mtree_add0_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => u0_m0_wo1_mtree_mult1_5_shift6_q(22)) & u0_m0_wo1_mtree_mult1_5_shift6_q));
    u0_m0_wo1_mtree_add0_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add0_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add0_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add0_2_a) + SIGNED(u0_m0_wo1_mtree_add0_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add0_2_q <= u0_m0_wo1_mtree_add0_2_o(24 downto 0);

    -- u0_m0_wo1_mtree_add1_1(ADD,172)@14 + 1
    u0_m0_wo1_mtree_add1_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo1_mtree_add0_2_q(24)) & u0_m0_wo1_mtree_add0_2_q));
    u0_m0_wo1_mtree_add1_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 23 => u0_m0_wo1_mtree_add0_3_q(22)) & u0_m0_wo1_mtree_add0_3_q));
    u0_m0_wo1_mtree_add1_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add1_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add1_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add1_1_a) + SIGNED(u0_m0_wo1_mtree_add1_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add1_1_q <= u0_m0_wo1_mtree_add1_1_o(25 downto 0);

    -- u0_m0_wo1_sym_add6(ADD,152)@10 + 1
    u0_m0_wo1_sym_add6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr6_q(11)) & u0_m0_wo0_wi0_r0_delayr6_q));
    u0_m0_wo1_sym_add6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr13_q(11)) & u0_m0_wo0_wi0_r0_delayr13_q));
    u0_m0_wo1_sym_add6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_sym_add6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_sym_add6_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_sym_add6_a) + SIGNED(u0_m0_wo1_sym_add6_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_sym_add6_q <= u0_m0_wo1_sym_add6_o(12 downto 0);

    -- u0_m0_wo1_cm6(CONSTANT,142)@0
    u0_m0_wo1_cm6_q <= "01011010100";

    -- u0_m0_wo1_mtree_mult1_3(MULT,162)@11 + 2
    u0_m0_wo1_mtree_mult1_3_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm6_q);
    u0_m0_wo1_mtree_mult1_3_b0 <= STD_LOGIC_VECTOR(u0_m0_wo1_sym_add6_q);
    u0_m0_wo1_mtree_mult1_3_reset <= areset;
    u0_m0_wo1_mtree_mult1_3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 11,
        lpm_widthb => 13,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo1_mtree_mult1_3_a0,
        datab => u0_m0_wo1_mtree_mult1_3_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo1_mtree_mult1_3_reset,
        clock => clk,
        result => u0_m0_wo1_mtree_mult1_3_s1
    );
    u0_m0_wo1_mtree_mult1_3_q <= u0_m0_wo1_mtree_mult1_3_s1;

    -- u0_m0_wo1_mtree_mult1_2_shift2(BITSHIFT,454)@11
    u0_m0_wo1_mtree_mult1_2_shift2_qint <= u0_m0_wo1_sym_add7_q & "00";
    u0_m0_wo1_mtree_mult1_2_shift2_q <= u0_m0_wo1_mtree_mult1_2_shift2_qint(14 downto 0);

    -- u0_m0_wo1_sym_add7(ADD,153)@10 + 1
    u0_m0_wo1_sym_add7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr7_q(11)) & u0_m0_wo0_wi0_r0_delayr7_q));
    u0_m0_wo1_sym_add7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr12_q(11)) & u0_m0_wo0_wi0_r0_delayr12_q));
    u0_m0_wo1_sym_add7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_sym_add7_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_sym_add7_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_sym_add7_a) + SIGNED(u0_m0_wo1_sym_add7_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_sym_add7_q <= u0_m0_wo1_sym_add7_o(12 downto 0);

    -- u0_m0_wo1_mtree_mult1_2_add_3(ADD,455)@11 + 1
    u0_m0_wo1_mtree_mult1_2_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 13 => u0_m0_wo1_sym_add7_q(12)) & u0_m0_wo1_sym_add7_q));
    u0_m0_wo1_mtree_mult1_2_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo1_mtree_mult1_2_shift2_q(14)) & u0_m0_wo1_mtree_mult1_2_shift2_q));
    u0_m0_wo1_mtree_mult1_2_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_2_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_2_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_2_add_3_a) + SIGNED(u0_m0_wo1_mtree_mult1_2_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_2_add_3_q <= u0_m0_wo1_mtree_mult1_2_add_3_o(15 downto 0);

    -- u0_m0_wo1_mtree_mult1_2_shift4(BITSHIFT,456)@12
    u0_m0_wo1_mtree_mult1_2_shift4_qint <= u0_m0_wo1_mtree_mult1_2_add_3_q & "00000";
    u0_m0_wo1_mtree_mult1_2_shift4_q <= u0_m0_wo1_mtree_mult1_2_shift4_qint(20 downto 0);

    -- u0_m0_wo1_mtree_mult1_2_shift0(BITSHIFT,452)@11
    u0_m0_wo1_mtree_mult1_2_shift0_qint <= u0_m0_wo1_sym_add7_q & "00";
    u0_m0_wo1_mtree_mult1_2_shift0_q <= u0_m0_wo1_mtree_mult1_2_shift0_qint(14 downto 0);

    -- u0_m0_wo1_mtree_mult1_2_sub_1(SUB,453)@11 + 1
    u0_m0_wo1_mtree_mult1_2_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo1_mtree_mult1_2_shift0_q(14)) & u0_m0_wo1_mtree_mult1_2_shift0_q));
    u0_m0_wo1_mtree_mult1_2_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 13 => u0_m0_wo1_sym_add7_q(12)) & u0_m0_wo1_sym_add7_q));
    u0_m0_wo1_mtree_mult1_2_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_2_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_2_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_2_sub_1_a) - SIGNED(u0_m0_wo1_mtree_mult1_2_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_2_sub_1_q <= u0_m0_wo1_mtree_mult1_2_sub_1_o(15 downto 0);

    -- u0_m0_wo1_mtree_mult1_2_sub_5(SUB,457)@12 + 1
    u0_m0_wo1_mtree_mult1_2_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 16 => u0_m0_wo1_mtree_mult1_2_sub_1_q(15)) & u0_m0_wo1_mtree_mult1_2_sub_1_q));
    u0_m0_wo1_mtree_mult1_2_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo1_mtree_mult1_2_shift4_q(20)) & u0_m0_wo1_mtree_mult1_2_shift4_q));
    u0_m0_wo1_mtree_mult1_2_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_2_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_2_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_2_sub_5_a) - SIGNED(u0_m0_wo1_mtree_mult1_2_sub_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_2_sub_5_q <= u0_m0_wo1_mtree_mult1_2_sub_5_o(21 downto 0);

    -- u0_m0_wo1_mtree_mult1_2_shift6(BITSHIFT,458)@13
    u0_m0_wo1_mtree_mult1_2_shift6_qint <= u0_m0_wo1_mtree_mult1_2_sub_5_q & "0";
    u0_m0_wo1_mtree_mult1_2_shift6_q <= u0_m0_wo1_mtree_mult1_2_shift6_qint(22 downto 0);

    -- u0_m0_wo1_mtree_add0_1(ADD,167)@13 + 1
    u0_m0_wo1_mtree_add0_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => u0_m0_wo1_mtree_mult1_2_shift6_q(22)) & u0_m0_wo1_mtree_mult1_2_shift6_q));
    u0_m0_wo1_mtree_add0_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo1_mtree_mult1_3_q(23)) & u0_m0_wo1_mtree_mult1_3_q));
    u0_m0_wo1_mtree_add0_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add0_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add0_1_a) + SIGNED(u0_m0_wo1_mtree_add0_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add0_1_q <= u0_m0_wo1_mtree_add0_1_o(24 downto 0);

    -- u0_m0_wo1_sym_add8(ADD,154)@10 + 1
    u0_m0_wo1_sym_add8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr8_q(11)) & u0_m0_wo0_wi0_r0_delayr8_q));
    u0_m0_wo1_sym_add8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr11_q(11)) & u0_m0_wo0_wi0_r0_delayr11_q));
    u0_m0_wo1_sym_add8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_sym_add8_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_sym_add8_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_sym_add8_a) + SIGNED(u0_m0_wo1_sym_add8_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_sym_add8_q <= u0_m0_wo1_sym_add8_o(12 downto 0);

    -- d_u0_m0_wo1_sym_add8_q_12(DELAY,948)@11 + 1
    d_u0_m0_wo1_sym_add8_q_12 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo1_sym_add8_q, xout => d_u0_m0_wo1_sym_add8_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_mtree_mult1_1_shift2(BITSHIFT,461)@12
    u0_m0_wo1_mtree_mult1_1_shift2_qint <= d_u0_m0_wo1_sym_add8_q_12_q & "000000000";
    u0_m0_wo1_mtree_mult1_1_shift2_q <= u0_m0_wo1_mtree_mult1_1_shift2_qint(21 downto 0);

    -- u0_m0_wo1_mtree_mult1_1_shift0(BITSHIFT,459)@11
    u0_m0_wo1_mtree_mult1_1_shift0_qint <= u0_m0_wo1_sym_add8_q & "0000";
    u0_m0_wo1_mtree_mult1_1_shift0_q <= u0_m0_wo1_mtree_mult1_1_shift0_qint(16 downto 0);

    -- u0_m0_wo1_mtree_mult1_1_sub_1(SUB,460)@11 + 1
    u0_m0_wo1_mtree_mult1_1_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 13 => u0_m0_wo1_sym_add8_q(12)) & u0_m0_wo1_sym_add8_q));
    u0_m0_wo1_mtree_mult1_1_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo1_mtree_mult1_1_shift0_q(16)) & u0_m0_wo1_mtree_mult1_1_shift0_q));
    u0_m0_wo1_mtree_mult1_1_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_1_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_1_sub_1_a) - SIGNED(u0_m0_wo1_mtree_mult1_1_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_1_sub_1_q <= u0_m0_wo1_mtree_mult1_1_sub_1_o(17 downto 0);

    -- u0_m0_wo1_mtree_mult1_1_sub_3(SUB,462)@12 + 1
    u0_m0_wo1_mtree_mult1_1_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 18 => u0_m0_wo1_mtree_mult1_1_sub_1_q(17)) & u0_m0_wo1_mtree_mult1_1_sub_1_q));
    u0_m0_wo1_mtree_mult1_1_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo1_mtree_mult1_1_shift2_q(21)) & u0_m0_wo1_mtree_mult1_1_shift2_q));
    u0_m0_wo1_mtree_mult1_1_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_1_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_1_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_1_sub_3_a) - SIGNED(u0_m0_wo1_mtree_mult1_1_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_1_sub_3_q <= u0_m0_wo1_mtree_mult1_1_sub_3_o(22 downto 0);

    -- u0_m0_wo1_mtree_mult1_1_shift4(BITSHIFT,463)@13
    u0_m0_wo1_mtree_mult1_1_shift4_qint <= u0_m0_wo1_mtree_mult1_1_sub_3_q & "0";
    u0_m0_wo1_mtree_mult1_1_shift4_q <= u0_m0_wo1_mtree_mult1_1_shift4_qint(23 downto 0);

    -- u0_m0_wo1_sym_add9(ADD,155)@10 + 1
    u0_m0_wo1_sym_add9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr9_q(11)) & u0_m0_wo0_wi0_r0_delayr9_q));
    u0_m0_wo1_sym_add9_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_wi0_r0_delayr10_q(11)) & u0_m0_wo0_wi0_r0_delayr10_q));
    u0_m0_wo1_sym_add9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_sym_add9_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_sym_add9_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_sym_add9_a) + SIGNED(u0_m0_wo1_sym_add9_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_sym_add9_q <= u0_m0_wo1_sym_add9_o(12 downto 0);

    -- u0_m0_wo1_cm9(CONSTANT,145)@0
    u0_m0_wo1_cm9_q <= "01100101100001";

    -- u0_m0_wo1_mtree_mult1_0(MULT,165)@11 + 2
    u0_m0_wo1_mtree_mult1_0_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm9_q);
    u0_m0_wo1_mtree_mult1_0_b0 <= STD_LOGIC_VECTOR(u0_m0_wo1_sym_add9_q);
    u0_m0_wo1_mtree_mult1_0_reset <= areset;
    u0_m0_wo1_mtree_mult1_0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 14,
        lpm_widthb => 13,
        lpm_widthp => 27,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo1_mtree_mult1_0_a0,
        datab => u0_m0_wo1_mtree_mult1_0_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo1_mtree_mult1_0_reset,
        clock => clk,
        result => u0_m0_wo1_mtree_mult1_0_s1
    );
    u0_m0_wo1_mtree_mult1_0_q <= u0_m0_wo1_mtree_mult1_0_s1;

    -- u0_m0_wo1_mtree_add0_0(ADD,166)@13 + 1
    u0_m0_wo1_mtree_add0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo1_mtree_mult1_0_q(26)) & u0_m0_wo1_mtree_mult1_0_q));
    u0_m0_wo1_mtree_add0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 24 => u0_m0_wo1_mtree_mult1_1_shift4_q(23)) & u0_m0_wo1_mtree_mult1_1_shift4_q));
    u0_m0_wo1_mtree_add0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add0_0_a) + SIGNED(u0_m0_wo1_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add0_0_q <= u0_m0_wo1_mtree_add0_0_o(27 downto 0);

    -- u0_m0_wo1_mtree_add1_0(ADD,171)@14 + 1
    u0_m0_wo1_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo1_mtree_add0_0_q(27)) & u0_m0_wo1_mtree_add0_0_q));
    u0_m0_wo1_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 25 => u0_m0_wo1_mtree_add0_1_q(24)) & u0_m0_wo1_mtree_add0_1_q));
    u0_m0_wo1_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add1_0_a) + SIGNED(u0_m0_wo1_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add1_0_q <= u0_m0_wo1_mtree_add1_0_o(28 downto 0);

    -- u0_m0_wo1_mtree_add2_0(ADD,173)@15 + 1
    u0_m0_wo1_mtree_add2_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo1_mtree_add1_0_q(28)) & u0_m0_wo1_mtree_add1_0_q));
    u0_m0_wo1_mtree_add2_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 26 => u0_m0_wo1_mtree_add1_1_q(25)) & u0_m0_wo1_mtree_add1_1_q));
    u0_m0_wo1_mtree_add2_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add2_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add2_0_a) + SIGNED(u0_m0_wo1_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add2_0_q <= u0_m0_wo1_mtree_add2_0_o(29 downto 0);

    -- u0_m0_wo1_mtree_add3_0(ADD,174)@16 + 1
    u0_m0_wo1_mtree_add3_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo1_mtree_add2_0_q(29)) & u0_m0_wo1_mtree_add2_0_q));
    u0_m0_wo1_mtree_add3_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 24 => u0_m0_wo1_mtree_add0_4_q(23)) & u0_m0_wo1_mtree_add0_4_q));
    u0_m0_wo1_mtree_add3_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add3_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add3_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add3_0_a) + SIGNED(u0_m0_wo1_mtree_add3_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add3_0_q <= u0_m0_wo1_mtree_add3_0_o(30 downto 0);

    -- u0_m0_wo0_mtree_mult1_19_shift0(BITSHIFT,283)@12
    u0_m0_wo0_mtree_mult1_19_shift0_qint <= d_u0_m0_wo0_wi0_r0_phasedelay0_q_12_q & "000";
    u0_m0_wo0_mtree_mult1_19_shift0_q <= u0_m0_wo0_mtree_mult1_19_shift0_qint(14 downto 0);

    -- u0_m0_wo0_mtree_mult1_19_add_1(ADD,284)@12 + 1
    u0_m0_wo0_mtree_mult1_19_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 12 => d_u0_m0_wo0_wi0_r0_phasedelay0_q_12_q(11)) & d_u0_m0_wo0_wi0_r0_phasedelay0_q_12_q));
    u0_m0_wo0_mtree_mult1_19_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo0_mtree_mult1_19_shift0_q(14)) & u0_m0_wo0_mtree_mult1_19_shift0_q));
    u0_m0_wo0_mtree_mult1_19_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_19_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_19_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_19_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_19_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_19_add_1_q <= u0_m0_wo0_mtree_mult1_19_add_1_o(15 downto 0);

    -- u0_m0_wo0_mtree_mult1_19_shift2(BITSHIFT,285)@13
    u0_m0_wo0_mtree_mult1_19_shift2_qint <= d_u0_m0_wo0_wi0_r0_phasedelay0_q_13_q & "00000";
    u0_m0_wo0_mtree_mult1_19_shift2_q <= u0_m0_wo0_mtree_mult1_19_shift2_qint(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_19_sub_3(SUB,286)@13 + 1
    u0_m0_wo0_mtree_mult1_19_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo0_mtree_mult1_19_shift2_q(16)) & u0_m0_wo0_mtree_mult1_19_shift2_q));
    u0_m0_wo0_mtree_mult1_19_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => u0_m0_wo0_mtree_mult1_19_add_1_q(15)) & u0_m0_wo0_mtree_mult1_19_add_1_q));
    u0_m0_wo0_mtree_mult1_19_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_19_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_19_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_19_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_19_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_19_sub_3_q <= u0_m0_wo0_mtree_mult1_19_sub_3_o(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_19_shift4(BITSHIFT,287)@14
    u0_m0_wo0_mtree_mult1_19_shift4_qint <= u0_m0_wo0_mtree_mult1_19_sub_3_q & "0";
    u0_m0_wo0_mtree_mult1_19_shift4_q <= u0_m0_wo0_mtree_mult1_19_shift4_qint(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_18(MULT,63)@12 + 2
    u0_m0_wo0_mtree_mult1_18_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm1_q);
    u0_m0_wo0_mtree_mult1_18_b0 <= STD_LOGIC_VECTOR(d_u0_m0_wo0_wi0_r0_delayr1_q_12_q);
    u0_m0_wo0_mtree_mult1_18_reset <= areset;
    u0_m0_wo0_mtree_mult1_18_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 10,
        lpm_widthb => 12,
        lpm_widthp => 22,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_18_a0,
        datab => u0_m0_wo0_mtree_mult1_18_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_18_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_18_s1
    );
    u0_m0_wo0_mtree_mult1_18_q <= u0_m0_wo0_mtree_mult1_18_s1;

    -- u0_m0_wo0_mtree_add0_9(ADD,91)@14 + 1
    u0_m0_wo0_mtree_add0_9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo0_mtree_mult1_18_q(21)) & u0_m0_wo0_mtree_mult1_18_q));
    u0_m0_wo0_mtree_add0_9_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 19 => u0_m0_wo0_mtree_mult1_19_shift4_q(18)) & u0_m0_wo0_mtree_mult1_19_shift4_q));
    u0_m0_wo0_mtree_add0_9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_9_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_9_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_9_a) + SIGNED(u0_m0_wo0_mtree_add0_9_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_9_q <= u0_m0_wo0_mtree_add0_9_o(22 downto 0);

    -- u0_m0_wo0_mtree_mult1_17_shift0(BITSHIFT,296)@13
    u0_m0_wo0_mtree_mult1_17_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr2_q_13_q & "0";
    u0_m0_wo0_mtree_mult1_17_shift0_q <= u0_m0_wo0_mtree_mult1_17_shift0_qint(12 downto 0);

    -- d_u0_m0_wo0_wi0_r0_delayr2_q_13(DELAY,930)@12 + 1
    d_u0_m0_wo0_wi0_r0_delayr2_q_13 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr2_q_12_q, xout => d_u0_m0_wo0_wi0_r0_delayr2_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_17_add_1(ADD,297)@13 + 1
    u0_m0_wo0_mtree_mult1_17_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => d_u0_m0_wo0_wi0_r0_delayr2_q_13_q(11)) & d_u0_m0_wo0_wi0_r0_delayr2_q_13_q));
    u0_m0_wo0_mtree_mult1_17_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 13 => u0_m0_wo0_mtree_mult1_17_shift0_q(12)) & u0_m0_wo0_mtree_mult1_17_shift0_q));
    u0_m0_wo0_mtree_mult1_17_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_17_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_17_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_17_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_17_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_17_add_1_q <= u0_m0_wo0_mtree_mult1_17_add_1_o(13 downto 0);

    -- u0_m0_wo0_mtree_mult1_17_shift2(BITSHIFT,298)@14
    u0_m0_wo0_mtree_mult1_17_shift2_qint <= u0_m0_wo0_mtree_mult1_17_add_1_q & "00";
    u0_m0_wo0_mtree_mult1_17_shift2_q <= u0_m0_wo0_mtree_mult1_17_shift2_qint(15 downto 0);

    -- u0_m0_wo0_mtree_mult1_16_shift2(BITSHIFT,301)@13
    u0_m0_wo0_mtree_mult1_16_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr3_q_13_q & "000000";
    u0_m0_wo0_mtree_mult1_16_shift2_q <= u0_m0_wo0_mtree_mult1_16_shift2_qint(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_16_shift0(BITSHIFT,299)@12
    u0_m0_wo0_mtree_mult1_16_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr3_q_12_q & "000";
    u0_m0_wo0_mtree_mult1_16_shift0_q <= u0_m0_wo0_mtree_mult1_16_shift0_qint(14 downto 0);

    -- u0_m0_wo0_mtree_mult1_16_sub_1(SUB,300)@12 + 1
    u0_m0_wo0_mtree_mult1_16_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo0_mtree_mult1_16_shift0_q(14)) & u0_m0_wo0_mtree_mult1_16_shift0_q));
    u0_m0_wo0_mtree_mult1_16_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 12 => d_u0_m0_wo0_wi0_r0_delayr3_q_12_q(11)) & d_u0_m0_wo0_wi0_r0_delayr3_q_12_q));
    u0_m0_wo0_mtree_mult1_16_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_16_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_16_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_16_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_16_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_16_sub_1_q <= u0_m0_wo0_mtree_mult1_16_sub_1_o(15 downto 0);

    -- u0_m0_wo0_mtree_mult1_16_sub_3(SUB,302)@13 + 1
    u0_m0_wo0_mtree_mult1_16_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => u0_m0_wo0_mtree_mult1_16_sub_1_q(15)) & u0_m0_wo0_mtree_mult1_16_sub_1_q));
    u0_m0_wo0_mtree_mult1_16_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_mult1_16_shift2_q(17)) & u0_m0_wo0_mtree_mult1_16_shift2_q));
    u0_m0_wo0_mtree_mult1_16_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_16_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_16_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_16_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_16_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_16_sub_3_q <= u0_m0_wo0_mtree_mult1_16_sub_3_o(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_16_shift4(BITSHIFT,303)@14
    u0_m0_wo0_mtree_mult1_16_shift4_qint <= u0_m0_wo0_mtree_mult1_16_sub_3_q & "00";
    u0_m0_wo0_mtree_mult1_16_shift4_q <= u0_m0_wo0_mtree_mult1_16_shift4_qint(20 downto 0);

    -- u0_m0_wo0_mtree_add0_8(ADD,90)@14 + 1
    u0_m0_wo0_mtree_add0_8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo0_mtree_mult1_16_shift4_q(20)) & u0_m0_wo0_mtree_mult1_16_shift4_q));
    u0_m0_wo0_mtree_add0_8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 16 => u0_m0_wo0_mtree_mult1_17_shift2_q(15)) & u0_m0_wo0_mtree_mult1_17_shift2_q));
    u0_m0_wo0_mtree_add0_8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_8_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_8_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_8_a) + SIGNED(u0_m0_wo0_mtree_add0_8_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_8_q <= u0_m0_wo0_mtree_add0_8_o(21 downto 0);

    -- u0_m0_wo0_mtree_add1_4(ADD,96)@15 + 1
    u0_m0_wo0_mtree_add1_4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 22 => u0_m0_wo0_mtree_add0_8_q(21)) & u0_m0_wo0_mtree_add0_8_q));
    u0_m0_wo0_mtree_add1_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo0_mtree_add0_9_q(22)) & u0_m0_wo0_mtree_add0_9_q));
    u0_m0_wo0_mtree_add1_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_4_a) + SIGNED(u0_m0_wo0_mtree_add1_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_4_q <= u0_m0_wo0_mtree_add1_4_o(23 downto 0);

    -- u0_m0_wo0_mtree_mult1_15(MULT,66)@10 + 2
    u0_m0_wo0_mtree_mult1_15_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm4_q);
    u0_m0_wo0_mtree_mult1_15_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr4_q);
    u0_m0_wo0_mtree_mult1_15_reset <= areset;
    u0_m0_wo0_mtree_mult1_15_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 10,
        lpm_widthb => 12,
        lpm_widthp => 22,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_15_a0,
        datab => u0_m0_wo0_mtree_mult1_15_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_15_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_15_s1
    );
    u0_m0_wo0_mtree_mult1_15_q <= u0_m0_wo0_mtree_mult1_15_s1;

    -- u0_m0_wo0_mtree_mult1_14_shift2(BITSHIFT,315)@10
    u0_m0_wo0_mtree_mult1_14_shift2_qint <= u0_m0_wo0_wi0_r0_delayr5_q & "000";
    u0_m0_wo0_mtree_mult1_14_shift2_q <= u0_m0_wo0_mtree_mult1_14_shift2_qint(14 downto 0);

    -- u0_m0_wo0_mtree_mult1_14_sub_3(SUB,316)@10 + 1
    u0_m0_wo0_mtree_mult1_14_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 12 => u0_m0_wo0_wi0_r0_delayr5_q(11)) & u0_m0_wo0_wi0_r0_delayr5_q));
    u0_m0_wo0_mtree_mult1_14_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo0_mtree_mult1_14_shift2_q(14)) & u0_m0_wo0_mtree_mult1_14_shift2_q));
    u0_m0_wo0_mtree_mult1_14_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_14_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_14_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_14_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_14_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_14_sub_3_q <= u0_m0_wo0_mtree_mult1_14_sub_3_o(15 downto 0);

    -- u0_m0_wo0_mtree_mult1_14_shift4(BITSHIFT,317)@11
    u0_m0_wo0_mtree_mult1_14_shift4_qint <= u0_m0_wo0_mtree_mult1_14_sub_3_q & "000000";
    u0_m0_wo0_mtree_mult1_14_shift4_q <= u0_m0_wo0_mtree_mult1_14_shift4_qint(21 downto 0);

    -- u0_m0_wo0_mtree_mult1_14_shift0(BITSHIFT,313)@10
    u0_m0_wo0_mtree_mult1_14_shift0_qint <= u0_m0_wo0_wi0_r0_delayr5_q & "00";
    u0_m0_wo0_mtree_mult1_14_shift0_q <= u0_m0_wo0_mtree_mult1_14_shift0_qint(13 downto 0);

    -- u0_m0_wo0_mtree_mult1_14_sub_1(SUB,314)@10 + 1
    u0_m0_wo0_mtree_mult1_14_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo0_mtree_mult1_14_shift0_q(13)) & u0_m0_wo0_mtree_mult1_14_shift0_q));
    u0_m0_wo0_mtree_mult1_14_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => u0_m0_wo0_wi0_r0_delayr5_q(11)) & u0_m0_wo0_wi0_r0_delayr5_q));
    u0_m0_wo0_mtree_mult1_14_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_14_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_14_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_14_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_14_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_14_sub_1_q <= u0_m0_wo0_mtree_mult1_14_sub_1_o(14 downto 0);

    -- u0_m0_wo0_mtree_mult1_14_add_5(ADD,318)@11 + 1
    u0_m0_wo0_mtree_mult1_14_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 15 => u0_m0_wo0_mtree_mult1_14_sub_1_q(14)) & u0_m0_wo0_mtree_mult1_14_sub_1_q));
    u0_m0_wo0_mtree_mult1_14_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo0_mtree_mult1_14_shift4_q(21)) & u0_m0_wo0_mtree_mult1_14_shift4_q));
    u0_m0_wo0_mtree_mult1_14_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_14_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_14_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_14_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_14_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_14_add_5_q <= u0_m0_wo0_mtree_mult1_14_add_5_o(22 downto 0);

    -- u0_m0_wo0_mtree_add0_7(ADD,89)@12 + 1
    u0_m0_wo0_mtree_add0_7_a <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_14_add_5_q);
    u0_m0_wo0_mtree_add0_7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo0_mtree_mult1_15_q(21)) & u0_m0_wo0_mtree_mult1_15_q));
    u0_m0_wo0_mtree_add0_7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_7_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_7_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_7_a) + SIGNED(u0_m0_wo0_mtree_add0_7_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_7_q <= u0_m0_wo0_mtree_add0_7_o(22 downto 0);

    -- d_u0_m0_wo0_wi0_r0_delayr6_q_11(DELAY,934)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr6_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr6_q, xout => d_u0_m0_wo0_wi0_r0_delayr6_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_13_shift2(BITSHIFT,321)@11
    u0_m0_wo0_mtree_mult1_13_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr6_q_11_q & "0000000";
    u0_m0_wo0_mtree_mult1_13_shift2_q <= u0_m0_wo0_mtree_mult1_13_shift2_qint(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_13_shift0(BITSHIFT,319)@10
    u0_m0_wo0_mtree_mult1_13_shift0_qint <= u0_m0_wo0_wi0_r0_delayr6_q & "0";
    u0_m0_wo0_mtree_mult1_13_shift0_q <= u0_m0_wo0_mtree_mult1_13_shift0_qint(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_13_add_1(ADD,320)@10 + 1
    u0_m0_wo0_mtree_mult1_13_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => u0_m0_wo0_wi0_r0_delayr6_q(11)) & u0_m0_wo0_wi0_r0_delayr6_q));
    u0_m0_wo0_mtree_mult1_13_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 13 => u0_m0_wo0_mtree_mult1_13_shift0_q(12)) & u0_m0_wo0_mtree_mult1_13_shift0_q));
    u0_m0_wo0_mtree_mult1_13_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_13_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_13_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_13_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_13_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_13_add_1_q <= u0_m0_wo0_mtree_mult1_13_add_1_o(13 downto 0);

    -- u0_m0_wo0_mtree_mult1_13_add_3(ADD,322)@11 + 1
    u0_m0_wo0_mtree_mult1_13_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 14 => u0_m0_wo0_mtree_mult1_13_add_1_q(13)) & u0_m0_wo0_mtree_mult1_13_add_1_q));
    u0_m0_wo0_mtree_mult1_13_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_mult1_13_shift2_q(18)) & u0_m0_wo0_mtree_mult1_13_shift2_q));
    u0_m0_wo0_mtree_mult1_13_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_13_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_13_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_13_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_13_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_13_add_3_q <= u0_m0_wo0_mtree_mult1_13_add_3_o(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_12(MULT,69)@10 + 2
    u0_m0_wo0_mtree_mult1_12_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm7_q);
    u0_m0_wo0_mtree_mult1_12_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr7_q);
    u0_m0_wo0_mtree_mult1_12_reset <= areset;
    u0_m0_wo0_mtree_mult1_12_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 11,
        lpm_widthb => 12,
        lpm_widthp => 23,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_12_a0,
        datab => u0_m0_wo0_mtree_mult1_12_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_12_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_12_s1
    );
    u0_m0_wo0_mtree_mult1_12_q <= u0_m0_wo0_mtree_mult1_12_s1;

    -- u0_m0_wo0_mtree_add0_6(ADD,88)@12 + 1
    u0_m0_wo0_mtree_add0_6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo0_mtree_mult1_12_q(22)) & u0_m0_wo0_mtree_mult1_12_q));
    u0_m0_wo0_mtree_add0_6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 20 => u0_m0_wo0_mtree_mult1_13_add_3_q(19)) & u0_m0_wo0_mtree_mult1_13_add_3_q));
    u0_m0_wo0_mtree_add0_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_6_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_6_a) + SIGNED(u0_m0_wo0_mtree_add0_6_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_6_q <= u0_m0_wo0_mtree_add0_6_o(23 downto 0);

    -- u0_m0_wo0_mtree_add1_3(ADD,95)@13 + 1
    u0_m0_wo0_mtree_add1_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_add0_6_q(23)) & u0_m0_wo0_mtree_add0_6_q));
    u0_m0_wo0_mtree_add1_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => u0_m0_wo0_mtree_add0_7_q(22)) & u0_m0_wo0_mtree_add0_7_q));
    u0_m0_wo0_mtree_add1_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_3_a) + SIGNED(u0_m0_wo0_mtree_add1_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_3_q <= u0_m0_wo0_mtree_add1_3_o(24 downto 0);

    -- u0_m0_wo0_mtree_mult1_11_shift2(BITSHIFT,334)@10
    u0_m0_wo0_mtree_mult1_11_shift2_qint <= u0_m0_wo0_wi0_r0_delayr8_q & "000";
    u0_m0_wo0_mtree_mult1_11_shift2_q <= u0_m0_wo0_mtree_mult1_11_shift2_qint(14 downto 0);

    -- u0_m0_wo0_mtree_mult1_11_sub_3(SUB,335)@10 + 1
    u0_m0_wo0_mtree_mult1_11_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 12 => u0_m0_wo0_wi0_r0_delayr8_q(11)) & u0_m0_wo0_wi0_r0_delayr8_q));
    u0_m0_wo0_mtree_mult1_11_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo0_mtree_mult1_11_shift2_q(14)) & u0_m0_wo0_mtree_mult1_11_shift2_q));
    u0_m0_wo0_mtree_mult1_11_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_11_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_11_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_11_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_11_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_11_sub_3_q <= u0_m0_wo0_mtree_mult1_11_sub_3_o(15 downto 0);

    -- u0_m0_wo0_mtree_mult1_11_shift4(BITSHIFT,336)@11
    u0_m0_wo0_mtree_mult1_11_shift4_qint <= u0_m0_wo0_mtree_mult1_11_sub_3_q & "0000000";
    u0_m0_wo0_mtree_mult1_11_shift4_q <= u0_m0_wo0_mtree_mult1_11_shift4_qint(22 downto 0);

    -- u0_m0_wo0_mtree_mult1_11_shift0(BITSHIFT,332)@10
    u0_m0_wo0_mtree_mult1_11_shift0_qint <= u0_m0_wo0_wi0_r0_delayr8_q & "0000";
    u0_m0_wo0_mtree_mult1_11_shift0_q <= u0_m0_wo0_mtree_mult1_11_shift0_qint(15 downto 0);

    -- u0_m0_wo0_mtree_mult1_11_sub_1(SUB,333)@10 + 1
    u0_m0_wo0_mtree_mult1_11_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_11_shift0_q(15)) & u0_m0_wo0_mtree_mult1_11_shift0_q));
    u0_m0_wo0_mtree_mult1_11_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 12 => u0_m0_wo0_wi0_r0_delayr8_q(11)) & u0_m0_wo0_wi0_r0_delayr8_q));
    u0_m0_wo0_mtree_mult1_11_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_11_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_11_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_11_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_11_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_11_sub_1_q <= u0_m0_wo0_mtree_mult1_11_sub_1_o(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_11_add_5(ADD,337)@11 + 1
    u0_m0_wo0_mtree_mult1_11_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 17 => u0_m0_wo0_mtree_mult1_11_sub_1_q(16)) & u0_m0_wo0_mtree_mult1_11_sub_1_q));
    u0_m0_wo0_mtree_mult1_11_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo0_mtree_mult1_11_shift4_q(22)) & u0_m0_wo0_mtree_mult1_11_shift4_q));
    u0_m0_wo0_mtree_mult1_11_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_11_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_11_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_11_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_11_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_11_add_5_q <= u0_m0_wo0_mtree_mult1_11_add_5_o(23 downto 0);

    -- u0_m0_wo0_mtree_mult1_11_shift6(BITSHIFT,338)@12
    u0_m0_wo0_mtree_mult1_11_shift6_qint <= u0_m0_wo0_mtree_mult1_11_add_5_q & "0";
    u0_m0_wo0_mtree_mult1_11_shift6_q <= u0_m0_wo0_mtree_mult1_11_shift6_qint(24 downto 0);

    -- u0_m0_wo0_mtree_mult1_10(MULT,71)@10 + 2
    u0_m0_wo0_mtree_mult1_10_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm9_q);
    u0_m0_wo0_mtree_mult1_10_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr9_q);
    u0_m0_wo0_mtree_mult1_10_reset <= areset;
    u0_m0_wo0_mtree_mult1_10_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 13,
        lpm_widthb => 12,
        lpm_widthp => 25,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_10_a0,
        datab => u0_m0_wo0_mtree_mult1_10_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_10_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_10_s1
    );
    u0_m0_wo0_mtree_mult1_10_q <= u0_m0_wo0_mtree_mult1_10_s1;

    -- u0_m0_wo0_mtree_add0_5(ADD,87)@12 + 1
    u0_m0_wo0_mtree_add0_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_mult1_10_q(24)) & u0_m0_wo0_mtree_mult1_10_q));
    u0_m0_wo0_mtree_add0_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_mult1_11_shift6_q(24)) & u0_m0_wo0_mtree_mult1_11_shift6_q));
    u0_m0_wo0_mtree_add0_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_5_a) + SIGNED(u0_m0_wo0_mtree_add0_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_5_q <= u0_m0_wo0_mtree_add0_5_o(25 downto 0);

    -- d_u0_m0_wo0_wi0_r0_delayr10_q_11(DELAY,936)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr10_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr10_q, xout => d_u0_m0_wo0_wi0_r0_delayr10_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_9_shift0(BITSHIFT,348)@11
    u0_m0_wo0_mtree_mult1_9_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr10_q_11_q & "000000000000";
    u0_m0_wo0_mtree_mult1_9_shift0_q <= u0_m0_wo0_mtree_mult1_9_shift0_qint(23 downto 0);

    -- u0_m0_wo0_mtree_mult1_9_sub_1(SUB,349)@11 + 1
    u0_m0_wo0_mtree_mult1_9_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_9_shift0_q(23)) & u0_m0_wo0_mtree_mult1_9_shift0_q));
    u0_m0_wo0_mtree_mult1_9_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 12 => d_u0_m0_wo0_wi0_r0_delayr10_q_11_q(11)) & d_u0_m0_wo0_wi0_r0_delayr10_q_11_q));
    u0_m0_wo0_mtree_mult1_9_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_9_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_9_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_9_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_9_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_9_sub_1_q <= u0_m0_wo0_mtree_mult1_9_sub_1_o(24 downto 0);

    -- u0_m0_wo0_mtree_mult1_9_shift2(BITSHIFT,350)@12
    u0_m0_wo0_mtree_mult1_9_shift2_qint <= u0_m0_wo0_mtree_mult1_9_sub_1_q & "0";
    u0_m0_wo0_mtree_mult1_9_shift2_q <= u0_m0_wo0_mtree_mult1_9_shift2_qint(25 downto 0);

    -- u0_m0_wo0_mtree_mult1_8(MULT,73)@10 + 2
    u0_m0_wo0_mtree_mult1_8_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm11_q);
    u0_m0_wo0_mtree_mult1_8_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr11_q);
    u0_m0_wo0_mtree_mult1_8_reset <= areset;
    u0_m0_wo0_mtree_mult1_8_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 11,
        lpm_widthb => 12,
        lpm_widthp => 23,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_8_a0,
        datab => u0_m0_wo0_mtree_mult1_8_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_8_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_8_s1
    );
    u0_m0_wo0_mtree_mult1_8_q <= u0_m0_wo0_mtree_mult1_8_s1;

    -- u0_m0_wo0_mtree_add0_4(ADD,86)@12 + 1
    u0_m0_wo0_mtree_add0_4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 23 => u0_m0_wo0_mtree_mult1_8_q(22)) & u0_m0_wo0_mtree_mult1_8_q));
    u0_m0_wo0_mtree_add0_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_mult1_9_shift2_q(25)) & u0_m0_wo0_mtree_mult1_9_shift2_q));
    u0_m0_wo0_mtree_add0_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_4_a) + SIGNED(u0_m0_wo0_mtree_add0_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_4_q <= u0_m0_wo0_mtree_add0_4_o(26 downto 0);

    -- u0_m0_wo0_mtree_add1_2(ADD,94)@13 + 1
    u0_m0_wo0_mtree_add1_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_add0_4_q(26)) & u0_m0_wo0_mtree_add0_4_q));
    u0_m0_wo0_mtree_add1_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 26 => u0_m0_wo0_mtree_add0_5_q(25)) & u0_m0_wo0_mtree_add0_5_q));
    u0_m0_wo0_mtree_add1_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_2_a) + SIGNED(u0_m0_wo0_mtree_add1_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_2_q <= u0_m0_wo0_mtree_add1_2_o(27 downto 0);

    -- u0_m0_wo0_mtree_add2_1(ADD,98)@14 + 1
    u0_m0_wo0_mtree_add2_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_add1_2_q(27)) & u0_m0_wo0_mtree_add1_2_q));
    u0_m0_wo0_mtree_add2_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 25 => u0_m0_wo0_mtree_add1_3_q(24)) & u0_m0_wo0_mtree_add1_3_q));
    u0_m0_wo0_mtree_add2_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_1_a) + SIGNED(u0_m0_wo0_mtree_add2_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_1_q <= u0_m0_wo0_mtree_add2_1_o(28 downto 0);

    -- u0_m0_wo0_mtree_mult1_7(MULT,74)@10 + 2
    u0_m0_wo0_mtree_mult1_7_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm12_q);
    u0_m0_wo0_mtree_mult1_7_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr12_q);
    u0_m0_wo0_mtree_mult1_7_reset <= areset;
    u0_m0_wo0_mtree_mult1_7_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 12,
        lpm_widthb => 12,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_7_a0,
        datab => u0_m0_wo0_mtree_mult1_7_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_7_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_7_s1
    );
    u0_m0_wo0_mtree_mult1_7_q <= u0_m0_wo0_mtree_mult1_7_s1;

    -- u0_m0_wo0_mtree_mult1_6_shift2(BITSHIFT,370)@10
    u0_m0_wo0_mtree_mult1_6_shift2_qint <= u0_m0_wo0_wi0_r0_delayr13_q & "0000";
    u0_m0_wo0_mtree_mult1_6_shift2_q <= u0_m0_wo0_mtree_mult1_6_shift2_qint(15 downto 0);

    -- u0_m0_wo0_mtree_mult1_6_sub_3(SUB,371)@10 + 1
    u0_m0_wo0_mtree_mult1_6_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_6_shift2_q(15)) & u0_m0_wo0_mtree_mult1_6_shift2_q));
    u0_m0_wo0_mtree_mult1_6_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 12 => u0_m0_wo0_wi0_r0_delayr13_q(11)) & u0_m0_wo0_wi0_r0_delayr13_q));
    u0_m0_wo0_mtree_mult1_6_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_6_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_6_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_6_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_6_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_6_sub_3_q <= u0_m0_wo0_mtree_mult1_6_sub_3_o(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_6_shift4(BITSHIFT,372)@11
    u0_m0_wo0_mtree_mult1_6_shift4_qint <= u0_m0_wo0_mtree_mult1_6_sub_3_q & "00000";
    u0_m0_wo0_mtree_mult1_6_shift4_q <= u0_m0_wo0_mtree_mult1_6_shift4_qint(21 downto 0);

    -- u0_m0_wo0_mtree_mult1_6_shift0(BITSHIFT,368)@10
    u0_m0_wo0_mtree_mult1_6_shift0_qint <= u0_m0_wo0_wi0_r0_delayr13_q & "00";
    u0_m0_wo0_mtree_mult1_6_shift0_q <= u0_m0_wo0_mtree_mult1_6_shift0_qint(13 downto 0);

    -- u0_m0_wo0_mtree_mult1_6_add_1(ADD,369)@10 + 1
    u0_m0_wo0_mtree_mult1_6_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => u0_m0_wo0_wi0_r0_delayr13_q(11)) & u0_m0_wo0_wi0_r0_delayr13_q));
    u0_m0_wo0_mtree_mult1_6_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo0_mtree_mult1_6_shift0_q(13)) & u0_m0_wo0_mtree_mult1_6_shift0_q));
    u0_m0_wo0_mtree_mult1_6_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_6_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_6_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_6_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_6_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_6_add_1_q <= u0_m0_wo0_mtree_mult1_6_add_1_o(14 downto 0);

    -- u0_m0_wo0_mtree_mult1_6_add_5(ADD,373)@11 + 1
    u0_m0_wo0_mtree_mult1_6_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 15 => u0_m0_wo0_mtree_mult1_6_add_1_q(14)) & u0_m0_wo0_mtree_mult1_6_add_1_q));
    u0_m0_wo0_mtree_mult1_6_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo0_mtree_mult1_6_shift4_q(21)) & u0_m0_wo0_mtree_mult1_6_shift4_q));
    u0_m0_wo0_mtree_mult1_6_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_6_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_6_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_6_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_6_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_6_add_5_q <= u0_m0_wo0_mtree_mult1_6_add_5_o(22 downto 0);

    -- u0_m0_wo0_mtree_mult1_6_shift6(BITSHIFT,374)@12
    u0_m0_wo0_mtree_mult1_6_shift6_qint <= u0_m0_wo0_mtree_mult1_6_add_5_q & "0";
    u0_m0_wo0_mtree_mult1_6_shift6_q <= u0_m0_wo0_mtree_mult1_6_shift6_qint(23 downto 0);

    -- u0_m0_wo0_mtree_add0_3(ADD,85)@12 + 1
    u0_m0_wo0_mtree_add0_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_6_shift6_q(23)) & u0_m0_wo0_mtree_mult1_6_shift6_q));
    u0_m0_wo0_mtree_add0_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_7_q(23)) & u0_m0_wo0_mtree_mult1_7_q));
    u0_m0_wo0_mtree_add0_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_3_a) + SIGNED(u0_m0_wo0_mtree_add0_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_3_q <= u0_m0_wo0_mtree_add0_3_o(24 downto 0);

    -- u0_m0_wo0_mtree_mult1_5(MULT,76)@10 + 2
    u0_m0_wo0_mtree_mult1_5_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm14_q);
    u0_m0_wo0_mtree_mult1_5_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr14_q);
    u0_m0_wo0_mtree_mult1_5_reset <= areset;
    u0_m0_wo0_mtree_mult1_5_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 10,
        lpm_widthb => 12,
        lpm_widthp => 22,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_5_a0,
        datab => u0_m0_wo0_mtree_mult1_5_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_5_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_5_s1
    );
    u0_m0_wo0_mtree_mult1_5_q <= u0_m0_wo0_mtree_mult1_5_s1;

    -- d_u0_m0_wo0_wi0_r0_delayr15_q_11(DELAY,938)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr15_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr15_q, xout => d_u0_m0_wo0_wi0_r0_delayr15_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_4_shift2(BITSHIFT,385)@11
    u0_m0_wo0_mtree_mult1_4_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr15_q_11_q & "0000";
    u0_m0_wo0_mtree_mult1_4_shift2_q <= u0_m0_wo0_mtree_mult1_4_shift2_qint(15 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_shift0(BITSHIFT,383)@10
    u0_m0_wo0_mtree_mult1_4_shift0_qint <= u0_m0_wo0_wi0_r0_delayr15_q & "00";
    u0_m0_wo0_mtree_mult1_4_shift0_q <= u0_m0_wo0_mtree_mult1_4_shift0_qint(13 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_sub_1(SUB,384)@10 + 1
    u0_m0_wo0_mtree_mult1_4_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo0_mtree_mult1_4_shift0_q(13)) & u0_m0_wo0_mtree_mult1_4_shift0_q));
    u0_m0_wo0_mtree_mult1_4_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => u0_m0_wo0_wi0_r0_delayr15_q(11)) & u0_m0_wo0_wi0_r0_delayr15_q));
    u0_m0_wo0_mtree_mult1_4_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_4_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_4_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_4_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_sub_1_q <= u0_m0_wo0_mtree_mult1_4_sub_1_o(14 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_sub_3(SUB,386)@11 + 1
    u0_m0_wo0_mtree_mult1_4_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => u0_m0_wo0_mtree_mult1_4_sub_1_q(14)) & u0_m0_wo0_mtree_mult1_4_sub_1_q));
    u0_m0_wo0_mtree_mult1_4_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_4_shift2_q(15)) & u0_m0_wo0_mtree_mult1_4_shift2_q));
    u0_m0_wo0_mtree_mult1_4_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_4_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_4_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_4_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_sub_3_q <= u0_m0_wo0_mtree_mult1_4_sub_3_o(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_shift4(BITSHIFT,387)@12
    u0_m0_wo0_mtree_mult1_4_shift4_qint <= u0_m0_wo0_mtree_mult1_4_sub_3_q & "00";
    u0_m0_wo0_mtree_mult1_4_shift4_q <= u0_m0_wo0_mtree_mult1_4_shift4_qint(18 downto 0);

    -- u0_m0_wo0_mtree_add0_2(ADD,84)@12 + 1
    u0_m0_wo0_mtree_add0_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 19 => u0_m0_wo0_mtree_mult1_4_shift4_q(18)) & u0_m0_wo0_mtree_mult1_4_shift4_q));
    u0_m0_wo0_mtree_add0_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo0_mtree_mult1_5_q(21)) & u0_m0_wo0_mtree_mult1_5_q));
    u0_m0_wo0_mtree_add0_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_2_a) + SIGNED(u0_m0_wo0_mtree_add0_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_2_q <= u0_m0_wo0_mtree_add0_2_o(22 downto 0);

    -- u0_m0_wo0_mtree_add1_1(ADD,93)@13 + 1
    u0_m0_wo0_mtree_add1_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 23 => u0_m0_wo0_mtree_add0_2_q(22)) & u0_m0_wo0_mtree_add0_2_q));
    u0_m0_wo0_mtree_add1_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_add0_3_q(24)) & u0_m0_wo0_mtree_add0_3_q));
    u0_m0_wo0_mtree_add1_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_1_a) + SIGNED(u0_m0_wo0_mtree_add1_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_1_q <= u0_m0_wo0_mtree_add1_1_o(25 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_shift2(BITSHIFT,390)@11
    u0_m0_wo0_mtree_mult1_3_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr16_q_11_q & "00000000";
    u0_m0_wo0_mtree_mult1_3_shift2_q <= u0_m0_wo0_mtree_mult1_3_shift2_qint(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_shift0(BITSHIFT,388)@10
    u0_m0_wo0_mtree_mult1_3_shift0_qint <= u0_m0_wo0_wi0_r0_delayr16_q & "00000";
    u0_m0_wo0_mtree_mult1_3_shift0_q <= u0_m0_wo0_mtree_mult1_3_shift0_qint(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_sub_1(SUB,389)@10 + 1
    u0_m0_wo0_mtree_mult1_3_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo0_mtree_mult1_3_shift0_q(16)) & u0_m0_wo0_mtree_mult1_3_shift0_q));
    u0_m0_wo0_mtree_mult1_3_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 12 => u0_m0_wo0_wi0_r0_delayr16_q(11)) & u0_m0_wo0_wi0_r0_delayr16_q));
    u0_m0_wo0_mtree_mult1_3_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_3_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_3_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_3_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_3_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_3_sub_1_q <= u0_m0_wo0_mtree_mult1_3_sub_1_o(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_add_3(ADD,391)@11 + 1
    u0_m0_wo0_mtree_mult1_3_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 18 => u0_m0_wo0_mtree_mult1_3_sub_1_q(17)) & u0_m0_wo0_mtree_mult1_3_sub_1_q));
    u0_m0_wo0_mtree_mult1_3_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_mult1_3_shift2_q(19)) & u0_m0_wo0_mtree_mult1_3_shift2_q));
    u0_m0_wo0_mtree_mult1_3_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_3_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_3_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_3_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_3_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_3_add_3_q <= u0_m0_wo0_mtree_mult1_3_add_3_o(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_2(MULT,79)@10 + 2
    u0_m0_wo0_mtree_mult1_2_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm17_q);
    u0_m0_wo0_mtree_mult1_2_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr17_q);
    u0_m0_wo0_mtree_mult1_2_reset <= areset;
    u0_m0_wo0_mtree_mult1_2_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 10,
        lpm_widthb => 12,
        lpm_widthp => 22,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_2_a0,
        datab => u0_m0_wo0_mtree_mult1_2_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_2_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_2_s1
    );
    u0_m0_wo0_mtree_mult1_2_q <= u0_m0_wo0_mtree_mult1_2_s1;

    -- u0_m0_wo0_mtree_add0_1(ADD,83)@12 + 1
    u0_m0_wo0_mtree_add0_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo0_mtree_mult1_2_q(21)) & u0_m0_wo0_mtree_mult1_2_q));
    u0_m0_wo0_mtree_add0_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 21 => u0_m0_wo0_mtree_mult1_3_add_3_q(20)) & u0_m0_wo0_mtree_mult1_3_add_3_q));
    u0_m0_wo0_mtree_add0_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_1_a) + SIGNED(u0_m0_wo0_mtree_add0_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_1_q <= u0_m0_wo0_mtree_add0_1_o(22 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_shift2(BITSHIFT,402)@11
    u0_m0_wo0_mtree_mult1_1_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr18_q_11_q & "00000000";
    u0_m0_wo0_mtree_mult1_1_shift2_q <= u0_m0_wo0_mtree_mult1_1_shift2_qint(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_shift0(BITSHIFT,400)@10
    u0_m0_wo0_mtree_mult1_1_shift0_qint <= u0_m0_wo0_wi0_r0_delayr18_q & "00000";
    u0_m0_wo0_mtree_mult1_1_shift0_q <= u0_m0_wo0_mtree_mult1_1_shift0_qint(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_sub_1(SUB,401)@10 + 1
    u0_m0_wo0_mtree_mult1_1_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 12 => u0_m0_wo0_wi0_r0_delayr18_q(11)) & u0_m0_wo0_wi0_r0_delayr18_q));
    u0_m0_wo0_mtree_mult1_1_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo0_mtree_mult1_1_shift0_q(16)) & u0_m0_wo0_mtree_mult1_1_shift0_q));
    u0_m0_wo0_mtree_mult1_1_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_1_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_1_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_1_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_1_sub_1_q <= u0_m0_wo0_mtree_mult1_1_sub_1_o(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_add_3(ADD,403)@11 + 1
    u0_m0_wo0_mtree_mult1_1_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 18 => u0_m0_wo0_mtree_mult1_1_sub_1_q(17)) & u0_m0_wo0_mtree_mult1_1_sub_1_q));
    u0_m0_wo0_mtree_mult1_1_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_mult1_1_shift2_q(19)) & u0_m0_wo0_mtree_mult1_1_shift2_q));
    u0_m0_wo0_mtree_mult1_1_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_1_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_1_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_1_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_1_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_1_add_3_q <= u0_m0_wo0_mtree_mult1_1_add_3_o(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_shift0(BITSHIFT,404)@11
    u0_m0_wo0_mtree_mult1_0_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr19_q_11_q & "00000";
    u0_m0_wo0_mtree_mult1_0_shift0_q <= u0_m0_wo0_mtree_mult1_0_shift0_qint(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_sub_1(SUB,405)@11 + 1
    u0_m0_wo0_mtree_mult1_0_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo0_mtree_mult1_0_shift0_q(16)) & u0_m0_wo0_mtree_mult1_0_shift0_q));
    u0_m0_wo0_mtree_mult1_0_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 12 => d_u0_m0_wo0_wi0_r0_delayr19_q_11_q(11)) & d_u0_m0_wo0_wi0_r0_delayr19_q_11_q));
    u0_m0_wo0_mtree_mult1_0_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_0_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_0_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_0_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_sub_1_q <= u0_m0_wo0_mtree_mult1_0_sub_1_o(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_shift2(BITSHIFT,406)@12
    u0_m0_wo0_mtree_mult1_0_shift2_qint <= u0_m0_wo0_mtree_mult1_0_sub_1_q & "000";
    u0_m0_wo0_mtree_mult1_0_shift2_q <= u0_m0_wo0_mtree_mult1_0_shift2_qint(20 downto 0);

    -- u0_m0_wo0_mtree_add0_0(ADD,82)@12 + 1
    u0_m0_wo0_mtree_add0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo0_mtree_mult1_0_shift2_q(20)) & u0_m0_wo0_mtree_mult1_0_shift2_q));
    u0_m0_wo0_mtree_add0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo0_mtree_mult1_1_add_3_q(20)) & u0_m0_wo0_mtree_mult1_1_add_3_q));
    u0_m0_wo0_mtree_add0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_0_a) + SIGNED(u0_m0_wo0_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_q <= u0_m0_wo0_mtree_add0_0_o(21 downto 0);

    -- u0_m0_wo0_mtree_add1_0(ADD,92)@13 + 1
    u0_m0_wo0_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 22 => u0_m0_wo0_mtree_add0_0_q(21)) & u0_m0_wo0_mtree_add0_0_q));
    u0_m0_wo0_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo0_mtree_add0_1_q(22)) & u0_m0_wo0_mtree_add0_1_q));
    u0_m0_wo0_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_0_a) + SIGNED(u0_m0_wo0_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_0_q <= u0_m0_wo0_mtree_add1_0_o(23 downto 0);

    -- u0_m0_wo0_mtree_add2_0(ADD,97)@14 + 1
    u0_m0_wo0_mtree_add2_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 24 => u0_m0_wo0_mtree_add1_0_q(23)) & u0_m0_wo0_mtree_add1_0_q));
    u0_m0_wo0_mtree_add2_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_add1_1_q(25)) & u0_m0_wo0_mtree_add1_1_q));
    u0_m0_wo0_mtree_add2_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_0_a) + SIGNED(u0_m0_wo0_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_0_q <= u0_m0_wo0_mtree_add2_0_o(26 downto 0);

    -- u0_m0_wo0_mtree_add3_0(ADD,99)@15 + 1
    u0_m0_wo0_mtree_add3_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 27 => u0_m0_wo0_mtree_add2_0_q(26)) & u0_m0_wo0_mtree_add2_0_q));
    u0_m0_wo0_mtree_add3_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_mtree_add2_1_q(28)) & u0_m0_wo0_mtree_add2_1_q));
    u0_m0_wo0_mtree_add3_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add3_0_a) + SIGNED(u0_m0_wo0_mtree_add3_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add3_0_q <= u0_m0_wo0_mtree_add3_0_o(29 downto 0);

    -- u0_m0_wo0_mtree_add4_0(ADD,100)@16 + 1
    u0_m0_wo0_mtree_add4_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo0_mtree_add3_0_q(29)) & u0_m0_wo0_mtree_add3_0_q));
    u0_m0_wo0_mtree_add4_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 24 => u0_m0_wo0_mtree_add1_4_q(23)) & u0_m0_wo0_mtree_add1_4_q));
    u0_m0_wo0_mtree_add4_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add4_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add4_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add4_0_a) + SIGNED(u0_m0_wo0_mtree_add4_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add4_0_q <= u0_m0_wo0_mtree_add4_0_o(30 downto 0);

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- d_u0_m0_wo0_compute_q_16(DELAY,924)@10 + 6
    d_u0_m0_wo0_compute_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_u0_m0_wo0_compute_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_oseq_gated_reg(REG,101)@16 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(d_u0_m0_wo0_compute_q_16_q);
        END IF;
    END PROCESS;

    -- xOut(PORTOUT,282)@17 + 1
    xOut_v <= u0_m0_wo0_oseq_gated_reg_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_mtree_add4_0_q;
    xOut_1 <= u0_m0_wo1_mtree_add3_0_q;
    xOut_2 <= u0_m0_wo2_mtree_add4_0_q;

END normal;
