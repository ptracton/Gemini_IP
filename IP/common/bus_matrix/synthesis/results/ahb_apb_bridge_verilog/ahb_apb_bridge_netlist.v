// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sat Dec 27 12:58:35 2025
// Host        : salvage running 64-bit unknown
// Command     : write_verilog -mode timesim -sdf_anno true -force results/ahb_apb_bridge_verilog/ahb_apb_bridge_netlist.v
// Design      : ahb_apb_bridge
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ADDR_WIDTH = "32" *) (* DATA_WIDTH = "32" *) 
(* NotValidForBitStream *)
module ahb_apb_bridge
   (HCLK,
    HRESETn,
    HSEL,
    HADDR,
    HTRANS,
    HWRITE,
    HSIZE,
    HBURST,
    HPROT,
    HWDATA,
    HREADY,
    HREADYOUT,
    HRESP,
    HRDATA,
    PADDR,
    PENABLE,
    PWRITE,
    PWDATA,
    PSTRB,
    PPROT,
    PSEL,
    PRDATA,
    PREADY,
    PSLVERR);
  input HCLK;
  input HRESETn;
  input HSEL;
  input [31:0]HADDR;
  input [1:0]HTRANS;
  input HWRITE;
  input [2:0]HSIZE;
  input [2:0]HBURST;
  input [3:0]HPROT;
  input [31:0]HWDATA;
  input HREADY;
  output HREADYOUT;
  output [1:0]HRESP;
  output [31:0]HRDATA;
  output [31:0]PADDR;
  output PENABLE;
  output PWRITE;
  output [31:0]PWDATA;
  output [3:0]PSTRB;
  output [2:0]PPROT;
  output PSEL;
  input [31:0]PRDATA;
  input PREADY;
  input PSLVERR;

  wire \FSM_onehot_state[0]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_2_n_0 ;
  wire \FSM_onehot_state[2]_i_3_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire [31:0]HADDR;
  wire [31:0]HADDR_IBUF;
  wire HCLK;
  wire HCLK_IBUF;
  wire HCLK_IBUF_BUFG;
  wire [31:0]HRDATA;
  wire [31:0]HRDATA_OBUF;
  wire HREADY;
  wire HREADYOUT;
  wire HREADYOUT_OBUF;
  wire HREADY_IBUF;
  wire HRESETn;
  wire HRESETn_IBUF;
  wire [1:0]HRESP;
  wire [0:0]HRESP_OBUF;
  wire HSEL;
  wire HSEL_IBUF;
  wire [1:0]HTRANS;
  wire [1:1]HTRANS_IBUF;
  wire [31:0]HWDATA;
  wire HWRITE;
  wire HWRITE_IBUF;
  wire [31:0]PADDR;
  wire [31:0]PADDR_OBUF;
  wire PENABLE;
  wire PENABLE_OBUF;
  wire [2:0]PPROT;
  wire [31:0]PRDATA;
  wire PREADY;
  wire PREADY_IBUF;
  wire PSEL;
  wire PSEL_OBUF;
  wire PSLVERR;
  wire PSLVERR_IBUF;
  wire [3:0]PSTRB;
  wire [31:0]PWDATA;
  wire [31:0]PWDATA_OBUF;
  wire PWRITE;
  wire PWRITE_OBUF;
  wire addr_reg0;
  wire p_0_in;
  wire p_0_in2_out;

initial begin
 $sdf_annotate("ahb_apb_bridge_netlist.sdf",,,,"tool_control");
