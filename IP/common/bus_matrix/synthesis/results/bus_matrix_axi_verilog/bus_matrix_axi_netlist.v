// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sat Dec 27 12:56:52 2025
// Host        : salvage running 64-bit unknown
// Command     : write_verilog -mode timesim -sdf_anno true -force results/bus_matrix_axi_verilog/bus_matrix_axi_netlist.v
// Design      : bus_matrix_axi
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module bus_matrix_arbiter
   (\GEN_AR_ARBITERS[0].r_state_reg ,
    s_rready_o_OBUF,
    \arready_o_OBUF[1]_inst_i_6_0 ,
    s_arvalid_o_OBUF,
    s_araddr_o_OBUF,
    rvalid_o_OBUF,
    arready_o_OBUF,
    rdata_o_OBUF,
    rresp_o_OBUF,
    \arready_o_OBUF[0]_inst_i_6_0 ,
    s_rvalid_i_IBUF,
    \GEN_AR_ARBITERS[0].r_state ,
    arvalid_i_IBUF,
    aclk_IBUF_BUFG,
    \gnt_o_reg[0]_0 ,
    s_arready_i_IBUF,
    araddr_i_IBUF,
    rready_i_IBUF,
    rvalid_err,
    s_rdata_i_IBUF,
    \rresp_o[2] ,
    s_rresp_i_IBUF,
    \rresp_o[1] );
  output \GEN_AR_ARBITERS[0].r_state_reg ;
  output [0:0]s_rready_o_OBUF;
  output \arready_o_OBUF[1]_inst_i_6_0 ;
  output [0:0]s_arvalid_o_OBUF;
  output [31:0]s_araddr_o_OBUF;
  output [1:0]rvalid_o_OBUF;
  output [1:0]arready_o_OBUF;
  output [63:0]rdata_o_OBUF;
  output [3:0]rresp_o_OBUF;
  output \arready_o_OBUF[0]_inst_i_6_0 ;
  input [0:0]s_rvalid_i_IBUF;
  input \GEN_AR_ARBITERS[0].r_state ;
  input [1:0]arvalid_i_IBUF;
  input aclk_IBUF_BUFG;
  input \gnt_o_reg[0]_0 ;
  input [0:0]s_arready_i_IBUF;
  input [63:0]araddr_i_IBUF;
  input [1:0]rready_i_IBUF;
  input [1:0]rvalid_err;
  input [31:0]s_rdata_i_IBUF;
  input \rresp_o[2] ;
  input [1:0]s_rresp_i_IBUF;
  input \rresp_o[1] ;

  wire \GEN_AR_ARBITERS[0].r_next ;
  wire \GEN_AR_ARBITERS[0].r_state ;
  wire \GEN_AR_ARBITERS[0].r_state_reg ;
  wire aclk_IBUF_BUFG;
  wire [63:0]araddr_i_IBUF;
  wire [1:0]arready_o_OBUF;
  wire \arready_o_OBUF[0]_inst_i_10_n_0 ;
  wire \arready_o_OBUF[0]_inst_i_3_n_0 ;
  wire \arready_o_OBUF[0]_inst_i_4_n_0 ;
  wire \arready_o_OBUF[0]_inst_i_5_n_0 ;
  wire \arready_o_OBUF[0]_inst_i_6_0 ;
  wire \arready_o_OBUF[0]_inst_i_6_n_0 ;
  wire \arready_o_OBUF[0]_inst_i_7_n_0 ;
  wire \arready_o_OBUF[0]_inst_i_8_n_0 ;
  wire \arready_o_OBUF[0]_inst_i_9_n_0 ;
  wire \arready_o_OBUF[1]_inst_i_10_n_0 ;
  wire \arready_o_OBUF[1]_inst_i_3_n_0 ;
  wire \arready_o_OBUF[1]_inst_i_4_n_0 ;
  wire \arready_o_OBUF[1]_inst_i_5_n_0 ;
  wire \arready_o_OBUF[1]_inst_i_6_0 ;
  wire \arready_o_OBUF[1]_inst_i_6_n_0 ;
  wire \arready_o_OBUF[1]_inst_i_7_n_0 ;
  wire \arready_o_OBUF[1]_inst_i_8_n_0 ;
  wire \arready_o_OBUF[1]_inst_i_9_n_0 ;
  wire [1:0]arvalid_i_IBUF;
  wire \gnt_o[0]_i_1_n_0 ;
  wire \gnt_o[1]_i_1_n_0 ;
  wire \gnt_o[1]_i_3__0_n_0 ;
  wire \gnt_o_reg[0]_0 ;
  wire [0:0]next_gnt;
  wire [63:0]rdata_o_OBUF;
  wire [1:0]rready_i_IBUF;
  wire \rresp_o[1] ;
  wire \rresp_o[2] ;
  wire [3:0]rresp_o_OBUF;
  wire [1:0]rvalid_err;
  wire [1:0]rvalid_o_OBUF;
  wire [31:0]s_araddr_o_OBUF;
  wire [0:0]s_arready_i_IBUF;
  wire [0:0]s_arvalid_o_OBUF;
  wire [31:0]s_rdata_i_IBUF;
  wire [0:0]s_rready_o_OBUF;
  wire [1:0]s_rresp_i_IBUF;
  wire [0:0]s_rvalid_i_IBUF;
  wire [1:0]\slave_ar_gnt_vector[0] ;

  LUT4 #(
    .INIT(16'hBAFA)) 
    \GEN_AR_ARBITERS[0].r_state_i_1 
       (.I0(\GEN_AR_ARBITERS[0].r_next ),
        .I1(s_rvalid_i_IBUF),
        .I2(\GEN_AR_ARBITERS[0].r_state ),
        .I3(s_rready_o_OBUF),
        .O(\GEN_AR_ARBITERS[0].r_state_reg ));
  LUT6 #(
    .INIT(64'h4044400040004000)) 
    \GEN_AR_ARBITERS[0].r_state_i_2 
       (.I0(\GEN_AR_ARBITERS[0].r_state ),
        .I1(s_arready_i_IBUF),
        .I2(arvalid_i_IBUF[1]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(arvalid_i_IBUF[0]),
        .I5(\slave_ar_gnt_vector[0] [0]),
        .O(\GEN_AR_ARBITERS[0].r_next ));
  LUT5 #(
    .INIT(32'h4F444444)) 
    \arready_o_OBUF[0]_inst_i_1 
       (.I0(\arready_o_OBUF[0]_inst_i_6_0 ),
        .I1(arvalid_i_IBUF[0]),
        .I2(rvalid_err[0]),
        .I3(\slave_ar_gnt_vector[0] [0]),
        .I4(s_arready_i_IBUF),
        .O(arready_o_OBUF[0]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \arready_o_OBUF[0]_inst_i_10 
       (.I0(araddr_i_IBUF[13]),
        .I1(araddr_i_IBUF[16]),
        .I2(araddr_i_IBUF[14]),
        .I3(araddr_i_IBUF[15]),
        .O(\arready_o_OBUF[0]_inst_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \arready_o_OBUF[0]_inst_i_2 
       (.I0(\arready_o_OBUF[0]_inst_i_3_n_0 ),
        .I1(\arready_o_OBUF[0]_inst_i_4_n_0 ),
        .I2(\arready_o_OBUF[0]_inst_i_5_n_0 ),
        .I3(\arready_o_OBUF[0]_inst_i_6_n_0 ),
        .O(\arready_o_OBUF[0]_inst_i_6_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \arready_o_OBUF[0]_inst_i_3 
       (.I0(araddr_i_IBUF[19]),
        .I1(araddr_i_IBUF[18]),
        .I2(araddr_i_IBUF[20]),
        .I3(araddr_i_IBUF[17]),
        .I4(\arready_o_OBUF[0]_inst_i_7_n_0 ),
        .O(\arready_o_OBUF[0]_inst_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \arready_o_OBUF[0]_inst_i_4 
       (.I0(araddr_i_IBUF[7]),
        .I1(araddr_i_IBUF[6]),
        .I2(araddr_i_IBUF[8]),
        .I3(araddr_i_IBUF[5]),
        .I4(\arready_o_OBUF[0]_inst_i_8_n_0 ),
        .O(\arready_o_OBUF[0]_inst_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \arready_o_OBUF[0]_inst_i_5 
       (.I0(araddr_i_IBUF[11]),
        .I1(araddr_i_IBUF[10]),
        .I2(araddr_i_IBUF[12]),
        .I3(araddr_i_IBUF[9]),
        .I4(\arready_o_OBUF[0]_inst_i_9_n_0 ),
        .O(\arready_o_OBUF[0]_inst_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \arready_o_OBUF[0]_inst_i_6 
       (.I0(araddr_i_IBUF[29]),
        .I1(araddr_i_IBUF[0]),
        .I2(araddr_i_IBUF[31]),
        .I3(araddr_i_IBUF[30]),
        .I4(\arready_o_OBUF[0]_inst_i_10_n_0 ),
        .O(\arready_o_OBUF[0]_inst_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \arready_o_OBUF[0]_inst_i_7 
       (.I0(araddr_i_IBUF[3]),
        .I1(araddr_i_IBUF[4]),
        .I2(araddr_i_IBUF[1]),
        .I3(araddr_i_IBUF[2]),
        .O(\arready_o_OBUF[0]_inst_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \arready_o_OBUF[0]_inst_i_8 
       (.I0(araddr_i_IBUF[21]),
        .I1(araddr_i_IBUF[24]),
        .I2(araddr_i_IBUF[22]),
        .I3(araddr_i_IBUF[23]),
        .O(\arready_o_OBUF[0]_inst_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \arready_o_OBUF[0]_inst_i_9 
       (.I0(araddr_i_IBUF[25]),
        .I1(araddr_i_IBUF[28]),
        .I2(araddr_i_IBUF[26]),
        .I3(araddr_i_IBUF[27]),
        .O(\arready_o_OBUF[0]_inst_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h4F444444)) 
    \arready_o_OBUF[1]_inst_i_1 
       (.I0(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I1(arvalid_i_IBUF[1]),
        .I2(rvalid_err[1]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_arready_i_IBUF),
        .O(arready_o_OBUF[1]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \arready_o_OBUF[1]_inst_i_10 
       (.I0(araddr_i_IBUF[45]),
        .I1(araddr_i_IBUF[48]),
        .I2(araddr_i_IBUF[46]),
        .I3(araddr_i_IBUF[47]),
        .O(\arready_o_OBUF[1]_inst_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \arready_o_OBUF[1]_inst_i_2 
       (.I0(\arready_o_OBUF[1]_inst_i_3_n_0 ),
        .I1(\arready_o_OBUF[1]_inst_i_4_n_0 ),
        .I2(\arready_o_OBUF[1]_inst_i_5_n_0 ),
        .I3(\arready_o_OBUF[1]_inst_i_6_n_0 ),
        .O(\arready_o_OBUF[1]_inst_i_6_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \arready_o_OBUF[1]_inst_i_3 
       (.I0(araddr_i_IBUF[51]),
        .I1(araddr_i_IBUF[50]),
        .I2(araddr_i_IBUF[52]),
        .I3(araddr_i_IBUF[49]),
        .I4(\arready_o_OBUF[1]_inst_i_7_n_0 ),
        .O(\arready_o_OBUF[1]_inst_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \arready_o_OBUF[1]_inst_i_4 
       (.I0(araddr_i_IBUF[39]),
        .I1(araddr_i_IBUF[38]),
        .I2(araddr_i_IBUF[40]),
        .I3(araddr_i_IBUF[37]),
        .I4(\arready_o_OBUF[1]_inst_i_8_n_0 ),
        .O(\arready_o_OBUF[1]_inst_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \arready_o_OBUF[1]_inst_i_5 
       (.I0(araddr_i_IBUF[43]),
        .I1(araddr_i_IBUF[42]),
        .I2(araddr_i_IBUF[44]),
        .I3(araddr_i_IBUF[41]),
        .I4(\arready_o_OBUF[1]_inst_i_9_n_0 ),
        .O(\arready_o_OBUF[1]_inst_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \arready_o_OBUF[1]_inst_i_6 
       (.I0(araddr_i_IBUF[61]),
        .I1(araddr_i_IBUF[32]),
        .I2(araddr_i_IBUF[63]),
        .I3(araddr_i_IBUF[62]),
        .I4(\arready_o_OBUF[1]_inst_i_10_n_0 ),
        .O(\arready_o_OBUF[1]_inst_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \arready_o_OBUF[1]_inst_i_7 
       (.I0(araddr_i_IBUF[35]),
        .I1(araddr_i_IBUF[36]),
        .I2(araddr_i_IBUF[33]),
        .I3(araddr_i_IBUF[34]),
        .O(\arready_o_OBUF[1]_inst_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \arready_o_OBUF[1]_inst_i_8 
       (.I0(araddr_i_IBUF[53]),
        .I1(araddr_i_IBUF[56]),
        .I2(araddr_i_IBUF[54]),
        .I3(araddr_i_IBUF[55]),
        .O(\arready_o_OBUF[1]_inst_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \arready_o_OBUF[1]_inst_i_9 
       (.I0(araddr_i_IBUF[57]),
        .I1(araddr_i_IBUF[60]),
        .I2(araddr_i_IBUF[58]),
        .I3(araddr_i_IBUF[59]),
        .O(\arready_o_OBUF[1]_inst_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \gnt_o[0]_i_1 
       (.I0(next_gnt),
        .I1(\gnt_o[1]_i_3__0_n_0 ),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .O(\gnt_o[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h08FF0800)) 
    \gnt_o[1]_i_1 
       (.I0(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I1(arvalid_i_IBUF[1]),
        .I2(next_gnt),
        .I3(\gnt_o[1]_i_3__0_n_0 ),
        .I4(\slave_ar_gnt_vector[0] [1]),
        .O(\gnt_o[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000200)) 
    \gnt_o[1]_i_2__0 
       (.I0(arvalid_i_IBUF[0]),
        .I1(\arready_o_OBUF[0]_inst_i_6_n_0 ),
        .I2(\arready_o_OBUF[0]_inst_i_5_n_0 ),
        .I3(\arready_o_OBUF[0]_inst_i_4_n_0 ),
        .I4(\arready_o_OBUF[0]_inst_i_3_n_0 ),
        .O(next_gnt));
  LUT6 #(
    .INIT(64'h00550055CFDDCFFF)) 
    \gnt_o[1]_i_3__0 
       (.I0(\slave_ar_gnt_vector[0] [0]),
        .I1(s_arready_i_IBUF),
        .I2(arvalid_i_IBUF[1]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(arvalid_i_IBUF[0]),
        .I5(\GEN_AR_ARBITERS[0].r_state ),
        .O(\gnt_o[1]_i_3__0_n_0 ));
  FDCE \gnt_o_reg[0] 
       (.C(aclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\gnt_o_reg[0]_0 ),
        .D(\gnt_o[0]_i_1_n_0 ),
        .Q(\slave_ar_gnt_vector[0] [0]));
  FDCE \gnt_o_reg[1] 
       (.C(aclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\gnt_o_reg[0]_0 ),
        .D(\gnt_o[1]_i_1_n_0 ),
        .Q(\slave_ar_gnt_vector[0] [1]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[0]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[0]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[0]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[10]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[10]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[10]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[11]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[11]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[11]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[12]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[12]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[12]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[13]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[13]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[13]));
  LUT5 #(
    .INIT(32'h20200020)) 
    \rdata_o_OBUF[14]_inst_i_1 
       (.I0(s_rdata_i_IBUF[14]),
        .I1(rvalid_err[0]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[14]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[15]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[15]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[15]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[16]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[16]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[16]));
  LUT5 #(
    .INIT(32'h20200020)) 
    \rdata_o_OBUF[17]_inst_i_1 
       (.I0(s_rdata_i_IBUF[17]),
        .I1(rvalid_err[0]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[17]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[18]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[18]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[18]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[19]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[19]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[19]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[1]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[1]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[1]));
  LUT5 #(
    .INIT(32'h20200020)) 
    \rdata_o_OBUF[20]_inst_i_1 
       (.I0(s_rdata_i_IBUF[20]),
        .I1(rvalid_err[0]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[20]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[21]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[21]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[21]));
  LUT5 #(
    .INIT(32'h20200020)) 
    \rdata_o_OBUF[22]_inst_i_1 
       (.I0(s_rdata_i_IBUF[22]),
        .I1(rvalid_err[0]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[22]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[23]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[23]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[23]));
  LUT5 #(
    .INIT(32'h20200020)) 
    \rdata_o_OBUF[24]_inst_i_1 
       (.I0(s_rdata_i_IBUF[24]),
        .I1(rvalid_err[0]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[24]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[25]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[25]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[25]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[26]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[26]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[26]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[27]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[27]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[27]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[28]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[28]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[28]));
  LUT5 #(
    .INIT(32'h20200020)) 
    \rdata_o_OBUF[29]_inst_i_1 
       (.I0(s_rdata_i_IBUF[29]),
        .I1(rvalid_err[0]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[29]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[2]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[2]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[2]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[30]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[30]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[30]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[31]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[31]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[31]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[32]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[0]),
        .O(rdata_o_OBUF[32]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[33]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[1]),
        .O(rdata_o_OBUF[33]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[34]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[2]),
        .O(rdata_o_OBUF[34]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[35]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[3]),
        .O(rdata_o_OBUF[35]));
  LUT5 #(
    .INIT(32'h20200020)) 
    \rdata_o_OBUF[36]_inst_i_1 
       (.I0(s_rdata_i_IBUF[4]),
        .I1(rvalid_err[1]),
        .I2(\slave_ar_gnt_vector[0] [1]),
        .I3(arvalid_i_IBUF[1]),
        .I4(\arready_o_OBUF[1]_inst_i_6_0 ),
        .O(rdata_o_OBUF[36]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[37]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[5]),
        .O(rdata_o_OBUF[37]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[38]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[6]),
        .O(rdata_o_OBUF[38]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[39]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[7]),
        .O(rdata_o_OBUF[39]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[3]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[3]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[3]));
  LUT5 #(
    .INIT(32'h20200020)) 
    \rdata_o_OBUF[40]_inst_i_1 
       (.I0(s_rdata_i_IBUF[8]),
        .I1(rvalid_err[1]),
        .I2(\slave_ar_gnt_vector[0] [1]),
        .I3(arvalid_i_IBUF[1]),
        .I4(\arready_o_OBUF[1]_inst_i_6_0 ),
        .O(rdata_o_OBUF[40]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[41]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[9]),
        .O(rdata_o_OBUF[41]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[42]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[10]),
        .O(rdata_o_OBUF[42]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[43]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[11]),
        .O(rdata_o_OBUF[43]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[44]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[12]),
        .O(rdata_o_OBUF[44]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[45]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[13]),
        .O(rdata_o_OBUF[45]));
  LUT5 #(
    .INIT(32'h20200020)) 
    \rdata_o_OBUF[46]_inst_i_1 
       (.I0(s_rdata_i_IBUF[14]),
        .I1(rvalid_err[1]),
        .I2(\slave_ar_gnt_vector[0] [1]),
        .I3(arvalid_i_IBUF[1]),
        .I4(\arready_o_OBUF[1]_inst_i_6_0 ),
        .O(rdata_o_OBUF[46]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[47]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[15]),
        .O(rdata_o_OBUF[47]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[48]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[16]),
        .O(rdata_o_OBUF[48]));
  LUT5 #(
    .INIT(32'h20200020)) 
    \rdata_o_OBUF[49]_inst_i_1 
       (.I0(s_rdata_i_IBUF[17]),
        .I1(rvalid_err[1]),
        .I2(\slave_ar_gnt_vector[0] [1]),
        .I3(arvalid_i_IBUF[1]),
        .I4(\arready_o_OBUF[1]_inst_i_6_0 ),
        .O(rdata_o_OBUF[49]));
  LUT5 #(
    .INIT(32'h20200020)) 
    \rdata_o_OBUF[4]_inst_i_1 
       (.I0(s_rdata_i_IBUF[4]),
        .I1(rvalid_err[0]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[4]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[50]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[18]),
        .O(rdata_o_OBUF[50]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[51]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[19]),
        .O(rdata_o_OBUF[51]));
  LUT5 #(
    .INIT(32'h20200020)) 
    \rdata_o_OBUF[52]_inst_i_1 
       (.I0(s_rdata_i_IBUF[20]),
        .I1(rvalid_err[1]),
        .I2(\slave_ar_gnt_vector[0] [1]),
        .I3(arvalid_i_IBUF[1]),
        .I4(\arready_o_OBUF[1]_inst_i_6_0 ),
        .O(rdata_o_OBUF[52]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[53]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[21]),
        .O(rdata_o_OBUF[53]));
  LUT5 #(
    .INIT(32'h20200020)) 
    \rdata_o_OBUF[54]_inst_i_1 
       (.I0(s_rdata_i_IBUF[22]),
        .I1(rvalid_err[1]),
        .I2(\slave_ar_gnt_vector[0] [1]),
        .I3(arvalid_i_IBUF[1]),
        .I4(\arready_o_OBUF[1]_inst_i_6_0 ),
        .O(rdata_o_OBUF[54]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[55]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[23]),
        .O(rdata_o_OBUF[55]));
  LUT5 #(
    .INIT(32'h20200020)) 
    \rdata_o_OBUF[56]_inst_i_1 
       (.I0(s_rdata_i_IBUF[24]),
        .I1(rvalid_err[1]),
        .I2(\slave_ar_gnt_vector[0] [1]),
        .I3(arvalid_i_IBUF[1]),
        .I4(\arready_o_OBUF[1]_inst_i_6_0 ),
        .O(rdata_o_OBUF[56]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[57]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[25]),
        .O(rdata_o_OBUF[57]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[58]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[26]),
        .O(rdata_o_OBUF[58]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[59]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[27]),
        .O(rdata_o_OBUF[59]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[5]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[5]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[5]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[60]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[28]),
        .O(rdata_o_OBUF[60]));
  LUT5 #(
    .INIT(32'h20200020)) 
    \rdata_o_OBUF[61]_inst_i_1 
       (.I0(s_rdata_i_IBUF[29]),
        .I1(rvalid_err[1]),
        .I2(\slave_ar_gnt_vector[0] [1]),
        .I3(arvalid_i_IBUF[1]),
        .I4(\arready_o_OBUF[1]_inst_i_6_0 ),
        .O(rdata_o_OBUF[61]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[62]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[30]),
        .O(rdata_o_OBUF[62]));
  LUT5 #(
    .INIT(32'hFBAAAAAA)) 
    \rdata_o_OBUF[63]_inst_i_1 
       (.I0(rvalid_err[1]),
        .I1(arvalid_i_IBUF[1]),
        .I2(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rdata_i_IBUF[31]),
        .O(rdata_o_OBUF[63]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[6]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[6]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[6]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[7]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[7]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[7]));
  LUT5 #(
    .INIT(32'h20200020)) 
    \rdata_o_OBUF[8]_inst_i_1 
       (.I0(s_rdata_i_IBUF[8]),
        .I1(rvalid_err[0]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[8]));
  LUT5 #(
    .INIT(32'hEAEAAAEA)) 
    \rdata_o_OBUF[9]_inst_i_1 
       (.I0(rvalid_err[0]),
        .I1(\slave_ar_gnt_vector[0] [0]),
        .I2(s_rdata_i_IBUF[9]),
        .I3(arvalid_i_IBUF[0]),
        .I4(\arready_o_OBUF[0]_inst_i_6_0 ),
        .O(rdata_o_OBUF[9]));
  LUT6 #(
    .INIT(64'hFFFFBAFF00008A00)) 
    \rresp_o_OBUF[0]_inst_i_1 
       (.I0(s_rresp_i_IBUF[0]),
        .I1(\arready_o_OBUF[0]_inst_i_6_0 ),
        .I2(arvalid_i_IBUF[0]),
        .I3(\slave_ar_gnt_vector[0] [0]),
        .I4(rvalid_err[0]),
        .I5(\rresp_o[1] ),
        .O(rresp_o_OBUF[0]));
  LUT6 #(
    .INIT(64'hFFFFBAFF00008A00)) 
    \rresp_o_OBUF[1]_inst_i_1 
       (.I0(s_rresp_i_IBUF[1]),
        .I1(\arready_o_OBUF[0]_inst_i_6_0 ),
        .I2(arvalid_i_IBUF[0]),
        .I3(\slave_ar_gnt_vector[0] [0]),
        .I4(rvalid_err[0]),
        .I5(\rresp_o[1] ),
        .O(rresp_o_OBUF[1]));
  LUT6 #(
    .INIT(64'hAAAAEFAAAAAA20AA)) 
    \rresp_o_OBUF[2]_inst_i_1 
       (.I0(\rresp_o[2] ),
        .I1(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I2(arvalid_i_IBUF[1]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(rvalid_err[1]),
        .I5(s_rresp_i_IBUF[0]),
        .O(rresp_o_OBUF[2]));
  LUT6 #(
    .INIT(64'hAAAAEFAAAAAA20AA)) 
    \rresp_o_OBUF[3]_inst_i_1 
       (.I0(\rresp_o[2] ),
        .I1(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I2(arvalid_i_IBUF[1]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(rvalid_err[1]),
        .I5(s_rresp_i_IBUF[1]),
        .O(rresp_o_OBUF[3]));
  LUT5 #(
    .INIT(32'hFDF0F0F0)) 
    \rvalid_o_OBUF[0]_inst_i_1 
       (.I0(arvalid_i_IBUF[0]),
        .I1(\arready_o_OBUF[0]_inst_i_6_0 ),
        .I2(rvalid_err[0]),
        .I3(\slave_ar_gnt_vector[0] [0]),
        .I4(s_rvalid_i_IBUF),
        .O(rvalid_o_OBUF[0]));
  LUT5 #(
    .INIT(32'hFDF0F0F0)) 
    \rvalid_o_OBUF[1]_inst_i_1 
       (.I0(arvalid_i_IBUF[1]),
        .I1(\arready_o_OBUF[1]_inst_i_6_0 ),
        .I2(rvalid_err[1]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .I4(s_rvalid_i_IBUF),
        .O(rvalid_o_OBUF[1]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[0]_inst_i_1 
       (.I0(araddr_i_IBUF[0]),
        .I1(araddr_i_IBUF[32]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[0]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[10]_inst_i_1 
       (.I0(araddr_i_IBUF[10]),
        .I1(araddr_i_IBUF[42]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[10]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[11]_inst_i_1 
       (.I0(araddr_i_IBUF[11]),
        .I1(araddr_i_IBUF[43]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[11]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[12]_inst_i_1 
       (.I0(araddr_i_IBUF[12]),
        .I1(araddr_i_IBUF[44]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[12]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[13]_inst_i_1 
       (.I0(araddr_i_IBUF[13]),
        .I1(araddr_i_IBUF[45]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[13]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[14]_inst_i_1 
       (.I0(araddr_i_IBUF[14]),
        .I1(araddr_i_IBUF[46]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[14]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[15]_inst_i_1 
       (.I0(araddr_i_IBUF[15]),
        .I1(araddr_i_IBUF[47]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[15]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[16]_inst_i_1 
       (.I0(araddr_i_IBUF[16]),
        .I1(araddr_i_IBUF[48]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[16]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[17]_inst_i_1 
       (.I0(araddr_i_IBUF[17]),
        .I1(araddr_i_IBUF[49]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[17]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[18]_inst_i_1 
       (.I0(araddr_i_IBUF[18]),
        .I1(araddr_i_IBUF[50]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[18]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[19]_inst_i_1 
       (.I0(araddr_i_IBUF[19]),
        .I1(araddr_i_IBUF[51]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[19]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[1]_inst_i_1 
       (.I0(araddr_i_IBUF[1]),
        .I1(araddr_i_IBUF[33]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[1]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[20]_inst_i_1 
       (.I0(araddr_i_IBUF[20]),
        .I1(araddr_i_IBUF[52]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[20]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[21]_inst_i_1 
       (.I0(araddr_i_IBUF[21]),
        .I1(araddr_i_IBUF[53]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[21]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[22]_inst_i_1 
       (.I0(araddr_i_IBUF[22]),
        .I1(araddr_i_IBUF[54]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[22]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[23]_inst_i_1 
       (.I0(araddr_i_IBUF[23]),
        .I1(araddr_i_IBUF[55]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[23]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[24]_inst_i_1 
       (.I0(araddr_i_IBUF[24]),
        .I1(araddr_i_IBUF[56]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[24]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[25]_inst_i_1 
       (.I0(araddr_i_IBUF[25]),
        .I1(araddr_i_IBUF[57]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[25]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[26]_inst_i_1 
       (.I0(araddr_i_IBUF[26]),
        .I1(araddr_i_IBUF[58]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[26]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[27]_inst_i_1 
       (.I0(araddr_i_IBUF[27]),
        .I1(araddr_i_IBUF[59]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[27]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[28]_inst_i_1 
       (.I0(araddr_i_IBUF[28]),
        .I1(araddr_i_IBUF[60]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[28]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[29]_inst_i_1 
       (.I0(araddr_i_IBUF[29]),
        .I1(araddr_i_IBUF[61]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[29]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[2]_inst_i_1 
       (.I0(araddr_i_IBUF[2]),
        .I1(araddr_i_IBUF[34]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[2]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[30]_inst_i_1 
       (.I0(araddr_i_IBUF[30]),
        .I1(araddr_i_IBUF[62]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[30]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[31]_inst_i_1 
       (.I0(araddr_i_IBUF[31]),
        .I1(araddr_i_IBUF[63]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[31]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[3]_inst_i_1 
       (.I0(araddr_i_IBUF[3]),
        .I1(araddr_i_IBUF[35]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[3]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[4]_inst_i_1 
       (.I0(araddr_i_IBUF[4]),
        .I1(araddr_i_IBUF[36]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[4]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[5]_inst_i_1 
       (.I0(araddr_i_IBUF[5]),
        .I1(araddr_i_IBUF[37]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[5]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[6]_inst_i_1 
       (.I0(araddr_i_IBUF[6]),
        .I1(araddr_i_IBUF[38]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[6]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[7]_inst_i_1 
       (.I0(araddr_i_IBUF[7]),
        .I1(araddr_i_IBUF[39]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[7]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[8]_inst_i_1 
       (.I0(araddr_i_IBUF[8]),
        .I1(araddr_i_IBUF[40]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[8]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_araddr_o_OBUF[9]_inst_i_1 
       (.I0(araddr_i_IBUF[9]),
        .I1(araddr_i_IBUF[41]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_araddr_o_OBUF[9]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_arvalid_o_OBUF[0]_inst_i_1 
       (.I0(arvalid_i_IBUF[1]),
        .I1(\slave_ar_gnt_vector[0] [1]),
        .I2(arvalid_i_IBUF[0]),
        .I3(\slave_ar_gnt_vector[0] [0]),
        .O(s_arvalid_o_OBUF));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_rready_o_OBUF[0]_inst_i_1 
       (.I0(rready_i_IBUF[0]),
        .I1(rready_i_IBUF[1]),
        .I2(\slave_ar_gnt_vector[0] [0]),
        .I3(\slave_ar_gnt_vector[0] [1]),
        .O(s_rready_o_OBUF));
endmodule

(* ORIG_REF_NAME = "bus_matrix_arbiter" *) 
module bus_matrix_arbiter_0
   (\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[1] ,
    \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[0] ,
    \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[2] ,
    aresetn,
    \awready_o_OBUF[1]_inst_i_6_0 ,
    s_wvalid_o_OBUF,
    s_awvalid_o_OBUF,
    s_awaddr_o_OBUF,
    s_bready_o_OBUF,
    bvalid_o_OBUF,
    awready_o_OBUF,
    wready_o_OBUF,
    bresp_o_OBUF,
    \awready_o_OBUF[0]_inst_i_6_0 ,
    s_awprot_o_OBUF,
    s_wstrb_o_OBUF,
    s_wdata_o_OBUF,
    \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[2]_0 ,
    \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[2]_1 ,
    \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[1]_0 ,
    aresetn_IBUF,
    awvalid_i_IBUF,
    aclk_IBUF_BUFG,
    s_wready_i_IBUF,
    s_awready_i_IBUF,
    awaddr_i_IBUF,
    bready_i_IBUF,
    s_bvalid_i_IBUF,
    bvalid_err,
    \bresp_o[2] ,
    s_bresp_i_IBUF,
    \bresp_o[0] ,
    wvalid_i_IBUF,
    awprot_i_IBUF,
    wstrb_i_IBUF,
    wdata_i_IBUF);
  output \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[1] ;
  output \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[0] ;
  output \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[2] ;
  output aresetn;
  output \awready_o_OBUF[1]_inst_i_6_0 ;
  output [0:0]s_wvalid_o_OBUF;
  output [0:0]s_awvalid_o_OBUF;
  output [31:0]s_awaddr_o_OBUF;
  output [0:0]s_bready_o_OBUF;
  output [1:0]bvalid_o_OBUF;
  output [1:0]awready_o_OBUF;
  output [1:0]wready_o_OBUF;
  output [3:0]bresp_o_OBUF;
  output \awready_o_OBUF[0]_inst_i_6_0 ;
  output [2:0]s_awprot_o_OBUF;
  output [3:0]s_wstrb_o_OBUF;
  output [31:0]s_wdata_o_OBUF;
  input \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[2]_0 ;
  input \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[2]_1 ;
  input \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[1]_0 ;
  input aresetn_IBUF;
  input [1:0]awvalid_i_IBUF;
  input aclk_IBUF_BUFG;
  input [0:0]s_wready_i_IBUF;
  input [0:0]s_awready_i_IBUF;
  input [63:0]awaddr_i_IBUF;
  input [1:0]bready_i_IBUF;
  input [0:0]s_bvalid_i_IBUF;
  input [1:0]bvalid_err;
  input \bresp_o[2] ;
  input [1:0]s_bresp_i_IBUF;
  input \bresp_o[0] ;
  input [1:0]wvalid_i_IBUF;
  input [5:0]awprot_i_IBUF;
  input [7:0]wstrb_i_IBUF;
  input [63:0]wdata_i_IBUF;

  wire \FSM_onehot_GEN_AW_ARBITERS[0].lock_state[2]_i_3_n_0 ;
  wire \FSM_onehot_GEN_AW_ARBITERS[0].lock_state[2]_i_4_n_0 ;
  wire \FSM_onehot_GEN_AW_ARBITERS[0].lock_state[2]_i_5_n_0 ;
  wire \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[0] ;
  wire \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[1] ;
  wire \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[1]_0 ;
  wire \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[2] ;
  wire \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[2]_0 ;
  wire \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[2]_1 ;
  wire aclk_IBUF_BUFG;
  wire aresetn;
  wire aresetn_IBUF;
  wire [63:0]awaddr_i_IBUF;
  wire [5:0]awprot_i_IBUF;
  wire [1:0]awready_o_OBUF;
  wire \awready_o_OBUF[0]_inst_i_10_n_0 ;
  wire \awready_o_OBUF[0]_inst_i_3_n_0 ;
  wire \awready_o_OBUF[0]_inst_i_4_n_0 ;
  wire \awready_o_OBUF[0]_inst_i_5_n_0 ;
  wire \awready_o_OBUF[0]_inst_i_6_0 ;
  wire \awready_o_OBUF[0]_inst_i_6_n_0 ;
  wire \awready_o_OBUF[0]_inst_i_7_n_0 ;
  wire \awready_o_OBUF[0]_inst_i_8_n_0 ;
  wire \awready_o_OBUF[0]_inst_i_9_n_0 ;
  wire \awready_o_OBUF[1]_inst_i_10_n_0 ;
  wire \awready_o_OBUF[1]_inst_i_3_n_0 ;
  wire \awready_o_OBUF[1]_inst_i_4_n_0 ;
  wire \awready_o_OBUF[1]_inst_i_5_n_0 ;
  wire \awready_o_OBUF[1]_inst_i_6_0 ;
  wire \awready_o_OBUF[1]_inst_i_6_n_0 ;
  wire \awready_o_OBUF[1]_inst_i_7_n_0 ;
  wire \awready_o_OBUF[1]_inst_i_8_n_0 ;
  wire \awready_o_OBUF[1]_inst_i_9_n_0 ;
  wire [1:0]awvalid_i_IBUF;
  wire [1:0]bready_i_IBUF;
  wire \bresp_o[0] ;
  wire \bresp_o[2] ;
  wire [3:0]bresp_o_OBUF;
  wire [1:0]bvalid_err;
  wire [1:0]bvalid_o_OBUF;
  wire \gnt_o[0]_i_1_n_0 ;
  wire \gnt_o[1]_i_1_n_0 ;
  wire \gnt_o[1]_i_3_n_0 ;
  wire [0:0]next_gnt;
  wire [31:0]s_awaddr_o_OBUF;
  wire [2:0]s_awprot_o_OBUF;
  wire [0:0]s_awready_i_IBUF;
  wire [0:0]s_awvalid_o_OBUF;
  wire [0:0]s_bready_o_OBUF;
  wire [1:0]s_bresp_i_IBUF;
  wire [0:0]s_bvalid_i_IBUF;
  wire [31:0]s_wdata_o_OBUF;
  wire [0:0]s_wready_i_IBUF;
  wire [3:0]s_wstrb_o_OBUF;
  wire [0:0]s_wvalid_o_OBUF;
  wire [1:0]\slave_aw_gnt_vector[0] ;
  wire [63:0]wdata_i_IBUF;
  wire [1:0]wready_o_OBUF;
  wire [7:0]wstrb_i_IBUF;
  wire [1:0]wvalid_i_IBUF;

  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_onehot_GEN_AW_ARBITERS[0].lock_state[0]_i_1 
       (.I0(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[2]_1 ),
        .I1(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state[2]_i_3_n_0 ),
        .I2(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[1]_0 ),
        .O(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_onehot_GEN_AW_ARBITERS[0].lock_state[1]_i_1 
       (.I0(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[1]_0 ),
        .I1(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state[2]_i_3_n_0 ),
        .I2(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[2]_0 ),
        .O(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_onehot_GEN_AW_ARBITERS[0].lock_state[2]_i_1 
       (.I0(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[2]_0 ),
        .I1(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state[2]_i_3_n_0 ),
        .I2(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[2]_1 ),
        .O(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[1] ));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_GEN_AW_ARBITERS[0].lock_state[2]_i_2 
       (.I0(aresetn_IBUF),
        .O(aresetn));
  LUT5 #(
    .INIT(32'hFFFFFF80)) 
    \FSM_onehot_GEN_AW_ARBITERS[0].lock_state[2]_i_3 
       (.I0(s_wready_i_IBUF),
        .I1(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[2]_0 ),
        .I2(s_wvalid_o_OBUF),
        .I3(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state[2]_i_4_n_0 ),
        .I4(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state[2]_i_5_n_0 ),
        .O(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8088800080008000)) 
    \FSM_onehot_GEN_AW_ARBITERS[0].lock_state[2]_i_4 
       (.I0(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[1]_0 ),
        .I1(s_awready_i_IBUF),
        .I2(awvalid_i_IBUF[1]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .I4(awvalid_i_IBUF[0]),
        .I5(\slave_aw_gnt_vector[0] [0]),
        .O(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hE4A0000000000000)) 
    \FSM_onehot_GEN_AW_ARBITERS[0].lock_state[2]_i_5 
       (.I0(\slave_aw_gnt_vector[0] [1]),
        .I1(\slave_aw_gnt_vector[0] [0]),
        .I2(bready_i_IBUF[1]),
        .I3(bready_i_IBUF[0]),
        .I4(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[2]_1 ),
        .I5(s_bvalid_i_IBUF),
        .O(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state[2]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h8F888888)) 
    \awready_o_OBUF[0]_inst_i_1 
       (.I0(\awready_o_OBUF[0]_inst_i_6_0 ),
        .I1(awvalid_i_IBUF[0]),
        .I2(bvalid_err[0]),
        .I3(\slave_aw_gnt_vector[0] [0]),
        .I4(s_awready_i_IBUF),
        .O(awready_o_OBUF[0]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \awready_o_OBUF[0]_inst_i_10 
       (.I0(awaddr_i_IBUF[13]),
        .I1(awaddr_i_IBUF[16]),
        .I2(awaddr_i_IBUF[14]),
        .I3(awaddr_i_IBUF[15]),
        .O(\awready_o_OBUF[0]_inst_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \awready_o_OBUF[0]_inst_i_2 
       (.I0(\awready_o_OBUF[0]_inst_i_3_n_0 ),
        .I1(\awready_o_OBUF[0]_inst_i_4_n_0 ),
        .I2(\awready_o_OBUF[0]_inst_i_5_n_0 ),
        .I3(\awready_o_OBUF[0]_inst_i_6_n_0 ),
        .O(\awready_o_OBUF[0]_inst_i_6_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \awready_o_OBUF[0]_inst_i_3 
       (.I0(awaddr_i_IBUF[19]),
        .I1(awaddr_i_IBUF[18]),
        .I2(awaddr_i_IBUF[20]),
        .I3(awaddr_i_IBUF[17]),
        .I4(\awready_o_OBUF[0]_inst_i_7_n_0 ),
        .O(\awready_o_OBUF[0]_inst_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \awready_o_OBUF[0]_inst_i_4 
       (.I0(awaddr_i_IBUF[7]),
        .I1(awaddr_i_IBUF[6]),
        .I2(awaddr_i_IBUF[8]),
        .I3(awaddr_i_IBUF[5]),
        .I4(\awready_o_OBUF[0]_inst_i_8_n_0 ),
        .O(\awready_o_OBUF[0]_inst_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \awready_o_OBUF[0]_inst_i_5 
       (.I0(awaddr_i_IBUF[11]),
        .I1(awaddr_i_IBUF[10]),
        .I2(awaddr_i_IBUF[12]),
        .I3(awaddr_i_IBUF[9]),
        .I4(\awready_o_OBUF[0]_inst_i_9_n_0 ),
        .O(\awready_o_OBUF[0]_inst_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \awready_o_OBUF[0]_inst_i_6 
       (.I0(awaddr_i_IBUF[29]),
        .I1(awaddr_i_IBUF[0]),
        .I2(awaddr_i_IBUF[31]),
        .I3(awaddr_i_IBUF[30]),
        .I4(\awready_o_OBUF[0]_inst_i_10_n_0 ),
        .O(\awready_o_OBUF[0]_inst_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \awready_o_OBUF[0]_inst_i_7 
       (.I0(awaddr_i_IBUF[3]),
        .I1(awaddr_i_IBUF[4]),
        .I2(awaddr_i_IBUF[1]),
        .I3(awaddr_i_IBUF[2]),
        .O(\awready_o_OBUF[0]_inst_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \awready_o_OBUF[0]_inst_i_8 
       (.I0(awaddr_i_IBUF[21]),
        .I1(awaddr_i_IBUF[24]),
        .I2(awaddr_i_IBUF[22]),
        .I3(awaddr_i_IBUF[23]),
        .O(\awready_o_OBUF[0]_inst_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \awready_o_OBUF[0]_inst_i_9 
       (.I0(awaddr_i_IBUF[25]),
        .I1(awaddr_i_IBUF[28]),
        .I2(awaddr_i_IBUF[26]),
        .I3(awaddr_i_IBUF[27]),
        .O(\awready_o_OBUF[0]_inst_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h4F444444)) 
    \awready_o_OBUF[1]_inst_i_1 
       (.I0(\awready_o_OBUF[1]_inst_i_6_0 ),
        .I1(awvalid_i_IBUF[1]),
        .I2(bvalid_err[1]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .I4(s_awready_i_IBUF),
        .O(awready_o_OBUF[1]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \awready_o_OBUF[1]_inst_i_10 
       (.I0(awaddr_i_IBUF[45]),
        .I1(awaddr_i_IBUF[48]),
        .I2(awaddr_i_IBUF[46]),
        .I3(awaddr_i_IBUF[47]),
        .O(\awready_o_OBUF[1]_inst_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \awready_o_OBUF[1]_inst_i_2 
       (.I0(\awready_o_OBUF[1]_inst_i_3_n_0 ),
        .I1(\awready_o_OBUF[1]_inst_i_4_n_0 ),
        .I2(\awready_o_OBUF[1]_inst_i_5_n_0 ),
        .I3(\awready_o_OBUF[1]_inst_i_6_n_0 ),
        .O(\awready_o_OBUF[1]_inst_i_6_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \awready_o_OBUF[1]_inst_i_3 
       (.I0(awaddr_i_IBUF[51]),
        .I1(awaddr_i_IBUF[50]),
        .I2(awaddr_i_IBUF[52]),
        .I3(awaddr_i_IBUF[49]),
        .I4(\awready_o_OBUF[1]_inst_i_7_n_0 ),
        .O(\awready_o_OBUF[1]_inst_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \awready_o_OBUF[1]_inst_i_4 
       (.I0(awaddr_i_IBUF[39]),
        .I1(awaddr_i_IBUF[38]),
        .I2(awaddr_i_IBUF[40]),
        .I3(awaddr_i_IBUF[37]),
        .I4(\awready_o_OBUF[1]_inst_i_8_n_0 ),
        .O(\awready_o_OBUF[1]_inst_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \awready_o_OBUF[1]_inst_i_5 
       (.I0(awaddr_i_IBUF[43]),
        .I1(awaddr_i_IBUF[42]),
        .I2(awaddr_i_IBUF[44]),
        .I3(awaddr_i_IBUF[41]),
        .I4(\awready_o_OBUF[1]_inst_i_9_n_0 ),
        .O(\awready_o_OBUF[1]_inst_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \awready_o_OBUF[1]_inst_i_6 
       (.I0(awaddr_i_IBUF[61]),
        .I1(awaddr_i_IBUF[32]),
        .I2(awaddr_i_IBUF[63]),
        .I3(awaddr_i_IBUF[62]),
        .I4(\awready_o_OBUF[1]_inst_i_10_n_0 ),
        .O(\awready_o_OBUF[1]_inst_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \awready_o_OBUF[1]_inst_i_7 
       (.I0(awaddr_i_IBUF[35]),
        .I1(awaddr_i_IBUF[36]),
        .I2(awaddr_i_IBUF[33]),
        .I3(awaddr_i_IBUF[34]),
        .O(\awready_o_OBUF[1]_inst_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \awready_o_OBUF[1]_inst_i_8 
       (.I0(awaddr_i_IBUF[53]),
        .I1(awaddr_i_IBUF[56]),
        .I2(awaddr_i_IBUF[54]),
        .I3(awaddr_i_IBUF[55]),
        .O(\awready_o_OBUF[1]_inst_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \awready_o_OBUF[1]_inst_i_9 
       (.I0(awaddr_i_IBUF[57]),
        .I1(awaddr_i_IBUF[60]),
        .I2(awaddr_i_IBUF[58]),
        .I3(awaddr_i_IBUF[59]),
        .O(\awready_o_OBUF[1]_inst_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEAFF00002A00)) 
    \bresp_o_OBUF[0]_inst_i_1 
       (.I0(s_bresp_i_IBUF[0]),
        .I1(\awready_o_OBUF[0]_inst_i_6_0 ),
        .I2(awvalid_i_IBUF[0]),
        .I3(\slave_aw_gnt_vector[0] [0]),
        .I4(bvalid_err[0]),
        .I5(\bresp_o[0] ),
        .O(bresp_o_OBUF[0]));
  LUT6 #(
    .INIT(64'hFFFFEAFF00002A00)) 
    \bresp_o_OBUF[1]_inst_i_1 
       (.I0(s_bresp_i_IBUF[1]),
        .I1(\awready_o_OBUF[0]_inst_i_6_0 ),
        .I2(awvalid_i_IBUF[0]),
        .I3(\slave_aw_gnt_vector[0] [0]),
        .I4(bvalid_err[0]),
        .I5(\bresp_o[0] ),
        .O(bresp_o_OBUF[1]));
  LUT6 #(
    .INIT(64'hAAAAEFAAAAAA20AA)) 
    \bresp_o_OBUF[2]_inst_i_1 
       (.I0(\bresp_o[2] ),
        .I1(\awready_o_OBUF[1]_inst_i_6_0 ),
        .I2(awvalid_i_IBUF[1]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .I4(bvalid_err[1]),
        .I5(s_bresp_i_IBUF[0]),
        .O(bresp_o_OBUF[2]));
  LUT6 #(
    .INIT(64'hAAAAEFAAAAAA20AA)) 
    \bresp_o_OBUF[3]_inst_i_1 
       (.I0(\bresp_o[2] ),
        .I1(\awready_o_OBUF[1]_inst_i_6_0 ),
        .I2(awvalid_i_IBUF[1]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .I4(bvalid_err[1]),
        .I5(s_bresp_i_IBUF[1]),
        .O(bresp_o_OBUF[3]));
  LUT5 #(
    .INIT(32'hF7F0F0F0)) 
    \bvalid_o_OBUF[0]_inst_i_1 
       (.I0(awvalid_i_IBUF[0]),
        .I1(\awready_o_OBUF[0]_inst_i_6_0 ),
        .I2(bvalid_err[0]),
        .I3(\slave_aw_gnt_vector[0] [0]),
        .I4(s_bvalid_i_IBUF),
        .O(bvalid_o_OBUF[0]));
  LUT5 #(
    .INIT(32'hFDF0F0F0)) 
    \bvalid_o_OBUF[1]_inst_i_1 
       (.I0(awvalid_i_IBUF[1]),
        .I1(\awready_o_OBUF[1]_inst_i_6_0 ),
        .I2(bvalid_err[1]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .I4(s_bvalid_i_IBUF),
        .O(bvalid_o_OBUF[1]));
  LUT3 #(
    .INIT(8'hB8)) 
    \gnt_o[0]_i_1 
       (.I0(next_gnt),
        .I1(\gnt_o[1]_i_3_n_0 ),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .O(\gnt_o[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h08FF0800)) 
    \gnt_o[1]_i_1 
       (.I0(\awready_o_OBUF[1]_inst_i_6_0 ),
        .I1(awvalid_i_IBUF[1]),
        .I2(next_gnt),
        .I3(\gnt_o[1]_i_3_n_0 ),
        .I4(\slave_aw_gnt_vector[0] [1]),
        .O(\gnt_o[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000002)) 
    \gnt_o[1]_i_2 
       (.I0(awvalid_i_IBUF[0]),
        .I1(\awready_o_OBUF[0]_inst_i_6_n_0 ),
        .I2(\awready_o_OBUF[0]_inst_i_5_n_0 ),
        .I3(\awready_o_OBUF[0]_inst_i_4_n_0 ),
        .I4(\awready_o_OBUF[0]_inst_i_3_n_0 ),
        .O(next_gnt));
  LUT6 #(
    .INIT(64'hCFDDCFFF00550055)) 
    \gnt_o[1]_i_3 
       (.I0(\slave_aw_gnt_vector[0] [0]),
        .I1(s_awready_i_IBUF),
        .I2(awvalid_i_IBUF[1]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .I4(awvalid_i_IBUF[0]),
        .I5(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[1]_0 ),
        .O(\gnt_o[1]_i_3_n_0 ));
  FDCE \gnt_o_reg[0] 
       (.C(aclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(aresetn),
        .D(\gnt_o[0]_i_1_n_0 ),
        .Q(\slave_aw_gnt_vector[0] [0]));
  FDCE \gnt_o_reg[1] 
       (.C(aclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(aresetn),
        .D(\gnt_o[1]_i_1_n_0 ),
        .Q(\slave_aw_gnt_vector[0] [1]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[0]_inst_i_1 
       (.I0(awaddr_i_IBUF[0]),
        .I1(awaddr_i_IBUF[32]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[0]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[10]_inst_i_1 
       (.I0(awaddr_i_IBUF[10]),
        .I1(awaddr_i_IBUF[42]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[10]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[11]_inst_i_1 
       (.I0(awaddr_i_IBUF[11]),
        .I1(awaddr_i_IBUF[43]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[11]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[12]_inst_i_1 
       (.I0(awaddr_i_IBUF[12]),
        .I1(awaddr_i_IBUF[44]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[12]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[13]_inst_i_1 
       (.I0(awaddr_i_IBUF[13]),
        .I1(awaddr_i_IBUF[45]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[13]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[14]_inst_i_1 
       (.I0(awaddr_i_IBUF[14]),
        .I1(awaddr_i_IBUF[46]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[14]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[15]_inst_i_1 
       (.I0(awaddr_i_IBUF[15]),
        .I1(awaddr_i_IBUF[47]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[15]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[16]_inst_i_1 
       (.I0(awaddr_i_IBUF[16]),
        .I1(awaddr_i_IBUF[48]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[16]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[17]_inst_i_1 
       (.I0(awaddr_i_IBUF[17]),
        .I1(awaddr_i_IBUF[49]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[17]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[18]_inst_i_1 
       (.I0(awaddr_i_IBUF[18]),
        .I1(awaddr_i_IBUF[50]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[18]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[19]_inst_i_1 
       (.I0(awaddr_i_IBUF[19]),
        .I1(awaddr_i_IBUF[51]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[19]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[1]_inst_i_1 
       (.I0(awaddr_i_IBUF[1]),
        .I1(awaddr_i_IBUF[33]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[1]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[20]_inst_i_1 
       (.I0(awaddr_i_IBUF[20]),
        .I1(awaddr_i_IBUF[52]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[20]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[21]_inst_i_1 
       (.I0(awaddr_i_IBUF[21]),
        .I1(awaddr_i_IBUF[53]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[21]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[22]_inst_i_1 
       (.I0(awaddr_i_IBUF[22]),
        .I1(awaddr_i_IBUF[54]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[22]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[23]_inst_i_1 
       (.I0(awaddr_i_IBUF[23]),
        .I1(awaddr_i_IBUF[55]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[23]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[24]_inst_i_1 
       (.I0(awaddr_i_IBUF[24]),
        .I1(awaddr_i_IBUF[56]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[24]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[25]_inst_i_1 
       (.I0(awaddr_i_IBUF[25]),
        .I1(awaddr_i_IBUF[57]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[25]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[26]_inst_i_1 
       (.I0(awaddr_i_IBUF[26]),
        .I1(awaddr_i_IBUF[58]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[26]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[27]_inst_i_1 
       (.I0(awaddr_i_IBUF[27]),
        .I1(awaddr_i_IBUF[59]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[27]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[28]_inst_i_1 
       (.I0(awaddr_i_IBUF[28]),
        .I1(awaddr_i_IBUF[60]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[28]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[29]_inst_i_1 
       (.I0(awaddr_i_IBUF[29]),
        .I1(awaddr_i_IBUF[61]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[29]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[2]_inst_i_1 
       (.I0(awaddr_i_IBUF[2]),
        .I1(awaddr_i_IBUF[34]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[2]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[30]_inst_i_1 
       (.I0(awaddr_i_IBUF[30]),
        .I1(awaddr_i_IBUF[62]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[30]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[31]_inst_i_1 
       (.I0(awaddr_i_IBUF[31]),
        .I1(awaddr_i_IBUF[63]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[31]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[3]_inst_i_1 
       (.I0(awaddr_i_IBUF[3]),
        .I1(awaddr_i_IBUF[35]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[3]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[4]_inst_i_1 
       (.I0(awaddr_i_IBUF[4]),
        .I1(awaddr_i_IBUF[36]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[4]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[5]_inst_i_1 
       (.I0(awaddr_i_IBUF[5]),
        .I1(awaddr_i_IBUF[37]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[5]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[6]_inst_i_1 
       (.I0(awaddr_i_IBUF[6]),
        .I1(awaddr_i_IBUF[38]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[6]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[7]_inst_i_1 
       (.I0(awaddr_i_IBUF[7]),
        .I1(awaddr_i_IBUF[39]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[7]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[8]_inst_i_1 
       (.I0(awaddr_i_IBUF[8]),
        .I1(awaddr_i_IBUF[40]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[8]));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_awaddr_o_OBUF[9]_inst_i_1 
       (.I0(awaddr_i_IBUF[9]),
        .I1(awaddr_i_IBUF[41]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_awaddr_o_OBUF[9]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_awprot_o_OBUF[0]_inst_i_1 
       (.I0(awprot_i_IBUF[3]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(awprot_i_IBUF[0]),
        .O(s_awprot_o_OBUF[0]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_awprot_o_OBUF[1]_inst_i_1 
       (.I0(awprot_i_IBUF[4]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(awprot_i_IBUF[1]),
        .O(s_awprot_o_OBUF[1]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_awprot_o_OBUF[2]_inst_i_1 
       (.I0(awprot_i_IBUF[5]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(awprot_i_IBUF[2]),
        .O(s_awprot_o_OBUF[2]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_awvalid_o_OBUF[0]_inst_i_1 
       (.I0(awvalid_i_IBUF[1]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(awvalid_i_IBUF[0]),
        .I3(\slave_aw_gnt_vector[0] [0]),
        .O(s_awvalid_o_OBUF));
  LUT4 #(
    .INIT(16'hCCA0)) 
    \s_bready_o_OBUF[0]_inst_i_1 
       (.I0(bready_i_IBUF[0]),
        .I1(bready_i_IBUF[1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .O(s_bready_o_OBUF));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[0]_inst_i_1 
       (.I0(wdata_i_IBUF[32]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[0]),
        .O(s_wdata_o_OBUF[0]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[10]_inst_i_1 
       (.I0(wdata_i_IBUF[42]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[10]),
        .O(s_wdata_o_OBUF[10]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[11]_inst_i_1 
       (.I0(wdata_i_IBUF[43]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[11]),
        .O(s_wdata_o_OBUF[11]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[12]_inst_i_1 
       (.I0(wdata_i_IBUF[44]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[12]),
        .O(s_wdata_o_OBUF[12]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[13]_inst_i_1 
       (.I0(wdata_i_IBUF[45]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[13]),
        .O(s_wdata_o_OBUF[13]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[14]_inst_i_1 
       (.I0(wdata_i_IBUF[46]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[14]),
        .O(s_wdata_o_OBUF[14]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[15]_inst_i_1 
       (.I0(wdata_i_IBUF[47]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[15]),
        .O(s_wdata_o_OBUF[15]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[16]_inst_i_1 
       (.I0(wdata_i_IBUF[48]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[16]),
        .O(s_wdata_o_OBUF[16]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[17]_inst_i_1 
       (.I0(wdata_i_IBUF[49]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[17]),
        .O(s_wdata_o_OBUF[17]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[18]_inst_i_1 
       (.I0(wdata_i_IBUF[50]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[18]),
        .O(s_wdata_o_OBUF[18]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[19]_inst_i_1 
       (.I0(wdata_i_IBUF[51]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[19]),
        .O(s_wdata_o_OBUF[19]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[1]_inst_i_1 
       (.I0(wdata_i_IBUF[33]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[1]),
        .O(s_wdata_o_OBUF[1]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[20]_inst_i_1 
       (.I0(wdata_i_IBUF[52]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[20]),
        .O(s_wdata_o_OBUF[20]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[21]_inst_i_1 
       (.I0(wdata_i_IBUF[53]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[21]),
        .O(s_wdata_o_OBUF[21]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[22]_inst_i_1 
       (.I0(wdata_i_IBUF[54]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[22]),
        .O(s_wdata_o_OBUF[22]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[23]_inst_i_1 
       (.I0(wdata_i_IBUF[55]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[23]),
        .O(s_wdata_o_OBUF[23]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[24]_inst_i_1 
       (.I0(wdata_i_IBUF[56]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[24]),
        .O(s_wdata_o_OBUF[24]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[25]_inst_i_1 
       (.I0(wdata_i_IBUF[57]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[25]),
        .O(s_wdata_o_OBUF[25]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[26]_inst_i_1 
       (.I0(wdata_i_IBUF[58]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[26]),
        .O(s_wdata_o_OBUF[26]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[27]_inst_i_1 
       (.I0(wdata_i_IBUF[59]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[27]),
        .O(s_wdata_o_OBUF[27]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[28]_inst_i_1 
       (.I0(wdata_i_IBUF[60]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[28]),
        .O(s_wdata_o_OBUF[28]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[29]_inst_i_1 
       (.I0(wdata_i_IBUF[61]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[29]),
        .O(s_wdata_o_OBUF[29]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[2]_inst_i_1 
       (.I0(wdata_i_IBUF[34]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[2]),
        .O(s_wdata_o_OBUF[2]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[30]_inst_i_1 
       (.I0(wdata_i_IBUF[62]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[30]),
        .O(s_wdata_o_OBUF[30]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[31]_inst_i_1 
       (.I0(wdata_i_IBUF[63]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[31]),
        .O(s_wdata_o_OBUF[31]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[3]_inst_i_1 
       (.I0(wdata_i_IBUF[35]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[3]),
        .O(s_wdata_o_OBUF[3]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[4]_inst_i_1 
       (.I0(wdata_i_IBUF[36]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[4]),
        .O(s_wdata_o_OBUF[4]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[5]_inst_i_1 
       (.I0(wdata_i_IBUF[37]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[5]),
        .O(s_wdata_o_OBUF[5]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[6]_inst_i_1 
       (.I0(wdata_i_IBUF[38]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[6]),
        .O(s_wdata_o_OBUF[6]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[7]_inst_i_1 
       (.I0(wdata_i_IBUF[39]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[7]),
        .O(s_wdata_o_OBUF[7]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[8]_inst_i_1 
       (.I0(wdata_i_IBUF[40]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[8]),
        .O(s_wdata_o_OBUF[8]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wdata_o_OBUF[9]_inst_i_1 
       (.I0(wdata_i_IBUF[41]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wdata_i_IBUF[9]),
        .O(s_wdata_o_OBUF[9]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wstrb_o_OBUF[0]_inst_i_1 
       (.I0(wstrb_i_IBUF[4]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wstrb_i_IBUF[0]),
        .O(s_wstrb_o_OBUF[0]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wstrb_o_OBUF[1]_inst_i_1 
       (.I0(wstrb_i_IBUF[5]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wstrb_i_IBUF[1]),
        .O(s_wstrb_o_OBUF[1]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wstrb_o_OBUF[2]_inst_i_1 
       (.I0(wstrb_i_IBUF[6]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wstrb_i_IBUF[2]),
        .O(s_wstrb_o_OBUF[2]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wstrb_o_OBUF[3]_inst_i_1 
       (.I0(wstrb_i_IBUF[7]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wstrb_i_IBUF[3]),
        .O(s_wstrb_o_OBUF[3]));
  LUT4 #(
    .INIT(16'hB888)) 
    \s_wvalid_o_OBUF[0]_inst_i_1 
       (.I0(wvalid_i_IBUF[1]),
        .I1(\slave_aw_gnt_vector[0] [1]),
        .I2(\slave_aw_gnt_vector[0] [0]),
        .I3(wvalid_i_IBUF[0]),
        .O(s_wvalid_o_OBUF));
  LUT5 #(
    .INIT(32'h8F888888)) 
    \wready_o_OBUF[0]_inst_i_1 
       (.I0(\awready_o_OBUF[0]_inst_i_6_0 ),
        .I1(awvalid_i_IBUF[0]),
        .I2(bvalid_err[0]),
        .I3(\slave_aw_gnt_vector[0] [0]),
        .I4(s_wready_i_IBUF),
        .O(wready_o_OBUF[0]));
  LUT5 #(
    .INIT(32'h4F444444)) 
    \wready_o_OBUF[1]_inst_i_1 
       (.I0(\awready_o_OBUF[1]_inst_i_6_0 ),
        .I1(awvalid_i_IBUF[1]),
        .I2(bvalid_err[1]),
        .I3(\slave_aw_gnt_vector[0] [1]),
        .I4(s_wready_i_IBUF),
        .O(wready_o_OBUF[1]));
endmodule

(* ADDR_WIDTH = "32" *) (* DATA_WIDTH = "32" *) (* DEFAULT_SLAVE_INDEX = "0" *) 
(* INPUT_PIPE_STAGES = "1'b0" *) (* M_SLAVES = "2" *) (* N_MASTERS = "2" *) 
(* OUTPUT_PIPE_STAGES = "1'b0" *) (* REGION_MAP_FLAT = "132'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" *) (* USE_DEFAULT_SLAVE = "1'b0" *) 
(* NotValidForBitStream *)
module bus_matrix_axi
   (aclk,
    aresetn,
    awaddr_i,
    awprot_i,
    awvalid_i,
    awready_o,
    wdata_i,
    wstrb_i,
    wvalid_i,
    wready_o,
    bresp_o,
    bvalid_o,
    bready_i,
    araddr_i,
    arprot_i,
    arvalid_i,
    arready_o,
    rdata_o,
    rresp_o,
    rvalid_o,
    rready_i,
    s_awaddr_o,
    s_awprot_o,
    s_awvalid_o,
    s_awready_i,
    s_wdata_o,
    s_wstrb_o,
    s_wvalid_o,
    s_wready_i,
    s_bresp_i,
    s_bvalid_i,
    s_bready_o,
    s_araddr_o,
    s_arprot_o,
    s_arvalid_o,
    s_arready_i,
    s_rdata_i,
    s_rresp_i,
    s_rvalid_i,
    s_rready_o);
  input aclk;
  input aresetn;
  input [63:0]awaddr_i;
  input [5:0]awprot_i;
  input [1:0]awvalid_i;
  output [1:0]awready_o;
  input [63:0]wdata_i;
  input [7:0]wstrb_i;
  input [1:0]wvalid_i;
  output [1:0]wready_o;
  output [3:0]bresp_o;
  output [1:0]bvalid_o;
  input [1:0]bready_i;
  input [63:0]araddr_i;
  input [5:0]arprot_i;
  input [1:0]arvalid_i;
  output [1:0]arready_o;
  output [63:0]rdata_o;
  output [3:0]rresp_o;
  output [1:0]rvalid_o;
  input [1:0]rready_i;
  output [63:0]s_awaddr_o;
  output [5:0]s_awprot_o;
  output [1:0]s_awvalid_o;
  input [1:0]s_awready_i;
  output [63:0]s_wdata_o;
  output [7:0]s_wstrb_o;
  output [1:0]s_wvalid_o;
  input [1:0]s_wready_i;
  input [3:0]s_bresp_i;
  input [1:0]s_bvalid_i;
  output [1:0]s_bready_o;
  output [63:0]s_araddr_o;
  output [5:0]s_arprot_o;
  output [1:0]s_arvalid_o;
  input [1:0]s_arready_i;
  input [63:0]s_rdata_i;
  input [3:0]s_rresp_i;
  input [1:0]s_rvalid_i;
  output [1:0]s_rready_o;

  wire \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg_n_0_[0] ;
  wire \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg_n_0_[1] ;
  wire \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg_n_0_[2] ;
  wire \GEN_AR_ARBITERS[0].r_state ;
  wire \GEN_AR_ARBITERS[0].u_arb_ar_n_0 ;
  wire \GEN_AR_ARBITERS[0].u_arb_ar_n_108 ;
  wire \GEN_AR_ARBITERS[0].u_arb_ar_n_2 ;
  wire \GEN_AW_ARBITERS[0].u_arb_aw_n_0 ;
  wire \GEN_AW_ARBITERS[0].u_arb_aw_n_1 ;
  wire \GEN_AW_ARBITERS[0].u_arb_aw_n_2 ;
  wire \GEN_AW_ARBITERS[0].u_arb_aw_n_3 ;
  wire \GEN_AW_ARBITERS[0].u_arb_aw_n_4 ;
  wire \GEN_AW_ARBITERS[0].u_arb_aw_n_50 ;
  wire aclk;
  wire aclk_IBUF;
  wire aclk_IBUF_BUFG;
  wire [63:0]araddr_i;
  wire [63:0]araddr_i_IBUF;
  wire aresetn;
  wire aresetn_IBUF;
  wire [1:0]arready_o;
  wire [1:0]arready_o_OBUF;
  wire [1:0]arvalid_i;
  wire [1:0]arvalid_i_IBUF;
  wire [63:0]awaddr_i;
  wire [63:0]awaddr_i_IBUF;
  wire [5:0]awprot_i;
  wire [5:0]awprot_i_IBUF;
  wire [1:0]awready_o;
  wire [1:0]awready_o_OBUF;
  wire [1:0]awvalid_i;
  wire [1:0]awvalid_i_IBUF;
  wire [1:0]bready_i;
  wire [1:0]bready_i_IBUF;
  wire \bresp_err[0][1]_i_1_n_0 ;
  wire \bresp_err[1][1]_i_1_n_0 ;
  wire \bresp_err_reg_n_0_[0][1] ;
  wire \bresp_err_reg_n_0_[1][1] ;
  wire [3:0]bresp_o;
  wire [3:0]bresp_o_OBUF;
  wire [1:0]bvalid_err;
  wire \bvalid_err[0]_i_1_n_0 ;
  wire \bvalid_err[1]_i_1_n_0 ;
  wire [1:0]bvalid_o;
  wire [1:0]bvalid_o_OBUF;
  wire [63:0]rdata_o;
  wire [63:0]rdata_o_OBUF;
  wire [1:0]rready_i;
  wire [1:0]rready_i_IBUF;
  wire \rresp_err[0][1]_i_1_n_0 ;
  wire \rresp_err[1][1]_i_1_n_0 ;
  wire \rresp_err_reg_n_0_[0][1] ;
  wire \rresp_err_reg_n_0_[1][1] ;
  wire [3:0]rresp_o;
  wire [3:0]rresp_o_OBUF;
  wire [1:0]rvalid_err;
  wire \rvalid_err[0]_i_1_n_0 ;
  wire \rvalid_err[1]_i_1_n_0 ;
  wire [1:0]rvalid_o;
  wire [1:0]rvalid_o_OBUF;
  wire [63:0]s_araddr_o;
  wire [31:0]s_araddr_o_OBUF;
  wire [5:0]s_arprot_o;
  wire [1:0]s_arready_i;
  wire [0:0]s_arready_i_IBUF;
  wire [1:0]s_arvalid_o;
  wire [0:0]s_arvalid_o_OBUF;
  wire [63:0]s_awaddr_o;
  wire [31:0]s_awaddr_o_OBUF;
  wire [5:0]s_awprot_o;
  wire [2:0]s_awprot_o_OBUF;
  wire [1:0]s_awready_i;
  wire [0:0]s_awready_i_IBUF;
  wire [1:0]s_awvalid_o;
  wire [0:0]s_awvalid_o_OBUF;
  wire [1:0]s_bready_o;
  wire [0:0]s_bready_o_OBUF;
  wire [3:0]s_bresp_i;
  wire [1:0]s_bresp_i_IBUF;
  wire [1:0]s_bvalid_i;
  wire [0:0]s_bvalid_i_IBUF;
  wire [63:0]s_rdata_i;
  wire [31:0]s_rdata_i_IBUF;
  wire [1:0]s_rready_o;
  wire [0:0]s_rready_o_OBUF;
  wire [3:0]s_rresp_i;
  wire [1:0]s_rresp_i_IBUF;
  wire [1:0]s_rvalid_i;
  wire [0:0]s_rvalid_i_IBUF;
  wire [63:0]s_wdata_o;
  wire [31:0]s_wdata_o_OBUF;
  wire [1:0]s_wready_i;
  wire [0:0]s_wready_i_IBUF;
  wire [7:0]s_wstrb_o;
  wire [3:0]s_wstrb_o_OBUF;
  wire [1:0]s_wvalid_o;
  wire [0:0]s_wvalid_o_OBUF;
  wire [63:0]wdata_i;
  wire [63:0]wdata_i_IBUF;
  wire [1:0]wready_o;
  wire [1:0]wready_o_OBUF;
  wire [7:0]wstrb_i;
  wire [7:0]wstrb_i_IBUF;
  wire [1:0]wvalid_i;
  wire [1:0]wvalid_i_IBUF;

initial begin
 $sdf_annotate("bus_matrix_axi_netlist.sdf",,,,"tool_control");
end
  (* FSM_ENCODED_STATES = "LOCK_IDLE:001,LOCK_W_PHASE:010,LOCK_B_PHASE:100," *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[0] 
       (.C(aclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\GEN_AW_ARBITERS[0].u_arb_aw_n_2 ),
        .PRE(\GEN_AW_ARBITERS[0].u_arb_aw_n_3 ),
        .Q(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "LOCK_IDLE:001,LOCK_W_PHASE:010,LOCK_B_PHASE:100," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[1] 
       (.C(aclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\GEN_AW_ARBITERS[0].u_arb_aw_n_3 ),
        .D(\GEN_AW_ARBITERS[0].u_arb_aw_n_1 ),
        .Q(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg_n_0_[1] ));
  (* FSM_ENCODED_STATES = "LOCK_IDLE:001,LOCK_W_PHASE:010,LOCK_B_PHASE:100," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[2] 
       (.C(aclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\GEN_AW_ARBITERS[0].u_arb_aw_n_3 ),
        .D(\GEN_AW_ARBITERS[0].u_arb_aw_n_0 ),
        .Q(\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg_n_0_[2] ));
  FDCE \GEN_AR_ARBITERS[0].r_state_reg 
       (.C(aclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\GEN_AW_ARBITERS[0].u_arb_aw_n_3 ),
        .D(\GEN_AR_ARBITERS[0].u_arb_ar_n_0 ),
        .Q(\GEN_AR_ARBITERS[0].r_state ));
  bus_matrix_arbiter \GEN_AR_ARBITERS[0].u_arb_ar 
       (.\GEN_AR_ARBITERS[0].r_state (\GEN_AR_ARBITERS[0].r_state ),
        .\GEN_AR_ARBITERS[0].r_state_reg (\GEN_AR_ARBITERS[0].u_arb_ar_n_0 ),
        .aclk_IBUF_BUFG(aclk_IBUF_BUFG),
        .araddr_i_IBUF(araddr_i_IBUF),
        .arready_o_OBUF(arready_o_OBUF),
        .\arready_o_OBUF[0]_inst_i_6_0 (\GEN_AR_ARBITERS[0].u_arb_ar_n_108 ),
        .\arready_o_OBUF[1]_inst_i_6_0 (\GEN_AR_ARBITERS[0].u_arb_ar_n_2 ),
        .arvalid_i_IBUF(arvalid_i_IBUF),
        .\gnt_o_reg[0]_0 (\GEN_AW_ARBITERS[0].u_arb_aw_n_3 ),
        .rdata_o_OBUF(rdata_o_OBUF),
        .rready_i_IBUF(rready_i_IBUF),
        .\rresp_o[1] (\rresp_err_reg_n_0_[0][1] ),
        .\rresp_o[2] (\rresp_err_reg_n_0_[1][1] ),
        .rresp_o_OBUF(rresp_o_OBUF),
        .rvalid_err(rvalid_err),
        .rvalid_o_OBUF(rvalid_o_OBUF),
        .s_araddr_o_OBUF(s_araddr_o_OBUF),
        .s_arready_i_IBUF(s_arready_i_IBUF),
        .s_arvalid_o_OBUF(s_arvalid_o_OBUF),
        .s_rdata_i_IBUF(s_rdata_i_IBUF),
        .s_rready_o_OBUF(s_rready_o_OBUF),
        .s_rresp_i_IBUF(s_rresp_i_IBUF),
        .s_rvalid_i_IBUF(s_rvalid_i_IBUF));
  bus_matrix_arbiter_0 \GEN_AW_ARBITERS[0].u_arb_aw 
       (.\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[0] (\GEN_AW_ARBITERS[0].u_arb_aw_n_1 ),
        .\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[1] (\GEN_AW_ARBITERS[0].u_arb_aw_n_0 ),
        .\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[1]_0 (\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg_n_0_[0] ),
        .\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[2] (\GEN_AW_ARBITERS[0].u_arb_aw_n_2 ),
        .\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[2]_0 (\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg_n_0_[1] ),
        .\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg[2]_1 (\FSM_onehot_GEN_AW_ARBITERS[0].lock_state_reg_n_0_[2] ),
        .aclk_IBUF_BUFG(aclk_IBUF_BUFG),
        .aresetn(\GEN_AW_ARBITERS[0].u_arb_aw_n_3 ),
        .aresetn_IBUF(aresetn_IBUF),
        .awaddr_i_IBUF(awaddr_i_IBUF),
        .awprot_i_IBUF(awprot_i_IBUF),
        .awready_o_OBUF(awready_o_OBUF),
        .\awready_o_OBUF[0]_inst_i_6_0 (\GEN_AW_ARBITERS[0].u_arb_aw_n_50 ),
        .\awready_o_OBUF[1]_inst_i_6_0 (\GEN_AW_ARBITERS[0].u_arb_aw_n_4 ),
        .awvalid_i_IBUF(awvalid_i_IBUF),
        .bready_i_IBUF(bready_i_IBUF),
        .\bresp_o[0] (\bresp_err_reg_n_0_[0][1] ),
        .\bresp_o[2] (\bresp_err_reg_n_0_[1][1] ),
        .bresp_o_OBUF(bresp_o_OBUF),
        .bvalid_err(bvalid_err),
        .bvalid_o_OBUF(bvalid_o_OBUF),
        .s_awaddr_o_OBUF(s_awaddr_o_OBUF),
        .s_awprot_o_OBUF(s_awprot_o_OBUF),
        .s_awready_i_IBUF(s_awready_i_IBUF),
        .s_awvalid_o_OBUF(s_awvalid_o_OBUF),
        .s_bready_o_OBUF(s_bready_o_OBUF),
        .s_bresp_i_IBUF(s_bresp_i_IBUF),
        .s_bvalid_i_IBUF(s_bvalid_i_IBUF),
        .s_wdata_o_OBUF(s_wdata_o_OBUF),
        .s_wready_i_IBUF(s_wready_i_IBUF),
        .s_wstrb_o_OBUF(s_wstrb_o_OBUF),
        .s_wvalid_o_OBUF(s_wvalid_o_OBUF),
        .wdata_i_IBUF(wdata_i_IBUF),
        .wready_o_OBUF(wready_o_OBUF),
        .wstrb_i_IBUF(wstrb_i_IBUF),
        .wvalid_i_IBUF(wvalid_i_IBUF));
  BUFG aclk_IBUF_BUFG_inst
       (.I(aclk_IBUF),
        .O(aclk_IBUF_BUFG));
  IBUF aclk_IBUF_inst
       (.I(aclk),
        .O(aclk_IBUF));
  IBUF \araddr_i_IBUF[0]_inst 
       (.I(araddr_i[0]),
        .O(araddr_i_IBUF[0]));
  IBUF \araddr_i_IBUF[10]_inst 
       (.I(araddr_i[10]),
        .O(araddr_i_IBUF[10]));
  IBUF \araddr_i_IBUF[11]_inst 
       (.I(araddr_i[11]),
        .O(araddr_i_IBUF[11]));
  IBUF \araddr_i_IBUF[12]_inst 
       (.I(araddr_i[12]),
        .O(araddr_i_IBUF[12]));
  IBUF \araddr_i_IBUF[13]_inst 
       (.I(araddr_i[13]),
        .O(araddr_i_IBUF[13]));
  IBUF \araddr_i_IBUF[14]_inst 
       (.I(araddr_i[14]),
        .O(araddr_i_IBUF[14]));
  IBUF \araddr_i_IBUF[15]_inst 
       (.I(araddr_i[15]),
        .O(araddr_i_IBUF[15]));
  IBUF \araddr_i_IBUF[16]_inst 
       (.I(araddr_i[16]),
        .O(araddr_i_IBUF[16]));
  IBUF \araddr_i_IBUF[17]_inst 
       (.I(araddr_i[17]),
        .O(araddr_i_IBUF[17]));
  IBUF \araddr_i_IBUF[18]_inst 
       (.I(araddr_i[18]),
        .O(araddr_i_IBUF[18]));
  IBUF \araddr_i_IBUF[19]_inst 
       (.I(araddr_i[19]),
        .O(araddr_i_IBUF[19]));
  IBUF \araddr_i_IBUF[1]_inst 
       (.I(araddr_i[1]),
        .O(araddr_i_IBUF[1]));
  IBUF \araddr_i_IBUF[20]_inst 
       (.I(araddr_i[20]),
        .O(araddr_i_IBUF[20]));
  IBUF \araddr_i_IBUF[21]_inst 
       (.I(araddr_i[21]),
        .O(araddr_i_IBUF[21]));
  IBUF \araddr_i_IBUF[22]_inst 
       (.I(araddr_i[22]),
        .O(araddr_i_IBUF[22]));
  IBUF \araddr_i_IBUF[23]_inst 
       (.I(araddr_i[23]),
        .O(araddr_i_IBUF[23]));
  IBUF \araddr_i_IBUF[24]_inst 
       (.I(araddr_i[24]),
        .O(araddr_i_IBUF[24]));
  IBUF \araddr_i_IBUF[25]_inst 
       (.I(araddr_i[25]),
        .O(araddr_i_IBUF[25]));
  IBUF \araddr_i_IBUF[26]_inst 
       (.I(araddr_i[26]),
        .O(araddr_i_IBUF[26]));
  IBUF \araddr_i_IBUF[27]_inst 
       (.I(araddr_i[27]),
        .O(araddr_i_IBUF[27]));
  IBUF \araddr_i_IBUF[28]_inst 
       (.I(araddr_i[28]),
        .O(araddr_i_IBUF[28]));
  IBUF \araddr_i_IBUF[29]_inst 
       (.I(araddr_i[29]),
        .O(araddr_i_IBUF[29]));
  IBUF \araddr_i_IBUF[2]_inst 
       (.I(araddr_i[2]),
        .O(araddr_i_IBUF[2]));
  IBUF \araddr_i_IBUF[30]_inst 
       (.I(araddr_i[30]),
        .O(araddr_i_IBUF[30]));
  IBUF \araddr_i_IBUF[31]_inst 
       (.I(araddr_i[31]),
        .O(araddr_i_IBUF[31]));
  IBUF \araddr_i_IBUF[32]_inst 
       (.I(araddr_i[32]),
        .O(araddr_i_IBUF[32]));
  IBUF \araddr_i_IBUF[33]_inst 
       (.I(araddr_i[33]),
        .O(araddr_i_IBUF[33]));
  IBUF \araddr_i_IBUF[34]_inst 
       (.I(araddr_i[34]),
        .O(araddr_i_IBUF[34]));
  IBUF \araddr_i_IBUF[35]_inst 
       (.I(araddr_i[35]),
        .O(araddr_i_IBUF[35]));
  IBUF \araddr_i_IBUF[36]_inst 
       (.I(araddr_i[36]),
        .O(araddr_i_IBUF[36]));
  IBUF \araddr_i_IBUF[37]_inst 
       (.I(araddr_i[37]),
        .O(araddr_i_IBUF[37]));
  IBUF \araddr_i_IBUF[38]_inst 
       (.I(araddr_i[38]),
        .O(araddr_i_IBUF[38]));
  IBUF \araddr_i_IBUF[39]_inst 
       (.I(araddr_i[39]),
        .O(araddr_i_IBUF[39]));
  IBUF \araddr_i_IBUF[3]_inst 
       (.I(araddr_i[3]),
        .O(araddr_i_IBUF[3]));
  IBUF \araddr_i_IBUF[40]_inst 
       (.I(araddr_i[40]),
        .O(araddr_i_IBUF[40]));
  IBUF \araddr_i_IBUF[41]_inst 
       (.I(araddr_i[41]),
        .O(araddr_i_IBUF[41]));
  IBUF \araddr_i_IBUF[42]_inst 
       (.I(araddr_i[42]),
        .O(araddr_i_IBUF[42]));
  IBUF \araddr_i_IBUF[43]_inst 
       (.I(araddr_i[43]),
        .O(araddr_i_IBUF[43]));
  IBUF \araddr_i_IBUF[44]_inst 
       (.I(araddr_i[44]),
        .O(araddr_i_IBUF[44]));
  IBUF \araddr_i_IBUF[45]_inst 
       (.I(araddr_i[45]),
        .O(araddr_i_IBUF[45]));
  IBUF \araddr_i_IBUF[46]_inst 
       (.I(araddr_i[46]),
        .O(araddr_i_IBUF[46]));
  IBUF \araddr_i_IBUF[47]_inst 
       (.I(araddr_i[47]),
        .O(araddr_i_IBUF[47]));
  IBUF \araddr_i_IBUF[48]_inst 
       (.I(araddr_i[48]),
        .O(araddr_i_IBUF[48]));
  IBUF \araddr_i_IBUF[49]_inst 
       (.I(araddr_i[49]),
        .O(araddr_i_IBUF[49]));
  IBUF \araddr_i_IBUF[4]_inst 
       (.I(araddr_i[4]),
        .O(araddr_i_IBUF[4]));
  IBUF \araddr_i_IBUF[50]_inst 
       (.I(araddr_i[50]),
        .O(araddr_i_IBUF[50]));
  IBUF \araddr_i_IBUF[51]_inst 
       (.I(araddr_i[51]),
        .O(araddr_i_IBUF[51]));
  IBUF \araddr_i_IBUF[52]_inst 
       (.I(araddr_i[52]),
        .O(araddr_i_IBUF[52]));
  IBUF \araddr_i_IBUF[53]_inst 
       (.I(araddr_i[53]),
        .O(araddr_i_IBUF[53]));
  IBUF \araddr_i_IBUF[54]_inst 
       (.I(araddr_i[54]),
        .O(araddr_i_IBUF[54]));
  IBUF \araddr_i_IBUF[55]_inst 
       (.I(araddr_i[55]),
        .O(araddr_i_IBUF[55]));
  IBUF \araddr_i_IBUF[56]_inst 
       (.I(araddr_i[56]),
        .O(araddr_i_IBUF[56]));
  IBUF \araddr_i_IBUF[57]_inst 
       (.I(araddr_i[57]),
        .O(araddr_i_IBUF[57]));
  IBUF \araddr_i_IBUF[58]_inst 
       (.I(araddr_i[58]),
        .O(araddr_i_IBUF[58]));
  IBUF \araddr_i_IBUF[59]_inst 
       (.I(araddr_i[59]),
        .O(araddr_i_IBUF[59]));
  IBUF \araddr_i_IBUF[5]_inst 
       (.I(araddr_i[5]),
        .O(araddr_i_IBUF[5]));
  IBUF \araddr_i_IBUF[60]_inst 
       (.I(araddr_i[60]),
        .O(araddr_i_IBUF[60]));
  IBUF \araddr_i_IBUF[61]_inst 
       (.I(araddr_i[61]),
        .O(araddr_i_IBUF[61]));
  IBUF \araddr_i_IBUF[62]_inst 
       (.I(araddr_i[62]),
        .O(araddr_i_IBUF[62]));
  IBUF \araddr_i_IBUF[63]_inst 
       (.I(araddr_i[63]),
        .O(araddr_i_IBUF[63]));
  IBUF \araddr_i_IBUF[6]_inst 
       (.I(araddr_i[6]),
        .O(araddr_i_IBUF[6]));
  IBUF \araddr_i_IBUF[7]_inst 
       (.I(araddr_i[7]),
        .O(araddr_i_IBUF[7]));
  IBUF \araddr_i_IBUF[8]_inst 
       (.I(araddr_i[8]),
        .O(araddr_i_IBUF[8]));
  IBUF \araddr_i_IBUF[9]_inst 
       (.I(araddr_i[9]),
        .O(araddr_i_IBUF[9]));
  IBUF aresetn_IBUF_inst
       (.I(aresetn),
        .O(aresetn_IBUF));
  OBUF \arready_o_OBUF[0]_inst 
       (.I(arready_o_OBUF[0]),
        .O(arready_o[0]));
  OBUF \arready_o_OBUF[1]_inst 
       (.I(arready_o_OBUF[1]),
        .O(arready_o[1]));
  IBUF \arvalid_i_IBUF[0]_inst 
       (.I(arvalid_i[0]),
        .O(arvalid_i_IBUF[0]));
  IBUF \arvalid_i_IBUF[1]_inst 
       (.I(arvalid_i[1]),
        .O(arvalid_i_IBUF[1]));
  IBUF \awaddr_i_IBUF[0]_inst 
       (.I(awaddr_i[0]),
        .O(awaddr_i_IBUF[0]));
  IBUF \awaddr_i_IBUF[10]_inst 
       (.I(awaddr_i[10]),
        .O(awaddr_i_IBUF[10]));
  IBUF \awaddr_i_IBUF[11]_inst 
       (.I(awaddr_i[11]),
        .O(awaddr_i_IBUF[11]));
  IBUF \awaddr_i_IBUF[12]_inst 
       (.I(awaddr_i[12]),
        .O(awaddr_i_IBUF[12]));
  IBUF \awaddr_i_IBUF[13]_inst 
       (.I(awaddr_i[13]),
        .O(awaddr_i_IBUF[13]));
  IBUF \awaddr_i_IBUF[14]_inst 
       (.I(awaddr_i[14]),
        .O(awaddr_i_IBUF[14]));
  IBUF \awaddr_i_IBUF[15]_inst 
       (.I(awaddr_i[15]),
        .O(awaddr_i_IBUF[15]));
  IBUF \awaddr_i_IBUF[16]_inst 
       (.I(awaddr_i[16]),
        .O(awaddr_i_IBUF[16]));
  IBUF \awaddr_i_IBUF[17]_inst 
       (.I(awaddr_i[17]),
        .O(awaddr_i_IBUF[17]));
  IBUF \awaddr_i_IBUF[18]_inst 
       (.I(awaddr_i[18]),
        .O(awaddr_i_IBUF[18]));
  IBUF \awaddr_i_IBUF[19]_inst 
       (.I(awaddr_i[19]),
        .O(awaddr_i_IBUF[19]));
  IBUF \awaddr_i_IBUF[1]_inst 
       (.I(awaddr_i[1]),
        .O(awaddr_i_IBUF[1]));
  IBUF \awaddr_i_IBUF[20]_inst 
       (.I(awaddr_i[20]),
        .O(awaddr_i_IBUF[20]));
  IBUF \awaddr_i_IBUF[21]_inst 
       (.I(awaddr_i[21]),
        .O(awaddr_i_IBUF[21]));
  IBUF \awaddr_i_IBUF[22]_inst 
       (.I(awaddr_i[22]),
        .O(awaddr_i_IBUF[22]));
  IBUF \awaddr_i_IBUF[23]_inst 
       (.I(awaddr_i[23]),
        .O(awaddr_i_IBUF[23]));
  IBUF \awaddr_i_IBUF[24]_inst 
       (.I(awaddr_i[24]),
        .O(awaddr_i_IBUF[24]));
  IBUF \awaddr_i_IBUF[25]_inst 
       (.I(awaddr_i[25]),
        .O(awaddr_i_IBUF[25]));
  IBUF \awaddr_i_IBUF[26]_inst 
       (.I(awaddr_i[26]),
        .O(awaddr_i_IBUF[26]));
  IBUF \awaddr_i_IBUF[27]_inst 
       (.I(awaddr_i[27]),
        .O(awaddr_i_IBUF[27]));
  IBUF \awaddr_i_IBUF[28]_inst 
       (.I(awaddr_i[28]),
        .O(awaddr_i_IBUF[28]));
  IBUF \awaddr_i_IBUF[29]_inst 
       (.I(awaddr_i[29]),
        .O(awaddr_i_IBUF[29]));
  IBUF \awaddr_i_IBUF[2]_inst 
       (.I(awaddr_i[2]),
        .O(awaddr_i_IBUF[2]));
  IBUF \awaddr_i_IBUF[30]_inst 
       (.I(awaddr_i[30]),
        .O(awaddr_i_IBUF[30]));
  IBUF \awaddr_i_IBUF[31]_inst 
       (.I(awaddr_i[31]),
        .O(awaddr_i_IBUF[31]));
  IBUF \awaddr_i_IBUF[32]_inst 
       (.I(awaddr_i[32]),
        .O(awaddr_i_IBUF[32]));
  IBUF \awaddr_i_IBUF[33]_inst 
       (.I(awaddr_i[33]),
        .O(awaddr_i_IBUF[33]));
  IBUF \awaddr_i_IBUF[34]_inst 
       (.I(awaddr_i[34]),
        .O(awaddr_i_IBUF[34]));
  IBUF \awaddr_i_IBUF[35]_inst 
       (.I(awaddr_i[35]),
        .O(awaddr_i_IBUF[35]));
  IBUF \awaddr_i_IBUF[36]_inst 
       (.I(awaddr_i[36]),
        .O(awaddr_i_IBUF[36]));
  IBUF \awaddr_i_IBUF[37]_inst 
       (.I(awaddr_i[37]),
        .O(awaddr_i_IBUF[37]));
  IBUF \awaddr_i_IBUF[38]_inst 
       (.I(awaddr_i[38]),
        .O(awaddr_i_IBUF[38]));
  IBUF \awaddr_i_IBUF[39]_inst 
       (.I(awaddr_i[39]),
        .O(awaddr_i_IBUF[39]));
  IBUF \awaddr_i_IBUF[3]_inst 
       (.I(awaddr_i[3]),
        .O(awaddr_i_IBUF[3]));
  IBUF \awaddr_i_IBUF[40]_inst 
       (.I(awaddr_i[40]),
        .O(awaddr_i_IBUF[40]));
  IBUF \awaddr_i_IBUF[41]_inst 
       (.I(awaddr_i[41]),
        .O(awaddr_i_IBUF[41]));
  IBUF \awaddr_i_IBUF[42]_inst 
       (.I(awaddr_i[42]),
        .O(awaddr_i_IBUF[42]));
  IBUF \awaddr_i_IBUF[43]_inst 
       (.I(awaddr_i[43]),
        .O(awaddr_i_IBUF[43]));
  IBUF \awaddr_i_IBUF[44]_inst 
       (.I(awaddr_i[44]),
        .O(awaddr_i_IBUF[44]));
  IBUF \awaddr_i_IBUF[45]_inst 
       (.I(awaddr_i[45]),
        .O(awaddr_i_IBUF[45]));
  IBUF \awaddr_i_IBUF[46]_inst 
       (.I(awaddr_i[46]),
        .O(awaddr_i_IBUF[46]));
  IBUF \awaddr_i_IBUF[47]_inst 
       (.I(awaddr_i[47]),
        .O(awaddr_i_IBUF[47]));
  IBUF \awaddr_i_IBUF[48]_inst 
       (.I(awaddr_i[48]),
        .O(awaddr_i_IBUF[48]));
  IBUF \awaddr_i_IBUF[49]_inst 
       (.I(awaddr_i[49]),
        .O(awaddr_i_IBUF[49]));
  IBUF \awaddr_i_IBUF[4]_inst 
       (.I(awaddr_i[4]),
        .O(awaddr_i_IBUF[4]));
  IBUF \awaddr_i_IBUF[50]_inst 
       (.I(awaddr_i[50]),
        .O(awaddr_i_IBUF[50]));
  IBUF \awaddr_i_IBUF[51]_inst 
       (.I(awaddr_i[51]),
        .O(awaddr_i_IBUF[51]));
  IBUF \awaddr_i_IBUF[52]_inst 
       (.I(awaddr_i[52]),
        .O(awaddr_i_IBUF[52]));
  IBUF \awaddr_i_IBUF[53]_inst 
       (.I(awaddr_i[53]),
        .O(awaddr_i_IBUF[53]));
  IBUF \awaddr_i_IBUF[54]_inst 
       (.I(awaddr_i[54]),
        .O(awaddr_i_IBUF[54]));
  IBUF \awaddr_i_IBUF[55]_inst 
       (.I(awaddr_i[55]),
        .O(awaddr_i_IBUF[55]));
  IBUF \awaddr_i_IBUF[56]_inst 
       (.I(awaddr_i[56]),
        .O(awaddr_i_IBUF[56]));
  IBUF \awaddr_i_IBUF[57]_inst 
       (.I(awaddr_i[57]),
        .O(awaddr_i_IBUF[57]));
  IBUF \awaddr_i_IBUF[58]_inst 
       (.I(awaddr_i[58]),
        .O(awaddr_i_IBUF[58]));
  IBUF \awaddr_i_IBUF[59]_inst 
       (.I(awaddr_i[59]),
        .O(awaddr_i_IBUF[59]));
  IBUF \awaddr_i_IBUF[5]_inst 
       (.I(awaddr_i[5]),
        .O(awaddr_i_IBUF[5]));
  IBUF \awaddr_i_IBUF[60]_inst 
       (.I(awaddr_i[60]),
        .O(awaddr_i_IBUF[60]));
  IBUF \awaddr_i_IBUF[61]_inst 
       (.I(awaddr_i[61]),
        .O(awaddr_i_IBUF[61]));
  IBUF \awaddr_i_IBUF[62]_inst 
       (.I(awaddr_i[62]),
        .O(awaddr_i_IBUF[62]));
  IBUF \awaddr_i_IBUF[63]_inst 
       (.I(awaddr_i[63]),
        .O(awaddr_i_IBUF[63]));
  IBUF \awaddr_i_IBUF[6]_inst 
       (.I(awaddr_i[6]),
        .O(awaddr_i_IBUF[6]));
  IBUF \awaddr_i_IBUF[7]_inst 
       (.I(awaddr_i[7]),
        .O(awaddr_i_IBUF[7]));
  IBUF \awaddr_i_IBUF[8]_inst 
       (.I(awaddr_i[8]),
        .O(awaddr_i_IBUF[8]));
  IBUF \awaddr_i_IBUF[9]_inst 
       (.I(awaddr_i[9]),
        .O(awaddr_i_IBUF[9]));
  IBUF \awprot_i_IBUF[0]_inst 
       (.I(awprot_i[0]),
        .O(awprot_i_IBUF[0]));
  IBUF \awprot_i_IBUF[1]_inst 
       (.I(awprot_i[1]),
        .O(awprot_i_IBUF[1]));
  IBUF \awprot_i_IBUF[2]_inst 
       (.I(awprot_i[2]),
        .O(awprot_i_IBUF[2]));
  IBUF \awprot_i_IBUF[3]_inst 
       (.I(awprot_i[3]),
        .O(awprot_i_IBUF[3]));
  IBUF \awprot_i_IBUF[4]_inst 
       (.I(awprot_i[4]),
        .O(awprot_i_IBUF[4]));
  IBUF \awprot_i_IBUF[5]_inst 
       (.I(awprot_i[5]),
        .O(awprot_i_IBUF[5]));
  OBUF \awready_o_OBUF[0]_inst 
       (.I(awready_o_OBUF[0]),
        .O(awready_o[0]));
  OBUF \awready_o_OBUF[1]_inst 
       (.I(awready_o_OBUF[1]),
        .O(awready_o[1]));
  IBUF \awvalid_i_IBUF[0]_inst 
       (.I(awvalid_i[0]),
        .O(awvalid_i_IBUF[0]));
  IBUF \awvalid_i_IBUF[1]_inst 
       (.I(awvalid_i[1]),
        .O(awvalid_i_IBUF[1]));
  IBUF \bready_i_IBUF[0]_inst 
       (.I(bready_i[0]),
        .O(bready_i_IBUF[0]));
  IBUF \bready_i_IBUF[1]_inst 
       (.I(bready_i[1]),
        .O(bready_i_IBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \bresp_err[0][1]_i_1 
       (.I0(\GEN_AW_ARBITERS[0].u_arb_aw_n_50 ),
        .I1(awvalid_i_IBUF[0]),
        .I2(\bresp_err_reg_n_0_[0][1] ),
        .O(\bresp_err[0][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    \bresp_err[1][1]_i_1 
       (.I0(\GEN_AW_ARBITERS[0].u_arb_aw_n_4 ),
        .I1(awvalid_i_IBUF[1]),
        .I2(\bresp_err_reg_n_0_[1][1] ),
        .O(\bresp_err[1][1]_i_1_n_0 ));
  FDCE \bresp_err_reg[0][1] 
       (.C(aclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\GEN_AW_ARBITERS[0].u_arb_aw_n_3 ),
        .D(\bresp_err[0][1]_i_1_n_0 ),
        .Q(\bresp_err_reg_n_0_[0][1] ));
  FDCE \bresp_err_reg[1][1] 
       (.C(aclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\GEN_AW_ARBITERS[0].u_arb_aw_n_3 ),
        .D(\bresp_err[1][1]_i_1_n_0 ),
        .Q(\bresp_err_reg_n_0_[1][1] ));
  OBUF \bresp_o_OBUF[0]_inst 
       (.I(bresp_o_OBUF[0]),
        .O(bresp_o[0]));
  OBUF \bresp_o_OBUF[1]_inst 
       (.I(bresp_o_OBUF[1]),
        .O(bresp_o[1]));
  OBUF \bresp_o_OBUF[2]_inst 
       (.I(bresp_o_OBUF[2]),
        .O(bresp_o[2]));
  OBUF \bresp_o_OBUF[3]_inst 
       (.I(bresp_o_OBUF[3]),
        .O(bresp_o[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h88F8)) 
    \bvalid_err[0]_i_1 
       (.I0(awvalid_i_IBUF[0]),
        .I1(\GEN_AW_ARBITERS[0].u_arb_aw_n_50 ),
        .I2(bvalid_err[0]),
        .I3(bready_i_IBUF[0]),
        .O(\bvalid_err[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h22F2)) 
    \bvalid_err[1]_i_1 
       (.I0(awvalid_i_IBUF[1]),
        .I1(\GEN_AW_ARBITERS[0].u_arb_aw_n_4 ),
        .I2(bvalid_err[1]),
        .I3(bready_i_IBUF[1]),
        .O(\bvalid_err[1]_i_1_n_0 ));
  FDCE \bvalid_err_reg[0] 
       (.C(aclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\GEN_AW_ARBITERS[0].u_arb_aw_n_3 ),
        .D(\bvalid_err[0]_i_1_n_0 ),
        .Q(bvalid_err[0]));
  FDCE \bvalid_err_reg[1] 
       (.C(aclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\GEN_AW_ARBITERS[0].u_arb_aw_n_3 ),
        .D(\bvalid_err[1]_i_1_n_0 ),
        .Q(bvalid_err[1]));
  OBUF \bvalid_o_OBUF[0]_inst 
       (.I(bvalid_o_OBUF[0]),
        .O(bvalid_o[0]));
  OBUF \bvalid_o_OBUF[1]_inst 
       (.I(bvalid_o_OBUF[1]),
        .O(bvalid_o[1]));
  OBUF \rdata_o_OBUF[0]_inst 
       (.I(rdata_o_OBUF[0]),
        .O(rdata_o[0]));
  OBUF \rdata_o_OBUF[10]_inst 
       (.I(rdata_o_OBUF[10]),
        .O(rdata_o[10]));
  OBUF \rdata_o_OBUF[11]_inst 
       (.I(rdata_o_OBUF[11]),
        .O(rdata_o[11]));
  OBUF \rdata_o_OBUF[12]_inst 
       (.I(rdata_o_OBUF[12]),
        .O(rdata_o[12]));
  OBUF \rdata_o_OBUF[13]_inst 
       (.I(rdata_o_OBUF[13]),
        .O(rdata_o[13]));
  OBUF \rdata_o_OBUF[14]_inst 
       (.I(rdata_o_OBUF[14]),
        .O(rdata_o[14]));
  OBUF \rdata_o_OBUF[15]_inst 
       (.I(rdata_o_OBUF[15]),
        .O(rdata_o[15]));
  OBUF \rdata_o_OBUF[16]_inst 
       (.I(rdata_o_OBUF[16]),
        .O(rdata_o[16]));
  OBUF \rdata_o_OBUF[17]_inst 
       (.I(rdata_o_OBUF[17]),
        .O(rdata_o[17]));
  OBUF \rdata_o_OBUF[18]_inst 
       (.I(rdata_o_OBUF[18]),
        .O(rdata_o[18]));
  OBUF \rdata_o_OBUF[19]_inst 
       (.I(rdata_o_OBUF[19]),
        .O(rdata_o[19]));
  OBUF \rdata_o_OBUF[1]_inst 
       (.I(rdata_o_OBUF[1]),
        .O(rdata_o[1]));
  OBUF \rdata_o_OBUF[20]_inst 
       (.I(rdata_o_OBUF[20]),
        .O(rdata_o[20]));
  OBUF \rdata_o_OBUF[21]_inst 
       (.I(rdata_o_OBUF[21]),
        .O(rdata_o[21]));
  OBUF \rdata_o_OBUF[22]_inst 
       (.I(rdata_o_OBUF[22]),
        .O(rdata_o[22]));
  OBUF \rdata_o_OBUF[23]_inst 
       (.I(rdata_o_OBUF[23]),
        .O(rdata_o[23]));
  OBUF \rdata_o_OBUF[24]_inst 
       (.I(rdata_o_OBUF[24]),
        .O(rdata_o[24]));
  OBUF \rdata_o_OBUF[25]_inst 
       (.I(rdata_o_OBUF[25]),
        .O(rdata_o[25]));
  OBUF \rdata_o_OBUF[26]_inst 
       (.I(rdata_o_OBUF[26]),
        .O(rdata_o[26]));
  OBUF \rdata_o_OBUF[27]_inst 
       (.I(rdata_o_OBUF[27]),
        .O(rdata_o[27]));
  OBUF \rdata_o_OBUF[28]_inst 
       (.I(rdata_o_OBUF[28]),
        .O(rdata_o[28]));
  OBUF \rdata_o_OBUF[29]_inst 
       (.I(rdata_o_OBUF[29]),
        .O(rdata_o[29]));
  OBUF \rdata_o_OBUF[2]_inst 
       (.I(rdata_o_OBUF[2]),
        .O(rdata_o[2]));
  OBUF \rdata_o_OBUF[30]_inst 
       (.I(rdata_o_OBUF[30]),
        .O(rdata_o[30]));
  OBUF \rdata_o_OBUF[31]_inst 
       (.I(rdata_o_OBUF[31]),
        .O(rdata_o[31]));
  OBUF \rdata_o_OBUF[32]_inst 
       (.I(rdata_o_OBUF[32]),
        .O(rdata_o[32]));
  OBUF \rdata_o_OBUF[33]_inst 
       (.I(rdata_o_OBUF[33]),
        .O(rdata_o[33]));
  OBUF \rdata_o_OBUF[34]_inst 
       (.I(rdata_o_OBUF[34]),
        .O(rdata_o[34]));
  OBUF \rdata_o_OBUF[35]_inst 
       (.I(rdata_o_OBUF[35]),
        .O(rdata_o[35]));
  OBUF \rdata_o_OBUF[36]_inst 
       (.I(rdata_o_OBUF[36]),
        .O(rdata_o[36]));
  OBUF \rdata_o_OBUF[37]_inst 
       (.I(rdata_o_OBUF[37]),
        .O(rdata_o[37]));
  OBUF \rdata_o_OBUF[38]_inst 
       (.I(rdata_o_OBUF[38]),
        .O(rdata_o[38]));
  OBUF \rdata_o_OBUF[39]_inst 
       (.I(rdata_o_OBUF[39]),
        .O(rdata_o[39]));
  OBUF \rdata_o_OBUF[3]_inst 
       (.I(rdata_o_OBUF[3]),
        .O(rdata_o[3]));
  OBUF \rdata_o_OBUF[40]_inst 
       (.I(rdata_o_OBUF[40]),
        .O(rdata_o[40]));
  OBUF \rdata_o_OBUF[41]_inst 
       (.I(rdata_o_OBUF[41]),
        .O(rdata_o[41]));
  OBUF \rdata_o_OBUF[42]_inst 
       (.I(rdata_o_OBUF[42]),
        .O(rdata_o[42]));
  OBUF \rdata_o_OBUF[43]_inst 
       (.I(rdata_o_OBUF[43]),
        .O(rdata_o[43]));
  OBUF \rdata_o_OBUF[44]_inst 
       (.I(rdata_o_OBUF[44]),
        .O(rdata_o[44]));
  OBUF \rdata_o_OBUF[45]_inst 
       (.I(rdata_o_OBUF[45]),
        .O(rdata_o[45]));
  OBUF \rdata_o_OBUF[46]_inst 
       (.I(rdata_o_OBUF[46]),
        .O(rdata_o[46]));
  OBUF \rdata_o_OBUF[47]_inst 
       (.I(rdata_o_OBUF[47]),
        .O(rdata_o[47]));
  OBUF \rdata_o_OBUF[48]_inst 
       (.I(rdata_o_OBUF[48]),
        .O(rdata_o[48]));
  OBUF \rdata_o_OBUF[49]_inst 
       (.I(rdata_o_OBUF[49]),
        .O(rdata_o[49]));
  OBUF \rdata_o_OBUF[4]_inst 
       (.I(rdata_o_OBUF[4]),
        .O(rdata_o[4]));
  OBUF \rdata_o_OBUF[50]_inst 
       (.I(rdata_o_OBUF[50]),
        .O(rdata_o[50]));
  OBUF \rdata_o_OBUF[51]_inst 
       (.I(rdata_o_OBUF[51]),
        .O(rdata_o[51]));
  OBUF \rdata_o_OBUF[52]_inst 
       (.I(rdata_o_OBUF[52]),
        .O(rdata_o[52]));
  OBUF \rdata_o_OBUF[53]_inst 
       (.I(rdata_o_OBUF[53]),
        .O(rdata_o[53]));
  OBUF \rdata_o_OBUF[54]_inst 
       (.I(rdata_o_OBUF[54]),
        .O(rdata_o[54]));
  OBUF \rdata_o_OBUF[55]_inst 
       (.I(rdata_o_OBUF[55]),
        .O(rdata_o[55]));
  OBUF \rdata_o_OBUF[56]_inst 
       (.I(rdata_o_OBUF[56]),
        .O(rdata_o[56]));
  OBUF \rdata_o_OBUF[57]_inst 
       (.I(rdata_o_OBUF[57]),
        .O(rdata_o[57]));
  OBUF \rdata_o_OBUF[58]_inst 
       (.I(rdata_o_OBUF[58]),
        .O(rdata_o[58]));
  OBUF \rdata_o_OBUF[59]_inst 
       (.I(rdata_o_OBUF[59]),
        .O(rdata_o[59]));
  OBUF \rdata_o_OBUF[5]_inst 
       (.I(rdata_o_OBUF[5]),
        .O(rdata_o[5]));
  OBUF \rdata_o_OBUF[60]_inst 
       (.I(rdata_o_OBUF[60]),
        .O(rdata_o[60]));
  OBUF \rdata_o_OBUF[61]_inst 
       (.I(rdata_o_OBUF[61]),
        .O(rdata_o[61]));
  OBUF \rdata_o_OBUF[62]_inst 
       (.I(rdata_o_OBUF[62]),
        .O(rdata_o[62]));
  OBUF \rdata_o_OBUF[63]_inst 
       (.I(rdata_o_OBUF[63]),
        .O(rdata_o[63]));
  OBUF \rdata_o_OBUF[6]_inst 
       (.I(rdata_o_OBUF[6]),
        .O(rdata_o[6]));
  OBUF \rdata_o_OBUF[7]_inst 
       (.I(rdata_o_OBUF[7]),
        .O(rdata_o[7]));
  OBUF \rdata_o_OBUF[8]_inst 
       (.I(rdata_o_OBUF[8]),
        .O(rdata_o[8]));
  OBUF \rdata_o_OBUF[9]_inst 
       (.I(rdata_o_OBUF[9]),
        .O(rdata_o[9]));
  IBUF \rready_i_IBUF[0]_inst 
       (.I(rready_i[0]),
        .O(rready_i_IBUF[0]));
  IBUF \rready_i_IBUF[1]_inst 
       (.I(rready_i[1]),
        .O(rready_i_IBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    \rresp_err[0][1]_i_1 
       (.I0(\GEN_AR_ARBITERS[0].u_arb_ar_n_108 ),
        .I1(arvalid_i_IBUF[0]),
        .I2(\rresp_err_reg_n_0_[0][1] ),
        .O(\rresp_err[0][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    \rresp_err[1][1]_i_1 
       (.I0(\GEN_AR_ARBITERS[0].u_arb_ar_n_2 ),
        .I1(arvalid_i_IBUF[1]),
        .I2(\rresp_err_reg_n_0_[1][1] ),
        .O(\rresp_err[1][1]_i_1_n_0 ));
  FDCE \rresp_err_reg[0][1] 
       (.C(aclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\GEN_AW_ARBITERS[0].u_arb_aw_n_3 ),
        .D(\rresp_err[0][1]_i_1_n_0 ),
        .Q(\rresp_err_reg_n_0_[0][1] ));
  FDCE \rresp_err_reg[1][1] 
       (.C(aclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\GEN_AW_ARBITERS[0].u_arb_aw_n_3 ),
        .D(\rresp_err[1][1]_i_1_n_0 ),
        .Q(\rresp_err_reg_n_0_[1][1] ));
  OBUF \rresp_o_OBUF[0]_inst 
       (.I(rresp_o_OBUF[0]),
        .O(rresp_o[0]));
  OBUF \rresp_o_OBUF[1]_inst 
       (.I(rresp_o_OBUF[1]),
        .O(rresp_o[1]));
  OBUF \rresp_o_OBUF[2]_inst 
       (.I(rresp_o_OBUF[2]),
        .O(rresp_o[2]));
  OBUF \rresp_o_OBUF[3]_inst 
       (.I(rresp_o_OBUF[3]),
        .O(rresp_o[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h22F2)) 
    \rvalid_err[0]_i_1 
       (.I0(arvalid_i_IBUF[0]),
        .I1(\GEN_AR_ARBITERS[0].u_arb_ar_n_108 ),
        .I2(rvalid_err[0]),
        .I3(rready_i_IBUF[0]),
        .O(\rvalid_err[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h22F2)) 
    \rvalid_err[1]_i_1 
       (.I0(arvalid_i_IBUF[1]),
        .I1(\GEN_AR_ARBITERS[0].u_arb_ar_n_2 ),
        .I2(rvalid_err[1]),
        .I3(rready_i_IBUF[1]),
        .O(\rvalid_err[1]_i_1_n_0 ));
  FDCE \rvalid_err_reg[0] 
       (.C(aclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\GEN_AW_ARBITERS[0].u_arb_aw_n_3 ),
        .D(\rvalid_err[0]_i_1_n_0 ),
        .Q(rvalid_err[0]));
  FDCE \rvalid_err_reg[1] 
       (.C(aclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\GEN_AW_ARBITERS[0].u_arb_aw_n_3 ),
        .D(\rvalid_err[1]_i_1_n_0 ),
        .Q(rvalid_err[1]));
  OBUF \rvalid_o_OBUF[0]_inst 
       (.I(rvalid_o_OBUF[0]),
        .O(rvalid_o[0]));
  OBUF \rvalid_o_OBUF[1]_inst 
       (.I(rvalid_o_OBUF[1]),
        .O(rvalid_o[1]));
  OBUF \s_araddr_o_OBUF[0]_inst 
       (.I(s_araddr_o_OBUF[0]),
        .O(s_araddr_o[0]));
  OBUF \s_araddr_o_OBUF[10]_inst 
       (.I(s_araddr_o_OBUF[10]),
        .O(s_araddr_o[10]));
  OBUF \s_araddr_o_OBUF[11]_inst 
       (.I(s_araddr_o_OBUF[11]),
        .O(s_araddr_o[11]));
  OBUF \s_araddr_o_OBUF[12]_inst 
       (.I(s_araddr_o_OBUF[12]),
        .O(s_araddr_o[12]));
  OBUF \s_araddr_o_OBUF[13]_inst 
       (.I(s_araddr_o_OBUF[13]),
        .O(s_araddr_o[13]));
  OBUF \s_araddr_o_OBUF[14]_inst 
       (.I(s_araddr_o_OBUF[14]),
        .O(s_araddr_o[14]));
  OBUF \s_araddr_o_OBUF[15]_inst 
       (.I(s_araddr_o_OBUF[15]),
        .O(s_araddr_o[15]));
  OBUF \s_araddr_o_OBUF[16]_inst 
       (.I(s_araddr_o_OBUF[16]),
        .O(s_araddr_o[16]));
  OBUF \s_araddr_o_OBUF[17]_inst 
       (.I(s_araddr_o_OBUF[17]),
        .O(s_araddr_o[17]));
  OBUF \s_araddr_o_OBUF[18]_inst 
       (.I(s_araddr_o_OBUF[18]),
        .O(s_araddr_o[18]));
  OBUF \s_araddr_o_OBUF[19]_inst 
       (.I(s_araddr_o_OBUF[19]),
        .O(s_araddr_o[19]));
  OBUF \s_araddr_o_OBUF[1]_inst 
       (.I(s_araddr_o_OBUF[1]),
        .O(s_araddr_o[1]));
  OBUF \s_araddr_o_OBUF[20]_inst 
       (.I(s_araddr_o_OBUF[20]),
        .O(s_araddr_o[20]));
  OBUF \s_araddr_o_OBUF[21]_inst 
       (.I(s_araddr_o_OBUF[21]),
        .O(s_araddr_o[21]));
  OBUF \s_araddr_o_OBUF[22]_inst 
       (.I(s_araddr_o_OBUF[22]),
        .O(s_araddr_o[22]));
  OBUF \s_araddr_o_OBUF[23]_inst 
       (.I(s_araddr_o_OBUF[23]),
        .O(s_araddr_o[23]));
  OBUF \s_araddr_o_OBUF[24]_inst 
       (.I(s_araddr_o_OBUF[24]),
        .O(s_araddr_o[24]));
  OBUF \s_araddr_o_OBUF[25]_inst 
       (.I(s_araddr_o_OBUF[25]),
        .O(s_araddr_o[25]));
  OBUF \s_araddr_o_OBUF[26]_inst 
       (.I(s_araddr_o_OBUF[26]),
        .O(s_araddr_o[26]));
  OBUF \s_araddr_o_OBUF[27]_inst 
       (.I(s_araddr_o_OBUF[27]),
        .O(s_araddr_o[27]));
  OBUF \s_araddr_o_OBUF[28]_inst 
       (.I(s_araddr_o_OBUF[28]),
        .O(s_araddr_o[28]));
  OBUF \s_araddr_o_OBUF[29]_inst 
       (.I(s_araddr_o_OBUF[29]),
        .O(s_araddr_o[29]));
  OBUF \s_araddr_o_OBUF[2]_inst 
       (.I(s_araddr_o_OBUF[2]),
        .O(s_araddr_o[2]));
  OBUF \s_araddr_o_OBUF[30]_inst 
       (.I(s_araddr_o_OBUF[30]),
        .O(s_araddr_o[30]));
  OBUF \s_araddr_o_OBUF[31]_inst 
       (.I(s_araddr_o_OBUF[31]),
        .O(s_araddr_o[31]));
  OBUF \s_araddr_o_OBUF[32]_inst 
       (.I(1'b0),
        .O(s_araddr_o[32]));
  OBUF \s_araddr_o_OBUF[33]_inst 
       (.I(1'b0),
        .O(s_araddr_o[33]));
  OBUF \s_araddr_o_OBUF[34]_inst 
       (.I(1'b0),
        .O(s_araddr_o[34]));
  OBUF \s_araddr_o_OBUF[35]_inst 
       (.I(1'b0),
        .O(s_araddr_o[35]));
  OBUF \s_araddr_o_OBUF[36]_inst 
       (.I(1'b0),
        .O(s_araddr_o[36]));
  OBUF \s_araddr_o_OBUF[37]_inst 
       (.I(1'b0),
        .O(s_araddr_o[37]));
  OBUF \s_araddr_o_OBUF[38]_inst 
       (.I(1'b0),
        .O(s_araddr_o[38]));
  OBUF \s_araddr_o_OBUF[39]_inst 
       (.I(1'b0),
        .O(s_araddr_o[39]));
  OBUF \s_araddr_o_OBUF[3]_inst 
       (.I(s_araddr_o_OBUF[3]),
        .O(s_araddr_o[3]));
  OBUF \s_araddr_o_OBUF[40]_inst 
       (.I(1'b0),
        .O(s_araddr_o[40]));
  OBUF \s_araddr_o_OBUF[41]_inst 
       (.I(1'b0),
        .O(s_araddr_o[41]));
  OBUF \s_araddr_o_OBUF[42]_inst 
       (.I(1'b0),
        .O(s_araddr_o[42]));
  OBUF \s_araddr_o_OBUF[43]_inst 
       (.I(1'b0),
        .O(s_araddr_o[43]));
  OBUF \s_araddr_o_OBUF[44]_inst 
       (.I(1'b0),
        .O(s_araddr_o[44]));
  OBUF \s_araddr_o_OBUF[45]_inst 
       (.I(1'b0),
        .O(s_araddr_o[45]));
  OBUF \s_araddr_o_OBUF[46]_inst 
       (.I(1'b0),
        .O(s_araddr_o[46]));
  OBUF \s_araddr_o_OBUF[47]_inst 
       (.I(1'b0),
        .O(s_araddr_o[47]));
  OBUF \s_araddr_o_OBUF[48]_inst 
       (.I(1'b0),
        .O(s_araddr_o[48]));
  OBUF \s_araddr_o_OBUF[49]_inst 
       (.I(1'b0),
        .O(s_araddr_o[49]));
  OBUF \s_araddr_o_OBUF[4]_inst 
       (.I(s_araddr_o_OBUF[4]),
        .O(s_araddr_o[4]));
  OBUF \s_araddr_o_OBUF[50]_inst 
       (.I(1'b0),
        .O(s_araddr_o[50]));
  OBUF \s_araddr_o_OBUF[51]_inst 
       (.I(1'b0),
        .O(s_araddr_o[51]));
  OBUF \s_araddr_o_OBUF[52]_inst 
       (.I(1'b0),
        .O(s_araddr_o[52]));
  OBUF \s_araddr_o_OBUF[53]_inst 
       (.I(1'b0),
        .O(s_araddr_o[53]));
  OBUF \s_araddr_o_OBUF[54]_inst 
       (.I(1'b0),
        .O(s_araddr_o[54]));
  OBUF \s_araddr_o_OBUF[55]_inst 
       (.I(1'b0),
        .O(s_araddr_o[55]));
  OBUF \s_araddr_o_OBUF[56]_inst 
       (.I(1'b0),
        .O(s_araddr_o[56]));
  OBUF \s_araddr_o_OBUF[57]_inst 
       (.I(1'b0),
        .O(s_araddr_o[57]));
  OBUF \s_araddr_o_OBUF[58]_inst 
       (.I(1'b0),
        .O(s_araddr_o[58]));
  OBUF \s_araddr_o_OBUF[59]_inst 
       (.I(1'b0),
        .O(s_araddr_o[59]));
  OBUF \s_araddr_o_OBUF[5]_inst 
       (.I(s_araddr_o_OBUF[5]),
        .O(s_araddr_o[5]));
  OBUF \s_araddr_o_OBUF[60]_inst 
       (.I(1'b0),
        .O(s_araddr_o[60]));
  OBUF \s_araddr_o_OBUF[61]_inst 
       (.I(1'b0),
        .O(s_araddr_o[61]));
  OBUF \s_araddr_o_OBUF[62]_inst 
       (.I(1'b0),
        .O(s_araddr_o[62]));
  OBUF \s_araddr_o_OBUF[63]_inst 
       (.I(1'b0),
        .O(s_araddr_o[63]));
  OBUF \s_araddr_o_OBUF[6]_inst 
       (.I(s_araddr_o_OBUF[6]),
        .O(s_araddr_o[6]));
  OBUF \s_araddr_o_OBUF[7]_inst 
       (.I(s_araddr_o_OBUF[7]),
        .O(s_araddr_o[7]));
  OBUF \s_araddr_o_OBUF[8]_inst 
       (.I(s_araddr_o_OBUF[8]),
        .O(s_araddr_o[8]));
  OBUF \s_araddr_o_OBUF[9]_inst 
       (.I(s_araddr_o_OBUF[9]),
        .O(s_araddr_o[9]));
  OBUFT \s_arprot_o_OBUF[0]_inst 
       (.I(1'b0),
        .O(s_arprot_o[0]),
        .T(1'b1));
  OBUFT \s_arprot_o_OBUF[1]_inst 
       (.I(1'b0),
        .O(s_arprot_o[1]),
        .T(1'b1));
  OBUFT \s_arprot_o_OBUF[2]_inst 
       (.I(1'b0),
        .O(s_arprot_o[2]),
        .T(1'b1));
  OBUFT \s_arprot_o_OBUF[3]_inst 
       (.I(1'b0),
        .O(s_arprot_o[3]),
        .T(1'b1));
  OBUFT \s_arprot_o_OBUF[4]_inst 
       (.I(1'b0),
        .O(s_arprot_o[4]),
        .T(1'b1));
  OBUFT \s_arprot_o_OBUF[5]_inst 
       (.I(1'b0),
        .O(s_arprot_o[5]),
        .T(1'b1));
  IBUF \s_arready_i_IBUF[0]_inst 
       (.I(s_arready_i[0]),
        .O(s_arready_i_IBUF));
  OBUF \s_arvalid_o_OBUF[0]_inst 
       (.I(s_arvalid_o_OBUF),
        .O(s_arvalid_o[0]));
  OBUF \s_arvalid_o_OBUF[1]_inst 
       (.I(1'b0),
        .O(s_arvalid_o[1]));
  OBUF \s_awaddr_o_OBUF[0]_inst 
       (.I(s_awaddr_o_OBUF[0]),
        .O(s_awaddr_o[0]));
  OBUF \s_awaddr_o_OBUF[10]_inst 
       (.I(s_awaddr_o_OBUF[10]),
        .O(s_awaddr_o[10]));
  OBUF \s_awaddr_o_OBUF[11]_inst 
       (.I(s_awaddr_o_OBUF[11]),
        .O(s_awaddr_o[11]));
  OBUF \s_awaddr_o_OBUF[12]_inst 
       (.I(s_awaddr_o_OBUF[12]),
        .O(s_awaddr_o[12]));
  OBUF \s_awaddr_o_OBUF[13]_inst 
       (.I(s_awaddr_o_OBUF[13]),
        .O(s_awaddr_o[13]));
  OBUF \s_awaddr_o_OBUF[14]_inst 
       (.I(s_awaddr_o_OBUF[14]),
        .O(s_awaddr_o[14]));
  OBUF \s_awaddr_o_OBUF[15]_inst 
       (.I(s_awaddr_o_OBUF[15]),
        .O(s_awaddr_o[15]));
  OBUF \s_awaddr_o_OBUF[16]_inst 
       (.I(s_awaddr_o_OBUF[16]),
        .O(s_awaddr_o[16]));
  OBUF \s_awaddr_o_OBUF[17]_inst 
       (.I(s_awaddr_o_OBUF[17]),
        .O(s_awaddr_o[17]));
  OBUF \s_awaddr_o_OBUF[18]_inst 
       (.I(s_awaddr_o_OBUF[18]),
        .O(s_awaddr_o[18]));
  OBUF \s_awaddr_o_OBUF[19]_inst 
       (.I(s_awaddr_o_OBUF[19]),
        .O(s_awaddr_o[19]));
  OBUF \s_awaddr_o_OBUF[1]_inst 
       (.I(s_awaddr_o_OBUF[1]),
        .O(s_awaddr_o[1]));
  OBUF \s_awaddr_o_OBUF[20]_inst 
       (.I(s_awaddr_o_OBUF[20]),
        .O(s_awaddr_o[20]));
  OBUF \s_awaddr_o_OBUF[21]_inst 
       (.I(s_awaddr_o_OBUF[21]),
        .O(s_awaddr_o[21]));
  OBUF \s_awaddr_o_OBUF[22]_inst 
       (.I(s_awaddr_o_OBUF[22]),
        .O(s_awaddr_o[22]));
  OBUF \s_awaddr_o_OBUF[23]_inst 
       (.I(s_awaddr_o_OBUF[23]),
        .O(s_awaddr_o[23]));
  OBUF \s_awaddr_o_OBUF[24]_inst 
       (.I(s_awaddr_o_OBUF[24]),
        .O(s_awaddr_o[24]));
  OBUF \s_awaddr_o_OBUF[25]_inst 
       (.I(s_awaddr_o_OBUF[25]),
        .O(s_awaddr_o[25]));
  OBUF \s_awaddr_o_OBUF[26]_inst 
       (.I(s_awaddr_o_OBUF[26]),
        .O(s_awaddr_o[26]));
  OBUF \s_awaddr_o_OBUF[27]_inst 
       (.I(s_awaddr_o_OBUF[27]),
        .O(s_awaddr_o[27]));
  OBUF \s_awaddr_o_OBUF[28]_inst 
       (.I(s_awaddr_o_OBUF[28]),
        .O(s_awaddr_o[28]));
  OBUF \s_awaddr_o_OBUF[29]_inst 
       (.I(s_awaddr_o_OBUF[29]),
        .O(s_awaddr_o[29]));
  OBUF \s_awaddr_o_OBUF[2]_inst 
       (.I(s_awaddr_o_OBUF[2]),
        .O(s_awaddr_o[2]));
  OBUF \s_awaddr_o_OBUF[30]_inst 
       (.I(s_awaddr_o_OBUF[30]),
        .O(s_awaddr_o[30]));
  OBUF \s_awaddr_o_OBUF[31]_inst 
       (.I(s_awaddr_o_OBUF[31]),
        .O(s_awaddr_o[31]));
  OBUF \s_awaddr_o_OBUF[32]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[32]));
  OBUF \s_awaddr_o_OBUF[33]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[33]));
  OBUF \s_awaddr_o_OBUF[34]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[34]));
  OBUF \s_awaddr_o_OBUF[35]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[35]));
  OBUF \s_awaddr_o_OBUF[36]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[36]));
  OBUF \s_awaddr_o_OBUF[37]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[37]));
  OBUF \s_awaddr_o_OBUF[38]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[38]));
  OBUF \s_awaddr_o_OBUF[39]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[39]));
  OBUF \s_awaddr_o_OBUF[3]_inst 
       (.I(s_awaddr_o_OBUF[3]),
        .O(s_awaddr_o[3]));
  OBUF \s_awaddr_o_OBUF[40]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[40]));
  OBUF \s_awaddr_o_OBUF[41]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[41]));
  OBUF \s_awaddr_o_OBUF[42]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[42]));
  OBUF \s_awaddr_o_OBUF[43]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[43]));
  OBUF \s_awaddr_o_OBUF[44]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[44]));
  OBUF \s_awaddr_o_OBUF[45]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[45]));
  OBUF \s_awaddr_o_OBUF[46]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[46]));
  OBUF \s_awaddr_o_OBUF[47]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[47]));
  OBUF \s_awaddr_o_OBUF[48]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[48]));
  OBUF \s_awaddr_o_OBUF[49]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[49]));
  OBUF \s_awaddr_o_OBUF[4]_inst 
       (.I(s_awaddr_o_OBUF[4]),
        .O(s_awaddr_o[4]));
  OBUF \s_awaddr_o_OBUF[50]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[50]));
  OBUF \s_awaddr_o_OBUF[51]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[51]));
  OBUF \s_awaddr_o_OBUF[52]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[52]));
  OBUF \s_awaddr_o_OBUF[53]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[53]));
  OBUF \s_awaddr_o_OBUF[54]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[54]));
  OBUF \s_awaddr_o_OBUF[55]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[55]));
  OBUF \s_awaddr_o_OBUF[56]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[56]));
  OBUF \s_awaddr_o_OBUF[57]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[57]));
  OBUF \s_awaddr_o_OBUF[58]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[58]));
  OBUF \s_awaddr_o_OBUF[59]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[59]));
  OBUF \s_awaddr_o_OBUF[5]_inst 
       (.I(s_awaddr_o_OBUF[5]),
        .O(s_awaddr_o[5]));
  OBUF \s_awaddr_o_OBUF[60]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[60]));
  OBUF \s_awaddr_o_OBUF[61]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[61]));
  OBUF \s_awaddr_o_OBUF[62]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[62]));
  OBUF \s_awaddr_o_OBUF[63]_inst 
       (.I(1'b0),
        .O(s_awaddr_o[63]));
  OBUF \s_awaddr_o_OBUF[6]_inst 
       (.I(s_awaddr_o_OBUF[6]),
        .O(s_awaddr_o[6]));
  OBUF \s_awaddr_o_OBUF[7]_inst 
       (.I(s_awaddr_o_OBUF[7]),
        .O(s_awaddr_o[7]));
  OBUF \s_awaddr_o_OBUF[8]_inst 
       (.I(s_awaddr_o_OBUF[8]),
        .O(s_awaddr_o[8]));
  OBUF \s_awaddr_o_OBUF[9]_inst 
       (.I(s_awaddr_o_OBUF[9]),
        .O(s_awaddr_o[9]));
  OBUF \s_awprot_o_OBUF[0]_inst 
       (.I(s_awprot_o_OBUF[0]),
        .O(s_awprot_o[0]));
  OBUF \s_awprot_o_OBUF[1]_inst 
       (.I(s_awprot_o_OBUF[1]),
        .O(s_awprot_o[1]));
  OBUF \s_awprot_o_OBUF[2]_inst 
       (.I(s_awprot_o_OBUF[2]),
        .O(s_awprot_o[2]));
  OBUF \s_awprot_o_OBUF[3]_inst 
       (.I(1'b0),
        .O(s_awprot_o[3]));
  OBUF \s_awprot_o_OBUF[4]_inst 
       (.I(1'b0),
        .O(s_awprot_o[4]));
  OBUF \s_awprot_o_OBUF[5]_inst 
       (.I(1'b0),
        .O(s_awprot_o[5]));
  IBUF \s_awready_i_IBUF[0]_inst 
       (.I(s_awready_i[0]),
        .O(s_awready_i_IBUF));
  OBUF \s_awvalid_o_OBUF[0]_inst 
       (.I(s_awvalid_o_OBUF),
        .O(s_awvalid_o[0]));
  OBUF \s_awvalid_o_OBUF[1]_inst 
       (.I(1'b0),
        .O(s_awvalid_o[1]));
  OBUF \s_bready_o_OBUF[0]_inst 
       (.I(s_bready_o_OBUF),
        .O(s_bready_o[0]));
  OBUF \s_bready_o_OBUF[1]_inst 
       (.I(1'b0),
        .O(s_bready_o[1]));
  IBUF \s_bresp_i_IBUF[0]_inst 
       (.I(s_bresp_i[0]),
        .O(s_bresp_i_IBUF[0]));
  IBUF \s_bresp_i_IBUF[1]_inst 
       (.I(s_bresp_i[1]),
        .O(s_bresp_i_IBUF[1]));
  IBUF \s_bvalid_i_IBUF[0]_inst 
       (.I(s_bvalid_i[0]),
        .O(s_bvalid_i_IBUF));
  IBUF \s_rdata_i_IBUF[0]_inst 
       (.I(s_rdata_i[0]),
        .O(s_rdata_i_IBUF[0]));
  IBUF \s_rdata_i_IBUF[10]_inst 
       (.I(s_rdata_i[10]),
        .O(s_rdata_i_IBUF[10]));
  IBUF \s_rdata_i_IBUF[11]_inst 
       (.I(s_rdata_i[11]),
        .O(s_rdata_i_IBUF[11]));
  IBUF \s_rdata_i_IBUF[12]_inst 
       (.I(s_rdata_i[12]),
        .O(s_rdata_i_IBUF[12]));
  IBUF \s_rdata_i_IBUF[13]_inst 
       (.I(s_rdata_i[13]),
        .O(s_rdata_i_IBUF[13]));
  IBUF \s_rdata_i_IBUF[14]_inst 
       (.I(s_rdata_i[14]),
        .O(s_rdata_i_IBUF[14]));
  IBUF \s_rdata_i_IBUF[15]_inst 
       (.I(s_rdata_i[15]),
        .O(s_rdata_i_IBUF[15]));
  IBUF \s_rdata_i_IBUF[16]_inst 
       (.I(s_rdata_i[16]),
        .O(s_rdata_i_IBUF[16]));
  IBUF \s_rdata_i_IBUF[17]_inst 
       (.I(s_rdata_i[17]),
        .O(s_rdata_i_IBUF[17]));
  IBUF \s_rdata_i_IBUF[18]_inst 
       (.I(s_rdata_i[18]),
        .O(s_rdata_i_IBUF[18]));
  IBUF \s_rdata_i_IBUF[19]_inst 
       (.I(s_rdata_i[19]),
        .O(s_rdata_i_IBUF[19]));
  IBUF \s_rdata_i_IBUF[1]_inst 
       (.I(s_rdata_i[1]),
        .O(s_rdata_i_IBUF[1]));
  IBUF \s_rdata_i_IBUF[20]_inst 
       (.I(s_rdata_i[20]),
        .O(s_rdata_i_IBUF[20]));
  IBUF \s_rdata_i_IBUF[21]_inst 
       (.I(s_rdata_i[21]),
        .O(s_rdata_i_IBUF[21]));
  IBUF \s_rdata_i_IBUF[22]_inst 
       (.I(s_rdata_i[22]),
        .O(s_rdata_i_IBUF[22]));
  IBUF \s_rdata_i_IBUF[23]_inst 
       (.I(s_rdata_i[23]),
        .O(s_rdata_i_IBUF[23]));
  IBUF \s_rdata_i_IBUF[24]_inst 
       (.I(s_rdata_i[24]),
        .O(s_rdata_i_IBUF[24]));
  IBUF \s_rdata_i_IBUF[25]_inst 
       (.I(s_rdata_i[25]),
        .O(s_rdata_i_IBUF[25]));
  IBUF \s_rdata_i_IBUF[26]_inst 
       (.I(s_rdata_i[26]),
        .O(s_rdata_i_IBUF[26]));
  IBUF \s_rdata_i_IBUF[27]_inst 
       (.I(s_rdata_i[27]),
        .O(s_rdata_i_IBUF[27]));
  IBUF \s_rdata_i_IBUF[28]_inst 
       (.I(s_rdata_i[28]),
        .O(s_rdata_i_IBUF[28]));
  IBUF \s_rdata_i_IBUF[29]_inst 
       (.I(s_rdata_i[29]),
        .O(s_rdata_i_IBUF[29]));
  IBUF \s_rdata_i_IBUF[2]_inst 
       (.I(s_rdata_i[2]),
        .O(s_rdata_i_IBUF[2]));
  IBUF \s_rdata_i_IBUF[30]_inst 
       (.I(s_rdata_i[30]),
        .O(s_rdata_i_IBUF[30]));
  IBUF \s_rdata_i_IBUF[31]_inst 
       (.I(s_rdata_i[31]),
        .O(s_rdata_i_IBUF[31]));
  IBUF \s_rdata_i_IBUF[3]_inst 
       (.I(s_rdata_i[3]),
        .O(s_rdata_i_IBUF[3]));
  IBUF \s_rdata_i_IBUF[4]_inst 
       (.I(s_rdata_i[4]),
        .O(s_rdata_i_IBUF[4]));
  IBUF \s_rdata_i_IBUF[5]_inst 
       (.I(s_rdata_i[5]),
        .O(s_rdata_i_IBUF[5]));
  IBUF \s_rdata_i_IBUF[6]_inst 
       (.I(s_rdata_i[6]),
        .O(s_rdata_i_IBUF[6]));
  IBUF \s_rdata_i_IBUF[7]_inst 
       (.I(s_rdata_i[7]),
        .O(s_rdata_i_IBUF[7]));
  IBUF \s_rdata_i_IBUF[8]_inst 
       (.I(s_rdata_i[8]),
        .O(s_rdata_i_IBUF[8]));
  IBUF \s_rdata_i_IBUF[9]_inst 
       (.I(s_rdata_i[9]),
        .O(s_rdata_i_IBUF[9]));
  OBUF \s_rready_o_OBUF[0]_inst 
       (.I(s_rready_o_OBUF),
        .O(s_rready_o[0]));
  OBUF \s_rready_o_OBUF[1]_inst 
       (.I(1'b0),
        .O(s_rready_o[1]));
  IBUF \s_rresp_i_IBUF[0]_inst 
       (.I(s_rresp_i[0]),
        .O(s_rresp_i_IBUF[0]));
  IBUF \s_rresp_i_IBUF[1]_inst 
       (.I(s_rresp_i[1]),
        .O(s_rresp_i_IBUF[1]));
  IBUF \s_rvalid_i_IBUF[0]_inst 
       (.I(s_rvalid_i[0]),
        .O(s_rvalid_i_IBUF));
  OBUF \s_wdata_o_OBUF[0]_inst 
       (.I(s_wdata_o_OBUF[0]),
        .O(s_wdata_o[0]));
  OBUF \s_wdata_o_OBUF[10]_inst 
       (.I(s_wdata_o_OBUF[10]),
        .O(s_wdata_o[10]));
  OBUF \s_wdata_o_OBUF[11]_inst 
       (.I(s_wdata_o_OBUF[11]),
        .O(s_wdata_o[11]));
  OBUF \s_wdata_o_OBUF[12]_inst 
       (.I(s_wdata_o_OBUF[12]),
        .O(s_wdata_o[12]));
  OBUF \s_wdata_o_OBUF[13]_inst 
       (.I(s_wdata_o_OBUF[13]),
        .O(s_wdata_o[13]));
  OBUF \s_wdata_o_OBUF[14]_inst 
       (.I(s_wdata_o_OBUF[14]),
        .O(s_wdata_o[14]));
  OBUF \s_wdata_o_OBUF[15]_inst 
       (.I(s_wdata_o_OBUF[15]),
        .O(s_wdata_o[15]));
  OBUF \s_wdata_o_OBUF[16]_inst 
       (.I(s_wdata_o_OBUF[16]),
        .O(s_wdata_o[16]));
  OBUF \s_wdata_o_OBUF[17]_inst 
       (.I(s_wdata_o_OBUF[17]),
        .O(s_wdata_o[17]));
  OBUF \s_wdata_o_OBUF[18]_inst 
       (.I(s_wdata_o_OBUF[18]),
        .O(s_wdata_o[18]));
  OBUF \s_wdata_o_OBUF[19]_inst 
       (.I(s_wdata_o_OBUF[19]),
        .O(s_wdata_o[19]));
  OBUF \s_wdata_o_OBUF[1]_inst 
       (.I(s_wdata_o_OBUF[1]),
        .O(s_wdata_o[1]));
  OBUF \s_wdata_o_OBUF[20]_inst 
       (.I(s_wdata_o_OBUF[20]),
        .O(s_wdata_o[20]));
  OBUF \s_wdata_o_OBUF[21]_inst 
       (.I(s_wdata_o_OBUF[21]),
        .O(s_wdata_o[21]));
  OBUF \s_wdata_o_OBUF[22]_inst 
       (.I(s_wdata_o_OBUF[22]),
        .O(s_wdata_o[22]));
  OBUF \s_wdata_o_OBUF[23]_inst 
       (.I(s_wdata_o_OBUF[23]),
        .O(s_wdata_o[23]));
  OBUF \s_wdata_o_OBUF[24]_inst 
       (.I(s_wdata_o_OBUF[24]),
        .O(s_wdata_o[24]));
  OBUF \s_wdata_o_OBUF[25]_inst 
       (.I(s_wdata_o_OBUF[25]),
        .O(s_wdata_o[25]));
  OBUF \s_wdata_o_OBUF[26]_inst 
       (.I(s_wdata_o_OBUF[26]),
        .O(s_wdata_o[26]));
  OBUF \s_wdata_o_OBUF[27]_inst 
       (.I(s_wdata_o_OBUF[27]),
        .O(s_wdata_o[27]));
  OBUF \s_wdata_o_OBUF[28]_inst 
       (.I(s_wdata_o_OBUF[28]),
        .O(s_wdata_o[28]));
  OBUF \s_wdata_o_OBUF[29]_inst 
       (.I(s_wdata_o_OBUF[29]),
        .O(s_wdata_o[29]));
  OBUF \s_wdata_o_OBUF[2]_inst 
       (.I(s_wdata_o_OBUF[2]),
        .O(s_wdata_o[2]));
  OBUF \s_wdata_o_OBUF[30]_inst 
       (.I(s_wdata_o_OBUF[30]),
        .O(s_wdata_o[30]));
  OBUF \s_wdata_o_OBUF[31]_inst 
       (.I(s_wdata_o_OBUF[31]),
        .O(s_wdata_o[31]));
  OBUF \s_wdata_o_OBUF[32]_inst 
       (.I(1'b0),
        .O(s_wdata_o[32]));
  OBUF \s_wdata_o_OBUF[33]_inst 
       (.I(1'b0),
        .O(s_wdata_o[33]));
  OBUF \s_wdata_o_OBUF[34]_inst 
       (.I(1'b0),
        .O(s_wdata_o[34]));
  OBUF \s_wdata_o_OBUF[35]_inst 
       (.I(1'b0),
        .O(s_wdata_o[35]));
  OBUF \s_wdata_o_OBUF[36]_inst 
       (.I(1'b0),
        .O(s_wdata_o[36]));
  OBUF \s_wdata_o_OBUF[37]_inst 
       (.I(1'b0),
        .O(s_wdata_o[37]));
  OBUF \s_wdata_o_OBUF[38]_inst 
       (.I(1'b0),
        .O(s_wdata_o[38]));
  OBUF \s_wdata_o_OBUF[39]_inst 
       (.I(1'b0),
        .O(s_wdata_o[39]));
  OBUF \s_wdata_o_OBUF[3]_inst 
       (.I(s_wdata_o_OBUF[3]),
        .O(s_wdata_o[3]));
  OBUF \s_wdata_o_OBUF[40]_inst 
       (.I(1'b0),
        .O(s_wdata_o[40]));
  OBUF \s_wdata_o_OBUF[41]_inst 
       (.I(1'b0),
        .O(s_wdata_o[41]));
  OBUF \s_wdata_o_OBUF[42]_inst 
       (.I(1'b0),
        .O(s_wdata_o[42]));
  OBUF \s_wdata_o_OBUF[43]_inst 
       (.I(1'b0),
        .O(s_wdata_o[43]));
  OBUF \s_wdata_o_OBUF[44]_inst 
       (.I(1'b0),
        .O(s_wdata_o[44]));
  OBUF \s_wdata_o_OBUF[45]_inst 
       (.I(1'b0),
        .O(s_wdata_o[45]));
  OBUF \s_wdata_o_OBUF[46]_inst 
       (.I(1'b0),
        .O(s_wdata_o[46]));
  OBUF \s_wdata_o_OBUF[47]_inst 
       (.I(1'b0),
        .O(s_wdata_o[47]));
  OBUF \s_wdata_o_OBUF[48]_inst 
       (.I(1'b0),
        .O(s_wdata_o[48]));
  OBUF \s_wdata_o_OBUF[49]_inst 
       (.I(1'b0),
        .O(s_wdata_o[49]));
  OBUF \s_wdata_o_OBUF[4]_inst 
       (.I(s_wdata_o_OBUF[4]),
        .O(s_wdata_o[4]));
  OBUF \s_wdata_o_OBUF[50]_inst 
       (.I(1'b0),
        .O(s_wdata_o[50]));
  OBUF \s_wdata_o_OBUF[51]_inst 
       (.I(1'b0),
        .O(s_wdata_o[51]));
  OBUF \s_wdata_o_OBUF[52]_inst 
       (.I(1'b0),
        .O(s_wdata_o[52]));
  OBUF \s_wdata_o_OBUF[53]_inst 
       (.I(1'b0),
        .O(s_wdata_o[53]));
  OBUF \s_wdata_o_OBUF[54]_inst 
       (.I(1'b0),
        .O(s_wdata_o[54]));
  OBUF \s_wdata_o_OBUF[55]_inst 
       (.I(1'b0),
        .O(s_wdata_o[55]));
  OBUF \s_wdata_o_OBUF[56]_inst 
       (.I(1'b0),
        .O(s_wdata_o[56]));
  OBUF \s_wdata_o_OBUF[57]_inst 
       (.I(1'b0),
        .O(s_wdata_o[57]));
  OBUF \s_wdata_o_OBUF[58]_inst 
       (.I(1'b0),
        .O(s_wdata_o[58]));
  OBUF \s_wdata_o_OBUF[59]_inst 
       (.I(1'b0),
        .O(s_wdata_o[59]));
  OBUF \s_wdata_o_OBUF[5]_inst 
       (.I(s_wdata_o_OBUF[5]),
        .O(s_wdata_o[5]));
  OBUF \s_wdata_o_OBUF[60]_inst 
       (.I(1'b0),
        .O(s_wdata_o[60]));
  OBUF \s_wdata_o_OBUF[61]_inst 
       (.I(1'b0),
        .O(s_wdata_o[61]));
  OBUF \s_wdata_o_OBUF[62]_inst 
       (.I(1'b0),
        .O(s_wdata_o[62]));
  OBUF \s_wdata_o_OBUF[63]_inst 
       (.I(1'b0),
        .O(s_wdata_o[63]));
  OBUF \s_wdata_o_OBUF[6]_inst 
       (.I(s_wdata_o_OBUF[6]),
        .O(s_wdata_o[6]));
  OBUF \s_wdata_o_OBUF[7]_inst 
       (.I(s_wdata_o_OBUF[7]),
        .O(s_wdata_o[7]));
  OBUF \s_wdata_o_OBUF[8]_inst 
       (.I(s_wdata_o_OBUF[8]),
        .O(s_wdata_o[8]));
  OBUF \s_wdata_o_OBUF[9]_inst 
       (.I(s_wdata_o_OBUF[9]),
        .O(s_wdata_o[9]));
  IBUF \s_wready_i_IBUF[0]_inst 
       (.I(s_wready_i[0]),
        .O(s_wready_i_IBUF));
  OBUF \s_wstrb_o_OBUF[0]_inst 
       (.I(s_wstrb_o_OBUF[0]),
        .O(s_wstrb_o[0]));
  OBUF \s_wstrb_o_OBUF[1]_inst 
       (.I(s_wstrb_o_OBUF[1]),
        .O(s_wstrb_o[1]));
  OBUF \s_wstrb_o_OBUF[2]_inst 
       (.I(s_wstrb_o_OBUF[2]),
        .O(s_wstrb_o[2]));
  OBUF \s_wstrb_o_OBUF[3]_inst 
       (.I(s_wstrb_o_OBUF[3]),
        .O(s_wstrb_o[3]));
  OBUF \s_wstrb_o_OBUF[4]_inst 
       (.I(1'b0),
        .O(s_wstrb_o[4]));
  OBUF \s_wstrb_o_OBUF[5]_inst 
       (.I(1'b0),
        .O(s_wstrb_o[5]));
  OBUF \s_wstrb_o_OBUF[6]_inst 
       (.I(1'b0),
        .O(s_wstrb_o[6]));
  OBUF \s_wstrb_o_OBUF[7]_inst 
       (.I(1'b0),
        .O(s_wstrb_o[7]));
  OBUF \s_wvalid_o_OBUF[0]_inst 
       (.I(s_wvalid_o_OBUF),
        .O(s_wvalid_o[0]));
  OBUF \s_wvalid_o_OBUF[1]_inst 
       (.I(1'b0),
        .O(s_wvalid_o[1]));
  IBUF \wdata_i_IBUF[0]_inst 
       (.I(wdata_i[0]),
        .O(wdata_i_IBUF[0]));
  IBUF \wdata_i_IBUF[10]_inst 
       (.I(wdata_i[10]),
        .O(wdata_i_IBUF[10]));
  IBUF \wdata_i_IBUF[11]_inst 
       (.I(wdata_i[11]),
        .O(wdata_i_IBUF[11]));
  IBUF \wdata_i_IBUF[12]_inst 
       (.I(wdata_i[12]),
        .O(wdata_i_IBUF[12]));
  IBUF \wdata_i_IBUF[13]_inst 
       (.I(wdata_i[13]),
        .O(wdata_i_IBUF[13]));
  IBUF \wdata_i_IBUF[14]_inst 
       (.I(wdata_i[14]),
        .O(wdata_i_IBUF[14]));
  IBUF \wdata_i_IBUF[15]_inst 
       (.I(wdata_i[15]),
        .O(wdata_i_IBUF[15]));
  IBUF \wdata_i_IBUF[16]_inst 
       (.I(wdata_i[16]),
        .O(wdata_i_IBUF[16]));
  IBUF \wdata_i_IBUF[17]_inst 
       (.I(wdata_i[17]),
        .O(wdata_i_IBUF[17]));
  IBUF \wdata_i_IBUF[18]_inst 
       (.I(wdata_i[18]),
        .O(wdata_i_IBUF[18]));
  IBUF \wdata_i_IBUF[19]_inst 
       (.I(wdata_i[19]),
        .O(wdata_i_IBUF[19]));
  IBUF \wdata_i_IBUF[1]_inst 
       (.I(wdata_i[1]),
        .O(wdata_i_IBUF[1]));
  IBUF \wdata_i_IBUF[20]_inst 
       (.I(wdata_i[20]),
        .O(wdata_i_IBUF[20]));
  IBUF \wdata_i_IBUF[21]_inst 
       (.I(wdata_i[21]),
        .O(wdata_i_IBUF[21]));
  IBUF \wdata_i_IBUF[22]_inst 
       (.I(wdata_i[22]),
        .O(wdata_i_IBUF[22]));
  IBUF \wdata_i_IBUF[23]_inst 
       (.I(wdata_i[23]),
        .O(wdata_i_IBUF[23]));
  IBUF \wdata_i_IBUF[24]_inst 
       (.I(wdata_i[24]),
        .O(wdata_i_IBUF[24]));
  IBUF \wdata_i_IBUF[25]_inst 
       (.I(wdata_i[25]),
        .O(wdata_i_IBUF[25]));
  IBUF \wdata_i_IBUF[26]_inst 
       (.I(wdata_i[26]),
        .O(wdata_i_IBUF[26]));
  IBUF \wdata_i_IBUF[27]_inst 
       (.I(wdata_i[27]),
        .O(wdata_i_IBUF[27]));
  IBUF \wdata_i_IBUF[28]_inst 
       (.I(wdata_i[28]),
        .O(wdata_i_IBUF[28]));
  IBUF \wdata_i_IBUF[29]_inst 
       (.I(wdata_i[29]),
        .O(wdata_i_IBUF[29]));
  IBUF \wdata_i_IBUF[2]_inst 
       (.I(wdata_i[2]),
        .O(wdata_i_IBUF[2]));
  IBUF \wdata_i_IBUF[30]_inst 
       (.I(wdata_i[30]),
        .O(wdata_i_IBUF[30]));
  IBUF \wdata_i_IBUF[31]_inst 
       (.I(wdata_i[31]),
        .O(wdata_i_IBUF[31]));
  IBUF \wdata_i_IBUF[32]_inst 
       (.I(wdata_i[32]),
        .O(wdata_i_IBUF[32]));
  IBUF \wdata_i_IBUF[33]_inst 
       (.I(wdata_i[33]),
        .O(wdata_i_IBUF[33]));
  IBUF \wdata_i_IBUF[34]_inst 
       (.I(wdata_i[34]),
        .O(wdata_i_IBUF[34]));
  IBUF \wdata_i_IBUF[35]_inst 
       (.I(wdata_i[35]),
        .O(wdata_i_IBUF[35]));
  IBUF \wdata_i_IBUF[36]_inst 
       (.I(wdata_i[36]),
        .O(wdata_i_IBUF[36]));
  IBUF \wdata_i_IBUF[37]_inst 
       (.I(wdata_i[37]),
        .O(wdata_i_IBUF[37]));
  IBUF \wdata_i_IBUF[38]_inst 
       (.I(wdata_i[38]),
        .O(wdata_i_IBUF[38]));
  IBUF \wdata_i_IBUF[39]_inst 
       (.I(wdata_i[39]),
        .O(wdata_i_IBUF[39]));
  IBUF \wdata_i_IBUF[3]_inst 
       (.I(wdata_i[3]),
        .O(wdata_i_IBUF[3]));
  IBUF \wdata_i_IBUF[40]_inst 
       (.I(wdata_i[40]),
        .O(wdata_i_IBUF[40]));
  IBUF \wdata_i_IBUF[41]_inst 
       (.I(wdata_i[41]),
        .O(wdata_i_IBUF[41]));
  IBUF \wdata_i_IBUF[42]_inst 
       (.I(wdata_i[42]),
        .O(wdata_i_IBUF[42]));
  IBUF \wdata_i_IBUF[43]_inst 
       (.I(wdata_i[43]),
        .O(wdata_i_IBUF[43]));
  IBUF \wdata_i_IBUF[44]_inst 
       (.I(wdata_i[44]),
        .O(wdata_i_IBUF[44]));
  IBUF \wdata_i_IBUF[45]_inst 
       (.I(wdata_i[45]),
        .O(wdata_i_IBUF[45]));
  IBUF \wdata_i_IBUF[46]_inst 
       (.I(wdata_i[46]),
        .O(wdata_i_IBUF[46]));
  IBUF \wdata_i_IBUF[47]_inst 
       (.I(wdata_i[47]),
        .O(wdata_i_IBUF[47]));
  IBUF \wdata_i_IBUF[48]_inst 
       (.I(wdata_i[48]),
        .O(wdata_i_IBUF[48]));
  IBUF \wdata_i_IBUF[49]_inst 
       (.I(wdata_i[49]),
        .O(wdata_i_IBUF[49]));
  IBUF \wdata_i_IBUF[4]_inst 
       (.I(wdata_i[4]),
        .O(wdata_i_IBUF[4]));
  IBUF \wdata_i_IBUF[50]_inst 
       (.I(wdata_i[50]),
        .O(wdata_i_IBUF[50]));
  IBUF \wdata_i_IBUF[51]_inst 
       (.I(wdata_i[51]),
        .O(wdata_i_IBUF[51]));
  IBUF \wdata_i_IBUF[52]_inst 
       (.I(wdata_i[52]),
        .O(wdata_i_IBUF[52]));
  IBUF \wdata_i_IBUF[53]_inst 
       (.I(wdata_i[53]),
        .O(wdata_i_IBUF[53]));
  IBUF \wdata_i_IBUF[54]_inst 
       (.I(wdata_i[54]),
        .O(wdata_i_IBUF[54]));
  IBUF \wdata_i_IBUF[55]_inst 
       (.I(wdata_i[55]),
        .O(wdata_i_IBUF[55]));
  IBUF \wdata_i_IBUF[56]_inst 
       (.I(wdata_i[56]),
        .O(wdata_i_IBUF[56]));
  IBUF \wdata_i_IBUF[57]_inst 
       (.I(wdata_i[57]),
        .O(wdata_i_IBUF[57]));
  IBUF \wdata_i_IBUF[58]_inst 
       (.I(wdata_i[58]),
        .O(wdata_i_IBUF[58]));
  IBUF \wdata_i_IBUF[59]_inst 
       (.I(wdata_i[59]),
        .O(wdata_i_IBUF[59]));
  IBUF \wdata_i_IBUF[5]_inst 
       (.I(wdata_i[5]),
        .O(wdata_i_IBUF[5]));
  IBUF \wdata_i_IBUF[60]_inst 
       (.I(wdata_i[60]),
        .O(wdata_i_IBUF[60]));
  IBUF \wdata_i_IBUF[61]_inst 
       (.I(wdata_i[61]),
        .O(wdata_i_IBUF[61]));
  IBUF \wdata_i_IBUF[62]_inst 
       (.I(wdata_i[62]),
        .O(wdata_i_IBUF[62]));
  IBUF \wdata_i_IBUF[63]_inst 
       (.I(wdata_i[63]),
        .O(wdata_i_IBUF[63]));
  IBUF \wdata_i_IBUF[6]_inst 
       (.I(wdata_i[6]),
        .O(wdata_i_IBUF[6]));
  IBUF \wdata_i_IBUF[7]_inst 
       (.I(wdata_i[7]),
        .O(wdata_i_IBUF[7]));
  IBUF \wdata_i_IBUF[8]_inst 
       (.I(wdata_i[8]),
        .O(wdata_i_IBUF[8]));
  IBUF \wdata_i_IBUF[9]_inst 
       (.I(wdata_i[9]),
        .O(wdata_i_IBUF[9]));
  OBUF \wready_o_OBUF[0]_inst 
       (.I(wready_o_OBUF[0]),
        .O(wready_o[0]));
  OBUF \wready_o_OBUF[1]_inst 
       (.I(wready_o_OBUF[1]),
        .O(wready_o[1]));
  IBUF \wstrb_i_IBUF[0]_inst 
       (.I(wstrb_i[0]),
        .O(wstrb_i_IBUF[0]));
  IBUF \wstrb_i_IBUF[1]_inst 
       (.I(wstrb_i[1]),
        .O(wstrb_i_IBUF[1]));
  IBUF \wstrb_i_IBUF[2]_inst 
       (.I(wstrb_i[2]),
        .O(wstrb_i_IBUF[2]));
  IBUF \wstrb_i_IBUF[3]_inst 
       (.I(wstrb_i[3]),
        .O(wstrb_i_IBUF[3]));
  IBUF \wstrb_i_IBUF[4]_inst 
       (.I(wstrb_i[4]),
        .O(wstrb_i_IBUF[4]));
  IBUF \wstrb_i_IBUF[5]_inst 
       (.I(wstrb_i[5]),
        .O(wstrb_i_IBUF[5]));
  IBUF \wstrb_i_IBUF[6]_inst 
       (.I(wstrb_i[6]),
        .O(wstrb_i_IBUF[6]));
  IBUF \wstrb_i_IBUF[7]_inst 
       (.I(wstrb_i[7]),
        .O(wstrb_i_IBUF[7]));
  IBUF \wvalid_i_IBUF[0]_inst 
       (.I(wvalid_i[0]),
        .O(wvalid_i_IBUF[0]));
  IBUF \wvalid_i_IBUF[1]_inst 
       (.I(wvalid_i[1]),
        .O(wvalid_i_IBUF[1]));
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
