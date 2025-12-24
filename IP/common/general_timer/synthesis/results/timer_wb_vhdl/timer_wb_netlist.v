// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Tue Dec 23 19:26:31 2025
// Host        : salvage running 64-bit Linux Mint 22.1
// Command     : write_verilog -mode timesim -sdf_anno true -force results/timer_wb_vhdl/timer_wb_netlist.v
// Design      : timer_wb
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module timer_core
   (trigger_o_OBUF,
    capture_stb,
    CO,
    data1,
    Q,
    \counter_reg[31]_0 ,
    ext_meas_d_reg_0,
    irq_reg_0,
    capture_stb_reg_0,
    E,
    S,
    \counter_reg[23]_0 ,
    \counter_reg[15]_0 ,
    \counter_reg[7]_0 ,
    \prescaler_reg[1]_0 ,
    \counter_reg[7]_1 ,
    \counter_reg[15]_1 ,
    \counter_reg[23]_1 ,
    \counter_reg[31]_1 ,
    \capture_val_reg[31]_0 ,
    CLK,
    wb_rst_i_IBUF,
    clk_tick7_out,
    ext_meas_i_IBUF,
    capture_i_IBUF,
    load_cmd,
    \counter_reg[0]_0 ,
    load_val,
    \op_done1_inferred__0/i__carry__1_0 ,
    D,
    \reg_cap_reg[31] ,
    \reg_int_sts_reg[0] ,
    wb_adr_i_IBUF,
    pwm_o_OBUF_inst_i_2,
    \counter_reg[31]_2 ,
    \prescaler_reg[15]_0 ,
    \prescaler_reg[15]_1 );
  output trigger_o_OBUF;
  output capture_stb;
  output [0:0]CO;
  output [14:0]data1;
  output [0:0]Q;
  output [31:0]\counter_reg[31]_0 ;
  output ext_meas_d_reg_0;
  output irq_reg_0;
  output capture_stb_reg_0;
  output [0:0]E;
  output [3:0]S;
  output [3:0]\counter_reg[23]_0 ;
  output [3:0]\counter_reg[15]_0 ;
  output [3:0]\counter_reg[7]_0 ;
  output \prescaler_reg[1]_0 ;
  output [3:0]\counter_reg[7]_1 ;
  output [3:0]\counter_reg[15]_1 ;
  output [3:0]\counter_reg[23]_1 ;
  output [3:0]\counter_reg[31]_1 ;
  output [31:0]\capture_val_reg[31]_0 ;
  input CLK;
  input wb_rst_i_IBUF;
  input clk_tick7_out;
  input ext_meas_i_IBUF;
  input capture_i_IBUF;
  input load_cmd;
  input \counter_reg[0]_0 ;
  input [31:0]load_val;
  input [0:0]\op_done1_inferred__0/i__carry__1_0 ;
  input [2:0]D;
  input [4:0]\reg_cap_reg[31] ;
  input \reg_int_sts_reg[0] ;
  input [2:0]wb_adr_i_IBUF;
  input [31:0]pwm_o_OBUF_inst_i_2;
  input [0:0]\counter_reg[31]_2 ;
  input [0:0]\prescaler_reg[15]_0 ;
  input [15:0]\prescaler_reg[15]_1 ;

  wire CLK;
  wire [0:0]CO;
  wire [2:0]D;
  wire [0:0]E;
  wire [0:0]Q;
  wire [3:0]S;
  wire capture_d;
  wire capture_i_IBUF;
  wire capture_re;
  wire capture_stb;
  wire capture_stb_reg_0;
  wire [31:0]\capture_val_reg[31]_0 ;
  wire clk_tick;
  wire clk_tick7_out;
  wire [31:1]counter0;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[10]_i_1_n_0 ;
  wire \counter[10]_i_2_n_0 ;
  wire \counter[11]_i_1_n_0 ;
  wire \counter[11]_i_2_n_0 ;
  wire \counter[12]_i_1_n_0 ;
  wire \counter[12]_i_3_n_0 ;
  wire \counter[12]_i_5_n_0 ;
  wire \counter[12]_i_6_n_0 ;
  wire \counter[12]_i_7_n_0 ;
  wire \counter[12]_i_8_n_0 ;
  wire \counter[13]_i_1_n_0 ;
  wire \counter[13]_i_2_n_0 ;
  wire \counter[14]_i_1_n_0 ;
  wire \counter[14]_i_2_n_0 ;
  wire \counter[15]_i_1_n_0 ;
  wire \counter[15]_i_2_n_0 ;
  wire \counter[16]_i_1_n_0 ;
  wire \counter[16]_i_3_n_0 ;
  wire \counter[16]_i_5_n_0 ;
  wire \counter[16]_i_6_n_0 ;
  wire \counter[16]_i_7_n_0 ;
  wire \counter[16]_i_8_n_0 ;
  wire \counter[17]_i_1_n_0 ;
  wire \counter[17]_i_2_n_0 ;
  wire \counter[18]_i_1_n_0 ;
  wire \counter[18]_i_2_n_0 ;
  wire \counter[19]_i_1_n_0 ;
  wire \counter[19]_i_2_n_0 ;
  wire \counter[1]_i_1_n_0 ;
  wire \counter[1]_i_2_n_0 ;
  wire \counter[20]_i_1_n_0 ;
  wire \counter[20]_i_3_n_0 ;
  wire \counter[20]_i_5_n_0 ;
  wire \counter[20]_i_6_n_0 ;
  wire \counter[20]_i_7_n_0 ;
  wire \counter[20]_i_8_n_0 ;
  wire \counter[21]_i_1_n_0 ;
  wire \counter[21]_i_2_n_0 ;
  wire \counter[22]_i_1_n_0 ;
  wire \counter[22]_i_2_n_0 ;
  wire \counter[23]_i_1_n_0 ;
  wire \counter[23]_i_2_n_0 ;
  wire \counter[24]_i_1_n_0 ;
  wire \counter[24]_i_3_n_0 ;
  wire \counter[24]_i_5_n_0 ;
  wire \counter[24]_i_6_n_0 ;
  wire \counter[24]_i_7_n_0 ;
  wire \counter[24]_i_8_n_0 ;
  wire \counter[25]_i_1_n_0 ;
  wire \counter[25]_i_2_n_0 ;
  wire \counter[26]_i_1_n_0 ;
  wire \counter[26]_i_2_n_0 ;
  wire \counter[27]_i_1_n_0 ;
  wire \counter[27]_i_2_n_0 ;
  wire \counter[28]_i_1_n_0 ;
  wire \counter[28]_i_3_n_0 ;
  wire \counter[28]_i_5_n_0 ;
  wire \counter[28]_i_6_n_0 ;
  wire \counter[28]_i_7_n_0 ;
  wire \counter[28]_i_8_n_0 ;
  wire \counter[29]_i_1_n_0 ;
  wire \counter[29]_i_2_n_0 ;
  wire \counter[2]_i_1_n_0 ;
  wire \counter[2]_i_2_n_0 ;
  wire \counter[30]_i_1_n_0 ;
  wire \counter[30]_i_2_n_0 ;
  wire \counter[31]_i_10_n_0 ;
  wire \counter[31]_i_11_n_0 ;
  wire \counter[31]_i_12_n_0 ;
  wire \counter[31]_i_13_n_0 ;
  wire \counter[31]_i_14_n_0 ;
  wire \counter[31]_i_15_n_0 ;
  wire \counter[31]_i_17_n_0 ;
  wire \counter[31]_i_18_n_0 ;
  wire \counter[31]_i_19_n_0 ;
  wire \counter[31]_i_2_n_0 ;
  wire \counter[31]_i_3_n_0 ;
  wire \counter[31]_i_5_n_0 ;
  wire \counter[31]_i_7_n_0 ;
  wire \counter[31]_i_8_n_0 ;
  wire \counter[31]_i_9_n_0 ;
  wire \counter[3]_i_1_n_0 ;
  wire \counter[3]_i_2_n_0 ;
  wire \counter[4]_i_1_n_0 ;
  wire \counter[4]_i_3_n_0 ;
  wire \counter[4]_i_5_n_0 ;
  wire \counter[4]_i_6_n_0 ;
  wire \counter[4]_i_7_n_0 ;
  wire \counter[4]_i_8_n_0 ;
  wire \counter[5]_i_1_n_0 ;
  wire \counter[5]_i_2_n_0 ;
  wire \counter[6]_i_1_n_0 ;
  wire \counter[6]_i_2_n_0 ;
  wire \counter[7]_i_1_n_0 ;
  wire \counter[7]_i_2_n_0 ;
  wire \counter[8]_i_1_n_0 ;
  wire \counter[8]_i_3_n_0 ;
  wire \counter[8]_i_5_n_0 ;
  wire \counter[8]_i_6_n_0 ;
  wire \counter[8]_i_7_n_0 ;
  wire \counter[8]_i_8_n_0 ;
  wire \counter[9]_i_1_n_0 ;
  wire \counter[9]_i_2_n_0 ;
  wire \counter_reg[0]_0 ;
  wire \counter_reg[12]_i_2_n_0 ;
  wire \counter_reg[12]_i_2_n_1 ;
  wire \counter_reg[12]_i_2_n_2 ;
  wire \counter_reg[12]_i_2_n_3 ;
  wire \counter_reg[12]_i_2_n_4 ;
  wire \counter_reg[12]_i_2_n_5 ;
  wire \counter_reg[12]_i_2_n_6 ;
  wire \counter_reg[12]_i_2_n_7 ;
  wire \counter_reg[12]_i_9_n_0 ;
  wire \counter_reg[12]_i_9_n_1 ;
  wire \counter_reg[12]_i_9_n_2 ;
  wire \counter_reg[12]_i_9_n_3 ;
  wire [3:0]\counter_reg[15]_0 ;
  wire [3:0]\counter_reg[15]_1 ;
  wire \counter_reg[16]_i_2_n_0 ;
  wire \counter_reg[16]_i_2_n_1 ;
  wire \counter_reg[16]_i_2_n_2 ;
  wire \counter_reg[16]_i_2_n_3 ;
  wire \counter_reg[16]_i_2_n_4 ;
  wire \counter_reg[16]_i_2_n_5 ;
  wire \counter_reg[16]_i_2_n_6 ;
  wire \counter_reg[16]_i_2_n_7 ;
  wire \counter_reg[16]_i_9_n_0 ;
  wire \counter_reg[16]_i_9_n_1 ;
  wire \counter_reg[16]_i_9_n_2 ;
  wire \counter_reg[16]_i_9_n_3 ;
  wire \counter_reg[20]_i_2_n_0 ;
  wire \counter_reg[20]_i_2_n_1 ;
  wire \counter_reg[20]_i_2_n_2 ;
  wire \counter_reg[20]_i_2_n_3 ;
  wire \counter_reg[20]_i_2_n_4 ;
  wire \counter_reg[20]_i_2_n_5 ;
  wire \counter_reg[20]_i_2_n_6 ;
  wire \counter_reg[20]_i_2_n_7 ;
  wire \counter_reg[20]_i_9_n_0 ;
  wire \counter_reg[20]_i_9_n_1 ;
  wire \counter_reg[20]_i_9_n_2 ;
  wire \counter_reg[20]_i_9_n_3 ;
  wire [3:0]\counter_reg[23]_0 ;
  wire [3:0]\counter_reg[23]_1 ;
  wire \counter_reg[24]_i_2_n_0 ;
  wire \counter_reg[24]_i_2_n_1 ;
  wire \counter_reg[24]_i_2_n_2 ;
  wire \counter_reg[24]_i_2_n_3 ;
  wire \counter_reg[24]_i_2_n_4 ;
  wire \counter_reg[24]_i_2_n_5 ;
  wire \counter_reg[24]_i_2_n_6 ;
  wire \counter_reg[24]_i_2_n_7 ;
  wire \counter_reg[24]_i_9_n_0 ;
  wire \counter_reg[24]_i_9_n_1 ;
  wire \counter_reg[24]_i_9_n_2 ;
  wire \counter_reg[24]_i_9_n_3 ;
  wire \counter_reg[28]_i_2_n_0 ;
  wire \counter_reg[28]_i_2_n_1 ;
  wire \counter_reg[28]_i_2_n_2 ;
  wire \counter_reg[28]_i_2_n_3 ;
  wire \counter_reg[28]_i_2_n_4 ;
  wire \counter_reg[28]_i_2_n_5 ;
  wire \counter_reg[28]_i_2_n_6 ;
  wire \counter_reg[28]_i_2_n_7 ;
  wire \counter_reg[28]_i_9_n_0 ;
  wire \counter_reg[28]_i_9_n_1 ;
  wire \counter_reg[28]_i_9_n_2 ;
  wire \counter_reg[28]_i_9_n_3 ;
  wire [31:0]\counter_reg[31]_0 ;
  wire [3:0]\counter_reg[31]_1 ;
  wire [0:0]\counter_reg[31]_2 ;
  wire \counter_reg[31]_i_16_n_2 ;
  wire \counter_reg[31]_i_16_n_3 ;
  wire \counter_reg[31]_i_4_n_2 ;
  wire \counter_reg[31]_i_4_n_3 ;
  wire \counter_reg[31]_i_4_n_5 ;
  wire \counter_reg[31]_i_4_n_6 ;
  wire \counter_reg[31]_i_4_n_7 ;
  wire \counter_reg[4]_i_2_n_0 ;
  wire \counter_reg[4]_i_2_n_1 ;
  wire \counter_reg[4]_i_2_n_2 ;
  wire \counter_reg[4]_i_2_n_3 ;
  wire \counter_reg[4]_i_2_n_4 ;
  wire \counter_reg[4]_i_2_n_5 ;
  wire \counter_reg[4]_i_2_n_6 ;
  wire \counter_reg[4]_i_2_n_7 ;
  wire \counter_reg[4]_i_9_n_0 ;
  wire \counter_reg[4]_i_9_n_1 ;
  wire \counter_reg[4]_i_9_n_2 ;
  wire \counter_reg[4]_i_9_n_3 ;
  wire [3:0]\counter_reg[7]_0 ;
  wire [3:0]\counter_reg[7]_1 ;
  wire \counter_reg[8]_i_2_n_0 ;
  wire \counter_reg[8]_i_2_n_1 ;
  wire \counter_reg[8]_i_2_n_2 ;
  wire \counter_reg[8]_i_2_n_3 ;
  wire \counter_reg[8]_i_2_n_4 ;
  wire \counter_reg[8]_i_2_n_5 ;
  wire \counter_reg[8]_i_2_n_6 ;
  wire \counter_reg[8]_i_2_n_7 ;
  wire \counter_reg[8]_i_9_n_0 ;
  wire \counter_reg[8]_i_9_n_1 ;
  wire \counter_reg[8]_i_9_n_2 ;
  wire \counter_reg[8]_i_9_n_3 ;
  wire [14:0]data1;
  wire ext_meas_d;
  wire ext_meas_d_reg_0;
  wire ext_meas_i_IBUF;
  wire i__carry__0_i_1__0_n_0;
  wire i__carry__0_i_1_n_0;
  wire i__carry__0_i_2__0_n_0;
  wire i__carry__0_i_2_n_0;
  wire i__carry__0_i_3__0_n_0;
  wire i__carry__0_i_3_n_0;
  wire i__carry__0_i_4__0_n_0;
  wire i__carry__0_i_4_n_0;
  wire i__carry__1_i_1__0_n_0;
  wire i__carry__1_i_1_n_0;
  wire i__carry__1_i_2__0_n_0;
  wire i__carry__1_i_2_n_0;
  wire i__carry__1_i_3__0_n_0;
  wire i__carry__1_i_3_n_0;
  wire i__carry__1_i_4_n_0;
  wire i__carry__2_i_1_n_0;
  wire i__carry__2_i_2_n_0;
  wire i__carry__2_i_3_n_0;
  wire i__carry_i_1__0_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2__0_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3__0_n_0;
  wire i__carry_i_3_n_0;
  wire i__carry_i_4__0_n_0;
  wire i__carry_i_4_n_0;
  wire irq_i_10_n_0;
  wire irq_i_1_n_0;
  wire irq_i_3_n_0;
  wire irq_i_5_n_0;
  wire irq_i_6_n_0;
  wire irq_i_7_n_0;
  wire irq_i_8_n_0;
  wire irq_i_9_n_0;
  wire irq_reg_0;
  wire load_cmd;
  wire [31:0]load_val;
  wire \op_done1_inferred__0/i__carry__0_n_0 ;
  wire \op_done1_inferred__0/i__carry__0_n_1 ;
  wire \op_done1_inferred__0/i__carry__0_n_2 ;
  wire \op_done1_inferred__0/i__carry__0_n_3 ;
  wire [0:0]\op_done1_inferred__0/i__carry__1_0 ;
  wire \op_done1_inferred__0/i__carry__1_n_2 ;
  wire \op_done1_inferred__0/i__carry__1_n_3 ;
  wire \op_done1_inferred__0/i__carry_n_0 ;
  wire \op_done1_inferred__0/i__carry_n_1 ;
  wire \op_done1_inferred__0/i__carry_n_2 ;
  wire \op_done1_inferred__0/i__carry_n_3 ;
  wire op_done_i_1_n_0;
  wire op_done_reg_n_0;
  wire [15:1]prescaler;
  wire \prescaler0_inferred__0/i__carry__0_n_0 ;
  wire \prescaler0_inferred__0/i__carry__0_n_1 ;
  wire \prescaler0_inferred__0/i__carry__0_n_2 ;
  wire \prescaler0_inferred__0/i__carry__0_n_3 ;
  wire \prescaler0_inferred__0/i__carry__1_n_0 ;
  wire \prescaler0_inferred__0/i__carry__1_n_1 ;
  wire \prescaler0_inferred__0/i__carry__1_n_2 ;
  wire \prescaler0_inferred__0/i__carry__1_n_3 ;
  wire \prescaler0_inferred__0/i__carry__2_n_2 ;
  wire \prescaler0_inferred__0/i__carry__2_n_3 ;
  wire \prescaler0_inferred__0/i__carry_n_0 ;
  wire \prescaler0_inferred__0/i__carry_n_1 ;
  wire \prescaler0_inferred__0/i__carry_n_2 ;
  wire \prescaler0_inferred__0/i__carry_n_3 ;
  wire \prescaler[15]_i_4_n_0 ;
  wire \prescaler[15]_i_5_n_0 ;
  wire \prescaler[15]_i_6_n_0 ;
  wire [0:0]\prescaler_reg[15]_0 ;
  wire [15:0]\prescaler_reg[15]_1 ;
  wire \prescaler_reg[1]_0 ;
  wire [31:0]pwm_o_OBUF_inst_i_2;
  wire [4:0]\reg_cap_reg[31] ;
  wire \reg_int_sts_reg[0] ;
  wire trigger_o_OBUF;
  wire [2:0]wb_adr_i_IBUF;
  wire wb_rst_i_IBUF;
  wire [3:2]\NLW_counter_reg[31]_i_16_CO_UNCONNECTED ;
  wire [3:3]\NLW_counter_reg[31]_i_16_O_UNCONNECTED ;
  wire [3:2]\NLW_counter_reg[31]_i_4_CO_UNCONNECTED ;
  wire [3:3]\NLW_counter_reg[31]_i_4_O_UNCONNECTED ;
  wire [3:0]\NLW_op_done1_inferred__0/i__carry_O_UNCONNECTED ;
  wire [3:0]\NLW_op_done1_inferred__0/i__carry__0_O_UNCONNECTED ;
  wire [3:3]\NLW_op_done1_inferred__0/i__carry__1_CO_UNCONNECTED ;
  wire [3:0]\NLW_op_done1_inferred__0/i__carry__1_O_UNCONNECTED ;
  wire [3:2]\NLW_prescaler0_inferred__0/i__carry__2_CO_UNCONNECTED ;
  wire [3:3]\NLW_prescaler0_inferred__0/i__carry__2_O_UNCONNECTED ;

  FDCE capture_d_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(wb_rst_i_IBUF),
        .D(capture_i_IBUF),
        .Q(capture_d));
  LUT2 #(
    .INIT(4'h2)) 
    capture_stb_i_1
       (.I0(capture_i_IBUF),
        .I1(capture_d),
        .O(capture_re));
  FDCE capture_stb_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(wb_rst_i_IBUF),
        .D(capture_re),
        .Q(capture_stb));
  FDCE \capture_val_reg[0] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [0]),
        .Q(\capture_val_reg[31]_0 [0]));
  FDCE \capture_val_reg[10] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [10]),
        .Q(\capture_val_reg[31]_0 [10]));
  FDCE \capture_val_reg[11] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [11]),
        .Q(\capture_val_reg[31]_0 [11]));
  FDCE \capture_val_reg[12] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [12]),
        .Q(\capture_val_reg[31]_0 [12]));
  FDCE \capture_val_reg[13] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [13]),
        .Q(\capture_val_reg[31]_0 [13]));
  FDCE \capture_val_reg[14] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [14]),
        .Q(\capture_val_reg[31]_0 [14]));
  FDCE \capture_val_reg[15] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [15]),
        .Q(\capture_val_reg[31]_0 [15]));
  FDCE \capture_val_reg[16] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [16]),
        .Q(\capture_val_reg[31]_0 [16]));
  FDCE \capture_val_reg[17] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [17]),
        .Q(\capture_val_reg[31]_0 [17]));
  FDCE \capture_val_reg[18] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [18]),
        .Q(\capture_val_reg[31]_0 [18]));
  FDCE \capture_val_reg[19] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [19]),
        .Q(\capture_val_reg[31]_0 [19]));
  FDCE \capture_val_reg[1] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [1]),
        .Q(\capture_val_reg[31]_0 [1]));
  FDCE \capture_val_reg[20] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [20]),
        .Q(\capture_val_reg[31]_0 [20]));
  FDCE \capture_val_reg[21] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [21]),
        .Q(\capture_val_reg[31]_0 [21]));
  FDCE \capture_val_reg[22] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [22]),
        .Q(\capture_val_reg[31]_0 [22]));
  FDCE \capture_val_reg[23] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [23]),
        .Q(\capture_val_reg[31]_0 [23]));
  FDCE \capture_val_reg[24] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [24]),
        .Q(\capture_val_reg[31]_0 [24]));
  FDCE \capture_val_reg[25] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [25]),
        .Q(\capture_val_reg[31]_0 [25]));
  FDCE \capture_val_reg[26] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [26]),
        .Q(\capture_val_reg[31]_0 [26]));
  FDCE \capture_val_reg[27] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [27]),
        .Q(\capture_val_reg[31]_0 [27]));
  FDCE \capture_val_reg[28] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [28]),
        .Q(\capture_val_reg[31]_0 [28]));
  FDCE \capture_val_reg[29] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [29]),
        .Q(\capture_val_reg[31]_0 [29]));
  FDCE \capture_val_reg[2] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [2]),
        .Q(\capture_val_reg[31]_0 [2]));
  FDCE \capture_val_reg[30] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [30]),
        .Q(\capture_val_reg[31]_0 [30]));
  FDCE \capture_val_reg[31] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [31]),
        .Q(\capture_val_reg[31]_0 [31]));
  FDCE \capture_val_reg[3] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [3]),
        .Q(\capture_val_reg[31]_0 [3]));
  FDCE \capture_val_reg[4] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [4]),
        .Q(\capture_val_reg[31]_0 [4]));
  FDCE \capture_val_reg[5] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [5]),
        .Q(\capture_val_reg[31]_0 [5]));
  FDCE \capture_val_reg[6] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [6]),
        .Q(\capture_val_reg[31]_0 [6]));
  FDCE \capture_val_reg[7] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [7]),
        .Q(\capture_val_reg[31]_0 [7]));
  FDCE \capture_val_reg[8] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [8]),
        .Q(\capture_val_reg[31]_0 [8]));
  FDCE \capture_val_reg[9] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(wb_rst_i_IBUF),
        .D(\counter_reg[31]_0 [9]),
        .Q(\capture_val_reg[31]_0 [9]));
  FDCE clk_tick_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(wb_rst_i_IBUF),
        .D(clk_tick7_out),
        .Q(clk_tick));
  LUT6 #(
    .INIT(64'hFFFF0504AFAE0504)) 
    \counter[0]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[31]_0 [0]),
        .I3(\counter_reg[0]_0 ),
        .I4(load_val[0]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[10]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[12]_i_2_n_6 ),
        .I3(\counter[10]_i_2_n_0 ),
        .I4(load_val[10]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[10]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[10]),
        .O(\counter[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[11]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[12]_i_2_n_5 ),
        .I3(\counter[11]_i_2_n_0 ),
        .I4(load_val[11]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[11]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[11]),
        .O(\counter[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[12]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[12]_i_2_n_4 ),
        .I3(\counter[12]_i_3_n_0 ),
        .I4(load_val[12]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[12]_i_3 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[12]),
        .O(\counter[12]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[12]_i_5 
       (.I0(\counter_reg[31]_0 [12]),
        .O(\counter[12]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[12]_i_6 
       (.I0(\counter_reg[31]_0 [11]),
        .O(\counter[12]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[12]_i_7 
       (.I0(\counter_reg[31]_0 [10]),
        .O(\counter[12]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[12]_i_8 
       (.I0(\counter_reg[31]_0 [9]),
        .O(\counter[12]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[13]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[16]_i_2_n_7 ),
        .I3(\counter[13]_i_2_n_0 ),
        .I4(load_val[13]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[13]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[13]),
        .O(\counter[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[14]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[16]_i_2_n_6 ),
        .I3(\counter[14]_i_2_n_0 ),
        .I4(load_val[14]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[14]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[14]),
        .O(\counter[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[15]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[16]_i_2_n_5 ),
        .I3(\counter[15]_i_2_n_0 ),
        .I4(load_val[15]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[15]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[15]),
        .O(\counter[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[16]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[16]_i_2_n_4 ),
        .I3(\counter[16]_i_3_n_0 ),
        .I4(load_val[16]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[16]_i_3 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[16]),
        .O(\counter[16]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[16]_i_5 
       (.I0(\counter_reg[31]_0 [16]),
        .O(\counter[16]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[16]_i_6 
       (.I0(\counter_reg[31]_0 [15]),
        .O(\counter[16]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[16]_i_7 
       (.I0(\counter_reg[31]_0 [14]),
        .O(\counter[16]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[16]_i_8 
       (.I0(\counter_reg[31]_0 [13]),
        .O(\counter[16]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[17]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[20]_i_2_n_7 ),
        .I3(\counter[17]_i_2_n_0 ),
        .I4(load_val[17]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[17]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[17]),
        .O(\counter[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[18]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[20]_i_2_n_6 ),
        .I3(\counter[18]_i_2_n_0 ),
        .I4(load_val[18]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[18]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[18]),
        .O(\counter[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[19]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[20]_i_2_n_5 ),
        .I3(\counter[19]_i_2_n_0 ),
        .I4(load_val[19]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[19]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[19]),
        .O(\counter[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[1]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[4]_i_2_n_7 ),
        .I3(\counter[1]_i_2_n_0 ),
        .I4(load_val[1]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[1]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[1]),
        .O(\counter[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[20]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[20]_i_2_n_4 ),
        .I3(\counter[20]_i_3_n_0 ),
        .I4(load_val[20]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[20]_i_3 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[20]),
        .O(\counter[20]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[20]_i_5 
       (.I0(\counter_reg[31]_0 [20]),
        .O(\counter[20]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[20]_i_6 
       (.I0(\counter_reg[31]_0 [19]),
        .O(\counter[20]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[20]_i_7 
       (.I0(\counter_reg[31]_0 [18]),
        .O(\counter[20]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[20]_i_8 
       (.I0(\counter_reg[31]_0 [17]),
        .O(\counter[20]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[21]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[24]_i_2_n_7 ),
        .I3(\counter[21]_i_2_n_0 ),
        .I4(load_val[21]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[21]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[21]),
        .O(\counter[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[22]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[24]_i_2_n_6 ),
        .I3(\counter[22]_i_2_n_0 ),
        .I4(load_val[22]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[22]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[22]),
        .O(\counter[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[23]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[24]_i_2_n_5 ),
        .I3(\counter[23]_i_2_n_0 ),
        .I4(load_val[23]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[23]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[23]),
        .O(\counter[23]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[24]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[24]_i_2_n_4 ),
        .I3(\counter[24]_i_3_n_0 ),
        .I4(load_val[24]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[24]_i_3 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[24]),
        .O(\counter[24]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[24]_i_5 
       (.I0(\counter_reg[31]_0 [24]),
        .O(\counter[24]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[24]_i_6 
       (.I0(\counter_reg[31]_0 [23]),
        .O(\counter[24]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[24]_i_7 
       (.I0(\counter_reg[31]_0 [22]),
        .O(\counter[24]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[24]_i_8 
       (.I0(\counter_reg[31]_0 [21]),
        .O(\counter[24]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[25]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[28]_i_2_n_7 ),
        .I3(\counter[25]_i_2_n_0 ),
        .I4(load_val[25]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[25]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[25]),
        .O(\counter[25]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[26]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[28]_i_2_n_6 ),
        .I3(\counter[26]_i_2_n_0 ),
        .I4(load_val[26]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[26]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[26]),
        .O(\counter[26]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[27]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[28]_i_2_n_5 ),
        .I3(\counter[27]_i_2_n_0 ),
        .I4(load_val[27]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[27]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[27]),
        .O(\counter[27]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[28]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[28]_i_2_n_4 ),
        .I3(\counter[28]_i_3_n_0 ),
        .I4(load_val[28]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[28]_i_3 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[28]),
        .O(\counter[28]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[28]_i_5 
       (.I0(\counter_reg[31]_0 [28]),
        .O(\counter[28]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[28]_i_6 
       (.I0(\counter_reg[31]_0 [27]),
        .O(\counter[28]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[28]_i_7 
       (.I0(\counter_reg[31]_0 [26]),
        .O(\counter[28]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[28]_i_8 
       (.I0(\counter_reg[31]_0 [25]),
        .O(\counter[28]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[29]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[31]_i_4_n_7 ),
        .I3(\counter[29]_i_2_n_0 ),
        .I4(load_val[29]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[29]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[29]),
        .O(\counter[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[2]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[4]_i_2_n_6 ),
        .I3(\counter[2]_i_2_n_0 ),
        .I4(load_val[2]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[2]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[2]),
        .O(\counter[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[30]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[31]_i_4_n_6 ),
        .I3(\counter[30]_i_2_n_0 ),
        .I4(load_val[30]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[30]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[30]),
        .O(\counter[30]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \counter[31]_i_10 
       (.I0(\counter_reg[31]_0 [23]),
        .I1(\counter_reg[31]_0 [22]),
        .I2(\counter_reg[31]_0 [21]),
        .I3(\counter_reg[31]_0 [20]),
        .O(\counter[31]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \counter[31]_i_11 
       (.I0(\counter_reg[31]_0 [17]),
        .I1(\counter_reg[31]_0 [16]),
        .I2(\counter_reg[31]_0 [19]),
        .I3(\counter_reg[31]_0 [18]),
        .O(\counter[31]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00010000)) 
    \counter[31]_i_12 
       (.I0(\counter_reg[31]_0 [28]),
        .I1(\counter_reg[31]_0 [29]),
        .I2(\counter_reg[31]_0 [30]),
        .I3(\counter_reg[31]_0 [31]),
        .I4(irq_i_9_n_0),
        .O(\counter[31]_i_12_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[31]_i_13 
       (.I0(\counter_reg[31]_0 [31]),
        .O(\counter[31]_i_13_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[31]_i_14 
       (.I0(\counter_reg[31]_0 [30]),
        .O(\counter[31]_i_14_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[31]_i_15 
       (.I0(\counter_reg[31]_0 [29]),
        .O(\counter[31]_i_15_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \counter[31]_i_17 
       (.I0(\counter[31]_i_10_n_0 ),
        .I1(\counter[31]_i_11_n_0 ),
        .I2(irq_i_9_n_0),
        .I3(irq_i_10_n_0),
        .O(\counter[31]_i_17_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \counter[31]_i_18 
       (.I0(\counter_reg[31]_0 [11]),
        .I1(\counter_reg[31]_0 [10]),
        .I2(\counter_reg[31]_0 [9]),
        .I3(\counter_reg[31]_0 [8]),
        .O(\counter[31]_i_18_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \counter[31]_i_19 
       (.I0(\counter_reg[31]_0 [3]),
        .I1(\counter_reg[31]_0 [2]),
        .I2(\counter_reg[31]_0 [1]),
        .I3(\counter_reg[31]_0 [0]),
        .O(\counter[31]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[31]_i_2 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[31]_i_4_n_5 ),
        .I3(\counter[31]_i_5_n_0 ),
        .I4(load_val[31]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFFFFFFF)) 
    \counter[31]_i_3 
       (.I0(\counter[31]_i_8_n_0 ),
        .I1(\counter[31]_i_9_n_0 ),
        .I2(\counter[31]_i_10_n_0 ),
        .I3(\counter[31]_i_11_n_0 ),
        .I4(\counter[31]_i_12_n_0 ),
        .I5(\reg_cap_reg[31] [2]),
        .O(\counter[31]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \counter[31]_i_5 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[31]),
        .O(\counter[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000AAAA000C0000)) 
    \counter[31]_i_7 
       (.I0(CO),
        .I1(\counter[31]_i_17_n_0 ),
        .I2(\counter[31]_i_9_n_0 ),
        .I3(\counter[31]_i_8_n_0 ),
        .I4(\reg_cap_reg[31] [1]),
        .I5(\reg_cap_reg[31] [2]),
        .O(\counter[31]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \counter[31]_i_8 
       (.I0(\counter_reg[31]_0 [12]),
        .I1(\counter_reg[31]_0 [13]),
        .I2(\counter_reg[31]_0 [14]),
        .I3(\counter_reg[31]_0 [15]),
        .I4(\counter[31]_i_18_n_0 ),
        .O(\counter[31]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \counter[31]_i_9 
       (.I0(\counter_reg[31]_0 [4]),
        .I1(\counter_reg[31]_0 [5]),
        .I2(\counter_reg[31]_0 [6]),
        .I3(\counter_reg[31]_0 [7]),
        .I4(\counter[31]_i_19_n_0 ),
        .O(\counter[31]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[3]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[4]_i_2_n_5 ),
        .I3(\counter[3]_i_2_n_0 ),
        .I4(load_val[3]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[3]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[3]),
        .O(\counter[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[4]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[4]_i_2_n_4 ),
        .I3(\counter[4]_i_3_n_0 ),
        .I4(load_val[4]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[4]_i_3 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[4]),
        .O(\counter[4]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[4]_i_5 
       (.I0(\counter_reg[31]_0 [4]),
        .O(\counter[4]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[4]_i_6 
       (.I0(\counter_reg[31]_0 [3]),
        .O(\counter[4]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[4]_i_7 
       (.I0(\counter_reg[31]_0 [2]),
        .O(\counter[4]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[4]_i_8 
       (.I0(\counter_reg[31]_0 [1]),
        .O(\counter[4]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[5]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[8]_i_2_n_7 ),
        .I3(\counter[5]_i_2_n_0 ),
        .I4(load_val[5]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[5]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[5]),
        .O(\counter[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[6]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[8]_i_2_n_6 ),
        .I3(\counter[6]_i_2_n_0 ),
        .I4(load_val[6]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[6]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[6]),
        .O(\counter[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[7]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[8]_i_2_n_5 ),
        .I3(\counter[7]_i_2_n_0 ),
        .I4(load_val[7]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[7]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[7]),
        .O(\counter[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[8]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[8]_i_2_n_4 ),
        .I3(\counter[8]_i_3_n_0 ),
        .I4(load_val[8]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[8]_i_3 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[8]),
        .O(\counter[8]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[8]_i_5 
       (.I0(\counter_reg[31]_0 [8]),
        .O(\counter[8]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[8]_i_6 
       (.I0(\counter_reg[31]_0 [7]),
        .O(\counter[8]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[8]_i_7 
       (.I0(\counter_reg[31]_0 [6]),
        .O(\counter[8]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[8]_i_8 
       (.I0(\counter_reg[31]_0 [5]),
        .O(\counter[8]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5540FFEA5540)) 
    \counter[9]_i_1 
       (.I0(load_cmd),
        .I1(\counter[31]_i_3_n_0 ),
        .I2(\counter_reg[12]_i_2_n_7 ),
        .I3(\counter[9]_i_2_n_0 ),
        .I4(load_val[9]),
        .I5(\counter[31]_i_7_n_0 ),
        .O(\counter[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \counter[9]_i_2 
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(counter0[9]),
        .O(\counter[9]_i_2_n_0 ));
  FDCE \counter_reg[0] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[0]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [0]));
  FDCE \counter_reg[10] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[10]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [10]));
  FDCE \counter_reg[11] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[11]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [11]));
  FDCE \counter_reg[12] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[12]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [12]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[12]_i_2 
       (.CI(\counter_reg[8]_i_2_n_0 ),
        .CO({\counter_reg[12]_i_2_n_0 ,\counter_reg[12]_i_2_n_1 ,\counter_reg[12]_i_2_n_2 ,\counter_reg[12]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(\counter_reg[31]_0 [12:9]),
        .O({\counter_reg[12]_i_2_n_4 ,\counter_reg[12]_i_2_n_5 ,\counter_reg[12]_i_2_n_6 ,\counter_reg[12]_i_2_n_7 }),
        .S({\counter[12]_i_5_n_0 ,\counter[12]_i_6_n_0 ,\counter[12]_i_7_n_0 ,\counter[12]_i_8_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[12]_i_9 
       (.CI(\counter_reg[8]_i_9_n_0 ),
        .CO({\counter_reg[12]_i_9_n_0 ,\counter_reg[12]_i_9_n_1 ,\counter_reg[12]_i_9_n_2 ,\counter_reg[12]_i_9_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(counter0[12:9]),
        .S(\counter_reg[31]_0 [12:9]));
  FDCE \counter_reg[13] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[13]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [13]));
  FDCE \counter_reg[14] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[14]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [14]));
  FDCE \counter_reg[15] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[15]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [15]));
  FDCE \counter_reg[16] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[16]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [16]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[16]_i_2 
       (.CI(\counter_reg[12]_i_2_n_0 ),
        .CO({\counter_reg[16]_i_2_n_0 ,\counter_reg[16]_i_2_n_1 ,\counter_reg[16]_i_2_n_2 ,\counter_reg[16]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(\counter_reg[31]_0 [16:13]),
        .O({\counter_reg[16]_i_2_n_4 ,\counter_reg[16]_i_2_n_5 ,\counter_reg[16]_i_2_n_6 ,\counter_reg[16]_i_2_n_7 }),
        .S({\counter[16]_i_5_n_0 ,\counter[16]_i_6_n_0 ,\counter[16]_i_7_n_0 ,\counter[16]_i_8_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[16]_i_9 
       (.CI(\counter_reg[12]_i_9_n_0 ),
        .CO({\counter_reg[16]_i_9_n_0 ,\counter_reg[16]_i_9_n_1 ,\counter_reg[16]_i_9_n_2 ,\counter_reg[16]_i_9_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(counter0[16:13]),
        .S(\counter_reg[31]_0 [16:13]));
  FDCE \counter_reg[17] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[17]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [17]));
  FDCE \counter_reg[18] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[18]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [18]));
  FDCE \counter_reg[19] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[19]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [19]));
  FDCE \counter_reg[1] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[1]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [1]));
  FDCE \counter_reg[20] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[20]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [20]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[20]_i_2 
       (.CI(\counter_reg[16]_i_2_n_0 ),
        .CO({\counter_reg[20]_i_2_n_0 ,\counter_reg[20]_i_2_n_1 ,\counter_reg[20]_i_2_n_2 ,\counter_reg[20]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(\counter_reg[31]_0 [20:17]),
        .O({\counter_reg[20]_i_2_n_4 ,\counter_reg[20]_i_2_n_5 ,\counter_reg[20]_i_2_n_6 ,\counter_reg[20]_i_2_n_7 }),
        .S({\counter[20]_i_5_n_0 ,\counter[20]_i_6_n_0 ,\counter[20]_i_7_n_0 ,\counter[20]_i_8_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[20]_i_9 
       (.CI(\counter_reg[16]_i_9_n_0 ),
        .CO({\counter_reg[20]_i_9_n_0 ,\counter_reg[20]_i_9_n_1 ,\counter_reg[20]_i_9_n_2 ,\counter_reg[20]_i_9_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(counter0[20:17]),
        .S(\counter_reg[31]_0 [20:17]));
  FDCE \counter_reg[21] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[21]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [21]));
  FDCE \counter_reg[22] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[22]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [22]));
  FDCE \counter_reg[23] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[23]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [23]));
  FDCE \counter_reg[24] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[24]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [24]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[24]_i_2 
       (.CI(\counter_reg[20]_i_2_n_0 ),
        .CO({\counter_reg[24]_i_2_n_0 ,\counter_reg[24]_i_2_n_1 ,\counter_reg[24]_i_2_n_2 ,\counter_reg[24]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(\counter_reg[31]_0 [24:21]),
        .O({\counter_reg[24]_i_2_n_4 ,\counter_reg[24]_i_2_n_5 ,\counter_reg[24]_i_2_n_6 ,\counter_reg[24]_i_2_n_7 }),
        .S({\counter[24]_i_5_n_0 ,\counter[24]_i_6_n_0 ,\counter[24]_i_7_n_0 ,\counter[24]_i_8_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[24]_i_9 
       (.CI(\counter_reg[20]_i_9_n_0 ),
        .CO({\counter_reg[24]_i_9_n_0 ,\counter_reg[24]_i_9_n_1 ,\counter_reg[24]_i_9_n_2 ,\counter_reg[24]_i_9_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(counter0[24:21]),
        .S(\counter_reg[31]_0 [24:21]));
  FDCE \counter_reg[25] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[25]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [25]));
  FDCE \counter_reg[26] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[26]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [26]));
  FDCE \counter_reg[27] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[27]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [27]));
  FDCE \counter_reg[28] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[28]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [28]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[28]_i_2 
       (.CI(\counter_reg[24]_i_2_n_0 ),
        .CO({\counter_reg[28]_i_2_n_0 ,\counter_reg[28]_i_2_n_1 ,\counter_reg[28]_i_2_n_2 ,\counter_reg[28]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(\counter_reg[31]_0 [28:25]),
        .O({\counter_reg[28]_i_2_n_4 ,\counter_reg[28]_i_2_n_5 ,\counter_reg[28]_i_2_n_6 ,\counter_reg[28]_i_2_n_7 }),
        .S({\counter[28]_i_5_n_0 ,\counter[28]_i_6_n_0 ,\counter[28]_i_7_n_0 ,\counter[28]_i_8_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[28]_i_9 
       (.CI(\counter_reg[24]_i_9_n_0 ),
        .CO({\counter_reg[28]_i_9_n_0 ,\counter_reg[28]_i_9_n_1 ,\counter_reg[28]_i_9_n_2 ,\counter_reg[28]_i_9_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(counter0[28:25]),
        .S(\counter_reg[31]_0 [28:25]));
  FDCE \counter_reg[29] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[29]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [29]));
  FDCE \counter_reg[2] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[2]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [2]));
  FDCE \counter_reg[30] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[30]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [30]));
  FDCE \counter_reg[31] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[31]_i_2_n_0 ),
        .Q(\counter_reg[31]_0 [31]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[31]_i_16 
       (.CI(\counter_reg[28]_i_9_n_0 ),
        .CO({\NLW_counter_reg[31]_i_16_CO_UNCONNECTED [3:2],\counter_reg[31]_i_16_n_2 ,\counter_reg[31]_i_16_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_counter_reg[31]_i_16_O_UNCONNECTED [3],counter0[31:29]}),
        .S({1'b0,\counter_reg[31]_0 [31:29]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[31]_i_4 
       (.CI(\counter_reg[28]_i_2_n_0 ),
        .CO({\NLW_counter_reg[31]_i_4_CO_UNCONNECTED [3:2],\counter_reg[31]_i_4_n_2 ,\counter_reg[31]_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\counter_reg[31]_0 [30:29]}),
        .O({\NLW_counter_reg[31]_i_4_O_UNCONNECTED [3],\counter_reg[31]_i_4_n_5 ,\counter_reg[31]_i_4_n_6 ,\counter_reg[31]_i_4_n_7 }),
        .S({1'b0,\counter[31]_i_13_n_0 ,\counter[31]_i_14_n_0 ,\counter[31]_i_15_n_0 }));
  FDCE \counter_reg[3] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[3]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [3]));
  FDCE \counter_reg[4] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[4]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [4]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\counter_reg[4]_i_2_n_0 ,\counter_reg[4]_i_2_n_1 ,\counter_reg[4]_i_2_n_2 ,\counter_reg[4]_i_2_n_3 }),
        .CYINIT(\counter_reg[31]_0 [0]),
        .DI(\counter_reg[31]_0 [4:1]),
        .O({\counter_reg[4]_i_2_n_4 ,\counter_reg[4]_i_2_n_5 ,\counter_reg[4]_i_2_n_6 ,\counter_reg[4]_i_2_n_7 }),
        .S({\counter[4]_i_5_n_0 ,\counter[4]_i_6_n_0 ,\counter[4]_i_7_n_0 ,\counter[4]_i_8_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[4]_i_9 
       (.CI(1'b0),
        .CO({\counter_reg[4]_i_9_n_0 ,\counter_reg[4]_i_9_n_1 ,\counter_reg[4]_i_9_n_2 ,\counter_reg[4]_i_9_n_3 }),
        .CYINIT(\counter_reg[31]_0 [0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(counter0[4:1]),
        .S(\counter_reg[31]_0 [4:1]));
  FDCE \counter_reg[5] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[5]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [5]));
  FDCE \counter_reg[6] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[6]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [6]));
  FDCE \counter_reg[7] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[7]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [7]));
  FDCE \counter_reg[8] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[8]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [8]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[8]_i_2 
       (.CI(\counter_reg[4]_i_2_n_0 ),
        .CO({\counter_reg[8]_i_2_n_0 ,\counter_reg[8]_i_2_n_1 ,\counter_reg[8]_i_2_n_2 ,\counter_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(\counter_reg[31]_0 [8:5]),
        .O({\counter_reg[8]_i_2_n_4 ,\counter_reg[8]_i_2_n_5 ,\counter_reg[8]_i_2_n_6 ,\counter_reg[8]_i_2_n_7 }),
        .S({\counter[8]_i_5_n_0 ,\counter[8]_i_6_n_0 ,\counter[8]_i_7_n_0 ,\counter[8]_i_8_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[8]_i_9 
       (.CI(\counter_reg[4]_i_9_n_0 ),
        .CO({\counter_reg[8]_i_9_n_0 ,\counter_reg[8]_i_9_n_1 ,\counter_reg[8]_i_9_n_2 ,\counter_reg[8]_i_9_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(counter0[8:5]),
        .S(\counter_reg[31]_0 [8:5]));
  FDCE \counter_reg[9] 
       (.C(CLK),
        .CE(\counter_reg[31]_2 ),
        .CLR(wb_rst_i_IBUF),
        .D(\counter[9]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [9]));
  FDCE ext_meas_d_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(wb_rst_i_IBUF),
        .D(ext_meas_i_IBUF),
        .Q(ext_meas_d));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_1
       (.I0(\counter_reg[31]_0 [22]),
        .I1(load_val[22]),
        .I2(\counter_reg[31]_0 [21]),
        .I3(load_val[21]),
        .I4(\counter_reg[31]_0 [23]),
        .I5(load_val[23]),
        .O(i__carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_1__0
       (.I0(prescaler[8]),
        .O(i__carry__0_i_1__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_2
       (.I0(\counter_reg[31]_0 [19]),
        .I1(load_val[19]),
        .I2(\counter_reg[31]_0 [18]),
        .I3(load_val[18]),
        .I4(\counter_reg[31]_0 [20]),
        .I5(load_val[20]),
        .O(i__carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_2__0
       (.I0(prescaler[7]),
        .O(i__carry__0_i_2__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_3
       (.I0(\counter_reg[31]_0 [16]),
        .I1(load_val[16]),
        .I2(\counter_reg[31]_0 [15]),
        .I3(load_val[15]),
        .I4(\counter_reg[31]_0 [17]),
        .I5(load_val[17]),
        .O(i__carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_3__0
       (.I0(prescaler[6]),
        .O(i__carry__0_i_3__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_4
       (.I0(\counter_reg[31]_0 [13]),
        .I1(load_val[13]),
        .I2(\counter_reg[31]_0 [12]),
        .I3(load_val[12]),
        .I4(\counter_reg[31]_0 [14]),
        .I5(load_val[14]),
        .O(i__carry__0_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_4__0
       (.I0(prescaler[5]),
        .O(i__carry__0_i_4__0_n_0));
  LUT6 #(
    .INIT(64'hA95900000000A959)) 
    i__carry__1_i_1
       (.I0(\counter_reg[31]_0 [30]),
        .I1(\op_done1_inferred__0/i__carry__1_0 ),
        .I2(load_cmd),
        .I3(D[2]),
        .I4(load_val[31]),
        .I5(\counter_reg[31]_0 [31]),
        .O(i__carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_1__0
       (.I0(prescaler[12]),
        .O(i__carry__1_i_1__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__1_i_2
       (.I0(\counter_reg[31]_0 [28]),
        .I1(load_val[28]),
        .I2(\counter_reg[31]_0 [27]),
        .I3(load_val[27]),
        .I4(\counter_reg[31]_0 [29]),
        .I5(load_val[29]),
        .O(i__carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_2__0
       (.I0(prescaler[11]),
        .O(i__carry__1_i_2__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__1_i_3
       (.I0(\counter_reg[31]_0 [25]),
        .I1(load_val[25]),
        .I2(\counter_reg[31]_0 [24]),
        .I3(load_val[24]),
        .I4(\counter_reg[31]_0 [26]),
        .I5(load_val[26]),
        .O(i__carry__1_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_3__0
       (.I0(prescaler[10]),
        .O(i__carry__1_i_3__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_4
       (.I0(prescaler[9]),
        .O(i__carry__1_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_1
       (.I0(prescaler[15]),
        .O(i__carry__2_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_2
       (.I0(prescaler[14]),
        .O(i__carry__2_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_3
       (.I0(prescaler[13]),
        .O(i__carry__2_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_1
       (.I0(\counter_reg[31]_0 [10]),
        .I1(load_val[10]),
        .I2(\counter_reg[31]_0 [9]),
        .I3(load_val[9]),
        .I4(\counter_reg[31]_0 [11]),
        .I5(load_val[11]),
        .O(i__carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_1__0
       (.I0(prescaler[4]),
        .O(i__carry_i_1__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_2
       (.I0(\counter_reg[31]_0 [7]),
        .I1(load_val[7]),
        .I2(\counter_reg[31]_0 [6]),
        .I3(load_val[6]),
        .I4(\counter_reg[31]_0 [8]),
        .I5(load_val[8]),
        .O(i__carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_2__0
       (.I0(prescaler[3]),
        .O(i__carry_i_2__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_3
       (.I0(\counter_reg[31]_0 [4]),
        .I1(load_val[4]),
        .I2(\counter_reg[31]_0 [3]),
        .I3(load_val[3]),
        .I4(\counter_reg[31]_0 [5]),
        .I5(load_val[5]),
        .O(i__carry_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_3__0
       (.I0(prescaler[2]),
        .O(i__carry_i_3__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_4
       (.I0(\counter_reg[31]_0 [1]),
        .I1(load_val[1]),
        .I2(\counter_reg[31]_0 [0]),
        .I3(load_val[0]),
        .I4(\counter_reg[31]_0 [2]),
        .I5(load_val[2]),
        .O(i__carry_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_4__0
       (.I0(prescaler[1]),
        .O(i__carry_i_4__0_n_0));
  LUT4 #(
    .INIT(16'h0080)) 
    irq_i_1
       (.I0(ext_meas_d_reg_0),
        .I1(irq_i_3_n_0),
        .I2(\reg_cap_reg[31] [0]),
        .I3(load_cmd),
        .O(irq_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    irq_i_10
       (.I0(\counter_reg[31]_0 [31]),
        .I1(\counter_reg[31]_0 [30]),
        .I2(\counter_reg[31]_0 [29]),
        .I3(\counter_reg[31]_0 [28]),
        .O(irq_i_10_n_0));
  LUT5 #(
    .INIT(32'h02020F00)) 
    irq_i_2
       (.I0(ext_meas_i_IBUF),
        .I1(ext_meas_d),
        .I2(op_done_reg_n_0),
        .I3(clk_tick),
        .I4(\reg_cap_reg[31] [3]),
        .O(ext_meas_d_reg_0));
  LUT5 #(
    .INIT(32'h8888888B)) 
    irq_i_3
       (.I0(CO),
        .I1(\reg_cap_reg[31] [2]),
        .I2(irq_i_5_n_0),
        .I3(irq_i_6_n_0),
        .I4(irq_i_7_n_0),
        .O(irq_i_3_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    irq_i_5
       (.I0(irq_i_8_n_0),
        .I1(\counter_reg[31]_0 [5]),
        .I2(\counter_reg[31]_0 [4]),
        .I3(\counter_reg[31]_0 [3]),
        .I4(\counter_reg[31]_0 [2]),
        .O(irq_i_5_n_0));
  LUT6 #(
    .INIT(64'hEFFFFFFFFFFFFFFF)) 
    irq_i_6
       (.I0(\counter_reg[31]_0 [14]),
        .I1(\counter_reg[31]_0 [15]),
        .I2(irq_i_9_n_0),
        .I3(irq_i_10_n_0),
        .I4(\counter[31]_i_11_n_0 ),
        .I5(\counter[31]_i_10_n_0 ),
        .O(irq_i_6_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    irq_i_7
       (.I0(\counter_reg[31]_0 [6]),
        .I1(\counter_reg[31]_0 [7]),
        .I2(\counter_reg[31]_0 [8]),
        .I3(\counter_reg[31]_0 [9]),
        .O(irq_i_7_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    irq_i_8
       (.I0(\counter_reg[31]_0 [13]),
        .I1(\counter_reg[31]_0 [12]),
        .I2(\counter_reg[31]_0 [11]),
        .I3(\counter_reg[31]_0 [10]),
        .I4(\counter_reg[31]_0 [0]),
        .I5(\counter_reg[31]_0 [1]),
        .O(irq_i_8_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    irq_i_9
       (.I0(\counter_reg[31]_0 [27]),
        .I1(\counter_reg[31]_0 [26]),
        .I2(\counter_reg[31]_0 [25]),
        .I3(\counter_reg[31]_0 [24]),
        .O(irq_i_9_n_0));
  FDCE irq_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(wb_rst_i_IBUF),
        .D(irq_i_1_n_0),
        .Q(trigger_o_OBUF));
  CARRY4 \op_done1_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\op_done1_inferred__0/i__carry_n_0 ,\op_done1_inferred__0/i__carry_n_1 ,\op_done1_inferred__0/i__carry_n_2 ,\op_done1_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_op_done1_inferred__0/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_1_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0}));
  CARRY4 \op_done1_inferred__0/i__carry__0 
       (.CI(\op_done1_inferred__0/i__carry_n_0 ),
        .CO({\op_done1_inferred__0/i__carry__0_n_0 ,\op_done1_inferred__0/i__carry__0_n_1 ,\op_done1_inferred__0/i__carry__0_n_2 ,\op_done1_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_op_done1_inferred__0/i__carry__0_O_UNCONNECTED [3:0]),
        .S({i__carry__0_i_1_n_0,i__carry__0_i_2_n_0,i__carry__0_i_3_n_0,i__carry__0_i_4_n_0}));
  CARRY4 \op_done1_inferred__0/i__carry__1 
       (.CI(\op_done1_inferred__0/i__carry__0_n_0 ),
        .CO({\NLW_op_done1_inferred__0/i__carry__1_CO_UNCONNECTED [3],CO,\op_done1_inferred__0/i__carry__1_n_2 ,\op_done1_inferred__0/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_op_done1_inferred__0/i__carry__1_O_UNCONNECTED [3:0]),
        .S({1'b0,i__carry__1_i_1_n_0,i__carry__1_i_2_n_0,i__carry__1_i_3_n_0}));
  LUT6 #(
    .INIT(64'h0000FF0000000800)) 
    op_done_i_1
       (.I0(irq_i_3_n_0),
        .I1(ext_meas_d_reg_0),
        .I2(\reg_cap_reg[31] [1]),
        .I3(\reg_cap_reg[31] [0]),
        .I4(load_cmd),
        .I5(op_done_reg_n_0),
        .O(op_done_i_1_n_0));
  FDCE op_done_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(wb_rst_i_IBUF),
        .D(op_done_i_1_n_0),
        .Q(op_done_reg_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \prescaler0_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\prescaler0_inferred__0/i__carry_n_0 ,\prescaler0_inferred__0/i__carry_n_1 ,\prescaler0_inferred__0/i__carry_n_2 ,\prescaler0_inferred__0/i__carry_n_3 }),
        .CYINIT(Q),
        .DI(prescaler[4:1]),
        .O(data1[3:0]),
        .S({i__carry_i_1__0_n_0,i__carry_i_2__0_n_0,i__carry_i_3__0_n_0,i__carry_i_4__0_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \prescaler0_inferred__0/i__carry__0 
       (.CI(\prescaler0_inferred__0/i__carry_n_0 ),
        .CO({\prescaler0_inferred__0/i__carry__0_n_0 ,\prescaler0_inferred__0/i__carry__0_n_1 ,\prescaler0_inferred__0/i__carry__0_n_2 ,\prescaler0_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI(prescaler[8:5]),
        .O(data1[7:4]),
        .S({i__carry__0_i_1__0_n_0,i__carry__0_i_2__0_n_0,i__carry__0_i_3__0_n_0,i__carry__0_i_4__0_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \prescaler0_inferred__0/i__carry__1 
       (.CI(\prescaler0_inferred__0/i__carry__0_n_0 ),
        .CO({\prescaler0_inferred__0/i__carry__1_n_0 ,\prescaler0_inferred__0/i__carry__1_n_1 ,\prescaler0_inferred__0/i__carry__1_n_2 ,\prescaler0_inferred__0/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI(prescaler[12:9]),
        .O(data1[11:8]),
        .S({i__carry__1_i_1__0_n_0,i__carry__1_i_2__0_n_0,i__carry__1_i_3__0_n_0,i__carry__1_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \prescaler0_inferred__0/i__carry__2 
       (.CI(\prescaler0_inferred__0/i__carry__1_n_0 ),
        .CO({\NLW_prescaler0_inferred__0/i__carry__2_CO_UNCONNECTED [3:2],\prescaler0_inferred__0/i__carry__2_n_2 ,\prescaler0_inferred__0/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,prescaler[14:13]}),
        .O({\NLW_prescaler0_inferred__0/i__carry__2_O_UNCONNECTED [3],data1[14:12]}),
        .S({1'b0,i__carry__2_i_1_n_0,i__carry__2_i_2_n_0,i__carry__2_i_3_n_0}));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \prescaler[15]_i_3 
       (.I0(\prescaler[15]_i_4_n_0 ),
        .I1(prescaler[1]),
        .I2(Q),
        .I3(prescaler[3]),
        .I4(prescaler[2]),
        .I5(\prescaler[15]_i_5_n_0 ),
        .O(\prescaler_reg[1]_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \prescaler[15]_i_4 
       (.I0(prescaler[7]),
        .I1(prescaler[6]),
        .I2(prescaler[5]),
        .I3(prescaler[4]),
        .O(\prescaler[15]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \prescaler[15]_i_5 
       (.I0(prescaler[12]),
        .I1(prescaler[13]),
        .I2(prescaler[14]),
        .I3(prescaler[15]),
        .I4(\prescaler[15]_i_6_n_0 ),
        .O(\prescaler[15]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \prescaler[15]_i_6 
       (.I0(prescaler[11]),
        .I1(prescaler[10]),
        .I2(prescaler[9]),
        .I3(prescaler[8]),
        .O(\prescaler[15]_i_6_n_0 ));
  FDCE \prescaler_reg[0] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\prescaler_reg[15]_1 [0]),
        .Q(Q));
  FDCE \prescaler_reg[10] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\prescaler_reg[15]_1 [10]),
        .Q(prescaler[10]));
  FDCE \prescaler_reg[11] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\prescaler_reg[15]_1 [11]),
        .Q(prescaler[11]));
  FDCE \prescaler_reg[12] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\prescaler_reg[15]_1 [12]),
        .Q(prescaler[12]));
  FDCE \prescaler_reg[13] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\prescaler_reg[15]_1 [13]),
        .Q(prescaler[13]));
  FDCE \prescaler_reg[14] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\prescaler_reg[15]_1 [14]),
        .Q(prescaler[14]));
  FDCE \prescaler_reg[15] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\prescaler_reg[15]_1 [15]),
        .Q(prescaler[15]));
  FDCE \prescaler_reg[1] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\prescaler_reg[15]_1 [1]),
        .Q(prescaler[1]));
  FDCE \prescaler_reg[2] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\prescaler_reg[15]_1 [2]),
        .Q(prescaler[2]));
  FDCE \prescaler_reg[3] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\prescaler_reg[15]_1 [3]),
        .Q(prescaler[3]));
  FDCE \prescaler_reg[4] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\prescaler_reg[15]_1 [4]),
        .Q(prescaler[4]));
  FDCE \prescaler_reg[5] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\prescaler_reg[15]_1 [5]),
        .Q(prescaler[5]));
  FDCE \prescaler_reg[6] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\prescaler_reg[15]_1 [6]),
        .Q(prescaler[6]));
  FDCE \prescaler_reg[7] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\prescaler_reg[15]_1 [7]),
        .Q(prescaler[7]));
  FDCE \prescaler_reg[8] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\prescaler_reg[15]_1 [8]),
        .Q(prescaler[8]));
  FDCE \prescaler_reg[9] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\prescaler_reg[15]_1 [9]),
        .Q(prescaler[9]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_10
       (.I0(\counter_reg[31]_0 [29]),
        .I1(pwm_o_OBUF_inst_i_2[29]),
        .I2(pwm_o_OBUF_inst_i_2[28]),
        .I3(\counter_reg[31]_0 [28]),
        .O(\counter_reg[31]_1 [2]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_11
       (.I0(\counter_reg[31]_0 [27]),
        .I1(pwm_o_OBUF_inst_i_2[27]),
        .I2(pwm_o_OBUF_inst_i_2[26]),
        .I3(\counter_reg[31]_0 [26]),
        .O(\counter_reg[31]_1 [1]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_12
       (.I0(\counter_reg[31]_0 [25]),
        .I1(pwm_o_OBUF_inst_i_2[25]),
        .I2(pwm_o_OBUF_inst_i_2[24]),
        .I3(\counter_reg[31]_0 [24]),
        .O(\counter_reg[31]_1 [0]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_18
       (.I0(\counter_reg[31]_0 [31]),
        .I1(pwm_o_OBUF_inst_i_2[31]),
        .I2(pwm_o_OBUF_inst_i_2[30]),
        .I3(\counter_reg[31]_0 [30]),
        .O(S[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_19
       (.I0(\counter_reg[31]_0 [29]),
        .I1(pwm_o_OBUF_inst_i_2[29]),
        .I2(pwm_o_OBUF_inst_i_2[28]),
        .I3(\counter_reg[31]_0 [28]),
        .O(S[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_20
       (.I0(\counter_reg[31]_0 [27]),
        .I1(pwm_o_OBUF_inst_i_2[27]),
        .I2(pwm_o_OBUF_inst_i_2[26]),
        .I3(\counter_reg[31]_0 [26]),
        .O(S[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_21
       (.I0(\counter_reg[31]_0 [25]),
        .I1(pwm_o_OBUF_inst_i_2[25]),
        .I2(pwm_o_OBUF_inst_i_2[24]),
        .I3(\counter_reg[31]_0 [24]),
        .O(S[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_27
       (.I0(\counter_reg[31]_0 [23]),
        .I1(pwm_o_OBUF_inst_i_2[23]),
        .I2(pwm_o_OBUF_inst_i_2[22]),
        .I3(\counter_reg[31]_0 [22]),
        .O(\counter_reg[23]_1 [3]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_28
       (.I0(\counter_reg[31]_0 [21]),
        .I1(pwm_o_OBUF_inst_i_2[21]),
        .I2(pwm_o_OBUF_inst_i_2[20]),
        .I3(\counter_reg[31]_0 [20]),
        .O(\counter_reg[23]_1 [2]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_29
       (.I0(\counter_reg[31]_0 [19]),
        .I1(pwm_o_OBUF_inst_i_2[19]),
        .I2(pwm_o_OBUF_inst_i_2[18]),
        .I3(\counter_reg[31]_0 [18]),
        .O(\counter_reg[23]_1 [1]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_30
       (.I0(\counter_reg[31]_0 [17]),
        .I1(pwm_o_OBUF_inst_i_2[17]),
        .I2(pwm_o_OBUF_inst_i_2[16]),
        .I3(\counter_reg[31]_0 [16]),
        .O(\counter_reg[23]_1 [0]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_36
       (.I0(\counter_reg[31]_0 [23]),
        .I1(pwm_o_OBUF_inst_i_2[23]),
        .I2(pwm_o_OBUF_inst_i_2[22]),
        .I3(\counter_reg[31]_0 [22]),
        .O(\counter_reg[23]_0 [3]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_37
       (.I0(\counter_reg[31]_0 [21]),
        .I1(pwm_o_OBUF_inst_i_2[21]),
        .I2(pwm_o_OBUF_inst_i_2[20]),
        .I3(\counter_reg[31]_0 [20]),
        .O(\counter_reg[23]_0 [2]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_38
       (.I0(\counter_reg[31]_0 [19]),
        .I1(pwm_o_OBUF_inst_i_2[19]),
        .I2(pwm_o_OBUF_inst_i_2[18]),
        .I3(\counter_reg[31]_0 [18]),
        .O(\counter_reg[23]_0 [1]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_39
       (.I0(\counter_reg[31]_0 [17]),
        .I1(pwm_o_OBUF_inst_i_2[17]),
        .I2(pwm_o_OBUF_inst_i_2[16]),
        .I3(\counter_reg[31]_0 [16]),
        .O(\counter_reg[23]_0 [0]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_45
       (.I0(\counter_reg[31]_0 [15]),
        .I1(pwm_o_OBUF_inst_i_2[15]),
        .I2(pwm_o_OBUF_inst_i_2[14]),
        .I3(\counter_reg[31]_0 [14]),
        .O(\counter_reg[15]_1 [3]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_46
       (.I0(\counter_reg[31]_0 [13]),
        .I1(pwm_o_OBUF_inst_i_2[13]),
        .I2(pwm_o_OBUF_inst_i_2[12]),
        .I3(\counter_reg[31]_0 [12]),
        .O(\counter_reg[15]_1 [2]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_47
       (.I0(\counter_reg[31]_0 [11]),
        .I1(pwm_o_OBUF_inst_i_2[11]),
        .I2(pwm_o_OBUF_inst_i_2[10]),
        .I3(\counter_reg[31]_0 [10]),
        .O(\counter_reg[15]_1 [1]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_48
       (.I0(\counter_reg[31]_0 [9]),
        .I1(pwm_o_OBUF_inst_i_2[9]),
        .I2(pwm_o_OBUF_inst_i_2[8]),
        .I3(\counter_reg[31]_0 [8]),
        .O(\counter_reg[15]_1 [0]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_54
       (.I0(\counter_reg[31]_0 [15]),
        .I1(pwm_o_OBUF_inst_i_2[15]),
        .I2(pwm_o_OBUF_inst_i_2[14]),
        .I3(\counter_reg[31]_0 [14]),
        .O(\counter_reg[15]_0 [3]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_55
       (.I0(\counter_reg[31]_0 [13]),
        .I1(pwm_o_OBUF_inst_i_2[13]),
        .I2(pwm_o_OBUF_inst_i_2[12]),
        .I3(\counter_reg[31]_0 [12]),
        .O(\counter_reg[15]_0 [2]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_56
       (.I0(\counter_reg[31]_0 [11]),
        .I1(pwm_o_OBUF_inst_i_2[11]),
        .I2(pwm_o_OBUF_inst_i_2[10]),
        .I3(\counter_reg[31]_0 [10]),
        .O(\counter_reg[15]_0 [1]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_57
       (.I0(\counter_reg[31]_0 [9]),
        .I1(pwm_o_OBUF_inst_i_2[9]),
        .I2(pwm_o_OBUF_inst_i_2[8]),
        .I3(\counter_reg[31]_0 [8]),
        .O(\counter_reg[15]_0 [0]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_62
       (.I0(\counter_reg[31]_0 [7]),
        .I1(pwm_o_OBUF_inst_i_2[7]),
        .I2(pwm_o_OBUF_inst_i_2[6]),
        .I3(\counter_reg[31]_0 [6]),
        .O(\counter_reg[7]_1 [3]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_63
       (.I0(\counter_reg[31]_0 [5]),
        .I1(pwm_o_OBUF_inst_i_2[5]),
        .I2(pwm_o_OBUF_inst_i_2[4]),
        .I3(\counter_reg[31]_0 [4]),
        .O(\counter_reg[7]_1 [2]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_64
       (.I0(\counter_reg[31]_0 [3]),
        .I1(pwm_o_OBUF_inst_i_2[3]),
        .I2(pwm_o_OBUF_inst_i_2[2]),
        .I3(\counter_reg[31]_0 [2]),
        .O(\counter_reg[7]_1 [1]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_65
       (.I0(\counter_reg[31]_0 [1]),
        .I1(pwm_o_OBUF_inst_i_2[1]),
        .I2(pwm_o_OBUF_inst_i_2[0]),
        .I3(\counter_reg[31]_0 [0]),
        .O(\counter_reg[7]_1 [0]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_70
       (.I0(\counter_reg[31]_0 [7]),
        .I1(pwm_o_OBUF_inst_i_2[7]),
        .I2(pwm_o_OBUF_inst_i_2[6]),
        .I3(\counter_reg[31]_0 [6]),
        .O(\counter_reg[7]_0 [3]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_71
       (.I0(\counter_reg[31]_0 [5]),
        .I1(pwm_o_OBUF_inst_i_2[5]),
        .I2(pwm_o_OBUF_inst_i_2[4]),
        .I3(\counter_reg[31]_0 [4]),
        .O(\counter_reg[7]_0 [2]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_72
       (.I0(\counter_reg[31]_0 [3]),
        .I1(pwm_o_OBUF_inst_i_2[3]),
        .I2(pwm_o_OBUF_inst_i_2[2]),
        .I3(\counter_reg[31]_0 [2]),
        .O(\counter_reg[7]_0 [1]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_73
       (.I0(\counter_reg[31]_0 [1]),
        .I1(pwm_o_OBUF_inst_i_2[1]),
        .I2(pwm_o_OBUF_inst_i_2[0]),
        .I3(\counter_reg[31]_0 [0]),
        .O(\counter_reg[7]_0 [0]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_9
       (.I0(\counter_reg[31]_0 [31]),
        .I1(pwm_o_OBUF_inst_i_2[31]),
        .I2(pwm_o_OBUF_inst_i_2[30]),
        .I3(\counter_reg[31]_0 [30]),
        .O(\counter_reg[31]_1 [3]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_cap[31]_i_1 
       (.I0(capture_stb),
        .I1(\reg_cap_reg[31] [4]),
        .O(E));
  LUT6 #(
    .INIT(64'hCCCCC4CCCCCCCCCC)) 
    \reg_int_sts[0]_i_2 
       (.I0(D[0]),
        .I1(trigger_o_OBUF),
        .I2(\reg_int_sts_reg[0] ),
        .I3(wb_adr_i_IBUF[2]),
        .I4(wb_adr_i_IBUF[1]),
        .I5(wb_adr_i_IBUF[0]),
        .O(irq_reg_0));
  LUT6 #(
    .INIT(64'hCCCCC4CCCCCCCCCC)) 
    \reg_int_sts[1]_i_3 
       (.I0(D[1]),
        .I1(capture_stb),
        .I2(\reg_int_sts_reg[0] ),
        .I3(wb_adr_i_IBUF[2]),
        .I4(wb_adr_i_IBUF[1]),
        .I5(wb_adr_i_IBUF[0]),
        .O(capture_stb_reg_0));
endmodule

module timer_regs
   (wb_dat_o_OBUF,
    \reg_pre_reg[15]_0 ,
    \reg_ctrl_reg[0]_0 ,
    \reg_ctrl_reg[6]_0 ,
    \reg_ctrl_reg[5]_0 ,
    clk_tick7_out,
    \wb_adr_i[1] ,
    \reg_cmp_reg[31]_0 ,
    \reg_load_reg[31]_0 ,
    pwm_o_OBUF,
    irq_OBUF,
    \reg_ctrl_reg[3]_0 ,
    \wb_dat_o[0] ,
    \wb_dat_o[0]_0 ,
    data1,
    \prescaler_reg[15] ,
    load_cmd,
    Q,
    \counter_reg[31] ,
    wb_adr_i_IBUF,
    pwm_o_OBUF_inst_i_2_0,
    CO,
    pwm_o_OBUF_inst_i_22_0,
    pwm_o_OBUF_inst_i_4_0,
    pwm_o_OBUF_inst_i_2_1,
    pwm_o_OBUF_inst_i_1_0,
    pwm_o_OBUF_inst_i_31_0,
    pwm_o_OBUF_inst_i_13_0,
    pwm_o_OBUF_inst_i_3_0,
    S,
    E,
    D,
    CLK,
    wb_rst_i_IBUF,
    \reg_int_en_reg[31]_0 ,
    capture_stb,
    \reg_int_sts_reg[1]_0 ,
    \reg_int_sts_reg[1]_1 ,
    reg_int_sts2_out,
    trigger_o_OBUF,
    \reg_int_sts_reg[0]_0 ,
    \reg_load_reg[31]_1 ,
    \reg_pre_reg[31]_0 ,
    \reg_cmp_reg[31]_1 ,
    \reg_cap_reg[31]_0 ,
    \reg_cap_reg[31]_1 );
  output [31:0]wb_dat_o_OBUF;
  output [15:0]\reg_pre_reg[15]_0 ;
  output [0:0]\reg_ctrl_reg[0]_0 ;
  output [4:0]\reg_ctrl_reg[6]_0 ;
  output [0:0]\reg_ctrl_reg[5]_0 ;
  output clk_tick7_out;
  output \wb_adr_i[1] ;
  output [31:0]\reg_cmp_reg[31]_0 ;
  output [31:0]\reg_load_reg[31]_0 ;
  output pwm_o_OBUF;
  output irq_OBUF;
  output \reg_ctrl_reg[3]_0 ;
  input \wb_dat_o[0] ;
  input \wb_dat_o[0]_0 ;
  input [14:0]data1;
  input \prescaler_reg[15] ;
  input load_cmd;
  input [0:0]Q;
  input \counter_reg[31] ;
  input [3:0]wb_adr_i_IBUF;
  input [31:0]pwm_o_OBUF_inst_i_2_0;
  input [0:0]CO;
  input [3:0]pwm_o_OBUF_inst_i_22_0;
  input [3:0]pwm_o_OBUF_inst_i_4_0;
  input [3:0]pwm_o_OBUF_inst_i_2_1;
  input [3:0]pwm_o_OBUF_inst_i_1_0;
  input [3:0]pwm_o_OBUF_inst_i_31_0;
  input [3:0]pwm_o_OBUF_inst_i_13_0;
  input [3:0]pwm_o_OBUF_inst_i_3_0;
  input [3:0]S;
  input [0:0]E;
  input [31:0]D;
  input CLK;
  input wb_rst_i_IBUF;
  input [0:0]\reg_int_en_reg[31]_0 ;
  input capture_stb;
  input \reg_int_sts_reg[1]_0 ;
  input \reg_int_sts_reg[1]_1 ;
  input [1:0]reg_int_sts2_out;
  input trigger_o_OBUF;
  input \reg_int_sts_reg[0]_0 ;
  input [0:0]\reg_load_reg[31]_1 ;
  input [0:0]\reg_pre_reg[31]_0 ;
  input [0:0]\reg_cmp_reg[31]_1 ;
  input [0:0]\reg_cap_reg[31]_0 ;
  input [31:0]\reg_cap_reg[31]_1 ;

  wire CLK;
  wire [0:0]CO;
  wire [31:0]D;
  wire [0:0]E;
  wire [0:0]Q;
  wire [3:0]S;
  wire capture_stb;
  wire clk_tick7_out;
  wire \counter_reg[31] ;
  wire [14:0]data1;
  wire irq_OBUF;
  wire load_cmd;
  wire \prescaler_reg[15] ;
  wire pwm_en;
  wire pwm_o_OBUF;
  wire [3:0]pwm_o_OBUF_inst_i_13_0;
  wire pwm_o_OBUF_inst_i_13_n_0;
  wire pwm_o_OBUF_inst_i_13_n_1;
  wire pwm_o_OBUF_inst_i_13_n_2;
  wire pwm_o_OBUF_inst_i_13_n_3;
  wire pwm_o_OBUF_inst_i_14_n_0;
  wire pwm_o_OBUF_inst_i_15_n_0;
  wire pwm_o_OBUF_inst_i_16_n_0;
  wire pwm_o_OBUF_inst_i_17_n_0;
  wire [3:0]pwm_o_OBUF_inst_i_1_0;
  wire [3:0]pwm_o_OBUF_inst_i_22_0;
  wire pwm_o_OBUF_inst_i_22_n_0;
  wire pwm_o_OBUF_inst_i_22_n_1;
  wire pwm_o_OBUF_inst_i_22_n_2;
  wire pwm_o_OBUF_inst_i_22_n_3;
  wire pwm_o_OBUF_inst_i_23_n_0;
  wire pwm_o_OBUF_inst_i_24_n_0;
  wire pwm_o_OBUF_inst_i_25_n_0;
  wire pwm_o_OBUF_inst_i_26_n_0;
  wire [31:0]pwm_o_OBUF_inst_i_2_0;
  wire [3:0]pwm_o_OBUF_inst_i_2_1;
  wire pwm_o_OBUF_inst_i_2_n_0;
  wire pwm_o_OBUF_inst_i_2_n_1;
  wire pwm_o_OBUF_inst_i_2_n_2;
  wire pwm_o_OBUF_inst_i_2_n_3;
  wire [3:0]pwm_o_OBUF_inst_i_31_0;
  wire pwm_o_OBUF_inst_i_31_n_0;
  wire pwm_o_OBUF_inst_i_31_n_1;
  wire pwm_o_OBUF_inst_i_31_n_2;
  wire pwm_o_OBUF_inst_i_31_n_3;
  wire pwm_o_OBUF_inst_i_32_n_0;
  wire pwm_o_OBUF_inst_i_33_n_0;
  wire pwm_o_OBUF_inst_i_34_n_0;
  wire pwm_o_OBUF_inst_i_35_n_0;
  wire [3:0]pwm_o_OBUF_inst_i_3_0;
  wire pwm_o_OBUF_inst_i_3_n_0;
  wire pwm_o_OBUF_inst_i_3_n_1;
  wire pwm_o_OBUF_inst_i_3_n_2;
  wire pwm_o_OBUF_inst_i_3_n_3;
  wire pwm_o_OBUF_inst_i_40_n_0;
  wire pwm_o_OBUF_inst_i_40_n_1;
  wire pwm_o_OBUF_inst_i_40_n_2;
  wire pwm_o_OBUF_inst_i_40_n_3;
  wire pwm_o_OBUF_inst_i_41_n_0;
  wire pwm_o_OBUF_inst_i_42_n_0;
  wire pwm_o_OBUF_inst_i_43_n_0;
  wire pwm_o_OBUF_inst_i_44_n_0;
  wire pwm_o_OBUF_inst_i_49_n_0;
  wire pwm_o_OBUF_inst_i_49_n_1;
  wire pwm_o_OBUF_inst_i_49_n_2;
  wire pwm_o_OBUF_inst_i_49_n_3;
  wire [3:0]pwm_o_OBUF_inst_i_4_0;
  wire pwm_o_OBUF_inst_i_4_n_0;
  wire pwm_o_OBUF_inst_i_4_n_1;
  wire pwm_o_OBUF_inst_i_4_n_2;
  wire pwm_o_OBUF_inst_i_4_n_3;
  wire pwm_o_OBUF_inst_i_50_n_0;
  wire pwm_o_OBUF_inst_i_51_n_0;
  wire pwm_o_OBUF_inst_i_52_n_0;
  wire pwm_o_OBUF_inst_i_53_n_0;
  wire pwm_o_OBUF_inst_i_58_n_0;
  wire pwm_o_OBUF_inst_i_59_n_0;
  wire pwm_o_OBUF_inst_i_5_n_0;
  wire pwm_o_OBUF_inst_i_60_n_0;
  wire pwm_o_OBUF_inst_i_61_n_0;
  wire pwm_o_OBUF_inst_i_66_n_0;
  wire pwm_o_OBUF_inst_i_67_n_0;
  wire pwm_o_OBUF_inst_i_68_n_0;
  wire pwm_o_OBUF_inst_i_69_n_0;
  wire pwm_o_OBUF_inst_i_6_n_0;
  wire pwm_o_OBUF_inst_i_7_n_0;
  wire pwm_o_OBUF_inst_i_8_n_0;
  wire [31:0]reg_cap;
  wire [0:0]\reg_cap_reg[31]_0 ;
  wire [31:0]\reg_cap_reg[31]_1 ;
  wire [31:0]\reg_cmp_reg[31]_0 ;
  wire [0:0]\reg_cmp_reg[31]_1 ;
  wire [0:0]\reg_ctrl_reg[0]_0 ;
  wire \reg_ctrl_reg[3]_0 ;
  wire [0:0]\reg_ctrl_reg[5]_0 ;
  wire [4:0]\reg_ctrl_reg[6]_0 ;
  wire \reg_ctrl_reg_n_0_[10] ;
  wire \reg_ctrl_reg_n_0_[11] ;
  wire \reg_ctrl_reg_n_0_[12] ;
  wire \reg_ctrl_reg_n_0_[13] ;
  wire \reg_ctrl_reg_n_0_[14] ;
  wire \reg_ctrl_reg_n_0_[15] ;
  wire \reg_ctrl_reg_n_0_[16] ;
  wire \reg_ctrl_reg_n_0_[17] ;
  wire \reg_ctrl_reg_n_0_[18] ;
  wire \reg_ctrl_reg_n_0_[19] ;
  wire \reg_ctrl_reg_n_0_[20] ;
  wire \reg_ctrl_reg_n_0_[21] ;
  wire \reg_ctrl_reg_n_0_[22] ;
  wire \reg_ctrl_reg_n_0_[23] ;
  wire \reg_ctrl_reg_n_0_[24] ;
  wire \reg_ctrl_reg_n_0_[25] ;
  wire \reg_ctrl_reg_n_0_[26] ;
  wire \reg_ctrl_reg_n_0_[27] ;
  wire \reg_ctrl_reg_n_0_[28] ;
  wire \reg_ctrl_reg_n_0_[29] ;
  wire \reg_ctrl_reg_n_0_[30] ;
  wire \reg_ctrl_reg_n_0_[31] ;
  wire \reg_ctrl_reg_n_0_[7] ;
  wire \reg_ctrl_reg_n_0_[8] ;
  wire \reg_ctrl_reg_n_0_[9] ;
  wire [0:0]\reg_int_en_reg[31]_0 ;
  wire \reg_int_en_reg_n_0_[0] ;
  wire \reg_int_en_reg_n_0_[10] ;
  wire \reg_int_en_reg_n_0_[11] ;
  wire \reg_int_en_reg_n_0_[12] ;
  wire \reg_int_en_reg_n_0_[13] ;
  wire \reg_int_en_reg_n_0_[14] ;
  wire \reg_int_en_reg_n_0_[15] ;
  wire \reg_int_en_reg_n_0_[16] ;
  wire \reg_int_en_reg_n_0_[17] ;
  wire \reg_int_en_reg_n_0_[18] ;
  wire \reg_int_en_reg_n_0_[19] ;
  wire \reg_int_en_reg_n_0_[1] ;
  wire \reg_int_en_reg_n_0_[20] ;
  wire \reg_int_en_reg_n_0_[21] ;
  wire \reg_int_en_reg_n_0_[22] ;
  wire \reg_int_en_reg_n_0_[23] ;
  wire \reg_int_en_reg_n_0_[24] ;
  wire \reg_int_en_reg_n_0_[25] ;
  wire \reg_int_en_reg_n_0_[26] ;
  wire \reg_int_en_reg_n_0_[27] ;
  wire \reg_int_en_reg_n_0_[28] ;
  wire \reg_int_en_reg_n_0_[29] ;
  wire \reg_int_en_reg_n_0_[2] ;
  wire \reg_int_en_reg_n_0_[30] ;
  wire \reg_int_en_reg_n_0_[31] ;
  wire \reg_int_en_reg_n_0_[3] ;
  wire \reg_int_en_reg_n_0_[4] ;
  wire \reg_int_en_reg_n_0_[5] ;
  wire \reg_int_en_reg_n_0_[6] ;
  wire \reg_int_en_reg_n_0_[7] ;
  wire \reg_int_en_reg_n_0_[8] ;
  wire \reg_int_en_reg_n_0_[9] ;
  wire [1:0]reg_int_sts;
  wire [1:0]reg_int_sts2_out;
  wire \reg_int_sts[0]_i_1_n_0 ;
  wire \reg_int_sts[1]_i_1_n_0 ;
  wire \reg_int_sts_reg[0]_0 ;
  wire \reg_int_sts_reg[1]_0 ;
  wire \reg_int_sts_reg[1]_1 ;
  wire [31:0]\reg_load_reg[31]_0 ;
  wire [0:0]\reg_load_reg[31]_1 ;
  wire [31:0]reg_pre;
  wire [15:0]\reg_pre_reg[15]_0 ;
  wire [0:0]\reg_pre_reg[31]_0 ;
  wire sel00;
  wire trigger_o_OBUF;
  wire \wb_adr_i[1] ;
  wire [3:0]wb_adr_i_IBUF;
  wire \wb_dat_o[0] ;
  wire \wb_dat_o[0]_0 ;
  wire [31:0]wb_dat_o_OBUF;
  wire \wb_dat_o_OBUF[0]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[0]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[10]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[10]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[11]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[11]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[12]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[12]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[13]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[13]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[14]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[14]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[15]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[15]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[16]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[16]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[17]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[17]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[18]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[18]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[19]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[19]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[1]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[1]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[20]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[20]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[21]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[21]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[22]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[22]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[23]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[23]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[24]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[24]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[25]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[25]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[26]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[26]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[27]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[27]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[28]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[28]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[29]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[29]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[2]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[2]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[30]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[30]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[31]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[31]_inst_i_4_n_0 ;
  wire \wb_dat_o_OBUF[3]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[3]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[4]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[4]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[5]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[5]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[6]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[6]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[7]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[7]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[8]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[8]_inst_i_3_n_0 ;
  wire \wb_dat_o_OBUF[9]_inst_i_2_n_0 ;
  wire \wb_dat_o_OBUF[9]_inst_i_3_n_0 ;
  wire wb_rst_i_IBUF;
  wire [3:0]NLW_pwm_o_OBUF_inst_i_13_O_UNCONNECTED;
  wire [3:0]NLW_pwm_o_OBUF_inst_i_2_O_UNCONNECTED;
  wire [3:0]NLW_pwm_o_OBUF_inst_i_22_O_UNCONNECTED;
  wire [3:0]NLW_pwm_o_OBUF_inst_i_3_O_UNCONNECTED;
  wire [3:0]NLW_pwm_o_OBUF_inst_i_31_O_UNCONNECTED;
  wire [3:0]NLW_pwm_o_OBUF_inst_i_4_O_UNCONNECTED;
  wire [3:0]NLW_pwm_o_OBUF_inst_i_40_O_UNCONNECTED;
  wire [3:0]NLW_pwm_o_OBUF_inst_i_49_O_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h00004500)) 
    clk_tick_i_1
       (.I0(\reg_ctrl_reg[6]_0 [3]),
        .I1(\prescaler_reg[15] ),
        .I2(sel00),
        .I3(\reg_ctrl_reg[6]_0 [0]),
        .I4(load_cmd),
        .O(clk_tick7_out));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[0]_i_2 
       (.I0(\reg_ctrl_reg[6]_0 [2]),
        .I1(CO),
        .O(\reg_ctrl_reg[3]_0 ));
  LUT3 #(
    .INIT(8'hF8)) 
    \counter[31]_i_1 
       (.I0(\reg_ctrl_reg[6]_0 [0]),
        .I1(\counter_reg[31] ),
        .I2(load_cmd),
        .O(\reg_ctrl_reg[0]_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    irq_OBUF_inst_i_1
       (.I0(\reg_int_en_reg_n_0_[1] ),
        .I1(reg_int_sts[1]),
        .I2(\reg_int_en_reg_n_0_[0] ),
        .I3(reg_int_sts[0]),
        .O(irq_OBUF));
  LUT5 #(
    .INIT(32'hAAAAA030)) 
    \prescaler[0]_i_1 
       (.I0(reg_pre[0]),
        .I1(Q),
        .I2(sel00),
        .I3(\prescaler_reg[15] ),
        .I4(load_cmd),
        .O(\reg_pre_reg[15]_0 [0]));
  LUT5 #(
    .INIT(32'hAAAAA0C0)) 
    \prescaler[10]_i_1 
       (.I0(reg_pre[10]),
        .I1(data1[9]),
        .I2(sel00),
        .I3(\prescaler_reg[15] ),
        .I4(load_cmd),
        .O(\reg_pre_reg[15]_0 [10]));
  LUT5 #(
    .INIT(32'hAAAAA0C0)) 
    \prescaler[11]_i_1 
       (.I0(reg_pre[11]),
        .I1(data1[10]),
        .I2(sel00),
        .I3(\prescaler_reg[15] ),
        .I4(load_cmd),
        .O(\reg_pre_reg[15]_0 [11]));
  LUT5 #(
    .INIT(32'hAAAAA0C0)) 
    \prescaler[12]_i_1 
       (.I0(reg_pre[12]),
        .I1(data1[11]),
        .I2(sel00),
        .I3(\prescaler_reg[15] ),
        .I4(load_cmd),
        .O(\reg_pre_reg[15]_0 [12]));
  LUT5 #(
    .INIT(32'hAAAAA0C0)) 
    \prescaler[13]_i_1 
       (.I0(reg_pre[13]),
        .I1(data1[12]),
        .I2(sel00),
        .I3(\prescaler_reg[15] ),
        .I4(load_cmd),
        .O(\reg_pre_reg[15]_0 [13]));
  LUT5 #(
    .INIT(32'hAAAAA0C0)) 
    \prescaler[14]_i_1 
       (.I0(reg_pre[14]),
        .I1(data1[13]),
        .I2(sel00),
        .I3(\prescaler_reg[15] ),
        .I4(load_cmd),
        .O(\reg_pre_reg[15]_0 [14]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    \prescaler[15]_i_1 
       (.I0(\reg_ctrl_reg[6]_0 [3]),
        .I1(\reg_ctrl_reg[6]_0 [0]),
        .I2(load_cmd),
        .O(\reg_ctrl_reg[5]_0 ));
  LUT5 #(
    .INIT(32'hAAAAA0C0)) 
    \prescaler[15]_i_2 
       (.I0(reg_pre[15]),
        .I1(data1[14]),
        .I2(sel00),
        .I3(\prescaler_reg[15] ),
        .I4(load_cmd),
        .O(\reg_pre_reg[15]_0 [15]));
  LUT5 #(
    .INIT(32'hAAAAA0C0)) 
    \prescaler[1]_i_1 
       (.I0(reg_pre[1]),
        .I1(data1[0]),
        .I2(sel00),
        .I3(\prescaler_reg[15] ),
        .I4(load_cmd),
        .O(\reg_pre_reg[15]_0 [1]));
  LUT5 #(
    .INIT(32'hAAAAA0C0)) 
    \prescaler[2]_i_1 
       (.I0(reg_pre[2]),
        .I1(data1[1]),
        .I2(sel00),
        .I3(\prescaler_reg[15] ),
        .I4(load_cmd),
        .O(\reg_pre_reg[15]_0 [2]));
  LUT5 #(
    .INIT(32'hAAAAA0C0)) 
    \prescaler[3]_i_1 
       (.I0(reg_pre[3]),
        .I1(data1[2]),
        .I2(sel00),
        .I3(\prescaler_reg[15] ),
        .I4(load_cmd),
        .O(\reg_pre_reg[15]_0 [3]));
  LUT5 #(
    .INIT(32'hAAAAA0C0)) 
    \prescaler[4]_i_1 
       (.I0(reg_pre[4]),
        .I1(data1[3]),
        .I2(sel00),
        .I3(\prescaler_reg[15] ),
        .I4(load_cmd),
        .O(\reg_pre_reg[15]_0 [4]));
  LUT5 #(
    .INIT(32'hAAAAA0C0)) 
    \prescaler[5]_i_1 
       (.I0(reg_pre[5]),
        .I1(data1[4]),
        .I2(sel00),
        .I3(\prescaler_reg[15] ),
        .I4(load_cmd),
        .O(\reg_pre_reg[15]_0 [5]));
  LUT5 #(
    .INIT(32'hAAAAA0C0)) 
    \prescaler[6]_i_1 
       (.I0(reg_pre[6]),
        .I1(data1[5]),
        .I2(sel00),
        .I3(\prescaler_reg[15] ),
        .I4(load_cmd),
        .O(\reg_pre_reg[15]_0 [6]));
  LUT5 #(
    .INIT(32'hAAAAA0C0)) 
    \prescaler[7]_i_1 
       (.I0(reg_pre[7]),
        .I1(data1[6]),
        .I2(sel00),
        .I3(\prescaler_reg[15] ),
        .I4(load_cmd),
        .O(\reg_pre_reg[15]_0 [7]));
  LUT5 #(
    .INIT(32'hAAAAA0C0)) 
    \prescaler[8]_i_1 
       (.I0(reg_pre[8]),
        .I1(data1[7]),
        .I2(sel00),
        .I3(\prescaler_reg[15] ),
        .I4(load_cmd),
        .O(\reg_pre_reg[15]_0 [8]));
  LUT5 #(
    .INIT(32'hAAAAA0C0)) 
    \prescaler[9]_i_1 
       (.I0(reg_pre[9]),
        .I1(data1[8]),
        .I2(sel00),
        .I3(\prescaler_reg[15] ),
        .I4(load_cmd),
        .O(\reg_pre_reg[15]_0 [9]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hB080)) 
    pwm_o_OBUF_inst_i_1
       (.I0(pwm_o_OBUF_inst_i_2_n_0),
        .I1(\reg_ctrl_reg[6]_0 [2]),
        .I2(pwm_en),
        .I3(pwm_o_OBUF_inst_i_3_n_0),
        .O(pwm_o_OBUF));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_o_OBUF_inst_i_13
       (.CI(pwm_o_OBUF_inst_i_31_n_0),
        .CO({pwm_o_OBUF_inst_i_13_n_0,pwm_o_OBUF_inst_i_13_n_1,pwm_o_OBUF_inst_i_13_n_2,pwm_o_OBUF_inst_i_13_n_3}),
        .CYINIT(1'b0),
        .DI({pwm_o_OBUF_inst_i_32_n_0,pwm_o_OBUF_inst_i_33_n_0,pwm_o_OBUF_inst_i_34_n_0,pwm_o_OBUF_inst_i_35_n_0}),
        .O(NLW_pwm_o_OBUF_inst_i_13_O_UNCONNECTED[3:0]),
        .S(pwm_o_OBUF_inst_i_3_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_14
       (.I0(\reg_cmp_reg[31]_0 [30]),
        .I1(pwm_o_OBUF_inst_i_2_0[30]),
        .I2(pwm_o_OBUF_inst_i_2_0[31]),
        .I3(\reg_cmp_reg[31]_0 [31]),
        .O(pwm_o_OBUF_inst_i_14_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_15
       (.I0(\reg_cmp_reg[31]_0 [28]),
        .I1(pwm_o_OBUF_inst_i_2_0[28]),
        .I2(pwm_o_OBUF_inst_i_2_0[29]),
        .I3(\reg_cmp_reg[31]_0 [29]),
        .O(pwm_o_OBUF_inst_i_15_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_16
       (.I0(\reg_cmp_reg[31]_0 [26]),
        .I1(pwm_o_OBUF_inst_i_2_0[26]),
        .I2(pwm_o_OBUF_inst_i_2_0[27]),
        .I3(\reg_cmp_reg[31]_0 [27]),
        .O(pwm_o_OBUF_inst_i_16_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_17
       (.I0(\reg_cmp_reg[31]_0 [24]),
        .I1(pwm_o_OBUF_inst_i_2_0[24]),
        .I2(pwm_o_OBUF_inst_i_2_0[25]),
        .I3(\reg_cmp_reg[31]_0 [25]),
        .O(pwm_o_OBUF_inst_i_17_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_o_OBUF_inst_i_2
       (.CI(pwm_o_OBUF_inst_i_4_n_0),
        .CO({pwm_o_OBUF_inst_i_2_n_0,pwm_o_OBUF_inst_i_2_n_1,pwm_o_OBUF_inst_i_2_n_2,pwm_o_OBUF_inst_i_2_n_3}),
        .CYINIT(1'b0),
        .DI({pwm_o_OBUF_inst_i_5_n_0,pwm_o_OBUF_inst_i_6_n_0,pwm_o_OBUF_inst_i_7_n_0,pwm_o_OBUF_inst_i_8_n_0}),
        .O(NLW_pwm_o_OBUF_inst_i_2_O_UNCONNECTED[3:0]),
        .S(pwm_o_OBUF_inst_i_1_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_o_OBUF_inst_i_22
       (.CI(pwm_o_OBUF_inst_i_40_n_0),
        .CO({pwm_o_OBUF_inst_i_22_n_0,pwm_o_OBUF_inst_i_22_n_1,pwm_o_OBUF_inst_i_22_n_2,pwm_o_OBUF_inst_i_22_n_3}),
        .CYINIT(1'b0),
        .DI({pwm_o_OBUF_inst_i_41_n_0,pwm_o_OBUF_inst_i_42_n_0,pwm_o_OBUF_inst_i_43_n_0,pwm_o_OBUF_inst_i_44_n_0}),
        .O(NLW_pwm_o_OBUF_inst_i_22_O_UNCONNECTED[3:0]),
        .S(pwm_o_OBUF_inst_i_4_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_23
       (.I0(\reg_cmp_reg[31]_0 [22]),
        .I1(pwm_o_OBUF_inst_i_2_0[22]),
        .I2(pwm_o_OBUF_inst_i_2_0[23]),
        .I3(\reg_cmp_reg[31]_0 [23]),
        .O(pwm_o_OBUF_inst_i_23_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_24
       (.I0(\reg_cmp_reg[31]_0 [20]),
        .I1(pwm_o_OBUF_inst_i_2_0[20]),
        .I2(pwm_o_OBUF_inst_i_2_0[21]),
        .I3(\reg_cmp_reg[31]_0 [21]),
        .O(pwm_o_OBUF_inst_i_24_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_25
       (.I0(\reg_cmp_reg[31]_0 [18]),
        .I1(pwm_o_OBUF_inst_i_2_0[18]),
        .I2(pwm_o_OBUF_inst_i_2_0[19]),
        .I3(\reg_cmp_reg[31]_0 [19]),
        .O(pwm_o_OBUF_inst_i_25_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_26
       (.I0(\reg_cmp_reg[31]_0 [16]),
        .I1(pwm_o_OBUF_inst_i_2_0[16]),
        .I2(pwm_o_OBUF_inst_i_2_0[17]),
        .I3(\reg_cmp_reg[31]_0 [17]),
        .O(pwm_o_OBUF_inst_i_26_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_o_OBUF_inst_i_3
       (.CI(pwm_o_OBUF_inst_i_13_n_0),
        .CO({pwm_o_OBUF_inst_i_3_n_0,pwm_o_OBUF_inst_i_3_n_1,pwm_o_OBUF_inst_i_3_n_2,pwm_o_OBUF_inst_i_3_n_3}),
        .CYINIT(1'b0),
        .DI({pwm_o_OBUF_inst_i_14_n_0,pwm_o_OBUF_inst_i_15_n_0,pwm_o_OBUF_inst_i_16_n_0,pwm_o_OBUF_inst_i_17_n_0}),
        .O(NLW_pwm_o_OBUF_inst_i_3_O_UNCONNECTED[3:0]),
        .S(S));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_o_OBUF_inst_i_31
       (.CI(pwm_o_OBUF_inst_i_49_n_0),
        .CO({pwm_o_OBUF_inst_i_31_n_0,pwm_o_OBUF_inst_i_31_n_1,pwm_o_OBUF_inst_i_31_n_2,pwm_o_OBUF_inst_i_31_n_3}),
        .CYINIT(1'b0),
        .DI({pwm_o_OBUF_inst_i_50_n_0,pwm_o_OBUF_inst_i_51_n_0,pwm_o_OBUF_inst_i_52_n_0,pwm_o_OBUF_inst_i_53_n_0}),
        .O(NLW_pwm_o_OBUF_inst_i_31_O_UNCONNECTED[3:0]),
        .S(pwm_o_OBUF_inst_i_13_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_32
       (.I0(\reg_cmp_reg[31]_0 [22]),
        .I1(pwm_o_OBUF_inst_i_2_0[22]),
        .I2(pwm_o_OBUF_inst_i_2_0[23]),
        .I3(\reg_cmp_reg[31]_0 [23]),
        .O(pwm_o_OBUF_inst_i_32_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_33
       (.I0(\reg_cmp_reg[31]_0 [20]),
        .I1(pwm_o_OBUF_inst_i_2_0[20]),
        .I2(pwm_o_OBUF_inst_i_2_0[21]),
        .I3(\reg_cmp_reg[31]_0 [21]),
        .O(pwm_o_OBUF_inst_i_33_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_34
       (.I0(\reg_cmp_reg[31]_0 [18]),
        .I1(pwm_o_OBUF_inst_i_2_0[18]),
        .I2(pwm_o_OBUF_inst_i_2_0[19]),
        .I3(\reg_cmp_reg[31]_0 [19]),
        .O(pwm_o_OBUF_inst_i_34_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_35
       (.I0(\reg_cmp_reg[31]_0 [16]),
        .I1(pwm_o_OBUF_inst_i_2_0[16]),
        .I2(pwm_o_OBUF_inst_i_2_0[17]),
        .I3(\reg_cmp_reg[31]_0 [17]),
        .O(pwm_o_OBUF_inst_i_35_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_o_OBUF_inst_i_4
       (.CI(pwm_o_OBUF_inst_i_22_n_0),
        .CO({pwm_o_OBUF_inst_i_4_n_0,pwm_o_OBUF_inst_i_4_n_1,pwm_o_OBUF_inst_i_4_n_2,pwm_o_OBUF_inst_i_4_n_3}),
        .CYINIT(1'b0),
        .DI({pwm_o_OBUF_inst_i_23_n_0,pwm_o_OBUF_inst_i_24_n_0,pwm_o_OBUF_inst_i_25_n_0,pwm_o_OBUF_inst_i_26_n_0}),
        .O(NLW_pwm_o_OBUF_inst_i_4_O_UNCONNECTED[3:0]),
        .S(pwm_o_OBUF_inst_i_2_1));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_o_OBUF_inst_i_40
       (.CI(1'b0),
        .CO({pwm_o_OBUF_inst_i_40_n_0,pwm_o_OBUF_inst_i_40_n_1,pwm_o_OBUF_inst_i_40_n_2,pwm_o_OBUF_inst_i_40_n_3}),
        .CYINIT(1'b0),
        .DI({pwm_o_OBUF_inst_i_58_n_0,pwm_o_OBUF_inst_i_59_n_0,pwm_o_OBUF_inst_i_60_n_0,pwm_o_OBUF_inst_i_61_n_0}),
        .O(NLW_pwm_o_OBUF_inst_i_40_O_UNCONNECTED[3:0]),
        .S(pwm_o_OBUF_inst_i_22_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_41
       (.I0(\reg_cmp_reg[31]_0 [14]),
        .I1(pwm_o_OBUF_inst_i_2_0[14]),
        .I2(pwm_o_OBUF_inst_i_2_0[15]),
        .I3(\reg_cmp_reg[31]_0 [15]),
        .O(pwm_o_OBUF_inst_i_41_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_42
       (.I0(\reg_cmp_reg[31]_0 [12]),
        .I1(pwm_o_OBUF_inst_i_2_0[12]),
        .I2(pwm_o_OBUF_inst_i_2_0[13]),
        .I3(\reg_cmp_reg[31]_0 [13]),
        .O(pwm_o_OBUF_inst_i_42_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_43
       (.I0(\reg_cmp_reg[31]_0 [10]),
        .I1(pwm_o_OBUF_inst_i_2_0[10]),
        .I2(pwm_o_OBUF_inst_i_2_0[11]),
        .I3(\reg_cmp_reg[31]_0 [11]),
        .O(pwm_o_OBUF_inst_i_43_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_44
       (.I0(\reg_cmp_reg[31]_0 [8]),
        .I1(pwm_o_OBUF_inst_i_2_0[8]),
        .I2(pwm_o_OBUF_inst_i_2_0[9]),
        .I3(\reg_cmp_reg[31]_0 [9]),
        .O(pwm_o_OBUF_inst_i_44_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_o_OBUF_inst_i_49
       (.CI(1'b0),
        .CO({pwm_o_OBUF_inst_i_49_n_0,pwm_o_OBUF_inst_i_49_n_1,pwm_o_OBUF_inst_i_49_n_2,pwm_o_OBUF_inst_i_49_n_3}),
        .CYINIT(1'b1),
        .DI({pwm_o_OBUF_inst_i_66_n_0,pwm_o_OBUF_inst_i_67_n_0,pwm_o_OBUF_inst_i_68_n_0,pwm_o_OBUF_inst_i_69_n_0}),
        .O(NLW_pwm_o_OBUF_inst_i_49_O_UNCONNECTED[3:0]),
        .S(pwm_o_OBUF_inst_i_31_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_5
       (.I0(\reg_cmp_reg[31]_0 [30]),
        .I1(pwm_o_OBUF_inst_i_2_0[30]),
        .I2(pwm_o_OBUF_inst_i_2_0[31]),
        .I3(\reg_cmp_reg[31]_0 [31]),
        .O(pwm_o_OBUF_inst_i_5_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_50
       (.I0(\reg_cmp_reg[31]_0 [14]),
        .I1(pwm_o_OBUF_inst_i_2_0[14]),
        .I2(pwm_o_OBUF_inst_i_2_0[15]),
        .I3(\reg_cmp_reg[31]_0 [15]),
        .O(pwm_o_OBUF_inst_i_50_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_51
       (.I0(\reg_cmp_reg[31]_0 [12]),
        .I1(pwm_o_OBUF_inst_i_2_0[12]),
        .I2(pwm_o_OBUF_inst_i_2_0[13]),
        .I3(\reg_cmp_reg[31]_0 [13]),
        .O(pwm_o_OBUF_inst_i_51_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_52
       (.I0(\reg_cmp_reg[31]_0 [10]),
        .I1(pwm_o_OBUF_inst_i_2_0[10]),
        .I2(pwm_o_OBUF_inst_i_2_0[11]),
        .I3(\reg_cmp_reg[31]_0 [11]),
        .O(pwm_o_OBUF_inst_i_52_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_53
       (.I0(\reg_cmp_reg[31]_0 [8]),
        .I1(pwm_o_OBUF_inst_i_2_0[8]),
        .I2(pwm_o_OBUF_inst_i_2_0[9]),
        .I3(\reg_cmp_reg[31]_0 [9]),
        .O(pwm_o_OBUF_inst_i_53_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_58
       (.I0(\reg_cmp_reg[31]_0 [6]),
        .I1(pwm_o_OBUF_inst_i_2_0[6]),
        .I2(pwm_o_OBUF_inst_i_2_0[7]),
        .I3(\reg_cmp_reg[31]_0 [7]),
        .O(pwm_o_OBUF_inst_i_58_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_59
       (.I0(\reg_cmp_reg[31]_0 [4]),
        .I1(pwm_o_OBUF_inst_i_2_0[4]),
        .I2(pwm_o_OBUF_inst_i_2_0[5]),
        .I3(\reg_cmp_reg[31]_0 [5]),
        .O(pwm_o_OBUF_inst_i_59_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_6
       (.I0(\reg_cmp_reg[31]_0 [28]),
        .I1(pwm_o_OBUF_inst_i_2_0[28]),
        .I2(pwm_o_OBUF_inst_i_2_0[29]),
        .I3(\reg_cmp_reg[31]_0 [29]),
        .O(pwm_o_OBUF_inst_i_6_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_60
       (.I0(\reg_cmp_reg[31]_0 [2]),
        .I1(pwm_o_OBUF_inst_i_2_0[2]),
        .I2(pwm_o_OBUF_inst_i_2_0[3]),
        .I3(\reg_cmp_reg[31]_0 [3]),
        .O(pwm_o_OBUF_inst_i_60_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_61
       (.I0(\reg_cmp_reg[31]_0 [0]),
        .I1(pwm_o_OBUF_inst_i_2_0[0]),
        .I2(pwm_o_OBUF_inst_i_2_0[1]),
        .I3(\reg_cmp_reg[31]_0 [1]),
        .O(pwm_o_OBUF_inst_i_61_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_66
       (.I0(\reg_cmp_reg[31]_0 [6]),
        .I1(pwm_o_OBUF_inst_i_2_0[6]),
        .I2(pwm_o_OBUF_inst_i_2_0[7]),
        .I3(\reg_cmp_reg[31]_0 [7]),
        .O(pwm_o_OBUF_inst_i_66_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_67
       (.I0(\reg_cmp_reg[31]_0 [4]),
        .I1(pwm_o_OBUF_inst_i_2_0[4]),
        .I2(pwm_o_OBUF_inst_i_2_0[5]),
        .I3(\reg_cmp_reg[31]_0 [5]),
        .O(pwm_o_OBUF_inst_i_67_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_68
       (.I0(\reg_cmp_reg[31]_0 [2]),
        .I1(pwm_o_OBUF_inst_i_2_0[2]),
        .I2(pwm_o_OBUF_inst_i_2_0[3]),
        .I3(\reg_cmp_reg[31]_0 [3]),
        .O(pwm_o_OBUF_inst_i_68_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_69
       (.I0(\reg_cmp_reg[31]_0 [0]),
        .I1(pwm_o_OBUF_inst_i_2_0[0]),
        .I2(pwm_o_OBUF_inst_i_2_0[1]),
        .I3(\reg_cmp_reg[31]_0 [1]),
        .O(pwm_o_OBUF_inst_i_69_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_7
       (.I0(\reg_cmp_reg[31]_0 [26]),
        .I1(pwm_o_OBUF_inst_i_2_0[26]),
        .I2(pwm_o_OBUF_inst_i_2_0[27]),
        .I3(\reg_cmp_reg[31]_0 [27]),
        .O(pwm_o_OBUF_inst_i_7_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_o_OBUF_inst_i_8
       (.I0(\reg_cmp_reg[31]_0 [24]),
        .I1(pwm_o_OBUF_inst_i_2_0[24]),
        .I2(pwm_o_OBUF_inst_i_2_0[25]),
        .I3(\reg_cmp_reg[31]_0 [25]),
        .O(pwm_o_OBUF_inst_i_8_n_0));
  FDCE \reg_cap_reg[0] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [0]),
        .Q(reg_cap[0]));
  FDCE \reg_cap_reg[10] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [10]),
        .Q(reg_cap[10]));
  FDCE \reg_cap_reg[11] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [11]),
        .Q(reg_cap[11]));
  FDCE \reg_cap_reg[12] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [12]),
        .Q(reg_cap[12]));
  FDCE \reg_cap_reg[13] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [13]),
        .Q(reg_cap[13]));
  FDCE \reg_cap_reg[14] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [14]),
        .Q(reg_cap[14]));
  FDCE \reg_cap_reg[15] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [15]),
        .Q(reg_cap[15]));
  FDCE \reg_cap_reg[16] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [16]),
        .Q(reg_cap[16]));
  FDCE \reg_cap_reg[17] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [17]),
        .Q(reg_cap[17]));
  FDCE \reg_cap_reg[18] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [18]),
        .Q(reg_cap[18]));
  FDCE \reg_cap_reg[19] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [19]),
        .Q(reg_cap[19]));
  FDCE \reg_cap_reg[1] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [1]),
        .Q(reg_cap[1]));
  FDCE \reg_cap_reg[20] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [20]),
        .Q(reg_cap[20]));
  FDCE \reg_cap_reg[21] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [21]),
        .Q(reg_cap[21]));
  FDCE \reg_cap_reg[22] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [22]),
        .Q(reg_cap[22]));
  FDCE \reg_cap_reg[23] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [23]),
        .Q(reg_cap[23]));
  FDCE \reg_cap_reg[24] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [24]),
        .Q(reg_cap[24]));
  FDCE \reg_cap_reg[25] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [25]),
        .Q(reg_cap[25]));
  FDCE \reg_cap_reg[26] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [26]),
        .Q(reg_cap[26]));
  FDCE \reg_cap_reg[27] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [27]),
        .Q(reg_cap[27]));
  FDCE \reg_cap_reg[28] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [28]),
        .Q(reg_cap[28]));
  FDCE \reg_cap_reg[29] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [29]),
        .Q(reg_cap[29]));
  FDCE \reg_cap_reg[2] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [2]),
        .Q(reg_cap[2]));
  FDCE \reg_cap_reg[30] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [30]),
        .Q(reg_cap[30]));
  FDCE \reg_cap_reg[31] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [31]),
        .Q(reg_cap[31]));
  FDCE \reg_cap_reg[3] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [3]),
        .Q(reg_cap[3]));
  FDCE \reg_cap_reg[4] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [4]),
        .Q(reg_cap[4]));
  FDCE \reg_cap_reg[5] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [5]),
        .Q(reg_cap[5]));
  FDCE \reg_cap_reg[6] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [6]),
        .Q(reg_cap[6]));
  FDCE \reg_cap_reg[7] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [7]),
        .Q(reg_cap[7]));
  FDCE \reg_cap_reg[8] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [8]),
        .Q(reg_cap[8]));
  FDCE \reg_cap_reg[9] 
       (.C(CLK),
        .CE(\reg_cap_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_cap_reg[31]_1 [9]),
        .Q(reg_cap[9]));
  FDCE \reg_cmp_reg[0] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[0]),
        .Q(\reg_cmp_reg[31]_0 [0]));
  FDCE \reg_cmp_reg[10] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[10]),
        .Q(\reg_cmp_reg[31]_0 [10]));
  FDCE \reg_cmp_reg[11] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[11]),
        .Q(\reg_cmp_reg[31]_0 [11]));
  FDCE \reg_cmp_reg[12] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[12]),
        .Q(\reg_cmp_reg[31]_0 [12]));
  FDCE \reg_cmp_reg[13] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[13]),
        .Q(\reg_cmp_reg[31]_0 [13]));
  FDCE \reg_cmp_reg[14] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[14]),
        .Q(\reg_cmp_reg[31]_0 [14]));
  FDCE \reg_cmp_reg[15] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[15]),
        .Q(\reg_cmp_reg[31]_0 [15]));
  FDCE \reg_cmp_reg[16] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[16]),
        .Q(\reg_cmp_reg[31]_0 [16]));
  FDCE \reg_cmp_reg[17] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[17]),
        .Q(\reg_cmp_reg[31]_0 [17]));
  FDCE \reg_cmp_reg[18] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[18]),
        .Q(\reg_cmp_reg[31]_0 [18]));
  FDCE \reg_cmp_reg[19] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[19]),
        .Q(\reg_cmp_reg[31]_0 [19]));
  FDCE \reg_cmp_reg[1] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[1]),
        .Q(\reg_cmp_reg[31]_0 [1]));
  FDCE \reg_cmp_reg[20] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[20]),
        .Q(\reg_cmp_reg[31]_0 [20]));
  FDCE \reg_cmp_reg[21] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[21]),
        .Q(\reg_cmp_reg[31]_0 [21]));
  FDCE \reg_cmp_reg[22] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[22]),
        .Q(\reg_cmp_reg[31]_0 [22]));
  FDCE \reg_cmp_reg[23] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[23]),
        .Q(\reg_cmp_reg[31]_0 [23]));
  FDCE \reg_cmp_reg[24] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[24]),
        .Q(\reg_cmp_reg[31]_0 [24]));
  FDCE \reg_cmp_reg[25] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[25]),
        .Q(\reg_cmp_reg[31]_0 [25]));
  FDCE \reg_cmp_reg[26] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[26]),
        .Q(\reg_cmp_reg[31]_0 [26]));
  FDCE \reg_cmp_reg[27] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[27]),
        .Q(\reg_cmp_reg[31]_0 [27]));
  FDCE \reg_cmp_reg[28] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[28]),
        .Q(\reg_cmp_reg[31]_0 [28]));
  FDCE \reg_cmp_reg[29] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[29]),
        .Q(\reg_cmp_reg[31]_0 [29]));
  FDCE \reg_cmp_reg[2] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[2]),
        .Q(\reg_cmp_reg[31]_0 [2]));
  FDCE \reg_cmp_reg[30] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[30]),
        .Q(\reg_cmp_reg[31]_0 [30]));
  FDCE \reg_cmp_reg[31] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[31]),
        .Q(\reg_cmp_reg[31]_0 [31]));
  FDCE \reg_cmp_reg[3] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[3]),
        .Q(\reg_cmp_reg[31]_0 [3]));
  FDCE \reg_cmp_reg[4] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[4]),
        .Q(\reg_cmp_reg[31]_0 [4]));
  FDCE \reg_cmp_reg[5] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[5]),
        .Q(\reg_cmp_reg[31]_0 [5]));
  FDCE \reg_cmp_reg[6] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[6]),
        .Q(\reg_cmp_reg[31]_0 [6]));
  FDCE \reg_cmp_reg[7] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[7]),
        .Q(\reg_cmp_reg[31]_0 [7]));
  FDCE \reg_cmp_reg[8] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[8]),
        .Q(\reg_cmp_reg[31]_0 [8]));
  FDCE \reg_cmp_reg[9] 
       (.C(CLK),
        .CE(\reg_cmp_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[9]),
        .Q(\reg_cmp_reg[31]_0 [9]));
  FDCE \reg_ctrl_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[0]),
        .Q(\reg_ctrl_reg[6]_0 [0]));
  FDCE \reg_ctrl_reg[10] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[10]),
        .Q(\reg_ctrl_reg_n_0_[10] ));
  FDCE \reg_ctrl_reg[11] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[11]),
        .Q(\reg_ctrl_reg_n_0_[11] ));
  FDCE \reg_ctrl_reg[12] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[12]),
        .Q(\reg_ctrl_reg_n_0_[12] ));
  FDCE \reg_ctrl_reg[13] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[13]),
        .Q(\reg_ctrl_reg_n_0_[13] ));
  FDCE \reg_ctrl_reg[14] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[14]),
        .Q(\reg_ctrl_reg_n_0_[14] ));
  FDCE \reg_ctrl_reg[15] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[15]),
        .Q(\reg_ctrl_reg_n_0_[15] ));
  FDCE \reg_ctrl_reg[16] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[16]),
        .Q(\reg_ctrl_reg_n_0_[16] ));
  FDCE \reg_ctrl_reg[17] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[17]),
        .Q(\reg_ctrl_reg_n_0_[17] ));
  FDCE \reg_ctrl_reg[18] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[18]),
        .Q(\reg_ctrl_reg_n_0_[18] ));
  FDCE \reg_ctrl_reg[19] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[19]),
        .Q(\reg_ctrl_reg_n_0_[19] ));
  FDCE \reg_ctrl_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[1]),
        .Q(\reg_ctrl_reg[6]_0 [1]));
  FDCE \reg_ctrl_reg[20] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[20]),
        .Q(\reg_ctrl_reg_n_0_[20] ));
  FDCE \reg_ctrl_reg[21] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[21]),
        .Q(\reg_ctrl_reg_n_0_[21] ));
  FDCE \reg_ctrl_reg[22] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[22]),
        .Q(\reg_ctrl_reg_n_0_[22] ));
  FDCE \reg_ctrl_reg[23] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[23]),
        .Q(\reg_ctrl_reg_n_0_[23] ));
  FDCE \reg_ctrl_reg[24] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[24]),
        .Q(\reg_ctrl_reg_n_0_[24] ));
  FDCE \reg_ctrl_reg[25] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[25]),
        .Q(\reg_ctrl_reg_n_0_[25] ));
  FDCE \reg_ctrl_reg[26] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[26]),
        .Q(\reg_ctrl_reg_n_0_[26] ));
  FDCE \reg_ctrl_reg[27] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[27]),
        .Q(\reg_ctrl_reg_n_0_[27] ));
  FDCE \reg_ctrl_reg[28] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[28]),
        .Q(\reg_ctrl_reg_n_0_[28] ));
  FDCE \reg_ctrl_reg[29] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[29]),
        .Q(\reg_ctrl_reg_n_0_[29] ));
  FDCE \reg_ctrl_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[2]),
        .Q(sel00));
  FDCE \reg_ctrl_reg[30] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[30]),
        .Q(\reg_ctrl_reg_n_0_[30] ));
  FDCE \reg_ctrl_reg[31] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[31]),
        .Q(\reg_ctrl_reg_n_0_[31] ));
  FDCE \reg_ctrl_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[3]),
        .Q(\reg_ctrl_reg[6]_0 [2]));
  FDCE \reg_ctrl_reg[4] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[4]),
        .Q(pwm_en));
  FDCE \reg_ctrl_reg[5] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[5]),
        .Q(\reg_ctrl_reg[6]_0 [3]));
  FDCE \reg_ctrl_reg[6] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[6]),
        .Q(\reg_ctrl_reg[6]_0 [4]));
  FDCE \reg_ctrl_reg[7] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[7]),
        .Q(\reg_ctrl_reg_n_0_[7] ));
  FDCE \reg_ctrl_reg[8] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[8]),
        .Q(\reg_ctrl_reg_n_0_[8] ));
  FDCE \reg_ctrl_reg[9] 
       (.C(CLK),
        .CE(E),
        .CLR(wb_rst_i_IBUF),
        .D(D[9]),
        .Q(\reg_ctrl_reg_n_0_[9] ));
  FDCE \reg_int_en_reg[0] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[0]),
        .Q(\reg_int_en_reg_n_0_[0] ));
  FDCE \reg_int_en_reg[10] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[10]),
        .Q(\reg_int_en_reg_n_0_[10] ));
  FDCE \reg_int_en_reg[11] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[11]),
        .Q(\reg_int_en_reg_n_0_[11] ));
  FDCE \reg_int_en_reg[12] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[12]),
        .Q(\reg_int_en_reg_n_0_[12] ));
  FDCE \reg_int_en_reg[13] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[13]),
        .Q(\reg_int_en_reg_n_0_[13] ));
  FDCE \reg_int_en_reg[14] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[14]),
        .Q(\reg_int_en_reg_n_0_[14] ));
  FDCE \reg_int_en_reg[15] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[15]),
        .Q(\reg_int_en_reg_n_0_[15] ));
  FDCE \reg_int_en_reg[16] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[16]),
        .Q(\reg_int_en_reg_n_0_[16] ));
  FDCE \reg_int_en_reg[17] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[17]),
        .Q(\reg_int_en_reg_n_0_[17] ));
  FDCE \reg_int_en_reg[18] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[18]),
        .Q(\reg_int_en_reg_n_0_[18] ));
  FDCE \reg_int_en_reg[19] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[19]),
        .Q(\reg_int_en_reg_n_0_[19] ));
  FDCE \reg_int_en_reg[1] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[1]),
        .Q(\reg_int_en_reg_n_0_[1] ));
  FDCE \reg_int_en_reg[20] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[20]),
        .Q(\reg_int_en_reg_n_0_[20] ));
  FDCE \reg_int_en_reg[21] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[21]),
        .Q(\reg_int_en_reg_n_0_[21] ));
  FDCE \reg_int_en_reg[22] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[22]),
        .Q(\reg_int_en_reg_n_0_[22] ));
  FDCE \reg_int_en_reg[23] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[23]),
        .Q(\reg_int_en_reg_n_0_[23] ));
  FDCE \reg_int_en_reg[24] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[24]),
        .Q(\reg_int_en_reg_n_0_[24] ));
  FDCE \reg_int_en_reg[25] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[25]),
        .Q(\reg_int_en_reg_n_0_[25] ));
  FDCE \reg_int_en_reg[26] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[26]),
        .Q(\reg_int_en_reg_n_0_[26] ));
  FDCE \reg_int_en_reg[27] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[27]),
        .Q(\reg_int_en_reg_n_0_[27] ));
  FDCE \reg_int_en_reg[28] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[28]),
        .Q(\reg_int_en_reg_n_0_[28] ));
  FDCE \reg_int_en_reg[29] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[29]),
        .Q(\reg_int_en_reg_n_0_[29] ));
  FDCE \reg_int_en_reg[2] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[2]),
        .Q(\reg_int_en_reg_n_0_[2] ));
  FDCE \reg_int_en_reg[30] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[30]),
        .Q(\reg_int_en_reg_n_0_[30] ));
  FDCE \reg_int_en_reg[31] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[31]),
        .Q(\reg_int_en_reg_n_0_[31] ));
  FDCE \reg_int_en_reg[3] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[3]),
        .Q(\reg_int_en_reg_n_0_[3] ));
  FDCE \reg_int_en_reg[4] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[4]),
        .Q(\reg_int_en_reg_n_0_[4] ));
  FDCE \reg_int_en_reg[5] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[5]),
        .Q(\reg_int_en_reg_n_0_[5] ));
  FDCE \reg_int_en_reg[6] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[6]),
        .Q(\reg_int_en_reg_n_0_[6] ));
  FDCE \reg_int_en_reg[7] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[7]),
        .Q(\reg_int_en_reg_n_0_[7] ));
  FDCE \reg_int_en_reg[8] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[8]),
        .Q(\reg_int_en_reg_n_0_[8] ));
  FDCE \reg_int_en_reg[9] 
       (.C(CLK),
        .CE(\reg_int_en_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[9]),
        .Q(\reg_int_en_reg_n_0_[9] ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \reg_int_sts[0]_i_1 
       (.I0(trigger_o_OBUF),
        .I1(\reg_int_sts_reg[1]_0 ),
        .I2(\reg_int_sts_reg[0]_0 ),
        .I3(reg_int_sts2_out[0]),
        .I4(reg_int_sts[0]),
        .O(\reg_int_sts[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \reg_int_sts[1]_i_1 
       (.I0(capture_stb),
        .I1(\reg_int_sts_reg[1]_0 ),
        .I2(\reg_int_sts_reg[1]_1 ),
        .I3(reg_int_sts2_out[1]),
        .I4(reg_int_sts[1]),
        .O(\reg_int_sts[1]_i_1_n_0 ));
  FDCE \reg_int_sts_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_int_sts[0]_i_1_n_0 ),
        .Q(reg_int_sts[0]));
  FDCE \reg_int_sts_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(wb_rst_i_IBUF),
        .D(\reg_int_sts[1]_i_1_n_0 ),
        .Q(reg_int_sts[1]));
  LUT2 #(
    .INIT(4'hE)) 
    \reg_load[31]_i_2 
       (.I0(wb_adr_i_IBUF[1]),
        .I1(wb_adr_i_IBUF[0]),
        .O(\wb_adr_i[1] ));
  FDCE \reg_load_reg[0] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[0]),
        .Q(\reg_load_reg[31]_0 [0]));
  FDCE \reg_load_reg[10] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[10]),
        .Q(\reg_load_reg[31]_0 [10]));
  FDCE \reg_load_reg[11] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[11]),
        .Q(\reg_load_reg[31]_0 [11]));
  FDCE \reg_load_reg[12] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[12]),
        .Q(\reg_load_reg[31]_0 [12]));
  FDCE \reg_load_reg[13] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[13]),
        .Q(\reg_load_reg[31]_0 [13]));
  FDCE \reg_load_reg[14] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[14]),
        .Q(\reg_load_reg[31]_0 [14]));
  FDCE \reg_load_reg[15] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[15]),
        .Q(\reg_load_reg[31]_0 [15]));
  FDCE \reg_load_reg[16] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[16]),
        .Q(\reg_load_reg[31]_0 [16]));
  FDCE \reg_load_reg[17] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[17]),
        .Q(\reg_load_reg[31]_0 [17]));
  FDCE \reg_load_reg[18] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[18]),
        .Q(\reg_load_reg[31]_0 [18]));
  FDCE \reg_load_reg[19] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[19]),
        .Q(\reg_load_reg[31]_0 [19]));
  FDCE \reg_load_reg[1] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[1]),
        .Q(\reg_load_reg[31]_0 [1]));
  FDCE \reg_load_reg[20] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[20]),
        .Q(\reg_load_reg[31]_0 [20]));
  FDCE \reg_load_reg[21] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[21]),
        .Q(\reg_load_reg[31]_0 [21]));
  FDCE \reg_load_reg[22] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[22]),
        .Q(\reg_load_reg[31]_0 [22]));
  FDCE \reg_load_reg[23] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[23]),
        .Q(\reg_load_reg[31]_0 [23]));
  FDCE \reg_load_reg[24] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[24]),
        .Q(\reg_load_reg[31]_0 [24]));
  FDCE \reg_load_reg[25] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[25]),
        .Q(\reg_load_reg[31]_0 [25]));
  FDCE \reg_load_reg[26] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[26]),
        .Q(\reg_load_reg[31]_0 [26]));
  FDCE \reg_load_reg[27] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[27]),
        .Q(\reg_load_reg[31]_0 [27]));
  FDCE \reg_load_reg[28] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[28]),
        .Q(\reg_load_reg[31]_0 [28]));
  FDCE \reg_load_reg[29] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[29]),
        .Q(\reg_load_reg[31]_0 [29]));
  FDCE \reg_load_reg[2] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[2]),
        .Q(\reg_load_reg[31]_0 [2]));
  FDCE \reg_load_reg[30] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[30]),
        .Q(\reg_load_reg[31]_0 [30]));
  FDCE \reg_load_reg[31] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[31]),
        .Q(\reg_load_reg[31]_0 [31]));
  FDCE \reg_load_reg[3] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[3]),
        .Q(\reg_load_reg[31]_0 [3]));
  FDCE \reg_load_reg[4] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[4]),
        .Q(\reg_load_reg[31]_0 [4]));
  FDCE \reg_load_reg[5] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[5]),
        .Q(\reg_load_reg[31]_0 [5]));
  FDCE \reg_load_reg[6] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[6]),
        .Q(\reg_load_reg[31]_0 [6]));
  FDCE \reg_load_reg[7] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[7]),
        .Q(\reg_load_reg[31]_0 [7]));
  FDCE \reg_load_reg[8] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[8]),
        .Q(\reg_load_reg[31]_0 [8]));
  FDCE \reg_load_reg[9] 
       (.C(CLK),
        .CE(\reg_load_reg[31]_1 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[9]),
        .Q(\reg_load_reg[31]_0 [9]));
  FDCE \reg_pre_reg[0] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[0]),
        .Q(reg_pre[0]));
  FDCE \reg_pre_reg[10] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[10]),
        .Q(reg_pre[10]));
  FDCE \reg_pre_reg[11] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[11]),
        .Q(reg_pre[11]));
  FDCE \reg_pre_reg[12] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[12]),
        .Q(reg_pre[12]));
  FDCE \reg_pre_reg[13] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[13]),
        .Q(reg_pre[13]));
  FDCE \reg_pre_reg[14] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[14]),
        .Q(reg_pre[14]));
  FDCE \reg_pre_reg[15] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[15]),
        .Q(reg_pre[15]));
  FDCE \reg_pre_reg[16] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[16]),
        .Q(reg_pre[16]));
  FDCE \reg_pre_reg[17] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[17]),
        .Q(reg_pre[17]));
  FDCE \reg_pre_reg[18] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[18]),
        .Q(reg_pre[18]));
  FDCE \reg_pre_reg[19] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[19]),
        .Q(reg_pre[19]));
  FDCE \reg_pre_reg[1] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[1]),
        .Q(reg_pre[1]));
  FDCE \reg_pre_reg[20] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[20]),
        .Q(reg_pre[20]));
  FDCE \reg_pre_reg[21] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[21]),
        .Q(reg_pre[21]));
  FDCE \reg_pre_reg[22] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[22]),
        .Q(reg_pre[22]));
  FDCE \reg_pre_reg[23] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[23]),
        .Q(reg_pre[23]));
  FDCE \reg_pre_reg[24] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[24]),
        .Q(reg_pre[24]));
  FDCE \reg_pre_reg[25] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[25]),
        .Q(reg_pre[25]));
  FDCE \reg_pre_reg[26] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[26]),
        .Q(reg_pre[26]));
  FDCE \reg_pre_reg[27] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[27]),
        .Q(reg_pre[27]));
  FDCE \reg_pre_reg[28] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[28]),
        .Q(reg_pre[28]));
  FDCE \reg_pre_reg[29] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[29]),
        .Q(reg_pre[29]));
  FDCE \reg_pre_reg[2] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[2]),
        .Q(reg_pre[2]));
  FDCE \reg_pre_reg[30] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[30]),
        .Q(reg_pre[30]));
  FDCE \reg_pre_reg[31] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[31]),
        .Q(reg_pre[31]));
  FDCE \reg_pre_reg[3] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[3]),
        .Q(reg_pre[3]));
  FDCE \reg_pre_reg[4] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[4]),
        .Q(reg_pre[4]));
  FDCE \reg_pre_reg[5] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[5]),
        .Q(reg_pre[5]));
  FDCE \reg_pre_reg[6] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[6]),
        .Q(reg_pre[6]));
  FDCE \reg_pre_reg[7] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[7]),
        .Q(reg_pre[7]));
  FDCE \reg_pre_reg[8] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[8]),
        .Q(reg_pre[8]));
  FDCE \reg_pre_reg[9] 
       (.C(CLK),
        .CE(\reg_pre_reg[31]_0 ),
        .CLR(wb_rst_i_IBUF),
        .D(D[9]),
        .Q(reg_pre[9]));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[0]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[0]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[0]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[0]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[0]_inst_i_2 
       (.I0(reg_int_sts[0]),
        .I1(reg_cap[0]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_int_en_reg_n_0_[0] ),
        .I5(\reg_cmp_reg[31]_0 [0]),
        .O(\wb_dat_o_OBUF[0]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[0]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [0]),
        .I1(reg_pre[0]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg[6]_0 [0]),
        .I5(pwm_o_OBUF_inst_i_2_0[0]),
        .O(\wb_dat_o_OBUF[0]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[10]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[10]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[10]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[10]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[10]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[10] ),
        .I1(\reg_cmp_reg[31]_0 [10]),
        .I2(reg_cap[10]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[10]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[10]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [10]),
        .I1(reg_pre[10]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[10] ),
        .I5(pwm_o_OBUF_inst_i_2_0[10]),
        .O(\wb_dat_o_OBUF[10]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[11]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[11]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[11]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[11]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[11]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[11] ),
        .I1(\reg_cmp_reg[31]_0 [11]),
        .I2(reg_cap[11]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[11]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[11]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [11]),
        .I1(reg_pre[11]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[11] ),
        .I5(pwm_o_OBUF_inst_i_2_0[11]),
        .O(\wb_dat_o_OBUF[11]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[12]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[12]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[12]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[12]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[12]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[12] ),
        .I1(\reg_cmp_reg[31]_0 [12]),
        .I2(reg_cap[12]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[12]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[12]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [12]),
        .I1(reg_pre[12]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[12] ),
        .I5(pwm_o_OBUF_inst_i_2_0[12]),
        .O(\wb_dat_o_OBUF[12]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[13]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[13]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[13]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[13]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[13]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[13] ),
        .I1(\reg_cmp_reg[31]_0 [13]),
        .I2(reg_cap[13]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[13]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[13]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [13]),
        .I1(reg_pre[13]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[13] ),
        .I5(pwm_o_OBUF_inst_i_2_0[13]),
        .O(\wb_dat_o_OBUF[13]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[14]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[14]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[14]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[14]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[14]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[14] ),
        .I1(\reg_cmp_reg[31]_0 [14]),
        .I2(reg_cap[14]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[14]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[14]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [14]),
        .I1(reg_pre[14]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[14] ),
        .I5(pwm_o_OBUF_inst_i_2_0[14]),
        .O(\wb_dat_o_OBUF[14]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[15]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[15]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[15]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[15]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[15]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[15] ),
        .I1(\reg_cmp_reg[31]_0 [15]),
        .I2(reg_cap[15]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[15]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[15]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [15]),
        .I1(reg_pre[15]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[15] ),
        .I5(pwm_o_OBUF_inst_i_2_0[15]),
        .O(\wb_dat_o_OBUF[15]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[16]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[16]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[16]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[16]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[16]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[16] ),
        .I1(\reg_cmp_reg[31]_0 [16]),
        .I2(reg_cap[16]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[16]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[16]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [16]),
        .I1(reg_pre[16]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[16] ),
        .I5(pwm_o_OBUF_inst_i_2_0[16]),
        .O(\wb_dat_o_OBUF[16]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[17]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[17]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[17]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[17]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[17]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[17] ),
        .I1(\reg_cmp_reg[31]_0 [17]),
        .I2(reg_cap[17]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[17]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[17]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [17]),
        .I1(reg_pre[17]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[17] ),
        .I5(pwm_o_OBUF_inst_i_2_0[17]),
        .O(\wb_dat_o_OBUF[17]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[18]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[18]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[18]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[18]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[18]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[18] ),
        .I1(\reg_cmp_reg[31]_0 [18]),
        .I2(reg_cap[18]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[18]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[18]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [18]),
        .I1(reg_pre[18]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[18] ),
        .I5(pwm_o_OBUF_inst_i_2_0[18]),
        .O(\wb_dat_o_OBUF[18]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[19]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[19]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[19]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[19]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[19]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[19] ),
        .I1(\reg_cmp_reg[31]_0 [19]),
        .I2(reg_cap[19]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[19]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[19]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [19]),
        .I1(reg_pre[19]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[19] ),
        .I5(pwm_o_OBUF_inst_i_2_0[19]),
        .O(\wb_dat_o_OBUF[19]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[1]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[1]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[1]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[1]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[1]_inst_i_2 
       (.I0(reg_int_sts[1]),
        .I1(reg_cap[1]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_int_en_reg_n_0_[1] ),
        .I5(\reg_cmp_reg[31]_0 [1]),
        .O(\wb_dat_o_OBUF[1]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[1]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [1]),
        .I1(reg_pre[1]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg[6]_0 [1]),
        .I5(pwm_o_OBUF_inst_i_2_0[1]),
        .O(\wb_dat_o_OBUF[1]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[20]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[20]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[20]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[20]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[20]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[20] ),
        .I1(\reg_cmp_reg[31]_0 [20]),
        .I2(reg_cap[20]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[20]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[20]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [20]),
        .I1(reg_pre[20]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[20] ),
        .I5(pwm_o_OBUF_inst_i_2_0[20]),
        .O(\wb_dat_o_OBUF[20]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[21]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[21]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[21]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[21]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[21]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[21] ),
        .I1(\reg_cmp_reg[31]_0 [21]),
        .I2(reg_cap[21]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[21]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[21]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [21]),
        .I1(reg_pre[21]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[21] ),
        .I5(pwm_o_OBUF_inst_i_2_0[21]),
        .O(\wb_dat_o_OBUF[21]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[22]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[22]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[22]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[22]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[22]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[22] ),
        .I1(\reg_cmp_reg[31]_0 [22]),
        .I2(reg_cap[22]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[22]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[22]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [22]),
        .I1(reg_pre[22]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[22] ),
        .I5(pwm_o_OBUF_inst_i_2_0[22]),
        .O(\wb_dat_o_OBUF[22]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[23]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[23]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[23]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[23]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[23]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[23] ),
        .I1(\reg_cmp_reg[31]_0 [23]),
        .I2(reg_cap[23]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[23]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[23]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [23]),
        .I1(reg_pre[23]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[23] ),
        .I5(pwm_o_OBUF_inst_i_2_0[23]),
        .O(\wb_dat_o_OBUF[23]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[24]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[24]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[24]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[24]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[24]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[24] ),
        .I1(\reg_cmp_reg[31]_0 [24]),
        .I2(reg_cap[24]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[24]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[24]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [24]),
        .I1(reg_pre[24]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[24] ),
        .I5(pwm_o_OBUF_inst_i_2_0[24]),
        .O(\wb_dat_o_OBUF[24]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[25]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[25]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[25]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[25]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[25]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[25] ),
        .I1(\reg_cmp_reg[31]_0 [25]),
        .I2(reg_cap[25]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[25]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[25]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [25]),
        .I1(reg_pre[25]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[25] ),
        .I5(pwm_o_OBUF_inst_i_2_0[25]),
        .O(\wb_dat_o_OBUF[25]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[26]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[26]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[26]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[26]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[26]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[26] ),
        .I1(\reg_cmp_reg[31]_0 [26]),
        .I2(reg_cap[26]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[26]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[26]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [26]),
        .I1(reg_pre[26]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[26] ),
        .I5(pwm_o_OBUF_inst_i_2_0[26]),
        .O(\wb_dat_o_OBUF[26]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[27]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[27]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[27]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[27]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[27]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[27] ),
        .I1(\reg_cmp_reg[31]_0 [27]),
        .I2(reg_cap[27]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[27]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[27]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [27]),
        .I1(reg_pre[27]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[27] ),
        .I5(pwm_o_OBUF_inst_i_2_0[27]),
        .O(\wb_dat_o_OBUF[27]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[28]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[28]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[28]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[28]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[28]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[28] ),
        .I1(\reg_cmp_reg[31]_0 [28]),
        .I2(reg_cap[28]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[28]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[28]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [28]),
        .I1(reg_pre[28]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[28] ),
        .I5(pwm_o_OBUF_inst_i_2_0[28]),
        .O(\wb_dat_o_OBUF[28]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[29]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[29]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[29]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[29]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[29]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[29] ),
        .I1(\reg_cmp_reg[31]_0 [29]),
        .I2(reg_cap[29]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[29]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[29]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [29]),
        .I1(reg_pre[29]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[29] ),
        .I5(pwm_o_OBUF_inst_i_2_0[29]),
        .O(\wb_dat_o_OBUF[29]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[2]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[2]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[2]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[2]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[2]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[2] ),
        .I1(\reg_cmp_reg[31]_0 [2]),
        .I2(reg_cap[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[2]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[2]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [2]),
        .I1(reg_pre[2]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(sel00),
        .I5(pwm_o_OBUF_inst_i_2_0[2]),
        .O(\wb_dat_o_OBUF[2]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[30]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[30]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[30]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[30]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[30]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[30] ),
        .I1(\reg_cmp_reg[31]_0 [30]),
        .I2(reg_cap[30]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[30]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[30]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [30]),
        .I1(reg_pre[30]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[30] ),
        .I5(pwm_o_OBUF_inst_i_2_0[30]),
        .O(\wb_dat_o_OBUF[30]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[31]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[31]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[31]_inst_i_4_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[31]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[31]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[31] ),
        .I1(\reg_cmp_reg[31]_0 [31]),
        .I2(reg_cap[31]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[31]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[31]_inst_i_4 
       (.I0(\reg_load_reg[31]_0 [31]),
        .I1(reg_pre[31]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[31] ),
        .I5(pwm_o_OBUF_inst_i_2_0[31]),
        .O(\wb_dat_o_OBUF[31]_inst_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[3]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[3]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[3]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[3]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[3]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[3] ),
        .I1(\reg_cmp_reg[31]_0 [3]),
        .I2(reg_cap[3]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[3]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[3]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [3]),
        .I1(reg_pre[3]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg[6]_0 [2]),
        .I5(pwm_o_OBUF_inst_i_2_0[3]),
        .O(\wb_dat_o_OBUF[3]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[4]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[4]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[4]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[4]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[4]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[4] ),
        .I1(\reg_cmp_reg[31]_0 [4]),
        .I2(reg_cap[4]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[4]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[4]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [4]),
        .I1(reg_pre[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(pwm_en),
        .I5(pwm_o_OBUF_inst_i_2_0[4]),
        .O(\wb_dat_o_OBUF[4]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[5]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[5]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[5]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[5]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[5]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[5] ),
        .I1(\reg_cmp_reg[31]_0 [5]),
        .I2(reg_cap[5]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[5]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[5]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [5]),
        .I1(reg_pre[5]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg[6]_0 [3]),
        .I5(pwm_o_OBUF_inst_i_2_0[5]),
        .O(\wb_dat_o_OBUF[5]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[6]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[6]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[6]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[6]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[6]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[6] ),
        .I1(\reg_cmp_reg[31]_0 [6]),
        .I2(reg_cap[6]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[6]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[6]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [6]),
        .I1(reg_pre[6]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg[6]_0 [4]),
        .I5(pwm_o_OBUF_inst_i_2_0[6]),
        .O(\wb_dat_o_OBUF[6]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[7]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[7]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[7]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[7]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[7]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[7] ),
        .I1(\reg_cmp_reg[31]_0 [7]),
        .I2(reg_cap[7]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[7]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[7]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [7]),
        .I1(reg_pre[7]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[7] ),
        .I5(pwm_o_OBUF_inst_i_2_0[7]),
        .O(\wb_dat_o_OBUF[7]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[8]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[8]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[8]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[8]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[8]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[8] ),
        .I1(\reg_cmp_reg[31]_0 [8]),
        .I2(reg_cap[8]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[8]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[8]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [8]),
        .I1(reg_pre[8]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[8] ),
        .I5(pwm_o_OBUF_inst_i_2_0[8]),
        .O(\wb_dat_o_OBUF[8]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \wb_dat_o_OBUF[9]_inst_i_1 
       (.I0(\wb_dat_o_OBUF[9]_inst_i_2_n_0 ),
        .I1(\wb_dat_o[0] ),
        .I2(\wb_dat_o_OBUF[9]_inst_i_3_n_0 ),
        .I3(\wb_dat_o[0]_0 ),
        .O(wb_dat_o_OBUF[9]));
  LUT5 #(
    .INIT(32'hF000CCAA)) 
    \wb_dat_o_OBUF[9]_inst_i_2 
       (.I0(\reg_int_en_reg_n_0_[9] ),
        .I1(\reg_cmp_reg[31]_0 [9]),
        .I2(reg_cap[9]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .O(\wb_dat_o_OBUF[9]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \wb_dat_o_OBUF[9]_inst_i_3 
       (.I0(\reg_load_reg[31]_0 [9]),
        .I1(reg_pre[9]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl_reg_n_0_[9] ),
        .I5(pwm_o_OBUF_inst_i_2_0[9]),
        .O(\wb_dat_o_OBUF[9]_inst_i_3_n_0 ));
endmodule

(* NotValidForBitStream *)
module timer_wb
   (wb_clk_i,
    wb_rst_i,
    wb_adr_i,
    wb_dat_i,
    wb_we_i,
    wb_stb_i,
    wb_cyc_i,
    wb_sel_i,
    wb_dat_o,
    wb_ack_o,
    wb_err_o,
    wb_stall_o,
    ext_meas_i,
    capture_i,
    pwm_o,
    trigger_o,
    irq);
  input wb_clk_i;
  input wb_rst_i;
  input [31:0]wb_adr_i;
  input [31:0]wb_dat_i;
  input wb_we_i;
  input wb_stb_i;
  input wb_cyc_i;
  input [3:0]wb_sel_i;
  output [31:0]wb_dat_o;
  output wb_ack_o;
  output wb_err_o;
  output wb_stall_o;
  input ext_meas_i;
  input capture_i;
  output pwm_o;
  output trigger_o;
  output irq;

  wire capture_i;
  wire capture_i_IBUF;
  wire capture_stb;
  wire [31:0]capture_val;
  wire clk_tick7_out;
  wire [31:0]current_val;
  wire [15:1]data1;
  wire dir;
  wire en;
  wire ext_en;
  wire ext_meas_i;
  wire ext_meas_i_IBUF;
  wire irq;
  wire irq_OBUF;
  wire load_cmd;
  wire [31:0]load_val;
  wire mode;
  wire op_done1;
  wire [15:0]p_1_in;
  wire [0:0]prescaler;
  wire pwm_o;
  wire pwm_o_OBUF;
  wire reg_cap0;
  wire [31:0]reg_cmp;
  wire reg_cmp_0;
  wire reg_ctrl;
  wire reg_int_en;
  wire [1:0]reg_int_sts2_out;
  wire [31:0]reg_load;
  wire reg_load_1;
  wire reg_pre;
  wire trigger_o;
  wire trigger_o_OBUF;
  wire u_timer_core_n_51;
  wire u_timer_core_n_52;
  wire u_timer_core_n_53;
  wire u_timer_core_n_55;
  wire u_timer_core_n_56;
  wire u_timer_core_n_57;
  wire u_timer_core_n_58;
  wire u_timer_core_n_59;
  wire u_timer_core_n_60;
  wire u_timer_core_n_61;
  wire u_timer_core_n_62;
  wire u_timer_core_n_63;
  wire u_timer_core_n_64;
  wire u_timer_core_n_65;
  wire u_timer_core_n_66;
  wire u_timer_core_n_67;
  wire u_timer_core_n_68;
  wire u_timer_core_n_69;
  wire u_timer_core_n_70;
  wire u_timer_core_n_71;
  wire u_timer_core_n_72;
  wire u_timer_core_n_73;
  wire u_timer_core_n_74;
  wire u_timer_core_n_75;
  wire u_timer_core_n_76;
  wire u_timer_core_n_77;
  wire u_timer_core_n_78;
  wire u_timer_core_n_79;
  wire u_timer_core_n_80;
  wire u_timer_core_n_81;
  wire u_timer_core_n_82;
  wire u_timer_core_n_83;
  wire u_timer_core_n_84;
  wire u_timer_core_n_85;
  wire u_timer_core_n_86;
  wire u_timer_core_n_87;
  wire u_timer_regs_n_123;
  wire u_timer_regs_n_48;
  wire u_timer_regs_n_49;
  wire u_timer_regs_n_54;
  wire u_timer_regs_n_56;
  wire u_wb_adapter_n_1;
  wire u_wb_adapter_n_2;
  wire u_wb_adapter_n_43;
  wire wb_ack_o;
  wire wb_ack_o_OBUF;
  wire [31:0]wb_adr_i;
  wire [5:0]wb_adr_i_IBUF;
  wire wb_clk_i;
  wire wb_clk_i_IBUF;
  wire wb_clk_i_IBUF_BUFG;
  wire wb_cyc_i;
  wire wb_cyc_i_IBUF;
  wire [31:0]wb_dat_i;
  wire [31:0]wb_dat_i_IBUF;
  wire [31:0]wb_dat_o;
  wire [31:0]wb_dat_o_OBUF;
  wire wb_err_o;
  wire wb_rst_i;
  wire wb_rst_i_IBUF;
  wire wb_stall_o;
  wire wb_stb_i;
  wire wb_stb_i_IBUF;
  wire wb_we_i;
  wire wb_we_i_IBUF;

initial begin
 $sdf_annotate("timer_wb_netlist.sdf",,,,"tool_control");
end
  IBUF capture_i_IBUF_inst
       (.I(capture_i),
        .O(capture_i_IBUF));
  IBUF ext_meas_i_IBUF_inst
       (.I(ext_meas_i),
        .O(ext_meas_i_IBUF));
  OBUF irq_OBUF_inst
       (.I(irq_OBUF),
        .O(irq));
  OBUF pwm_o_OBUF_inst
       (.I(pwm_o_OBUF),
        .O(pwm_o));
  OBUF trigger_o_OBUF_inst
       (.I(trigger_o_OBUF),
        .O(trigger_o));
  timer_core u_timer_core
       (.CLK(wb_clk_i_IBUF_BUFG),
        .CO(op_done1),
        .D({wb_dat_i_IBUF[30],wb_dat_i_IBUF[1:0]}),
        .E(reg_cap0),
        .Q(prescaler),
        .S({u_timer_core_n_55,u_timer_core_n_56,u_timer_core_n_57,u_timer_core_n_58}),
        .capture_i_IBUF(capture_i_IBUF),
        .capture_stb(capture_stb),
        .capture_stb_reg_0(u_timer_core_n_53),
        .\capture_val_reg[31]_0 (capture_val),
        .clk_tick7_out(clk_tick7_out),
        .\counter_reg[0]_0 (u_timer_regs_n_123),
        .\counter_reg[15]_0 ({u_timer_core_n_63,u_timer_core_n_64,u_timer_core_n_65,u_timer_core_n_66}),
        .\counter_reg[15]_1 ({u_timer_core_n_76,u_timer_core_n_77,u_timer_core_n_78,u_timer_core_n_79}),
        .\counter_reg[23]_0 ({u_timer_core_n_59,u_timer_core_n_60,u_timer_core_n_61,u_timer_core_n_62}),
        .\counter_reg[23]_1 ({u_timer_core_n_80,u_timer_core_n_81,u_timer_core_n_82,u_timer_core_n_83}),
        .\counter_reg[31]_0 (current_val),
        .\counter_reg[31]_1 ({u_timer_core_n_84,u_timer_core_n_85,u_timer_core_n_86,u_timer_core_n_87}),
        .\counter_reg[31]_2 (u_timer_regs_n_48),
        .\counter_reg[7]_0 ({u_timer_core_n_67,u_timer_core_n_68,u_timer_core_n_69,u_timer_core_n_70}),
        .\counter_reg[7]_1 ({u_timer_core_n_72,u_timer_core_n_73,u_timer_core_n_74,u_timer_core_n_75}),
        .data1(data1),
        .ext_meas_d_reg_0(u_timer_core_n_51),
        .ext_meas_i_IBUF(ext_meas_i_IBUF),
        .irq_reg_0(u_timer_core_n_52),
        .load_cmd(load_cmd),
        .load_val(load_val),
        .\op_done1_inferred__0/i__carry__1_0 (reg_load[30]),
        .\prescaler_reg[15]_0 (u_timer_regs_n_54),
        .\prescaler_reg[15]_1 (p_1_in),
        .\prescaler_reg[1]_0 (u_timer_core_n_71),
        .pwm_o_OBUF_inst_i_2(reg_cmp),
        .\reg_cap_reg[31] ({u_timer_regs_n_49,ext_en,dir,mode,en}),
        .\reg_int_sts_reg[0] (u_timer_regs_n_56),
        .trigger_o_OBUF(trigger_o_OBUF),
        .wb_adr_i_IBUF(wb_adr_i_IBUF[4:2]),
        .wb_rst_i_IBUF(wb_rst_i_IBUF));
  timer_regs u_timer_regs
       (.CLK(wb_clk_i_IBUF_BUFG),
        .CO(op_done1),
        .D(wb_dat_i_IBUF),
        .E(reg_ctrl),
        .Q(prescaler),
        .S({u_timer_core_n_55,u_timer_core_n_56,u_timer_core_n_57,u_timer_core_n_58}),
        .capture_stb(capture_stb),
        .clk_tick7_out(clk_tick7_out),
        .\counter_reg[31] (u_timer_core_n_51),
        .data1(data1),
        .irq_OBUF(irq_OBUF),
        .load_cmd(load_cmd),
        .\prescaler_reg[15] (u_timer_core_n_71),
        .pwm_o_OBUF(pwm_o_OBUF),
        .pwm_o_OBUF_inst_i_13_0({u_timer_core_n_63,u_timer_core_n_64,u_timer_core_n_65,u_timer_core_n_66}),
        .pwm_o_OBUF_inst_i_1_0({u_timer_core_n_84,u_timer_core_n_85,u_timer_core_n_86,u_timer_core_n_87}),
        .pwm_o_OBUF_inst_i_22_0({u_timer_core_n_72,u_timer_core_n_73,u_timer_core_n_74,u_timer_core_n_75}),
        .pwm_o_OBUF_inst_i_2_0(current_val),
        .pwm_o_OBUF_inst_i_2_1({u_timer_core_n_80,u_timer_core_n_81,u_timer_core_n_82,u_timer_core_n_83}),
        .pwm_o_OBUF_inst_i_31_0({u_timer_core_n_67,u_timer_core_n_68,u_timer_core_n_69,u_timer_core_n_70}),
        .pwm_o_OBUF_inst_i_3_0({u_timer_core_n_59,u_timer_core_n_60,u_timer_core_n_61,u_timer_core_n_62}),
        .pwm_o_OBUF_inst_i_4_0({u_timer_core_n_76,u_timer_core_n_77,u_timer_core_n_78,u_timer_core_n_79}),
        .\reg_cap_reg[31]_0 (reg_cap0),
        .\reg_cap_reg[31]_1 (capture_val),
        .\reg_cmp_reg[31]_0 (reg_cmp),
        .\reg_cmp_reg[31]_1 (reg_cmp_0),
        .\reg_ctrl_reg[0]_0 (u_timer_regs_n_48),
        .\reg_ctrl_reg[3]_0 (u_timer_regs_n_123),
        .\reg_ctrl_reg[5]_0 (u_timer_regs_n_54),
        .\reg_ctrl_reg[6]_0 ({u_timer_regs_n_49,ext_en,dir,mode,en}),
        .\reg_int_en_reg[31]_0 (reg_int_en),
        .reg_int_sts2_out(reg_int_sts2_out),
        .\reg_int_sts_reg[0]_0 (u_timer_core_n_52),
        .\reg_int_sts_reg[1]_0 (u_wb_adapter_n_43),
        .\reg_int_sts_reg[1]_1 (u_timer_core_n_53),
        .\reg_load_reg[31]_0 (reg_load),
        .\reg_load_reg[31]_1 (reg_load_1),
        .\reg_pre_reg[15]_0 (p_1_in),
        .\reg_pre_reg[31]_0 (reg_pre),
        .trigger_o_OBUF(trigger_o_OBUF),
        .\wb_adr_i[1] (u_timer_regs_n_56),
        .wb_adr_i_IBUF(wb_adr_i_IBUF[3:0]),
        .\wb_dat_o[0] (u_wb_adapter_n_1),
        .\wb_dat_o[0]_0 (u_wb_adapter_n_2),
        .wb_dat_o_OBUF(wb_dat_o_OBUF),
        .wb_rst_i_IBUF(wb_rst_i_IBUF));
  wb_slave_adapter u_wb_adapter
       (.CLK(wb_clk_i_IBUF_BUFG),
        .D(wb_dat_i_IBUF),
        .E(reg_ctrl),
        .ack_q_reg_0(u_wb_adapter_n_1),
        .ack_q_reg_1(u_wb_adapter_n_2),
        .ack_q_reg_2(u_wb_adapter_n_43),
        .capture_stb(capture_stb),
        .\counter_reg[31] (reg_load),
        .load_cmd(load_cmd),
        .load_val(load_val),
        .reg_int_sts2_out(reg_int_sts2_out),
        .\reg_load_reg[31] (u_timer_regs_n_56),
        .trigger_o_OBUF(trigger_o_OBUF),
        .wb_ack_o_OBUF(wb_ack_o_OBUF),
        .\wb_adr_i[4] (reg_cmp_0),
        .\wb_adr_i[4]_0 (reg_int_en),
        .\wb_adr_i[4]_1 (reg_pre),
        .\wb_adr_i[5] (reg_load_1),
        .wb_adr_i_IBUF(wb_adr_i_IBUF),
        .wb_cyc_i_IBUF(wb_cyc_i_IBUF),
        .wb_rst_i_IBUF(wb_rst_i_IBUF),
        .wb_stb_i_IBUF(wb_stb_i_IBUF),
        .wb_we_i_IBUF(wb_we_i_IBUF));
  OBUF wb_ack_o_OBUF_inst
       (.I(wb_ack_o_OBUF),
        .O(wb_ack_o));
  IBUF \wb_adr_i_IBUF[0]_inst 
       (.I(wb_adr_i[0]),
        .O(wb_adr_i_IBUF[0]));
  IBUF \wb_adr_i_IBUF[1]_inst 
       (.I(wb_adr_i[1]),
        .O(wb_adr_i_IBUF[1]));
  IBUF \wb_adr_i_IBUF[2]_inst 
       (.I(wb_adr_i[2]),
        .O(wb_adr_i_IBUF[2]));
  IBUF \wb_adr_i_IBUF[3]_inst 
       (.I(wb_adr_i[3]),
        .O(wb_adr_i_IBUF[3]));
  IBUF \wb_adr_i_IBUF[4]_inst 
       (.I(wb_adr_i[4]),
        .O(wb_adr_i_IBUF[4]));
  IBUF \wb_adr_i_IBUF[5]_inst 
       (.I(wb_adr_i[5]),
        .O(wb_adr_i_IBUF[5]));
  BUFG wb_clk_i_IBUF_BUFG_inst
       (.I(wb_clk_i_IBUF),
        .O(wb_clk_i_IBUF_BUFG));
  IBUF wb_clk_i_IBUF_inst
       (.I(wb_clk_i),
        .O(wb_clk_i_IBUF));
  IBUF wb_cyc_i_IBUF_inst
       (.I(wb_cyc_i),
        .O(wb_cyc_i_IBUF));
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
  IBUF \wb_dat_i_IBUF[3]_inst 
       (.I(wb_dat_i[3]),
        .O(wb_dat_i_IBUF[3]));
  IBUF \wb_dat_i_IBUF[4]_inst 
       (.I(wb_dat_i[4]),
        .O(wb_dat_i_IBUF[4]));
  IBUF \wb_dat_i_IBUF[5]_inst 
       (.I(wb_dat_i[5]),
        .O(wb_dat_i_IBUF[5]));
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
  OBUF \wb_dat_o_OBUF[3]_inst 
       (.I(wb_dat_o_OBUF[3]),
        .O(wb_dat_o[3]));
  OBUF \wb_dat_o_OBUF[4]_inst 
       (.I(wb_dat_o_OBUF[4]),
        .O(wb_dat_o[4]));
  OBUF \wb_dat_o_OBUF[5]_inst 
       (.I(wb_dat_o_OBUF[5]),
        .O(wb_dat_o[5]));
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
  OBUF wb_err_o_OBUF_inst
       (.I(1'b0),
        .O(wb_err_o));
  IBUF wb_rst_i_IBUF_inst
       (.I(wb_rst_i),
        .O(wb_rst_i_IBUF));
  OBUF wb_stall_o_OBUF_inst
       (.I(1'b0),
        .O(wb_stall_o));
  IBUF wb_stb_i_IBUF_inst
       (.I(wb_stb_i),
        .O(wb_stb_i_IBUF));
  IBUF wb_we_i_IBUF_inst
       (.I(wb_we_i),
        .O(wb_we_i_IBUF));
endmodule

module wb_slave_adapter
   (wb_ack_o_OBUF,
    ack_q_reg_0,
    ack_q_reg_1,
    \wb_adr_i[5] ,
    load_val,
    load_cmd,
    reg_int_sts2_out,
    \wb_adr_i[4] ,
    \wb_adr_i[4]_0 ,
    \wb_adr_i[4]_1 ,
    E,
    ack_q_reg_2,
    CLK,
    wb_rst_i_IBUF,
    wb_adr_i_IBUF,
    \reg_load_reg[31] ,
    D,
    \counter_reg[31] ,
    trigger_o_OBUF,
    capture_stb,
    wb_cyc_i_IBUF,
    wb_stb_i_IBUF,
    wb_we_i_IBUF);
  output wb_ack_o_OBUF;
  output ack_q_reg_0;
  output ack_q_reg_1;
  output [0:0]\wb_adr_i[5] ;
  output [31:0]load_val;
  output load_cmd;
  output [1:0]reg_int_sts2_out;
  output [0:0]\wb_adr_i[4] ;
  output [0:0]\wb_adr_i[4]_0 ;
  output [0:0]\wb_adr_i[4]_1 ;
  output [0:0]E;
  output ack_q_reg_2;
  input CLK;
  input wb_rst_i_IBUF;
  input [5:0]wb_adr_i_IBUF;
  input \reg_load_reg[31] ;
  input [31:0]D;
  input [31:0]\counter_reg[31] ;
  input trigger_o_OBUF;
  input capture_stb;
  input wb_cyc_i_IBUF;
  input wb_stb_i_IBUF;
  input wb_we_i_IBUF;

  wire CLK;
  wire [31:0]D;
  wire [0:0]E;
  wire ack_q0;
  wire ack_q_reg_0;
  wire ack_q_reg_1;
  wire ack_q_reg_2;
  wire capture_stb;
  wire [31:0]\counter_reg[31] ;
  wire cs;
  wire load_cmd;
  wire [31:0]load_val;
  wire \reg_ctrl[31]_i_2_n_0 ;
  wire [1:0]reg_int_sts2_out;
  wire \reg_load_reg[31] ;
  wire trigger_o_OBUF;
  wire \u_timer_regs/p_3_in ;
  wire wb_ack_o_OBUF;
  wire [0:0]\wb_adr_i[4] ;
  wire [0:0]\wb_adr_i[4]_0 ;
  wire [0:0]\wb_adr_i[4]_1 ;
  wire [0:0]\wb_adr_i[5] ;
  wire [5:0]wb_adr_i_IBUF;
  wire wb_cyc_i_IBUF;
  wire wb_rst_i_IBUF;
  wire wb_stb_i_IBUF;
  wire wb_we_i_IBUF;

  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h08)) 
    ack_q_i_1
       (.I0(wb_stb_i_IBUF),
        .I1(wb_cyc_i_IBUF),
        .I2(wb_ack_o_OBUF),
        .O(ack_q0));
  FDCE ack_q_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(wb_rst_i_IBUF),
        .D(ack_q0),
        .Q(wb_ack_o_OBUF));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[0]_i_3 
       (.I0(D[0]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [0]),
        .O(load_val[0]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[10]_i_3 
       (.I0(D[10]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [10]),
        .O(load_val[10]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[11]_i_3 
       (.I0(D[11]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [11]),
        .O(load_val[11]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[12]_i_4 
       (.I0(D[12]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [12]),
        .O(load_val[12]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[13]_i_3 
       (.I0(D[13]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [13]),
        .O(load_val[13]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[14]_i_3 
       (.I0(D[14]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [14]),
        .O(load_val[14]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[15]_i_3 
       (.I0(D[15]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [15]),
        .O(load_val[15]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[16]_i_4 
       (.I0(D[16]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [16]),
        .O(load_val[16]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[17]_i_3 
       (.I0(D[17]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [17]),
        .O(load_val[17]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[18]_i_3 
       (.I0(D[18]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [18]),
        .O(load_val[18]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[19]_i_3 
       (.I0(D[19]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [19]),
        .O(load_val[19]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[1]_i_3 
       (.I0(D[1]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [1]),
        .O(load_val[1]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[20]_i_4 
       (.I0(D[20]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [20]),
        .O(load_val[20]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[21]_i_3 
       (.I0(D[21]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [21]),
        .O(load_val[21]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[22]_i_3 
       (.I0(D[22]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [22]),
        .O(load_val[22]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[23]_i_3 
       (.I0(D[23]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [23]),
        .O(load_val[23]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[24]_i_4 
       (.I0(D[24]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [24]),
        .O(load_val[24]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[25]_i_3 
       (.I0(D[25]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [25]),
        .O(load_val[25]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[26]_i_3 
       (.I0(D[26]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [26]),
        .O(load_val[26]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[27]_i_3 
       (.I0(D[27]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [27]),
        .O(load_val[27]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[28]_i_4 
       (.I0(D[28]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [28]),
        .O(load_val[28]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[29]_i_3 
       (.I0(D[29]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [29]),
        .O(load_val[29]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[2]_i_3 
       (.I0(D[2]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [2]),
        .O(load_val[2]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[30]_i_3 
       (.I0(D[30]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [30]),
        .O(load_val[30]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[31]_i_6 
       (.I0(D[31]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [31]),
        .O(load_val[31]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[3]_i_3 
       (.I0(D[3]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [3]),
        .O(load_val[3]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[4]_i_4 
       (.I0(D[4]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [4]),
        .O(load_val[4]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[5]_i_3 
       (.I0(D[5]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [5]),
        .O(load_val[5]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[6]_i_3 
       (.I0(D[6]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [6]),
        .O(load_val[6]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[7]_i_3 
       (.I0(D[7]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [7]),
        .O(load_val[7]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[8]_i_4 
       (.I0(D[8]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [8]),
        .O(load_val[8]));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \counter[9]_i_3 
       (.I0(D[9]),
        .I1(wb_adr_i_IBUF[4]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(\reg_ctrl[31]_i_2_n_0 ),
        .I5(\counter_reg[31] [9]),
        .O(load_val[9]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    irq_i_4
       (.I0(wb_adr_i_IBUF[4]),
        .I1(wb_adr_i_IBUF[2]),
        .I2(wb_adr_i_IBUF[3]),
        .I3(\reg_ctrl[31]_i_2_n_0 ),
        .O(load_cmd));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \reg_cmp[31]_i_1 
       (.I0(wb_adr_i_IBUF[4]),
        .I1(\reg_ctrl[31]_i_2_n_0 ),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .O(\wb_adr_i[4] ));
  LUT4 #(
    .INIT(16'h0100)) 
    \reg_ctrl[31]_i_1 
       (.I0(wb_adr_i_IBUF[4]),
        .I1(wb_adr_i_IBUF[3]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(\reg_ctrl[31]_i_2_n_0 ),
        .O(E));
  LUT6 #(
    .INIT(64'h0000000000004000)) 
    \reg_ctrl[31]_i_2 
       (.I0(\reg_load_reg[31] ),
        .I1(wb_cyc_i_IBUF),
        .I2(wb_stb_i_IBUF),
        .I3(wb_we_i_IBUF),
        .I4(wb_ack_o_OBUF),
        .I5(wb_adr_i_IBUF[5]),
        .O(\reg_ctrl[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \reg_int_en[31]_i_1 
       (.I0(wb_adr_i_IBUF[4]),
        .I1(\reg_ctrl[31]_i_2_n_0 ),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[3]),
        .O(\wb_adr_i[4]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00800000)) 
    \reg_int_sts[0]_i_3 
       (.I0(\reg_ctrl[31]_i_2_n_0 ),
        .I1(wb_adr_i_IBUF[4]),
        .I2(D[0]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .I5(trigger_o_OBUF),
        .O(reg_int_sts2_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'hEFFFFFFF)) 
    \reg_int_sts[1]_i_2 
       (.I0(wb_adr_i_IBUF[5]),
        .I1(wb_ack_o_OBUF),
        .I2(wb_we_i_IBUF),
        .I3(wb_stb_i_IBUF),
        .I4(wb_cyc_i_IBUF),
        .O(ack_q_reg_2));
  LUT6 #(
    .INIT(64'hFFFFFFFF00800000)) 
    \reg_int_sts[1]_i_4 
       (.I0(\reg_ctrl[31]_i_2_n_0 ),
        .I1(wb_adr_i_IBUF[4]),
        .I2(D[1]),
        .I3(wb_adr_i_IBUF[3]),
        .I4(wb_adr_i_IBUF[2]),
        .I5(capture_stb),
        .O(reg_int_sts2_out[1]));
  LUT6 #(
    .INIT(64'h0000001000000000)) 
    \reg_load[31]_i_1 
       (.I0(\reg_load_reg[31] ),
        .I1(wb_adr_i_IBUF[5]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(wb_adr_i_IBUF[4]),
        .I4(wb_adr_i_IBUF[3]),
        .I5(\u_timer_regs/p_3_in ),
        .O(\wb_adr_i[5] ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \reg_load[31]_i_3 
       (.I0(wb_cyc_i_IBUF),
        .I1(wb_stb_i_IBUF),
        .I2(wb_we_i_IBUF),
        .I3(wb_ack_o_OBUF),
        .O(\u_timer_regs/p_3_in ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \reg_pre[31]_i_1 
       (.I0(wb_adr_i_IBUF[4]),
        .I1(wb_adr_i_IBUF[3]),
        .I2(wb_adr_i_IBUF[2]),
        .I3(\reg_ctrl[31]_i_2_n_0 ),
        .O(\wb_adr_i[4]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h00000200)) 
    \wb_dat_o_OBUF[31]_inst_i_3 
       (.I0(cs),
        .I1(wb_adr_i_IBUF[5]),
        .I2(wb_adr_i_IBUF[1]),
        .I3(wb_adr_i_IBUF[4]),
        .I4(wb_adr_i_IBUF[0]),
        .O(ack_q_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h00000002)) 
    \wb_dat_o_OBUF[31]_inst_i_5 
       (.I0(cs),
        .I1(wb_adr_i_IBUF[5]),
        .I2(wb_adr_i_IBUF[1]),
        .I3(wb_adr_i_IBUF[4]),
        .I4(wb_adr_i_IBUF[0]),
        .O(ack_q_reg_1));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h0888)) 
    \wb_dat_o_OBUF[31]_inst_i_6 
       (.I0(wb_cyc_i_IBUF),
        .I1(wb_stb_i_IBUF),
        .I2(wb_we_i_IBUF),
        .I3(wb_ack_o_OBUF),
        .O(cs));
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
