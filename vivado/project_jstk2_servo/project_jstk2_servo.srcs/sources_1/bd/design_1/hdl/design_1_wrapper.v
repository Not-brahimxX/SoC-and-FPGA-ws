//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Sun Sep 22 11:07:37 2024
//Host        : DESKTOP-SJ41DTT running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    GPIO_0_tri_o,
    pmoda_pin10_io,
    pmoda_pin1_io,
    pmoda_pin2_io,
    pmoda_pin3_io,
    pmoda_pin4_io,
    pmoda_pin7_io,
    pmoda_pin8_io,
    pmoda_pin9_io);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output [0:0]GPIO_0_tri_o;
  inout pmoda_pin10_io;
  inout pmoda_pin1_io;
  inout pmoda_pin2_io;
  inout pmoda_pin3_io;
  inout pmoda_pin4_io;
  inout pmoda_pin7_io;
  inout pmoda_pin8_io;
  inout pmoda_pin9_io;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire [0:0]GPIO_0_tri_o;
  wire pmoda_pin10_i;
  wire pmoda_pin10_io;
  wire pmoda_pin10_o;
  wire pmoda_pin10_t;
  wire pmoda_pin1_i;
  wire pmoda_pin1_io;
  wire pmoda_pin1_o;
  wire pmoda_pin1_t;
  wire pmoda_pin2_i;
  wire pmoda_pin2_io;
  wire pmoda_pin2_o;
  wire pmoda_pin2_t;
  wire pmoda_pin3_i;
  wire pmoda_pin3_io;
  wire pmoda_pin3_o;
  wire pmoda_pin3_t;
  wire pmoda_pin4_i;
  wire pmoda_pin4_io;
  wire pmoda_pin4_o;
  wire pmoda_pin4_t;
  wire pmoda_pin7_i;
  wire pmoda_pin7_io;
  wire pmoda_pin7_o;
  wire pmoda_pin7_t;
  wire pmoda_pin8_i;
  wire pmoda_pin8_io;
  wire pmoda_pin8_o;
  wire pmoda_pin8_t;
  wire pmoda_pin9_i;
  wire pmoda_pin9_io;
  wire pmoda_pin9_o;
  wire pmoda_pin9_t;

  design_1 design_1_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .GPIO_0_tri_o(GPIO_0_tri_o),
        .pmoda_pin10_i(pmoda_pin10_i),
        .pmoda_pin10_o(pmoda_pin10_o),
        .pmoda_pin10_t(pmoda_pin10_t),
        .pmoda_pin1_i(pmoda_pin1_i),
        .pmoda_pin1_o(pmoda_pin1_o),
        .pmoda_pin1_t(pmoda_pin1_t),
        .pmoda_pin2_i(pmoda_pin2_i),
        .pmoda_pin2_o(pmoda_pin2_o),
        .pmoda_pin2_t(pmoda_pin2_t),
        .pmoda_pin3_i(pmoda_pin3_i),
        .pmoda_pin3_o(pmoda_pin3_o),
        .pmoda_pin3_t(pmoda_pin3_t),
        .pmoda_pin4_i(pmoda_pin4_i),
        .pmoda_pin4_o(pmoda_pin4_o),
        .pmoda_pin4_t(pmoda_pin4_t),
        .pmoda_pin7_i(pmoda_pin7_i),
        .pmoda_pin7_o(pmoda_pin7_o),
        .pmoda_pin7_t(pmoda_pin7_t),
        .pmoda_pin8_i(pmoda_pin8_i),
        .pmoda_pin8_o(pmoda_pin8_o),
        .pmoda_pin8_t(pmoda_pin8_t),
        .pmoda_pin9_i(pmoda_pin9_i),
        .pmoda_pin9_o(pmoda_pin9_o),
        .pmoda_pin9_t(pmoda_pin9_t));
  IOBUF pmoda_pin10_iobuf
       (.I(pmoda_pin10_o),
        .IO(pmoda_pin10_io),
        .O(pmoda_pin10_i),
        .T(pmoda_pin10_t));
  IOBUF pmoda_pin1_iobuf
       (.I(pmoda_pin1_o),
        .IO(pmoda_pin1_io),
        .O(pmoda_pin1_i),
        .T(pmoda_pin1_t));
  IOBUF pmoda_pin2_iobuf
       (.I(pmoda_pin2_o),
        .IO(pmoda_pin2_io),
        .O(pmoda_pin2_i),
        .T(pmoda_pin2_t));
  IOBUF pmoda_pin3_iobuf
       (.I(pmoda_pin3_o),
        .IO(pmoda_pin3_io),
        .O(pmoda_pin3_i),
        .T(pmoda_pin3_t));
  IOBUF pmoda_pin4_iobuf
       (.I(pmoda_pin4_o),
        .IO(pmoda_pin4_io),
        .O(pmoda_pin4_i),
        .T(pmoda_pin4_t));
  IOBUF pmoda_pin7_iobuf
       (.I(pmoda_pin7_o),
        .IO(pmoda_pin7_io),
        .O(pmoda_pin7_i),
        .T(pmoda_pin7_t));
  IOBUF pmoda_pin8_iobuf
       (.I(pmoda_pin8_o),
        .IO(pmoda_pin8_io),
        .O(pmoda_pin8_i),
        .T(pmoda_pin8_t));
  IOBUF pmoda_pin9_iobuf
       (.I(pmoda_pin9_o),
        .IO(pmoda_pin9_io),
        .O(pmoda_pin9_i),
        .T(pmoda_pin9_t));
endmodule
