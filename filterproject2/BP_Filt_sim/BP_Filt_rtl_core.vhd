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
-- VHDL created on Mon Nov 27 15:06:29 2023


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
        xIn_0 : in std_logic_vector(31 downto 0);  -- sfix32
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(50 downto 0);  -- sfix51
        xOut_1 : out std_logic_vector(50 downto 0);  -- sfix51
        clk : in std_logic;
        areset : in std_logic
    );
end BP_Filt_rtl_core;

architecture normal of BP_Filt_rtl_core is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_q : STD_LOGIC_VECTOR (31 downto 0);
    signal d_in0_m0_wi0_wo0_assign_id1_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_count : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_run_preEnaQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_out : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_enableQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_ctrl : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_compute_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_i : UNSIGNED (3 downto 0);
    attribute preserve : boolean;
    attribute preserve of u0_m0_wo0_wi0_r0_ra0_count0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra0_count0_eq : std_logic;
    attribute preserve of u0_m0_wo0_wi0_r0_ra0_count0_eq : signal is true;
    signal u0_m0_wo0_wi0_r0_wa0_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_wi0_r0_wa0_i : UNSIGNED (2 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa0_eq : std_logic;
    attribute preserve of u0_m0_wo0_wi0_r0_wa0_eq : signal is true;
    signal u0_m0_wo0_wi0_r0_memr0_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr0_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal d_u0_m0_wo0_wi0_r0_memr0_q_15_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_ca4_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_ca4_i : UNSIGNED (1 downto 0);
    attribute preserve of u0_m0_wo0_ca4_i : signal is true;
    signal d_u0_m0_wo0_ca4_q_14_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_cm0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_cm1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_cm2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_cm3_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_cm4_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_add0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_add0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_add0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_add0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_add0_1_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_add0_1_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_add0_1_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_add0_1_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_add1_0_a : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo0_mtree_add1_0_b : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo0_mtree_add1_0_o : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo0_mtree_add1_0_q : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo0_mtree_add2_0_a : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_add2_0_b : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_add2_0_o : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_add2_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_aseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_aseq_eq : std_logic;
    signal u0_m0_wo0_accum_a : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_accum_b : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_accum_i : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_accum_o : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_accum_q : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_oseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_eq : std_logic;
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m1_wo0_run_count : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m1_wo0_run_preEnaQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m1_wo0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m1_wo0_run_out : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m1_wo0_run_enableQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m1_wo0_run_ctrl : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m1_wo0_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m1_wo0_memread_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m1_wo0_compute_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m1_wo0_compute_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m1_wo0_compute_q_18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m1_wo0_compute_q_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m1_wo0_wi0_r0_ra0_count0_lutreg_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m1_wo0_wi0_r0_ra0_count0_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m1_wo0_wi0_r0_ra0_count0_i : UNSIGNED (3 downto 0);
    attribute preserve of u0_m1_wo0_wi0_r0_ra0_count0_i : signal is true;
    signal u0_m1_wo0_wi0_r0_ra0_count0_eq : std_logic;
    attribute preserve of u0_m1_wo0_wi0_r0_ra0_count0_eq : signal is true;
    signal u0_m1_wo0_wi0_r0_memr0_reset0 : std_logic;
    signal u0_m1_wo0_wi0_r0_memr0_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo0_wi0_r0_memr0_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m1_wo0_wi0_r0_memr0_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m1_wo0_wi0_r0_memr0_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo0_wi0_r0_memr0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal d_u0_m1_wo0_wi0_r0_memr0_q_15_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo0_wi0_r0_delayr1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo0_wi0_r0_delayr2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo0_wi0_r0_delayr3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo0_wi0_r0_delayr4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo0_ca4_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m1_wo0_ca4_i : UNSIGNED (1 downto 0);
    attribute preserve of u0_m1_wo0_ca4_i : signal is true;
    signal d_u0_m1_wo0_ca4_q_14_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m1_wo0_cm0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo0_cm1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo0_cm2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo0_cm3_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo0_cm4_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo0_mtree_add0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_add0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_add0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_add0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_add0_1_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_add0_1_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_add0_1_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_add0_1_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_add1_0_a : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m1_wo0_mtree_add1_0_b : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m1_wo0_mtree_add1_0_o : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m1_wo0_mtree_add1_0_q : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m1_wo0_mtree_add2_0_a : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m1_wo0_mtree_add2_0_b : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m1_wo0_mtree_add2_0_o : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m1_wo0_mtree_add2_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m1_wo0_aseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m1_wo0_aseq_eq : std_logic;
    signal u0_m1_wo0_accum_a : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m1_wo0_accum_b : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m1_wo0_accum_i : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m1_wo0_accum_o : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m1_wo0_accum_q : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m1_wo0_oseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m1_wo0_oseq_eq : std_logic;
    signal u0_m1_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m2_wo0_run_count : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m2_wo0_run_preEnaQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m2_wo0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m2_wo0_run_out : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m2_wo0_run_enableQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m2_wo0_run_ctrl : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m2_wo0_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m2_wo0_memread_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m2_wo0_memread_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m2_wo0_compute_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m2_wo0_compute_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m2_wo0_compute_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m2_wo0_compute_q_18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m2_wo0_compute_q_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m2_wo0_wi0_r0_ra0_count0_lutreg_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m2_wo0_wi0_r0_ra0_count0_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m2_wo0_wi0_r0_ra0_count0_i : UNSIGNED (3 downto 0);
    attribute preserve of u0_m2_wo0_wi0_r0_ra0_count0_i : signal is true;
    signal u0_m2_wo0_wi0_r0_ra0_count0_eq : std_logic;
    attribute preserve of u0_m2_wo0_wi0_r0_ra0_count0_eq : signal is true;
    signal u0_m2_wo0_wi0_r0_ra3_count0_lutreg_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m2_wo0_wi0_r0_ra3_count0_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m2_wo0_wi0_r0_ra3_count0_i : UNSIGNED (4 downto 0);
    attribute preserve of u0_m2_wo0_wi0_r0_ra3_count0_i : signal is true;
    signal u0_m2_wo0_wi0_r0_ra3_count0_eq : std_logic;
    attribute preserve of u0_m2_wo0_wi0_r0_ra3_count0_eq : signal is true;
    signal u0_m2_wo0_wi0_r0_we3_seq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m2_wo0_wi0_r0_we3_seq_eq : std_logic;
    signal u0_m2_wo0_wi0_r0_wa0_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m2_wo0_wi0_r0_wa0_i : UNSIGNED (2 downto 0);
    attribute preserve of u0_m2_wo0_wi0_r0_wa0_i : signal is true;
    signal u0_m2_wo0_wi0_r0_wa0_eq : std_logic;
    attribute preserve of u0_m2_wo0_wi0_r0_wa0_eq : signal is true;
    signal u0_m2_wo0_wi0_r0_wa3_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m2_wo0_wi0_r0_wa3_i : UNSIGNED (3 downto 0);
    attribute preserve of u0_m2_wo0_wi0_r0_wa3_i : signal is true;
    signal u0_m2_wo0_wi0_r0_wa3_eq : std_logic;
    attribute preserve of u0_m2_wo0_wi0_r0_wa3_eq : signal is true;
    signal u0_m2_wo0_wi0_r0_memr0_reset0 : std_logic;
    signal u0_m2_wo0_wi0_r0_memr0_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo0_wi0_r0_memr0_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m2_wo0_wi0_r0_memr0_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m2_wo0_wi0_r0_memr0_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo0_wi0_r0_memr0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal d_u0_m2_wo0_wi0_r0_memr0_q_14_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo0_wi0_r0_memr3_reset0 : std_logic;
    signal u0_m2_wo0_wi0_r0_memr3_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo0_wi0_r0_memr3_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m2_wo0_wi0_r0_memr3_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m2_wo0_wi0_r0_memr3_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo0_wi0_r0_memr3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo0_wi0_r0_delayr1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo0_wi0_r0_delayr2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo0_wi0_r0_delayr4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal d_u0_m2_wo0_wi0_r0_delayr4_q_14_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo0_wi0_r0_delayr5_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo0_ca2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m2_wo0_ca2_i : UNSIGNED (1 downto 0);
    attribute preserve of u0_m2_wo0_ca2_i : signal is true;
    signal d_u0_m2_wo0_ca2_q_14_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m2_wo0_cm0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo0_cm1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo0_cm2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo0_sym_add0_a : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m2_wo0_sym_add0_b : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m2_wo0_sym_add0_o : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m2_wo0_sym_add0_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m2_wo0_sym_add1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m2_wo0_sym_add1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m2_wo0_sym_add1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m2_wo0_sym_add1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m2_wo0_sym_add2_a : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m2_wo0_sym_add2_b : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m2_wo0_sym_add2_o : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m2_wo0_sym_add2_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m2_wo0_mtree_add0_0_a : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m2_wo0_mtree_add0_0_b : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m2_wo0_mtree_add0_0_o : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m2_wo0_mtree_add0_0_q : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m2_wo0_mtree_add1_0_a : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m2_wo0_mtree_add1_0_b : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m2_wo0_mtree_add1_0_o : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m2_wo0_mtree_add1_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m2_wo0_aseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m2_wo0_aseq_eq : std_logic;
    signal u0_m2_wo0_accum_a : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m2_wo0_accum_b : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m2_wo0_accum_i : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m2_wo0_accum_o : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m2_wo0_accum_q : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m2_wo0_oseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m2_wo0_oseq_eq : std_logic;
    signal u0_m2_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo1_run_count : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo1_run_preEnaQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo1_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo1_run_out : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo1_run_enableQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo1_run_ctrl : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo1_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo1_memread_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo1_memread_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo1_compute_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo1_compute_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo1_compute_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo1_compute_q_18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo1_compute_q_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo1_wi0_r0_ra0_count0_lutreg_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo1_wi0_r0_ra0_count0_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo1_wi0_r0_ra0_count0_i : UNSIGNED (3 downto 0);
    attribute preserve of u0_m0_wo1_wi0_r0_ra0_count0_i : signal is true;
    signal u0_m0_wo1_wi0_r0_ra0_count0_eq : std_logic;
    attribute preserve of u0_m0_wo1_wi0_r0_ra0_count0_eq : signal is true;
    signal u0_m0_wo1_wi0_r0_ra3_count0_lutreg_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo1_wi0_r0_ra3_count0_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo1_wi0_r0_ra3_count0_i : UNSIGNED (4 downto 0);
    attribute preserve of u0_m0_wo1_wi0_r0_ra3_count0_i : signal is true;
    signal u0_m0_wo1_wi0_r0_ra3_count0_eq : std_logic;
    attribute preserve of u0_m0_wo1_wi0_r0_ra3_count0_eq : signal is true;
    signal u0_m0_wo1_wi0_r0_we3_seq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo1_wi0_r0_we3_seq_eq : std_logic;
    signal u0_m0_wo1_wi0_r0_wa3_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo1_wi0_r0_wa3_i : UNSIGNED (3 downto 0);
    attribute preserve of u0_m0_wo1_wi0_r0_wa3_i : signal is true;
    signal u0_m0_wo1_wi0_r0_wa3_eq : std_logic;
    attribute preserve of u0_m0_wo1_wi0_r0_wa3_eq : signal is true;
    signal u0_m0_wo1_wi0_r0_memr0_reset0 : std_logic;
    signal u0_m0_wo1_wi0_r0_memr0_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_wi0_r0_memr0_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo1_wi0_r0_memr0_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo1_wi0_r0_memr0_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_wi0_r0_memr0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal d_u0_m0_wo1_wi0_r0_memr0_q_14_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_wi0_r0_memr3_reset0 : std_logic;
    signal u0_m0_wo1_wi0_r0_memr3_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_wi0_r0_memr3_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo1_wi0_r0_memr3_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo1_wi0_r0_memr3_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_wi0_r0_memr3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_wi0_r0_delayr1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_wi0_r0_delayr2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_wi0_r0_delayr4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal d_u0_m0_wo1_wi0_r0_delayr4_q_14_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_wi0_r0_delayr5_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_ca2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo1_ca2_i : UNSIGNED (1 downto 0);
    attribute preserve of u0_m0_wo1_ca2_i : signal is true;
    signal d_u0_m0_wo1_ca2_q_14_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo1_cm0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo1_cm1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo1_cm2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo1_sym_add0_a : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo1_sym_add0_b : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo1_sym_add0_o : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo1_sym_add0_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo1_sym_add1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo1_sym_add1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo1_sym_add1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo1_sym_add1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo1_sym_add2_a : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo1_sym_add2_b : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo1_sym_add2_o : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo1_sym_add2_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo1_mtree_add0_0_a : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo1_mtree_add0_0_b : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo1_mtree_add0_0_o : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo1_mtree_add0_0_q : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo1_mtree_add1_0_a : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo1_mtree_add1_0_b : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo1_mtree_add1_0_o : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo1_mtree_add1_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo1_aseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo1_aseq_eq : std_logic;
    signal u0_m0_wo1_accum_a : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo1_accum_b : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo1_accum_i : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo1_accum_o : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo1_accum_q : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo1_oseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo1_oseq_eq : std_logic;
    signal u0_m0_wo1_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m1_wo1_run_count : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m1_wo1_run_preEnaQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m1_wo1_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m1_wo1_run_out : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m1_wo1_run_enableQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m1_wo1_run_ctrl : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m1_wo1_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m1_wo1_memread_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m1_wo1_compute_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m1_wo1_compute_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m1_wo1_compute_q_18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m1_wo1_compute_q_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m1_wo1_wi0_r0_ra0_count0_lutreg_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m1_wo1_wi0_r0_ra0_count0_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m1_wo1_wi0_r0_ra0_count0_i : UNSIGNED (3 downto 0);
    attribute preserve of u0_m1_wo1_wi0_r0_ra0_count0_i : signal is true;
    signal u0_m1_wo1_wi0_r0_ra0_count0_eq : std_logic;
    attribute preserve of u0_m1_wo1_wi0_r0_ra0_count0_eq : signal is true;
    signal u0_m1_wo1_wi0_r0_memr0_reset0 : std_logic;
    signal u0_m1_wo1_wi0_r0_memr0_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo1_wi0_r0_memr0_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m1_wo1_wi0_r0_memr0_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m1_wo1_wi0_r0_memr0_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo1_wi0_r0_memr0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal d_u0_m1_wo1_wi0_r0_memr0_q_15_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo1_wi0_r0_delayr1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo1_wi0_r0_delayr2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo1_wi0_r0_delayr3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo1_wi0_r0_delayr4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo1_ca4_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m1_wo1_ca4_i : UNSIGNED (1 downto 0);
    attribute preserve of u0_m1_wo1_ca4_i : signal is true;
    signal d_u0_m1_wo1_ca4_q_14_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m1_wo1_cm0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo1_cm1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo1_cm2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo1_cm3_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo1_cm4_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo1_mtree_add0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_add0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_add0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_add0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_add0_1_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_add0_1_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_add0_1_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_add0_1_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_add1_0_a : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m1_wo1_mtree_add1_0_b : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m1_wo1_mtree_add1_0_o : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m1_wo1_mtree_add1_0_q : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m1_wo1_mtree_add2_0_a : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m1_wo1_mtree_add2_0_b : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m1_wo1_mtree_add2_0_o : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m1_wo1_mtree_add2_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m1_wo1_aseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m1_wo1_aseq_eq : std_logic;
    signal u0_m1_wo1_accum_a : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m1_wo1_accum_b : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m1_wo1_accum_i : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m1_wo1_accum_o : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m1_wo1_accum_q : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m1_wo1_oseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m1_wo1_oseq_eq : std_logic;
    signal u0_m1_wo1_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m2_wo1_run_count : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m2_wo1_run_preEnaQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m2_wo1_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m2_wo1_run_out : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m2_wo1_run_enableQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m2_wo1_run_ctrl : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m2_wo1_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m2_wo1_memread_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m2_wo1_compute_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m2_wo1_compute_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m2_wo1_compute_q_18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m2_wo1_compute_q_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m2_wo1_wi0_r0_ra0_count0_lutreg_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m2_wo1_wi0_r0_ra0_count0_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m2_wo1_wi0_r0_ra0_count0_i : UNSIGNED (3 downto 0);
    attribute preserve of u0_m2_wo1_wi0_r0_ra0_count0_i : signal is true;
    signal u0_m2_wo1_wi0_r0_ra0_count0_eq : std_logic;
    attribute preserve of u0_m2_wo1_wi0_r0_ra0_count0_eq : signal is true;
    signal u0_m2_wo1_wi0_r0_memr0_reset0 : std_logic;
    signal u0_m2_wo1_wi0_r0_memr0_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo1_wi0_r0_memr0_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m2_wo1_wi0_r0_memr0_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m2_wo1_wi0_r0_memr0_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo1_wi0_r0_memr0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal d_u0_m2_wo1_wi0_r0_memr0_q_15_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo1_wi0_r0_delayr1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo1_wi0_r0_delayr2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo1_wi0_r0_delayr3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo1_wi0_r0_delayr4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo1_ca4_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m2_wo1_ca4_i : UNSIGNED (1 downto 0);
    attribute preserve of u0_m2_wo1_ca4_i : signal is true;
    signal d_u0_m2_wo1_ca4_q_14_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m2_wo1_cm0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo1_cm1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo1_cm2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo1_cm3_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo1_cm4_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo1_mtree_add0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_add0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_add0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_add0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_add0_1_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_add0_1_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_add0_1_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_add0_1_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_add1_0_a : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m2_wo1_mtree_add1_0_b : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m2_wo1_mtree_add1_0_o : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m2_wo1_mtree_add1_0_q : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m2_wo1_mtree_add2_0_a : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m2_wo1_mtree_add2_0_b : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m2_wo1_mtree_add2_0_o : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m2_wo1_mtree_add2_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m2_wo1_aseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m2_wo1_aseq_eq : std_logic;
    signal u0_m2_wo1_accum_a : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m2_wo1_accum_b : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m2_wo1_accum_i : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m2_wo1_accum_o : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m2_wo1_accum_q : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m2_wo1_oseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m2_wo1_oseq_eq : std_logic;
    signal u0_m2_wo1_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal out0_wo0_data_selector_q : STD_LOGIC_VECTOR (50 downto 0);
    signal out0_wo0_data_selector_v : STD_LOGIC_VECTOR (0 downto 0);
    signal out0_wo1_data_selector_q : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_im0_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_im0_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_im0_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_4_im0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_im3_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_4_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_result_add_0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_result_add_0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_result_add_0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_result_add_0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_im0_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_im0_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_im0_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_3_im0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_im3_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_3_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_result_add_0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_result_add_0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_result_add_0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_result_add_0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_im0_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_im0_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_im0_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_im0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_im3_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_result_add_0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_result_add_0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_result_add_0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_result_add_0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im0_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im0_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im0_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_1_im0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im3_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_1_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im0_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im0_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im0_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_im0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im3_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_mult1_4_im0_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m1_wo0_mtree_mult1_4_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo0_mtree_mult1_4_im0_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m1_wo0_mtree_mult1_4_im0_reset : std_logic;
    signal u0_m1_wo0_mtree_mult1_4_im0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m1_wo0_mtree_mult1_4_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m1_wo0_mtree_mult1_4_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo0_mtree_mult1_4_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo0_mtree_mult1_4_im3_reset : std_logic;
    signal u0_m1_wo0_mtree_mult1_4_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo0_mtree_mult1_4_result_add_0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_mult1_4_result_add_0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_mult1_4_result_add_0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_mult1_4_result_add_0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_mult1_3_im0_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m1_wo0_mtree_mult1_3_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo0_mtree_mult1_3_im0_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m1_wo0_mtree_mult1_3_im0_reset : std_logic;
    signal u0_m1_wo0_mtree_mult1_3_im0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m1_wo0_mtree_mult1_3_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m1_wo0_mtree_mult1_3_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo0_mtree_mult1_3_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo0_mtree_mult1_3_im3_reset : std_logic;
    signal u0_m1_wo0_mtree_mult1_3_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo0_mtree_mult1_3_result_add_0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_mult1_3_result_add_0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_mult1_3_result_add_0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_mult1_3_result_add_0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_mult1_2_im0_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m1_wo0_mtree_mult1_2_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo0_mtree_mult1_2_im0_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m1_wo0_mtree_mult1_2_im0_reset : std_logic;
    signal u0_m1_wo0_mtree_mult1_2_im0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m1_wo0_mtree_mult1_2_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m1_wo0_mtree_mult1_2_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo0_mtree_mult1_2_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo0_mtree_mult1_2_im3_reset : std_logic;
    signal u0_m1_wo0_mtree_mult1_2_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo0_mtree_mult1_2_result_add_0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_mult1_2_result_add_0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_mult1_2_result_add_0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_mult1_2_result_add_0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_mult1_1_im0_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m1_wo0_mtree_mult1_1_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo0_mtree_mult1_1_im0_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m1_wo0_mtree_mult1_1_im0_reset : std_logic;
    signal u0_m1_wo0_mtree_mult1_1_im0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m1_wo0_mtree_mult1_1_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m1_wo0_mtree_mult1_1_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo0_mtree_mult1_1_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo0_mtree_mult1_1_im3_reset : std_logic;
    signal u0_m1_wo0_mtree_mult1_1_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo0_mtree_mult1_1_result_add_0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_mult1_1_result_add_0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_mult1_1_result_add_0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_mult1_1_result_add_0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_mult1_0_im0_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m1_wo0_mtree_mult1_0_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo0_mtree_mult1_0_im0_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m1_wo0_mtree_mult1_0_im0_reset : std_logic;
    signal u0_m1_wo0_mtree_mult1_0_im0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m1_wo0_mtree_mult1_0_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m1_wo0_mtree_mult1_0_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo0_mtree_mult1_0_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo0_mtree_mult1_0_im3_reset : std_logic;
    signal u0_m1_wo0_mtree_mult1_0_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo0_mtree_mult1_0_result_add_0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_mult1_0_result_add_0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_mult1_0_result_add_0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo0_mtree_mult1_0_result_add_0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo0_mtree_mult1_2_im0_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m2_wo0_mtree_mult1_2_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo0_mtree_mult1_2_im0_s1 : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m2_wo0_mtree_mult1_2_im0_reset : std_logic;
    signal u0_m2_wo0_mtree_mult1_2_im0_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m2_wo0_mtree_mult1_2_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m2_wo0_mtree_mult1_2_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo0_mtree_mult1_2_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo0_mtree_mult1_2_im3_reset : std_logic;
    signal u0_m2_wo0_mtree_mult1_2_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo0_mtree_mult1_2_result_add_0_0_a : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m2_wo0_mtree_mult1_2_result_add_0_0_b : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m2_wo0_mtree_mult1_2_result_add_0_0_o : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m2_wo0_mtree_mult1_2_result_add_0_0_q : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m2_wo0_mtree_mult1_1_im0_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m2_wo0_mtree_mult1_1_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo0_mtree_mult1_1_im0_s1 : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m2_wo0_mtree_mult1_1_im0_reset : std_logic;
    signal u0_m2_wo0_mtree_mult1_1_im0_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m2_wo0_mtree_mult1_1_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m2_wo0_mtree_mult1_1_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo0_mtree_mult1_1_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo0_mtree_mult1_1_im3_reset : std_logic;
    signal u0_m2_wo0_mtree_mult1_1_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo0_mtree_mult1_1_result_add_0_0_a : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m2_wo0_mtree_mult1_1_result_add_0_0_b : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m2_wo0_mtree_mult1_1_result_add_0_0_o : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m2_wo0_mtree_mult1_1_result_add_0_0_q : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m2_wo0_mtree_mult1_0_im0_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m2_wo0_mtree_mult1_0_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo0_mtree_mult1_0_im0_s1 : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m2_wo0_mtree_mult1_0_im0_reset : std_logic;
    signal u0_m2_wo0_mtree_mult1_0_im0_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m2_wo0_mtree_mult1_0_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m2_wo0_mtree_mult1_0_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo0_mtree_mult1_0_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo0_mtree_mult1_0_im3_reset : std_logic;
    signal u0_m2_wo0_mtree_mult1_0_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo0_mtree_mult1_0_result_add_0_0_a : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m2_wo0_mtree_mult1_0_result_add_0_0_b : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m2_wo0_mtree_mult1_0_result_add_0_0_o : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m2_wo0_mtree_mult1_0_result_add_0_0_q : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_im0_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_im0_s1 : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_im0_reset : std_logic;
    signal u0_m0_wo1_mtree_mult1_2_im0_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_im3_reset : std_logic;
    signal u0_m0_wo1_mtree_mult1_2_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_result_add_0_0_a : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_result_add_0_0_b : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_result_add_0_0_o : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_result_add_0_0_q : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_im0_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_im0_s1 : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_im0_reset : std_logic;
    signal u0_m0_wo1_mtree_mult1_1_im0_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_im3_reset : std_logic;
    signal u0_m0_wo1_mtree_mult1_1_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_result_add_0_0_a : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_result_add_0_0_b : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_result_add_0_0_o : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_result_add_0_0_q : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_im0_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_im0_s1 : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_im0_reset : std_logic;
    signal u0_m0_wo1_mtree_mult1_0_im0_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_im3_reset : std_logic;
    signal u0_m0_wo1_mtree_mult1_0_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_result_add_0_0_a : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_result_add_0_0_b : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_result_add_0_0_o : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_result_add_0_0_q : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m1_wo1_mtree_mult1_4_im0_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m1_wo1_mtree_mult1_4_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo1_mtree_mult1_4_im0_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m1_wo1_mtree_mult1_4_im0_reset : std_logic;
    signal u0_m1_wo1_mtree_mult1_4_im0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m1_wo1_mtree_mult1_4_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m1_wo1_mtree_mult1_4_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo1_mtree_mult1_4_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo1_mtree_mult1_4_im3_reset : std_logic;
    signal u0_m1_wo1_mtree_mult1_4_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo1_mtree_mult1_4_result_add_0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_mult1_4_result_add_0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_mult1_4_result_add_0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_mult1_4_result_add_0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_mult1_3_im0_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m1_wo1_mtree_mult1_3_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo1_mtree_mult1_3_im0_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m1_wo1_mtree_mult1_3_im0_reset : std_logic;
    signal u0_m1_wo1_mtree_mult1_3_im0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m1_wo1_mtree_mult1_3_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m1_wo1_mtree_mult1_3_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo1_mtree_mult1_3_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo1_mtree_mult1_3_im3_reset : std_logic;
    signal u0_m1_wo1_mtree_mult1_3_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo1_mtree_mult1_3_result_add_0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_mult1_3_result_add_0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_mult1_3_result_add_0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_mult1_3_result_add_0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_mult1_2_im0_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m1_wo1_mtree_mult1_2_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo1_mtree_mult1_2_im0_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m1_wo1_mtree_mult1_2_im0_reset : std_logic;
    signal u0_m1_wo1_mtree_mult1_2_im0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m1_wo1_mtree_mult1_2_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m1_wo1_mtree_mult1_2_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo1_mtree_mult1_2_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo1_mtree_mult1_2_im3_reset : std_logic;
    signal u0_m1_wo1_mtree_mult1_2_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo1_mtree_mult1_2_result_add_0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_mult1_2_result_add_0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_mult1_2_result_add_0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_mult1_2_result_add_0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_mult1_1_im0_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m1_wo1_mtree_mult1_1_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo1_mtree_mult1_1_im0_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m1_wo1_mtree_mult1_1_im0_reset : std_logic;
    signal u0_m1_wo1_mtree_mult1_1_im0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m1_wo1_mtree_mult1_1_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m1_wo1_mtree_mult1_1_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo1_mtree_mult1_1_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo1_mtree_mult1_1_im3_reset : std_logic;
    signal u0_m1_wo1_mtree_mult1_1_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo1_mtree_mult1_1_result_add_0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_mult1_1_result_add_0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_mult1_1_result_add_0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_mult1_1_result_add_0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_mult1_0_im0_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m1_wo1_mtree_mult1_0_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo1_mtree_mult1_0_im0_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m1_wo1_mtree_mult1_0_im0_reset : std_logic;
    signal u0_m1_wo1_mtree_mult1_0_im0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m1_wo1_mtree_mult1_0_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m1_wo1_mtree_mult1_0_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m1_wo1_mtree_mult1_0_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo1_mtree_mult1_0_im3_reset : std_logic;
    signal u0_m1_wo1_mtree_mult1_0_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m1_wo1_mtree_mult1_0_result_add_0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_mult1_0_result_add_0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_mult1_0_result_add_0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_mult1_0_result_add_0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_mult1_4_im0_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m2_wo1_mtree_mult1_4_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo1_mtree_mult1_4_im0_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m2_wo1_mtree_mult1_4_im0_reset : std_logic;
    signal u0_m2_wo1_mtree_mult1_4_im0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m2_wo1_mtree_mult1_4_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m2_wo1_mtree_mult1_4_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo1_mtree_mult1_4_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo1_mtree_mult1_4_im3_reset : std_logic;
    signal u0_m2_wo1_mtree_mult1_4_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo1_mtree_mult1_4_result_add_0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_mult1_4_result_add_0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_mult1_4_result_add_0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_mult1_4_result_add_0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_mult1_3_im0_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m2_wo1_mtree_mult1_3_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo1_mtree_mult1_3_im0_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m2_wo1_mtree_mult1_3_im0_reset : std_logic;
    signal u0_m2_wo1_mtree_mult1_3_im0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m2_wo1_mtree_mult1_3_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m2_wo1_mtree_mult1_3_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo1_mtree_mult1_3_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo1_mtree_mult1_3_im3_reset : std_logic;
    signal u0_m2_wo1_mtree_mult1_3_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo1_mtree_mult1_3_result_add_0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_mult1_3_result_add_0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_mult1_3_result_add_0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_mult1_3_result_add_0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_mult1_2_im0_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m2_wo1_mtree_mult1_2_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo1_mtree_mult1_2_im0_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m2_wo1_mtree_mult1_2_im0_reset : std_logic;
    signal u0_m2_wo1_mtree_mult1_2_im0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m2_wo1_mtree_mult1_2_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m2_wo1_mtree_mult1_2_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo1_mtree_mult1_2_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo1_mtree_mult1_2_im3_reset : std_logic;
    signal u0_m2_wo1_mtree_mult1_2_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo1_mtree_mult1_2_result_add_0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_mult1_2_result_add_0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_mult1_2_result_add_0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_mult1_2_result_add_0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_mult1_1_im0_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m2_wo1_mtree_mult1_1_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo1_mtree_mult1_1_im0_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m2_wo1_mtree_mult1_1_im0_reset : std_logic;
    signal u0_m2_wo1_mtree_mult1_1_im0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m2_wo1_mtree_mult1_1_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m2_wo1_mtree_mult1_1_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo1_mtree_mult1_1_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo1_mtree_mult1_1_im3_reset : std_logic;
    signal u0_m2_wo1_mtree_mult1_1_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo1_mtree_mult1_1_result_add_0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_mult1_1_result_add_0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_mult1_1_result_add_0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_mult1_1_result_add_0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_mult1_0_im0_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m2_wo1_mtree_mult1_0_im0_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo1_mtree_mult1_0_im0_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m2_wo1_mtree_mult1_0_im0_reset : std_logic;
    signal u0_m2_wo1_mtree_mult1_0_im0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m2_wo1_mtree_mult1_0_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m2_wo1_mtree_mult1_0_im3_b0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m2_wo1_mtree_mult1_0_im3_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo1_mtree_mult1_0_im3_reset : std_logic;
    signal u0_m2_wo1_mtree_mult1_0_im3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m2_wo1_mtree_mult1_0_result_add_0_0_a : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_mult1_0_result_add_0_0_b : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_mult1_0_result_add_0_0_o : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo1_mtree_mult1_0_result_add_0_0_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo0_oseq_gated_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m1_wo0_oseq_gated_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m2_wo0_oseq_gated_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo1_oseq_gated_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m1_wo1_oseq_gated_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m2_wo1_oseq_gated_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_lut_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m1_wo0_wi0_r0_ra0_count0_lut_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m1_wo0_mtree_mult1_4_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m1_wo0_mtree_mult1_4_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m1_wo0_mtree_mult1_3_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m1_wo0_mtree_mult1_3_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m1_wo0_mtree_mult1_2_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m1_wo0_mtree_mult1_2_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m1_wo0_mtree_mult1_1_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m1_wo0_mtree_mult1_1_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m1_wo0_mtree_mult1_0_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m1_wo0_mtree_mult1_0_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m2_wo0_wi0_r0_ra0_count0_lut_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m2_wo0_wi0_r0_ra3_count0_lut_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m2_wo0_mtree_mult1_2_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m2_wo0_mtree_mult1_2_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m2_wo0_mtree_mult1_1_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m2_wo0_mtree_mult1_1_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m2_wo0_mtree_mult1_0_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m2_wo0_mtree_mult1_0_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_wi0_r0_ra0_count0_lut_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo1_wi0_r0_ra3_count0_lut_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m1_wo1_wi0_r0_ra0_count0_lut_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m1_wo1_mtree_mult1_4_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m1_wo1_mtree_mult1_4_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m1_wo1_mtree_mult1_3_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m1_wo1_mtree_mult1_3_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m1_wo1_mtree_mult1_2_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m1_wo1_mtree_mult1_2_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m1_wo1_mtree_mult1_1_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m1_wo1_mtree_mult1_1_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m1_wo1_mtree_mult1_0_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m1_wo1_mtree_mult1_0_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m2_wo1_wi0_r0_ra0_count0_lut_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m2_wo1_mtree_mult1_4_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m2_wo1_mtree_mult1_4_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m2_wo1_mtree_mult1_3_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m2_wo1_mtree_mult1_3_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m2_wo1_mtree_mult1_2_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m2_wo1_mtree_mult1_2_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m2_wo1_mtree_mult1_1_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m2_wo1_mtree_mult1_1_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m2_wo1_mtree_mult1_0_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m2_wo1_mtree_mult1_0_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_align_8_q : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_align_8_qint : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_align_8_q : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_align_8_qint : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_align_8_q : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_align_8_qint : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_align_8_q : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_align_8_qint : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_align_8_q : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_align_8_qint : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m1_wo0_mtree_mult1_4_align_8_q : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m1_wo0_mtree_mult1_4_align_8_qint : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m1_wo0_mtree_mult1_3_align_8_q : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m1_wo0_mtree_mult1_3_align_8_qint : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m1_wo0_mtree_mult1_2_align_8_q : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m1_wo0_mtree_mult1_2_align_8_qint : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m1_wo0_mtree_mult1_1_align_8_q : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m1_wo0_mtree_mult1_1_align_8_qint : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m1_wo0_mtree_mult1_0_align_8_q : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m1_wo0_mtree_mult1_0_align_8_qint : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m2_wo0_mtree_mult1_2_align_8_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo0_mtree_mult1_2_align_8_qint : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo0_mtree_mult1_1_align_8_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo0_mtree_mult1_1_align_8_qint : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo0_mtree_mult1_0_align_8_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m2_wo0_mtree_mult1_0_align_8_qint : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_align_8_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_align_8_qint : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_align_8_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_align_8_qint : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_align_8_q : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_align_8_qint : STD_LOGIC_VECTOR (46 downto 0);
    signal u0_m1_wo1_mtree_mult1_4_align_8_q : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m1_wo1_mtree_mult1_4_align_8_qint : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m1_wo1_mtree_mult1_3_align_8_q : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m1_wo1_mtree_mult1_3_align_8_qint : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m1_wo1_mtree_mult1_2_align_8_q : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m1_wo1_mtree_mult1_2_align_8_qint : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m1_wo1_mtree_mult1_1_align_8_q : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m1_wo1_mtree_mult1_1_align_8_qint : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m1_wo1_mtree_mult1_0_align_8_q : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m1_wo1_mtree_mult1_0_align_8_qint : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m2_wo1_mtree_mult1_4_align_8_q : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m2_wo1_mtree_mult1_4_align_8_qint : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m2_wo1_mtree_mult1_3_align_8_q : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m2_wo1_mtree_mult1_3_align_8_qint : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m2_wo1_mtree_mult1_2_align_8_q : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m2_wo1_mtree_mult1_2_align_8_qint : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m2_wo1_mtree_mult1_1_align_8_q : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m2_wo1_mtree_mult1_1_align_8_qint : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m2_wo1_mtree_mult1_0_align_8_q : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m2_wo1_mtree_mult1_0_align_8_qint : STD_LOGIC_VECTOR (45 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m1_wo0_mtree_mult1_4_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m1_wo0_mtree_mult1_3_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m1_wo0_mtree_mult1_2_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m1_wo0_mtree_mult1_1_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m1_wo0_mtree_mult1_0_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m2_wo0_mtree_mult1_2_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m2_wo0_mtree_mult1_1_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m2_wo0_mtree_mult1_0_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_2_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_1_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m1_wo1_mtree_mult1_4_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m1_wo1_mtree_mult1_3_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m1_wo1_mtree_mult1_2_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m1_wo1_mtree_mult1_1_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m1_wo1_mtree_mult1_0_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m2_wo1_mtree_mult1_4_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m2_wo1_mtree_mult1_3_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m2_wo1_mtree_mult1_2_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m2_wo1_mtree_mult1_1_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m2_wo1_mtree_mult1_0_bjB6_q : STD_LOGIC_VECTOR (17 downto 0);

begin


    -- u0_m2_wo1_run(ENABLEGENERATOR,234)@10 + 2
    u0_m2_wo1_run_ctrl <= u0_m2_wo1_run_out & xIn_v & u0_m2_wo1_run_enableQ;
    u0_m2_wo1_run_clkproc: PROCESS (clk, areset)
        variable u0_m2_wo1_run_enable_c : SIGNED(2 downto 0);
        variable u0_m2_wo1_run_inc : SIGNED(2 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo1_run_q <= "0";
            u0_m2_wo1_run_enable_c := TO_SIGNED(2, 3);
            u0_m2_wo1_run_enableQ <= "0";
            u0_m2_wo1_run_count <= "001";
            u0_m2_wo1_run_inc := (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m2_wo1_run_out = "1") THEN
                IF (u0_m2_wo1_run_enable_c(2) = '1') THEN
                    u0_m2_wo1_run_enable_c := u0_m2_wo1_run_enable_c - (-3);
                ELSE
                    u0_m2_wo1_run_enable_c := u0_m2_wo1_run_enable_c + (-1);
                END IF;
                u0_m2_wo1_run_enableQ <= STD_LOGIC_VECTOR(u0_m2_wo1_run_enable_c(2 downto 2));
            ELSE
                u0_m2_wo1_run_enableQ <= "0";
            END IF;
            CASE (u0_m2_wo1_run_ctrl) IS
                WHEN "000" | "001" => u0_m2_wo1_run_inc := "000";
                WHEN "010" | "011" => u0_m2_wo1_run_inc := "111";
                WHEN "100" => u0_m2_wo1_run_inc := "000";
                WHEN "101" => u0_m2_wo1_run_inc := "010";
                WHEN "110" => u0_m2_wo1_run_inc := "111";
                WHEN "111" => u0_m2_wo1_run_inc := "001";
                WHEN OTHERS => 
            END CASE;
            u0_m2_wo1_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m2_wo1_run_count) + SIGNED(u0_m2_wo1_run_inc));
            u0_m2_wo1_run_q <= u0_m2_wo1_run_out;
        END IF;
    END PROCESS;
    u0_m2_wo1_run_preEnaQ <= u0_m2_wo1_run_count(2 downto 2);
    u0_m2_wo1_run_out <= u0_m2_wo1_run_preEnaQ and VCC_q;

    -- u0_m2_wo1_memread(DELAY,235)@12
    u0_m2_wo1_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m2_wo1_run_q, xout => u0_m2_wo1_memread_q, clk => clk, aclr => areset );

    -- u0_m2_wo1_compute(DELAY,237)@12
    u0_m2_wo1_compute : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m2_wo1_memread_q, xout => u0_m2_wo1_compute_q, clk => clk, aclr => areset );

    -- d_u0_m2_wo1_compute_q_13(DELAY,650)@12 + 1
    d_u0_m2_wo1_compute_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m2_wo1_compute_q, xout => d_u0_m2_wo1_compute_q_13_q, clk => clk, aclr => areset );

    -- d_u0_m2_wo1_compute_q_18(DELAY,651)@13 + 5
    d_u0_m2_wo1_compute_q_18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m2_wo1_compute_q_13_q, xout => d_u0_m2_wo1_compute_q_18_q, clk => clk, aclr => areset );

    -- u0_m2_wo1_aseq(SEQUENCE,267)@18 + 1
    u0_m2_wo1_aseq_clkproc: PROCESS (clk, areset)
        variable u0_m2_wo1_aseq_c : SIGNED(4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo1_aseq_c := "00000";
            u0_m2_wo1_aseq_q <= "0";
            u0_m2_wo1_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m2_wo1_compute_q_18_q = "1") THEN
                IF (u0_m2_wo1_aseq_c = "00000") THEN
                    u0_m2_wo1_aseq_eq <= '1';
                ELSE
                    u0_m2_wo1_aseq_eq <= '0';
                END IF;
                IF (u0_m2_wo1_aseq_eq = '1') THEN
                    u0_m2_wo1_aseq_c := u0_m2_wo1_aseq_c + 3;
                ELSE
                    u0_m2_wo1_aseq_c := u0_m2_wo1_aseq_c - 1;
                END IF;
                u0_m2_wo1_aseq_q <= STD_LOGIC_VECTOR(u0_m2_wo1_aseq_c(4 downto 4));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m2_wo1_compute_q_19(DELAY,652)@18 + 1
    d_u0_m2_wo1_compute_q_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m2_wo1_compute_q_18_q, xout => d_u0_m2_wo1_compute_q_19_q, clk => clk, aclr => areset );

    -- u0_m2_wo1_ca4(COUNTER,249)@12
    -- low=0, high=3, step=1, init=0
    u0_m2_wo1_ca4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo1_ca4_i <= TO_UNSIGNED(0, 2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m2_wo1_compute_q = "1") THEN
                u0_m2_wo1_ca4_i <= u0_m2_wo1_ca4_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m2_wo1_ca4_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m2_wo1_ca4_i, 2)));

    -- d_u0_m2_wo1_ca4_q_14(DELAY,654)@12 + 2
    d_u0_m2_wo1_ca4_q_14 : dspba_delay
    GENERIC MAP ( width => 2, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m2_wo1_ca4_q, xout => d_u0_m2_wo1_ca4_q_14_q, clk => clk, aclr => areset );

    -- u0_m2_wo1_cm0(LOOKUP,253)@14 + 1
    u0_m2_wo1_cm0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo1_cm0_q <= "00000100011111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (d_u0_m2_wo1_ca4_q_14_q) IS
                WHEN "00" => u0_m2_wo1_cm0_q <= "00000100011111";
                WHEN "01" => u0_m2_wo1_cm0_q <= "11111011001101";
                WHEN "10" => u0_m2_wo1_cm0_q <= "00000011100001";
                WHEN "11" => u0_m2_wo1_cm0_q <= "00000011111000";
                WHEN OTHERS => -- unreachable
                               u0_m2_wo1_cm0_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- d_u0_m2_wo1_memread_q_13(DELAY,649)@12 + 1
    d_u0_m2_wo1_memread_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m2_wo1_memread_q, xout => d_u0_m2_wo1_memread_q_13_q, clk => clk, aclr => areset );

    -- u0_m2_wo1_wi0_r0_ra0_count0(COUNTER,242)@13
    -- low=0, high=11, step=1, init=1
    u0_m2_wo1_wi0_r0_ra0_count0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo1_wi0_r0_ra0_count0_i <= TO_UNSIGNED(1, 4);
            u0_m2_wo1_wi0_r0_ra0_count0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m2_wo1_memread_q_13_q = "1") THEN
                IF (u0_m2_wo1_wi0_r0_ra0_count0_i = TO_UNSIGNED(10, 4)) THEN
                    u0_m2_wo1_wi0_r0_ra0_count0_eq <= '1';
                ELSE
                    u0_m2_wo1_wi0_r0_ra0_count0_eq <= '0';
                END IF;
                IF (u0_m2_wo1_wi0_r0_ra0_count0_eq = '1') THEN
                    u0_m2_wo1_wi0_r0_ra0_count0_i <= u0_m2_wo1_wi0_r0_ra0_count0_i + 5;
                ELSE
                    u0_m2_wo1_wi0_r0_ra0_count0_i <= u0_m2_wo1_wi0_r0_ra0_count0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m2_wo1_wi0_r0_ra0_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m2_wo1_wi0_r0_ra0_count0_i, 4)));

    -- u0_m2_wo1_wi0_r0_ra0_count0_lut(LOOKUP,240)@13
    u0_m2_wo1_wi0_r0_ra0_count0_lut_combproc: PROCESS (u0_m2_wo1_wi0_r0_ra0_count0_q)
    BEGIN
        -- Begin reserved scope level
        CASE (u0_m2_wo1_wi0_r0_ra0_count0_q) IS
            WHEN "0000" => u0_m2_wo1_wi0_r0_ra0_count0_lut_q <= "000";
            WHEN "0001" => u0_m2_wo1_wi0_r0_ra0_count0_lut_q <= "001";
            WHEN "0010" => u0_m2_wo1_wi0_r0_ra0_count0_lut_q <= "010";
            WHEN "0011" => u0_m2_wo1_wi0_r0_ra0_count0_lut_q <= "011";
            WHEN "0100" => u0_m2_wo1_wi0_r0_ra0_count0_lut_q <= "010";
            WHEN "0101" => u0_m2_wo1_wi0_r0_ra0_count0_lut_q <= "011";
            WHEN "0110" => u0_m2_wo1_wi0_r0_ra0_count0_lut_q <= "100";
            WHEN "0111" => u0_m2_wo1_wi0_r0_ra0_count0_lut_q <= "101";
            WHEN "1000" => u0_m2_wo1_wi0_r0_ra0_count0_lut_q <= "100";
            WHEN "1001" => u0_m2_wo1_wi0_r0_ra0_count0_lut_q <= "101";
            WHEN "1010" => u0_m2_wo1_wi0_r0_ra0_count0_lut_q <= "000";
            WHEN "1011" => u0_m2_wo1_wi0_r0_ra0_count0_lut_q <= "001";
            WHEN OTHERS => -- unreachable
                           u0_m2_wo1_wi0_r0_ra0_count0_lut_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- u0_m2_wo1_wi0_r0_ra0_count0_lutreg(REG,241)@13
    u0_m2_wo1_wi0_r0_ra0_count0_lutreg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo1_wi0_r0_ra0_count0_lutreg_q <= "000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m2_wo1_memread_q_13_q = "1") THEN
                u0_m2_wo1_wi0_r0_ra0_count0_lutreg_q <= STD_LOGIC_VECTOR(u0_m2_wo1_wi0_r0_ra0_count0_lut_q);
            END IF;
        END IF;
    END PROCESS;

    -- d_xIn_0_13(DELAY,611)@10 + 3
    d_xIn_0_13 : dspba_delay
    GENERIC MAP ( width => 32, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => d_xIn_0_13_q, clk => clk, aclr => areset );

    -- d_in0_m0_wi0_wo0_assign_id1_q_13(DELAY,612)@10 + 3
    d_in0_m0_wi0_wo0_assign_id1_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_in0_m0_wi0_wo0_assign_id1_q_13_q, clk => clk, aclr => areset );

    -- u0_m2_wo0_wi0_r0_wa0(COUNTER,112)@13
    -- low=0, high=5, step=1, init=2
    u0_m2_wo0_wi0_r0_wa0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_wi0_r0_wa0_i <= TO_UNSIGNED(2, 3);
            u0_m2_wo0_wi0_r0_wa0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_13_q = "1") THEN
                IF (u0_m2_wo0_wi0_r0_wa0_i = TO_UNSIGNED(4, 3)) THEN
                    u0_m2_wo0_wi0_r0_wa0_eq <= '1';
                ELSE
                    u0_m2_wo0_wi0_r0_wa0_eq <= '0';
                END IF;
                IF (u0_m2_wo0_wi0_r0_wa0_eq = '1') THEN
                    u0_m2_wo0_wi0_r0_wa0_i <= u0_m2_wo0_wi0_r0_wa0_i + 3;
                ELSE
                    u0_m2_wo0_wi0_r0_wa0_i <= u0_m2_wo0_wi0_r0_wa0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m2_wo0_wi0_r0_wa0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m2_wo0_wi0_r0_wa0_i, 3)));

    -- u0_m2_wo1_wi0_r0_memr0(DUALMEM,244)@13
    u0_m2_wo1_wi0_r0_memr0_ia <= STD_LOGIC_VECTOR(d_xIn_0_13_q);
    u0_m2_wo1_wi0_r0_memr0_aa <= u0_m2_wo0_wi0_r0_wa0_q;
    u0_m2_wo1_wi0_r0_memr0_ab <= u0_m2_wo1_wi0_r0_ra0_count0_lutreg_q;
    u0_m2_wo1_wi0_r0_memr0_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 6,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m2_wo1_wi0_r0_memr0_aa,
        data_a => u0_m2_wo1_wi0_r0_memr0_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_13_q(0),
        address_b => u0_m2_wo1_wi0_r0_memr0_ab,
        q_b => u0_m2_wo1_wi0_r0_memr0_iq
    );
    u0_m2_wo1_wi0_r0_memr0_q <= u0_m2_wo1_wi0_r0_memr0_iq(31 downto 0);

    -- d_u0_m2_wo1_wi0_r0_memr0_q_15(DELAY,653)@13 + 2
    d_u0_m2_wo1_wi0_r0_memr0_q_15 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m2_wo1_wi0_r0_memr0_q, xout => d_u0_m2_wo1_wi0_r0_memr0_q_15_q, clk => clk, aclr => areset );

    -- u0_m2_wo1_mtree_mult1_4_bs2_merged_bit_select(BITSELECT,606)@15
    u0_m2_wo1_mtree_mult1_4_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(d_u0_m2_wo1_wi0_r0_memr0_q_15_q(31 downto 17));
    u0_m2_wo1_mtree_mult1_4_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(d_u0_m2_wo1_wi0_r0_memr0_q_15_q(16 downto 0));

    -- u0_m2_wo1_mtree_mult1_4_im0(MULT,530)@15 + 2
    u0_m2_wo1_mtree_mult1_4_im0_a0 <= STD_LOGIC_VECTOR(u0_m2_wo1_mtree_mult1_4_bs2_merged_bit_select_b);
    u0_m2_wo1_mtree_mult1_4_im0_b0 <= STD_LOGIC_VECTOR(u0_m2_wo1_cm0_q);
    u0_m2_wo1_mtree_mult1_4_im0_reset <= areset;
    u0_m2_wo1_mtree_mult1_4_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 14,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m2_wo1_mtree_mult1_4_im0_a0,
        datab => u0_m2_wo1_mtree_mult1_4_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m2_wo1_mtree_mult1_4_im0_reset,
        clock => clk,
        result => u0_m2_wo1_mtree_mult1_4_im0_s1
    );
    u0_m2_wo1_mtree_mult1_4_im0_q <= u0_m2_wo1_mtree_mult1_4_im0_s1;

    -- u0_m2_wo1_mtree_mult1_4_align_8(BITSHIFT,538)@17
    u0_m2_wo1_mtree_mult1_4_align_8_qint <= u0_m2_wo1_mtree_mult1_4_im0_q & "00000000000000000";
    u0_m2_wo1_mtree_mult1_4_align_8_q <= u0_m2_wo1_mtree_mult1_4_align_8_qint(45 downto 0);

    -- u0_m2_wo1_mtree_mult1_4_bjB6(BITJOIN,536)@15
    u0_m2_wo1_mtree_mult1_4_bjB6_q <= GND_q & u0_m2_wo1_mtree_mult1_4_bs2_merged_bit_select_c;

    -- u0_m2_wo1_mtree_mult1_4_im3(MULT,533)@15 + 2
    u0_m2_wo1_mtree_mult1_4_im3_a0 <= STD_LOGIC_VECTOR(u0_m2_wo1_mtree_mult1_4_bjB6_q);
    u0_m2_wo1_mtree_mult1_4_im3_b0 <= STD_LOGIC_VECTOR(u0_m2_wo1_cm0_q);
    u0_m2_wo1_mtree_mult1_4_im3_reset <= areset;
    u0_m2_wo1_mtree_mult1_4_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m2_wo1_mtree_mult1_4_im3_a0,
        datab => u0_m2_wo1_mtree_mult1_4_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m2_wo1_mtree_mult1_4_im3_reset,
        clock => clk,
        result => u0_m2_wo1_mtree_mult1_4_im3_s1
    );
    u0_m2_wo1_mtree_mult1_4_im3_q <= u0_m2_wo1_mtree_mult1_4_im3_s1;

    -- u0_m2_wo1_mtree_mult1_4_result_add_0_0(ADD,540)@17 + 1
    u0_m2_wo1_mtree_mult1_4_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 32 => u0_m2_wo1_mtree_mult1_4_im3_q(31)) & u0_m2_wo1_mtree_mult1_4_im3_q));
    u0_m2_wo1_mtree_mult1_4_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 46 => u0_m2_wo1_mtree_mult1_4_align_8_q(45)) & u0_m2_wo1_mtree_mult1_4_align_8_q));
    u0_m2_wo1_mtree_mult1_4_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo1_mtree_mult1_4_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m2_wo1_mtree_mult1_4_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m2_wo1_mtree_mult1_4_result_add_0_0_a) + SIGNED(u0_m2_wo1_mtree_mult1_4_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m2_wo1_mtree_mult1_4_result_add_0_0_q <= u0_m2_wo1_mtree_mult1_4_result_add_0_0_o(46 downto 0);

    -- u0_m2_wo1_cm1(LOOKUP,254)@12 + 1
    u0_m2_wo1_cm1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo1_cm1_q <= "11101011010010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m2_wo1_ca4_q) IS
                WHEN "00" => u0_m2_wo1_cm1_q <= "11101011010010";
                WHEN "01" => u0_m2_wo1_cm1_q <= "00001111001010";
                WHEN "10" => u0_m2_wo1_cm1_q <= "11111001100011";
                WHEN "11" => u0_m2_wo1_cm1_q <= "11111111001100";
                WHEN OTHERS => -- unreachable
                               u0_m2_wo1_cm1_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m2_wo1_wi0_r0_delayr1(DELAY,245)@13
    u0_m2_wo1_wi0_r0_delayr1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m2_wo1_wi0_r0_memr0_q, xout => u0_m2_wo1_wi0_r0_delayr1_q, ena => d_u0_m2_wo1_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m2_wo1_mtree_mult1_3_bs2_merged_bit_select(BITSELECT,607)@13
    u0_m2_wo1_mtree_mult1_3_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m2_wo1_wi0_r0_delayr1_q(31 downto 17));
    u0_m2_wo1_mtree_mult1_3_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m2_wo1_wi0_r0_delayr1_q(16 downto 0));

    -- u0_m2_wo1_mtree_mult1_3_im0(MULT,541)@13 + 2
    u0_m2_wo1_mtree_mult1_3_im0_a0 <= STD_LOGIC_VECTOR(u0_m2_wo1_mtree_mult1_3_bs2_merged_bit_select_b);
    u0_m2_wo1_mtree_mult1_3_im0_b0 <= STD_LOGIC_VECTOR(u0_m2_wo1_cm1_q);
    u0_m2_wo1_mtree_mult1_3_im0_reset <= areset;
    u0_m2_wo1_mtree_mult1_3_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 14,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m2_wo1_mtree_mult1_3_im0_a0,
        datab => u0_m2_wo1_mtree_mult1_3_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m2_wo1_mtree_mult1_3_im0_reset,
        clock => clk,
        result => u0_m2_wo1_mtree_mult1_3_im0_s1
    );
    u0_m2_wo1_mtree_mult1_3_im0_q <= u0_m2_wo1_mtree_mult1_3_im0_s1;

    -- u0_m2_wo1_mtree_mult1_3_align_8(BITSHIFT,549)@15
    u0_m2_wo1_mtree_mult1_3_align_8_qint <= u0_m2_wo1_mtree_mult1_3_im0_q & "00000000000000000";
    u0_m2_wo1_mtree_mult1_3_align_8_q <= u0_m2_wo1_mtree_mult1_3_align_8_qint(45 downto 0);

    -- u0_m2_wo1_mtree_mult1_3_bjB6(BITJOIN,547)@13
    u0_m2_wo1_mtree_mult1_3_bjB6_q <= GND_q & u0_m2_wo1_mtree_mult1_3_bs2_merged_bit_select_c;

    -- u0_m2_wo1_mtree_mult1_3_im3(MULT,544)@13 + 2
    u0_m2_wo1_mtree_mult1_3_im3_a0 <= STD_LOGIC_VECTOR(u0_m2_wo1_mtree_mult1_3_bjB6_q);
    u0_m2_wo1_mtree_mult1_3_im3_b0 <= STD_LOGIC_VECTOR(u0_m2_wo1_cm1_q);
    u0_m2_wo1_mtree_mult1_3_im3_reset <= areset;
    u0_m2_wo1_mtree_mult1_3_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m2_wo1_mtree_mult1_3_im3_a0,
        datab => u0_m2_wo1_mtree_mult1_3_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m2_wo1_mtree_mult1_3_im3_reset,
        clock => clk,
        result => u0_m2_wo1_mtree_mult1_3_im3_s1
    );
    u0_m2_wo1_mtree_mult1_3_im3_q <= u0_m2_wo1_mtree_mult1_3_im3_s1;

    -- u0_m2_wo1_mtree_mult1_3_result_add_0_0(ADD,551)@15 + 1
    u0_m2_wo1_mtree_mult1_3_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 32 => u0_m2_wo1_mtree_mult1_3_im3_q(31)) & u0_m2_wo1_mtree_mult1_3_im3_q));
    u0_m2_wo1_mtree_mult1_3_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 46 => u0_m2_wo1_mtree_mult1_3_align_8_q(45)) & u0_m2_wo1_mtree_mult1_3_align_8_q));
    u0_m2_wo1_mtree_mult1_3_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo1_mtree_mult1_3_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m2_wo1_mtree_mult1_3_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m2_wo1_mtree_mult1_3_result_add_0_0_a) + SIGNED(u0_m2_wo1_mtree_mult1_3_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m2_wo1_mtree_mult1_3_result_add_0_0_q <= u0_m2_wo1_mtree_mult1_3_result_add_0_0_o(46 downto 0);

    -- u0_m2_wo1_cm2(LOOKUP,255)@12 + 1
    u0_m2_wo1_cm2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo1_cm2_q <= "11100100011110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m2_wo1_ca4_q) IS
                WHEN "00" => u0_m2_wo1_cm2_q <= "11100100011110";
                WHEN "01" => u0_m2_wo1_cm2_q <= "00111010100100";
                WHEN "10" => u0_m2_wo1_cm2_q <= "01111111111110";
                WHEN "11" => u0_m2_wo1_cm2_q <= "00001110100011";
                WHEN OTHERS => -- unreachable
                               u0_m2_wo1_cm2_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m2_wo1_wi0_r0_delayr2(DELAY,246)@13
    u0_m2_wo1_wi0_r0_delayr2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m2_wo1_wi0_r0_delayr1_q, xout => u0_m2_wo1_wi0_r0_delayr2_q, ena => d_u0_m2_wo1_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m2_wo1_mtree_mult1_2_bs2_merged_bit_select(BITSELECT,608)@13
    u0_m2_wo1_mtree_mult1_2_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m2_wo1_wi0_r0_delayr2_q(31 downto 17));
    u0_m2_wo1_mtree_mult1_2_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m2_wo1_wi0_r0_delayr2_q(16 downto 0));

    -- u0_m2_wo1_mtree_mult1_2_im0(MULT,552)@13 + 2
    u0_m2_wo1_mtree_mult1_2_im0_a0 <= STD_LOGIC_VECTOR(u0_m2_wo1_mtree_mult1_2_bs2_merged_bit_select_b);
    u0_m2_wo1_mtree_mult1_2_im0_b0 <= STD_LOGIC_VECTOR(u0_m2_wo1_cm2_q);
    u0_m2_wo1_mtree_mult1_2_im0_reset <= areset;
    u0_m2_wo1_mtree_mult1_2_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 14,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m2_wo1_mtree_mult1_2_im0_a0,
        datab => u0_m2_wo1_mtree_mult1_2_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m2_wo1_mtree_mult1_2_im0_reset,
        clock => clk,
        result => u0_m2_wo1_mtree_mult1_2_im0_s1
    );
    u0_m2_wo1_mtree_mult1_2_im0_q <= u0_m2_wo1_mtree_mult1_2_im0_s1;

    -- u0_m2_wo1_mtree_mult1_2_align_8(BITSHIFT,560)@15
    u0_m2_wo1_mtree_mult1_2_align_8_qint <= u0_m2_wo1_mtree_mult1_2_im0_q & "00000000000000000";
    u0_m2_wo1_mtree_mult1_2_align_8_q <= u0_m2_wo1_mtree_mult1_2_align_8_qint(45 downto 0);

    -- u0_m2_wo1_mtree_mult1_2_bjB6(BITJOIN,558)@13
    u0_m2_wo1_mtree_mult1_2_bjB6_q <= GND_q & u0_m2_wo1_mtree_mult1_2_bs2_merged_bit_select_c;

    -- u0_m2_wo1_mtree_mult1_2_im3(MULT,555)@13 + 2
    u0_m2_wo1_mtree_mult1_2_im3_a0 <= STD_LOGIC_VECTOR(u0_m2_wo1_mtree_mult1_2_bjB6_q);
    u0_m2_wo1_mtree_mult1_2_im3_b0 <= STD_LOGIC_VECTOR(u0_m2_wo1_cm2_q);
    u0_m2_wo1_mtree_mult1_2_im3_reset <= areset;
    u0_m2_wo1_mtree_mult1_2_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m2_wo1_mtree_mult1_2_im3_a0,
        datab => u0_m2_wo1_mtree_mult1_2_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m2_wo1_mtree_mult1_2_im3_reset,
        clock => clk,
        result => u0_m2_wo1_mtree_mult1_2_im3_s1
    );
    u0_m2_wo1_mtree_mult1_2_im3_q <= u0_m2_wo1_mtree_mult1_2_im3_s1;

    -- u0_m2_wo1_mtree_mult1_2_result_add_0_0(ADD,562)@15 + 1
    u0_m2_wo1_mtree_mult1_2_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 32 => u0_m2_wo1_mtree_mult1_2_im3_q(31)) & u0_m2_wo1_mtree_mult1_2_im3_q));
    u0_m2_wo1_mtree_mult1_2_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 46 => u0_m2_wo1_mtree_mult1_2_align_8_q(45)) & u0_m2_wo1_mtree_mult1_2_align_8_q));
    u0_m2_wo1_mtree_mult1_2_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo1_mtree_mult1_2_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m2_wo1_mtree_mult1_2_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m2_wo1_mtree_mult1_2_result_add_0_0_a) + SIGNED(u0_m2_wo1_mtree_mult1_2_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m2_wo1_mtree_mult1_2_result_add_0_0_q <= u0_m2_wo1_mtree_mult1_2_result_add_0_0_o(46 downto 0);

    -- u0_m2_wo1_mtree_add0_1(ADD,264)@16 + 1
    u0_m2_wo1_mtree_add0_1_a <= STD_LOGIC_VECTOR(u0_m2_wo1_mtree_mult1_2_result_add_0_0_q);
    u0_m2_wo1_mtree_add0_1_b <= STD_LOGIC_VECTOR(u0_m2_wo1_mtree_mult1_3_result_add_0_0_q);
    u0_m2_wo1_mtree_add0_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo1_mtree_add0_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m2_wo1_mtree_add0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m2_wo1_mtree_add0_1_a) + SIGNED(u0_m2_wo1_mtree_add0_1_b));
        END IF;
    END PROCESS;
    u0_m2_wo1_mtree_add0_1_q <= u0_m2_wo1_mtree_add0_1_o(46 downto 0);

    -- u0_m2_wo1_cm3(LOOKUP,256)@12 + 1
    u0_m2_wo1_cm3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo1_cm3_q <= "00000110100110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m2_wo1_ca4_q) IS
                WHEN "00" => u0_m2_wo1_cm3_q <= "00000110100110";
                WHEN "01" => u0_m2_wo1_cm3_q <= "11111001000011";
                WHEN "10" => u0_m2_wo1_cm3_q <= "00000010000011";
                WHEN "11" => u0_m2_wo1_cm3_q <= "00001001011010";
                WHEN OTHERS => -- unreachable
                               u0_m2_wo1_cm3_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m2_wo1_wi0_r0_delayr3(DELAY,247)@13
    u0_m2_wo1_wi0_r0_delayr3 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m2_wo1_wi0_r0_delayr2_q, xout => u0_m2_wo1_wi0_r0_delayr3_q, ena => d_u0_m2_wo1_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m2_wo1_mtree_mult1_1_bs2_merged_bit_select(BITSELECT,609)@13
    u0_m2_wo1_mtree_mult1_1_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m2_wo1_wi0_r0_delayr3_q(31 downto 17));
    u0_m2_wo1_mtree_mult1_1_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m2_wo1_wi0_r0_delayr3_q(16 downto 0));

    -- u0_m2_wo1_mtree_mult1_1_im0(MULT,563)@13 + 2
    u0_m2_wo1_mtree_mult1_1_im0_a0 <= STD_LOGIC_VECTOR(u0_m2_wo1_mtree_mult1_1_bs2_merged_bit_select_b);
    u0_m2_wo1_mtree_mult1_1_im0_b0 <= STD_LOGIC_VECTOR(u0_m2_wo1_cm3_q);
    u0_m2_wo1_mtree_mult1_1_im0_reset <= areset;
    u0_m2_wo1_mtree_mult1_1_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 14,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m2_wo1_mtree_mult1_1_im0_a0,
        datab => u0_m2_wo1_mtree_mult1_1_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m2_wo1_mtree_mult1_1_im0_reset,
        clock => clk,
        result => u0_m2_wo1_mtree_mult1_1_im0_s1
    );
    u0_m2_wo1_mtree_mult1_1_im0_q <= u0_m2_wo1_mtree_mult1_1_im0_s1;

    -- u0_m2_wo1_mtree_mult1_1_align_8(BITSHIFT,571)@15
    u0_m2_wo1_mtree_mult1_1_align_8_qint <= u0_m2_wo1_mtree_mult1_1_im0_q & "00000000000000000";
    u0_m2_wo1_mtree_mult1_1_align_8_q <= u0_m2_wo1_mtree_mult1_1_align_8_qint(45 downto 0);

    -- u0_m2_wo1_mtree_mult1_1_bjB6(BITJOIN,569)@13
    u0_m2_wo1_mtree_mult1_1_bjB6_q <= GND_q & u0_m2_wo1_mtree_mult1_1_bs2_merged_bit_select_c;

    -- u0_m2_wo1_mtree_mult1_1_im3(MULT,566)@13 + 2
    u0_m2_wo1_mtree_mult1_1_im3_a0 <= STD_LOGIC_VECTOR(u0_m2_wo1_mtree_mult1_1_bjB6_q);
    u0_m2_wo1_mtree_mult1_1_im3_b0 <= STD_LOGIC_VECTOR(u0_m2_wo1_cm3_q);
    u0_m2_wo1_mtree_mult1_1_im3_reset <= areset;
    u0_m2_wo1_mtree_mult1_1_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m2_wo1_mtree_mult1_1_im3_a0,
        datab => u0_m2_wo1_mtree_mult1_1_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m2_wo1_mtree_mult1_1_im3_reset,
        clock => clk,
        result => u0_m2_wo1_mtree_mult1_1_im3_s1
    );
    u0_m2_wo1_mtree_mult1_1_im3_q <= u0_m2_wo1_mtree_mult1_1_im3_s1;

    -- u0_m2_wo1_mtree_mult1_1_result_add_0_0(ADD,573)@15 + 1
    u0_m2_wo1_mtree_mult1_1_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 32 => u0_m2_wo1_mtree_mult1_1_im3_q(31)) & u0_m2_wo1_mtree_mult1_1_im3_q));
    u0_m2_wo1_mtree_mult1_1_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 46 => u0_m2_wo1_mtree_mult1_1_align_8_q(45)) & u0_m2_wo1_mtree_mult1_1_align_8_q));
    u0_m2_wo1_mtree_mult1_1_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo1_mtree_mult1_1_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m2_wo1_mtree_mult1_1_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m2_wo1_mtree_mult1_1_result_add_0_0_a) + SIGNED(u0_m2_wo1_mtree_mult1_1_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m2_wo1_mtree_mult1_1_result_add_0_0_q <= u0_m2_wo1_mtree_mult1_1_result_add_0_0_o(46 downto 0);

    -- u0_m2_wo1_cm4(LOOKUP,257)@12 + 1
    u0_m2_wo1_cm4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo1_cm4_q <= "00000000101110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m2_wo1_ca4_q) IS
                WHEN "00" => u0_m2_wo1_cm4_q <= "00000000101110";
                WHEN "01" => u0_m2_wo1_cm4_q <= "00000101010111";
                WHEN "10" => u0_m2_wo1_cm4_q <= "00000000001100";
                WHEN "11" => u0_m2_wo1_cm4_q <= "11111100011100";
                WHEN OTHERS => -- unreachable
                               u0_m2_wo1_cm4_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m2_wo1_wi0_r0_delayr4(DELAY,248)@13
    u0_m2_wo1_wi0_r0_delayr4 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m2_wo1_wi0_r0_delayr3_q, xout => u0_m2_wo1_wi0_r0_delayr4_q, ena => d_u0_m2_wo1_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m2_wo1_mtree_mult1_0_bs2_merged_bit_select(BITSELECT,610)@13
    u0_m2_wo1_mtree_mult1_0_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m2_wo1_wi0_r0_delayr4_q(31 downto 17));
    u0_m2_wo1_mtree_mult1_0_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m2_wo1_wi0_r0_delayr4_q(16 downto 0));

    -- u0_m2_wo1_mtree_mult1_0_im0(MULT,574)@13 + 2
    u0_m2_wo1_mtree_mult1_0_im0_a0 <= STD_LOGIC_VECTOR(u0_m2_wo1_mtree_mult1_0_bs2_merged_bit_select_b);
    u0_m2_wo1_mtree_mult1_0_im0_b0 <= STD_LOGIC_VECTOR(u0_m2_wo1_cm4_q);
    u0_m2_wo1_mtree_mult1_0_im0_reset <= areset;
    u0_m2_wo1_mtree_mult1_0_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 14,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m2_wo1_mtree_mult1_0_im0_a0,
        datab => u0_m2_wo1_mtree_mult1_0_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m2_wo1_mtree_mult1_0_im0_reset,
        clock => clk,
        result => u0_m2_wo1_mtree_mult1_0_im0_s1
    );
    u0_m2_wo1_mtree_mult1_0_im0_q <= u0_m2_wo1_mtree_mult1_0_im0_s1;

    -- u0_m2_wo1_mtree_mult1_0_align_8(BITSHIFT,582)@15
    u0_m2_wo1_mtree_mult1_0_align_8_qint <= u0_m2_wo1_mtree_mult1_0_im0_q & "00000000000000000";
    u0_m2_wo1_mtree_mult1_0_align_8_q <= u0_m2_wo1_mtree_mult1_0_align_8_qint(45 downto 0);

    -- u0_m2_wo1_mtree_mult1_0_bjB6(BITJOIN,580)@13
    u0_m2_wo1_mtree_mult1_0_bjB6_q <= GND_q & u0_m2_wo1_mtree_mult1_0_bs2_merged_bit_select_c;

    -- u0_m2_wo1_mtree_mult1_0_im3(MULT,577)@13 + 2
    u0_m2_wo1_mtree_mult1_0_im3_a0 <= STD_LOGIC_VECTOR(u0_m2_wo1_mtree_mult1_0_bjB6_q);
    u0_m2_wo1_mtree_mult1_0_im3_b0 <= STD_LOGIC_VECTOR(u0_m2_wo1_cm4_q);
    u0_m2_wo1_mtree_mult1_0_im3_reset <= areset;
    u0_m2_wo1_mtree_mult1_0_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m2_wo1_mtree_mult1_0_im3_a0,
        datab => u0_m2_wo1_mtree_mult1_0_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m2_wo1_mtree_mult1_0_im3_reset,
        clock => clk,
        result => u0_m2_wo1_mtree_mult1_0_im3_s1
    );
    u0_m2_wo1_mtree_mult1_0_im3_q <= u0_m2_wo1_mtree_mult1_0_im3_s1;

    -- u0_m2_wo1_mtree_mult1_0_result_add_0_0(ADD,584)@15 + 1
    u0_m2_wo1_mtree_mult1_0_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 32 => u0_m2_wo1_mtree_mult1_0_im3_q(31)) & u0_m2_wo1_mtree_mult1_0_im3_q));
    u0_m2_wo1_mtree_mult1_0_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 46 => u0_m2_wo1_mtree_mult1_0_align_8_q(45)) & u0_m2_wo1_mtree_mult1_0_align_8_q));
    u0_m2_wo1_mtree_mult1_0_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo1_mtree_mult1_0_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m2_wo1_mtree_mult1_0_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m2_wo1_mtree_mult1_0_result_add_0_0_a) + SIGNED(u0_m2_wo1_mtree_mult1_0_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m2_wo1_mtree_mult1_0_result_add_0_0_q <= u0_m2_wo1_mtree_mult1_0_result_add_0_0_o(46 downto 0);

    -- u0_m2_wo1_mtree_add0_0(ADD,263)@16 + 1
    u0_m2_wo1_mtree_add0_0_a <= STD_LOGIC_VECTOR(u0_m2_wo1_mtree_mult1_0_result_add_0_0_q);
    u0_m2_wo1_mtree_add0_0_b <= STD_LOGIC_VECTOR(u0_m2_wo1_mtree_mult1_1_result_add_0_0_q);
    u0_m2_wo1_mtree_add0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo1_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m2_wo1_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m2_wo1_mtree_add0_0_a) + SIGNED(u0_m2_wo1_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m2_wo1_mtree_add0_0_q <= u0_m2_wo1_mtree_add0_0_o(46 downto 0);

    -- u0_m2_wo1_mtree_add1_0(ADD,265)@17 + 1
    u0_m2_wo1_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 47 => u0_m2_wo1_mtree_add0_0_q(46)) & u0_m2_wo1_mtree_add0_0_q));
    u0_m2_wo1_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 47 => u0_m2_wo1_mtree_add0_1_q(46)) & u0_m2_wo1_mtree_add0_1_q));
    u0_m2_wo1_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo1_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m2_wo1_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m2_wo1_mtree_add1_0_a) + SIGNED(u0_m2_wo1_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m2_wo1_mtree_add1_0_q <= u0_m2_wo1_mtree_add1_0_o(47 downto 0);

    -- u0_m2_wo1_mtree_add2_0(ADD,266)@18 + 1
    u0_m2_wo1_mtree_add2_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 48 => u0_m2_wo1_mtree_add1_0_q(47)) & u0_m2_wo1_mtree_add1_0_q));
    u0_m2_wo1_mtree_add2_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 47 => u0_m2_wo1_mtree_mult1_4_result_add_0_0_q(46)) & u0_m2_wo1_mtree_mult1_4_result_add_0_0_q));
    u0_m2_wo1_mtree_add2_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo1_mtree_add2_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m2_wo1_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m2_wo1_mtree_add2_0_a) + SIGNED(u0_m2_wo1_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m2_wo1_mtree_add2_0_q <= u0_m2_wo1_mtree_add2_0_o(48 downto 0);

    -- u0_m2_wo1_accum(ADD,268)@19 + 1
    u0_m2_wo1_accum_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((50 downto 49 => u0_m2_wo1_mtree_add2_0_q(48)) & u0_m2_wo1_mtree_add2_0_q));
    u0_m2_wo1_accum_b <= STD_LOGIC_VECTOR(u0_m2_wo1_accum_q);
    u0_m2_wo1_accum_i <= u0_m2_wo1_accum_a;
    u0_m2_wo1_accum_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo1_accum_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m2_wo1_compute_q_19_q = "1") THEN
                IF (u0_m2_wo1_aseq_q = "1") THEN
                    u0_m2_wo1_accum_o <= u0_m2_wo1_accum_i;
                ELSE
                    u0_m2_wo1_accum_o <= STD_LOGIC_VECTOR(SIGNED(u0_m2_wo1_accum_a) + SIGNED(u0_m2_wo1_accum_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m2_wo1_accum_q <= u0_m2_wo1_accum_o(50 downto 0);

    -- u0_m2_wo1_oseq(SEQUENCE,269)@18 + 1
    u0_m2_wo1_oseq_clkproc: PROCESS (clk, areset)
        variable u0_m2_wo1_oseq_c : SIGNED(4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo1_oseq_c := "00011";
            u0_m2_wo1_oseq_q <= "0";
            u0_m2_wo1_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m2_wo1_compute_q_18_q = "1") THEN
                IF (u0_m2_wo1_oseq_c = "00000") THEN
                    u0_m2_wo1_oseq_eq <= '1';
                ELSE
                    u0_m2_wo1_oseq_eq <= '0';
                END IF;
                IF (u0_m2_wo1_oseq_eq = '1') THEN
                    u0_m2_wo1_oseq_c := u0_m2_wo1_oseq_c + 3;
                ELSE
                    u0_m2_wo1_oseq_c := u0_m2_wo1_oseq_c - 1;
                END IF;
                u0_m2_wo1_oseq_q <= STD_LOGIC_VECTOR(u0_m2_wo1_oseq_c(4 downto 4));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m2_wo1_oseq_gated(LOGICAL,270)@19
    u0_m2_wo1_oseq_gated_q <= u0_m2_wo1_oseq_q and d_u0_m2_wo1_compute_q_19_q;

    -- u0_m2_wo1_oseq_gated_reg(REG,271)@19 + 1
    u0_m2_wo1_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo1_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m2_wo1_oseq_gated_reg_q <= STD_LOGIC_VECTOR(u0_m2_wo1_oseq_gated_q);
        END IF;
    END PROCESS;

    -- u0_m1_wo1_run(ENABLEGENERATOR,191)@10 + 2
    u0_m1_wo1_run_ctrl <= u0_m1_wo1_run_out & xIn_v & u0_m1_wo1_run_enableQ;
    u0_m1_wo1_run_clkproc: PROCESS (clk, areset)
        variable u0_m1_wo1_run_enable_c : SIGNED(2 downto 0);
        variable u0_m1_wo1_run_inc : SIGNED(2 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo1_run_q <= "0";
            u0_m1_wo1_run_enable_c := TO_SIGNED(2, 3);
            u0_m1_wo1_run_enableQ <= "0";
            u0_m1_wo1_run_count <= "001";
            u0_m1_wo1_run_inc := (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m1_wo1_run_out = "1") THEN
                IF (u0_m1_wo1_run_enable_c(2) = '1') THEN
                    u0_m1_wo1_run_enable_c := u0_m1_wo1_run_enable_c - (-3);
                ELSE
                    u0_m1_wo1_run_enable_c := u0_m1_wo1_run_enable_c + (-1);
                END IF;
                u0_m1_wo1_run_enableQ <= STD_LOGIC_VECTOR(u0_m1_wo1_run_enable_c(2 downto 2));
            ELSE
                u0_m1_wo1_run_enableQ <= "0";
            END IF;
            CASE (u0_m1_wo1_run_ctrl) IS
                WHEN "000" | "001" => u0_m1_wo1_run_inc := "000";
                WHEN "010" | "011" => u0_m1_wo1_run_inc := "111";
                WHEN "100" => u0_m1_wo1_run_inc := "000";
                WHEN "101" => u0_m1_wo1_run_inc := "010";
                WHEN "110" => u0_m1_wo1_run_inc := "111";
                WHEN "111" => u0_m1_wo1_run_inc := "001";
                WHEN OTHERS => 
            END CASE;
            u0_m1_wo1_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m1_wo1_run_count) + SIGNED(u0_m1_wo1_run_inc));
            u0_m1_wo1_run_q <= u0_m1_wo1_run_out;
        END IF;
    END PROCESS;
    u0_m1_wo1_run_preEnaQ <= u0_m1_wo1_run_count(2 downto 2);
    u0_m1_wo1_run_out <= u0_m1_wo1_run_preEnaQ and VCC_q;

    -- u0_m1_wo1_memread(DELAY,192)@12
    u0_m1_wo1_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m1_wo1_run_q, xout => u0_m1_wo1_memread_q, clk => clk, aclr => areset );

    -- u0_m1_wo1_compute(DELAY,194)@12
    u0_m1_wo1_compute : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m1_wo1_memread_q, xout => u0_m1_wo1_compute_q, clk => clk, aclr => areset );

    -- d_u0_m1_wo1_compute_q_13(DELAY,644)@12 + 1
    d_u0_m1_wo1_compute_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m1_wo1_compute_q, xout => d_u0_m1_wo1_compute_q_13_q, clk => clk, aclr => areset );

    -- d_u0_m1_wo1_compute_q_18(DELAY,645)@13 + 5
    d_u0_m1_wo1_compute_q_18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m1_wo1_compute_q_13_q, xout => d_u0_m1_wo1_compute_q_18_q, clk => clk, aclr => areset );

    -- u0_m1_wo1_aseq(SEQUENCE,224)@18 + 1
    u0_m1_wo1_aseq_clkproc: PROCESS (clk, areset)
        variable u0_m1_wo1_aseq_c : SIGNED(4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo1_aseq_c := "00000";
            u0_m1_wo1_aseq_q <= "0";
            u0_m1_wo1_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m1_wo1_compute_q_18_q = "1") THEN
                IF (u0_m1_wo1_aseq_c = "00000") THEN
                    u0_m1_wo1_aseq_eq <= '1';
                ELSE
                    u0_m1_wo1_aseq_eq <= '0';
                END IF;
                IF (u0_m1_wo1_aseq_eq = '1') THEN
                    u0_m1_wo1_aseq_c := u0_m1_wo1_aseq_c + 3;
                ELSE
                    u0_m1_wo1_aseq_c := u0_m1_wo1_aseq_c - 1;
                END IF;
                u0_m1_wo1_aseq_q <= STD_LOGIC_VECTOR(u0_m1_wo1_aseq_c(4 downto 4));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m1_wo1_compute_q_19(DELAY,646)@18 + 1
    d_u0_m1_wo1_compute_q_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m1_wo1_compute_q_18_q, xout => d_u0_m1_wo1_compute_q_19_q, clk => clk, aclr => areset );

    -- u0_m1_wo1_ca4(COUNTER,206)@12
    -- low=0, high=3, step=1, init=0
    u0_m1_wo1_ca4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo1_ca4_i <= TO_UNSIGNED(0, 2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m1_wo1_compute_q = "1") THEN
                u0_m1_wo1_ca4_i <= u0_m1_wo1_ca4_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m1_wo1_ca4_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m1_wo1_ca4_i, 2)));

    -- d_u0_m1_wo1_ca4_q_14(DELAY,648)@12 + 2
    d_u0_m1_wo1_ca4_q_14 : dspba_delay
    GENERIC MAP ( width => 2, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m1_wo1_ca4_q, xout => d_u0_m1_wo1_ca4_q_14_q, clk => clk, aclr => areset );

    -- u0_m1_wo1_cm0(LOOKUP,210)@14 + 1
    u0_m1_wo1_cm0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo1_cm0_q <= "11111100011100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (d_u0_m1_wo1_ca4_q_14_q) IS
                WHEN "00" => u0_m1_wo1_cm0_q <= "11111100011100";
                WHEN "01" => u0_m1_wo1_cm0_q <= "00000000001100";
                WHEN "10" => u0_m1_wo1_cm0_q <= "00000101010111";
                WHEN "11" => u0_m1_wo1_cm0_q <= "00000000101110";
                WHEN OTHERS => -- unreachable
                               u0_m1_wo1_cm0_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- d_u0_m1_wo1_memread_q_13(DELAY,643)@12 + 1
    d_u0_m1_wo1_memread_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m1_wo1_memread_q, xout => d_u0_m1_wo1_memread_q_13_q, clk => clk, aclr => areset );

    -- u0_m1_wo1_wi0_r0_ra0_count0(COUNTER,199)@13
    -- low=0, high=11, step=1, init=1
    u0_m1_wo1_wi0_r0_ra0_count0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo1_wi0_r0_ra0_count0_i <= TO_UNSIGNED(1, 4);
            u0_m1_wo1_wi0_r0_ra0_count0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m1_wo1_memread_q_13_q = "1") THEN
                IF (u0_m1_wo1_wi0_r0_ra0_count0_i = TO_UNSIGNED(10, 4)) THEN
                    u0_m1_wo1_wi0_r0_ra0_count0_eq <= '1';
                ELSE
                    u0_m1_wo1_wi0_r0_ra0_count0_eq <= '0';
                END IF;
                IF (u0_m1_wo1_wi0_r0_ra0_count0_eq = '1') THEN
                    u0_m1_wo1_wi0_r0_ra0_count0_i <= u0_m1_wo1_wi0_r0_ra0_count0_i + 5;
                ELSE
                    u0_m1_wo1_wi0_r0_ra0_count0_i <= u0_m1_wo1_wi0_r0_ra0_count0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m1_wo1_wi0_r0_ra0_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m1_wo1_wi0_r0_ra0_count0_i, 4)));

    -- u0_m1_wo1_wi0_r0_ra0_count0_lut(LOOKUP,197)@13
    u0_m1_wo1_wi0_r0_ra0_count0_lut_combproc: PROCESS (u0_m1_wo1_wi0_r0_ra0_count0_q)
    BEGIN
        -- Begin reserved scope level
        CASE (u0_m1_wo1_wi0_r0_ra0_count0_q) IS
            WHEN "0000" => u0_m1_wo1_wi0_r0_ra0_count0_lut_q <= "000";
            WHEN "0001" => u0_m1_wo1_wi0_r0_ra0_count0_lut_q <= "001";
            WHEN "0010" => u0_m1_wo1_wi0_r0_ra0_count0_lut_q <= "010";
            WHEN "0011" => u0_m1_wo1_wi0_r0_ra0_count0_lut_q <= "011";
            WHEN "0100" => u0_m1_wo1_wi0_r0_ra0_count0_lut_q <= "010";
            WHEN "0101" => u0_m1_wo1_wi0_r0_ra0_count0_lut_q <= "011";
            WHEN "0110" => u0_m1_wo1_wi0_r0_ra0_count0_lut_q <= "100";
            WHEN "0111" => u0_m1_wo1_wi0_r0_ra0_count0_lut_q <= "101";
            WHEN "1000" => u0_m1_wo1_wi0_r0_ra0_count0_lut_q <= "100";
            WHEN "1001" => u0_m1_wo1_wi0_r0_ra0_count0_lut_q <= "101";
            WHEN "1010" => u0_m1_wo1_wi0_r0_ra0_count0_lut_q <= "000";
            WHEN "1011" => u0_m1_wo1_wi0_r0_ra0_count0_lut_q <= "001";
            WHEN OTHERS => -- unreachable
                           u0_m1_wo1_wi0_r0_ra0_count0_lut_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- u0_m1_wo1_wi0_r0_ra0_count0_lutreg(REG,198)@13
    u0_m1_wo1_wi0_r0_ra0_count0_lutreg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo1_wi0_r0_ra0_count0_lutreg_q <= "000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m1_wo1_memread_q_13_q = "1") THEN
                u0_m1_wo1_wi0_r0_ra0_count0_lutreg_q <= STD_LOGIC_VECTOR(u0_m1_wo1_wi0_r0_ra0_count0_lut_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m1_wo1_wi0_r0_memr0(DUALMEM,201)@13
    u0_m1_wo1_wi0_r0_memr0_ia <= STD_LOGIC_VECTOR(d_xIn_0_13_q);
    u0_m1_wo1_wi0_r0_memr0_aa <= u0_m2_wo0_wi0_r0_wa0_q;
    u0_m1_wo1_wi0_r0_memr0_ab <= u0_m1_wo1_wi0_r0_ra0_count0_lutreg_q;
    u0_m1_wo1_wi0_r0_memr0_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 6,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m1_wo1_wi0_r0_memr0_aa,
        data_a => u0_m1_wo1_wi0_r0_memr0_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_13_q(0),
        address_b => u0_m1_wo1_wi0_r0_memr0_ab,
        q_b => u0_m1_wo1_wi0_r0_memr0_iq
    );
    u0_m1_wo1_wi0_r0_memr0_q <= u0_m1_wo1_wi0_r0_memr0_iq(31 downto 0);

    -- d_u0_m1_wo1_wi0_r0_memr0_q_15(DELAY,647)@13 + 2
    d_u0_m1_wo1_wi0_r0_memr0_q_15 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m1_wo1_wi0_r0_memr0_q, xout => d_u0_m1_wo1_wi0_r0_memr0_q_15_q, clk => clk, aclr => areset );

    -- u0_m1_wo1_mtree_mult1_4_bs2_merged_bit_select(BITSELECT,601)@15
    u0_m1_wo1_mtree_mult1_4_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(d_u0_m1_wo1_wi0_r0_memr0_q_15_q(31 downto 17));
    u0_m1_wo1_mtree_mult1_4_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(d_u0_m1_wo1_wi0_r0_memr0_q_15_q(16 downto 0));

    -- u0_m1_wo1_mtree_mult1_4_im0(MULT,475)@15 + 2
    u0_m1_wo1_mtree_mult1_4_im0_a0 <= STD_LOGIC_VECTOR(u0_m1_wo1_mtree_mult1_4_bs2_merged_bit_select_b);
    u0_m1_wo1_mtree_mult1_4_im0_b0 <= STD_LOGIC_VECTOR(u0_m1_wo1_cm0_q);
    u0_m1_wo1_mtree_mult1_4_im0_reset <= areset;
    u0_m1_wo1_mtree_mult1_4_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 14,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m1_wo1_mtree_mult1_4_im0_a0,
        datab => u0_m1_wo1_mtree_mult1_4_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m1_wo1_mtree_mult1_4_im0_reset,
        clock => clk,
        result => u0_m1_wo1_mtree_mult1_4_im0_s1
    );
    u0_m1_wo1_mtree_mult1_4_im0_q <= u0_m1_wo1_mtree_mult1_4_im0_s1;

    -- u0_m1_wo1_mtree_mult1_4_align_8(BITSHIFT,483)@17
    u0_m1_wo1_mtree_mult1_4_align_8_qint <= u0_m1_wo1_mtree_mult1_4_im0_q & "00000000000000000";
    u0_m1_wo1_mtree_mult1_4_align_8_q <= u0_m1_wo1_mtree_mult1_4_align_8_qint(45 downto 0);

    -- u0_m1_wo1_mtree_mult1_4_bjB6(BITJOIN,481)@15
    u0_m1_wo1_mtree_mult1_4_bjB6_q <= GND_q & u0_m1_wo1_mtree_mult1_4_bs2_merged_bit_select_c;

    -- u0_m1_wo1_mtree_mult1_4_im3(MULT,478)@15 + 2
    u0_m1_wo1_mtree_mult1_4_im3_a0 <= STD_LOGIC_VECTOR(u0_m1_wo1_mtree_mult1_4_bjB6_q);
    u0_m1_wo1_mtree_mult1_4_im3_b0 <= STD_LOGIC_VECTOR(u0_m1_wo1_cm0_q);
    u0_m1_wo1_mtree_mult1_4_im3_reset <= areset;
    u0_m1_wo1_mtree_mult1_4_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m1_wo1_mtree_mult1_4_im3_a0,
        datab => u0_m1_wo1_mtree_mult1_4_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m1_wo1_mtree_mult1_4_im3_reset,
        clock => clk,
        result => u0_m1_wo1_mtree_mult1_4_im3_s1
    );
    u0_m1_wo1_mtree_mult1_4_im3_q <= u0_m1_wo1_mtree_mult1_4_im3_s1;

    -- u0_m1_wo1_mtree_mult1_4_result_add_0_0(ADD,485)@17 + 1
    u0_m1_wo1_mtree_mult1_4_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 32 => u0_m1_wo1_mtree_mult1_4_im3_q(31)) & u0_m1_wo1_mtree_mult1_4_im3_q));
    u0_m1_wo1_mtree_mult1_4_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 46 => u0_m1_wo1_mtree_mult1_4_align_8_q(45)) & u0_m1_wo1_mtree_mult1_4_align_8_q));
    u0_m1_wo1_mtree_mult1_4_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo1_mtree_mult1_4_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m1_wo1_mtree_mult1_4_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m1_wo1_mtree_mult1_4_result_add_0_0_a) + SIGNED(u0_m1_wo1_mtree_mult1_4_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m1_wo1_mtree_mult1_4_result_add_0_0_q <= u0_m1_wo1_mtree_mult1_4_result_add_0_0_o(46 downto 0);

    -- u0_m1_wo1_cm1(LOOKUP,211)@12 + 1
    u0_m1_wo1_cm1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo1_cm1_q <= "00001001011010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m1_wo1_ca4_q) IS
                WHEN "00" => u0_m1_wo1_cm1_q <= "00001001011010";
                WHEN "01" => u0_m1_wo1_cm1_q <= "00000010000011";
                WHEN "10" => u0_m1_wo1_cm1_q <= "11111001000011";
                WHEN "11" => u0_m1_wo1_cm1_q <= "00000110100110";
                WHEN OTHERS => -- unreachable
                               u0_m1_wo1_cm1_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m1_wo1_wi0_r0_delayr1(DELAY,202)@13
    u0_m1_wo1_wi0_r0_delayr1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m1_wo1_wi0_r0_memr0_q, xout => u0_m1_wo1_wi0_r0_delayr1_q, ena => d_u0_m1_wo1_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m1_wo1_mtree_mult1_3_bs2_merged_bit_select(BITSELECT,602)@13
    u0_m1_wo1_mtree_mult1_3_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m1_wo1_wi0_r0_delayr1_q(31 downto 17));
    u0_m1_wo1_mtree_mult1_3_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m1_wo1_wi0_r0_delayr1_q(16 downto 0));

    -- u0_m1_wo1_mtree_mult1_3_im0(MULT,486)@13 + 2
    u0_m1_wo1_mtree_mult1_3_im0_a0 <= STD_LOGIC_VECTOR(u0_m1_wo1_mtree_mult1_3_bs2_merged_bit_select_b);
    u0_m1_wo1_mtree_mult1_3_im0_b0 <= STD_LOGIC_VECTOR(u0_m1_wo1_cm1_q);
    u0_m1_wo1_mtree_mult1_3_im0_reset <= areset;
    u0_m1_wo1_mtree_mult1_3_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 14,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m1_wo1_mtree_mult1_3_im0_a0,
        datab => u0_m1_wo1_mtree_mult1_3_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m1_wo1_mtree_mult1_3_im0_reset,
        clock => clk,
        result => u0_m1_wo1_mtree_mult1_3_im0_s1
    );
    u0_m1_wo1_mtree_mult1_3_im0_q <= u0_m1_wo1_mtree_mult1_3_im0_s1;

    -- u0_m1_wo1_mtree_mult1_3_align_8(BITSHIFT,494)@15
    u0_m1_wo1_mtree_mult1_3_align_8_qint <= u0_m1_wo1_mtree_mult1_3_im0_q & "00000000000000000";
    u0_m1_wo1_mtree_mult1_3_align_8_q <= u0_m1_wo1_mtree_mult1_3_align_8_qint(45 downto 0);

    -- u0_m1_wo1_mtree_mult1_3_bjB6(BITJOIN,492)@13
    u0_m1_wo1_mtree_mult1_3_bjB6_q <= GND_q & u0_m1_wo1_mtree_mult1_3_bs2_merged_bit_select_c;

    -- u0_m1_wo1_mtree_mult1_3_im3(MULT,489)@13 + 2
    u0_m1_wo1_mtree_mult1_3_im3_a0 <= STD_LOGIC_VECTOR(u0_m1_wo1_mtree_mult1_3_bjB6_q);
    u0_m1_wo1_mtree_mult1_3_im3_b0 <= STD_LOGIC_VECTOR(u0_m1_wo1_cm1_q);
    u0_m1_wo1_mtree_mult1_3_im3_reset <= areset;
    u0_m1_wo1_mtree_mult1_3_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m1_wo1_mtree_mult1_3_im3_a0,
        datab => u0_m1_wo1_mtree_mult1_3_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m1_wo1_mtree_mult1_3_im3_reset,
        clock => clk,
        result => u0_m1_wo1_mtree_mult1_3_im3_s1
    );
    u0_m1_wo1_mtree_mult1_3_im3_q <= u0_m1_wo1_mtree_mult1_3_im3_s1;

    -- u0_m1_wo1_mtree_mult1_3_result_add_0_0(ADD,496)@15 + 1
    u0_m1_wo1_mtree_mult1_3_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 32 => u0_m1_wo1_mtree_mult1_3_im3_q(31)) & u0_m1_wo1_mtree_mult1_3_im3_q));
    u0_m1_wo1_mtree_mult1_3_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 46 => u0_m1_wo1_mtree_mult1_3_align_8_q(45)) & u0_m1_wo1_mtree_mult1_3_align_8_q));
    u0_m1_wo1_mtree_mult1_3_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo1_mtree_mult1_3_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m1_wo1_mtree_mult1_3_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m1_wo1_mtree_mult1_3_result_add_0_0_a) + SIGNED(u0_m1_wo1_mtree_mult1_3_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m1_wo1_mtree_mult1_3_result_add_0_0_q <= u0_m1_wo1_mtree_mult1_3_result_add_0_0_o(46 downto 0);

    -- u0_m1_wo1_cm2(LOOKUP,212)@12 + 1
    u0_m1_wo1_cm2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo1_cm2_q <= "00001110100011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m1_wo1_ca4_q) IS
                WHEN "00" => u0_m1_wo1_cm2_q <= "00001110100011";
                WHEN "01" => u0_m1_wo1_cm2_q <= "01111111111110";
                WHEN "10" => u0_m1_wo1_cm2_q <= "00111010100100";
                WHEN "11" => u0_m1_wo1_cm2_q <= "11100100011110";
                WHEN OTHERS => -- unreachable
                               u0_m1_wo1_cm2_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m1_wo1_wi0_r0_delayr2(DELAY,203)@13
    u0_m1_wo1_wi0_r0_delayr2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m1_wo1_wi0_r0_delayr1_q, xout => u0_m1_wo1_wi0_r0_delayr2_q, ena => d_u0_m1_wo1_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m1_wo1_mtree_mult1_2_bs2_merged_bit_select(BITSELECT,603)@13
    u0_m1_wo1_mtree_mult1_2_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m1_wo1_wi0_r0_delayr2_q(31 downto 17));
    u0_m1_wo1_mtree_mult1_2_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m1_wo1_wi0_r0_delayr2_q(16 downto 0));

    -- u0_m1_wo1_mtree_mult1_2_im0(MULT,497)@13 + 2
    u0_m1_wo1_mtree_mult1_2_im0_a0 <= STD_LOGIC_VECTOR(u0_m1_wo1_mtree_mult1_2_bs2_merged_bit_select_b);
    u0_m1_wo1_mtree_mult1_2_im0_b0 <= STD_LOGIC_VECTOR(u0_m1_wo1_cm2_q);
    u0_m1_wo1_mtree_mult1_2_im0_reset <= areset;
    u0_m1_wo1_mtree_mult1_2_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 14,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m1_wo1_mtree_mult1_2_im0_a0,
        datab => u0_m1_wo1_mtree_mult1_2_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m1_wo1_mtree_mult1_2_im0_reset,
        clock => clk,
        result => u0_m1_wo1_mtree_mult1_2_im0_s1
    );
    u0_m1_wo1_mtree_mult1_2_im0_q <= u0_m1_wo1_mtree_mult1_2_im0_s1;

    -- u0_m1_wo1_mtree_mult1_2_align_8(BITSHIFT,505)@15
    u0_m1_wo1_mtree_mult1_2_align_8_qint <= u0_m1_wo1_mtree_mult1_2_im0_q & "00000000000000000";
    u0_m1_wo1_mtree_mult1_2_align_8_q <= u0_m1_wo1_mtree_mult1_2_align_8_qint(45 downto 0);

    -- u0_m1_wo1_mtree_mult1_2_bjB6(BITJOIN,503)@13
    u0_m1_wo1_mtree_mult1_2_bjB6_q <= GND_q & u0_m1_wo1_mtree_mult1_2_bs2_merged_bit_select_c;

    -- u0_m1_wo1_mtree_mult1_2_im3(MULT,500)@13 + 2
    u0_m1_wo1_mtree_mult1_2_im3_a0 <= STD_LOGIC_VECTOR(u0_m1_wo1_mtree_mult1_2_bjB6_q);
    u0_m1_wo1_mtree_mult1_2_im3_b0 <= STD_LOGIC_VECTOR(u0_m1_wo1_cm2_q);
    u0_m1_wo1_mtree_mult1_2_im3_reset <= areset;
    u0_m1_wo1_mtree_mult1_2_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m1_wo1_mtree_mult1_2_im3_a0,
        datab => u0_m1_wo1_mtree_mult1_2_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m1_wo1_mtree_mult1_2_im3_reset,
        clock => clk,
        result => u0_m1_wo1_mtree_mult1_2_im3_s1
    );
    u0_m1_wo1_mtree_mult1_2_im3_q <= u0_m1_wo1_mtree_mult1_2_im3_s1;

    -- u0_m1_wo1_mtree_mult1_2_result_add_0_0(ADD,507)@15 + 1
    u0_m1_wo1_mtree_mult1_2_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 32 => u0_m1_wo1_mtree_mult1_2_im3_q(31)) & u0_m1_wo1_mtree_mult1_2_im3_q));
    u0_m1_wo1_mtree_mult1_2_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 46 => u0_m1_wo1_mtree_mult1_2_align_8_q(45)) & u0_m1_wo1_mtree_mult1_2_align_8_q));
    u0_m1_wo1_mtree_mult1_2_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo1_mtree_mult1_2_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m1_wo1_mtree_mult1_2_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m1_wo1_mtree_mult1_2_result_add_0_0_a) + SIGNED(u0_m1_wo1_mtree_mult1_2_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m1_wo1_mtree_mult1_2_result_add_0_0_q <= u0_m1_wo1_mtree_mult1_2_result_add_0_0_o(46 downto 0);

    -- u0_m1_wo1_mtree_add0_1(ADD,221)@16 + 1
    u0_m1_wo1_mtree_add0_1_a <= STD_LOGIC_VECTOR(u0_m1_wo1_mtree_mult1_2_result_add_0_0_q);
    u0_m1_wo1_mtree_add0_1_b <= STD_LOGIC_VECTOR(u0_m1_wo1_mtree_mult1_3_result_add_0_0_q);
    u0_m1_wo1_mtree_add0_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo1_mtree_add0_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m1_wo1_mtree_add0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m1_wo1_mtree_add0_1_a) + SIGNED(u0_m1_wo1_mtree_add0_1_b));
        END IF;
    END PROCESS;
    u0_m1_wo1_mtree_add0_1_q <= u0_m1_wo1_mtree_add0_1_o(46 downto 0);

    -- u0_m1_wo1_cm3(LOOKUP,213)@12 + 1
    u0_m1_wo1_cm3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo1_cm3_q <= "11111111001100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m1_wo1_ca4_q) IS
                WHEN "00" => u0_m1_wo1_cm3_q <= "11111111001100";
                WHEN "01" => u0_m1_wo1_cm3_q <= "11111001100011";
                WHEN "10" => u0_m1_wo1_cm3_q <= "00001111001010";
                WHEN "11" => u0_m1_wo1_cm3_q <= "11101011010010";
                WHEN OTHERS => -- unreachable
                               u0_m1_wo1_cm3_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m1_wo1_wi0_r0_delayr3(DELAY,204)@13
    u0_m1_wo1_wi0_r0_delayr3 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m1_wo1_wi0_r0_delayr2_q, xout => u0_m1_wo1_wi0_r0_delayr3_q, ena => d_u0_m1_wo1_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m1_wo1_mtree_mult1_1_bs2_merged_bit_select(BITSELECT,604)@13
    u0_m1_wo1_mtree_mult1_1_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m1_wo1_wi0_r0_delayr3_q(31 downto 17));
    u0_m1_wo1_mtree_mult1_1_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m1_wo1_wi0_r0_delayr3_q(16 downto 0));

    -- u0_m1_wo1_mtree_mult1_1_im0(MULT,508)@13 + 2
    u0_m1_wo1_mtree_mult1_1_im0_a0 <= STD_LOGIC_VECTOR(u0_m1_wo1_mtree_mult1_1_bs2_merged_bit_select_b);
    u0_m1_wo1_mtree_mult1_1_im0_b0 <= STD_LOGIC_VECTOR(u0_m1_wo1_cm3_q);
    u0_m1_wo1_mtree_mult1_1_im0_reset <= areset;
    u0_m1_wo1_mtree_mult1_1_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 14,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m1_wo1_mtree_mult1_1_im0_a0,
        datab => u0_m1_wo1_mtree_mult1_1_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m1_wo1_mtree_mult1_1_im0_reset,
        clock => clk,
        result => u0_m1_wo1_mtree_mult1_1_im0_s1
    );
    u0_m1_wo1_mtree_mult1_1_im0_q <= u0_m1_wo1_mtree_mult1_1_im0_s1;

    -- u0_m1_wo1_mtree_mult1_1_align_8(BITSHIFT,516)@15
    u0_m1_wo1_mtree_mult1_1_align_8_qint <= u0_m1_wo1_mtree_mult1_1_im0_q & "00000000000000000";
    u0_m1_wo1_mtree_mult1_1_align_8_q <= u0_m1_wo1_mtree_mult1_1_align_8_qint(45 downto 0);

    -- u0_m1_wo1_mtree_mult1_1_bjB6(BITJOIN,514)@13
    u0_m1_wo1_mtree_mult1_1_bjB6_q <= GND_q & u0_m1_wo1_mtree_mult1_1_bs2_merged_bit_select_c;

    -- u0_m1_wo1_mtree_mult1_1_im3(MULT,511)@13 + 2
    u0_m1_wo1_mtree_mult1_1_im3_a0 <= STD_LOGIC_VECTOR(u0_m1_wo1_mtree_mult1_1_bjB6_q);
    u0_m1_wo1_mtree_mult1_1_im3_b0 <= STD_LOGIC_VECTOR(u0_m1_wo1_cm3_q);
    u0_m1_wo1_mtree_mult1_1_im3_reset <= areset;
    u0_m1_wo1_mtree_mult1_1_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m1_wo1_mtree_mult1_1_im3_a0,
        datab => u0_m1_wo1_mtree_mult1_1_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m1_wo1_mtree_mult1_1_im3_reset,
        clock => clk,
        result => u0_m1_wo1_mtree_mult1_1_im3_s1
    );
    u0_m1_wo1_mtree_mult1_1_im3_q <= u0_m1_wo1_mtree_mult1_1_im3_s1;

    -- u0_m1_wo1_mtree_mult1_1_result_add_0_0(ADD,518)@15 + 1
    u0_m1_wo1_mtree_mult1_1_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 32 => u0_m1_wo1_mtree_mult1_1_im3_q(31)) & u0_m1_wo1_mtree_mult1_1_im3_q));
    u0_m1_wo1_mtree_mult1_1_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 46 => u0_m1_wo1_mtree_mult1_1_align_8_q(45)) & u0_m1_wo1_mtree_mult1_1_align_8_q));
    u0_m1_wo1_mtree_mult1_1_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo1_mtree_mult1_1_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m1_wo1_mtree_mult1_1_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m1_wo1_mtree_mult1_1_result_add_0_0_a) + SIGNED(u0_m1_wo1_mtree_mult1_1_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m1_wo1_mtree_mult1_1_result_add_0_0_q <= u0_m1_wo1_mtree_mult1_1_result_add_0_0_o(46 downto 0);

    -- u0_m1_wo1_cm4(LOOKUP,214)@12 + 1
    u0_m1_wo1_cm4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo1_cm4_q <= "00000011111000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m1_wo1_ca4_q) IS
                WHEN "00" => u0_m1_wo1_cm4_q <= "00000011111000";
                WHEN "01" => u0_m1_wo1_cm4_q <= "00000011100001";
                WHEN "10" => u0_m1_wo1_cm4_q <= "11111011001101";
                WHEN "11" => u0_m1_wo1_cm4_q <= "00000100011111";
                WHEN OTHERS => -- unreachable
                               u0_m1_wo1_cm4_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m1_wo1_wi0_r0_delayr4(DELAY,205)@13
    u0_m1_wo1_wi0_r0_delayr4 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m1_wo1_wi0_r0_delayr3_q, xout => u0_m1_wo1_wi0_r0_delayr4_q, ena => d_u0_m1_wo1_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m1_wo1_mtree_mult1_0_bs2_merged_bit_select(BITSELECT,605)@13
    u0_m1_wo1_mtree_mult1_0_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m1_wo1_wi0_r0_delayr4_q(31 downto 17));
    u0_m1_wo1_mtree_mult1_0_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m1_wo1_wi0_r0_delayr4_q(16 downto 0));

    -- u0_m1_wo1_mtree_mult1_0_im0(MULT,519)@13 + 2
    u0_m1_wo1_mtree_mult1_0_im0_a0 <= STD_LOGIC_VECTOR(u0_m1_wo1_mtree_mult1_0_bs2_merged_bit_select_b);
    u0_m1_wo1_mtree_mult1_0_im0_b0 <= STD_LOGIC_VECTOR(u0_m1_wo1_cm4_q);
    u0_m1_wo1_mtree_mult1_0_im0_reset <= areset;
    u0_m1_wo1_mtree_mult1_0_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 14,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m1_wo1_mtree_mult1_0_im0_a0,
        datab => u0_m1_wo1_mtree_mult1_0_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m1_wo1_mtree_mult1_0_im0_reset,
        clock => clk,
        result => u0_m1_wo1_mtree_mult1_0_im0_s1
    );
    u0_m1_wo1_mtree_mult1_0_im0_q <= u0_m1_wo1_mtree_mult1_0_im0_s1;

    -- u0_m1_wo1_mtree_mult1_0_align_8(BITSHIFT,527)@15
    u0_m1_wo1_mtree_mult1_0_align_8_qint <= u0_m1_wo1_mtree_mult1_0_im0_q & "00000000000000000";
    u0_m1_wo1_mtree_mult1_0_align_8_q <= u0_m1_wo1_mtree_mult1_0_align_8_qint(45 downto 0);

    -- u0_m1_wo1_mtree_mult1_0_bjB6(BITJOIN,525)@13
    u0_m1_wo1_mtree_mult1_0_bjB6_q <= GND_q & u0_m1_wo1_mtree_mult1_0_bs2_merged_bit_select_c;

    -- u0_m1_wo1_mtree_mult1_0_im3(MULT,522)@13 + 2
    u0_m1_wo1_mtree_mult1_0_im3_a0 <= STD_LOGIC_VECTOR(u0_m1_wo1_mtree_mult1_0_bjB6_q);
    u0_m1_wo1_mtree_mult1_0_im3_b0 <= STD_LOGIC_VECTOR(u0_m1_wo1_cm4_q);
    u0_m1_wo1_mtree_mult1_0_im3_reset <= areset;
    u0_m1_wo1_mtree_mult1_0_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m1_wo1_mtree_mult1_0_im3_a0,
        datab => u0_m1_wo1_mtree_mult1_0_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m1_wo1_mtree_mult1_0_im3_reset,
        clock => clk,
        result => u0_m1_wo1_mtree_mult1_0_im3_s1
    );
    u0_m1_wo1_mtree_mult1_0_im3_q <= u0_m1_wo1_mtree_mult1_0_im3_s1;

    -- u0_m1_wo1_mtree_mult1_0_result_add_0_0(ADD,529)@15 + 1
    u0_m1_wo1_mtree_mult1_0_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 32 => u0_m1_wo1_mtree_mult1_0_im3_q(31)) & u0_m1_wo1_mtree_mult1_0_im3_q));
    u0_m1_wo1_mtree_mult1_0_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 46 => u0_m1_wo1_mtree_mult1_0_align_8_q(45)) & u0_m1_wo1_mtree_mult1_0_align_8_q));
    u0_m1_wo1_mtree_mult1_0_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo1_mtree_mult1_0_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m1_wo1_mtree_mult1_0_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m1_wo1_mtree_mult1_0_result_add_0_0_a) + SIGNED(u0_m1_wo1_mtree_mult1_0_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m1_wo1_mtree_mult1_0_result_add_0_0_q <= u0_m1_wo1_mtree_mult1_0_result_add_0_0_o(46 downto 0);

    -- u0_m1_wo1_mtree_add0_0(ADD,220)@16 + 1
    u0_m1_wo1_mtree_add0_0_a <= STD_LOGIC_VECTOR(u0_m1_wo1_mtree_mult1_0_result_add_0_0_q);
    u0_m1_wo1_mtree_add0_0_b <= STD_LOGIC_VECTOR(u0_m1_wo1_mtree_mult1_1_result_add_0_0_q);
    u0_m1_wo1_mtree_add0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo1_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m1_wo1_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m1_wo1_mtree_add0_0_a) + SIGNED(u0_m1_wo1_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m1_wo1_mtree_add0_0_q <= u0_m1_wo1_mtree_add0_0_o(46 downto 0);

    -- u0_m1_wo1_mtree_add1_0(ADD,222)@17 + 1
    u0_m1_wo1_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 47 => u0_m1_wo1_mtree_add0_0_q(46)) & u0_m1_wo1_mtree_add0_0_q));
    u0_m1_wo1_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 47 => u0_m1_wo1_mtree_add0_1_q(46)) & u0_m1_wo1_mtree_add0_1_q));
    u0_m1_wo1_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo1_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m1_wo1_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m1_wo1_mtree_add1_0_a) + SIGNED(u0_m1_wo1_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m1_wo1_mtree_add1_0_q <= u0_m1_wo1_mtree_add1_0_o(47 downto 0);

    -- u0_m1_wo1_mtree_add2_0(ADD,223)@18 + 1
    u0_m1_wo1_mtree_add2_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 48 => u0_m1_wo1_mtree_add1_0_q(47)) & u0_m1_wo1_mtree_add1_0_q));
    u0_m1_wo1_mtree_add2_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 47 => u0_m1_wo1_mtree_mult1_4_result_add_0_0_q(46)) & u0_m1_wo1_mtree_mult1_4_result_add_0_0_q));
    u0_m1_wo1_mtree_add2_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo1_mtree_add2_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m1_wo1_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m1_wo1_mtree_add2_0_a) + SIGNED(u0_m1_wo1_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m1_wo1_mtree_add2_0_q <= u0_m1_wo1_mtree_add2_0_o(48 downto 0);

    -- u0_m1_wo1_accum(ADD,225)@19 + 1
    u0_m1_wo1_accum_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((50 downto 49 => u0_m1_wo1_mtree_add2_0_q(48)) & u0_m1_wo1_mtree_add2_0_q));
    u0_m1_wo1_accum_b <= STD_LOGIC_VECTOR(u0_m1_wo1_accum_q);
    u0_m1_wo1_accum_i <= u0_m1_wo1_accum_a;
    u0_m1_wo1_accum_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo1_accum_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m1_wo1_compute_q_19_q = "1") THEN
                IF (u0_m1_wo1_aseq_q = "1") THEN
                    u0_m1_wo1_accum_o <= u0_m1_wo1_accum_i;
                ELSE
                    u0_m1_wo1_accum_o <= STD_LOGIC_VECTOR(SIGNED(u0_m1_wo1_accum_a) + SIGNED(u0_m1_wo1_accum_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m1_wo1_accum_q <= u0_m1_wo1_accum_o(50 downto 0);

    -- u0_m1_wo1_oseq(SEQUENCE,226)@18 + 1
    u0_m1_wo1_oseq_clkproc: PROCESS (clk, areset)
        variable u0_m1_wo1_oseq_c : SIGNED(4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo1_oseq_c := "00011";
            u0_m1_wo1_oseq_q <= "0";
            u0_m1_wo1_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m1_wo1_compute_q_18_q = "1") THEN
                IF (u0_m1_wo1_oseq_c = "00000") THEN
                    u0_m1_wo1_oseq_eq <= '1';
                ELSE
                    u0_m1_wo1_oseq_eq <= '0';
                END IF;
                IF (u0_m1_wo1_oseq_eq = '1') THEN
                    u0_m1_wo1_oseq_c := u0_m1_wo1_oseq_c + 3;
                ELSE
                    u0_m1_wo1_oseq_c := u0_m1_wo1_oseq_c - 1;
                END IF;
                u0_m1_wo1_oseq_q <= STD_LOGIC_VECTOR(u0_m1_wo1_oseq_c(4 downto 4));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m1_wo1_oseq_gated(LOGICAL,227)@19
    u0_m1_wo1_oseq_gated_q <= u0_m1_wo1_oseq_q and d_u0_m1_wo1_compute_q_19_q;

    -- u0_m1_wo1_oseq_gated_reg(REG,228)@19 + 1
    u0_m1_wo1_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo1_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m1_wo1_oseq_gated_reg_q <= STD_LOGIC_VECTOR(u0_m1_wo1_oseq_gated_q);
        END IF;
    END PROCESS;

    -- u0_m0_wo1_run(ENABLEGENERATOR,145)@10 + 2
    u0_m0_wo1_run_ctrl <= u0_m0_wo1_run_out & xIn_v & u0_m0_wo1_run_enableQ;
    u0_m0_wo1_run_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo1_run_enable_c : SIGNED(2 downto 0);
        variable u0_m0_wo1_run_inc : SIGNED(2 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_run_q <= "0";
            u0_m0_wo1_run_enable_c := TO_SIGNED(2, 3);
            u0_m0_wo1_run_enableQ <= "0";
            u0_m0_wo1_run_count <= "001";
            u0_m0_wo1_run_inc := (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo1_run_out = "1") THEN
                IF (u0_m0_wo1_run_enable_c(2) = '1') THEN
                    u0_m0_wo1_run_enable_c := u0_m0_wo1_run_enable_c - (-3);
                ELSE
                    u0_m0_wo1_run_enable_c := u0_m0_wo1_run_enable_c + (-1);
                END IF;
                u0_m0_wo1_run_enableQ <= STD_LOGIC_VECTOR(u0_m0_wo1_run_enable_c(2 downto 2));
            ELSE
                u0_m0_wo1_run_enableQ <= "0";
            END IF;
            CASE (u0_m0_wo1_run_ctrl) IS
                WHEN "000" | "001" => u0_m0_wo1_run_inc := "000";
                WHEN "010" | "011" => u0_m0_wo1_run_inc := "111";
                WHEN "100" => u0_m0_wo1_run_inc := "000";
                WHEN "101" => u0_m0_wo1_run_inc := "010";
                WHEN "110" => u0_m0_wo1_run_inc := "111";
                WHEN "111" => u0_m0_wo1_run_inc := "001";
                WHEN OTHERS => 
            END CASE;
            u0_m0_wo1_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_run_count) + SIGNED(u0_m0_wo1_run_inc));
            u0_m0_wo1_run_q <= u0_m0_wo1_run_out;
        END IF;
    END PROCESS;
    u0_m0_wo1_run_preEnaQ <= u0_m0_wo1_run_count(2 downto 2);
    u0_m0_wo1_run_out <= u0_m0_wo1_run_preEnaQ and VCC_q;

    -- u0_m0_wo1_memread(DELAY,146)@12
    u0_m0_wo1_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo1_run_q, xout => u0_m0_wo1_memread_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_compute(DELAY,148)@12
    u0_m0_wo1_compute : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo1_memread_q, xout => u0_m0_wo1_compute_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo1_compute_q_13(DELAY,636)@12 + 1
    d_u0_m0_wo1_compute_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo1_compute_q, xout => d_u0_m0_wo1_compute_q_13_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo1_compute_q_14(DELAY,637)@13 + 1
    d_u0_m0_wo1_compute_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo1_compute_q_13_q, xout => d_u0_m0_wo1_compute_q_14_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo1_compute_q_18(DELAY,638)@14 + 4
    d_u0_m0_wo1_compute_q_18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo1_compute_q_14_q, xout => d_u0_m0_wo1_compute_q_18_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_aseq(SEQUENCE,181)@18 + 1
    u0_m0_wo1_aseq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo1_aseq_c : SIGNED(4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_aseq_c := "00000";
            u0_m0_wo1_aseq_q <= "0";
            u0_m0_wo1_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo1_compute_q_18_q = "1") THEN
                IF (u0_m0_wo1_aseq_c = "00000") THEN
                    u0_m0_wo1_aseq_eq <= '1';
                ELSE
                    u0_m0_wo1_aseq_eq <= '0';
                END IF;
                IF (u0_m0_wo1_aseq_eq = '1') THEN
                    u0_m0_wo1_aseq_c := u0_m0_wo1_aseq_c + 3;
                ELSE
                    u0_m0_wo1_aseq_c := u0_m0_wo1_aseq_c - 1;
                END IF;
                u0_m0_wo1_aseq_q <= STD_LOGIC_VECTOR(u0_m0_wo1_aseq_c(4 downto 4));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo1_compute_q_19(DELAY,639)@18 + 1
    d_u0_m0_wo1_compute_q_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo1_compute_q_18_q, xout => d_u0_m0_wo1_compute_q_19_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_ca2(COUNTER,166)@13
    -- low=0, high=3, step=1, init=0
    u0_m0_wo1_ca2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_ca2_i <= TO_UNSIGNED(0, 2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo1_compute_q_13_q = "1") THEN
                u0_m0_wo1_ca2_i <= u0_m0_wo1_ca2_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo1_ca2_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo1_ca2_i, 2)));

    -- d_u0_m0_wo1_ca2_q_14(DELAY,642)@13 + 1
    d_u0_m0_wo1_ca2_q_14 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo1_ca2_q, xout => d_u0_m0_wo1_ca2_q_14_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_cm0(LOOKUP,170)@14 + 1
    u0_m0_wo1_cm0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_cm0_q <= "00000000001011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (d_u0_m0_wo1_ca2_q_14_q) IS
                WHEN "00" => u0_m0_wo1_cm0_q <= "00000000001011";
                WHEN "01" => u0_m0_wo1_cm0_q <= "11111100111000";
                WHEN "10" => u0_m0_wo1_cm0_q <= "00000101010011";
                WHEN "11" => u0_m0_wo1_cm0_q <= "00000010010100";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo1_cm0_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo1_memread_q_13(DELAY,634)@12 + 1
    d_u0_m0_wo1_memread_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo1_memread_q, xout => d_u0_m0_wo1_memread_q_13_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo1_memread_q_14(DELAY,635)@13 + 1
    d_u0_m0_wo1_memread_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo1_memread_q_13_q, xout => d_u0_m0_wo1_memread_q_14_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_wi0_r0_ra3_count0(COUNTER,156)@13
    -- low=0, high=19, step=1, init=1
    u0_m0_wo1_wi0_r0_ra3_count0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_wi0_r0_ra3_count0_i <= TO_UNSIGNED(1, 5);
            u0_m0_wo1_wi0_r0_ra3_count0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo1_memread_q_13_q = "1") THEN
                IF (u0_m0_wo1_wi0_r0_ra3_count0_i = TO_UNSIGNED(18, 5)) THEN
                    u0_m0_wo1_wi0_r0_ra3_count0_eq <= '1';
                ELSE
                    u0_m0_wo1_wi0_r0_ra3_count0_eq <= '0';
                END IF;
                IF (u0_m0_wo1_wi0_r0_ra3_count0_eq = '1') THEN
                    u0_m0_wo1_wi0_r0_ra3_count0_i <= u0_m0_wo1_wi0_r0_ra3_count0_i + 13;
                ELSE
                    u0_m0_wo1_wi0_r0_ra3_count0_i <= u0_m0_wo1_wi0_r0_ra3_count0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo1_wi0_r0_ra3_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo1_wi0_r0_ra3_count0_i, 5)));

    -- u0_m0_wo1_wi0_r0_ra3_count0_lut(LOOKUP,154)@13
    u0_m0_wo1_wi0_r0_ra3_count0_lut_combproc: PROCESS (u0_m0_wo1_wi0_r0_ra3_count0_q)
    BEGIN
        -- Begin reserved scope level
        CASE (u0_m0_wo1_wi0_r0_ra3_count0_q) IS
            WHEN "00000" => u0_m0_wo1_wi0_r0_ra3_count0_lut_q <= "0100";
            WHEN "00001" => u0_m0_wo1_wi0_r0_ra3_count0_lut_q <= "0011";
            WHEN "00010" => u0_m0_wo1_wi0_r0_ra3_count0_lut_q <= "0010";
            WHEN "00011" => u0_m0_wo1_wi0_r0_ra3_count0_lut_q <= "0001";
            WHEN "00100" => u0_m0_wo1_wi0_r0_ra3_count0_lut_q <= "0110";
            WHEN "00101" => u0_m0_wo1_wi0_r0_ra3_count0_lut_q <= "0101";
            WHEN "00110" => u0_m0_wo1_wi0_r0_ra3_count0_lut_q <= "0100";
            WHEN "00111" => u0_m0_wo1_wi0_r0_ra3_count0_lut_q <= "0011";
            WHEN "01000" => u0_m0_wo1_wi0_r0_ra3_count0_lut_q <= "1000";
            WHEN "01001" => u0_m0_wo1_wi0_r0_ra3_count0_lut_q <= "0111";
            WHEN "01010" => u0_m0_wo1_wi0_r0_ra3_count0_lut_q <= "0110";
            WHEN "01011" => u0_m0_wo1_wi0_r0_ra3_count0_lut_q <= "0101";
            WHEN "01100" => u0_m0_wo1_wi0_r0_ra3_count0_lut_q <= "0000";
            WHEN "01101" => u0_m0_wo1_wi0_r0_ra3_count0_lut_q <= "1001";
            WHEN "01110" => u0_m0_wo1_wi0_r0_ra3_count0_lut_q <= "1000";
            WHEN "01111" => u0_m0_wo1_wi0_r0_ra3_count0_lut_q <= "0111";
            WHEN "10000" => u0_m0_wo1_wi0_r0_ra3_count0_lut_q <= "0010";
            WHEN "10001" => u0_m0_wo1_wi0_r0_ra3_count0_lut_q <= "0001";
            WHEN "10010" => u0_m0_wo1_wi0_r0_ra3_count0_lut_q <= "0000";
            WHEN "10011" => u0_m0_wo1_wi0_r0_ra3_count0_lut_q <= "1001";
            WHEN OTHERS => -- unreachable
                           u0_m0_wo1_wi0_r0_ra3_count0_lut_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- u0_m0_wo1_wi0_r0_ra3_count0_lutreg(REG,155)@13
    u0_m0_wo1_wi0_r0_ra3_count0_lutreg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_wi0_r0_ra3_count0_lutreg_q <= "0100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo1_memread_q_13_q = "1") THEN
                u0_m0_wo1_wi0_r0_ra3_count0_lutreg_q <= STD_LOGIC_VECTOR(u0_m0_wo1_wi0_r0_ra3_count0_lut_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo1_wi0_r0_ra0_count0(COUNTER,153)@13
    -- low=0, high=11, step=1, init=1
    u0_m0_wo1_wi0_r0_ra0_count0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_wi0_r0_ra0_count0_i <= TO_UNSIGNED(1, 4);
            u0_m0_wo1_wi0_r0_ra0_count0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo1_memread_q_13_q = "1") THEN
                IF (u0_m0_wo1_wi0_r0_ra0_count0_i = TO_UNSIGNED(10, 4)) THEN
                    u0_m0_wo1_wi0_r0_ra0_count0_eq <= '1';
                ELSE
                    u0_m0_wo1_wi0_r0_ra0_count0_eq <= '0';
                END IF;
                IF (u0_m0_wo1_wi0_r0_ra0_count0_eq = '1') THEN
                    u0_m0_wo1_wi0_r0_ra0_count0_i <= u0_m0_wo1_wi0_r0_ra0_count0_i + 5;
                ELSE
                    u0_m0_wo1_wi0_r0_ra0_count0_i <= u0_m0_wo1_wi0_r0_ra0_count0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo1_wi0_r0_ra0_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo1_wi0_r0_ra0_count0_i, 4)));

    -- u0_m0_wo1_wi0_r0_ra0_count0_lut(LOOKUP,151)@13
    u0_m0_wo1_wi0_r0_ra0_count0_lut_combproc: PROCESS (u0_m0_wo1_wi0_r0_ra0_count0_q)
    BEGIN
        -- Begin reserved scope level
        CASE (u0_m0_wo1_wi0_r0_ra0_count0_q) IS
            WHEN "0000" => u0_m0_wo1_wi0_r0_ra0_count0_lut_q <= "001";
            WHEN "0001" => u0_m0_wo1_wi0_r0_ra0_count0_lut_q <= "010";
            WHEN "0010" => u0_m0_wo1_wi0_r0_ra0_count0_lut_q <= "011";
            WHEN "0011" => u0_m0_wo1_wi0_r0_ra0_count0_lut_q <= "100";
            WHEN "0100" => u0_m0_wo1_wi0_r0_ra0_count0_lut_q <= "011";
            WHEN "0101" => u0_m0_wo1_wi0_r0_ra0_count0_lut_q <= "100";
            WHEN "0110" => u0_m0_wo1_wi0_r0_ra0_count0_lut_q <= "101";
            WHEN "0111" => u0_m0_wo1_wi0_r0_ra0_count0_lut_q <= "000";
            WHEN "1000" => u0_m0_wo1_wi0_r0_ra0_count0_lut_q <= "101";
            WHEN "1001" => u0_m0_wo1_wi0_r0_ra0_count0_lut_q <= "000";
            WHEN "1010" => u0_m0_wo1_wi0_r0_ra0_count0_lut_q <= "001";
            WHEN "1011" => u0_m0_wo1_wi0_r0_ra0_count0_lut_q <= "010";
            WHEN OTHERS => -- unreachable
                           u0_m0_wo1_wi0_r0_ra0_count0_lut_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- u0_m0_wo1_wi0_r0_ra0_count0_lutreg(REG,152)@13
    u0_m0_wo1_wi0_r0_ra0_count0_lutreg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_wi0_r0_ra0_count0_lutreg_q <= "001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo1_memread_q_13_q = "1") THEN
                u0_m0_wo1_wi0_r0_ra0_count0_lutreg_q <= STD_LOGIC_VECTOR(u0_m0_wo1_wi0_r0_ra0_count0_lut_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_wa0(COUNTER,22)@13
    -- low=0, high=5, step=1, init=4
    u0_m0_wo0_wi0_r0_wa0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa0_i <= TO_UNSIGNED(4, 3);
            u0_m0_wo0_wi0_r0_wa0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_13_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_wa0_i = TO_UNSIGNED(4, 3)) THEN
                    u0_m0_wo0_wi0_r0_wa0_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_wa0_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_wa0_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_wa0_i <= u0_m0_wo0_wi0_r0_wa0_i + 3;
                ELSE
                    u0_m0_wo0_wi0_r0_wa0_i <= u0_m0_wo0_wi0_r0_wa0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa0_i, 3)));

    -- u0_m0_wo1_wi0_r0_memr0(DUALMEM,160)@13
    u0_m0_wo1_wi0_r0_memr0_ia <= STD_LOGIC_VECTOR(d_xIn_0_13_q);
    u0_m0_wo1_wi0_r0_memr0_aa <= u0_m0_wo0_wi0_r0_wa0_q;
    u0_m0_wo1_wi0_r0_memr0_ab <= u0_m0_wo1_wi0_r0_ra0_count0_lutreg_q;
    u0_m0_wo1_wi0_r0_memr0_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 6,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo1_wi0_r0_memr0_aa,
        data_a => u0_m0_wo1_wi0_r0_memr0_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_13_q(0),
        address_b => u0_m0_wo1_wi0_r0_memr0_ab,
        q_b => u0_m0_wo1_wi0_r0_memr0_iq
    );
    u0_m0_wo1_wi0_r0_memr0_q <= u0_m0_wo1_wi0_r0_memr0_iq(31 downto 0);

    -- u0_m0_wo1_wi0_r0_delayr1(DELAY,162)@13
    u0_m0_wo1_wi0_r0_delayr1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo1_wi0_r0_memr0_q, xout => u0_m0_wo1_wi0_r0_delayr1_q, ena => d_u0_m0_wo1_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo1_wi0_r0_we3_seq(SEQUENCE,157)@12 + 1
    u0_m0_wo1_wi0_r0_we3_seq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo1_wi0_r0_we3_seq_c : SIGNED(4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_wi0_r0_we3_seq_c := "00000";
            u0_m0_wo1_wi0_r0_we3_seq_q <= "0";
            u0_m0_wo1_wi0_r0_we3_seq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo1_compute_q = "1") THEN
                IF (u0_m0_wo1_wi0_r0_we3_seq_c = "11111") THEN
                    u0_m0_wo1_wi0_r0_we3_seq_eq <= '1';
                ELSE
                    u0_m0_wo1_wi0_r0_we3_seq_eq <= '0';
                END IF;
                IF (u0_m0_wo1_wi0_r0_we3_seq_eq = '1') THEN
                    u0_m0_wo1_wi0_r0_we3_seq_c := u0_m0_wo1_wi0_r0_we3_seq_c + 3;
                ELSE
                    u0_m0_wo1_wi0_r0_we3_seq_c := u0_m0_wo1_wi0_r0_we3_seq_c - 1;
                END IF;
                u0_m0_wo1_wi0_r0_we3_seq_q <= STD_LOGIC_VECTOR(u0_m0_wo1_wi0_r0_we3_seq_c(4 downto 4));
            ELSE
                u0_m0_wo1_wi0_r0_we3_seq_q <= "0";
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo1_wi0_r0_wa3(COUNTER,159)@13
    -- low=0, high=9, step=1, init=5
    u0_m0_wo1_wi0_r0_wa3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_wi0_r0_wa3_i <= TO_UNSIGNED(5, 4);
            u0_m0_wo1_wi0_r0_wa3_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo1_wi0_r0_we3_seq_q = "1") THEN
                IF (u0_m0_wo1_wi0_r0_wa3_i = TO_UNSIGNED(8, 4)) THEN
                    u0_m0_wo1_wi0_r0_wa3_eq <= '1';
                ELSE
                    u0_m0_wo1_wi0_r0_wa3_eq <= '0';
                END IF;
                IF (u0_m0_wo1_wi0_r0_wa3_eq = '1') THEN
                    u0_m0_wo1_wi0_r0_wa3_i <= u0_m0_wo1_wi0_r0_wa3_i + 7;
                ELSE
                    u0_m0_wo1_wi0_r0_wa3_i <= u0_m0_wo1_wi0_r0_wa3_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo1_wi0_r0_wa3_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo1_wi0_r0_wa3_i, 4)));

    -- u0_m0_wo1_wi0_r0_memr3(DUALMEM,161)@13
    u0_m0_wo1_wi0_r0_memr3_ia <= STD_LOGIC_VECTOR(u0_m0_wo1_wi0_r0_delayr1_q);
    u0_m0_wo1_wi0_r0_memr3_aa <= u0_m0_wo1_wi0_r0_wa3_q;
    u0_m0_wo1_wi0_r0_memr3_ab <= u0_m0_wo1_wi0_r0_ra3_count0_lutreg_q;
    u0_m0_wo1_wi0_r0_memr3_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 4,
        numwords_a => 10,
        width_b => 32,
        widthad_b => 4,
        numwords_b => 10,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo1_wi0_r0_memr3_aa,
        data_a => u0_m0_wo1_wi0_r0_memr3_ia,
        wren_a => u0_m0_wo1_wi0_r0_we3_seq_q(0),
        address_b => u0_m0_wo1_wi0_r0_memr3_ab,
        q_b => u0_m0_wo1_wi0_r0_memr3_iq
    );
    u0_m0_wo1_wi0_r0_memr3_q <= u0_m0_wo1_wi0_r0_memr3_iq(31 downto 0);

    -- u0_m0_wo1_wi0_r0_delayr4(DELAY,164)@13
    u0_m0_wo1_wi0_r0_delayr4 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo1_wi0_r0_memr3_q, xout => u0_m0_wo1_wi0_r0_delayr4_q, ena => d_u0_m0_wo1_compute_q_13_q(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo1_wi0_r0_delayr4_q_14(DELAY,641)@13 + 1
    d_u0_m0_wo1_wi0_r0_delayr4_q_14 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo1_wi0_r0_delayr4_q, xout => d_u0_m0_wo1_wi0_r0_delayr4_q_14_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_wi0_r0_delayr5(DELAY,165)@14
    u0_m0_wo1_wi0_r0_delayr5 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo1_wi0_r0_delayr4_q_14_q, xout => u0_m0_wo1_wi0_r0_delayr5_q, ena => d_u0_m0_wo1_compute_q_14_q(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo1_wi0_r0_memr0_q_14(DELAY,640)@13 + 1
    d_u0_m0_wo1_wi0_r0_memr0_q_14 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo1_wi0_r0_memr0_q, xout => d_u0_m0_wo1_wi0_r0_memr0_q_14_q, clk => clk, aclr => areset );

    -- u0_m0_wo1_sym_add0(ADD,173)@14 + 1
    u0_m0_wo1_sym_add0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => d_u0_m0_wo1_wi0_r0_memr0_q_14_q(31)) & d_u0_m0_wo1_wi0_r0_memr0_q_14_q));
    u0_m0_wo1_sym_add0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo1_wi0_r0_delayr5_q(31)) & u0_m0_wo1_wi0_r0_delayr5_q));
    u0_m0_wo1_sym_add0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_sym_add0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_sym_add0_a) + SIGNED(u0_m0_wo1_sym_add0_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_sym_add0_q <= u0_m0_wo1_sym_add0_o(32 downto 0);

    -- u0_m0_wo1_mtree_mult1_2_bs2_merged_bit_select(BITSELECT,598)@15
    u0_m0_wo1_mtree_mult1_2_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo1_sym_add0_q(32 downto 17));
    u0_m0_wo1_mtree_mult1_2_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo1_sym_add0_q(16 downto 0));

    -- u0_m0_wo1_mtree_mult1_2_im0(MULT,442)@15 + 2
    u0_m0_wo1_mtree_mult1_2_im0_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_mtree_mult1_2_bs2_merged_bit_select_b);
    u0_m0_wo1_mtree_mult1_2_im0_b0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm0_q);
    u0_m0_wo1_mtree_mult1_2_im0_reset <= areset;
    u0_m0_wo1_mtree_mult1_2_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 14,
        lpm_widthp => 30,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo1_mtree_mult1_2_im0_a0,
        datab => u0_m0_wo1_mtree_mult1_2_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo1_mtree_mult1_2_im0_reset,
        clock => clk,
        result => u0_m0_wo1_mtree_mult1_2_im0_s1
    );
    u0_m0_wo1_mtree_mult1_2_im0_q <= u0_m0_wo1_mtree_mult1_2_im0_s1;

    -- u0_m0_wo1_mtree_mult1_2_align_8(BITSHIFT,450)@17
    u0_m0_wo1_mtree_mult1_2_align_8_qint <= u0_m0_wo1_mtree_mult1_2_im0_q & "00000000000000000";
    u0_m0_wo1_mtree_mult1_2_align_8_q <= u0_m0_wo1_mtree_mult1_2_align_8_qint(46 downto 0);

    -- u0_m0_wo1_mtree_mult1_2_bjB6(BITJOIN,448)@15
    u0_m0_wo1_mtree_mult1_2_bjB6_q <= GND_q & u0_m0_wo1_mtree_mult1_2_bs2_merged_bit_select_c;

    -- u0_m0_wo1_mtree_mult1_2_im3(MULT,445)@15 + 2
    u0_m0_wo1_mtree_mult1_2_im3_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_mtree_mult1_2_bjB6_q);
    u0_m0_wo1_mtree_mult1_2_im3_b0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm0_q);
    u0_m0_wo1_mtree_mult1_2_im3_reset <= areset;
    u0_m0_wo1_mtree_mult1_2_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo1_mtree_mult1_2_im3_a0,
        datab => u0_m0_wo1_mtree_mult1_2_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo1_mtree_mult1_2_im3_reset,
        clock => clk,
        result => u0_m0_wo1_mtree_mult1_2_im3_s1
    );
    u0_m0_wo1_mtree_mult1_2_im3_q <= u0_m0_wo1_mtree_mult1_2_im3_s1;

    -- u0_m0_wo1_mtree_mult1_2_result_add_0_0(ADD,452)@17 + 1
    u0_m0_wo1_mtree_mult1_2_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 32 => u0_m0_wo1_mtree_mult1_2_im3_q(31)) & u0_m0_wo1_mtree_mult1_2_im3_q));
    u0_m0_wo1_mtree_mult1_2_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 47 => u0_m0_wo1_mtree_mult1_2_align_8_q(46)) & u0_m0_wo1_mtree_mult1_2_align_8_q));
    u0_m0_wo1_mtree_mult1_2_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_2_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_2_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_2_result_add_0_0_a) + SIGNED(u0_m0_wo1_mtree_mult1_2_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_2_result_add_0_0_q <= u0_m0_wo1_mtree_mult1_2_result_add_0_0_o(47 downto 0);

    -- u0_m0_wo1_cm1(LOOKUP,171)@13 + 1
    u0_m0_wo1_cm1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_cm1_q <= "11111011000110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo1_ca2_q) IS
                WHEN "00" => u0_m0_wo1_cm1_q <= "11111011000110";
                WHEN "01" => u0_m0_wo1_cm1_q <= "00001011010100";
                WHEN "10" => u0_m0_wo1_cm1_q <= "11110110010010";
                WHEN "11" => u0_m0_wo1_cm1_q <= "00000100101100";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo1_cm1_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo1_sym_add1(ADD,174)@13 + 1
    u0_m0_wo1_sym_add1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo1_wi0_r0_delayr1_q(31)) & u0_m0_wo1_wi0_r0_delayr1_q));
    u0_m0_wo1_sym_add1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo1_wi0_r0_delayr4_q(31)) & u0_m0_wo1_wi0_r0_delayr4_q));
    u0_m0_wo1_sym_add1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_sym_add1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_sym_add1_a) + SIGNED(u0_m0_wo1_sym_add1_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_sym_add1_q <= u0_m0_wo1_sym_add1_o(32 downto 0);

    -- u0_m0_wo1_mtree_mult1_1_bs2_merged_bit_select(BITSELECT,599)@14
    u0_m0_wo1_mtree_mult1_1_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo1_sym_add1_q(32 downto 17));
    u0_m0_wo1_mtree_mult1_1_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo1_sym_add1_q(16 downto 0));

    -- u0_m0_wo1_mtree_mult1_1_im0(MULT,453)@14 + 2
    u0_m0_wo1_mtree_mult1_1_im0_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_mtree_mult1_1_bs2_merged_bit_select_b);
    u0_m0_wo1_mtree_mult1_1_im0_b0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm1_q);
    u0_m0_wo1_mtree_mult1_1_im0_reset <= areset;
    u0_m0_wo1_mtree_mult1_1_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 14,
        lpm_widthp => 30,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo1_mtree_mult1_1_im0_a0,
        datab => u0_m0_wo1_mtree_mult1_1_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo1_mtree_mult1_1_im0_reset,
        clock => clk,
        result => u0_m0_wo1_mtree_mult1_1_im0_s1
    );
    u0_m0_wo1_mtree_mult1_1_im0_q <= u0_m0_wo1_mtree_mult1_1_im0_s1;

    -- u0_m0_wo1_mtree_mult1_1_align_8(BITSHIFT,461)@16
    u0_m0_wo1_mtree_mult1_1_align_8_qint <= u0_m0_wo1_mtree_mult1_1_im0_q & "00000000000000000";
    u0_m0_wo1_mtree_mult1_1_align_8_q <= u0_m0_wo1_mtree_mult1_1_align_8_qint(46 downto 0);

    -- u0_m0_wo1_mtree_mult1_1_bjB6(BITJOIN,459)@14
    u0_m0_wo1_mtree_mult1_1_bjB6_q <= GND_q & u0_m0_wo1_mtree_mult1_1_bs2_merged_bit_select_c;

    -- u0_m0_wo1_mtree_mult1_1_im3(MULT,456)@14 + 2
    u0_m0_wo1_mtree_mult1_1_im3_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_mtree_mult1_1_bjB6_q);
    u0_m0_wo1_mtree_mult1_1_im3_b0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm1_q);
    u0_m0_wo1_mtree_mult1_1_im3_reset <= areset;
    u0_m0_wo1_mtree_mult1_1_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo1_mtree_mult1_1_im3_a0,
        datab => u0_m0_wo1_mtree_mult1_1_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo1_mtree_mult1_1_im3_reset,
        clock => clk,
        result => u0_m0_wo1_mtree_mult1_1_im3_s1
    );
    u0_m0_wo1_mtree_mult1_1_im3_q <= u0_m0_wo1_mtree_mult1_1_im3_s1;

    -- u0_m0_wo1_mtree_mult1_1_result_add_0_0(ADD,463)@16 + 1
    u0_m0_wo1_mtree_mult1_1_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 32 => u0_m0_wo1_mtree_mult1_1_im3_q(31)) & u0_m0_wo1_mtree_mult1_1_im3_q));
    u0_m0_wo1_mtree_mult1_1_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 47 => u0_m0_wo1_mtree_mult1_1_align_8_q(46)) & u0_m0_wo1_mtree_mult1_1_align_8_q));
    u0_m0_wo1_mtree_mult1_1_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_1_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_1_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_1_result_add_0_0_a) + SIGNED(u0_m0_wo1_mtree_mult1_1_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_1_result_add_0_0_q <= u0_m0_wo1_mtree_mult1_1_result_add_0_0_o(47 downto 0);

    -- u0_m0_wo1_cm2(LOOKUP,172)@13 + 1
    u0_m0_wo1_cm2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_cm2_q <= "00000000000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo1_ca2_q) IS
                WHEN "00" => u0_m0_wo1_cm2_q <= "00000000000000";
                WHEN "01" => u0_m0_wo1_cm2_q <= "00000000000000";
                WHEN "10" => u0_m0_wo1_cm2_q <= "01100101100001";
                WHEN "11" => u0_m0_wo1_cm2_q <= "11101111100010";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo1_cm2_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo1_wi0_r0_delayr2(DELAY,163)@13
    u0_m0_wo1_wi0_r0_delayr2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo1_wi0_r0_delayr1_q, xout => u0_m0_wo1_wi0_r0_delayr2_q, ena => d_u0_m0_wo1_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo1_sym_add2(ADD,175)@13 + 1
    u0_m0_wo1_sym_add2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo1_wi0_r0_delayr2_q(31)) & u0_m0_wo1_wi0_r0_delayr2_q));
    u0_m0_wo1_sym_add2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo1_wi0_r0_memr3_q(31)) & u0_m0_wo1_wi0_r0_memr3_q));
    u0_m0_wo1_sym_add2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_sym_add2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_sym_add2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_sym_add2_a) + SIGNED(u0_m0_wo1_sym_add2_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_sym_add2_q <= u0_m0_wo1_sym_add2_o(32 downto 0);

    -- u0_m0_wo1_mtree_mult1_0_bs2_merged_bit_select(BITSELECT,600)@14
    u0_m0_wo1_mtree_mult1_0_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo1_sym_add2_q(32 downto 17));
    u0_m0_wo1_mtree_mult1_0_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo1_sym_add2_q(16 downto 0));

    -- u0_m0_wo1_mtree_mult1_0_im0(MULT,464)@14 + 2
    u0_m0_wo1_mtree_mult1_0_im0_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_mtree_mult1_0_bs2_merged_bit_select_b);
    u0_m0_wo1_mtree_mult1_0_im0_b0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm2_q);
    u0_m0_wo1_mtree_mult1_0_im0_reset <= areset;
    u0_m0_wo1_mtree_mult1_0_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 14,
        lpm_widthp => 30,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo1_mtree_mult1_0_im0_a0,
        datab => u0_m0_wo1_mtree_mult1_0_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo1_mtree_mult1_0_im0_reset,
        clock => clk,
        result => u0_m0_wo1_mtree_mult1_0_im0_s1
    );
    u0_m0_wo1_mtree_mult1_0_im0_q <= u0_m0_wo1_mtree_mult1_0_im0_s1;

    -- u0_m0_wo1_mtree_mult1_0_align_8(BITSHIFT,472)@16
    u0_m0_wo1_mtree_mult1_0_align_8_qint <= u0_m0_wo1_mtree_mult1_0_im0_q & "00000000000000000";
    u0_m0_wo1_mtree_mult1_0_align_8_q <= u0_m0_wo1_mtree_mult1_0_align_8_qint(46 downto 0);

    -- u0_m0_wo1_mtree_mult1_0_bjB6(BITJOIN,470)@14
    u0_m0_wo1_mtree_mult1_0_bjB6_q <= GND_q & u0_m0_wo1_mtree_mult1_0_bs2_merged_bit_select_c;

    -- u0_m0_wo1_mtree_mult1_0_im3(MULT,467)@14 + 2
    u0_m0_wo1_mtree_mult1_0_im3_a0 <= STD_LOGIC_VECTOR(u0_m0_wo1_mtree_mult1_0_bjB6_q);
    u0_m0_wo1_mtree_mult1_0_im3_b0 <= STD_LOGIC_VECTOR(u0_m0_wo1_cm2_q);
    u0_m0_wo1_mtree_mult1_0_im3_reset <= areset;
    u0_m0_wo1_mtree_mult1_0_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo1_mtree_mult1_0_im3_a0,
        datab => u0_m0_wo1_mtree_mult1_0_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo1_mtree_mult1_0_im3_reset,
        clock => clk,
        result => u0_m0_wo1_mtree_mult1_0_im3_s1
    );
    u0_m0_wo1_mtree_mult1_0_im3_q <= u0_m0_wo1_mtree_mult1_0_im3_s1;

    -- u0_m0_wo1_mtree_mult1_0_result_add_0_0(ADD,474)@16 + 1
    u0_m0_wo1_mtree_mult1_0_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 32 => u0_m0_wo1_mtree_mult1_0_im3_q(31)) & u0_m0_wo1_mtree_mult1_0_im3_q));
    u0_m0_wo1_mtree_mult1_0_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 47 => u0_m0_wo1_mtree_mult1_0_align_8_q(46)) & u0_m0_wo1_mtree_mult1_0_align_8_q));
    u0_m0_wo1_mtree_mult1_0_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_mult1_0_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_mult1_0_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_mult1_0_result_add_0_0_a) + SIGNED(u0_m0_wo1_mtree_mult1_0_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_mult1_0_result_add_0_0_q <= u0_m0_wo1_mtree_mult1_0_result_add_0_0_o(47 downto 0);

    -- u0_m0_wo1_mtree_add0_0(ADD,179)@17 + 1
    u0_m0_wo1_mtree_add0_0_a <= STD_LOGIC_VECTOR(u0_m0_wo1_mtree_mult1_0_result_add_0_0_q);
    u0_m0_wo1_mtree_add0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo1_mtree_mult1_1_result_add_0_0_q);
    u0_m0_wo1_mtree_add0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add0_0_a) + SIGNED(u0_m0_wo1_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add0_0_q <= u0_m0_wo1_mtree_add0_0_o(47 downto 0);

    -- u0_m0_wo1_mtree_add1_0(ADD,180)@18 + 1
    u0_m0_wo1_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 48 => u0_m0_wo1_mtree_add0_0_q(47)) & u0_m0_wo1_mtree_add0_0_q));
    u0_m0_wo1_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 48 => u0_m0_wo1_mtree_mult1_2_result_add_0_0_q(47)) & u0_m0_wo1_mtree_mult1_2_result_add_0_0_q));
    u0_m0_wo1_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_mtree_add1_0_a) + SIGNED(u0_m0_wo1_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo1_mtree_add1_0_q <= u0_m0_wo1_mtree_add1_0_o(48 downto 0);

    -- u0_m0_wo1_accum(ADD,182)@19 + 1
    u0_m0_wo1_accum_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((50 downto 49 => u0_m0_wo1_mtree_add1_0_q(48)) & u0_m0_wo1_mtree_add1_0_q));
    u0_m0_wo1_accum_b <= STD_LOGIC_VECTOR(u0_m0_wo1_accum_q);
    u0_m0_wo1_accum_i <= u0_m0_wo1_accum_a;
    u0_m0_wo1_accum_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_accum_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo1_compute_q_19_q = "1") THEN
                IF (u0_m0_wo1_aseq_q = "1") THEN
                    u0_m0_wo1_accum_o <= u0_m0_wo1_accum_i;
                ELSE
                    u0_m0_wo1_accum_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo1_accum_a) + SIGNED(u0_m0_wo1_accum_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo1_accum_q <= u0_m0_wo1_accum_o(50 downto 0);

    -- u0_m0_wo1_oseq(SEQUENCE,183)@18 + 1
    u0_m0_wo1_oseq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo1_oseq_c : SIGNED(4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_oseq_c := "00011";
            u0_m0_wo1_oseq_q <= "0";
            u0_m0_wo1_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo1_compute_q_18_q = "1") THEN
                IF (u0_m0_wo1_oseq_c = "00000") THEN
                    u0_m0_wo1_oseq_eq <= '1';
                ELSE
                    u0_m0_wo1_oseq_eq <= '0';
                END IF;
                IF (u0_m0_wo1_oseq_eq = '1') THEN
                    u0_m0_wo1_oseq_c := u0_m0_wo1_oseq_c + 3;
                ELSE
                    u0_m0_wo1_oseq_c := u0_m0_wo1_oseq_c - 1;
                END IF;
                u0_m0_wo1_oseq_q <= STD_LOGIC_VECTOR(u0_m0_wo1_oseq_c(4 downto 4));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo1_oseq_gated(LOGICAL,184)@19
    u0_m0_wo1_oseq_gated_q <= u0_m0_wo1_oseq_q and d_u0_m0_wo1_compute_q_19_q;

    -- u0_m0_wo1_oseq_gated_reg(REG,185)@19 + 1
    u0_m0_wo1_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo1_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo1_oseq_gated_reg_q <= STD_LOGIC_VECTOR(u0_m0_wo1_oseq_gated_q);
        END IF;
    END PROCESS;

    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- out0_wo1_data_selector(SELECTOR,297)@20 + 1
    out0_wo1_data_selector_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            out0_wo1_data_selector_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            out0_wo1_data_selector_q <= STD_LOGIC_VECTOR(u0_m2_wo1_accum_q);
            IF (u0_m2_wo1_oseq_gated_reg_q = "1") THEN
                out0_wo1_data_selector_q <= STD_LOGIC_VECTOR(u0_m2_wo1_accum_q);
            END IF;
            IF (u0_m1_wo1_oseq_gated_reg_q = "1") THEN
                out0_wo1_data_selector_q <= STD_LOGIC_VECTOR(u0_m1_wo1_accum_q);
            END IF;
            IF (u0_m0_wo1_oseq_gated_reg_q = "1") THEN
                out0_wo1_data_selector_q <= STD_LOGIC_VECTOR(u0_m0_wo1_accum_q);
            END IF;
        END IF;
    END PROCESS;

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- u0_m2_wo0_run(ENABLEGENERATOR,99)@10 + 2
    u0_m2_wo0_run_ctrl <= u0_m2_wo0_run_out & xIn_v & u0_m2_wo0_run_enableQ;
    u0_m2_wo0_run_clkproc: PROCESS (clk, areset)
        variable u0_m2_wo0_run_enable_c : SIGNED(2 downto 0);
        variable u0_m2_wo0_run_inc : SIGNED(2 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_run_q <= "0";
            u0_m2_wo0_run_enable_c := TO_SIGNED(2, 3);
            u0_m2_wo0_run_enableQ <= "0";
            u0_m2_wo0_run_count <= "001";
            u0_m2_wo0_run_inc := (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m2_wo0_run_out = "1") THEN
                IF (u0_m2_wo0_run_enable_c(2) = '1') THEN
                    u0_m2_wo0_run_enable_c := u0_m2_wo0_run_enable_c - (-3);
                ELSE
                    u0_m2_wo0_run_enable_c := u0_m2_wo0_run_enable_c + (-1);
                END IF;
                u0_m2_wo0_run_enableQ <= STD_LOGIC_VECTOR(u0_m2_wo0_run_enable_c(2 downto 2));
            ELSE
                u0_m2_wo0_run_enableQ <= "0";
            END IF;
            CASE (u0_m2_wo0_run_ctrl) IS
                WHEN "000" | "001" => u0_m2_wo0_run_inc := "000";
                WHEN "010" | "011" => u0_m2_wo0_run_inc := "111";
                WHEN "100" => u0_m2_wo0_run_inc := "000";
                WHEN "101" => u0_m2_wo0_run_inc := "010";
                WHEN "110" => u0_m2_wo0_run_inc := "111";
                WHEN "111" => u0_m2_wo0_run_inc := "001";
                WHEN OTHERS => 
            END CASE;
            u0_m2_wo0_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m2_wo0_run_count) + SIGNED(u0_m2_wo0_run_inc));
            u0_m2_wo0_run_q <= u0_m2_wo0_run_out;
        END IF;
    END PROCESS;
    u0_m2_wo0_run_preEnaQ <= u0_m2_wo0_run_count(2 downto 2);
    u0_m2_wo0_run_out <= u0_m2_wo0_run_preEnaQ and VCC_q;

    -- u0_m2_wo0_memread(DELAY,100)@12
    u0_m2_wo0_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m2_wo0_run_q, xout => u0_m2_wo0_memread_q, clk => clk, aclr => areset );

    -- u0_m2_wo0_compute(DELAY,102)@12
    u0_m2_wo0_compute : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m2_wo0_memread_q, xout => u0_m2_wo0_compute_q, clk => clk, aclr => areset );

    -- d_u0_m2_wo0_compute_q_13(DELAY,627)@12 + 1
    d_u0_m2_wo0_compute_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m2_wo0_compute_q, xout => d_u0_m2_wo0_compute_q_13_q, clk => clk, aclr => areset );

    -- d_u0_m2_wo0_compute_q_14(DELAY,628)@13 + 1
    d_u0_m2_wo0_compute_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m2_wo0_compute_q_13_q, xout => d_u0_m2_wo0_compute_q_14_q, clk => clk, aclr => areset );

    -- d_u0_m2_wo0_compute_q_18(DELAY,629)@14 + 4
    d_u0_m2_wo0_compute_q_18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m2_wo0_compute_q_14_q, xout => d_u0_m2_wo0_compute_q_18_q, clk => clk, aclr => areset );

    -- u0_m2_wo0_aseq(SEQUENCE,135)@18 + 1
    u0_m2_wo0_aseq_clkproc: PROCESS (clk, areset)
        variable u0_m2_wo0_aseq_c : SIGNED(4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_aseq_c := "00000";
            u0_m2_wo0_aseq_q <= "0";
            u0_m2_wo0_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m2_wo0_compute_q_18_q = "1") THEN
                IF (u0_m2_wo0_aseq_c = "00000") THEN
                    u0_m2_wo0_aseq_eq <= '1';
                ELSE
                    u0_m2_wo0_aseq_eq <= '0';
                END IF;
                IF (u0_m2_wo0_aseq_eq = '1') THEN
                    u0_m2_wo0_aseq_c := u0_m2_wo0_aseq_c + 3;
                ELSE
                    u0_m2_wo0_aseq_c := u0_m2_wo0_aseq_c - 1;
                END IF;
                u0_m2_wo0_aseq_q <= STD_LOGIC_VECTOR(u0_m2_wo0_aseq_c(4 downto 4));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m2_wo0_compute_q_19(DELAY,630)@18 + 1
    d_u0_m2_wo0_compute_q_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m2_wo0_compute_q_18_q, xout => d_u0_m2_wo0_compute_q_19_q, clk => clk, aclr => areset );

    -- u0_m2_wo0_ca2(COUNTER,120)@13
    -- low=0, high=3, step=1, init=0
    u0_m2_wo0_ca2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_ca2_i <= TO_UNSIGNED(0, 2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m2_wo0_compute_q_13_q = "1") THEN
                u0_m2_wo0_ca2_i <= u0_m2_wo0_ca2_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m2_wo0_ca2_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m2_wo0_ca2_i, 2)));

    -- d_u0_m2_wo0_ca2_q_14(DELAY,633)@13 + 1
    d_u0_m2_wo0_ca2_q_14 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m2_wo0_ca2_q, xout => d_u0_m2_wo0_ca2_q_14_q, clk => clk, aclr => areset );

    -- u0_m2_wo0_cm0(LOOKUP,124)@14 + 1
    u0_m2_wo0_cm0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_cm0_q <= "00000000001011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (d_u0_m2_wo0_ca2_q_14_q) IS
                WHEN "00" => u0_m2_wo0_cm0_q <= "00000000001011";
                WHEN "01" => u0_m2_wo0_cm0_q <= "11111100111000";
                WHEN "10" => u0_m2_wo0_cm0_q <= "00000101010011";
                WHEN "11" => u0_m2_wo0_cm0_q <= "00000010010100";
                WHEN OTHERS => -- unreachable
                               u0_m2_wo0_cm0_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- d_u0_m2_wo0_memread_q_13(DELAY,625)@12 + 1
    d_u0_m2_wo0_memread_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m2_wo0_memread_q, xout => d_u0_m2_wo0_memread_q_13_q, clk => clk, aclr => areset );

    -- d_u0_m2_wo0_memread_q_14(DELAY,626)@13 + 1
    d_u0_m2_wo0_memread_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m2_wo0_memread_q_13_q, xout => d_u0_m2_wo0_memread_q_14_q, clk => clk, aclr => areset );

    -- u0_m2_wo0_wi0_r0_ra3_count0(COUNTER,110)@13
    -- low=0, high=19, step=1, init=1
    u0_m2_wo0_wi0_r0_ra3_count0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_wi0_r0_ra3_count0_i <= TO_UNSIGNED(1, 5);
            u0_m2_wo0_wi0_r0_ra3_count0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m2_wo0_memread_q_13_q = "1") THEN
                IF (u0_m2_wo0_wi0_r0_ra3_count0_i = TO_UNSIGNED(18, 5)) THEN
                    u0_m2_wo0_wi0_r0_ra3_count0_eq <= '1';
                ELSE
                    u0_m2_wo0_wi0_r0_ra3_count0_eq <= '0';
                END IF;
                IF (u0_m2_wo0_wi0_r0_ra3_count0_eq = '1') THEN
                    u0_m2_wo0_wi0_r0_ra3_count0_i <= u0_m2_wo0_wi0_r0_ra3_count0_i + 13;
                ELSE
                    u0_m2_wo0_wi0_r0_ra3_count0_i <= u0_m2_wo0_wi0_r0_ra3_count0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m2_wo0_wi0_r0_ra3_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m2_wo0_wi0_r0_ra3_count0_i, 5)));

    -- u0_m2_wo0_wi0_r0_ra3_count0_lut(LOOKUP,108)@13
    u0_m2_wo0_wi0_r0_ra3_count0_lut_combproc: PROCESS (u0_m2_wo0_wi0_r0_ra3_count0_q)
    BEGIN
        -- Begin reserved scope level
        CASE (u0_m2_wo0_wi0_r0_ra3_count0_q) IS
            WHEN "00000" => u0_m2_wo0_wi0_r0_ra3_count0_lut_q <= "0011";
            WHEN "00001" => u0_m2_wo0_wi0_r0_ra3_count0_lut_q <= "0010";
            WHEN "00010" => u0_m2_wo0_wi0_r0_ra3_count0_lut_q <= "0001";
            WHEN "00011" => u0_m2_wo0_wi0_r0_ra3_count0_lut_q <= "0000";
            WHEN "00100" => u0_m2_wo0_wi0_r0_ra3_count0_lut_q <= "0101";
            WHEN "00101" => u0_m2_wo0_wi0_r0_ra3_count0_lut_q <= "0100";
            WHEN "00110" => u0_m2_wo0_wi0_r0_ra3_count0_lut_q <= "0011";
            WHEN "00111" => u0_m2_wo0_wi0_r0_ra3_count0_lut_q <= "0010";
            WHEN "01000" => u0_m2_wo0_wi0_r0_ra3_count0_lut_q <= "0111";
            WHEN "01001" => u0_m2_wo0_wi0_r0_ra3_count0_lut_q <= "0110";
            WHEN "01010" => u0_m2_wo0_wi0_r0_ra3_count0_lut_q <= "0101";
            WHEN "01011" => u0_m2_wo0_wi0_r0_ra3_count0_lut_q <= "0100";
            WHEN "01100" => u0_m2_wo0_wi0_r0_ra3_count0_lut_q <= "1001";
            WHEN "01101" => u0_m2_wo0_wi0_r0_ra3_count0_lut_q <= "1000";
            WHEN "01110" => u0_m2_wo0_wi0_r0_ra3_count0_lut_q <= "0111";
            WHEN "01111" => u0_m2_wo0_wi0_r0_ra3_count0_lut_q <= "0110";
            WHEN "10000" => u0_m2_wo0_wi0_r0_ra3_count0_lut_q <= "0001";
            WHEN "10001" => u0_m2_wo0_wi0_r0_ra3_count0_lut_q <= "0000";
            WHEN "10010" => u0_m2_wo0_wi0_r0_ra3_count0_lut_q <= "1001";
            WHEN "10011" => u0_m2_wo0_wi0_r0_ra3_count0_lut_q <= "1000";
            WHEN OTHERS => -- unreachable
                           u0_m2_wo0_wi0_r0_ra3_count0_lut_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- u0_m2_wo0_wi0_r0_ra3_count0_lutreg(REG,109)@13
    u0_m2_wo0_wi0_r0_ra3_count0_lutreg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_wi0_r0_ra3_count0_lutreg_q <= "0011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m2_wo0_memread_q_13_q = "1") THEN
                u0_m2_wo0_wi0_r0_ra3_count0_lutreg_q <= STD_LOGIC_VECTOR(u0_m2_wo0_wi0_r0_ra3_count0_lut_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m2_wo0_wi0_r0_ra0_count0(COUNTER,107)@13
    -- low=0, high=11, step=1, init=1
    u0_m2_wo0_wi0_r0_ra0_count0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_wi0_r0_ra0_count0_i <= TO_UNSIGNED(1, 4);
            u0_m2_wo0_wi0_r0_ra0_count0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m2_wo0_memread_q_13_q = "1") THEN
                IF (u0_m2_wo0_wi0_r0_ra0_count0_i = TO_UNSIGNED(10, 4)) THEN
                    u0_m2_wo0_wi0_r0_ra0_count0_eq <= '1';
                ELSE
                    u0_m2_wo0_wi0_r0_ra0_count0_eq <= '0';
                END IF;
                IF (u0_m2_wo0_wi0_r0_ra0_count0_eq = '1') THEN
                    u0_m2_wo0_wi0_r0_ra0_count0_i <= u0_m2_wo0_wi0_r0_ra0_count0_i + 5;
                ELSE
                    u0_m2_wo0_wi0_r0_ra0_count0_i <= u0_m2_wo0_wi0_r0_ra0_count0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m2_wo0_wi0_r0_ra0_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m2_wo0_wi0_r0_ra0_count0_i, 4)));

    -- u0_m2_wo0_wi0_r0_ra0_count0_lut(LOOKUP,105)@13
    u0_m2_wo0_wi0_r0_ra0_count0_lut_combproc: PROCESS (u0_m2_wo0_wi0_r0_ra0_count0_q)
    BEGIN
        -- Begin reserved scope level
        CASE (u0_m2_wo0_wi0_r0_ra0_count0_q) IS
            WHEN "0000" => u0_m2_wo0_wi0_r0_ra0_count0_lut_q <= "000";
            WHEN "0001" => u0_m2_wo0_wi0_r0_ra0_count0_lut_q <= "001";
            WHEN "0010" => u0_m2_wo0_wi0_r0_ra0_count0_lut_q <= "010";
            WHEN "0011" => u0_m2_wo0_wi0_r0_ra0_count0_lut_q <= "011";
            WHEN "0100" => u0_m2_wo0_wi0_r0_ra0_count0_lut_q <= "010";
            WHEN "0101" => u0_m2_wo0_wi0_r0_ra0_count0_lut_q <= "011";
            WHEN "0110" => u0_m2_wo0_wi0_r0_ra0_count0_lut_q <= "100";
            WHEN "0111" => u0_m2_wo0_wi0_r0_ra0_count0_lut_q <= "101";
            WHEN "1000" => u0_m2_wo0_wi0_r0_ra0_count0_lut_q <= "100";
            WHEN "1001" => u0_m2_wo0_wi0_r0_ra0_count0_lut_q <= "101";
            WHEN "1010" => u0_m2_wo0_wi0_r0_ra0_count0_lut_q <= "000";
            WHEN "1011" => u0_m2_wo0_wi0_r0_ra0_count0_lut_q <= "001";
            WHEN OTHERS => -- unreachable
                           u0_m2_wo0_wi0_r0_ra0_count0_lut_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- u0_m2_wo0_wi0_r0_ra0_count0_lutreg(REG,106)@13
    u0_m2_wo0_wi0_r0_ra0_count0_lutreg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_wi0_r0_ra0_count0_lutreg_q <= "000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m2_wo0_memread_q_13_q = "1") THEN
                u0_m2_wo0_wi0_r0_ra0_count0_lutreg_q <= STD_LOGIC_VECTOR(u0_m2_wo0_wi0_r0_ra0_count0_lut_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m2_wo0_wi0_r0_memr0(DUALMEM,114)@13
    u0_m2_wo0_wi0_r0_memr0_ia <= STD_LOGIC_VECTOR(d_xIn_0_13_q);
    u0_m2_wo0_wi0_r0_memr0_aa <= u0_m2_wo0_wi0_r0_wa0_q;
    u0_m2_wo0_wi0_r0_memr0_ab <= u0_m2_wo0_wi0_r0_ra0_count0_lutreg_q;
    u0_m2_wo0_wi0_r0_memr0_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 6,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m2_wo0_wi0_r0_memr0_aa,
        data_a => u0_m2_wo0_wi0_r0_memr0_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_13_q(0),
        address_b => u0_m2_wo0_wi0_r0_memr0_ab,
        q_b => u0_m2_wo0_wi0_r0_memr0_iq
    );
    u0_m2_wo0_wi0_r0_memr0_q <= u0_m2_wo0_wi0_r0_memr0_iq(31 downto 0);

    -- u0_m2_wo0_wi0_r0_delayr1(DELAY,116)@13
    u0_m2_wo0_wi0_r0_delayr1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m2_wo0_wi0_r0_memr0_q, xout => u0_m2_wo0_wi0_r0_delayr1_q, ena => d_u0_m2_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m2_wo0_wi0_r0_we3_seq(SEQUENCE,111)@12 + 1
    u0_m2_wo0_wi0_r0_we3_seq_clkproc: PROCESS (clk, areset)
        variable u0_m2_wo0_wi0_r0_we3_seq_c : SIGNED(4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_wi0_r0_we3_seq_c := "00000";
            u0_m2_wo0_wi0_r0_we3_seq_q <= "0";
            u0_m2_wo0_wi0_r0_we3_seq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m2_wo0_compute_q = "1") THEN
                IF (u0_m2_wo0_wi0_r0_we3_seq_c = "11111") THEN
                    u0_m2_wo0_wi0_r0_we3_seq_eq <= '1';
                ELSE
                    u0_m2_wo0_wi0_r0_we3_seq_eq <= '0';
                END IF;
                IF (u0_m2_wo0_wi0_r0_we3_seq_eq = '1') THEN
                    u0_m2_wo0_wi0_r0_we3_seq_c := u0_m2_wo0_wi0_r0_we3_seq_c + 3;
                ELSE
                    u0_m2_wo0_wi0_r0_we3_seq_c := u0_m2_wo0_wi0_r0_we3_seq_c - 1;
                END IF;
                u0_m2_wo0_wi0_r0_we3_seq_q <= STD_LOGIC_VECTOR(u0_m2_wo0_wi0_r0_we3_seq_c(4 downto 4));
            ELSE
                u0_m2_wo0_wi0_r0_we3_seq_q <= "0";
            END IF;
        END IF;
    END PROCESS;

    -- u0_m2_wo0_wi0_r0_wa3(COUNTER,113)@13
    -- low=0, high=9, step=1, init=4
    u0_m2_wo0_wi0_r0_wa3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_wi0_r0_wa3_i <= TO_UNSIGNED(4, 4);
            u0_m2_wo0_wi0_r0_wa3_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m2_wo0_wi0_r0_we3_seq_q = "1") THEN
                IF (u0_m2_wo0_wi0_r0_wa3_i = TO_UNSIGNED(8, 4)) THEN
                    u0_m2_wo0_wi0_r0_wa3_eq <= '1';
                ELSE
                    u0_m2_wo0_wi0_r0_wa3_eq <= '0';
                END IF;
                IF (u0_m2_wo0_wi0_r0_wa3_eq = '1') THEN
                    u0_m2_wo0_wi0_r0_wa3_i <= u0_m2_wo0_wi0_r0_wa3_i + 7;
                ELSE
                    u0_m2_wo0_wi0_r0_wa3_i <= u0_m2_wo0_wi0_r0_wa3_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m2_wo0_wi0_r0_wa3_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m2_wo0_wi0_r0_wa3_i, 4)));

    -- u0_m2_wo0_wi0_r0_memr3(DUALMEM,115)@13
    u0_m2_wo0_wi0_r0_memr3_ia <= STD_LOGIC_VECTOR(u0_m2_wo0_wi0_r0_delayr1_q);
    u0_m2_wo0_wi0_r0_memr3_aa <= u0_m2_wo0_wi0_r0_wa3_q;
    u0_m2_wo0_wi0_r0_memr3_ab <= u0_m2_wo0_wi0_r0_ra3_count0_lutreg_q;
    u0_m2_wo0_wi0_r0_memr3_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 4,
        numwords_a => 10,
        width_b => 32,
        widthad_b => 4,
        numwords_b => 10,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m2_wo0_wi0_r0_memr3_aa,
        data_a => u0_m2_wo0_wi0_r0_memr3_ia,
        wren_a => u0_m2_wo0_wi0_r0_we3_seq_q(0),
        address_b => u0_m2_wo0_wi0_r0_memr3_ab,
        q_b => u0_m2_wo0_wi0_r0_memr3_iq
    );
    u0_m2_wo0_wi0_r0_memr3_q <= u0_m2_wo0_wi0_r0_memr3_iq(31 downto 0);

    -- u0_m2_wo0_wi0_r0_delayr4(DELAY,118)@13
    u0_m2_wo0_wi0_r0_delayr4 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m2_wo0_wi0_r0_memr3_q, xout => u0_m2_wo0_wi0_r0_delayr4_q, ena => d_u0_m2_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- d_u0_m2_wo0_wi0_r0_delayr4_q_14(DELAY,632)@13 + 1
    d_u0_m2_wo0_wi0_r0_delayr4_q_14 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m2_wo0_wi0_r0_delayr4_q, xout => d_u0_m2_wo0_wi0_r0_delayr4_q_14_q, clk => clk, aclr => areset );

    -- u0_m2_wo0_wi0_r0_delayr5(DELAY,119)@14
    u0_m2_wo0_wi0_r0_delayr5 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m2_wo0_wi0_r0_delayr4_q_14_q, xout => u0_m2_wo0_wi0_r0_delayr5_q, ena => d_u0_m2_wo0_compute_q_14_q(0), clk => clk, aclr => areset );

    -- d_u0_m2_wo0_wi0_r0_memr0_q_14(DELAY,631)@13 + 1
    d_u0_m2_wo0_wi0_r0_memr0_q_14 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m2_wo0_wi0_r0_memr0_q, xout => d_u0_m2_wo0_wi0_r0_memr0_q_14_q, clk => clk, aclr => areset );

    -- u0_m2_wo0_sym_add0(ADD,127)@14 + 1
    u0_m2_wo0_sym_add0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => d_u0_m2_wo0_wi0_r0_memr0_q_14_q(31)) & d_u0_m2_wo0_wi0_r0_memr0_q_14_q));
    u0_m2_wo0_sym_add0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m2_wo0_wi0_r0_delayr5_q(31)) & u0_m2_wo0_wi0_r0_delayr5_q));
    u0_m2_wo0_sym_add0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_sym_add0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m2_wo0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m2_wo0_sym_add0_a) + SIGNED(u0_m2_wo0_sym_add0_b));
        END IF;
    END PROCESS;
    u0_m2_wo0_sym_add0_q <= u0_m2_wo0_sym_add0_o(32 downto 0);

    -- u0_m2_wo0_mtree_mult1_2_bs2_merged_bit_select(BITSELECT,595)@15
    u0_m2_wo0_mtree_mult1_2_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m2_wo0_sym_add0_q(32 downto 17));
    u0_m2_wo0_mtree_mult1_2_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m2_wo0_sym_add0_q(16 downto 0));

    -- u0_m2_wo0_mtree_mult1_2_im0(MULT,409)@15 + 2
    u0_m2_wo0_mtree_mult1_2_im0_a0 <= STD_LOGIC_VECTOR(u0_m2_wo0_mtree_mult1_2_bs2_merged_bit_select_b);
    u0_m2_wo0_mtree_mult1_2_im0_b0 <= STD_LOGIC_VECTOR(u0_m2_wo0_cm0_q);
    u0_m2_wo0_mtree_mult1_2_im0_reset <= areset;
    u0_m2_wo0_mtree_mult1_2_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 14,
        lpm_widthp => 30,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m2_wo0_mtree_mult1_2_im0_a0,
        datab => u0_m2_wo0_mtree_mult1_2_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m2_wo0_mtree_mult1_2_im0_reset,
        clock => clk,
        result => u0_m2_wo0_mtree_mult1_2_im0_s1
    );
    u0_m2_wo0_mtree_mult1_2_im0_q <= u0_m2_wo0_mtree_mult1_2_im0_s1;

    -- u0_m2_wo0_mtree_mult1_2_align_8(BITSHIFT,417)@17
    u0_m2_wo0_mtree_mult1_2_align_8_qint <= u0_m2_wo0_mtree_mult1_2_im0_q & "00000000000000000";
    u0_m2_wo0_mtree_mult1_2_align_8_q <= u0_m2_wo0_mtree_mult1_2_align_8_qint(46 downto 0);

    -- u0_m2_wo0_mtree_mult1_2_bjB6(BITJOIN,415)@15
    u0_m2_wo0_mtree_mult1_2_bjB6_q <= GND_q & u0_m2_wo0_mtree_mult1_2_bs2_merged_bit_select_c;

    -- u0_m2_wo0_mtree_mult1_2_im3(MULT,412)@15 + 2
    u0_m2_wo0_mtree_mult1_2_im3_a0 <= STD_LOGIC_VECTOR(u0_m2_wo0_mtree_mult1_2_bjB6_q);
    u0_m2_wo0_mtree_mult1_2_im3_b0 <= STD_LOGIC_VECTOR(u0_m2_wo0_cm0_q);
    u0_m2_wo0_mtree_mult1_2_im3_reset <= areset;
    u0_m2_wo0_mtree_mult1_2_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m2_wo0_mtree_mult1_2_im3_a0,
        datab => u0_m2_wo0_mtree_mult1_2_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m2_wo0_mtree_mult1_2_im3_reset,
        clock => clk,
        result => u0_m2_wo0_mtree_mult1_2_im3_s1
    );
    u0_m2_wo0_mtree_mult1_2_im3_q <= u0_m2_wo0_mtree_mult1_2_im3_s1;

    -- u0_m2_wo0_mtree_mult1_2_result_add_0_0(ADD,419)@17 + 1
    u0_m2_wo0_mtree_mult1_2_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 32 => u0_m2_wo0_mtree_mult1_2_im3_q(31)) & u0_m2_wo0_mtree_mult1_2_im3_q));
    u0_m2_wo0_mtree_mult1_2_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 47 => u0_m2_wo0_mtree_mult1_2_align_8_q(46)) & u0_m2_wo0_mtree_mult1_2_align_8_q));
    u0_m2_wo0_mtree_mult1_2_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_mtree_mult1_2_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m2_wo0_mtree_mult1_2_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m2_wo0_mtree_mult1_2_result_add_0_0_a) + SIGNED(u0_m2_wo0_mtree_mult1_2_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m2_wo0_mtree_mult1_2_result_add_0_0_q <= u0_m2_wo0_mtree_mult1_2_result_add_0_0_o(47 downto 0);

    -- u0_m2_wo0_cm1(LOOKUP,125)@13 + 1
    u0_m2_wo0_cm1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_cm1_q <= "11111011000110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m2_wo0_ca2_q) IS
                WHEN "00" => u0_m2_wo0_cm1_q <= "11111011000110";
                WHEN "01" => u0_m2_wo0_cm1_q <= "00001011010100";
                WHEN "10" => u0_m2_wo0_cm1_q <= "11110110010010";
                WHEN "11" => u0_m2_wo0_cm1_q <= "00000100101100";
                WHEN OTHERS => -- unreachable
                               u0_m2_wo0_cm1_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m2_wo0_sym_add1(ADD,128)@13 + 1
    u0_m2_wo0_sym_add1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m2_wo0_wi0_r0_delayr1_q(31)) & u0_m2_wo0_wi0_r0_delayr1_q));
    u0_m2_wo0_sym_add1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m2_wo0_wi0_r0_delayr4_q(31)) & u0_m2_wo0_wi0_r0_delayr4_q));
    u0_m2_wo0_sym_add1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_sym_add1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m2_wo0_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m2_wo0_sym_add1_a) + SIGNED(u0_m2_wo0_sym_add1_b));
        END IF;
    END PROCESS;
    u0_m2_wo0_sym_add1_q <= u0_m2_wo0_sym_add1_o(32 downto 0);

    -- u0_m2_wo0_mtree_mult1_1_bs2_merged_bit_select(BITSELECT,596)@14
    u0_m2_wo0_mtree_mult1_1_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m2_wo0_sym_add1_q(32 downto 17));
    u0_m2_wo0_mtree_mult1_1_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m2_wo0_sym_add1_q(16 downto 0));

    -- u0_m2_wo0_mtree_mult1_1_im0(MULT,420)@14 + 2
    u0_m2_wo0_mtree_mult1_1_im0_a0 <= STD_LOGIC_VECTOR(u0_m2_wo0_mtree_mult1_1_bs2_merged_bit_select_b);
    u0_m2_wo0_mtree_mult1_1_im0_b0 <= STD_LOGIC_VECTOR(u0_m2_wo0_cm1_q);
    u0_m2_wo0_mtree_mult1_1_im0_reset <= areset;
    u0_m2_wo0_mtree_mult1_1_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 14,
        lpm_widthp => 30,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m2_wo0_mtree_mult1_1_im0_a0,
        datab => u0_m2_wo0_mtree_mult1_1_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m2_wo0_mtree_mult1_1_im0_reset,
        clock => clk,
        result => u0_m2_wo0_mtree_mult1_1_im0_s1
    );
    u0_m2_wo0_mtree_mult1_1_im0_q <= u0_m2_wo0_mtree_mult1_1_im0_s1;

    -- u0_m2_wo0_mtree_mult1_1_align_8(BITSHIFT,428)@16
    u0_m2_wo0_mtree_mult1_1_align_8_qint <= u0_m2_wo0_mtree_mult1_1_im0_q & "00000000000000000";
    u0_m2_wo0_mtree_mult1_1_align_8_q <= u0_m2_wo0_mtree_mult1_1_align_8_qint(46 downto 0);

    -- u0_m2_wo0_mtree_mult1_1_bjB6(BITJOIN,426)@14
    u0_m2_wo0_mtree_mult1_1_bjB6_q <= GND_q & u0_m2_wo0_mtree_mult1_1_bs2_merged_bit_select_c;

    -- u0_m2_wo0_mtree_mult1_1_im3(MULT,423)@14 + 2
    u0_m2_wo0_mtree_mult1_1_im3_a0 <= STD_LOGIC_VECTOR(u0_m2_wo0_mtree_mult1_1_bjB6_q);
    u0_m2_wo0_mtree_mult1_1_im3_b0 <= STD_LOGIC_VECTOR(u0_m2_wo0_cm1_q);
    u0_m2_wo0_mtree_mult1_1_im3_reset <= areset;
    u0_m2_wo0_mtree_mult1_1_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m2_wo0_mtree_mult1_1_im3_a0,
        datab => u0_m2_wo0_mtree_mult1_1_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m2_wo0_mtree_mult1_1_im3_reset,
        clock => clk,
        result => u0_m2_wo0_mtree_mult1_1_im3_s1
    );
    u0_m2_wo0_mtree_mult1_1_im3_q <= u0_m2_wo0_mtree_mult1_1_im3_s1;

    -- u0_m2_wo0_mtree_mult1_1_result_add_0_0(ADD,430)@16 + 1
    u0_m2_wo0_mtree_mult1_1_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 32 => u0_m2_wo0_mtree_mult1_1_im3_q(31)) & u0_m2_wo0_mtree_mult1_1_im3_q));
    u0_m2_wo0_mtree_mult1_1_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 47 => u0_m2_wo0_mtree_mult1_1_align_8_q(46)) & u0_m2_wo0_mtree_mult1_1_align_8_q));
    u0_m2_wo0_mtree_mult1_1_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_mtree_mult1_1_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m2_wo0_mtree_mult1_1_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m2_wo0_mtree_mult1_1_result_add_0_0_a) + SIGNED(u0_m2_wo0_mtree_mult1_1_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m2_wo0_mtree_mult1_1_result_add_0_0_q <= u0_m2_wo0_mtree_mult1_1_result_add_0_0_o(47 downto 0);

    -- u0_m2_wo0_cm2(LOOKUP,126)@13 + 1
    u0_m2_wo0_cm2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_cm2_q <= "00000000000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m2_wo0_ca2_q) IS
                WHEN "00" => u0_m2_wo0_cm2_q <= "00000000000000";
                WHEN "01" => u0_m2_wo0_cm2_q <= "00000000000000";
                WHEN "10" => u0_m2_wo0_cm2_q <= "01100101100001";
                WHEN "11" => u0_m2_wo0_cm2_q <= "11101111100010";
                WHEN OTHERS => -- unreachable
                               u0_m2_wo0_cm2_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m2_wo0_wi0_r0_delayr2(DELAY,117)@13
    u0_m2_wo0_wi0_r0_delayr2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m2_wo0_wi0_r0_delayr1_q, xout => u0_m2_wo0_wi0_r0_delayr2_q, ena => d_u0_m2_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m2_wo0_sym_add2(ADD,129)@13 + 1
    u0_m2_wo0_sym_add2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m2_wo0_wi0_r0_delayr2_q(31)) & u0_m2_wo0_wi0_r0_delayr2_q));
    u0_m2_wo0_sym_add2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m2_wo0_wi0_r0_memr3_q(31)) & u0_m2_wo0_wi0_r0_memr3_q));
    u0_m2_wo0_sym_add2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_sym_add2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m2_wo0_sym_add2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m2_wo0_sym_add2_a) + SIGNED(u0_m2_wo0_sym_add2_b));
        END IF;
    END PROCESS;
    u0_m2_wo0_sym_add2_q <= u0_m2_wo0_sym_add2_o(32 downto 0);

    -- u0_m2_wo0_mtree_mult1_0_bs2_merged_bit_select(BITSELECT,597)@14
    u0_m2_wo0_mtree_mult1_0_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m2_wo0_sym_add2_q(32 downto 17));
    u0_m2_wo0_mtree_mult1_0_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m2_wo0_sym_add2_q(16 downto 0));

    -- u0_m2_wo0_mtree_mult1_0_im0(MULT,431)@14 + 2
    u0_m2_wo0_mtree_mult1_0_im0_a0 <= STD_LOGIC_VECTOR(u0_m2_wo0_mtree_mult1_0_bs2_merged_bit_select_b);
    u0_m2_wo0_mtree_mult1_0_im0_b0 <= STD_LOGIC_VECTOR(u0_m2_wo0_cm2_q);
    u0_m2_wo0_mtree_mult1_0_im0_reset <= areset;
    u0_m2_wo0_mtree_mult1_0_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 14,
        lpm_widthp => 30,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m2_wo0_mtree_mult1_0_im0_a0,
        datab => u0_m2_wo0_mtree_mult1_0_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m2_wo0_mtree_mult1_0_im0_reset,
        clock => clk,
        result => u0_m2_wo0_mtree_mult1_0_im0_s1
    );
    u0_m2_wo0_mtree_mult1_0_im0_q <= u0_m2_wo0_mtree_mult1_0_im0_s1;

    -- u0_m2_wo0_mtree_mult1_0_align_8(BITSHIFT,439)@16
    u0_m2_wo0_mtree_mult1_0_align_8_qint <= u0_m2_wo0_mtree_mult1_0_im0_q & "00000000000000000";
    u0_m2_wo0_mtree_mult1_0_align_8_q <= u0_m2_wo0_mtree_mult1_0_align_8_qint(46 downto 0);

    -- u0_m2_wo0_mtree_mult1_0_bjB6(BITJOIN,437)@14
    u0_m2_wo0_mtree_mult1_0_bjB6_q <= GND_q & u0_m2_wo0_mtree_mult1_0_bs2_merged_bit_select_c;

    -- u0_m2_wo0_mtree_mult1_0_im3(MULT,434)@14 + 2
    u0_m2_wo0_mtree_mult1_0_im3_a0 <= STD_LOGIC_VECTOR(u0_m2_wo0_mtree_mult1_0_bjB6_q);
    u0_m2_wo0_mtree_mult1_0_im3_b0 <= STD_LOGIC_VECTOR(u0_m2_wo0_cm2_q);
    u0_m2_wo0_mtree_mult1_0_im3_reset <= areset;
    u0_m2_wo0_mtree_mult1_0_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m2_wo0_mtree_mult1_0_im3_a0,
        datab => u0_m2_wo0_mtree_mult1_0_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m2_wo0_mtree_mult1_0_im3_reset,
        clock => clk,
        result => u0_m2_wo0_mtree_mult1_0_im3_s1
    );
    u0_m2_wo0_mtree_mult1_0_im3_q <= u0_m2_wo0_mtree_mult1_0_im3_s1;

    -- u0_m2_wo0_mtree_mult1_0_result_add_0_0(ADD,441)@16 + 1
    u0_m2_wo0_mtree_mult1_0_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 32 => u0_m2_wo0_mtree_mult1_0_im3_q(31)) & u0_m2_wo0_mtree_mult1_0_im3_q));
    u0_m2_wo0_mtree_mult1_0_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 47 => u0_m2_wo0_mtree_mult1_0_align_8_q(46)) & u0_m2_wo0_mtree_mult1_0_align_8_q));
    u0_m2_wo0_mtree_mult1_0_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_mtree_mult1_0_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m2_wo0_mtree_mult1_0_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m2_wo0_mtree_mult1_0_result_add_0_0_a) + SIGNED(u0_m2_wo0_mtree_mult1_0_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m2_wo0_mtree_mult1_0_result_add_0_0_q <= u0_m2_wo0_mtree_mult1_0_result_add_0_0_o(47 downto 0);

    -- u0_m2_wo0_mtree_add0_0(ADD,133)@17 + 1
    u0_m2_wo0_mtree_add0_0_a <= STD_LOGIC_VECTOR(u0_m2_wo0_mtree_mult1_0_result_add_0_0_q);
    u0_m2_wo0_mtree_add0_0_b <= STD_LOGIC_VECTOR(u0_m2_wo0_mtree_mult1_1_result_add_0_0_q);
    u0_m2_wo0_mtree_add0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m2_wo0_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m2_wo0_mtree_add0_0_a) + SIGNED(u0_m2_wo0_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m2_wo0_mtree_add0_0_q <= u0_m2_wo0_mtree_add0_0_o(47 downto 0);

    -- u0_m2_wo0_mtree_add1_0(ADD,134)@18 + 1
    u0_m2_wo0_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 48 => u0_m2_wo0_mtree_add0_0_q(47)) & u0_m2_wo0_mtree_add0_0_q));
    u0_m2_wo0_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 48 => u0_m2_wo0_mtree_mult1_2_result_add_0_0_q(47)) & u0_m2_wo0_mtree_mult1_2_result_add_0_0_q));
    u0_m2_wo0_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m2_wo0_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m2_wo0_mtree_add1_0_a) + SIGNED(u0_m2_wo0_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m2_wo0_mtree_add1_0_q <= u0_m2_wo0_mtree_add1_0_o(48 downto 0);

    -- u0_m2_wo0_accum(ADD,136)@19 + 1
    u0_m2_wo0_accum_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((50 downto 49 => u0_m2_wo0_mtree_add1_0_q(48)) & u0_m2_wo0_mtree_add1_0_q));
    u0_m2_wo0_accum_b <= STD_LOGIC_VECTOR(u0_m2_wo0_accum_q);
    u0_m2_wo0_accum_i <= u0_m2_wo0_accum_a;
    u0_m2_wo0_accum_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_accum_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m2_wo0_compute_q_19_q = "1") THEN
                IF (u0_m2_wo0_aseq_q = "1") THEN
                    u0_m2_wo0_accum_o <= u0_m2_wo0_accum_i;
                ELSE
                    u0_m2_wo0_accum_o <= STD_LOGIC_VECTOR(SIGNED(u0_m2_wo0_accum_a) + SIGNED(u0_m2_wo0_accum_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m2_wo0_accum_q <= u0_m2_wo0_accum_o(50 downto 0);

    -- u0_m2_wo0_oseq(SEQUENCE,137)@18 + 1
    u0_m2_wo0_oseq_clkproc: PROCESS (clk, areset)
        variable u0_m2_wo0_oseq_c : SIGNED(4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_oseq_c := "00011";
            u0_m2_wo0_oseq_q <= "0";
            u0_m2_wo0_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m2_wo0_compute_q_18_q = "1") THEN
                IF (u0_m2_wo0_oseq_c = "00000") THEN
                    u0_m2_wo0_oseq_eq <= '1';
                ELSE
                    u0_m2_wo0_oseq_eq <= '0';
                END IF;
                IF (u0_m2_wo0_oseq_eq = '1') THEN
                    u0_m2_wo0_oseq_c := u0_m2_wo0_oseq_c + 3;
                ELSE
                    u0_m2_wo0_oseq_c := u0_m2_wo0_oseq_c - 1;
                END IF;
                u0_m2_wo0_oseq_q <= STD_LOGIC_VECTOR(u0_m2_wo0_oseq_c(4 downto 4));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m2_wo0_oseq_gated(LOGICAL,138)@19
    u0_m2_wo0_oseq_gated_q <= u0_m2_wo0_oseq_q and d_u0_m2_wo0_compute_q_19_q;

    -- u0_m2_wo0_oseq_gated_reg(REG,139)@19 + 1
    u0_m2_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m2_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m2_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(u0_m2_wo0_oseq_gated_q);
        END IF;
    END PROCESS;

    -- u0_m1_wo0_run(ENABLEGENERATOR,56)@10 + 2
    u0_m1_wo0_run_ctrl <= u0_m1_wo0_run_out & xIn_v & u0_m1_wo0_run_enableQ;
    u0_m1_wo0_run_clkproc: PROCESS (clk, areset)
        variable u0_m1_wo0_run_enable_c : SIGNED(2 downto 0);
        variable u0_m1_wo0_run_inc : SIGNED(2 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_run_q <= "0";
            u0_m1_wo0_run_enable_c := TO_SIGNED(2, 3);
            u0_m1_wo0_run_enableQ <= "0";
            u0_m1_wo0_run_count <= "001";
            u0_m1_wo0_run_inc := (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m1_wo0_run_out = "1") THEN
                IF (u0_m1_wo0_run_enable_c(2) = '1') THEN
                    u0_m1_wo0_run_enable_c := u0_m1_wo0_run_enable_c - (-3);
                ELSE
                    u0_m1_wo0_run_enable_c := u0_m1_wo0_run_enable_c + (-1);
                END IF;
                u0_m1_wo0_run_enableQ <= STD_LOGIC_VECTOR(u0_m1_wo0_run_enable_c(2 downto 2));
            ELSE
                u0_m1_wo0_run_enableQ <= "0";
            END IF;
            CASE (u0_m1_wo0_run_ctrl) IS
                WHEN "000" | "001" => u0_m1_wo0_run_inc := "000";
                WHEN "010" | "011" => u0_m1_wo0_run_inc := "111";
                WHEN "100" => u0_m1_wo0_run_inc := "000";
                WHEN "101" => u0_m1_wo0_run_inc := "010";
                WHEN "110" => u0_m1_wo0_run_inc := "111";
                WHEN "111" => u0_m1_wo0_run_inc := "001";
                WHEN OTHERS => 
            END CASE;
            u0_m1_wo0_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m1_wo0_run_count) + SIGNED(u0_m1_wo0_run_inc));
            u0_m1_wo0_run_q <= u0_m1_wo0_run_out;
        END IF;
    END PROCESS;
    u0_m1_wo0_run_preEnaQ <= u0_m1_wo0_run_count(2 downto 2);
    u0_m1_wo0_run_out <= u0_m1_wo0_run_preEnaQ and VCC_q;

    -- u0_m1_wo0_memread(DELAY,57)@12
    u0_m1_wo0_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m1_wo0_run_q, xout => u0_m1_wo0_memread_q, clk => clk, aclr => areset );

    -- u0_m1_wo0_compute(DELAY,59)@12
    u0_m1_wo0_compute : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m1_wo0_memread_q, xout => u0_m1_wo0_compute_q, clk => clk, aclr => areset );

    -- d_u0_m1_wo0_compute_q_13(DELAY,620)@12 + 1
    d_u0_m1_wo0_compute_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m1_wo0_compute_q, xout => d_u0_m1_wo0_compute_q_13_q, clk => clk, aclr => areset );

    -- d_u0_m1_wo0_compute_q_18(DELAY,621)@13 + 5
    d_u0_m1_wo0_compute_q_18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m1_wo0_compute_q_13_q, xout => d_u0_m1_wo0_compute_q_18_q, clk => clk, aclr => areset );

    -- u0_m1_wo0_aseq(SEQUENCE,89)@18 + 1
    u0_m1_wo0_aseq_clkproc: PROCESS (clk, areset)
        variable u0_m1_wo0_aseq_c : SIGNED(4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_aseq_c := "00000";
            u0_m1_wo0_aseq_q <= "0";
            u0_m1_wo0_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m1_wo0_compute_q_18_q = "1") THEN
                IF (u0_m1_wo0_aseq_c = "00000") THEN
                    u0_m1_wo0_aseq_eq <= '1';
                ELSE
                    u0_m1_wo0_aseq_eq <= '0';
                END IF;
                IF (u0_m1_wo0_aseq_eq = '1') THEN
                    u0_m1_wo0_aseq_c := u0_m1_wo0_aseq_c + 3;
                ELSE
                    u0_m1_wo0_aseq_c := u0_m1_wo0_aseq_c - 1;
                END IF;
                u0_m1_wo0_aseq_q <= STD_LOGIC_VECTOR(u0_m1_wo0_aseq_c(4 downto 4));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m1_wo0_compute_q_19(DELAY,622)@18 + 1
    d_u0_m1_wo0_compute_q_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m1_wo0_compute_q_18_q, xout => d_u0_m1_wo0_compute_q_19_q, clk => clk, aclr => areset );

    -- u0_m1_wo0_ca4(COUNTER,71)@12
    -- low=0, high=3, step=1, init=0
    u0_m1_wo0_ca4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_ca4_i <= TO_UNSIGNED(0, 2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m1_wo0_compute_q = "1") THEN
                u0_m1_wo0_ca4_i <= u0_m1_wo0_ca4_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m1_wo0_ca4_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m1_wo0_ca4_i, 2)));

    -- d_u0_m1_wo0_ca4_q_14(DELAY,624)@12 + 2
    d_u0_m1_wo0_ca4_q_14 : dspba_delay
    GENERIC MAP ( width => 2, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m1_wo0_ca4_q, xout => d_u0_m1_wo0_ca4_q_14_q, clk => clk, aclr => areset );

    -- u0_m1_wo0_cm0(LOOKUP,75)@14 + 1
    u0_m1_wo0_cm0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_cm0_q <= "00000100011111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (d_u0_m1_wo0_ca4_q_14_q) IS
                WHEN "00" => u0_m1_wo0_cm0_q <= "00000100011111";
                WHEN "01" => u0_m1_wo0_cm0_q <= "11111011001101";
                WHEN "10" => u0_m1_wo0_cm0_q <= "00000011100001";
                WHEN "11" => u0_m1_wo0_cm0_q <= "00000011111000";
                WHEN OTHERS => -- unreachable
                               u0_m1_wo0_cm0_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- d_u0_m1_wo0_memread_q_13(DELAY,619)@12 + 1
    d_u0_m1_wo0_memread_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m1_wo0_memread_q, xout => d_u0_m1_wo0_memread_q_13_q, clk => clk, aclr => areset );

    -- u0_m1_wo0_wi0_r0_ra0_count0(COUNTER,64)@13
    -- low=0, high=11, step=1, init=1
    u0_m1_wo0_wi0_r0_ra0_count0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_wi0_r0_ra0_count0_i <= TO_UNSIGNED(1, 4);
            u0_m1_wo0_wi0_r0_ra0_count0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m1_wo0_memread_q_13_q = "1") THEN
                IF (u0_m1_wo0_wi0_r0_ra0_count0_i = TO_UNSIGNED(10, 4)) THEN
                    u0_m1_wo0_wi0_r0_ra0_count0_eq <= '1';
                ELSE
                    u0_m1_wo0_wi0_r0_ra0_count0_eq <= '0';
                END IF;
                IF (u0_m1_wo0_wi0_r0_ra0_count0_eq = '1') THEN
                    u0_m1_wo0_wi0_r0_ra0_count0_i <= u0_m1_wo0_wi0_r0_ra0_count0_i + 5;
                ELSE
                    u0_m1_wo0_wi0_r0_ra0_count0_i <= u0_m1_wo0_wi0_r0_ra0_count0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m1_wo0_wi0_r0_ra0_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m1_wo0_wi0_r0_ra0_count0_i, 4)));

    -- u0_m1_wo0_wi0_r0_ra0_count0_lut(LOOKUP,62)@13
    u0_m1_wo0_wi0_r0_ra0_count0_lut_combproc: PROCESS (u0_m1_wo0_wi0_r0_ra0_count0_q)
    BEGIN
        -- Begin reserved scope level
        CASE (u0_m1_wo0_wi0_r0_ra0_count0_q) IS
            WHEN "0000" => u0_m1_wo0_wi0_r0_ra0_count0_lut_q <= "001";
            WHEN "0001" => u0_m1_wo0_wi0_r0_ra0_count0_lut_q <= "010";
            WHEN "0010" => u0_m1_wo0_wi0_r0_ra0_count0_lut_q <= "011";
            WHEN "0011" => u0_m1_wo0_wi0_r0_ra0_count0_lut_q <= "100";
            WHEN "0100" => u0_m1_wo0_wi0_r0_ra0_count0_lut_q <= "011";
            WHEN "0101" => u0_m1_wo0_wi0_r0_ra0_count0_lut_q <= "100";
            WHEN "0110" => u0_m1_wo0_wi0_r0_ra0_count0_lut_q <= "101";
            WHEN "0111" => u0_m1_wo0_wi0_r0_ra0_count0_lut_q <= "000";
            WHEN "1000" => u0_m1_wo0_wi0_r0_ra0_count0_lut_q <= "101";
            WHEN "1001" => u0_m1_wo0_wi0_r0_ra0_count0_lut_q <= "000";
            WHEN "1010" => u0_m1_wo0_wi0_r0_ra0_count0_lut_q <= "001";
            WHEN "1011" => u0_m1_wo0_wi0_r0_ra0_count0_lut_q <= "010";
            WHEN OTHERS => -- unreachable
                           u0_m1_wo0_wi0_r0_ra0_count0_lut_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- u0_m1_wo0_wi0_r0_ra0_count0_lutreg(REG,63)@13
    u0_m1_wo0_wi0_r0_ra0_count0_lutreg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_wi0_r0_ra0_count0_lutreg_q <= "001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m1_wo0_memread_q_13_q = "1") THEN
                u0_m1_wo0_wi0_r0_ra0_count0_lutreg_q <= STD_LOGIC_VECTOR(u0_m1_wo0_wi0_r0_ra0_count0_lut_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m1_wo0_wi0_r0_memr0(DUALMEM,66)@13
    u0_m1_wo0_wi0_r0_memr0_ia <= STD_LOGIC_VECTOR(d_xIn_0_13_q);
    u0_m1_wo0_wi0_r0_memr0_aa <= u0_m0_wo0_wi0_r0_wa0_q;
    u0_m1_wo0_wi0_r0_memr0_ab <= u0_m1_wo0_wi0_r0_ra0_count0_lutreg_q;
    u0_m1_wo0_wi0_r0_memr0_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 6,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m1_wo0_wi0_r0_memr0_aa,
        data_a => u0_m1_wo0_wi0_r0_memr0_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_13_q(0),
        address_b => u0_m1_wo0_wi0_r0_memr0_ab,
        q_b => u0_m1_wo0_wi0_r0_memr0_iq
    );
    u0_m1_wo0_wi0_r0_memr0_q <= u0_m1_wo0_wi0_r0_memr0_iq(31 downto 0);

    -- d_u0_m1_wo0_wi0_r0_memr0_q_15(DELAY,623)@13 + 2
    d_u0_m1_wo0_wi0_r0_memr0_q_15 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m1_wo0_wi0_r0_memr0_q, xout => d_u0_m1_wo0_wi0_r0_memr0_q_15_q, clk => clk, aclr => areset );

    -- u0_m1_wo0_mtree_mult1_4_bs2_merged_bit_select(BITSELECT,590)@15
    u0_m1_wo0_mtree_mult1_4_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(d_u0_m1_wo0_wi0_r0_memr0_q_15_q(31 downto 17));
    u0_m1_wo0_mtree_mult1_4_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(d_u0_m1_wo0_wi0_r0_memr0_q_15_q(16 downto 0));

    -- u0_m1_wo0_mtree_mult1_4_im0(MULT,354)@15 + 2
    u0_m1_wo0_mtree_mult1_4_im0_a0 <= STD_LOGIC_VECTOR(u0_m1_wo0_mtree_mult1_4_bs2_merged_bit_select_b);
    u0_m1_wo0_mtree_mult1_4_im0_b0 <= STD_LOGIC_VECTOR(u0_m1_wo0_cm0_q);
    u0_m1_wo0_mtree_mult1_4_im0_reset <= areset;
    u0_m1_wo0_mtree_mult1_4_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 14,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m1_wo0_mtree_mult1_4_im0_a0,
        datab => u0_m1_wo0_mtree_mult1_4_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m1_wo0_mtree_mult1_4_im0_reset,
        clock => clk,
        result => u0_m1_wo0_mtree_mult1_4_im0_s1
    );
    u0_m1_wo0_mtree_mult1_4_im0_q <= u0_m1_wo0_mtree_mult1_4_im0_s1;

    -- u0_m1_wo0_mtree_mult1_4_align_8(BITSHIFT,362)@17
    u0_m1_wo0_mtree_mult1_4_align_8_qint <= u0_m1_wo0_mtree_mult1_4_im0_q & "00000000000000000";
    u0_m1_wo0_mtree_mult1_4_align_8_q <= u0_m1_wo0_mtree_mult1_4_align_8_qint(45 downto 0);

    -- u0_m1_wo0_mtree_mult1_4_bjB6(BITJOIN,360)@15
    u0_m1_wo0_mtree_mult1_4_bjB6_q <= GND_q & u0_m1_wo0_mtree_mult1_4_bs2_merged_bit_select_c;

    -- u0_m1_wo0_mtree_mult1_4_im3(MULT,357)@15 + 2
    u0_m1_wo0_mtree_mult1_4_im3_a0 <= STD_LOGIC_VECTOR(u0_m1_wo0_mtree_mult1_4_bjB6_q);
    u0_m1_wo0_mtree_mult1_4_im3_b0 <= STD_LOGIC_VECTOR(u0_m1_wo0_cm0_q);
    u0_m1_wo0_mtree_mult1_4_im3_reset <= areset;
    u0_m1_wo0_mtree_mult1_4_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m1_wo0_mtree_mult1_4_im3_a0,
        datab => u0_m1_wo0_mtree_mult1_4_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m1_wo0_mtree_mult1_4_im3_reset,
        clock => clk,
        result => u0_m1_wo0_mtree_mult1_4_im3_s1
    );
    u0_m1_wo0_mtree_mult1_4_im3_q <= u0_m1_wo0_mtree_mult1_4_im3_s1;

    -- u0_m1_wo0_mtree_mult1_4_result_add_0_0(ADD,364)@17 + 1
    u0_m1_wo0_mtree_mult1_4_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 32 => u0_m1_wo0_mtree_mult1_4_im3_q(31)) & u0_m1_wo0_mtree_mult1_4_im3_q));
    u0_m1_wo0_mtree_mult1_4_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 46 => u0_m1_wo0_mtree_mult1_4_align_8_q(45)) & u0_m1_wo0_mtree_mult1_4_align_8_q));
    u0_m1_wo0_mtree_mult1_4_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_mtree_mult1_4_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m1_wo0_mtree_mult1_4_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m1_wo0_mtree_mult1_4_result_add_0_0_a) + SIGNED(u0_m1_wo0_mtree_mult1_4_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m1_wo0_mtree_mult1_4_result_add_0_0_q <= u0_m1_wo0_mtree_mult1_4_result_add_0_0_o(46 downto 0);

    -- u0_m1_wo0_cm1(LOOKUP,76)@12 + 1
    u0_m1_wo0_cm1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_cm1_q <= "11101011010010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m1_wo0_ca4_q) IS
                WHEN "00" => u0_m1_wo0_cm1_q <= "11101011010010";
                WHEN "01" => u0_m1_wo0_cm1_q <= "00001111001010";
                WHEN "10" => u0_m1_wo0_cm1_q <= "11111001100011";
                WHEN "11" => u0_m1_wo0_cm1_q <= "11111111001100";
                WHEN OTHERS => -- unreachable
                               u0_m1_wo0_cm1_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m1_wo0_wi0_r0_delayr1(DELAY,67)@13
    u0_m1_wo0_wi0_r0_delayr1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m1_wo0_wi0_r0_memr0_q, xout => u0_m1_wo0_wi0_r0_delayr1_q, ena => d_u0_m1_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m1_wo0_mtree_mult1_3_bs2_merged_bit_select(BITSELECT,591)@13
    u0_m1_wo0_mtree_mult1_3_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m1_wo0_wi0_r0_delayr1_q(31 downto 17));
    u0_m1_wo0_mtree_mult1_3_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m1_wo0_wi0_r0_delayr1_q(16 downto 0));

    -- u0_m1_wo0_mtree_mult1_3_im0(MULT,365)@13 + 2
    u0_m1_wo0_mtree_mult1_3_im0_a0 <= STD_LOGIC_VECTOR(u0_m1_wo0_mtree_mult1_3_bs2_merged_bit_select_b);
    u0_m1_wo0_mtree_mult1_3_im0_b0 <= STD_LOGIC_VECTOR(u0_m1_wo0_cm1_q);
    u0_m1_wo0_mtree_mult1_3_im0_reset <= areset;
    u0_m1_wo0_mtree_mult1_3_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 14,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m1_wo0_mtree_mult1_3_im0_a0,
        datab => u0_m1_wo0_mtree_mult1_3_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m1_wo0_mtree_mult1_3_im0_reset,
        clock => clk,
        result => u0_m1_wo0_mtree_mult1_3_im0_s1
    );
    u0_m1_wo0_mtree_mult1_3_im0_q <= u0_m1_wo0_mtree_mult1_3_im0_s1;

    -- u0_m1_wo0_mtree_mult1_3_align_8(BITSHIFT,373)@15
    u0_m1_wo0_mtree_mult1_3_align_8_qint <= u0_m1_wo0_mtree_mult1_3_im0_q & "00000000000000000";
    u0_m1_wo0_mtree_mult1_3_align_8_q <= u0_m1_wo0_mtree_mult1_3_align_8_qint(45 downto 0);

    -- u0_m1_wo0_mtree_mult1_3_bjB6(BITJOIN,371)@13
    u0_m1_wo0_mtree_mult1_3_bjB6_q <= GND_q & u0_m1_wo0_mtree_mult1_3_bs2_merged_bit_select_c;

    -- u0_m1_wo0_mtree_mult1_3_im3(MULT,368)@13 + 2
    u0_m1_wo0_mtree_mult1_3_im3_a0 <= STD_LOGIC_VECTOR(u0_m1_wo0_mtree_mult1_3_bjB6_q);
    u0_m1_wo0_mtree_mult1_3_im3_b0 <= STD_LOGIC_VECTOR(u0_m1_wo0_cm1_q);
    u0_m1_wo0_mtree_mult1_3_im3_reset <= areset;
    u0_m1_wo0_mtree_mult1_3_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m1_wo0_mtree_mult1_3_im3_a0,
        datab => u0_m1_wo0_mtree_mult1_3_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m1_wo0_mtree_mult1_3_im3_reset,
        clock => clk,
        result => u0_m1_wo0_mtree_mult1_3_im3_s1
    );
    u0_m1_wo0_mtree_mult1_3_im3_q <= u0_m1_wo0_mtree_mult1_3_im3_s1;

    -- u0_m1_wo0_mtree_mult1_3_result_add_0_0(ADD,375)@15 + 1
    u0_m1_wo0_mtree_mult1_3_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 32 => u0_m1_wo0_mtree_mult1_3_im3_q(31)) & u0_m1_wo0_mtree_mult1_3_im3_q));
    u0_m1_wo0_mtree_mult1_3_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 46 => u0_m1_wo0_mtree_mult1_3_align_8_q(45)) & u0_m1_wo0_mtree_mult1_3_align_8_q));
    u0_m1_wo0_mtree_mult1_3_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_mtree_mult1_3_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m1_wo0_mtree_mult1_3_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m1_wo0_mtree_mult1_3_result_add_0_0_a) + SIGNED(u0_m1_wo0_mtree_mult1_3_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m1_wo0_mtree_mult1_3_result_add_0_0_q <= u0_m1_wo0_mtree_mult1_3_result_add_0_0_o(46 downto 0);

    -- u0_m1_wo0_cm2(LOOKUP,77)@12 + 1
    u0_m1_wo0_cm2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_cm2_q <= "11100100011110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m1_wo0_ca4_q) IS
                WHEN "00" => u0_m1_wo0_cm2_q <= "11100100011110";
                WHEN "01" => u0_m1_wo0_cm2_q <= "00111010100100";
                WHEN "10" => u0_m1_wo0_cm2_q <= "01111111111110";
                WHEN "11" => u0_m1_wo0_cm2_q <= "00001110100011";
                WHEN OTHERS => -- unreachable
                               u0_m1_wo0_cm2_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m1_wo0_wi0_r0_delayr2(DELAY,68)@13
    u0_m1_wo0_wi0_r0_delayr2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m1_wo0_wi0_r0_delayr1_q, xout => u0_m1_wo0_wi0_r0_delayr2_q, ena => d_u0_m1_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m1_wo0_mtree_mult1_2_bs2_merged_bit_select(BITSELECT,592)@13
    u0_m1_wo0_mtree_mult1_2_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m1_wo0_wi0_r0_delayr2_q(31 downto 17));
    u0_m1_wo0_mtree_mult1_2_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m1_wo0_wi0_r0_delayr2_q(16 downto 0));

    -- u0_m1_wo0_mtree_mult1_2_im0(MULT,376)@13 + 2
    u0_m1_wo0_mtree_mult1_2_im0_a0 <= STD_LOGIC_VECTOR(u0_m1_wo0_mtree_mult1_2_bs2_merged_bit_select_b);
    u0_m1_wo0_mtree_mult1_2_im0_b0 <= STD_LOGIC_VECTOR(u0_m1_wo0_cm2_q);
    u0_m1_wo0_mtree_mult1_2_im0_reset <= areset;
    u0_m1_wo0_mtree_mult1_2_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 14,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m1_wo0_mtree_mult1_2_im0_a0,
        datab => u0_m1_wo0_mtree_mult1_2_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m1_wo0_mtree_mult1_2_im0_reset,
        clock => clk,
        result => u0_m1_wo0_mtree_mult1_2_im0_s1
    );
    u0_m1_wo0_mtree_mult1_2_im0_q <= u0_m1_wo0_mtree_mult1_2_im0_s1;

    -- u0_m1_wo0_mtree_mult1_2_align_8(BITSHIFT,384)@15
    u0_m1_wo0_mtree_mult1_2_align_8_qint <= u0_m1_wo0_mtree_mult1_2_im0_q & "00000000000000000";
    u0_m1_wo0_mtree_mult1_2_align_8_q <= u0_m1_wo0_mtree_mult1_2_align_8_qint(45 downto 0);

    -- u0_m1_wo0_mtree_mult1_2_bjB6(BITJOIN,382)@13
    u0_m1_wo0_mtree_mult1_2_bjB6_q <= GND_q & u0_m1_wo0_mtree_mult1_2_bs2_merged_bit_select_c;

    -- u0_m1_wo0_mtree_mult1_2_im3(MULT,379)@13 + 2
    u0_m1_wo0_mtree_mult1_2_im3_a0 <= STD_LOGIC_VECTOR(u0_m1_wo0_mtree_mult1_2_bjB6_q);
    u0_m1_wo0_mtree_mult1_2_im3_b0 <= STD_LOGIC_VECTOR(u0_m1_wo0_cm2_q);
    u0_m1_wo0_mtree_mult1_2_im3_reset <= areset;
    u0_m1_wo0_mtree_mult1_2_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m1_wo0_mtree_mult1_2_im3_a0,
        datab => u0_m1_wo0_mtree_mult1_2_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m1_wo0_mtree_mult1_2_im3_reset,
        clock => clk,
        result => u0_m1_wo0_mtree_mult1_2_im3_s1
    );
    u0_m1_wo0_mtree_mult1_2_im3_q <= u0_m1_wo0_mtree_mult1_2_im3_s1;

    -- u0_m1_wo0_mtree_mult1_2_result_add_0_0(ADD,386)@15 + 1
    u0_m1_wo0_mtree_mult1_2_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 32 => u0_m1_wo0_mtree_mult1_2_im3_q(31)) & u0_m1_wo0_mtree_mult1_2_im3_q));
    u0_m1_wo0_mtree_mult1_2_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 46 => u0_m1_wo0_mtree_mult1_2_align_8_q(45)) & u0_m1_wo0_mtree_mult1_2_align_8_q));
    u0_m1_wo0_mtree_mult1_2_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_mtree_mult1_2_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m1_wo0_mtree_mult1_2_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m1_wo0_mtree_mult1_2_result_add_0_0_a) + SIGNED(u0_m1_wo0_mtree_mult1_2_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m1_wo0_mtree_mult1_2_result_add_0_0_q <= u0_m1_wo0_mtree_mult1_2_result_add_0_0_o(46 downto 0);

    -- u0_m1_wo0_mtree_add0_1(ADD,86)@16 + 1
    u0_m1_wo0_mtree_add0_1_a <= STD_LOGIC_VECTOR(u0_m1_wo0_mtree_mult1_2_result_add_0_0_q);
    u0_m1_wo0_mtree_add0_1_b <= STD_LOGIC_VECTOR(u0_m1_wo0_mtree_mult1_3_result_add_0_0_q);
    u0_m1_wo0_mtree_add0_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_mtree_add0_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m1_wo0_mtree_add0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m1_wo0_mtree_add0_1_a) + SIGNED(u0_m1_wo0_mtree_add0_1_b));
        END IF;
    END PROCESS;
    u0_m1_wo0_mtree_add0_1_q <= u0_m1_wo0_mtree_add0_1_o(46 downto 0);

    -- u0_m1_wo0_cm3(LOOKUP,78)@12 + 1
    u0_m1_wo0_cm3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_cm3_q <= "00000110100110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m1_wo0_ca4_q) IS
                WHEN "00" => u0_m1_wo0_cm3_q <= "00000110100110";
                WHEN "01" => u0_m1_wo0_cm3_q <= "11111001000011";
                WHEN "10" => u0_m1_wo0_cm3_q <= "00000010000011";
                WHEN "11" => u0_m1_wo0_cm3_q <= "00001001011010";
                WHEN OTHERS => -- unreachable
                               u0_m1_wo0_cm3_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m1_wo0_wi0_r0_delayr3(DELAY,69)@13
    u0_m1_wo0_wi0_r0_delayr3 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m1_wo0_wi0_r0_delayr2_q, xout => u0_m1_wo0_wi0_r0_delayr3_q, ena => d_u0_m1_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m1_wo0_mtree_mult1_1_bs2_merged_bit_select(BITSELECT,593)@13
    u0_m1_wo0_mtree_mult1_1_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m1_wo0_wi0_r0_delayr3_q(31 downto 17));
    u0_m1_wo0_mtree_mult1_1_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m1_wo0_wi0_r0_delayr3_q(16 downto 0));

    -- u0_m1_wo0_mtree_mult1_1_im0(MULT,387)@13 + 2
    u0_m1_wo0_mtree_mult1_1_im0_a0 <= STD_LOGIC_VECTOR(u0_m1_wo0_mtree_mult1_1_bs2_merged_bit_select_b);
    u0_m1_wo0_mtree_mult1_1_im0_b0 <= STD_LOGIC_VECTOR(u0_m1_wo0_cm3_q);
    u0_m1_wo0_mtree_mult1_1_im0_reset <= areset;
    u0_m1_wo0_mtree_mult1_1_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 14,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m1_wo0_mtree_mult1_1_im0_a0,
        datab => u0_m1_wo0_mtree_mult1_1_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m1_wo0_mtree_mult1_1_im0_reset,
        clock => clk,
        result => u0_m1_wo0_mtree_mult1_1_im0_s1
    );
    u0_m1_wo0_mtree_mult1_1_im0_q <= u0_m1_wo0_mtree_mult1_1_im0_s1;

    -- u0_m1_wo0_mtree_mult1_1_align_8(BITSHIFT,395)@15
    u0_m1_wo0_mtree_mult1_1_align_8_qint <= u0_m1_wo0_mtree_mult1_1_im0_q & "00000000000000000";
    u0_m1_wo0_mtree_mult1_1_align_8_q <= u0_m1_wo0_mtree_mult1_1_align_8_qint(45 downto 0);

    -- u0_m1_wo0_mtree_mult1_1_bjB6(BITJOIN,393)@13
    u0_m1_wo0_mtree_mult1_1_bjB6_q <= GND_q & u0_m1_wo0_mtree_mult1_1_bs2_merged_bit_select_c;

    -- u0_m1_wo0_mtree_mult1_1_im3(MULT,390)@13 + 2
    u0_m1_wo0_mtree_mult1_1_im3_a0 <= STD_LOGIC_VECTOR(u0_m1_wo0_mtree_mult1_1_bjB6_q);
    u0_m1_wo0_mtree_mult1_1_im3_b0 <= STD_LOGIC_VECTOR(u0_m1_wo0_cm3_q);
    u0_m1_wo0_mtree_mult1_1_im3_reset <= areset;
    u0_m1_wo0_mtree_mult1_1_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m1_wo0_mtree_mult1_1_im3_a0,
        datab => u0_m1_wo0_mtree_mult1_1_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m1_wo0_mtree_mult1_1_im3_reset,
        clock => clk,
        result => u0_m1_wo0_mtree_mult1_1_im3_s1
    );
    u0_m1_wo0_mtree_mult1_1_im3_q <= u0_m1_wo0_mtree_mult1_1_im3_s1;

    -- u0_m1_wo0_mtree_mult1_1_result_add_0_0(ADD,397)@15 + 1
    u0_m1_wo0_mtree_mult1_1_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 32 => u0_m1_wo0_mtree_mult1_1_im3_q(31)) & u0_m1_wo0_mtree_mult1_1_im3_q));
    u0_m1_wo0_mtree_mult1_1_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 46 => u0_m1_wo0_mtree_mult1_1_align_8_q(45)) & u0_m1_wo0_mtree_mult1_1_align_8_q));
    u0_m1_wo0_mtree_mult1_1_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_mtree_mult1_1_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m1_wo0_mtree_mult1_1_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m1_wo0_mtree_mult1_1_result_add_0_0_a) + SIGNED(u0_m1_wo0_mtree_mult1_1_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m1_wo0_mtree_mult1_1_result_add_0_0_q <= u0_m1_wo0_mtree_mult1_1_result_add_0_0_o(46 downto 0);

    -- u0_m1_wo0_cm4(LOOKUP,79)@12 + 1
    u0_m1_wo0_cm4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_cm4_q <= "00000000101110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m1_wo0_ca4_q) IS
                WHEN "00" => u0_m1_wo0_cm4_q <= "00000000101110";
                WHEN "01" => u0_m1_wo0_cm4_q <= "00000101010111";
                WHEN "10" => u0_m1_wo0_cm4_q <= "00000000001100";
                WHEN "11" => u0_m1_wo0_cm4_q <= "11111100011100";
                WHEN OTHERS => -- unreachable
                               u0_m1_wo0_cm4_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m1_wo0_wi0_r0_delayr4(DELAY,70)@13
    u0_m1_wo0_wi0_r0_delayr4 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m1_wo0_wi0_r0_delayr3_q, xout => u0_m1_wo0_wi0_r0_delayr4_q, ena => d_u0_m1_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m1_wo0_mtree_mult1_0_bs2_merged_bit_select(BITSELECT,594)@13
    u0_m1_wo0_mtree_mult1_0_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m1_wo0_wi0_r0_delayr4_q(31 downto 17));
    u0_m1_wo0_mtree_mult1_0_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m1_wo0_wi0_r0_delayr4_q(16 downto 0));

    -- u0_m1_wo0_mtree_mult1_0_im0(MULT,398)@13 + 2
    u0_m1_wo0_mtree_mult1_0_im0_a0 <= STD_LOGIC_VECTOR(u0_m1_wo0_mtree_mult1_0_bs2_merged_bit_select_b);
    u0_m1_wo0_mtree_mult1_0_im0_b0 <= STD_LOGIC_VECTOR(u0_m1_wo0_cm4_q);
    u0_m1_wo0_mtree_mult1_0_im0_reset <= areset;
    u0_m1_wo0_mtree_mult1_0_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 14,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m1_wo0_mtree_mult1_0_im0_a0,
        datab => u0_m1_wo0_mtree_mult1_0_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m1_wo0_mtree_mult1_0_im0_reset,
        clock => clk,
        result => u0_m1_wo0_mtree_mult1_0_im0_s1
    );
    u0_m1_wo0_mtree_mult1_0_im0_q <= u0_m1_wo0_mtree_mult1_0_im0_s1;

    -- u0_m1_wo0_mtree_mult1_0_align_8(BITSHIFT,406)@15
    u0_m1_wo0_mtree_mult1_0_align_8_qint <= u0_m1_wo0_mtree_mult1_0_im0_q & "00000000000000000";
    u0_m1_wo0_mtree_mult1_0_align_8_q <= u0_m1_wo0_mtree_mult1_0_align_8_qint(45 downto 0);

    -- u0_m1_wo0_mtree_mult1_0_bjB6(BITJOIN,404)@13
    u0_m1_wo0_mtree_mult1_0_bjB6_q <= GND_q & u0_m1_wo0_mtree_mult1_0_bs2_merged_bit_select_c;

    -- u0_m1_wo0_mtree_mult1_0_im3(MULT,401)@13 + 2
    u0_m1_wo0_mtree_mult1_0_im3_a0 <= STD_LOGIC_VECTOR(u0_m1_wo0_mtree_mult1_0_bjB6_q);
    u0_m1_wo0_mtree_mult1_0_im3_b0 <= STD_LOGIC_VECTOR(u0_m1_wo0_cm4_q);
    u0_m1_wo0_mtree_mult1_0_im3_reset <= areset;
    u0_m1_wo0_mtree_mult1_0_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m1_wo0_mtree_mult1_0_im3_a0,
        datab => u0_m1_wo0_mtree_mult1_0_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m1_wo0_mtree_mult1_0_im3_reset,
        clock => clk,
        result => u0_m1_wo0_mtree_mult1_0_im3_s1
    );
    u0_m1_wo0_mtree_mult1_0_im3_q <= u0_m1_wo0_mtree_mult1_0_im3_s1;

    -- u0_m1_wo0_mtree_mult1_0_result_add_0_0(ADD,408)@15 + 1
    u0_m1_wo0_mtree_mult1_0_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 32 => u0_m1_wo0_mtree_mult1_0_im3_q(31)) & u0_m1_wo0_mtree_mult1_0_im3_q));
    u0_m1_wo0_mtree_mult1_0_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 46 => u0_m1_wo0_mtree_mult1_0_align_8_q(45)) & u0_m1_wo0_mtree_mult1_0_align_8_q));
    u0_m1_wo0_mtree_mult1_0_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_mtree_mult1_0_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m1_wo0_mtree_mult1_0_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m1_wo0_mtree_mult1_0_result_add_0_0_a) + SIGNED(u0_m1_wo0_mtree_mult1_0_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m1_wo0_mtree_mult1_0_result_add_0_0_q <= u0_m1_wo0_mtree_mult1_0_result_add_0_0_o(46 downto 0);

    -- u0_m1_wo0_mtree_add0_0(ADD,85)@16 + 1
    u0_m1_wo0_mtree_add0_0_a <= STD_LOGIC_VECTOR(u0_m1_wo0_mtree_mult1_0_result_add_0_0_q);
    u0_m1_wo0_mtree_add0_0_b <= STD_LOGIC_VECTOR(u0_m1_wo0_mtree_mult1_1_result_add_0_0_q);
    u0_m1_wo0_mtree_add0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m1_wo0_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m1_wo0_mtree_add0_0_a) + SIGNED(u0_m1_wo0_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m1_wo0_mtree_add0_0_q <= u0_m1_wo0_mtree_add0_0_o(46 downto 0);

    -- u0_m1_wo0_mtree_add1_0(ADD,87)@17 + 1
    u0_m1_wo0_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 47 => u0_m1_wo0_mtree_add0_0_q(46)) & u0_m1_wo0_mtree_add0_0_q));
    u0_m1_wo0_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 47 => u0_m1_wo0_mtree_add0_1_q(46)) & u0_m1_wo0_mtree_add0_1_q));
    u0_m1_wo0_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m1_wo0_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m1_wo0_mtree_add1_0_a) + SIGNED(u0_m1_wo0_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m1_wo0_mtree_add1_0_q <= u0_m1_wo0_mtree_add1_0_o(47 downto 0);

    -- u0_m1_wo0_mtree_add2_0(ADD,88)@18 + 1
    u0_m1_wo0_mtree_add2_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 48 => u0_m1_wo0_mtree_add1_0_q(47)) & u0_m1_wo0_mtree_add1_0_q));
    u0_m1_wo0_mtree_add2_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 47 => u0_m1_wo0_mtree_mult1_4_result_add_0_0_q(46)) & u0_m1_wo0_mtree_mult1_4_result_add_0_0_q));
    u0_m1_wo0_mtree_add2_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_mtree_add2_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m1_wo0_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m1_wo0_mtree_add2_0_a) + SIGNED(u0_m1_wo0_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m1_wo0_mtree_add2_0_q <= u0_m1_wo0_mtree_add2_0_o(48 downto 0);

    -- u0_m1_wo0_accum(ADD,90)@19 + 1
    u0_m1_wo0_accum_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((50 downto 49 => u0_m1_wo0_mtree_add2_0_q(48)) & u0_m1_wo0_mtree_add2_0_q));
    u0_m1_wo0_accum_b <= STD_LOGIC_VECTOR(u0_m1_wo0_accum_q);
    u0_m1_wo0_accum_i <= u0_m1_wo0_accum_a;
    u0_m1_wo0_accum_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_accum_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m1_wo0_compute_q_19_q = "1") THEN
                IF (u0_m1_wo0_aseq_q = "1") THEN
                    u0_m1_wo0_accum_o <= u0_m1_wo0_accum_i;
                ELSE
                    u0_m1_wo0_accum_o <= STD_LOGIC_VECTOR(SIGNED(u0_m1_wo0_accum_a) + SIGNED(u0_m1_wo0_accum_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m1_wo0_accum_q <= u0_m1_wo0_accum_o(50 downto 0);

    -- u0_m1_wo0_oseq(SEQUENCE,91)@18 + 1
    u0_m1_wo0_oseq_clkproc: PROCESS (clk, areset)
        variable u0_m1_wo0_oseq_c : SIGNED(4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_oseq_c := "00011";
            u0_m1_wo0_oseq_q <= "0";
            u0_m1_wo0_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m1_wo0_compute_q_18_q = "1") THEN
                IF (u0_m1_wo0_oseq_c = "00000") THEN
                    u0_m1_wo0_oseq_eq <= '1';
                ELSE
                    u0_m1_wo0_oseq_eq <= '0';
                END IF;
                IF (u0_m1_wo0_oseq_eq = '1') THEN
                    u0_m1_wo0_oseq_c := u0_m1_wo0_oseq_c + 3;
                ELSE
                    u0_m1_wo0_oseq_c := u0_m1_wo0_oseq_c - 1;
                END IF;
                u0_m1_wo0_oseq_q <= STD_LOGIC_VECTOR(u0_m1_wo0_oseq_c(4 downto 4));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m1_wo0_oseq_gated(LOGICAL,92)@19
    u0_m1_wo0_oseq_gated_q <= u0_m1_wo0_oseq_q and d_u0_m1_wo0_compute_q_19_q;

    -- u0_m1_wo0_oseq_gated_reg(REG,93)@19 + 1
    u0_m1_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m1_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(u0_m1_wo0_oseq_gated_q);
        END IF;
    END PROCESS;

    -- u0_m0_wo0_run(ENABLEGENERATOR,13)@10 + 2
    u0_m0_wo0_run_ctrl <= u0_m0_wo0_run_out & xIn_v & u0_m0_wo0_run_enableQ;
    u0_m0_wo0_run_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_run_enable_c : SIGNED(2 downto 0);
        variable u0_m0_wo0_run_inc : SIGNED(2 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_run_q <= "0";
            u0_m0_wo0_run_enable_c := TO_SIGNED(2, 3);
            u0_m0_wo0_run_enableQ <= "0";
            u0_m0_wo0_run_count <= "001";
            u0_m0_wo0_run_inc := (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_run_out = "1") THEN
                IF (u0_m0_wo0_run_enable_c(2) = '1') THEN
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c - (-3);
                ELSE
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c + (-1);
                END IF;
                u0_m0_wo0_run_enableQ <= STD_LOGIC_VECTOR(u0_m0_wo0_run_enable_c(2 downto 2));
            ELSE
                u0_m0_wo0_run_enableQ <= "0";
            END IF;
            CASE (u0_m0_wo0_run_ctrl) IS
                WHEN "000" | "001" => u0_m0_wo0_run_inc := "000";
                WHEN "010" | "011" => u0_m0_wo0_run_inc := "111";
                WHEN "100" => u0_m0_wo0_run_inc := "000";
                WHEN "101" => u0_m0_wo0_run_inc := "010";
                WHEN "110" => u0_m0_wo0_run_inc := "111";
                WHEN "111" => u0_m0_wo0_run_inc := "001";
                WHEN OTHERS => 
            END CASE;
            u0_m0_wo0_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_run_count) + SIGNED(u0_m0_wo0_run_inc));
            u0_m0_wo0_run_q <= u0_m0_wo0_run_out;
        END IF;
    END PROCESS;
    u0_m0_wo0_run_preEnaQ <= u0_m0_wo0_run_count(2 downto 2);
    u0_m0_wo0_run_out <= u0_m0_wo0_run_preEnaQ and VCC_q;

    -- u0_m0_wo0_memread(DELAY,14)@12
    u0_m0_wo0_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_run_q, xout => u0_m0_wo0_memread_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_compute(DELAY,16)@12
    u0_m0_wo0_compute : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => u0_m0_wo0_compute_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_13(DELAY,614)@12 + 1
    d_u0_m0_wo0_compute_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_compute_q, xout => d_u0_m0_wo0_compute_q_13_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_18(DELAY,615)@13 + 5
    d_u0_m0_wo0_compute_q_18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_13_q, xout => d_u0_m0_wo0_compute_q_18_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_aseq(SEQUENCE,46)@18 + 1
    u0_m0_wo0_aseq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_aseq_c : SIGNED(4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_aseq_c := "00000";
            u0_m0_wo0_aseq_q <= "0";
            u0_m0_wo0_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_18_q = "1") THEN
                IF (u0_m0_wo0_aseq_c = "00000") THEN
                    u0_m0_wo0_aseq_eq <= '1';
                ELSE
                    u0_m0_wo0_aseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_aseq_eq = '1') THEN
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c + 3;
                ELSE
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c - 1;
                END IF;
                u0_m0_wo0_aseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_aseq_c(4 downto 4));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_compute_q_19(DELAY,616)@18 + 1
    d_u0_m0_wo0_compute_q_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_18_q, xout => d_u0_m0_wo0_compute_q_19_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_ca4(COUNTER,28)@12
    -- low=0, high=3, step=1, init=0
    u0_m0_wo0_ca4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_ca4_i <= TO_UNSIGNED(0, 2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                u0_m0_wo0_ca4_i <= u0_m0_wo0_ca4_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_ca4_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_ca4_i, 2)));

    -- d_u0_m0_wo0_ca4_q_14(DELAY,618)@12 + 2
    d_u0_m0_wo0_ca4_q_14 : dspba_delay
    GENERIC MAP ( width => 2, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_ca4_q, xout => d_u0_m0_wo0_ca4_q_14_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_cm0(LOOKUP,32)@14 + 1
    u0_m0_wo0_cm0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm0_q <= "11111100011100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (d_u0_m0_wo0_ca4_q_14_q) IS
                WHEN "00" => u0_m0_wo0_cm0_q <= "11111100011100";
                WHEN "01" => u0_m0_wo0_cm0_q <= "00000000001100";
                WHEN "10" => u0_m0_wo0_cm0_q <= "00000101010111";
                WHEN "11" => u0_m0_wo0_cm0_q <= "00000000101110";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm0_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_memread_q_13(DELAY,613)@12 + 1
    d_u0_m0_wo0_memread_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => d_u0_m0_wo0_memread_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_ra0_count0(COUNTER,21)@13
    -- low=0, high=11, step=1, init=1
    u0_m0_wo0_wi0_r0_ra0_count0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra0_count0_i <= TO_UNSIGNED(1, 4);
            u0_m0_wo0_wi0_r0_ra0_count0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra0_count0_i = TO_UNSIGNED(10, 4)) THEN
                    u0_m0_wo0_wi0_r0_ra0_count0_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_ra0_count0_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_ra0_count0_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_ra0_count0_i <= u0_m0_wo0_wi0_r0_ra0_count0_i + 5;
                ELSE
                    u0_m0_wo0_wi0_r0_ra0_count0_i <= u0_m0_wo0_wi0_r0_ra0_count0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra0_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra0_count0_i, 4)));

    -- u0_m0_wo0_wi0_r0_ra0_count0_lut(LOOKUP,19)@13
    u0_m0_wo0_wi0_r0_ra0_count0_lut_combproc: PROCESS (u0_m0_wo0_wi0_r0_ra0_count0_q)
    BEGIN
        -- Begin reserved scope level
        CASE (u0_m0_wo0_wi0_r0_ra0_count0_q) IS
            WHEN "0000" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "001";
            WHEN "0001" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "010";
            WHEN "0010" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "011";
            WHEN "0011" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "100";
            WHEN "0100" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "011";
            WHEN "0101" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "100";
            WHEN "0110" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "101";
            WHEN "0111" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "000";
            WHEN "1000" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "101";
            WHEN "1001" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "000";
            WHEN "1010" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "001";
            WHEN "1011" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "010";
            WHEN OTHERS => -- unreachable
                           u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra0_count0_lutreg(REG,20)@13
    u0_m0_wo0_wi0_r0_ra0_count0_lutreg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q <= "001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra0_count0_lut_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_memr0(DUALMEM,23)@13
    u0_m0_wo0_wi0_r0_memr0_ia <= STD_LOGIC_VECTOR(d_xIn_0_13_q);
    u0_m0_wo0_wi0_r0_memr0_aa <= u0_m0_wo0_wi0_r0_wa0_q;
    u0_m0_wo0_wi0_r0_memr0_ab <= u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q;
    u0_m0_wo0_wi0_r0_memr0_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 6,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr0_aa,
        data_a => u0_m0_wo0_wi0_r0_memr0_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_13_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr0_ab,
        q_b => u0_m0_wo0_wi0_r0_memr0_iq
    );
    u0_m0_wo0_wi0_r0_memr0_q <= u0_m0_wo0_wi0_r0_memr0_iq(31 downto 0);

    -- d_u0_m0_wo0_wi0_r0_memr0_q_15(DELAY,617)@13 + 2
    d_u0_m0_wo0_wi0_r0_memr0_q_15 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_memr0_q, xout => d_u0_m0_wo0_wi0_r0_memr0_q_15_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_4_bs2_merged_bit_select(BITSELECT,585)@15
    u0_m0_wo0_mtree_mult1_4_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_wi0_r0_memr0_q_15_q(31 downto 17));
    u0_m0_wo0_mtree_mult1_4_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(d_u0_m0_wo0_wi0_r0_memr0_q_15_q(16 downto 0));

    -- u0_m0_wo0_mtree_mult1_4_im0(MULT,299)@15 + 2
    u0_m0_wo0_mtree_mult1_4_im0_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_4_bs2_merged_bit_select_b);
    u0_m0_wo0_mtree_mult1_4_im0_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm0_q);
    u0_m0_wo0_mtree_mult1_4_im0_reset <= areset;
    u0_m0_wo0_mtree_mult1_4_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 14,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_4_im0_a0,
        datab => u0_m0_wo0_mtree_mult1_4_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_4_im0_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_4_im0_s1
    );
    u0_m0_wo0_mtree_mult1_4_im0_q <= u0_m0_wo0_mtree_mult1_4_im0_s1;

    -- u0_m0_wo0_mtree_mult1_4_align_8(BITSHIFT,307)@17
    u0_m0_wo0_mtree_mult1_4_align_8_qint <= u0_m0_wo0_mtree_mult1_4_im0_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_4_align_8_q <= u0_m0_wo0_mtree_mult1_4_align_8_qint(45 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_bjB6(BITJOIN,305)@15
    u0_m0_wo0_mtree_mult1_4_bjB6_q <= GND_q & u0_m0_wo0_mtree_mult1_4_bs2_merged_bit_select_c;

    -- u0_m0_wo0_mtree_mult1_4_im3(MULT,302)@15 + 2
    u0_m0_wo0_mtree_mult1_4_im3_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_4_bjB6_q);
    u0_m0_wo0_mtree_mult1_4_im3_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm0_q);
    u0_m0_wo0_mtree_mult1_4_im3_reset <= areset;
    u0_m0_wo0_mtree_mult1_4_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_4_im3_a0,
        datab => u0_m0_wo0_mtree_mult1_4_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_4_im3_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_4_im3_s1
    );
    u0_m0_wo0_mtree_mult1_4_im3_q <= u0_m0_wo0_mtree_mult1_4_im3_s1;

    -- u0_m0_wo0_mtree_mult1_4_result_add_0_0(ADD,309)@17 + 1
    u0_m0_wo0_mtree_mult1_4_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 32 => u0_m0_wo0_mtree_mult1_4_im3_q(31)) & u0_m0_wo0_mtree_mult1_4_im3_q));
    u0_m0_wo0_mtree_mult1_4_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 46 => u0_m0_wo0_mtree_mult1_4_align_8_q(45)) & u0_m0_wo0_mtree_mult1_4_align_8_q));
    u0_m0_wo0_mtree_mult1_4_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_4_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_4_result_add_0_0_a) + SIGNED(u0_m0_wo0_mtree_mult1_4_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_result_add_0_0_q <= u0_m0_wo0_mtree_mult1_4_result_add_0_0_o(46 downto 0);

    -- u0_m0_wo0_cm1(LOOKUP,33)@12 + 1
    u0_m0_wo0_cm1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm1_q <= "00001001011010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca4_q) IS
                WHEN "00" => u0_m0_wo0_cm1_q <= "00001001011010";
                WHEN "01" => u0_m0_wo0_cm1_q <= "00000010000011";
                WHEN "10" => u0_m0_wo0_cm1_q <= "11111001000011";
                WHEN "11" => u0_m0_wo0_cm1_q <= "00000110100110";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm1_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr1(DELAY,24)@13
    u0_m0_wo0_wi0_r0_delayr1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_memr0_q, xout => u0_m0_wo0_wi0_r0_delayr1_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_3_bs2_merged_bit_select(BITSELECT,586)@13
    u0_m0_wo0_mtree_mult1_3_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr1_q(31 downto 17));
    u0_m0_wo0_mtree_mult1_3_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr1_q(16 downto 0));

    -- u0_m0_wo0_mtree_mult1_3_im0(MULT,310)@13 + 2
    u0_m0_wo0_mtree_mult1_3_im0_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_3_bs2_merged_bit_select_b);
    u0_m0_wo0_mtree_mult1_3_im0_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm1_q);
    u0_m0_wo0_mtree_mult1_3_im0_reset <= areset;
    u0_m0_wo0_mtree_mult1_3_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 14,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_3_im0_a0,
        datab => u0_m0_wo0_mtree_mult1_3_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_3_im0_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_3_im0_s1
    );
    u0_m0_wo0_mtree_mult1_3_im0_q <= u0_m0_wo0_mtree_mult1_3_im0_s1;

    -- u0_m0_wo0_mtree_mult1_3_align_8(BITSHIFT,318)@15
    u0_m0_wo0_mtree_mult1_3_align_8_qint <= u0_m0_wo0_mtree_mult1_3_im0_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_3_align_8_q <= u0_m0_wo0_mtree_mult1_3_align_8_qint(45 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_bjB6(BITJOIN,316)@13
    u0_m0_wo0_mtree_mult1_3_bjB6_q <= GND_q & u0_m0_wo0_mtree_mult1_3_bs2_merged_bit_select_c;

    -- u0_m0_wo0_mtree_mult1_3_im3(MULT,313)@13 + 2
    u0_m0_wo0_mtree_mult1_3_im3_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_3_bjB6_q);
    u0_m0_wo0_mtree_mult1_3_im3_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm1_q);
    u0_m0_wo0_mtree_mult1_3_im3_reset <= areset;
    u0_m0_wo0_mtree_mult1_3_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_3_im3_a0,
        datab => u0_m0_wo0_mtree_mult1_3_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_3_im3_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_3_im3_s1
    );
    u0_m0_wo0_mtree_mult1_3_im3_q <= u0_m0_wo0_mtree_mult1_3_im3_s1;

    -- u0_m0_wo0_mtree_mult1_3_result_add_0_0(ADD,320)@15 + 1
    u0_m0_wo0_mtree_mult1_3_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 32 => u0_m0_wo0_mtree_mult1_3_im3_q(31)) & u0_m0_wo0_mtree_mult1_3_im3_q));
    u0_m0_wo0_mtree_mult1_3_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 46 => u0_m0_wo0_mtree_mult1_3_align_8_q(45)) & u0_m0_wo0_mtree_mult1_3_align_8_q));
    u0_m0_wo0_mtree_mult1_3_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_3_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_3_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_3_result_add_0_0_a) + SIGNED(u0_m0_wo0_mtree_mult1_3_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_3_result_add_0_0_q <= u0_m0_wo0_mtree_mult1_3_result_add_0_0_o(46 downto 0);

    -- u0_m0_wo0_cm2(LOOKUP,34)@12 + 1
    u0_m0_wo0_cm2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm2_q <= "00001110100011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca4_q) IS
                WHEN "00" => u0_m0_wo0_cm2_q <= "00001110100011";
                WHEN "01" => u0_m0_wo0_cm2_q <= "01111111111110";
                WHEN "10" => u0_m0_wo0_cm2_q <= "00111010100100";
                WHEN "11" => u0_m0_wo0_cm2_q <= "11100100011110";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm2_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr2(DELAY,25)@13
    u0_m0_wo0_wi0_r0_delayr2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr1_q, xout => u0_m0_wo0_wi0_r0_delayr2_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_2_bs2_merged_bit_select(BITSELECT,587)@13
    u0_m0_wo0_mtree_mult1_2_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr2_q(31 downto 17));
    u0_m0_wo0_mtree_mult1_2_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr2_q(16 downto 0));

    -- u0_m0_wo0_mtree_mult1_2_im0(MULT,321)@13 + 2
    u0_m0_wo0_mtree_mult1_2_im0_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_2_bs2_merged_bit_select_b);
    u0_m0_wo0_mtree_mult1_2_im0_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm2_q);
    u0_m0_wo0_mtree_mult1_2_im0_reset <= areset;
    u0_m0_wo0_mtree_mult1_2_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 14,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_2_im0_a0,
        datab => u0_m0_wo0_mtree_mult1_2_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_2_im0_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_2_im0_s1
    );
    u0_m0_wo0_mtree_mult1_2_im0_q <= u0_m0_wo0_mtree_mult1_2_im0_s1;

    -- u0_m0_wo0_mtree_mult1_2_align_8(BITSHIFT,329)@15
    u0_m0_wo0_mtree_mult1_2_align_8_qint <= u0_m0_wo0_mtree_mult1_2_im0_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_2_align_8_q <= u0_m0_wo0_mtree_mult1_2_align_8_qint(45 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_bjB6(BITJOIN,327)@13
    u0_m0_wo0_mtree_mult1_2_bjB6_q <= GND_q & u0_m0_wo0_mtree_mult1_2_bs2_merged_bit_select_c;

    -- u0_m0_wo0_mtree_mult1_2_im3(MULT,324)@13 + 2
    u0_m0_wo0_mtree_mult1_2_im3_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_2_bjB6_q);
    u0_m0_wo0_mtree_mult1_2_im3_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm2_q);
    u0_m0_wo0_mtree_mult1_2_im3_reset <= areset;
    u0_m0_wo0_mtree_mult1_2_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_2_im3_a0,
        datab => u0_m0_wo0_mtree_mult1_2_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_2_im3_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_2_im3_s1
    );
    u0_m0_wo0_mtree_mult1_2_im3_q <= u0_m0_wo0_mtree_mult1_2_im3_s1;

    -- u0_m0_wo0_mtree_mult1_2_result_add_0_0(ADD,331)@15 + 1
    u0_m0_wo0_mtree_mult1_2_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 32 => u0_m0_wo0_mtree_mult1_2_im3_q(31)) & u0_m0_wo0_mtree_mult1_2_im3_q));
    u0_m0_wo0_mtree_mult1_2_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 46 => u0_m0_wo0_mtree_mult1_2_align_8_q(45)) & u0_m0_wo0_mtree_mult1_2_align_8_q));
    u0_m0_wo0_mtree_mult1_2_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_2_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_2_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_2_result_add_0_0_a) + SIGNED(u0_m0_wo0_mtree_mult1_2_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_2_result_add_0_0_q <= u0_m0_wo0_mtree_mult1_2_result_add_0_0_o(46 downto 0);

    -- u0_m0_wo0_mtree_add0_1(ADD,43)@16 + 1
    u0_m0_wo0_mtree_add0_1_a <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_2_result_add_0_0_q);
    u0_m0_wo0_mtree_add0_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_3_result_add_0_0_q);
    u0_m0_wo0_mtree_add0_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_1_a) + SIGNED(u0_m0_wo0_mtree_add0_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_1_q <= u0_m0_wo0_mtree_add0_1_o(46 downto 0);

    -- u0_m0_wo0_cm3(LOOKUP,35)@12 + 1
    u0_m0_wo0_cm3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm3_q <= "11111111001100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca4_q) IS
                WHEN "00" => u0_m0_wo0_cm3_q <= "11111111001100";
                WHEN "01" => u0_m0_wo0_cm3_q <= "11111001100011";
                WHEN "10" => u0_m0_wo0_cm3_q <= "00001111001010";
                WHEN "11" => u0_m0_wo0_cm3_q <= "11101011010010";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm3_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr3(DELAY,26)@13
    u0_m0_wo0_wi0_r0_delayr3 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr2_q, xout => u0_m0_wo0_wi0_r0_delayr3_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_1_bs2_merged_bit_select(BITSELECT,588)@13
    u0_m0_wo0_mtree_mult1_1_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr3_q(31 downto 17));
    u0_m0_wo0_mtree_mult1_1_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr3_q(16 downto 0));

    -- u0_m0_wo0_mtree_mult1_1_im0(MULT,332)@13 + 2
    u0_m0_wo0_mtree_mult1_1_im0_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_bs2_merged_bit_select_b);
    u0_m0_wo0_mtree_mult1_1_im0_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm3_q);
    u0_m0_wo0_mtree_mult1_1_im0_reset <= areset;
    u0_m0_wo0_mtree_mult1_1_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 14,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_1_im0_a0,
        datab => u0_m0_wo0_mtree_mult1_1_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_1_im0_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_1_im0_s1
    );
    u0_m0_wo0_mtree_mult1_1_im0_q <= u0_m0_wo0_mtree_mult1_1_im0_s1;

    -- u0_m0_wo0_mtree_mult1_1_align_8(BITSHIFT,340)@15
    u0_m0_wo0_mtree_mult1_1_align_8_qint <= u0_m0_wo0_mtree_mult1_1_im0_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_1_align_8_q <= u0_m0_wo0_mtree_mult1_1_align_8_qint(45 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_bjB6(BITJOIN,338)@13
    u0_m0_wo0_mtree_mult1_1_bjB6_q <= GND_q & u0_m0_wo0_mtree_mult1_1_bs2_merged_bit_select_c;

    -- u0_m0_wo0_mtree_mult1_1_im3(MULT,335)@13 + 2
    u0_m0_wo0_mtree_mult1_1_im3_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_bjB6_q);
    u0_m0_wo0_mtree_mult1_1_im3_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm3_q);
    u0_m0_wo0_mtree_mult1_1_im3_reset <= areset;
    u0_m0_wo0_mtree_mult1_1_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_1_im3_a0,
        datab => u0_m0_wo0_mtree_mult1_1_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_1_im3_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_1_im3_s1
    );
    u0_m0_wo0_mtree_mult1_1_im3_q <= u0_m0_wo0_mtree_mult1_1_im3_s1;

    -- u0_m0_wo0_mtree_mult1_1_result_add_0_0(ADD,342)@15 + 1
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 32 => u0_m0_wo0_mtree_mult1_1_im3_q(31)) & u0_m0_wo0_mtree_mult1_1_im3_q));
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 46 => u0_m0_wo0_mtree_mult1_1_align_8_q(45)) & u0_m0_wo0_mtree_mult1_1_align_8_q));
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_1_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_1_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_1_result_add_0_0_a) + SIGNED(u0_m0_wo0_mtree_mult1_1_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_q <= u0_m0_wo0_mtree_mult1_1_result_add_0_0_o(46 downto 0);

    -- u0_m0_wo0_cm4(LOOKUP,36)@12 + 1
    u0_m0_wo0_cm4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm4_q <= "00000011111000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca4_q) IS
                WHEN "00" => u0_m0_wo0_cm4_q <= "00000011111000";
                WHEN "01" => u0_m0_wo0_cm4_q <= "00000011100001";
                WHEN "10" => u0_m0_wo0_cm4_q <= "11111011001101";
                WHEN "11" => u0_m0_wo0_cm4_q <= "00000100011111";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm4_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr4(DELAY,27)@13
    u0_m0_wo0_wi0_r0_delayr4 : dspba_delay
    GENERIC MAP ( width => 32, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr3_q, xout => u0_m0_wo0_wi0_r0_delayr4_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_0_bs2_merged_bit_select(BITSELECT,589)@13
    u0_m0_wo0_mtree_mult1_0_bs2_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr4_q(31 downto 17));
    u0_m0_wo0_mtree_mult1_0_bs2_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr4_q(16 downto 0));

    -- u0_m0_wo0_mtree_mult1_0_im0(MULT,343)@13 + 2
    u0_m0_wo0_mtree_mult1_0_im0_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_bs2_merged_bit_select_b);
    u0_m0_wo0_mtree_mult1_0_im0_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm4_q);
    u0_m0_wo0_mtree_mult1_0_im0_reset <= areset;
    u0_m0_wo0_mtree_mult1_0_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 14,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_0_im0_a0,
        datab => u0_m0_wo0_mtree_mult1_0_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_0_im0_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_0_im0_s1
    );
    u0_m0_wo0_mtree_mult1_0_im0_q <= u0_m0_wo0_mtree_mult1_0_im0_s1;

    -- u0_m0_wo0_mtree_mult1_0_align_8(BITSHIFT,351)@15
    u0_m0_wo0_mtree_mult1_0_align_8_qint <= u0_m0_wo0_mtree_mult1_0_im0_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_0_align_8_q <= u0_m0_wo0_mtree_mult1_0_align_8_qint(45 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_bjB6(BITJOIN,349)@13
    u0_m0_wo0_mtree_mult1_0_bjB6_q <= GND_q & u0_m0_wo0_mtree_mult1_0_bs2_merged_bit_select_c;

    -- u0_m0_wo0_mtree_mult1_0_im3(MULT,346)@13 + 2
    u0_m0_wo0_mtree_mult1_0_im3_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_bjB6_q);
    u0_m0_wo0_mtree_mult1_0_im3_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm4_q);
    u0_m0_wo0_mtree_mult1_0_im3_reset <= areset;
    u0_m0_wo0_mtree_mult1_0_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 14,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_0_im3_a0,
        datab => u0_m0_wo0_mtree_mult1_0_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_0_im3_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_0_im3_s1
    );
    u0_m0_wo0_mtree_mult1_0_im3_q <= u0_m0_wo0_mtree_mult1_0_im3_s1;

    -- u0_m0_wo0_mtree_mult1_0_result_add_0_0(ADD,353)@15 + 1
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 32 => u0_m0_wo0_mtree_mult1_0_im3_q(31)) & u0_m0_wo0_mtree_mult1_0_im3_q));
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 46 => u0_m0_wo0_mtree_mult1_0_align_8_q(45)) & u0_m0_wo0_mtree_mult1_0_align_8_q));
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_0_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_0_result_add_0_0_a) + SIGNED(u0_m0_wo0_mtree_mult1_0_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_q <= u0_m0_wo0_mtree_mult1_0_result_add_0_0_o(46 downto 0);

    -- u0_m0_wo0_mtree_add0_0(ADD,42)@16 + 1
    u0_m0_wo0_mtree_add0_0_a <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_result_add_0_0_q);
    u0_m0_wo0_mtree_add0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_result_add_0_0_q);
    u0_m0_wo0_mtree_add0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_0_a) + SIGNED(u0_m0_wo0_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_q <= u0_m0_wo0_mtree_add0_0_o(46 downto 0);

    -- u0_m0_wo0_mtree_add1_0(ADD,44)@17 + 1
    u0_m0_wo0_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 47 => u0_m0_wo0_mtree_add0_0_q(46)) & u0_m0_wo0_mtree_add0_0_q));
    u0_m0_wo0_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 47 => u0_m0_wo0_mtree_add0_1_q(46)) & u0_m0_wo0_mtree_add0_1_q));
    u0_m0_wo0_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_0_a) + SIGNED(u0_m0_wo0_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_0_q <= u0_m0_wo0_mtree_add1_0_o(47 downto 0);

    -- u0_m0_wo0_mtree_add2_0(ADD,45)@18 + 1
    u0_m0_wo0_mtree_add2_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 48 => u0_m0_wo0_mtree_add1_0_q(47)) & u0_m0_wo0_mtree_add1_0_q));
    u0_m0_wo0_mtree_add2_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 47 => u0_m0_wo0_mtree_mult1_4_result_add_0_0_q(46)) & u0_m0_wo0_mtree_mult1_4_result_add_0_0_q));
    u0_m0_wo0_mtree_add2_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_0_a) + SIGNED(u0_m0_wo0_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_0_q <= u0_m0_wo0_mtree_add2_0_o(48 downto 0);

    -- u0_m0_wo0_accum(ADD,47)@19 + 1
    u0_m0_wo0_accum_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((50 downto 49 => u0_m0_wo0_mtree_add2_0_q(48)) & u0_m0_wo0_mtree_add2_0_q));
    u0_m0_wo0_accum_b <= STD_LOGIC_VECTOR(u0_m0_wo0_accum_q);
    u0_m0_wo0_accum_i <= u0_m0_wo0_accum_a;
    u0_m0_wo0_accum_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_accum_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_19_q = "1") THEN
                IF (u0_m0_wo0_aseq_q = "1") THEN
                    u0_m0_wo0_accum_o <= u0_m0_wo0_accum_i;
                ELSE
                    u0_m0_wo0_accum_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_accum_a) + SIGNED(u0_m0_wo0_accum_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_accum_q <= u0_m0_wo0_accum_o(50 downto 0);

    -- u0_m0_wo0_oseq(SEQUENCE,48)@18 + 1
    u0_m0_wo0_oseq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_oseq_c : SIGNED(4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_c := "00011";
            u0_m0_wo0_oseq_q <= "0";
            u0_m0_wo0_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_18_q = "1") THEN
                IF (u0_m0_wo0_oseq_c = "00000") THEN
                    u0_m0_wo0_oseq_eq <= '1';
                ELSE
                    u0_m0_wo0_oseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_oseq_eq = '1') THEN
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c + 3;
                ELSE
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c - 1;
                END IF;
                u0_m0_wo0_oseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_c(4 downto 4));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_oseq_gated(LOGICAL,49)@19
    u0_m0_wo0_oseq_gated_q <= u0_m0_wo0_oseq_q and d_u0_m0_wo0_compute_q_19_q;

    -- u0_m0_wo0_oseq_gated_reg(REG,50)@19 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_q);
        END IF;
    END PROCESS;

    -- out0_wo0_data_selector(SELECTOR,284)@20 + 1
    out0_wo0_data_selector_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            out0_wo0_data_selector_q <= (others => '0');
            out0_wo0_data_selector_v <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            out0_wo0_data_selector_q <= STD_LOGIC_VECTOR(u0_m2_wo0_accum_q);
            out0_wo0_data_selector_v <= "0";
            IF (u0_m2_wo0_oseq_gated_reg_q = "1") THEN
                out0_wo0_data_selector_q <= STD_LOGIC_VECTOR(u0_m2_wo0_accum_q);
                out0_wo0_data_selector_v <= "1";
            END IF;
            IF (u0_m1_wo0_oseq_gated_reg_q = "1") THEN
                out0_wo0_data_selector_q <= STD_LOGIC_VECTOR(u0_m1_wo0_accum_q);
                out0_wo0_data_selector_v <= "1";
            END IF;
            IF (u0_m0_wo0_oseq_gated_reg_q = "1") THEN
                out0_wo0_data_selector_q <= STD_LOGIC_VECTOR(u0_m0_wo0_accum_q);
                out0_wo0_data_selector_v <= "1";
            END IF;
        END IF;
    END PROCESS;

    -- xOut(PORTOUT,298)@21 + 1
    xOut_v <= out0_wo0_data_selector_v;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= out0_wo0_data_selector_q;
    xOut_1 <= out0_wo1_data_selector_q;

END normal;
