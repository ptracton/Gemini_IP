// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sat Dec 27 12:57:45 2025
// Host        : salvage running 64-bit unknown
// Command     : write_verilog -mode timesim -sdf_anno true -force results/bus_matrix_wb_verilog/bus_matrix_wb_netlist.v
// Design      : bus_matrix_wb
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module bus_matrix_arbiter
   (wb_dat_o_OBUF,
    wb_err_o_OBUF,
    wb_ack_o_OBUF,
    slv_dat_o_OBUF,
    slv_adr_o_OBUF,
    slv_sel_o_OBUF,
    slv_we_o_OBUF,
    slv_stb_o_OBUF,
    slv_cyc_o_OBUF,
    rst_n_IBUF,
    CLK,
    wb_cyc_i_IBUF,
    slv_ack_i_IBUF,
    wb_stb_i_IBUF,
    slv_dat_i_IBUF,
    slv_err_i_IBUF,
    wb_adr_i_IBUF,
    wb_dat_i_IBUF,
    wb_sel_i_IBUF,
    wb_we_i_IBUF);
  output [63:0]wb_dat_o_OBUF;
  output [1:0]wb_err_o_OBUF;
  output [1:0]wb_ack_o_OBUF;
  output [31:0]slv_dat_o_OBUF;
  output [31:0]slv_adr_o_OBUF;
  output [3:0]slv_sel_o_OBUF;
  output [0:0]slv_we_o_OBUF;
  output [0:0]slv_stb_o_OBUF;
  output [0:0]slv_cyc_o_OBUF;
  input rst_n_IBUF;
  input CLK;
  input [1:0]wb_cyc_i_IBUF;
  input [0:0]slv_ack_i_IBUF;
  input [1:0]wb_stb_i_IBUF;
  input [31:0]slv_dat_i_IBUF;
  input [0:0]slv_err_i_IBUF;
  input [63:0]wb_adr_i_IBUF;
  input [63:0]wb_dat_i_IBUF;
  input [7:0]wb_sel_i_IBUF;
  input [1:0]wb_we_i_IBUF;

  wire CLK;
  wire \gnt_o[1]_i_1_n_0 ;
  wire \gnt_o[1]_i_3_n_0 ;
  wire \gnt_o[1]_i_4_n_0 ;
  wire \gnt_o[1]_i_5_n_0 ;
  wire [1:0]next_gnt;
  wire rst_n_IBUF;
  wire [1:0]\slave_gnt_vector[0] ;
  wire [0:0]slv_ack_i_IBUF;
  wire [31:0]slv_adr_o_OBUF;
  wire [0:0]slv_cyc_o_OBUF;
  wire [31:0]slv_dat_i_IBUF;
  wire [31:0]slv_dat_o_OBUF;
  wire [0:0]slv_err_i_IBUF;
  wire [3:0]slv_sel_o_OBUF;
  wire [0:0]slv_stb_o_OBUF;
  wire [0:0]slv_we_o_OBUF;
  wire [1:0]wb_ack_o_OBUF;
  wire \wb_ack_o_OBUF[0]_inst_i_2_n_0 ;
  wire \wb_ack_o_OBUF[0]_inst_i_3_n_0 ;
  wire \wb_ack_o_OBUF[0]_inst_i_4_n_0 ;
  wire \wb_ack_o_OBUF[0]_inst_i_5_n_0 ;
  wire \wb_ack_o_OBUF[0]_inst_i_6_n_0 ;
  wire \wb_ack_o_OBUF[0]_inst_i_7_n_0 ;
  wire \wb_ack_o_OBUF[0]_inst_i_8_n_0 ;
  wire \wb_ack_o_OBUF[0]_inst_i_9_n_0 ;
  wire \wb_ack_o_OBUF[1]_inst_i_2_n_0 ;
  wire \wb_ack_o_OBUF[1]_inst_i_3_n_0 ;
  wire \wb_ack_o_OBUF[1]_inst_i_4_n_0 ;
  wire \wb_ack_o_OBUF[1]_inst_i_5_n_0 ;
  wire \wb_ack_o_OBUF[1]_inst_i_6_n_0 ;
  wire \wb_ack_o_OBUF[1]_inst_i_7_n_0 ;
  wire \wb_ack_o_OBUF[1]_inst_i_8_n_0 ;
  wire \wb_ack_o_OBUF[1]_inst_i_9_n_0 ;
  wire [63:0]wb_adr_i_IBUF;
  wire [1:0]wb_cyc_i_IBUF;
  wire [63:0]wb_dat_i_IBUF;
  wire [63:0]wb_dat_o_OBUF;
  wire [1:0]wb_err_o_OBUF;
  wire [7:0]wb_sel_i_IBUF;
  wire [1:0]wb_stb_i_IBUF;
  wire [1:0]wb_we_i_IBUF;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \gnt_o[0]_i_1 
       (.I0(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I1(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I2(wb_stb_i_IBUF[0]),
        .I3(wb_cyc_i_IBUF[0]),
        .O(next_gnt[0]));
  LUT5 #(
    .INIT(32'hF3F5F3FF)) 
    \gnt_o[1]_i_1 
       (.I0(\slave_gnt_vector[0] [0]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(slv_ack_i_IBUF),
        .I3(\slave_gnt_vector[0] [1]),
        .I4(wb_cyc_i_IBUF[0]),
        .O(\gnt_o[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000EF0000000000)) 
    \gnt_o[1]_i_2 
       (.I0(\gnt_o[1]_i_4_n_0 ),
        .I1(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I2(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I3(\gnt_o[1]_i_5_n_0 ),
        .I4(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I5(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .O(next_gnt[1]));
  LUT1 #(
    .INIT(2'h1)) 
    \gnt_o[1]_i_3 
       (.I0(rst_n_IBUF),
        .O(\gnt_o[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \gnt_o[1]_i_4 
       (.I0(wb_stb_i_IBUF[0]),
        .I1(wb_cyc_i_IBUF[0]),
        .O(\gnt_o[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \gnt_o[1]_i_5 
       (.I0(wb_cyc_i_IBUF[1]),
        .I1(wb_stb_i_IBUF[1]),
        .O(\gnt_o[1]_i_5_n_0 ));
  FDCE \gnt_o_reg[0] 
       (.C(CLK),
        .CE(\gnt_o[1]_i_1_n_0 ),
        .CLR(\gnt_o[1]_i_3_n_0 ),
        .D(next_gnt[0]),
        .Q(\slave_gnt_vector[0] [0]));
  FDCE \gnt_o_reg[1] 
       (.C(CLK),
        .CE(\gnt_o[1]_i_1_n_0 ),
        .CLR(\gnt_o[1]_i_3_n_0 ),
        .D(next_gnt[1]),
        .Q(\slave_gnt_vector[0] [1]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[0]_inst_i_1 
       (.I0(wb_adr_i_IBUF[32]),
        .I1(wb_adr_i_IBUF[0]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[0]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[10]_inst_i_1 
       (.I0(wb_adr_i_IBUF[42]),
        .I1(wb_adr_i_IBUF[10]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[10]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[11]_inst_i_1 
       (.I0(wb_adr_i_IBUF[43]),
        .I1(wb_adr_i_IBUF[11]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[11]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[12]_inst_i_1 
       (.I0(wb_adr_i_IBUF[44]),
        .I1(wb_adr_i_IBUF[12]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[12]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[13]_inst_i_1 
       (.I0(wb_adr_i_IBUF[45]),
        .I1(wb_adr_i_IBUF[13]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[13]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[14]_inst_i_1 
       (.I0(wb_adr_i_IBUF[46]),
        .I1(wb_adr_i_IBUF[14]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[14]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[15]_inst_i_1 
       (.I0(wb_adr_i_IBUF[47]),
        .I1(wb_adr_i_IBUF[15]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[15]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[16]_inst_i_1 
       (.I0(wb_adr_i_IBUF[48]),
        .I1(wb_adr_i_IBUF[16]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[16]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[17]_inst_i_1 
       (.I0(wb_adr_i_IBUF[49]),
        .I1(wb_adr_i_IBUF[17]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[17]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[18]_inst_i_1 
       (.I0(wb_adr_i_IBUF[50]),
        .I1(wb_adr_i_IBUF[18]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[18]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[19]_inst_i_1 
       (.I0(wb_adr_i_IBUF[51]),
        .I1(wb_adr_i_IBUF[19]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[19]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[1]_inst_i_1 
       (.I0(wb_adr_i_IBUF[33]),
        .I1(wb_adr_i_IBUF[1]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[1]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[20]_inst_i_1 
       (.I0(wb_adr_i_IBUF[52]),
        .I1(wb_adr_i_IBUF[20]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[20]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[21]_inst_i_1 
       (.I0(wb_adr_i_IBUF[53]),
        .I1(wb_adr_i_IBUF[21]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[21]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[22]_inst_i_1 
       (.I0(wb_adr_i_IBUF[54]),
        .I1(wb_adr_i_IBUF[22]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[22]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[23]_inst_i_1 
       (.I0(wb_adr_i_IBUF[55]),
        .I1(wb_adr_i_IBUF[23]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[23]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[24]_inst_i_1 
       (.I0(wb_adr_i_IBUF[56]),
        .I1(wb_adr_i_IBUF[24]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[24]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[25]_inst_i_1 
       (.I0(wb_adr_i_IBUF[57]),
        .I1(wb_adr_i_IBUF[25]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[25]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[26]_inst_i_1 
       (.I0(wb_adr_i_IBUF[58]),
        .I1(wb_adr_i_IBUF[26]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[26]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[27]_inst_i_1 
       (.I0(wb_adr_i_IBUF[59]),
        .I1(wb_adr_i_IBUF[27]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[27]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[28]_inst_i_1 
       (.I0(wb_adr_i_IBUF[60]),
        .I1(wb_adr_i_IBUF[28]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[28]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[29]_inst_i_1 
       (.I0(wb_adr_i_IBUF[61]),
        .I1(wb_adr_i_IBUF[29]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[29]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[2]_inst_i_1 
       (.I0(wb_adr_i_IBUF[34]),
        .I1(wb_adr_i_IBUF[2]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[2]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[30]_inst_i_1 
       (.I0(wb_adr_i_IBUF[62]),
        .I1(wb_adr_i_IBUF[30]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[30]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[31]_inst_i_1 
       (.I0(wb_adr_i_IBUF[63]),
        .I1(wb_adr_i_IBUF[31]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[31]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[3]_inst_i_1 
       (.I0(wb_adr_i_IBUF[35]),
        .I1(wb_adr_i_IBUF[3]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[3]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[4]_inst_i_1 
       (.I0(wb_adr_i_IBUF[36]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[4]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[5]_inst_i_1 
       (.I0(wb_adr_i_IBUF[37]),
        .I1(wb_adr_i_IBUF[5]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[5]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[6]_inst_i_1 
       (.I0(wb_adr_i_IBUF[38]),
        .I1(wb_adr_i_IBUF[6]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[6]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[7]_inst_i_1 
       (.I0(wb_adr_i_IBUF[39]),
        .I1(wb_adr_i_IBUF[7]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[7]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[8]_inst_i_1 
       (.I0(wb_adr_i_IBUF[40]),
        .I1(wb_adr_i_IBUF[8]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[8]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_adr_o_OBUF[9]_inst_i_1 
       (.I0(wb_adr_i_IBUF[41]),
        .I1(wb_adr_i_IBUF[9]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_adr_o_OBUF[9]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_cyc_o_OBUF[0]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[0]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_cyc_o_OBUF));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[0]_inst_i_1 
       (.I0(wb_dat_i_IBUF[32]),
        .I1(wb_dat_i_IBUF[0]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[0]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[10]_inst_i_1 
       (.I0(wb_dat_i_IBUF[42]),
        .I1(wb_dat_i_IBUF[10]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[10]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[11]_inst_i_1 
       (.I0(wb_dat_i_IBUF[43]),
        .I1(wb_dat_i_IBUF[11]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[11]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[12]_inst_i_1 
       (.I0(wb_dat_i_IBUF[44]),
        .I1(wb_dat_i_IBUF[12]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[12]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[13]_inst_i_1 
       (.I0(wb_dat_i_IBUF[45]),
        .I1(wb_dat_i_IBUF[13]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[13]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[14]_inst_i_1 
       (.I0(wb_dat_i_IBUF[46]),
        .I1(wb_dat_i_IBUF[14]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[14]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[15]_inst_i_1 
       (.I0(wb_dat_i_IBUF[47]),
        .I1(wb_dat_i_IBUF[15]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[15]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[16]_inst_i_1 
       (.I0(wb_dat_i_IBUF[48]),
        .I1(wb_dat_i_IBUF[16]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[16]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[17]_inst_i_1 
       (.I0(wb_dat_i_IBUF[49]),
        .I1(wb_dat_i_IBUF[17]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[17]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[18]_inst_i_1 
       (.I0(wb_dat_i_IBUF[50]),
        .I1(wb_dat_i_IBUF[18]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[18]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[19]_inst_i_1 
       (.I0(wb_dat_i_IBUF[51]),
        .I1(wb_dat_i_IBUF[19]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[19]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[1]_inst_i_1 
       (.I0(wb_dat_i_IBUF[33]),
        .I1(wb_dat_i_IBUF[1]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[1]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[20]_inst_i_1 
       (.I0(wb_dat_i_IBUF[52]),
        .I1(wb_dat_i_IBUF[20]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[20]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[21]_inst_i_1 
       (.I0(wb_dat_i_IBUF[53]),
        .I1(wb_dat_i_IBUF[21]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[21]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[22]_inst_i_1 
       (.I0(wb_dat_i_IBUF[54]),
        .I1(wb_dat_i_IBUF[22]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[22]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[23]_inst_i_1 
       (.I0(wb_dat_i_IBUF[55]),
        .I1(wb_dat_i_IBUF[23]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[23]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[24]_inst_i_1 
       (.I0(wb_dat_i_IBUF[56]),
        .I1(wb_dat_i_IBUF[24]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[24]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[25]_inst_i_1 
       (.I0(wb_dat_i_IBUF[57]),
        .I1(wb_dat_i_IBUF[25]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[25]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[26]_inst_i_1 
       (.I0(wb_dat_i_IBUF[58]),
        .I1(wb_dat_i_IBUF[26]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[26]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[27]_inst_i_1 
       (.I0(wb_dat_i_IBUF[59]),
        .I1(wb_dat_i_IBUF[27]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[27]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[28]_inst_i_1 
       (.I0(wb_dat_i_IBUF[60]),
        .I1(wb_dat_i_IBUF[28]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[28]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[29]_inst_i_1 
       (.I0(wb_dat_i_IBUF[61]),
        .I1(wb_dat_i_IBUF[29]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[29]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[2]_inst_i_1 
       (.I0(wb_dat_i_IBUF[34]),
        .I1(wb_dat_i_IBUF[2]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[2]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[30]_inst_i_1 
       (.I0(wb_dat_i_IBUF[62]),
        .I1(wb_dat_i_IBUF[30]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[30]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[31]_inst_i_1 
       (.I0(wb_dat_i_IBUF[63]),
        .I1(wb_dat_i_IBUF[31]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[31]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[3]_inst_i_1 
       (.I0(wb_dat_i_IBUF[35]),
        .I1(wb_dat_i_IBUF[3]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[3]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[4]_inst_i_1 
       (.I0(wb_dat_i_IBUF[36]),
        .I1(wb_dat_i_IBUF[4]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[4]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[5]_inst_i_1 
       (.I0(wb_dat_i_IBUF[37]),
        .I1(wb_dat_i_IBUF[5]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[5]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[6]_inst_i_1 
       (.I0(wb_dat_i_IBUF[38]),
        .I1(wb_dat_i_IBUF[6]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[6]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[7]_inst_i_1 
       (.I0(wb_dat_i_IBUF[39]),
        .I1(wb_dat_i_IBUF[7]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[7]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[8]_inst_i_1 
       (.I0(wb_dat_i_IBUF[40]),
        .I1(wb_dat_i_IBUF[8]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[8]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_dat_o_OBUF[9]_inst_i_1 
       (.I0(wb_dat_i_IBUF[41]),
        .I1(wb_dat_i_IBUF[9]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_dat_o_OBUF[9]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_sel_o_OBUF[0]_inst_i_1 
       (.I0(wb_sel_i_IBUF[4]),
        .I1(wb_sel_i_IBUF[0]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_sel_o_OBUF[0]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_sel_o_OBUF[1]_inst_i_1 
       (.I0(wb_sel_i_IBUF[5]),
        .I1(wb_sel_i_IBUF[1]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_sel_o_OBUF[1]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_sel_o_OBUF[2]_inst_i_1 
       (.I0(wb_sel_i_IBUF[6]),
        .I1(wb_sel_i_IBUF[2]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_sel_o_OBUF[2]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_sel_o_OBUF[3]_inst_i_1 
       (.I0(wb_sel_i_IBUF[7]),
        .I1(wb_sel_i_IBUF[3]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_sel_o_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_stb_o_OBUF[0]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_stb_o_OBUF));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \slv_we_o_OBUF[0]_inst_i_1 
       (.I0(wb_we_i_IBUF[1]),
        .I1(wb_we_i_IBUF[0]),
        .I2(\slave_gnt_vector[0] [0]),
        .I3(\slave_gnt_vector[0] [1]),
        .O(slv_we_o_OBUF));
  LUT6 #(
    .INIT(64'hFF8F888888888888)) 
    \wb_ack_o_OBUF[0]_inst_i_1 
       (.I0(slv_ack_i_IBUF),
        .I1(\slave_gnt_vector[0] [0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I4(wb_stb_i_IBUF[0]),
        .I5(wb_cyc_i_IBUF[0]),
        .O(wb_ack_o_OBUF[0]));
  LUT6 #(
    .INIT(64'h0100000000000000)) 
    \wb_ack_o_OBUF[0]_inst_i_2 
       (.I0(wb_adr_i_IBUF[17]),
        .I1(wb_adr_i_IBUF[16]),
        .I2(wb_adr_i_IBUF[0]),
        .I3(\wb_ack_o_OBUF[0]_inst_i_4_n_0 ),
        .I4(\wb_ack_o_OBUF[0]_inst_i_5_n_0 ),
        .I5(\wb_ack_o_OBUF[0]_inst_i_6_n_0 ),
        .O(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \wb_ack_o_OBUF[0]_inst_i_3 
       (.I0(\wb_ack_o_OBUF[0]_inst_i_7_n_0 ),
        .I1(\wb_ack_o_OBUF[0]_inst_i_8_n_0 ),
        .I2(wb_adr_i_IBUF[3]),
        .I3(wb_adr_i_IBUF[2]),
        .I4(wb_adr_i_IBUF[14]),
        .I5(\wb_ack_o_OBUF[0]_inst_i_9_n_0 ),
        .O(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \wb_ack_o_OBUF[0]_inst_i_4 
       (.I0(wb_adr_i_IBUF[21]),
        .I1(wb_adr_i_IBUF[20]),
        .I2(wb_adr_i_IBUF[19]),
        .I3(wb_adr_i_IBUF[18]),
        .O(\wb_ack_o_OBUF[0]_inst_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \wb_ack_o_OBUF[0]_inst_i_5 
       (.I0(wb_adr_i_IBUF[25]),
        .I1(wb_adr_i_IBUF[24]),
        .I2(wb_adr_i_IBUF[23]),
        .I3(wb_adr_i_IBUF[22]),
        .O(\wb_ack_o_OBUF[0]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \wb_ack_o_OBUF[0]_inst_i_6 
       (.I0(wb_adr_i_IBUF[26]),
        .I1(wb_adr_i_IBUF[27]),
        .I2(wb_adr_i_IBUF[28]),
        .I3(wb_adr_i_IBUF[29]),
        .I4(wb_adr_i_IBUF[31]),
        .I5(wb_adr_i_IBUF[30]),
        .O(\wb_ack_o_OBUF[0]_inst_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \wb_ack_o_OBUF[0]_inst_i_7 
       (.I0(wb_adr_i_IBUF[8]),
        .I1(wb_adr_i_IBUF[11]),
        .I2(wb_adr_i_IBUF[6]),
        .I3(wb_adr_i_IBUF[9]),
        .O(\wb_ack_o_OBUF[0]_inst_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \wb_ack_o_OBUF[0]_inst_i_8 
       (.I0(wb_adr_i_IBUF[12]),
        .I1(wb_adr_i_IBUF[15]),
        .I2(wb_adr_i_IBUF[10]),
        .I3(wb_adr_i_IBUF[13]),
        .O(\wb_ack_o_OBUF[0]_inst_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \wb_ack_o_OBUF[0]_inst_i_9 
       (.I0(wb_adr_i_IBUF[4]),
        .I1(wb_adr_i_IBUF[7]),
        .I2(wb_adr_i_IBUF[1]),
        .I3(wb_adr_i_IBUF[5]),
        .O(\wb_ack_o_OBUF[0]_inst_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFF8F888888888888)) 
    \wb_ack_o_OBUF[1]_inst_i_1 
       (.I0(slv_ack_i_IBUF),
        .I1(\slave_gnt_vector[0] [1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I4(wb_cyc_i_IBUF[1]),
        .I5(wb_stb_i_IBUF[1]),
        .O(wb_ack_o_OBUF[1]));
  LUT6 #(
    .INIT(64'h0100000000000000)) 
    \wb_ack_o_OBUF[1]_inst_i_2 
       (.I0(wb_adr_i_IBUF[49]),
        .I1(wb_adr_i_IBUF[48]),
        .I2(wb_adr_i_IBUF[32]),
        .I3(\wb_ack_o_OBUF[1]_inst_i_4_n_0 ),
        .I4(\wb_ack_o_OBUF[1]_inst_i_5_n_0 ),
        .I5(\wb_ack_o_OBUF[1]_inst_i_6_n_0 ),
        .O(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \wb_ack_o_OBUF[1]_inst_i_3 
       (.I0(\wb_ack_o_OBUF[1]_inst_i_7_n_0 ),
        .I1(\wb_ack_o_OBUF[1]_inst_i_8_n_0 ),
        .I2(wb_adr_i_IBUF[35]),
        .I3(wb_adr_i_IBUF[34]),
        .I4(wb_adr_i_IBUF[46]),
        .I5(\wb_ack_o_OBUF[1]_inst_i_9_n_0 ),
        .O(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \wb_ack_o_OBUF[1]_inst_i_4 
       (.I0(wb_adr_i_IBUF[53]),
        .I1(wb_adr_i_IBUF[52]),
        .I2(wb_adr_i_IBUF[51]),
        .I3(wb_adr_i_IBUF[50]),
        .O(\wb_ack_o_OBUF[1]_inst_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \wb_ack_o_OBUF[1]_inst_i_5 
       (.I0(wb_adr_i_IBUF[57]),
        .I1(wb_adr_i_IBUF[56]),
        .I2(wb_adr_i_IBUF[55]),
        .I3(wb_adr_i_IBUF[54]),
        .O(\wb_ack_o_OBUF[1]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \wb_ack_o_OBUF[1]_inst_i_6 
       (.I0(wb_adr_i_IBUF[58]),
        .I1(wb_adr_i_IBUF[59]),
        .I2(wb_adr_i_IBUF[60]),
        .I3(wb_adr_i_IBUF[61]),
        .I4(wb_adr_i_IBUF[63]),
        .I5(wb_adr_i_IBUF[62]),
        .O(\wb_ack_o_OBUF[1]_inst_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \wb_ack_o_OBUF[1]_inst_i_7 
       (.I0(wb_adr_i_IBUF[40]),
        .I1(wb_adr_i_IBUF[43]),
        .I2(wb_adr_i_IBUF[38]),
        .I3(wb_adr_i_IBUF[41]),
        .O(\wb_ack_o_OBUF[1]_inst_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \wb_ack_o_OBUF[1]_inst_i_8 
       (.I0(wb_adr_i_IBUF[44]),
        .I1(wb_adr_i_IBUF[47]),
        .I2(wb_adr_i_IBUF[42]),
        .I3(wb_adr_i_IBUF[45]),
        .O(\wb_ack_o_OBUF[1]_inst_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \wb_ack_o_OBUF[1]_inst_i_9 
       (.I0(wb_adr_i_IBUF[36]),
        .I1(wb_adr_i_IBUF[39]),
        .I2(wb_adr_i_IBUF[33]),
        .I3(wb_adr_i_IBUF[37]),
        .O(\wb_ack_o_OBUF[1]_inst_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[0]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[0]),
        .O(wb_dat_o_OBUF[0]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[10]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[10]),
        .O(wb_dat_o_OBUF[10]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[11]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[11]),
        .O(wb_dat_o_OBUF[11]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[12]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[12]),
        .O(wb_dat_o_OBUF[12]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[13]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[13]),
        .O(wb_dat_o_OBUF[13]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[14]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[14]),
        .O(wb_dat_o_OBUF[14]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[15]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[15]),
        .O(wb_dat_o_OBUF[15]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[16]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[16]),
        .O(wb_dat_o_OBUF[16]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[17]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[17]),
        .O(wb_dat_o_OBUF[17]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[18]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[18]),
        .O(wb_dat_o_OBUF[18]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[19]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[19]),
        .O(wb_dat_o_OBUF[19]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[1]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[1]),
        .O(wb_dat_o_OBUF[1]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[20]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[20]),
        .O(wb_dat_o_OBUF[20]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[21]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[21]),
        .O(wb_dat_o_OBUF[21]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[22]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[22]),
        .O(wb_dat_o_OBUF[22]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[23]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[23]),
        .O(wb_dat_o_OBUF[23]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[24]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[24]),
        .O(wb_dat_o_OBUF[24]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[25]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[25]),
        .O(wb_dat_o_OBUF[25]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[26]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[26]),
        .O(wb_dat_o_OBUF[26]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[27]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[27]),
        .O(wb_dat_o_OBUF[27]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[28]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[28]),
        .O(wb_dat_o_OBUF[28]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[29]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[29]),
        .O(wb_dat_o_OBUF[29]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[2]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[2]),
        .O(wb_dat_o_OBUF[2]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[30]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[30]),
        .O(wb_dat_o_OBUF[30]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[31]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[31]),
        .O(wb_dat_o_OBUF[31]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[32]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[0]),
        .O(wb_dat_o_OBUF[32]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[33]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[1]),
        .O(wb_dat_o_OBUF[33]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[34]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[2]),
        .O(wb_dat_o_OBUF[34]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[35]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[3]),
        .O(wb_dat_o_OBUF[35]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[36]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[4]),
        .O(wb_dat_o_OBUF[36]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[37]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[5]),
        .O(wb_dat_o_OBUF[37]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[38]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[6]),
        .O(wb_dat_o_OBUF[38]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[39]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[7]),
        .O(wb_dat_o_OBUF[39]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[3]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[3]),
        .O(wb_dat_o_OBUF[3]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[40]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[8]),
        .O(wb_dat_o_OBUF[40]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[41]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[9]),
        .O(wb_dat_o_OBUF[41]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[42]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[10]),
        .O(wb_dat_o_OBUF[42]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[43]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[11]),
        .O(wb_dat_o_OBUF[43]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[44]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[12]),
        .O(wb_dat_o_OBUF[44]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[45]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[13]),
        .O(wb_dat_o_OBUF[45]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[46]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[14]),
        .O(wb_dat_o_OBUF[46]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[47]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[15]),
        .O(wb_dat_o_OBUF[47]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[48]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[16]),
        .O(wb_dat_o_OBUF[48]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[49]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[17]),
        .O(wb_dat_o_OBUF[49]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[4]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[4]),
        .O(wb_dat_o_OBUF[4]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[50]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[18]),
        .O(wb_dat_o_OBUF[50]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[51]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[19]),
        .O(wb_dat_o_OBUF[51]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[52]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[20]),
        .O(wb_dat_o_OBUF[52]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[53]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[21]),
        .O(wb_dat_o_OBUF[53]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[54]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[22]),
        .O(wb_dat_o_OBUF[54]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[55]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[23]),
        .O(wb_dat_o_OBUF[55]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[56]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[24]),
        .O(wb_dat_o_OBUF[56]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[57]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[25]),
        .O(wb_dat_o_OBUF[57]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[58]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[26]),
        .O(wb_dat_o_OBUF[58]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[59]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[27]),
        .O(wb_dat_o_OBUF[59]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[5]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[5]),
        .O(wb_dat_o_OBUF[5]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[60]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[28]),
        .O(wb_dat_o_OBUF[60]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[61]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[29]),
        .O(wb_dat_o_OBUF[61]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[62]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[30]),
        .O(wb_dat_o_OBUF[62]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[63]_inst_i_1 
       (.I0(wb_stb_i_IBUF[1]),
        .I1(wb_cyc_i_IBUF[1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [1]),
        .I5(slv_dat_i_IBUF[31]),
        .O(wb_dat_o_OBUF[63]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[6]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[6]),
        .O(wb_dat_o_OBUF[6]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[7]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[7]),
        .O(wb_dat_o_OBUF[7]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[8]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[8]),
        .O(wb_dat_o_OBUF[8]));
  LUT6 #(
    .INIT(64'h7F77000000000000)) 
    \wb_dat_o_OBUF[9]_inst_i_1 
       (.I0(wb_cyc_i_IBUF[0]),
        .I1(wb_stb_i_IBUF[0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I4(\slave_gnt_vector[0] [0]),
        .I5(slv_dat_i_IBUF[9]),
        .O(wb_dat_o_OBUF[9]));
  LUT6 #(
    .INIT(64'hFF8F888888888888)) 
    \wb_err_o_OBUF[0]_inst_i_1 
       (.I0(slv_err_i_IBUF),
        .I1(\slave_gnt_vector[0] [0]),
        .I2(\wb_ack_o_OBUF[0]_inst_i_2_n_0 ),
        .I3(\wb_ack_o_OBUF[0]_inst_i_3_n_0 ),
        .I4(wb_stb_i_IBUF[0]),
        .I5(wb_cyc_i_IBUF[0]),
        .O(wb_err_o_OBUF[0]));
  LUT6 #(
    .INIT(64'hFF8F888888888888)) 
    \wb_err_o_OBUF[1]_inst_i_1 
       (.I0(slv_err_i_IBUF),
        .I1(\slave_gnt_vector[0] [1]),
        .I2(\wb_ack_o_OBUF[1]_inst_i_2_n_0 ),
        .I3(\wb_ack_o_OBUF[1]_inst_i_3_n_0 ),
        .I4(wb_cyc_i_IBUF[1]),
        .I5(wb_stb_i_IBUF[1]),
        .O(wb_err_o_OBUF[1]));
endmodule

(* ADDR_WIDTH = "32" *) (* DATA_WIDTH = "32" *) (* DEFAULT_SLAVE_INDEX = "0" *) 
(* INPUT_PIPE_STAGES = "1'b0" *) (* MASTER_SECURE_MASK = "2'b00" *) (* M_SLAVES = "2" *) 
(* N_MASTERS = "2" *) (* OUTPUT_PIPE_STAGES = "1'b0" *) (* REGION_MAP_FLAT = "132'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" *) 
(* USE_DEFAULT_SLAVE = "1'b0" *) 
(* NotValidForBitStream *)
module bus_matrix_wb
   (clk,
    rst_n,
    wb_cyc_i,
    wb_stb_i,
    wb_we_i,
    wb_adr_i,
    wb_dat_i,
    wb_sel_i,
    wb_ack_o,
    wb_dat_o,
    wb_err_o,
    slv_cyc_o,
    slv_stb_o,
    slv_we_o,
    slv_adr_o,
    slv_dat_o,
    slv_sel_o,
    slv_ack_i,
    slv_dat_i,
    slv_err_i);
  input clk;
  input rst_n;
  input [1:0]wb_cyc_i;
  input [1:0]wb_stb_i;
  input [1:0]wb_we_i;
  input [63:0]wb_adr_i;
  input [63:0]wb_dat_i;
  input [7:0]wb_sel_i;
  output [1:0]wb_ack_o;
  output [63:0]wb_dat_o;
  output [1:0]wb_err_o;
  output [1:0]slv_cyc_o;
  output [1:0]slv_stb_o;
  output [1:0]slv_we_o;
  output [63:0]slv_adr_o;
  output [63:0]slv_dat_o;
  output [7:0]slv_sel_o;
  input [1:0]slv_ack_i;
  input [63:0]slv_dat_i;
  input [1:0]slv_err_i;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire rst_n;
  wire rst_n_IBUF;
  wire [1:0]slv_ack_i;
  wire [0:0]slv_ack_i_IBUF;
  wire [63:0]slv_adr_o;
  wire [31:0]slv_adr_o_OBUF;
  wire [1:0]slv_cyc_o;
  wire [0:0]slv_cyc_o_OBUF;
  wire [63:0]slv_dat_i;
  wire [31:0]slv_dat_i_IBUF;
  wire [63:0]slv_dat_o;
  wire [31:0]slv_dat_o_OBUF;
  wire [1:0]slv_err_i;
  wire [0:0]slv_err_i_IBUF;
  wire [7:0]slv_sel_o;
  wire [3:0]slv_sel_o_OBUF;
  wire [1:0]slv_stb_o;
  wire [0:0]slv_stb_o_OBUF;
  wire [1:0]slv_we_o;
  wire [0:0]slv_we_o_OBUF;
  wire [1:0]wb_ack_o;
  wire [1:0]wb_ack_o_OBUF;
  wire [63:0]wb_adr_i;
  wire [63:0]wb_adr_i_IBUF;
  wire [1:0]wb_cyc_i;
  wire [1:0]wb_cyc_i_IBUF;
  wire [63:0]wb_dat_i;
  wire [63:0]wb_dat_i_IBUF;
  wire [63:0]wb_dat_o;
  wire [63:0]wb_dat_o_OBUF;
  wire [1:0]wb_err_o;
  wire [1:0]wb_err_o_OBUF;
  wire [7:0]wb_sel_i;
  wire [7:0]wb_sel_i_IBUF;
  wire [1:0]wb_stb_i;
  wire [1:0]wb_stb_i_IBUF;
  wire [1:0]wb_we_i;
  wire [1:0]wb_we_i_IBUF;

initial begin
 $sdf_annotate("bus_matrix_wb_netlist.sdf",,,,"tool_control");
end
  bus_matrix_arbiter \GEN_ARBITERS[0].u_arb 
       (.CLK(clk_IBUF_BUFG),
        .rst_n_IBUF(rst_n_IBUF),
        .slv_ack_i_IBUF(slv_ack_i_IBUF),
        .slv_adr_o_OBUF(slv_adr_o_OBUF),
        .slv_cyc_o_OBUF(slv_cyc_o_OBUF),
        .slv_dat_i_IBUF(slv_dat_i_IBUF),
        .slv_dat_o_OBUF(slv_dat_o_OBUF),
        .slv_err_i_IBUF(slv_err_i_IBUF),
        .slv_sel_o_OBUF(slv_sel_o_OBUF),
        .slv_stb_o_OBUF(slv_stb_o_OBUF),
        .slv_we_o_OBUF(slv_we_o_OBUF),
        .wb_ack_o_OBUF(wb_ack_o_OBUF),
        .wb_adr_i_IBUF(wb_adr_i_IBUF),
        .wb_cyc_i_IBUF(wb_cyc_i_IBUF),
        .wb_dat_i_IBUF(wb_dat_i_IBUF),
        .wb_dat_o_OBUF(wb_dat_o_OBUF),
        .wb_err_o_OBUF(wb_err_o_OBUF),
        .wb_sel_i_IBUF(wb_sel_i_IBUF),
        .wb_stb_i_IBUF(wb_stb_i_IBUF),
        .wb_we_i_IBUF(wb_we_i_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  IBUF rst_n_IBUF_inst
       (.I(rst_n),
        .O(rst_n_IBUF));
  IBUF \slv_ack_i_IBUF[0]_inst 
       (.I(slv_ack_i[0]),
        .O(slv_ack_i_IBUF));
  OBUF \slv_adr_o_OBUF[0]_inst 
       (.I(slv_adr_o_OBUF[0]),
        .O(slv_adr_o[0]));
  OBUF \slv_adr_o_OBUF[10]_inst 
       (.I(slv_adr_o_OBUF[10]),
        .O(slv_adr_o[10]));
  OBUF \slv_adr_o_OBUF[11]_inst 
       (.I(slv_adr_o_OBUF[11]),
        .O(slv_adr_o[11]));
  OBUF \slv_adr_o_OBUF[12]_inst 
       (.I(slv_adr_o_OBUF[12]),
        .O(slv_adr_o[12]));
  OBUF \slv_adr_o_OBUF[13]_inst 
       (.I(slv_adr_o_OBUF[13]),
        .O(slv_adr_o[13]));
  OBUF \slv_adr_o_OBUF[14]_inst 
       (.I(slv_adr_o_OBUF[14]),
        .O(slv_adr_o[14]));
  OBUF \slv_adr_o_OBUF[15]_inst 
       (.I(slv_adr_o_OBUF[15]),
        .O(slv_adr_o[15]));
  OBUF \slv_adr_o_OBUF[16]_inst 
       (.I(slv_adr_o_OBUF[16]),
        .O(slv_adr_o[16]));
  OBUF \slv_adr_o_OBUF[17]_inst 
       (.I(slv_adr_o_OBUF[17]),
        .O(slv_adr_o[17]));
  OBUF \slv_adr_o_OBUF[18]_inst 
       (.I(slv_adr_o_OBUF[18]),
        .O(slv_adr_o[18]));
  OBUF \slv_adr_o_OBUF[19]_inst 
       (.I(slv_adr_o_OBUF[19]),
        .O(slv_adr_o[19]));
  OBUF \slv_adr_o_OBUF[1]_inst 
       (.I(slv_adr_o_OBUF[1]),
        .O(slv_adr_o[1]));
  OBUF \slv_adr_o_OBUF[20]_inst 
       (.I(slv_adr_o_OBUF[20]),
        .O(slv_adr_o[20]));
  OBUF \slv_adr_o_OBUF[21]_inst 
       (.I(slv_adr_o_OBUF[21]),
        .O(slv_adr_o[21]));
  OBUF \slv_adr_o_OBUF[22]_inst 
       (.I(slv_adr_o_OBUF[22]),
        .O(slv_adr_o[22]));
  OBUF \slv_adr_o_OBUF[23]_inst 
       (.I(slv_adr_o_OBUF[23]),
        .O(slv_adr_o[23]));
  OBUF \slv_adr_o_OBUF[24]_inst 
       (.I(slv_adr_o_OBUF[24]),
        .O(slv_adr_o[24]));
  OBUF \slv_adr_o_OBUF[25]_inst 
       (.I(slv_adr_o_OBUF[25]),
        .O(slv_adr_o[25]));
  OBUF \slv_adr_o_OBUF[26]_inst 
       (.I(slv_adr_o_OBUF[26]),
        .O(slv_adr_o[26]));
  OBUF \slv_adr_o_OBUF[27]_inst 
       (.I(slv_adr_o_OBUF[27]),
        .O(slv_adr_o[27]));
  OBUF \slv_adr_o_OBUF[28]_inst 
       (.I(slv_adr_o_OBUF[28]),
        .O(slv_adr_o[28]));
  OBUF \slv_adr_o_OBUF[29]_inst 
       (.I(slv_adr_o_OBUF[29]),
        .O(slv_adr_o[29]));
  OBUF \slv_adr_o_OBUF[2]_inst 
       (.I(slv_adr_o_OBUF[2]),
        .O(slv_adr_o[2]));
  OBUF \slv_adr_o_OBUF[30]_inst 
       (.I(slv_adr_o_OBUF[30]),
        .O(slv_adr_o[30]));
  OBUF \slv_adr_o_OBUF[31]_inst 
       (.I(slv_adr_o_OBUF[31]),
        .O(slv_adr_o[31]));
  OBUF \slv_adr_o_OBUF[32]_inst 
       (.I(1'b0),
        .O(slv_adr_o[32]));
  OBUF \slv_adr_o_OBUF[33]_inst 
       (.I(1'b0),
        .O(slv_adr_o[33]));
  OBUF \slv_adr_o_OBUF[34]_inst 
       (.I(1'b0),
        .O(slv_adr_o[34]));
  OBUF \slv_adr_o_OBUF[35]_inst 
       (.I(1'b0),
        .O(slv_adr_o[35]));
  OBUF \slv_adr_o_OBUF[36]_inst 
       (.I(1'b0),
        .O(slv_adr_o[36]));
  OBUF \slv_adr_o_OBUF[37]_inst 
       (.I(1'b0),
        .O(slv_adr_o[37]));
  OBUF \slv_adr_o_OBUF[38]_inst 
       (.I(1'b0),
        .O(slv_adr_o[38]));
  OBUF \slv_adr_o_OBUF[39]_inst 
       (.I(1'b0),
        .O(slv_adr_o[39]));
  OBUF \slv_adr_o_OBUF[3]_inst 
       (.I(slv_adr_o_OBUF[3]),
        .O(slv_adr_o[3]));
  OBUF \slv_adr_o_OBUF[40]_inst 
       (.I(1'b0),
        .O(slv_adr_o[40]));
  OBUF \slv_adr_o_OBUF[41]_inst 
       (.I(1'b0),
        .O(slv_adr_o[41]));
  OBUF \slv_adr_o_OBUF[42]_inst 
       (.I(1'b0),
        .O(slv_adr_o[42]));
  OBUF \slv_adr_o_OBUF[43]_inst 
       (.I(1'b0),
        .O(slv_adr_o[43]));
  OBUF \slv_adr_o_OBUF[44]_inst 
       (.I(1'b0),
        .O(slv_adr_o[44]));
  OBUF \slv_adr_o_OBUF[45]_inst 
       (.I(1'b0),
        .O(slv_adr_o[45]));
  OBUF \slv_adr_o_OBUF[46]_inst 
       (.I(1'b0),
        .O(slv_adr_o[46]));
  OBUF \slv_adr_o_OBUF[47]_inst 
       (.I(1'b0),
        .O(slv_adr_o[47]));
  OBUF \slv_adr_o_OBUF[48]_inst 
       (.I(1'b0),
        .O(slv_adr_o[48]));
  OBUF \slv_adr_o_OBUF[49]_inst 
       (.I(1'b0),
        .O(slv_adr_o[49]));
  OBUF \slv_adr_o_OBUF[4]_inst 
       (.I(slv_adr_o_OBUF[4]),
        .O(slv_adr_o[4]));
  OBUF \slv_adr_o_OBUF[50]_inst 
       (.I(1'b0),
        .O(slv_adr_o[50]));
  OBUF \slv_adr_o_OBUF[51]_inst 
       (.I(1'b0),
        .O(slv_adr_o[51]));
  OBUF \slv_adr_o_OBUF[52]_inst 
       (.I(1'b0),
        .O(slv_adr_o[52]));
  OBUF \slv_adr_o_OBUF[53]_inst 
       (.I(1'b0),
        .O(slv_adr_o[53]));
  OBUF \slv_adr_o_OBUF[54]_inst 
       (.I(1'b0),
        .O(slv_adr_o[54]));
  OBUF \slv_adr_o_OBUF[55]_inst 
       (.I(1'b0),
        .O(slv_adr_o[55]));
  OBUF \slv_adr_o_OBUF[56]_inst 
       (.I(1'b0),
        .O(slv_adr_o[56]));
  OBUF \slv_adr_o_OBUF[57]_inst 
       (.I(1'b0),
        .O(slv_adr_o[57]));
  OBUF \slv_adr_o_OBUF[58]_inst 
       (.I(1'b0),
        .O(slv_adr_o[58]));
  OBUF \slv_adr_o_OBUF[59]_inst 
       (.I(1'b0),
        .O(slv_adr_o[59]));
  OBUF \slv_adr_o_OBUF[5]_inst 
       (.I(slv_adr_o_OBUF[5]),
        .O(slv_adr_o[5]));
  OBUF \slv_adr_o_OBUF[60]_inst 
       (.I(1'b0),
        .O(slv_adr_o[60]));
  OBUF \slv_adr_o_OBUF[61]_inst 
       (.I(1'b0),
        .O(slv_adr_o[61]));
  OBUF \slv_adr_o_OBUF[62]_inst 
       (.I(1'b0),
        .O(slv_adr_o[62]));
  OBUF \slv_adr_o_OBUF[63]_inst 
       (.I(1'b0),
        .O(slv_adr_o[63]));
  OBUF \slv_adr_o_OBUF[6]_inst 
       (.I(slv_adr_o_OBUF[6]),
        .O(slv_adr_o[6]));
  OBUF \slv_adr_o_OBUF[7]_inst 
       (.I(slv_adr_o_OBUF[7]),
        .O(slv_adr_o[7]));
  OBUF \slv_adr_o_OBUF[8]_inst 
       (.I(slv_adr_o_OBUF[8]),
        .O(slv_adr_o[8]));
  OBUF \slv_adr_o_OBUF[9]_inst 
       (.I(slv_adr_o_OBUF[9]),
        .O(slv_adr_o[9]));
  OBUF \slv_cyc_o_OBUF[0]_inst 
       (.I(slv_cyc_o_OBUF),
        .O(slv_cyc_o[0]));
  OBUF \slv_cyc_o_OBUF[1]_inst 
       (.I(1'b0),
        .O(slv_cyc_o[1]));
  IBUF \slv_dat_i_IBUF[0]_inst 
       (.I(slv_dat_i[0]),
        .O(slv_dat_i_IBUF[0]));
  IBUF \slv_dat_i_IBUF[10]_inst 
       (.I(slv_dat_i[10]),
        .O(slv_dat_i_IBUF[10]));
  IBUF \slv_dat_i_IBUF[11]_inst 
       (.I(slv_dat_i[11]),
        .O(slv_dat_i_IBUF[11]));
  IBUF \slv_dat_i_IBUF[12]_inst 
       (.I(slv_dat_i[12]),
        .O(slv_dat_i_IBUF[12]));
  IBUF \slv_dat_i_IBUF[13]_inst 
       (.I(slv_dat_i[13]),
        .O(slv_dat_i_IBUF[13]));
  IBUF \slv_dat_i_IBUF[14]_inst 
       (.I(slv_dat_i[14]),
        .O(slv_dat_i_IBUF[14]));
  IBUF \slv_dat_i_IBUF[15]_inst 
       (.I(slv_dat_i[15]),
        .O(slv_dat_i_IBUF[15]));
  IBUF \slv_dat_i_IBUF[16]_inst 
       (.I(slv_dat_i[16]),
        .O(slv_dat_i_IBUF[16]));
  IBUF \slv_dat_i_IBUF[17]_inst 
       (.I(slv_dat_i[17]),
        .O(slv_dat_i_IBUF[17]));
  IBUF \slv_dat_i_IBUF[18]_inst 
       (.I(slv_dat_i[18]),
        .O(slv_dat_i_IBUF[18]));
  IBUF \slv_dat_i_IBUF[19]_inst 
       (.I(slv_dat_i[19]),
        .O(slv_dat_i_IBUF[19]));
  IBUF \slv_dat_i_IBUF[1]_inst 
       (.I(slv_dat_i[1]),
        .O(slv_dat_i_IBUF[1]));
  IBUF \slv_dat_i_IBUF[20]_inst 
       (.I(slv_dat_i[20]),
        .O(slv_dat_i_IBUF[20]));
  IBUF \slv_dat_i_IBUF[21]_inst 
       (.I(slv_dat_i[21]),
        .O(slv_dat_i_IBUF[21]));
  IBUF \slv_dat_i_IBUF[22]_inst 
       (.I(slv_dat_i[22]),
        .O(slv_dat_i_IBUF[22]));
  IBUF \slv_dat_i_IBUF[23]_inst 
       (.I(slv_dat_i[23]),
        .O(slv_dat_i_IBUF[23]));
  IBUF \slv_dat_i_IBUF[24]_inst 
       (.I(slv_dat_i[24]),
        .O(slv_dat_i_IBUF[24]));
  IBUF \slv_dat_i_IBUF[25]_inst 
       (.I(slv_dat_i[25]),
        .O(slv_dat_i_IBUF[25]));
  IBUF \slv_dat_i_IBUF[26]_inst 
       (.I(slv_dat_i[26]),
        .O(slv_dat_i_IBUF[26]));
  IBUF \slv_dat_i_IBUF[27]_inst 
       (.I(slv_dat_i[27]),
        .O(slv_dat_i_IBUF[27]));
  IBUF \slv_dat_i_IBUF[28]_inst 
       (.I(slv_dat_i[28]),
        .O(slv_dat_i_IBUF[28]));
  IBUF \slv_dat_i_IBUF[29]_inst 
       (.I(slv_dat_i[29]),
        .O(slv_dat_i_IBUF[29]));
  IBUF \slv_dat_i_IBUF[2]_inst 
       (.I(slv_dat_i[2]),
        .O(slv_dat_i_IBUF[2]));
  IBUF \slv_dat_i_IBUF[30]_inst 
       (.I(slv_dat_i[30]),
        .O(slv_dat_i_IBUF[30]));
  IBUF \slv_dat_i_IBUF[31]_inst 
       (.I(slv_dat_i[31]),
        .O(slv_dat_i_IBUF[31]));
  IBUF \slv_dat_i_IBUF[3]_inst 
       (.I(slv_dat_i[3]),
        .O(slv_dat_i_IBUF[3]));
  IBUF \slv_dat_i_IBUF[4]_inst 
       (.I(slv_dat_i[4]),
        .O(slv_dat_i_IBUF[4]));
  IBUF \slv_dat_i_IBUF[5]_inst 
       (.I(slv_dat_i[5]),
        .O(slv_dat_i_IBUF[5]));
  IBUF \slv_dat_i_IBUF[6]_inst 
       (.I(slv_dat_i[6]),
        .O(slv_dat_i_IBUF[6]));
  IBUF \slv_dat_i_IBUF[7]_inst 
       (.I(slv_dat_i[7]),
        .O(slv_dat_i_IBUF[7]));
  IBUF \slv_dat_i_IBUF[8]_inst 
       (.I(slv_dat_i[8]),
        .O(slv_dat_i_IBUF[8]));
  IBUF \slv_dat_i_IBUF[9]_inst 
       (.I(slv_dat_i[9]),
        .O(slv_dat_i_IBUF[9]));
  OBUF \slv_dat_o_OBUF[0]_inst 
       (.I(slv_dat_o_OBUF[0]),
        .O(slv_dat_o[0]));
  OBUF \slv_dat_o_OBUF[10]_inst 
       (.I(slv_dat_o_OBUF[10]),
        .O(slv_dat_o[10]));
  OBUF \slv_dat_o_OBUF[11]_inst 
       (.I(slv_dat_o_OBUF[11]),
        .O(slv_dat_o[11]));
  OBUF \slv_dat_o_OBUF[12]_inst 
       (.I(slv_dat_o_OBUF[12]),
        .O(slv_dat_o[12]));
  OBUF \slv_dat_o_OBUF[13]_inst 
       (.I(slv_dat_o_OBUF[13]),
        .O(slv_dat_o[13]));
  OBUF \slv_dat_o_OBUF[14]_inst 
       (.I(slv_dat_o_OBUF[14]),
        .O(slv_dat_o[14]));
  OBUF \slv_dat_o_OBUF[15]_inst 
       (.I(slv_dat_o_OBUF[15]),
        .O(slv_dat_o[15]));
  OBUF \slv_dat_o_OBUF[16]_inst 
       (.I(slv_dat_o_OBUF[16]),
        .O(slv_dat_o[16]));
  OBUF \slv_dat_o_OBUF[17]_inst 
       (.I(slv_dat_o_OBUF[17]),
        .O(slv_dat_o[17]));
  OBUF \slv_dat_o_OBUF[18]_inst 
       (.I(slv_dat_o_OBUF[18]),
        .O(slv_dat_o[18]));
  OBUF \slv_dat_o_OBUF[19]_inst 
       (.I(slv_dat_o_OBUF[19]),
        .O(slv_dat_o[19]));
  OBUF \slv_dat_o_OBUF[1]_inst 
       (.I(slv_dat_o_OBUF[1]),
        .O(slv_dat_o[1]));
  OBUF \slv_dat_o_OBUF[20]_inst 
       (.I(slv_dat_o_OBUF[20]),
        .O(slv_dat_o[20]));
  OBUF \slv_dat_o_OBUF[21]_inst 
       (.I(slv_dat_o_OBUF[21]),
        .O(slv_dat_o[21]));
  OBUF \slv_dat_o_OBUF[22]_inst 
       (.I(slv_dat_o_OBUF[22]),
        .O(slv_dat_o[22]));
  OBUF \slv_dat_o_OBUF[23]_inst 
       (.I(slv_dat_o_OBUF[23]),
        .O(slv_dat_o[23]));
  OBUF \slv_dat_o_OBUF[24]_inst 
       (.I(slv_dat_o_OBUF[24]),
        .O(slv_dat_o[24]));
  OBUF \slv_dat_o_OBUF[25]_inst 
       (.I(slv_dat_o_OBUF[25]),
        .O(slv_dat_o[25]));
  OBUF \slv_dat_o_OBUF[26]_inst 
       (.I(slv_dat_o_OBUF[26]),
        .O(slv_dat_o[26]));
  OBUF \slv_dat_o_OBUF[27]_inst 
       (.I(slv_dat_o_OBUF[27]),
        .O(slv_dat_o[27]));
  OBUF \slv_dat_o_OBUF[28]_inst 
       (.I(slv_dat_o_OBUF[28]),
        .O(slv_dat_o[28]));
  OBUF \slv_dat_o_OBUF[29]_inst 
       (.I(slv_dat_o_OBUF[29]),
        .O(slv_dat_o[29]));
  OBUF \slv_dat_o_OBUF[2]_inst 
       (.I(slv_dat_o_OBUF[2]),
        .O(slv_dat_o[2]));
  OBUF \slv_dat_o_OBUF[30]_inst 
       (.I(slv_dat_o_OBUF[30]),
        .O(slv_dat_o[30]));
  OBUF \slv_dat_o_OBUF[31]_inst 
       (.I(slv_dat_o_OBUF[31]),
        .O(slv_dat_o[31]));
  OBUF \slv_dat_o_OBUF[32]_inst 
       (.I(1'b0),
        .O(slv_dat_o[32]));
  OBUF \slv_dat_o_OBUF[33]_inst 
       (.I(1'b0),
        .O(slv_dat_o[33]));
  OBUF \slv_dat_o_OBUF[34]_inst 
       (.I(1'b0),
        .O(slv_dat_o[34]));
  OBUF \slv_dat_o_OBUF[35]_inst 
       (.I(1'b0),
        .O(slv_dat_o[35]));
  OBUF \slv_dat_o_OBUF[36]_inst 
       (.I(1'b0),
        .O(slv_dat_o[36]));
  OBUF \slv_dat_o_OBUF[37]_inst 
       (.I(1'b0),
        .O(slv_dat_o[37]));
  OBUF \slv_dat_o_OBUF[38]_inst 
       (.I(1'b0),
        .O(slv_dat_o[38]));
  OBUF \slv_dat_o_OBUF[39]_inst 
       (.I(1'b0),
        .O(slv_dat_o[39]));
  OBUF \slv_dat_o_OBUF[3]_inst 
       (.I(slv_dat_o_OBUF[3]),
        .O(slv_dat_o[3]));
  OBUF \slv_dat_o_OBUF[40]_inst 
       (.I(1'b0),
        .O(slv_dat_o[40]));
  OBUF \slv_dat_o_OBUF[41]_inst 
       (.I(1'b0),
        .O(slv_dat_o[41]));
  OBUF \slv_dat_o_OBUF[42]_inst 
       (.I(1'b0),
        .O(slv_dat_o[42]));
  OBUF \slv_dat_o_OBUF[43]_inst 
       (.I(1'b0),
        .O(slv_dat_o[43]));
  OBUF \slv_dat_o_OBUF[44]_inst 
       (.I(1'b0),
        .O(slv_dat_o[44]));
  OBUF \slv_dat_o_OBUF[45]_inst 
       (.I(1'b0),
        .O(slv_dat_o[45]));
  OBUF \slv_dat_o_OBUF[46]_inst 
       (.I(1'b0),
        .O(slv_dat_o[46]));
  OBUF \slv_dat_o_OBUF[47]_inst 
       (.I(1'b0),
        .O(slv_dat_o[47]));
  OBUF \slv_dat_o_OBUF[48]_inst 
       (.I(1'b0),
        .O(slv_dat_o[48]));
  OBUF \slv_dat_o_OBUF[49]_inst 
       (.I(1'b0),
        .O(slv_dat_o[49]));
  OBUF \slv_dat_o_OBUF[4]_inst 
       (.I(slv_dat_o_OBUF[4]),
        .O(slv_dat_o[4]));
  OBUF \slv_dat_o_OBUF[50]_inst 
       (.I(1'b0),
        .O(slv_dat_o[50]));
  OBUF \slv_dat_o_OBUF[51]_inst 
       (.I(1'b0),
        .O(slv_dat_o[51]));
  OBUF \slv_dat_o_OBUF[52]_inst 
       (.I(1'b0),
        .O(slv_dat_o[52]));
  OBUF \slv_dat_o_OBUF[53]_inst 
       (.I(1'b0),
        .O(slv_dat_o[53]));
  OBUF \slv_dat_o_OBUF[54]_inst 
       (.I(1'b0),
        .O(slv_dat_o[54]));
  OBUF \slv_dat_o_OBUF[55]_inst 
       (.I(1'b0),
        .O(slv_dat_o[55]));
  OBUF \slv_dat_o_OBUF[56]_inst 
       (.I(1'b0),
        .O(slv_dat_o[56]));
  OBUF \slv_dat_o_OBUF[57]_inst 
       (.I(1'b0),
        .O(slv_dat_o[57]));
  OBUF \slv_dat_o_OBUF[58]_inst 
       (.I(1'b0),
        .O(slv_dat_o[58]));
  OBUF \slv_dat_o_OBUF[59]_inst 
       (.I(1'b0),
        .O(slv_dat_o[59]));
  OBUF \slv_dat_o_OBUF[5]_inst 
       (.I(slv_dat_o_OBUF[5]),
        .O(slv_dat_o[5]));
  OBUF \slv_dat_o_OBUF[60]_inst 
       (.I(1'b0),
        .O(slv_dat_o[60]));
  OBUF \slv_dat_o_OBUF[61]_inst 
       (.I(1'b0),
        .O(slv_dat_o[61]));
  OBUF \slv_dat_o_OBUF[62]_inst 
       (.I(1'b0),
        .O(slv_dat_o[62]));
  OBUF \slv_dat_o_OBUF[63]_inst 
       (.I(1'b0),
        .O(slv_dat_o[63]));
  OBUF \slv_dat_o_OBUF[6]_inst 
       (.I(slv_dat_o_OBUF[6]),
        .O(slv_dat_o[6]));
  OBUF \slv_dat_o_OBUF[7]_inst 
       (.I(slv_dat_o_OBUF[7]),
        .O(slv_dat_o[7]));
  OBUF \slv_dat_o_OBUF[8]_inst 
       (.I(slv_dat_o_OBUF[8]),
        .O(slv_dat_o[8]));
  OBUF \slv_dat_o_OBUF[9]_inst 
       (.I(slv_dat_o_OBUF[9]),
        .O(slv_dat_o[9]));
  IBUF \slv_err_i_IBUF[0]_inst 
       (.I(slv_err_i[0]),
        .O(slv_err_i_IBUF));
  OBUF \slv_sel_o_OBUF[0]_inst 
       (.I(slv_sel_o_OBUF[0]),
        .O(slv_sel_o[0]));
  OBUF \slv_sel_o_OBUF[1]_inst 
       (.I(slv_sel_o_OBUF[1]),
        .O(slv_sel_o[1]));
  OBUF \slv_sel_o_OBUF[2]_inst 
       (.I(slv_sel_o_OBUF[2]),
        .O(slv_sel_o[2]));
  OBUF \slv_sel_o_OBUF[3]_inst 
       (.I(slv_sel_o_OBUF[3]),
        .O(slv_sel_o[3]));
  OBUF \slv_sel_o_OBUF[4]_inst 
       (.I(1'b0),
        .O(slv_sel_o[4]));
  OBUF \slv_sel_o_OBUF[5]_inst 
       (.I(1'b0),
        .O(slv_sel_o[5]));
  OBUF \slv_sel_o_OBUF[6]_inst 
       (.I(1'b0),
        .O(slv_sel_o[6]));
  OBUF \slv_sel_o_OBUF[7]_inst 
       (.I(1'b0),
        .O(slv_sel_o[7]));
  OBUF \slv_stb_o_OBUF[0]_inst 
       (.I(slv_stb_o_OBUF),
        .O(slv_stb_o[0]));
  OBUF \slv_stb_o_OBUF[1]_inst 
       (.I(1'b0),
        .O(slv_stb_o[1]));
  OBUF \slv_we_o_OBUF[0]_inst 
       (.I(slv_we_o_OBUF),
        .O(slv_we_o[0]));
  OBUF \slv_we_o_OBUF[1]_inst 
       (.I(1'b0),
        .O(slv_we_o[1]));
  OBUF \wb_ack_o_OBUF[0]_inst 
       (.I(wb_ack_o_OBUF[0]),
        .O(wb_ack_o[0]));
  OBUF \wb_ack_o_OBUF[1]_inst 
       (.I(wb_ack_o_OBUF[1]),
        .O(wb_ack_o[1]));
  IBUF \wb_adr_i_IBUF[0]_inst 
       (.I(wb_adr_i[0]),
        .O(wb_adr_i_IBUF[0]));
  IBUF \wb_adr_i_IBUF[10]_inst 
       (.I(wb_adr_i[10]),
        .O(wb_adr_i_IBUF[10]));
  IBUF \wb_adr_i_IBUF[11]_inst 
       (.I(wb_adr_i[11]),
        .O(wb_adr_i_IBUF[11]));
  IBUF \wb_adr_i_IBUF[12]_inst 
       (.I(wb_adr_i[12]),
        .O(wb_adr_i_IBUF[12]));
  IBUF \wb_adr_i_IBUF[13]_inst 
       (.I(wb_adr_i[13]),
        .O(wb_adr_i_IBUF[13]));
  IBUF \wb_adr_i_IBUF[14]_inst 
       (.I(wb_adr_i[14]),
        .O(wb_adr_i_IBUF[14]));
  IBUF \wb_adr_i_IBUF[15]_inst 
       (.I(wb_adr_i[15]),
        .O(wb_adr_i_IBUF[15]));
  IBUF \wb_adr_i_IBUF[16]_inst 
       (.I(wb_adr_i[16]),
        .O(wb_adr_i_IBUF[16]));
  IBUF \wb_adr_i_IBUF[17]_inst 
       (.I(wb_adr_i[17]),
        .O(wb_adr_i_IBUF[17]));
  IBUF \wb_adr_i_IBUF[18]_inst 
       (.I(wb_adr_i[18]),
        .O(wb_adr_i_IBUF[18]));
  IBUF \wb_adr_i_IBUF[19]_inst 
       (.I(wb_adr_i[19]),
        .O(wb_adr_i_IBUF[19]));
  IBUF \wb_adr_i_IBUF[1]_inst 
       (.I(wb_adr_i[1]),
        .O(wb_adr_i_IBUF[1]));
  IBUF \wb_adr_i_IBUF[20]_inst 
       (.I(wb_adr_i[20]),
        .O(wb_adr_i_IBUF[20]));
  IBUF \wb_adr_i_IBUF[21]_inst 
       (.I(wb_adr_i[21]),
        .O(wb_adr_i_IBUF[21]));
  IBUF \wb_adr_i_IBUF[22]_inst 
       (.I(wb_adr_i[22]),
        .O(wb_adr_i_IBUF[22]));
  IBUF \wb_adr_i_IBUF[23]_inst 
       (.I(wb_adr_i[23]),
        .O(wb_adr_i_IBUF[23]));
  IBUF \wb_adr_i_IBUF[24]_inst 
       (.I(wb_adr_i[24]),
        .O(wb_adr_i_IBUF[24]));
  IBUF \wb_adr_i_IBUF[25]_inst 
       (.I(wb_adr_i[25]),
        .O(wb_adr_i_IBUF[25]));
  IBUF \wb_adr_i_IBUF[26]_inst 
       (.I(wb_adr_i[26]),
        .O(wb_adr_i_IBUF[26]));
  IBUF \wb_adr_i_IBUF[27]_inst 
       (.I(wb_adr_i[27]),
        .O(wb_adr_i_IBUF[27]));
  IBUF \wb_adr_i_IBUF[28]_inst 
       (.I(wb_adr_i[28]),
        .O(wb_adr_i_IBUF[28]));
  IBUF \wb_adr_i_IBUF[29]_inst 
       (.I(wb_adr_i[29]),
        .O(wb_adr_i_IBUF[29]));
  IBUF \wb_adr_i_IBUF[2]_inst 
       (.I(wb_adr_i[2]),
        .O(wb_adr_i_IBUF[2]));
  IBUF \wb_adr_i_IBUF[30]_inst 
       (.I(wb_adr_i[30]),
        .O(wb_adr_i_IBUF[30]));
  IBUF \wb_adr_i_IBUF[31]_inst 
       (.I(wb_adr_i[31]),
        .O(wb_adr_i_IBUF[31]));
  IBUF \wb_adr_i_IBUF[32]_inst 
       (.I(wb_adr_i[32]),
        .O(wb_adr_i_IBUF[32]));
  IBUF \wb_adr_i_IBUF[33]_inst 
       (.I(wb_adr_i[33]),
        .O(wb_adr_i_IBUF[33]));
  IBUF \wb_adr_i_IBUF[34]_inst 
       (.I(wb_adr_i[34]),
        .O(wb_adr_i_IBUF[34]));
  IBUF \wb_adr_i_IBUF[35]_inst 
       (.I(wb_adr_i[35]),
        .O(wb_adr_i_IBUF[35]));
  IBUF \wb_adr_i_IBUF[36]_inst 
       (.I(wb_adr_i[36]),
        .O(wb_adr_i_IBUF[36]));
  IBUF \wb_adr_i_IBUF[37]_inst 
       (.I(wb_adr_i[37]),
        .O(wb_adr_i_IBUF[37]));
  IBUF \wb_adr_i_IBUF[38]_inst 
       (.I(wb_adr_i[38]),
        .O(wb_adr_i_IBUF[38]));
  IBUF \wb_adr_i_IBUF[39]_inst 
       (.I(wb_adr_i[39]),
        .O(wb_adr_i_IBUF[39]));
  IBUF \wb_adr_i_IBUF[3]_inst 
       (.I(wb_adr_i[3]),
        .O(wb_adr_i_IBUF[3]));
  IBUF \wb_adr_i_IBUF[40]_inst 
       (.I(wb_adr_i[40]),
        .O(wb_adr_i_IBUF[40]));
  IBUF \wb_adr_i_IBUF[41]_inst 
       (.I(wb_adr_i[41]),
        .O(wb_adr_i_IBUF[41]));
  IBUF \wb_adr_i_IBUF[42]_inst 
       (.I(wb_adr_i[42]),
        .O(wb_adr_i_IBUF[42]));
  IBUF \wb_adr_i_IBUF[43]_inst 
       (.I(wb_adr_i[43]),
        .O(wb_adr_i_IBUF[43]));
  IBUF \wb_adr_i_IBUF[44]_inst 
       (.I(wb_adr_i[44]),
        .O(wb_adr_i_IBUF[44]));
  IBUF \wb_adr_i_IBUF[45]_inst 
       (.I(wb_adr_i[45]),
        .O(wb_adr_i_IBUF[45]));
  IBUF \wb_adr_i_IBUF[46]_inst 
       (.I(wb_adr_i[46]),
        .O(wb_adr_i_IBUF[46]));
  IBUF \wb_adr_i_IBUF[47]_inst 
       (.I(wb_adr_i[47]),
        .O(wb_adr_i_IBUF[47]));
  IBUF \wb_adr_i_IBUF[48]_inst 
       (.I(wb_adr_i[48]),
        .O(wb_adr_i_IBUF[48]));
  IBUF \wb_adr_i_IBUF[49]_inst 
       (.I(wb_adr_i[49]),
        .O(wb_adr_i_IBUF[49]));
  IBUF \wb_adr_i_IBUF[4]_inst 
       (.I(wb_adr_i[4]),
        .O(wb_adr_i_IBUF[4]));
  IBUF \wb_adr_i_IBUF[50]_inst 
       (.I(wb_adr_i[50]),
        .O(wb_adr_i_IBUF[50]));
  IBUF \wb_adr_i_IBUF[51]_inst 
       (.I(wb_adr_i[51]),
        .O(wb_adr_i_IBUF[51]));
  IBUF \wb_adr_i_IBUF[52]_inst 
       (.I(wb_adr_i[52]),
        .O(wb_adr_i_IBUF[52]));
  IBUF \wb_adr_i_IBUF[53]_inst 
       (.I(wb_adr_i[53]),
        .O(wb_adr_i_IBUF[53]));
  IBUF \wb_adr_i_IBUF[54]_inst 
       (.I(wb_adr_i[54]),
        .O(wb_adr_i_IBUF[54]));
  IBUF \wb_adr_i_IBUF[55]_inst 
       (.I(wb_adr_i[55]),
        .O(wb_adr_i_IBUF[55]));
  IBUF \wb_adr_i_IBUF[56]_inst 
       (.I(wb_adr_i[56]),
        .O(wb_adr_i_IBUF[56]));
  IBUF \wb_adr_i_IBUF[57]_inst 
       (.I(wb_adr_i[57]),
        .O(wb_adr_i_IBUF[57]));
  IBUF \wb_adr_i_IBUF[58]_inst 
       (.I(wb_adr_i[58]),
        .O(wb_adr_i_IBUF[58]));
  IBUF \wb_adr_i_IBUF[59]_inst 
       (.I(wb_adr_i[59]),
        .O(wb_adr_i_IBUF[59]));
  IBUF \wb_adr_i_IBUF[5]_inst 
       (.I(wb_adr_i[5]),
        .O(wb_adr_i_IBUF[5]));
  IBUF \wb_adr_i_IBUF[60]_inst 
       (.I(wb_adr_i[60]),
        .O(wb_adr_i_IBUF[60]));
  IBUF \wb_adr_i_IBUF[61]_inst 
       (.I(wb_adr_i[61]),
        .O(wb_adr_i_IBUF[61]));
  IBUF \wb_adr_i_IBUF[62]_inst 
       (.I(wb_adr_i[62]),
        .O(wb_adr_i_IBUF[62]));
  IBUF \wb_adr_i_IBUF[63]_inst 
       (.I(wb_adr_i[63]),
        .O(wb_adr_i_IBUF[63]));
  IBUF \wb_adr_i_IBUF[6]_inst 
       (.I(wb_adr_i[6]),
        .O(wb_adr_i_IBUF[6]));
  IBUF \wb_adr_i_IBUF[7]_inst 
       (.I(wb_adr_i[7]),
        .O(wb_adr_i_IBUF[7]));
  IBUF \wb_adr_i_IBUF[8]_inst 
       (.I(wb_adr_i[8]),
        .O(wb_adr_i_IBUF[8]));
  IBUF \wb_adr_i_IBUF[9]_inst 
       (.I(wb_adr_i[9]),
        .O(wb_adr_i_IBUF[9]));
  IBUF \wb_cyc_i_IBUF[0]_inst 
       (.I(wb_cyc_i[0]),
        .O(wb_cyc_i_IBUF[0]));
  IBUF \wb_cyc_i_IBUF[1]_inst 
       (.I(wb_cyc_i[1]),
        .O(wb_cyc_i_IBUF[1]));
  IBUF \wb_dat_i_IBUF[0]_inst 
       (.I(wb_dat_i[0]),
        .O(wb_dat_i_IBUF[0]));
  IBUF \wb_dat_i_IBUF[10]_inst 
       (.I(wb_dat_i[10]),
        .O(wb_dat_i_IBUF[10]));
  IBUF \wb_dat_i_IBUF[11]_inst 
       (.I(wb_dat_i[11]),
        .O(wb_dat_i_IBUF[11]));
  IBUF \wb_dat_i_IBUF[12]_inst 
       (.I(wb_dat_i[12]),
        .O(wb_dat_i_IBUF[12]));
  IBUF \wb_dat_i_IBUF[13]_inst 
       (.I(wb_dat_i[13]),
        .O(wb_dat_i_IBUF[13]));
  IBUF \wb_dat_i_IBUF[14]_inst 
       (.I(wb_dat_i[14]),
        .O(wb_dat_i_IBUF[14]));
  IBUF \wb_dat_i_IBUF[15]_inst 
       (.I(wb_dat_i[15]),
        .O(wb_dat_i_IBUF[15]));
  IBUF \wb_dat_i_IBUF[16]_inst 
       (.I(wb_dat_i[16]),
        .O(wb_dat_i_IBUF[16]));
  IBUF \wb_dat_i_IBUF[17]_inst 
       (.I(wb_dat_i[17]),
        .O(wb_dat_i_IBUF[17]));
  IBUF \wb_dat_i_IBUF[18]_inst 
       (.I(wb_dat_i[18]),
        .O(wb_dat_i_IBUF[18]));
  IBUF \wb_dat_i_IBUF[19]_inst 
       (.I(wb_dat_i[19]),
        .O(wb_dat_i_IBUF[19]));
  IBUF \wb_dat_i_IBUF[1]_inst 
       (.I(wb_dat_i[1]),
        .O(wb_dat_i_IBUF[1]));
  IBUF \wb_dat_i_IBUF[20]_inst 
       (.I(wb_dat_i[20]),
        .O(wb_dat_i_IBUF[20]));
  IBUF \wb_dat_i_IBUF[21]_inst 
       (.I(wb_dat_i[21]),
        .O(wb_dat_i_IBUF[21]));
  IBUF \wb_dat_i_IBUF[22]_inst 
       (.I(wb_dat_i[22]),
        .O(wb_dat_i_IBUF[22]));
  IBUF \wb_dat_i_IBUF[23]_inst 
       (.I(wb_dat_i[23]),
        .O(wb_dat_i_IBUF[23]));
  IBUF \wb_dat_i_IBUF[24]_inst 
       (.I(wb_dat_i[24]),
        .O(wb_dat_i_IBUF[24]));
  IBUF \wb_dat_i_IBUF[25]_inst 
       (.I(wb_dat_i[25]),
        .O(wb_dat_i_IBUF[25]));
  IBUF \wb_dat_i_IBUF[26]_inst 
       (.I(wb_dat_i[26]),
        .O(wb_dat_i_IBUF[26]));
  IBUF \wb_dat_i_IBUF[27]_inst 
       (.I(wb_dat_i[27]),
        .O(wb_dat_i_IBUF[27]));
  IBUF \wb_dat_i_IBUF[28]_inst 
       (.I(wb_dat_i[28]),
        .O(wb_dat_i_IBUF[28]));
  IBUF \wb_dat_i_IBUF[29]_inst 
       (.I(wb_dat_i[29]),
        .O(wb_dat_i_IBUF[29]));
  IBUF \wb_dat_i_IBUF[2]_inst 
       (.I(wb_dat_i[2]),
        .O(wb_dat_i_IBUF[2]));
  IBUF \wb_dat_i_IBUF[30]_inst 
       (.I(wb_dat_i[30]),
        .O(wb_dat_i_IBUF[30]));
  IBUF \wb_dat_i_IBUF[31]_inst 
       (.I(wb_dat_i[31]),
        .O(wb_dat_i_IBUF[31]));
  IBUF \wb_dat_i_IBUF[32]_inst 
       (.I(wb_dat_i[32]),
        .O(wb_dat_i_IBUF[32]));
  IBUF \wb_dat_i_IBUF[33]_inst 
       (.I(wb_dat_i[33]),
        .O(wb_dat_i_IBUF[33]));
  IBUF \wb_dat_i_IBUF[34]_inst 
       (.I(wb_dat_i[34]),
        .O(wb_dat_i_IBUF[34]));
  IBUF \wb_dat_i_IBUF[35]_inst 
       (.I(wb_dat_i[35]),
        .O(wb_dat_i_IBUF[35]));
  IBUF \wb_dat_i_IBUF[36]_inst 
       (.I(wb_dat_i[36]),
        .O(wb_dat_i_IBUF[36]));
  IBUF \wb_dat_i_IBUF[37]_inst 
       (.I(wb_dat_i[37]),
        .O(wb_dat_i_IBUF[37]));
  IBUF \wb_dat_i_IBUF[38]_inst 
       (.I(wb_dat_i[38]),
        .O(wb_dat_i_IBUF[38]));
  IBUF \wb_dat_i_IBUF[39]_inst 
       (.I(wb_dat_i[39]),
        .O(wb_dat_i_IBUF[39]));
  IBUF \wb_dat_i_IBUF[3]_inst 
       (.I(wb_dat_i[3]),
        .O(wb_dat_i_IBUF[3]));
  IBUF \wb_dat_i_IBUF[40]_inst 
       (.I(wb_dat_i[40]),
        .O(wb_dat_i_IBUF[40]));
  IBUF \wb_dat_i_IBUF[41]_inst 
       (.I(wb_dat_i[41]),
        .O(wb_dat_i_IBUF[41]));
  IBUF \wb_dat_i_IBUF[42]_inst 
       (.I(wb_dat_i[42]),
        .O(wb_dat_i_IBUF[42]));
  IBUF \wb_dat_i_IBUF[43]_inst 
       (.I(wb_dat_i[43]),
        .O(wb_dat_i_IBUF[43]));
  IBUF \wb_dat_i_IBUF[44]_inst 
       (.I(wb_dat_i[44]),
        .O(wb_dat_i_IBUF[44]));
  IBUF \wb_dat_i_IBUF[45]_inst 
       (.I(wb_dat_i[45]),
        .O(wb_dat_i_IBUF[45]));
  IBUF \wb_dat_i_IBUF[46]_inst 
       (.I(wb_dat_i[46]),
        .O(wb_dat_i_IBUF[46]));
  IBUF \wb_dat_i_IBUF[47]_inst 
       (.I(wb_dat_i[47]),
        .O(wb_dat_i_IBUF[47]));
  IBUF \wb_dat_i_IBUF[48]_inst 
       (.I(wb_dat_i[48]),
        .O(wb_dat_i_IBUF[48]));
  IBUF \wb_dat_i_IBUF[49]_inst 
       (.I(wb_dat_i[49]),
        .O(wb_dat_i_IBUF[49]));
  IBUF \wb_dat_i_IBUF[4]_inst 
       (.I(wb_dat_i[4]),
        .O(wb_dat_i_IBUF[4]));
  IBUF \wb_dat_i_IBUF[50]_inst 
       (.I(wb_dat_i[50]),
        .O(wb_dat_i_IBUF[50]));
  IBUF \wb_dat_i_IBUF[51]_inst 
       (.I(wb_dat_i[51]),
        .O(wb_dat_i_IBUF[51]));
  IBUF \wb_dat_i_IBUF[52]_inst 
       (.I(wb_dat_i[52]),
        .O(wb_dat_i_IBUF[52]));
  IBUF \wb_dat_i_IBUF[53]_inst 
       (.I(wb_dat_i[53]),
        .O(wb_dat_i_IBUF[53]));
  IBUF \wb_dat_i_IBUF[54]_inst 
       (.I(wb_dat_i[54]),
        .O(wb_dat_i_IBUF[54]));
  IBUF \wb_dat_i_IBUF[55]_inst 
       (.I(wb_dat_i[55]),
        .O(wb_dat_i_IBUF[55]));
  IBUF \wb_dat_i_IBUF[56]_inst 
       (.I(wb_dat_i[56]),
        .O(wb_dat_i_IBUF[56]));
  IBUF \wb_dat_i_IBUF[57]_inst 
       (.I(wb_dat_i[57]),
        .O(wb_dat_i_IBUF[57]));
  IBUF \wb_dat_i_IBUF[58]_inst 
       (.I(wb_dat_i[58]),
        .O(wb_dat_i_IBUF[58]));
  IBUF \wb_dat_i_IBUF[59]_inst 
       (.I(wb_dat_i[59]),
        .O(wb_dat_i_IBUF[59]));
  IBUF \wb_dat_i_IBUF[5]_inst 
       (.I(wb_dat_i[5]),
        .O(wb_dat_i_IBUF[5]));
  IBUF \wb_dat_i_IBUF[60]_inst 
       (.I(wb_dat_i[60]),
        .O(wb_dat_i_IBUF[60]));
  IBUF \wb_dat_i_IBUF[61]_inst 
       (.I(wb_dat_i[61]),
        .O(wb_dat_i_IBUF[61]));
  IBUF \wb_dat_i_IBUF[62]_inst 
       (.I(wb_dat_i[62]),
        .O(wb_dat_i_IBUF[62]));
  IBUF \wb_dat_i_IBUF[63]_inst 
       (.I(wb_dat_i[63]),
        .O(wb_dat_i_IBUF[63]));
  IBUF \wb_dat_i_IBUF[6]_inst 
       (.I(wb_dat_i[6]),
        .O(wb_dat_i_IBUF[6]));
  IBUF \wb_dat_i_IBUF[7]_inst 
       (.I(wb_dat_i[7]),
        .O(wb_dat_i_IBUF[7]));
  IBUF \wb_dat_i_IBUF[8]_inst 
       (.I(wb_dat_i[8]),
        .O(wb_dat_i_IBUF[8]));
  IBUF \wb_dat_i_IBUF[9]_inst 
       (.I(wb_dat_i[9]),
        .O(wb_dat_i_IBUF[9]));
  OBUF \wb_dat_o_OBUF[0]_inst 
       (.I(wb_dat_o_OBUF[0]),
        .O(wb_dat_o[0]));
  OBUF \wb_dat_o_OBUF[10]_inst 
       (.I(wb_dat_o_OBUF[10]),
        .O(wb_dat_o[10]));
  OBUF \wb_dat_o_OBUF[11]_inst 
       (.I(wb_dat_o_OBUF[11]),
        .O(wb_dat_o[11]));
  OBUF \wb_dat_o_OBUF[12]_inst 
       (.I(wb_dat_o_OBUF[12]),
        .O(wb_dat_o[12]));
  OBUF \wb_dat_o_OBUF[13]_inst 
       (.I(wb_dat_o_OBUF[13]),
        .O(wb_dat_o[13]));
  OBUF \wb_dat_o_OBUF[14]_inst 
       (.I(wb_dat_o_OBUF[14]),
        .O(wb_dat_o[14]));
  OBUF \wb_dat_o_OBUF[15]_inst 
       (.I(wb_dat_o_OBUF[15]),
        .O(wb_dat_o[15]));
  OBUF \wb_dat_o_OBUF[16]_inst 
       (.I(wb_dat_o_OBUF[16]),
        .O(wb_dat_o[16]));
  OBUF \wb_dat_o_OBUF[17]_inst 
       (.I(wb_dat_o_OBUF[17]),
        .O(wb_dat_o[17]));
  OBUF \wb_dat_o_OBUF[18]_inst 
       (.I(wb_dat_o_OBUF[18]),
        .O(wb_dat_o[18]));
  OBUF \wb_dat_o_OBUF[19]_inst 
       (.I(wb_dat_o_OBUF[19]),
        .O(wb_dat_o[19]));
  OBUF \wb_dat_o_OBUF[1]_inst 
       (.I(wb_dat_o_OBUF[1]),
        .O(wb_dat_o[1]));
  OBUF \wb_dat_o_OBUF[20]_inst 
       (.I(wb_dat_o_OBUF[20]),
        .O(wb_dat_o[20]));
  OBUF \wb_dat_o_OBUF[21]_inst 
       (.I(wb_dat_o_OBUF[21]),
        .O(wb_dat_o[21]));
  OBUF \wb_dat_o_OBUF[22]_inst 
       (.I(wb_dat_o_OBUF[22]),
        .O(wb_dat_o[22]));
  OBUF \wb_dat_o_OBUF[23]_inst 
       (.I(wb_dat_o_OBUF[23]),
        .O(wb_dat_o[23]));
  OBUF \wb_dat_o_OBUF[24]_inst 
       (.I(wb_dat_o_OBUF[24]),
        .O(wb_dat_o[24]));
  OBUF \wb_dat_o_OBUF[25]_inst 
       (.I(wb_dat_o_OBUF[25]),
        .O(wb_dat_o[25]));
  OBUF \wb_dat_o_OBUF[26]_inst 
       (.I(wb_dat_o_OBUF[26]),
        .O(wb_dat_o[26]));
  OBUF \wb_dat_o_OBUF[27]_inst 
       (.I(wb_dat_o_OBUF[27]),
        .O(wb_dat_o[27]));
  OBUF \wb_dat_o_OBUF[28]_inst 
       (.I(wb_dat_o_OBUF[28]),
        .O(wb_dat_o[28]));
  OBUF \wb_dat_o_OBUF[29]_inst 
       (.I(wb_dat_o_OBUF[29]),
        .O(wb_dat_o[29]));
  OBUF \wb_dat_o_OBUF[2]_inst 
       (.I(wb_dat_o_OBUF[2]),
        .O(wb_dat_o[2]));
  OBUF \wb_dat_o_OBUF[30]_inst 
       (.I(wb_dat_o_OBUF[30]),
        .O(wb_dat_o[30]));
  OBUF \wb_dat_o_OBUF[31]_inst 
       (.I(wb_dat_o_OBUF[31]),
        .O(wb_dat_o[31]));
  OBUF \wb_dat_o_OBUF[32]_inst 
       (.I(wb_dat_o_OBUF[32]),
        .O(wb_dat_o[32]));
  OBUF \wb_dat_o_OBUF[33]_inst 
       (.I(wb_dat_o_OBUF[33]),
        .O(wb_dat_o[33]));
  OBUF \wb_dat_o_OBUF[34]_inst 
       (.I(wb_dat_o_OBUF[34]),
        .O(wb_dat_o[34]));
  OBUF \wb_dat_o_OBUF[35]_inst 
       (.I(wb_dat_o_OBUF[35]),
        .O(wb_dat_o[35]));
  OBUF \wb_dat_o_OBUF[36]_inst 
       (.I(wb_dat_o_OBUF[36]),
        .O(wb_dat_o[36]));
  OBUF \wb_dat_o_OBUF[37]_inst 
       (.I(wb_dat_o_OBUF[37]),
        .O(wb_dat_o[37]));
  OBUF \wb_dat_o_OBUF[38]_inst 
       (.I(wb_dat_o_OBUF[38]),
        .O(wb_dat_o[38]));
  OBUF \wb_dat_o_OBUF[39]_inst 
       (.I(wb_dat_o_OBUF[39]),
        .O(wb_dat_o[39]));
  OBUF \wb_dat_o_OBUF[3]_inst 
       (.I(wb_dat_o_OBUF[3]),
        .O(wb_dat_o[3]));
  OBUF \wb_dat_o_OBUF[40]_inst 
       (.I(wb_dat_o_OBUF[40]),
        .O(wb_dat_o[40]));
  OBUF \wb_dat_o_OBUF[41]_inst 
       (.I(wb_dat_o_OBUF[41]),
        .O(wb_dat_o[41]));
  OBUF \wb_dat_o_OBUF[42]_inst 
       (.I(wb_dat_o_OBUF[42]),
        .O(wb_dat_o[42]));
  OBUF \wb_dat_o_OBUF[43]_inst 
       (.I(wb_dat_o_OBUF[43]),
        .O(wb_dat_o[43]));
  OBUF \wb_dat_o_OBUF[44]_inst 
       (.I(wb_dat_o_OBUF[44]),
        .O(wb_dat_o[44]));
  OBUF \wb_dat_o_OBUF[45]_inst 
       (.I(wb_dat_o_OBUF[45]),
        .O(wb_dat_o[45]));
  OBUF \wb_dat_o_OBUF[46]_inst 
       (.I(wb_dat_o_OBUF[46]),
        .O(wb_dat_o[46]));
  OBUF \wb_dat_o_OBUF[47]_inst 
       (.I(wb_dat_o_OBUF[47]),
        .O(wb_dat_o[47]));
  OBUF \wb_dat_o_OBUF[48]_inst 
       (.I(wb_dat_o_OBUF[48]),
        .O(wb_dat_o[48]));
  OBUF \wb_dat_o_OBUF[49]_inst 
       (.I(wb_dat_o_OBUF[49]),
        .O(wb_dat_o[49]));
  OBUF \wb_dat_o_OBUF[4]_inst 
       (.I(wb_dat_o_OBUF[4]),
        .O(wb_dat_o[4]));
  OBUF \wb_dat_o_OBUF[50]_inst 
       (.I(wb_dat_o_OBUF[50]),
        .O(wb_dat_o[50]));
  OBUF \wb_dat_o_OBUF[51]_inst 
       (.I(wb_dat_o_OBUF[51]),
        .O(wb_dat_o[51]));
  OBUF \wb_dat_o_OBUF[52]_inst 
       (.I(wb_dat_o_OBUF[52]),
        .O(wb_dat_o[52]));
  OBUF \wb_dat_o_OBUF[53]_inst 
       (.I(wb_dat_o_OBUF[53]),
        .O(wb_dat_o[53]));
  OBUF \wb_dat_o_OBUF[54]_inst 
       (.I(wb_dat_o_OBUF[54]),
        .O(wb_dat_o[54]));
  OBUF \wb_dat_o_OBUF[55]_inst 
       (.I(wb_dat_o_OBUF[55]),
        .O(wb_dat_o[55]));
  OBUF \wb_dat_o_OBUF[56]_inst 
       (.I(wb_dat_o_OBUF[56]),
        .O(wb_dat_o[56]));
  OBUF \wb_dat_o_OBUF[57]_inst 
       (.I(wb_dat_o_OBUF[57]),
        .O(wb_dat_o[57]));
  OBUF \wb_dat_o_OBUF[58]_inst 
       (.I(wb_dat_o_OBUF[58]),
        .O(wb_dat_o[58]));
  OBUF \wb_dat_o_OBUF[59]_inst 
       (.I(wb_dat_o_OBUF[59]),
        .O(wb_dat_o[59]));
  OBUF \wb_dat_o_OBUF[5]_inst 
       (.I(wb_dat_o_OBUF[5]),
        .O(wb_dat_o[5]));
  OBUF \wb_dat_o_OBUF[60]_inst 
       (.I(wb_dat_o_OBUF[60]),
        .O(wb_dat_o[60]));
  OBUF \wb_dat_o_OBUF[61]_inst 
       (.I(wb_dat_o_OBUF[61]),
        .O(wb_dat_o[61]));
  OBUF \wb_dat_o_OBUF[62]_inst 
       (.I(wb_dat_o_OBUF[62]),
        .O(wb_dat_o[62]));
  OBUF \wb_dat_o_OBUF[63]_inst 
       (.I(wb_dat_o_OBUF[63]),
        .O(wb_dat_o[63]));
  OBUF \wb_dat_o_OBUF[6]_inst 
       (.I(wb_dat_o_OBUF[6]),
        .O(wb_dat_o[6]));
  OBUF \wb_dat_o_OBUF[7]_inst 
       (.I(wb_dat_o_OBUF[7]),
        .O(wb_dat_o[7]));
  OBUF \wb_dat_o_OBUF[8]_inst 
       (.I(wb_dat_o_OBUF[8]),
        .O(wb_dat_o[8]));
  OBUF \wb_dat_o_OBUF[9]_inst 
       (.I(wb_dat_o_OBUF[9]),
        .O(wb_dat_o[9]));
  OBUF \wb_err_o_OBUF[0]_inst 
       (.I(wb_err_o_OBUF[0]),
        .O(wb_err_o[0]));
  OBUF \wb_err_o_OBUF[1]_inst 
       (.I(wb_err_o_OBUF[1]),
        .O(wb_err_o[1]));
  IBUF \wb_sel_i_IBUF[0]_inst 
       (.I(wb_sel_i[0]),
        .O(wb_sel_i_IBUF[0]));
  IBUF \wb_sel_i_IBUF[1]_inst 
       (.I(wb_sel_i[1]),
        .O(wb_sel_i_IBUF[1]));
  IBUF \wb_sel_i_IBUF[2]_inst 
       (.I(wb_sel_i[2]),
        .O(wb_sel_i_IBUF[2]));
  IBUF \wb_sel_i_IBUF[3]_inst 
       (.I(wb_sel_i[3]),
        .O(wb_sel_i_IBUF[3]));
  IBUF \wb_sel_i_IBUF[4]_inst 
       (.I(wb_sel_i[4]),
        .O(wb_sel_i_IBUF[4]));
  IBUF \wb_sel_i_IBUF[5]_inst 
       (.I(wb_sel_i[5]),
        .O(wb_sel_i_IBUF[5]));
  IBUF \wb_sel_i_IBUF[6]_inst 
       (.I(wb_sel_i[6]),
        .O(wb_sel_i_IBUF[6]));
  IBUF \wb_sel_i_IBUF[7]_inst 
       (.I(wb_sel_i[7]),
        .O(wb_sel_i_IBUF[7]));
  IBUF \wb_stb_i_IBUF[0]_inst 
       (.I(wb_stb_i[0]),
        .O(wb_stb_i_IBUF[0]));
  IBUF \wb_stb_i_IBUF[1]_inst 
       (.I(wb_stb_i[1]),
        .O(wb_stb_i_IBUF[1]));
  IBUF \wb_we_i_IBUF[0]_inst 
       (.I(wb_we_i[0]),
        .O(wb_we_i_IBUF[0]));
  IBUF \wb_we_i_IBUF[1]_inst 
       (.I(wb_we_i[1]),
        .O(wb_we_i_IBUF[1]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