end
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(PENABLE_OBUF),
        .I1(HTRANS_IBUF),
        .I2(HSEL_IBUF),
        .O(\FSM_onehot_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEAAAEAAAEAAA)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(p_0_in),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(HREADY_IBUF),
        .I3(p_0_in2_out),
        .I4(PENABLE_OBUF),
        .I5(PREADY_IBUF),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hEAAA)) 
    \FSM_onehot_state[2]_i_2 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(HSEL_IBUF),
        .I2(HTRANS_IBUF),
        .I3(PENABLE_OBUF),
        .O(\FSM_onehot_state[2]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_state[2]_i_3 
       (.I0(HRESETn_IBUF),
        .O(\FSM_onehot_state[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_state[2]_i_4 
       (.I0(HSEL_IBUF),
        .I1(HTRANS_IBUF),
        .O(p_0_in2_out));
  (* FSM_ENCODED_STATES = "ACCESS:010,IDLE:001,SETUP:100" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(HCLK_IBUF_BUFG),
        .CE(\FSM_onehot_state[2]_i_1_n_0 ),
        .D(\FSM_onehot_state[0]_i_1_n_0 ),
        .PRE(\FSM_onehot_state[2]_i_3_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "ACCESS:010,IDLE:001,SETUP:100" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(HCLK_IBUF_BUFG),
        .CE(\FSM_onehot_state[2]_i_1_n_0 ),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(p_0_in),
        .Q(PENABLE_OBUF));
  (* FSM_ENCODED_STATES = "ACCESS:010,IDLE:001,SETUP:100" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(HCLK_IBUF_BUFG),
        .CE(\FSM_onehot_state[2]_i_1_n_0 ),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(\FSM_onehot_state[2]_i_2_n_0 ),
        .Q(p_0_in));
  IBUF \HADDR_IBUF[0]_inst 
       (.I(HADDR[0]),
        .O(HADDR_IBUF[0]));
  IBUF \HADDR_IBUF[10]_inst 
       (.I(HADDR[10]),
        .O(HADDR_IBUF[10]));
  IBUF \HADDR_IBUF[11]_inst 
       (.I(HADDR[11]),
        .O(HADDR_IBUF[11]));
  IBUF \HADDR_IBUF[12]_inst 
       (.I(HADDR[12]),
        .O(HADDR_IBUF[12]));
  IBUF \HADDR_IBUF[13]_inst 
       (.I(HADDR[13]),
        .O(HADDR_IBUF[13]));
  IBUF \HADDR_IBUF[14]_inst 
       (.I(HADDR[14]),
        .O(HADDR_IBUF[14]));
  IBUF \HADDR_IBUF[15]_inst 
       (.I(HADDR[15]),
        .O(HADDR_IBUF[15]));
  IBUF \HADDR_IBUF[16]_inst 
       (.I(HADDR[16]),
        .O(HADDR_IBUF[16]));
  IBUF \HADDR_IBUF[17]_inst 
       (.I(HADDR[17]),
        .O(HADDR_IBUF[17]));
  IBUF \HADDR_IBUF[18]_inst 
       (.I(HADDR[18]),
        .O(HADDR_IBUF[18]));
  IBUF \HADDR_IBUF[19]_inst 
       (.I(HADDR[19]),
        .O(HADDR_IBUF[19]));
  IBUF \HADDR_IBUF[1]_inst 
       (.I(HADDR[1]),
        .O(HADDR_IBUF[1]));
  IBUF \HADDR_IBUF[20]_inst 
       (.I(HADDR[20]),
        .O(HADDR_IBUF[20]));
  IBUF \HADDR_IBUF[21]_inst 
       (.I(HADDR[21]),
        .O(HADDR_IBUF[21]));
  IBUF \HADDR_IBUF[22]_inst 
       (.I(HADDR[22]),
        .O(HADDR_IBUF[22]));
  IBUF \HADDR_IBUF[23]_inst 
       (.I(HADDR[23]),
        .O(HADDR_IBUF[23]));
  IBUF \HADDR_IBUF[24]_inst 
       (.I(HADDR[24]),
        .O(HADDR_IBUF[24]));
  IBUF \HADDR_IBUF[25]_inst 
       (.I(HADDR[25]),
        .O(HADDR_IBUF[25]));
  IBUF \HADDR_IBUF[26]_inst 
       (.I(HADDR[26]),
        .O(HADDR_IBUF[26]));
  IBUF \HADDR_IBUF[27]_inst 
       (.I(HADDR[27]),
        .O(HADDR_IBUF[27]));
  IBUF \HADDR_IBUF[28]_inst 
       (.I(HADDR[28]),
        .O(HADDR_IBUF[28]));
  IBUF \HADDR_IBUF[29]_inst 
       (.I(HADDR[29]),
        .O(HADDR_IBUF[29]));
  IBUF \HADDR_IBUF[2]_inst 
       (.I(HADDR[2]),
        .O(HADDR_IBUF[2]));
  IBUF \HADDR_IBUF[30]_inst 
       (.I(HADDR[30]),
        .O(HADDR_IBUF[30]));
  IBUF \HADDR_IBUF[31]_inst 
       (.I(HADDR[31]),
        .O(HADDR_IBUF[31]));
  IBUF \HADDR_IBUF[3]_inst 
       (.I(HADDR[3]),
        .O(HADDR_IBUF[3]));
  IBUF \HADDR_IBUF[4]_inst 
       (.I(HADDR[4]),
        .O(HADDR_IBUF[4]));
  IBUF \HADDR_IBUF[5]_inst 
       (.I(HADDR[5]),
        .O(HADDR_IBUF[5]));
  IBUF \HADDR_IBUF[6]_inst 
       (.I(HADDR[6]),
        .O(HADDR_IBUF[6]));
  IBUF \HADDR_IBUF[7]_inst 
       (.I(HADDR[7]),
        .O(HADDR_IBUF[7]));
  IBUF \HADDR_IBUF[8]_inst 
       (.I(HADDR[8]),
        .O(HADDR_IBUF[8]));
  IBUF \HADDR_IBUF[9]_inst 
       (.I(HADDR[9]),
        .O(HADDR_IBUF[9]));
  BUFG HCLK_IBUF_BUFG_inst
       (.I(HCLK_IBUF),
        .O(HCLK_IBUF_BUFG));
  IBUF HCLK_IBUF_inst
       (.I(HCLK),
        .O(HCLK_IBUF));
  OBUF \HRDATA_OBUF[0]_inst 
       (.I(HRDATA_OBUF[0]),
        .O(HRDATA[0]));
  OBUF \HRDATA_OBUF[10]_inst 
       (.I(HRDATA_OBUF[10]),
        .O(HRDATA[10]));
  OBUF \HRDATA_OBUF[11]_inst 
       (.I(HRDATA_OBUF[11]),
        .O(HRDATA[11]));
  OBUF \HRDATA_OBUF[12]_inst 
       (.I(HRDATA_OBUF[12]),
        .O(HRDATA[12]));
  OBUF \HRDATA_OBUF[13]_inst 
       (.I(HRDATA_OBUF[13]),
        .O(HRDATA[13]));
  OBUF \HRDATA_OBUF[14]_inst 
       (.I(HRDATA_OBUF[14]),
        .O(HRDATA[14]));
  OBUF \HRDATA_OBUF[15]_inst 
       (.I(HRDATA_OBUF[15]),
        .O(HRDATA[15]));
  OBUF \HRDATA_OBUF[16]_inst 
       (.I(HRDATA_OBUF[16]),
        .O(HRDATA[16]));
  OBUF \HRDATA_OBUF[17]_inst 
       (.I(HRDATA_OBUF[17]),
        .O(HRDATA[17]));
  OBUF \HRDATA_OBUF[18]_inst 
       (.I(HRDATA_OBUF[18]),
        .O(HRDATA[18]));
  OBUF \HRDATA_OBUF[19]_inst 
       (.I(HRDATA_OBUF[19]),
        .O(HRDATA[19]));
  OBUF \HRDATA_OBUF[1]_inst 
       (.I(HRDATA_OBUF[1]),
        .O(HRDATA[1]));
  OBUF \HRDATA_OBUF[20]_inst 
       (.I(HRDATA_OBUF[20]),
        .O(HRDATA[20]));
  OBUF \HRDATA_OBUF[21]_inst 
       (.I(HRDATA_OBUF[21]),
        .O(HRDATA[21]));
  OBUF \HRDATA_OBUF[22]_inst 
       (.I(HRDATA_OBUF[22]),
        .O(HRDATA[22]));
  OBUF \HRDATA_OBUF[23]_inst 
       (.I(HRDATA_OBUF[23]),
        .O(HRDATA[23]));
  OBUF \HRDATA_OBUF[24]_inst 
       (.I(HRDATA_OBUF[24]),
        .O(HRDATA[24]));
  OBUF \HRDATA_OBUF[25]_inst 
       (.I(HRDATA_OBUF[25]),
        .O(HRDATA[25]));
  OBUF \HRDATA_OBUF[26]_inst 
       (.I(HRDATA_OBUF[26]),
        .O(HRDATA[26]));
  OBUF \HRDATA_OBUF[27]_inst 
       (.I(HRDATA_OBUF[27]),
        .O(HRDATA[27]));
  OBUF \HRDATA_OBUF[28]_inst 
       (.I(HRDATA_OBUF[28]),
        .O(HRDATA[28]));
  OBUF \HRDATA_OBUF[29]_inst 
       (.I(HRDATA_OBUF[29]),
        .O(HRDATA[29]));
  OBUF \HRDATA_OBUF[2]_inst 
       (.I(HRDATA_OBUF[2]),
        .O(HRDATA[2]));
  OBUF \HRDATA_OBUF[30]_inst 
       (.I(HRDATA_OBUF[30]),
        .O(HRDATA[30]));
  OBUF \HRDATA_OBUF[31]_inst 
       (.I(HRDATA_OBUF[31]),
        .O(HRDATA[31]));
  OBUF \HRDATA_OBUF[3]_inst 
       (.I(HRDATA_OBUF[3]),
        .O(HRDATA[3]));
  OBUF \HRDATA_OBUF[4]_inst 
       (.I(HRDATA_OBUF[4]),
        .O(HRDATA[4]));
  OBUF \HRDATA_OBUF[5]_inst 
       (.I(HRDATA_OBUF[5]),
        .O(HRDATA[5]));
  OBUF \HRDATA_OBUF[6]_inst 
       (.I(HRDATA_OBUF[6]),
        .O(HRDATA[6]));
  OBUF \HRDATA_OBUF[7]_inst 
       (.I(HRDATA_OBUF[7]),
        .O(HRDATA[7]));
  OBUF \HRDATA_OBUF[8]_inst 
       (.I(HRDATA_OBUF[8]),
        .O(HRDATA[8]));
  OBUF \HRDATA_OBUF[9]_inst 
       (.I(HRDATA_OBUF[9]),
        .O(HRDATA[9]));
  OBUF HREADYOUT_OBUF_inst
       (.I(HREADYOUT_OBUF),
        .O(HREADYOUT));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hB)) 
    HREADYOUT_OBUF_inst_i_1
       (.I0(PREADY_IBUF),
        .I1(PENABLE_OBUF),
        .O(HREADYOUT_OBUF));
  IBUF HREADY_IBUF_inst
       (.I(HREADY),
        .O(HREADY_IBUF));
  IBUF HRESETn_IBUF_inst
       (.I(HRESETn),
        .O(HRESETn_IBUF));
  OBUF \HRESP_OBUF[0]_inst 
       (.I(HRESP_OBUF),
        .O(HRESP[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \HRESP_OBUF[0]_inst_i_1 
       (.I0(PSLVERR_IBUF),
        .I1(PENABLE_OBUF),
        .O(HRESP_OBUF));
  OBUF \HRESP_OBUF[1]_inst 
       (.I(1'b0),
        .O(HRESP[1]));
  IBUF HSEL_IBUF_inst
       (.I(HSEL),
        .O(HSEL_IBUF));
  IBUF \HTRANS_IBUF[1]_inst 
       (.I(HTRANS[1]),
        .O(HTRANS_IBUF));
  IBUF \HWDATA_IBUF[0]_inst 
       (.I(HWDATA[0]),
        .O(PWDATA_OBUF[0]));
  IBUF \HWDATA_IBUF[10]_inst 
       (.I(HWDATA[10]),
        .O(PWDATA_OBUF[10]));
  IBUF \HWDATA_IBUF[11]_inst 
       (.I(HWDATA[11]),
        .O(PWDATA_OBUF[11]));
  IBUF \HWDATA_IBUF[12]_inst 
       (.I(HWDATA[12]),
        .O(PWDATA_OBUF[12]));
  IBUF \HWDATA_IBUF[13]_inst 
       (.I(HWDATA[13]),
        .O(PWDATA_OBUF[13]));
  IBUF \HWDATA_IBUF[14]_inst 
       (.I(HWDATA[14]),
        .O(PWDATA_OBUF[14]));
  IBUF \HWDATA_IBUF[15]_inst 
       (.I(HWDATA[15]),
        .O(PWDATA_OBUF[15]));
  IBUF \HWDATA_IBUF[16]_inst 
       (.I(HWDATA[16]),
        .O(PWDATA_OBUF[16]));
  IBUF \HWDATA_IBUF[17]_inst 
       (.I(HWDATA[17]),
        .O(PWDATA_OBUF[17]));
  IBUF \HWDATA_IBUF[18]_inst 
       (.I(HWDATA[18]),
        .O(PWDATA_OBUF[18]));
  IBUF \HWDATA_IBUF[19]_inst 
       (.I(HWDATA[19]),
        .O(PWDATA_OBUF[19]));
  IBUF \HWDATA_IBUF[1]_inst 
       (.I(HWDATA[1]),
        .O(PWDATA_OBUF[1]));
  IBUF \HWDATA_IBUF[20]_inst 
       (.I(HWDATA[20]),
        .O(PWDATA_OBUF[20]));
  IBUF \HWDATA_IBUF[21]_inst 
       (.I(HWDATA[21]),
        .O(PWDATA_OBUF[21]));
  IBUF \HWDATA_IBUF[22]_inst 
       (.I(HWDATA[22]),
        .O(PWDATA_OBUF[22]));
  IBUF \HWDATA_IBUF[23]_inst 
       (.I(HWDATA[23]),
        .O(PWDATA_OBUF[23]));
  IBUF \HWDATA_IBUF[24]_inst 
       (.I(HWDATA[24]),
        .O(PWDATA_OBUF[24]));
  IBUF \HWDATA_IBUF[25]_inst 
       (.I(HWDATA[25]),
        .O(PWDATA_OBUF[25]));
  IBUF \HWDATA_IBUF[26]_inst 
       (.I(HWDATA[26]),
        .O(PWDATA_OBUF[26]));
  IBUF \HWDATA_IBUF[27]_inst 
       (.I(HWDATA[27]),
        .O(PWDATA_OBUF[27]));
  IBUF \HWDATA_IBUF[28]_inst 
       (.I(HWDATA[28]),
        .O(PWDATA_OBUF[28]));
  IBUF \HWDATA_IBUF[29]_inst 
       (.I(HWDATA[29]),
        .O(PWDATA_OBUF[29]));
  IBUF \HWDATA_IBUF[2]_inst 
       (.I(HWDATA[2]),
        .O(PWDATA_OBUF[2]));
  IBUF \HWDATA_IBUF[30]_inst 
       (.I(HWDATA[30]),
        .O(PWDATA_OBUF[30]));
  IBUF \HWDATA_IBUF[31]_inst 
       (.I(HWDATA[31]),
        .O(PWDATA_OBUF[31]));
  IBUF \HWDATA_IBUF[3]_inst 
       (.I(HWDATA[3]),
        .O(PWDATA_OBUF[3]));
  IBUF \HWDATA_IBUF[4]_inst 
       (.I(HWDATA[4]),
        .O(PWDATA_OBUF[4]));
  IBUF \HWDATA_IBUF[5]_inst 
       (.I(HWDATA[5]),
        .O(PWDATA_OBUF[5]));
  IBUF \HWDATA_IBUF[6]_inst 
       (.I(HWDATA[6]),
        .O(PWDATA_OBUF[6]));
  IBUF \HWDATA_IBUF[7]_inst 
       (.I(HWDATA[7]),
        .O(PWDATA_OBUF[7]));
  IBUF \HWDATA_IBUF[8]_inst 
       (.I(HWDATA[8]),
        .O(PWDATA_OBUF[8]));
  IBUF \HWDATA_IBUF[9]_inst 
       (.I(HWDATA[9]),
        .O(PWDATA_OBUF[9]));
  IBUF HWRITE_IBUF_inst
       (.I(HWRITE),
        .O(HWRITE_IBUF));
  OBUF \PADDR_OBUF[0]_inst 
       (.I(PADDR_OBUF[0]),
        .O(PADDR[0]));
  OBUF \PADDR_OBUF[10]_inst 
       (.I(PADDR_OBUF[10]),
        .O(PADDR[10]));
  OBUF \PADDR_OBUF[11]_inst 
       (.I(PADDR_OBUF[11]),
        .O(PADDR[11]));
  OBUF \PADDR_OBUF[12]_inst 
       (.I(PADDR_OBUF[12]),
        .O(PADDR[12]));
  OBUF \PADDR_OBUF[13]_inst 
       (.I(PADDR_OBUF[13]),
        .O(PADDR[13]));
  OBUF \PADDR_OBUF[14]_inst 
       (.I(PADDR_OBUF[14]),
        .O(PADDR[14]));
  OBUF \PADDR_OBUF[15]_inst 
       (.I(PADDR_OBUF[15]),
        .O(PADDR[15]));
  OBUF \PADDR_OBUF[16]_inst 
       (.I(PADDR_OBUF[16]),
        .O(PADDR[16]));
  OBUF \PADDR_OBUF[17]_inst 
       (.I(PADDR_OBUF[17]),
        .O(PADDR[17]));
  OBUF \PADDR_OBUF[18]_inst 
       (.I(PADDR_OBUF[18]),
        .O(PADDR[18]));
  OBUF \PADDR_OBUF[19]_inst 
       (.I(PADDR_OBUF[19]),
        .O(PADDR[19]));
  OBUF \PADDR_OBUF[1]_inst 
       (.I(PADDR_OBUF[1]),
        .O(PADDR[1]));
  OBUF \PADDR_OBUF[20]_inst 
       (.I(PADDR_OBUF[20]),
        .O(PADDR[20]));
  OBUF \PADDR_OBUF[21]_inst 
       (.I(PADDR_OBUF[21]),
        .O(PADDR[21]));
  OBUF \PADDR_OBUF[22]_inst 
       (.I(PADDR_OBUF[22]),
        .O(PADDR[22]));
  OBUF \PADDR_OBUF[23]_inst 
       (.I(PADDR_OBUF[23]),
        .O(PADDR[23]));
  OBUF \PADDR_OBUF[24]_inst 
       (.I(PADDR_OBUF[24]),
        .O(PADDR[24]));
  OBUF \PADDR_OBUF[25]_inst 
       (.I(PADDR_OBUF[25]),
        .O(PADDR[25]));
  OBUF \PADDR_OBUF[26]_inst 
       (.I(PADDR_OBUF[26]),
        .O(PADDR[26]));
  OBUF \PADDR_OBUF[27]_inst 
       (.I(PADDR_OBUF[27]),
        .O(PADDR[27]));
  OBUF \PADDR_OBUF[28]_inst 
       (.I(PADDR_OBUF[28]),
        .O(PADDR[28]));
  OBUF \PADDR_OBUF[29]_inst 
       (.I(PADDR_OBUF[29]),
        .O(PADDR[29]));
  OBUF \PADDR_OBUF[2]_inst 
       (.I(PADDR_OBUF[2]),
        .O(PADDR[2]));
  OBUF \PADDR_OBUF[30]_inst 
       (.I(PADDR_OBUF[30]),
        .O(PADDR[30]));
  OBUF \PADDR_OBUF[31]_inst 
       (.I(PADDR_OBUF[31]),
        .O(PADDR[31]));
  OBUF \PADDR_OBUF[3]_inst 
       (.I(PADDR_OBUF[3]),
        .O(PADDR[3]));
  OBUF \PADDR_OBUF[4]_inst 
       (.I(PADDR_OBUF[4]),
        .O(PADDR[4]));
  OBUF \PADDR_OBUF[5]_inst 
       (.I(PADDR_OBUF[5]),
        .O(PADDR[5]));
  OBUF \PADDR_OBUF[6]_inst 
       (.I(PADDR_OBUF[6]),
        .O(PADDR[6]));
  OBUF \PADDR_OBUF[7]_inst 
       (.I(PADDR_OBUF[7]),
        .O(PADDR[7]));
  OBUF \PADDR_OBUF[8]_inst 
       (.I(PADDR_OBUF[8]),
        .O(PADDR[8]));
  OBUF \PADDR_OBUF[9]_inst 
       (.I(PADDR_OBUF[9]),
        .O(PADDR[9]));
  OBUF PENABLE_OBUF_inst
       (.I(PENABLE_OBUF),
        .O(PENABLE));
  OBUF \PPROT_OBUF[0]_inst 
       (.I(1'b1),
        .O(PPROT[0]));
  OBUF \PPROT_OBUF[1]_inst 
       (.I(1'b0),
        .O(PPROT[1]));
  OBUF \PPROT_OBUF[2]_inst 
       (.I(1'b0),
        .O(PPROT[2]));
  IBUF \PRDATA_IBUF[0]_inst 
       (.I(PRDATA[0]),
        .O(HRDATA_OBUF[0]));
  IBUF \PRDATA_IBUF[10]_inst 
       (.I(PRDATA[10]),
        .O(HRDATA_OBUF[10]));
  IBUF \PRDATA_IBUF[11]_inst 
       (.I(PRDATA[11]),
        .O(HRDATA_OBUF[11]));
  IBUF \PRDATA_IBUF[12]_inst 
       (.I(PRDATA[12]),
        .O(HRDATA_OBUF[12]));
  IBUF \PRDATA_IBUF[13]_inst 
       (.I(PRDATA[13]),
        .O(HRDATA_OBUF[13]));
  IBUF \PRDATA_IBUF[14]_inst 
       (.I(PRDATA[14]),
        .O(HRDATA_OBUF[14]));
  IBUF \PRDATA_IBUF[15]_inst 
       (.I(PRDATA[15]),
        .O(HRDATA_OBUF[15]));
  IBUF \PRDATA_IBUF[16]_inst 
       (.I(PRDATA[16]),
        .O(HRDATA_OBUF[16]));
  IBUF \PRDATA_IBUF[17]_inst 
       (.I(PRDATA[17]),
        .O(HRDATA_OBUF[17]));
  IBUF \PRDATA_IBUF[18]_inst 
       (.I(PRDATA[18]),
        .O(HRDATA_OBUF[18]));
  IBUF \PRDATA_IBUF[19]_inst 
       (.I(PRDATA[19]),
        .O(HRDATA_OBUF[19]));
  IBUF \PRDATA_IBUF[1]_inst 
       (.I(PRDATA[1]),
        .O(HRDATA_OBUF[1]));
  IBUF \PRDATA_IBUF[20]_inst 
       (.I(PRDATA[20]),
        .O(HRDATA_OBUF[20]));
  IBUF \PRDATA_IBUF[21]_inst 
       (.I(PRDATA[21]),
        .O(HRDATA_OBUF[21]));
  IBUF \PRDATA_IBUF[22]_inst 
       (.I(PRDATA[22]),
        .O(HRDATA_OBUF[22]));
  IBUF \PRDATA_IBUF[23]_inst 
       (.I(PRDATA[23]),
        .O(HRDATA_OBUF[23]));
  IBUF \PRDATA_IBUF[24]_inst 
       (.I(PRDATA[24]),
        .O(HRDATA_OBUF[24]));
  IBUF \PRDATA_IBUF[25]_inst 
       (.I(PRDATA[25]),
        .O(HRDATA_OBUF[25]));
  IBUF \PRDATA_IBUF[26]_inst 
       (.I(PRDATA[26]),
        .O(HRDATA_OBUF[26]));
  IBUF \PRDATA_IBUF[27]_inst 
       (.I(PRDATA[27]),
        .O(HRDATA_OBUF[27]));
  IBUF \PRDATA_IBUF[28]_inst 
       (.I(PRDATA[28]),
        .O(HRDATA_OBUF[28]));
  IBUF \PRDATA_IBUF[29]_inst 
       (.I(PRDATA[29]),
        .O(HRDATA_OBUF[29]));
  IBUF \PRDATA_IBUF[2]_inst 
       (.I(PRDATA[2]),
        .O(HRDATA_OBUF[2]));
  IBUF \PRDATA_IBUF[30]_inst 
       (.I(PRDATA[30]),
        .O(HRDATA_OBUF[30]));
  IBUF \PRDATA_IBUF[31]_inst 
       (.I(PRDATA[31]),
        .O(HRDATA_OBUF[31]));
  IBUF \PRDATA_IBUF[3]_inst 
       (.I(PRDATA[3]),
        .O(HRDATA_OBUF[3]));
  IBUF \PRDATA_IBUF[4]_inst 
       (.I(PRDATA[4]),
        .O(HRDATA_OBUF[4]));
  IBUF \PRDATA_IBUF[5]_inst 
       (.I(PRDATA[5]),
        .O(HRDATA_OBUF[5]));
  IBUF \PRDATA_IBUF[6]_inst 
       (.I(PRDATA[6]),
        .O(HRDATA_OBUF[6]));
  IBUF \PRDATA_IBUF[7]_inst 
       (.I(PRDATA[7]),
        .O(HRDATA_OBUF[7]));
  IBUF \PRDATA_IBUF[8]_inst 
       (.I(PRDATA[8]),
        .O(HRDATA_OBUF[8]));
  IBUF \PRDATA_IBUF[9]_inst 
       (.I(PRDATA[9]),
        .O(HRDATA_OBUF[9]));
  IBUF PREADY_IBUF_inst
       (.I(PREADY),
        .O(PREADY_IBUF));
  OBUF PSEL_OBUF_inst
       (.I(PSEL_OBUF),
        .O(PSEL));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hE)) 
    PSEL_OBUF_inst_i_1
       (.I0(p_0_in),
        .I1(PENABLE_OBUF),
        .O(PSEL_OBUF));
  IBUF PSLVERR_IBUF_inst
       (.I(PSLVERR),
        .O(PSLVERR_IBUF));
  OBUF \PSTRB_OBUF[0]_inst 
       (.I(1'b1),
        .O(PSTRB[0]));
  OBUF \PSTRB_OBUF[1]_inst 
       (.I(1'b1),
        .O(PSTRB[1]));
  OBUF \PSTRB_OBUF[2]_inst 
       (.I(1'b1),
        .O(PSTRB[2]));
  OBUF \PSTRB_OBUF[3]_inst 
       (.I(1'b1),
        .O(PSTRB[3]));
  OBUF \PWDATA_OBUF[0]_inst 
       (.I(PWDATA_OBUF[0]),
        .O(PWDATA[0]));
  OBUF \PWDATA_OBUF[10]_inst 
       (.I(PWDATA_OBUF[10]),
        .O(PWDATA[10]));
  OBUF \PWDATA_OBUF[11]_inst 
       (.I(PWDATA_OBUF[11]),
        .O(PWDATA[11]));
  OBUF \PWDATA_OBUF[12]_inst 
       (.I(PWDATA_OBUF[12]),
        .O(PWDATA[12]));
  OBUF \PWDATA_OBUF[13]_inst 
       (.I(PWDATA_OBUF[13]),
        .O(PWDATA[13]));
  OBUF \PWDATA_OBUF[14]_inst 
       (.I(PWDATA_OBUF[14]),
        .O(PWDATA[14]));
  OBUF \PWDATA_OBUF[15]_inst 
       (.I(PWDATA_OBUF[15]),
        .O(PWDATA[15]));
  OBUF \PWDATA_OBUF[16]_inst 
       (.I(PWDATA_OBUF[16]),
        .O(PWDATA[16]));
  OBUF \PWDATA_OBUF[17]_inst 
       (.I(PWDATA_OBUF[17]),
        .O(PWDATA[17]));
  OBUF \PWDATA_OBUF[18]_inst 
       (.I(PWDATA_OBUF[18]),
        .O(PWDATA[18]));
  OBUF \PWDATA_OBUF[19]_inst 
       (.I(PWDATA_OBUF[19]),
        .O(PWDATA[19]));
  OBUF \PWDATA_OBUF[1]_inst 
       (.I(PWDATA_OBUF[1]),
        .O(PWDATA[1]));
  OBUF \PWDATA_OBUF[20]_inst 
       (.I(PWDATA_OBUF[20]),
        .O(PWDATA[20]));
  OBUF \PWDATA_OBUF[21]_inst 
       (.I(PWDATA_OBUF[21]),
        .O(PWDATA[21]));
  OBUF \PWDATA_OBUF[22]_inst 
       (.I(PWDATA_OBUF[22]),
        .O(PWDATA[22]));
  OBUF \PWDATA_OBUF[23]_inst 
       (.I(PWDATA_OBUF[23]),
        .O(PWDATA[23]));
  OBUF \PWDATA_OBUF[24]_inst 
       (.I(PWDATA_OBUF[24]),
        .O(PWDATA[24]));
  OBUF \PWDATA_OBUF[25]_inst 
       (.I(PWDATA_OBUF[25]),
        .O(PWDATA[25]));
  OBUF \PWDATA_OBUF[26]_inst 
       (.I(PWDATA_OBUF[26]),
        .O(PWDATA[26]));
  OBUF \PWDATA_OBUF[27]_inst 
       (.I(PWDATA_OBUF[27]),
        .O(PWDATA[27]));
  OBUF \PWDATA_OBUF[28]_inst 
       (.I(PWDATA_OBUF[28]),
        .O(PWDATA[28]));
  OBUF \PWDATA_OBUF[29]_inst 
       (.I(PWDATA_OBUF[29]),
        .O(PWDATA[29]));
  OBUF \PWDATA_OBUF[2]_inst 
       (.I(PWDATA_OBUF[2]),
        .O(PWDATA[2]));
  OBUF \PWDATA_OBUF[30]_inst 
       (.I(PWDATA_OBUF[30]),
        .O(PWDATA[30]));
  OBUF \PWDATA_OBUF[31]_inst 
       (.I(PWDATA_OBUF[31]),
        .O(PWDATA[31]));
  OBUF \PWDATA_OBUF[3]_inst 
       (.I(PWDATA_OBUF[3]),
        .O(PWDATA[3]));
  OBUF \PWDATA_OBUF[4]_inst 
       (.I(PWDATA_OBUF[4]),
        .O(PWDATA[4]));
  OBUF \PWDATA_OBUF[5]_inst 
       (.I(PWDATA_OBUF[5]),
        .O(PWDATA[5]));
  OBUF \PWDATA_OBUF[6]_inst 
       (.I(PWDATA_OBUF[6]),
        .O(PWDATA[6]));
  OBUF \PWDATA_OBUF[7]_inst 
       (.I(PWDATA_OBUF[7]),
        .O(PWDATA[7]));
  OBUF \PWDATA_OBUF[8]_inst 
       (.I(PWDATA_OBUF[8]),
        .O(PWDATA[8]));
  OBUF \PWDATA_OBUF[9]_inst 
       (.I(PWDATA_OBUF[9]),
        .O(PWDATA[9]));
  OBUF PWRITE_OBUF_inst
       (.I(PWRITE_OBUF),
        .O(PWRITE));
  LUT4 #(
    .INIT(16'h8000)) 
    \addr_reg[31]_i_1 
       (.I0(HREADY_IBUF),
        .I1(HSEL_IBUF),
        .I2(HTRANS_IBUF),
        .I3(\FSM_onehot_state_reg_n_0_[0] ),
        .O(addr_reg0));
  FDCE \addr_reg_reg[0] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[0]),
        .Q(PADDR_OBUF[0]));
  FDCE \addr_reg_reg[10] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[10]),
        .Q(PADDR_OBUF[10]));
  FDCE \addr_reg_reg[11] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[11]),
        .Q(PADDR_OBUF[11]));
  FDCE \addr_reg_reg[12] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[12]),
        .Q(PADDR_OBUF[12]));
  FDCE \addr_reg_reg[13] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[13]),
        .Q(PADDR_OBUF[13]));
  FDCE \addr_reg_reg[14] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[14]),
        .Q(PADDR_OBUF[14]));
  FDCE \addr_reg_reg[15] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[15]),
        .Q(PADDR_OBUF[15]));
  FDCE \addr_reg_reg[16] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[16]),
        .Q(PADDR_OBUF[16]));
  FDCE \addr_reg_reg[17] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[17]),
        .Q(PADDR_OBUF[17]));
  FDCE \addr_reg_reg[18] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[18]),
        .Q(PADDR_OBUF[18]));
  FDCE \addr_reg_reg[19] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[19]),
        .Q(PADDR_OBUF[19]));
  FDCE \addr_reg_reg[1] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[1]),
        .Q(PADDR_OBUF[1]));
  FDCE \addr_reg_reg[20] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[20]),
        .Q(PADDR_OBUF[20]));
  FDCE \addr_reg_reg[21] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[21]),
        .Q(PADDR_OBUF[21]));
  FDCE \addr_reg_reg[22] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[22]),
        .Q(PADDR_OBUF[22]));
  FDCE \addr_reg_reg[23] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[23]),
        .Q(PADDR_OBUF[23]));
  FDCE \addr_reg_reg[24] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[24]),
        .Q(PADDR_OBUF[24]));
  FDCE \addr_reg_reg[25] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[25]),
        .Q(PADDR_OBUF[25]));
  FDCE \addr_reg_reg[26] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[26]),
        .Q(PADDR_OBUF[26]));
  FDCE \addr_reg_reg[27] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[27]),
        .Q(PADDR_OBUF[27]));
  FDCE \addr_reg_reg[28] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[28]),
        .Q(PADDR_OBUF[28]));
  FDCE \addr_reg_reg[29] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[29]),
        .Q(PADDR_OBUF[29]));
  FDCE \addr_reg_reg[2] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[2]),
        .Q(PADDR_OBUF[2]));
  FDCE \addr_reg_reg[30] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[30]),
        .Q(PADDR_OBUF[30]));
  FDCE \addr_reg_reg[31] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[31]),
        .Q(PADDR_OBUF[31]));
  FDCE \addr_reg_reg[3] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[3]),
        .Q(PADDR_OBUF[3]));
  FDCE \addr_reg_reg[4] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[4]),
        .Q(PADDR_OBUF[4]));
  FDCE \addr_reg_reg[5] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[5]),
        .Q(PADDR_OBUF[5]));
  FDCE \addr_reg_reg[6] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[6]),
        .Q(PADDR_OBUF[6]));
  FDCE \addr_reg_reg[7] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[7]),
        .Q(PADDR_OBUF[7]));
  FDCE \addr_reg_reg[8] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[8]),
        .Q(PADDR_OBUF[8]));
  FDCE \addr_reg_reg[9] 
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HADDR_IBUF[9]),
        .Q(PADDR_OBUF[9]));
  FDCE write_reg_reg
       (.C(HCLK_IBUF_BUFG),
        .CE(addr_reg0),
        .CLR(\FSM_onehot_state[2]_i_3_n_0 ),
        .D(HWRITE_IBUF),
        .Q(PWRITE_OBUF));
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
