// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Tue Dec 23 19:24:51 2025
// Host        : salvage running 64-bit Linux Mint 22.1
// Command     : write_verilog -mode timesim -sdf_anno true -force results/timer_apb_vhdl/timer_apb_netlist.v
// Design      : timer_apb
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* NotValidForBitStream *)
module timer_apb
   (pclk,
    presetn,
    paddr,
    pprot,
    psel,
    penable,
    pwrite,
    pwdata,
    pstrb,
    pready,
    prdata,
    pslverr,
    ext_meas_i,
    capture_i,
    pwm_o,
    trigger_o,
    irq);
  input pclk;
  input presetn;
  input [31:0]paddr;
  input [2:0]pprot;
  input psel;
  input penable;
  input pwrite;
  input [31:0]pwdata;
  input [3:0]pstrb;
  output pready;
  output [31:0]prdata;
  output pslverr;
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
  wire [31:2]counter0;
  wire [31:0]current_val;
  wire dir;
  wire ext_en;
  wire ext_meas_i;
  wire ext_meas_i_IBUF;
  wire irq;
  wire irq_OBUF;
  wire mode;
  wire op_done1;
  wire [31:0]paddr;
  wire [5:0]paddr_IBUF;
  wire pclk;
  wire pclk_IBUF;
  wire pclk_IBUF_BUFG;
  wire penable;
  wire penable_IBUF;
  wire [31:0]prdata;
  wire [31:0]prdata_OBUF;
  wire pready;
  wire presetn;
  wire presetn_IBUF;
  wire psel;
  wire psel_IBUF;
  wire pslverr;
  wire [31:0]pwdata;
  wire [31:0]pwdata_IBUF;
  wire pwm_o;
  wire pwm_o_OBUF;
  wire pwrite;
  wire pwrite_IBUF;
  wire [31:0]reg_cmp;
  wire [29:0]reg_load;
  wire reg_load_0;
  wire [15:0]reg_pre;
  wire sel00;
  wire trigger_o;
  wire trigger_o_OBUF;
  wire u_timer_core_n_10;
  wire u_timer_core_n_11;
  wire u_timer_core_n_12;
  wire u_timer_core_n_13;
  wire u_timer_core_n_3;
  wire u_timer_core_n_4;
  wire u_timer_core_n_46;
  wire u_timer_core_n_47;
  wire u_timer_core_n_5;
  wire u_timer_core_n_6;
  wire u_timer_core_n_67;
  wire u_timer_core_n_68;
  wire u_timer_core_n_69;
  wire u_timer_core_n_7;
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
  wire u_timer_core_n_9;
  wire u_timer_regs_n_127;
  wire u_timer_regs_n_128;
  wire u_timer_regs_n_129;
  wire u_timer_regs_n_130;
  wire u_timer_regs_n_131;
  wire u_timer_regs_n_132;
  wire u_timer_regs_n_133;
  wire u_timer_regs_n_134;
  wire u_timer_regs_n_135;
  wire u_timer_regs_n_136;
  wire u_timer_regs_n_137;
  wire u_timer_regs_n_138;
  wire u_timer_regs_n_139;
  wire u_timer_regs_n_156;
  wire u_timer_regs_n_157;
  wire u_timer_regs_n_158;
  wire u_timer_regs_n_159;
  wire u_timer_regs_n_160;
  wire u_timer_regs_n_161;
  wire u_timer_regs_n_162;
  wire u_timer_regs_n_163;
  wire u_timer_regs_n_164;
  wire u_timer_regs_n_165;
  wire u_timer_regs_n_166;
  wire u_timer_regs_n_167;
  wire u_timer_regs_n_168;
  wire u_timer_regs_n_169;
  wire u_timer_regs_n_170;
  wire u_timer_regs_n_171;
  wire u_timer_regs_n_172;
  wire u_timer_regs_n_173;
  wire u_timer_regs_n_174;
  wire u_timer_regs_n_37;
  wire u_timer_regs_n_38;
  wire u_timer_regs_n_39;
  wire u_timer_regs_n_40;
  wire u_timer_regs_n_41;
  wire u_timer_regs_n_42;
  wire u_timer_regs_n_43;
  wire u_timer_regs_n_44;
  wire u_timer_regs_n_45;
  wire u_timer_regs_n_46;
  wire u_timer_regs_n_47;
  wire u_timer_regs_n_48;
  wire u_timer_regs_n_49;
  wire u_timer_regs_n_50;
  wire u_timer_regs_n_51;
  wire u_timer_regs_n_52;
  wire u_timer_regs_n_53;
  wire u_timer_regs_n_54;
  wire u_timer_regs_n_55;
  wire u_timer_regs_n_69;
  wire u_timer_regs_n_70;
  wire u_timer_regs_n_71;
  wire u_timer_regs_n_72;
  wire u_timer_regs_n_73;
  wire u_timer_regs_n_74;
  wire u_timer_regs_n_75;
  wire u_timer_regs_n_76;
  wire u_timer_regs_n_77;
  wire u_timer_regs_n_78;
  wire u_timer_regs_n_79;
  wire u_timer_regs_n_80;
  wire u_timer_regs_n_81;
  wire u_timer_regs_n_82;
  wire u_timer_regs_n_83;
  wire u_timer_regs_n_84;
  wire u_timer_regs_n_85;
  wire u_timer_regs_n_86;
  wire u_timer_regs_n_87;
  wire u_timer_regs_n_88;
  wire u_timer_regs_n_91;
  wire u_timer_regs_n_92;
  wire u_timer_regs_n_93;
  wire u_timer_regs_n_94;

initial begin
 $sdf_annotate("timer_apb_netlist.sdf",,,,"tool_control");
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
  IBUF \paddr_IBUF[0]_inst 
       (.I(paddr[0]),
        .O(paddr_IBUF[0]));
  IBUF \paddr_IBUF[1]_inst 
       (.I(paddr[1]),
        .O(paddr_IBUF[1]));
  IBUF \paddr_IBUF[2]_inst 
       (.I(paddr[2]),
        .O(paddr_IBUF[2]));
  IBUF \paddr_IBUF[3]_inst 
       (.I(paddr[3]),
        .O(paddr_IBUF[3]));
  IBUF \paddr_IBUF[4]_inst 
       (.I(paddr[4]),
        .O(paddr_IBUF[4]));
  IBUF \paddr_IBUF[5]_inst 
       (.I(paddr[5]),
        .O(paddr_IBUF[5]));
  BUFG pclk_IBUF_BUFG_inst
       (.I(pclk_IBUF),
        .O(pclk_IBUF_BUFG));
  IBUF pclk_IBUF_inst
       (.I(pclk),
        .O(pclk_IBUF));
  IBUF penable_IBUF_inst
       (.I(penable),
        .O(penable_IBUF));
  OBUF \prdata_OBUF[0]_inst 
       (.I(prdata_OBUF[0]),
        .O(prdata[0]));
  OBUF \prdata_OBUF[10]_inst 
       (.I(prdata_OBUF[10]),
        .O(prdata[10]));
  OBUF \prdata_OBUF[11]_inst 
       (.I(prdata_OBUF[11]),
        .O(prdata[11]));
  OBUF \prdata_OBUF[12]_inst 
       (.I(prdata_OBUF[12]),
        .O(prdata[12]));
  OBUF \prdata_OBUF[13]_inst 
       (.I(prdata_OBUF[13]),
        .O(prdata[13]));
  OBUF \prdata_OBUF[14]_inst 
       (.I(prdata_OBUF[14]),
        .O(prdata[14]));
  OBUF \prdata_OBUF[15]_inst 
       (.I(prdata_OBUF[15]),
        .O(prdata[15]));
  OBUF \prdata_OBUF[16]_inst 
       (.I(prdata_OBUF[16]),
        .O(prdata[16]));
  OBUF \prdata_OBUF[17]_inst 
       (.I(prdata_OBUF[17]),
        .O(prdata[17]));
  OBUF \prdata_OBUF[18]_inst 
       (.I(prdata_OBUF[18]),
        .O(prdata[18]));
  OBUF \prdata_OBUF[19]_inst 
       (.I(prdata_OBUF[19]),
        .O(prdata[19]));
  OBUF \prdata_OBUF[1]_inst 
       (.I(prdata_OBUF[1]),
        .O(prdata[1]));
  OBUF \prdata_OBUF[20]_inst 
       (.I(prdata_OBUF[20]),
        .O(prdata[20]));
  OBUF \prdata_OBUF[21]_inst 
       (.I(prdata_OBUF[21]),
        .O(prdata[21]));
  OBUF \prdata_OBUF[22]_inst 
       (.I(prdata_OBUF[22]),
        .O(prdata[22]));
  OBUF \prdata_OBUF[23]_inst 
       (.I(prdata_OBUF[23]),
        .O(prdata[23]));
  OBUF \prdata_OBUF[24]_inst 
       (.I(prdata_OBUF[24]),
        .O(prdata[24]));
  OBUF \prdata_OBUF[25]_inst 
       (.I(prdata_OBUF[25]),
        .O(prdata[25]));
  OBUF \prdata_OBUF[26]_inst 
       (.I(prdata_OBUF[26]),
        .O(prdata[26]));
  OBUF \prdata_OBUF[27]_inst 
       (.I(prdata_OBUF[27]),
        .O(prdata[27]));
  OBUF \prdata_OBUF[28]_inst 
       (.I(prdata_OBUF[28]),
        .O(prdata[28]));
  OBUF \prdata_OBUF[29]_inst 
       (.I(prdata_OBUF[29]),
        .O(prdata[29]));
  OBUF \prdata_OBUF[2]_inst 
       (.I(prdata_OBUF[2]),
        .O(prdata[2]));
  OBUF \prdata_OBUF[30]_inst 
       (.I(prdata_OBUF[30]),
        .O(prdata[30]));
  OBUF \prdata_OBUF[31]_inst 
       (.I(prdata_OBUF[31]),
        .O(prdata[31]));
  OBUF \prdata_OBUF[3]_inst 
       (.I(prdata_OBUF[3]),
        .O(prdata[3]));
  OBUF \prdata_OBUF[4]_inst 
       (.I(prdata_OBUF[4]),
        .O(prdata[4]));
  OBUF \prdata_OBUF[5]_inst 
       (.I(prdata_OBUF[5]),
        .O(prdata[5]));
  OBUF \prdata_OBUF[6]_inst 
       (.I(prdata_OBUF[6]),
        .O(prdata[6]));
  OBUF \prdata_OBUF[7]_inst 
       (.I(prdata_OBUF[7]),
        .O(prdata[7]));
  OBUF \prdata_OBUF[8]_inst 
       (.I(prdata_OBUF[8]),
        .O(prdata[8]));
  OBUF \prdata_OBUF[9]_inst 
       (.I(prdata_OBUF[9]),
        .O(prdata[9]));
  OBUF pready_OBUF_inst
       (.I(1'b1),
        .O(pready));
  IBUF presetn_IBUF_inst
       (.I(presetn),
        .O(presetn_IBUF));
  IBUF psel_IBUF_inst
       (.I(psel),
        .O(psel_IBUF));
  OBUF pslverr_OBUF_inst
       (.I(1'b0),
        .O(pslverr));
  IBUF \pwdata_IBUF[0]_inst 
       (.I(pwdata[0]),
        .O(pwdata_IBUF[0]));
  IBUF \pwdata_IBUF[10]_inst 
       (.I(pwdata[10]),
        .O(pwdata_IBUF[10]));
  IBUF \pwdata_IBUF[11]_inst 
       (.I(pwdata[11]),
        .O(pwdata_IBUF[11]));
  IBUF \pwdata_IBUF[12]_inst 
       (.I(pwdata[12]),
        .O(pwdata_IBUF[12]));
  IBUF \pwdata_IBUF[13]_inst 
       (.I(pwdata[13]),
        .O(pwdata_IBUF[13]));
  IBUF \pwdata_IBUF[14]_inst 
       (.I(pwdata[14]),
        .O(pwdata_IBUF[14]));
  IBUF \pwdata_IBUF[15]_inst 
       (.I(pwdata[15]),
        .O(pwdata_IBUF[15]));
  IBUF \pwdata_IBUF[16]_inst 
       (.I(pwdata[16]),
        .O(pwdata_IBUF[16]));
  IBUF \pwdata_IBUF[17]_inst 
       (.I(pwdata[17]),
        .O(pwdata_IBUF[17]));
  IBUF \pwdata_IBUF[18]_inst 
       (.I(pwdata[18]),
        .O(pwdata_IBUF[18]));
  IBUF \pwdata_IBUF[19]_inst 
       (.I(pwdata[19]),
        .O(pwdata_IBUF[19]));
  IBUF \pwdata_IBUF[1]_inst 
       (.I(pwdata[1]),
        .O(pwdata_IBUF[1]));
  IBUF \pwdata_IBUF[20]_inst 
       (.I(pwdata[20]),
        .O(pwdata_IBUF[20]));
  IBUF \pwdata_IBUF[21]_inst 
       (.I(pwdata[21]),
        .O(pwdata_IBUF[21]));
  IBUF \pwdata_IBUF[22]_inst 
       (.I(pwdata[22]),
        .O(pwdata_IBUF[22]));
  IBUF \pwdata_IBUF[23]_inst 
       (.I(pwdata[23]),
        .O(pwdata_IBUF[23]));
  IBUF \pwdata_IBUF[24]_inst 
       (.I(pwdata[24]),
        .O(pwdata_IBUF[24]));
  IBUF \pwdata_IBUF[25]_inst 
       (.I(pwdata[25]),
        .O(pwdata_IBUF[25]));
  IBUF \pwdata_IBUF[26]_inst 
       (.I(pwdata[26]),
        .O(pwdata_IBUF[26]));
  IBUF \pwdata_IBUF[27]_inst 
       (.I(pwdata[27]),
        .O(pwdata_IBUF[27]));
  IBUF \pwdata_IBUF[28]_inst 
       (.I(pwdata[28]),
        .O(pwdata_IBUF[28]));
  IBUF \pwdata_IBUF[29]_inst 
       (.I(pwdata[29]),
        .O(pwdata_IBUF[29]));
  IBUF \pwdata_IBUF[2]_inst 
       (.I(pwdata[2]),
        .O(pwdata_IBUF[2]));
  IBUF \pwdata_IBUF[30]_inst 
       (.I(pwdata[30]),
        .O(pwdata_IBUF[30]));
  IBUF \pwdata_IBUF[31]_inst 
       (.I(pwdata[31]),
        .O(pwdata_IBUF[31]));
  IBUF \pwdata_IBUF[3]_inst 
       (.I(pwdata[3]),
        .O(pwdata_IBUF[3]));
  IBUF \pwdata_IBUF[4]_inst 
       (.I(pwdata[4]),
        .O(pwdata_IBUF[4]));
  IBUF \pwdata_IBUF[5]_inst 
       (.I(pwdata[5]),
        .O(pwdata_IBUF[5]));
  IBUF \pwdata_IBUF[6]_inst 
       (.I(pwdata[6]),
        .O(pwdata_IBUF[6]));
  IBUF \pwdata_IBUF[7]_inst 
       (.I(pwdata[7]),
        .O(pwdata_IBUF[7]));
  IBUF \pwdata_IBUF[8]_inst 
       (.I(pwdata[8]),
        .O(pwdata_IBUF[8]));
  IBUF \pwdata_IBUF[9]_inst 
       (.I(pwdata[9]),
        .O(pwdata_IBUF[9]));
  OBUF pwm_o_OBUF_inst
       (.I(pwm_o_OBUF),
        .O(pwm_o));
  IBUF pwrite_IBUF_inst
       (.I(pwrite),
        .O(pwrite_IBUF));
  OBUF trigger_o_OBUF_inst
       (.I(trigger_o_OBUF),
        .O(trigger_o));
  timer_core u_timer_core
       (.CLK(pclk_IBUF_BUFG),
        .CO(op_done1),
        .D({pwdata_IBUF[29],pwdata_IBUF[27],pwdata_IBUF[24:23],pwdata_IBUF[21:20],pwdata_IBUF[17],pwdata_IBUF[11],pwdata_IBUF[8],pwdata_IBUF[5:4],pwdata_IBUF[1:0]}),
        .E(u_timer_regs_n_174),
        .Q({ext_en,dir,sel00,mode}),
        .S({u_timer_regs_n_79,u_timer_regs_n_80,u_timer_regs_n_81,u_timer_regs_n_82}),
        .capture_i_IBUF(capture_i_IBUF),
        .capture_stb(capture_stb),
        .\capture_val_reg[31]_0 (capture_val),
        .clk_tick7_out(clk_tick7_out),
        .\counter_reg[0]_0 (u_timer_regs_n_73),
        .\counter_reg[12]_0 (u_timer_regs_n_78),
        .\counter_reg[13]_0 (u_timer_core_n_7),
        .\counter_reg[13]_1 (u_timer_core_n_81),
        .\counter_reg[19]_0 (u_timer_core_n_5),
        .\counter_reg[25]_0 (u_timer_core_n_6),
        .\counter_reg[27]_0 (u_timer_regs_n_139),
        .\counter_reg[29]_0 ({reg_load[29],reg_load[27],reg_load[24:23],reg_load[21:20],reg_load[17],reg_load[11],reg_load[8],reg_load[5:4],reg_load[1:0]}),
        .\counter_reg[2]_0 (u_timer_regs_n_86),
        .\counter_reg[30]_0 (u_timer_regs_n_72),
        .\counter_reg[31]_0 (current_val),
        .\counter_reg[31]_1 ({counter0[31:30],counter0[28],counter0[26:25],counter0[22],counter0[19:18],counter0[16:12],counter0[10:9],counter0[7:6],counter0[3:2]}),
        .\counter_reg[31]_2 (u_timer_core_n_83),
        .\counter_reg[31]_3 (u_timer_core_n_84),
        .\counter_reg[31]_4 ({u_timer_regs_n_37,u_timer_regs_n_38,u_timer_regs_n_39,u_timer_regs_n_40,u_timer_regs_n_41,u_timer_regs_n_42,u_timer_regs_n_43,u_timer_regs_n_44,u_timer_regs_n_45,u_timer_regs_n_46,u_timer_regs_n_47,u_timer_regs_n_48,u_timer_regs_n_49,u_timer_regs_n_50,u_timer_regs_n_51,u_timer_regs_n_52,u_timer_regs_n_53,u_timer_regs_n_54,u_timer_regs_n_55}),
        .\counter_reg[3]_0 (u_timer_regs_n_85),
        .\counter_reg[6]_0 (u_timer_regs_n_84),
        .\counter_reg[7]_0 (u_timer_regs_n_83),
        .ext_meas_d_reg_0(u_timer_core_n_47),
        .ext_meas_d_reg_1(u_timer_regs_n_172),
        .ext_meas_i_IBUF(ext_meas_i_IBUF),
        .irq_reg_0(u_timer_regs_n_87),
        .irq_reg_1({u_timer_regs_n_69,u_timer_regs_n_70,u_timer_regs_n_71}),
        .\op_done1_inferred__0/i__carry__1_0 ({u_timer_regs_n_74,u_timer_regs_n_75,u_timer_regs_n_76,u_timer_regs_n_77}),
        .op_done_reg_0(u_timer_core_n_3),
        .op_done_reg_1(u_timer_regs_n_173),
        .paddr_IBUF(paddr_IBUF),
        .penable(u_timer_core_n_46),
        .penable_IBUF(penable_IBUF),
        .\prescaler_reg[14]_0 (u_timer_core_n_82),
        .\prescaler_reg[15]_0 (reg_pre),
        .\prescaler_reg[15]_1 (u_timer_regs_n_88),
        .psel_IBUF(psel_IBUF),
        .pwm_o_OBUF_inst_i_1({u_timer_regs_n_168,u_timer_regs_n_169,u_timer_regs_n_170,u_timer_regs_n_171}),
        .pwm_o_OBUF_inst_i_13_0({u_timer_regs_n_160,u_timer_regs_n_161,u_timer_regs_n_162,u_timer_regs_n_163}),
        .pwm_o_OBUF_inst_i_1_0({u_timer_regs_n_91,u_timer_regs_n_92,u_timer_regs_n_93,u_timer_regs_n_94}),
        .pwm_o_OBUF_inst_i_22_0({u_timer_regs_n_135,u_timer_regs_n_136,u_timer_regs_n_137,u_timer_regs_n_138}),
        .pwm_o_OBUF_inst_i_2_0({u_timer_regs_n_127,u_timer_regs_n_128,u_timer_regs_n_129,u_timer_regs_n_130}),
        .pwm_o_OBUF_inst_i_31_0({u_timer_regs_n_156,u_timer_regs_n_157,u_timer_regs_n_158,u_timer_regs_n_159}),
        .pwm_o_OBUF_inst_i_3_0(reg_cmp),
        .pwm_o_OBUF_inst_i_3_1({u_timer_regs_n_164,u_timer_regs_n_165,u_timer_regs_n_166,u_timer_regs_n_167}),
        .pwm_o_OBUF_inst_i_4_0({u_timer_regs_n_131,u_timer_regs_n_132,u_timer_regs_n_133,u_timer_regs_n_134}),
        .pwrite_IBUF(pwrite_IBUF),
        .\reg_ctrl_reg[1] (u_timer_core_n_4),
        .\reg_ctrl_reg[1]_0 (u_timer_core_n_9),
        .\reg_ctrl_reg[1]_1 (u_timer_core_n_10),
        .\reg_ctrl_reg[1]_2 (u_timer_core_n_11),
        .\reg_ctrl_reg[1]_3 (u_timer_core_n_12),
        .\reg_ctrl_reg[1]_4 (u_timer_core_n_13),
        .\reg_ctrl_reg[3] (u_timer_core_n_67),
        .\reg_ctrl_reg[3]_0 (u_timer_core_n_68),
        .\reg_ctrl_reg[3]_1 (u_timer_core_n_69),
        .\reg_ctrl_reg[3]_10 (u_timer_core_n_78),
        .\reg_ctrl_reg[3]_11 (u_timer_core_n_79),
        .\reg_ctrl_reg[3]_12 (u_timer_core_n_80),
        .\reg_ctrl_reg[3]_13 (u_timer_core_n_85),
        .\reg_ctrl_reg[3]_2 (u_timer_core_n_70),
        .\reg_ctrl_reg[3]_3 (u_timer_core_n_71),
        .\reg_ctrl_reg[3]_4 (u_timer_core_n_72),
        .\reg_ctrl_reg[3]_5 (u_timer_core_n_73),
        .\reg_ctrl_reg[3]_6 (u_timer_core_n_74),
        .\reg_ctrl_reg[3]_7 (u_timer_core_n_75),
        .\reg_ctrl_reg[3]_8 (u_timer_core_n_76),
        .\reg_ctrl_reg[3]_9 (u_timer_core_n_77),
        .reg_load(reg_load_0),
        .trigger_o_OBUF(trigger_o_OBUF));
  timer_regs u_timer_regs
       (.CLK(pclk_IBUF_BUFG),
        .CO(op_done1),
        .D(capture_val),
        .E(u_timer_regs_n_174),
        .Q({ext_en,dir,sel00,mode}),
        .S({u_timer_regs_n_79,u_timer_regs_n_80,u_timer_regs_n_81,u_timer_regs_n_82}),
        .capture_stb(capture_stb),
        .clk_tick7_out(clk_tick7_out),
        .clk_tick_reg(u_timer_core_n_82),
        .\counter_reg[10] (u_timer_core_n_68),
        .\counter_reg[12] (u_timer_core_n_9),
        .\counter_reg[13] (u_timer_core_n_69),
        .\counter_reg[14] (u_timer_core_n_70),
        .\counter_reg[15] (u_timer_core_n_71),
        .\counter_reg[16] (u_timer_core_n_72),
        .\counter_reg[18] (u_timer_core_n_73),
        .\counter_reg[19] (u_timer_core_n_74),
        .\counter_reg[22] ({u_timer_regs_n_74,u_timer_regs_n_75,u_timer_regs_n_76,u_timer_regs_n_77}),
        .\counter_reg[22]_0 (u_timer_core_n_75),
        .\counter_reg[25] (u_timer_core_n_76),
        .\counter_reg[26] (u_timer_core_n_77),
        .\counter_reg[28] (u_timer_core_n_78),
        .\counter_reg[28]_0 (u_timer_core_n_5),
        .\counter_reg[28]_1 (u_timer_core_n_6),
        .\counter_reg[28]_2 (u_timer_core_n_7),
        .\counter_reg[2] (u_timer_core_n_13),
        .\counter_reg[30] ({u_timer_regs_n_69,u_timer_regs_n_70,u_timer_regs_n_71}),
        .\counter_reg[30]_0 (u_timer_core_n_4),
        .\counter_reg[31] ({counter0[31:30],counter0[28],counter0[26:25],counter0[22],counter0[19:18],counter0[16:12],counter0[10:9],counter0[7:6],counter0[3:2]}),
        .\counter_reg[31]_0 (u_timer_core_n_85),
        .\counter_reg[31]_1 (u_timer_core_n_79),
        .\counter_reg[3] (u_timer_core_n_12),
        .\counter_reg[6] (u_timer_core_n_11),
        .\counter_reg[7] (u_timer_core_n_10),
        .\counter_reg[9] (u_timer_core_n_67),
        .irq_OBUF(irq_OBUF),
        .irq_reg(u_timer_core_n_81),
        .op_done_reg(u_timer_core_n_47),
        .op_done_reg_0(u_timer_core_n_80),
        .op_done_reg_1(u_timer_core_n_3),
        .paddr_IBUF(paddr_IBUF),
        .penable_IBUF(penable_IBUF),
        .prdata_OBUF(prdata_OBUF),
        .presetn(u_timer_regs_n_172),
        .presetn_IBUF(presetn_IBUF),
        .psel_IBUF(psel_IBUF),
        .\pwdata[31] ({u_timer_regs_n_37,u_timer_regs_n_38,u_timer_regs_n_39,u_timer_regs_n_40,u_timer_regs_n_41,u_timer_regs_n_42,u_timer_regs_n_43,u_timer_regs_n_44,u_timer_regs_n_45,u_timer_regs_n_46,u_timer_regs_n_47,u_timer_regs_n_48,u_timer_regs_n_49,u_timer_regs_n_50,u_timer_regs_n_51,u_timer_regs_n_52,u_timer_regs_n_53,u_timer_regs_n_54,u_timer_regs_n_55}),
        .pwdata_IBUF(pwdata_IBUF),
        .pwm_o(u_timer_core_n_84),
        .pwm_o_0(u_timer_core_n_83),
        .pwm_o_OBUF(pwm_o_OBUF),
        .pwm_o_OBUF_inst_i_3(current_val),
        .pwrite_IBUF(pwrite_IBUF),
        .\reg_cmp_reg[0]_0 (u_timer_core_n_46),
        .\reg_cmp_reg[15]_0 ({u_timer_regs_n_131,u_timer_regs_n_132,u_timer_regs_n_133,u_timer_regs_n_134}),
        .\reg_cmp_reg[15]_1 ({u_timer_regs_n_160,u_timer_regs_n_161,u_timer_regs_n_162,u_timer_regs_n_163}),
        .\reg_cmp_reg[23]_0 ({u_timer_regs_n_127,u_timer_regs_n_128,u_timer_regs_n_129,u_timer_regs_n_130}),
        .\reg_cmp_reg[23]_1 ({u_timer_regs_n_164,u_timer_regs_n_165,u_timer_regs_n_166,u_timer_regs_n_167}),
        .\reg_cmp_reg[31]_0 ({u_timer_regs_n_91,u_timer_regs_n_92,u_timer_regs_n_93,u_timer_regs_n_94}),
        .\reg_cmp_reg[31]_1 (reg_cmp),
        .\reg_cmp_reg[31]_2 ({u_timer_regs_n_168,u_timer_regs_n_169,u_timer_regs_n_170,u_timer_regs_n_171}),
        .\reg_cmp_reg[7]_0 ({u_timer_regs_n_135,u_timer_regs_n_136,u_timer_regs_n_137,u_timer_regs_n_138}),
        .\reg_cmp_reg[7]_1 ({u_timer_regs_n_156,u_timer_regs_n_157,u_timer_regs_n_158,u_timer_regs_n_159}),
        .\reg_ctrl_reg[0]_0 (u_timer_regs_n_87),
        .\reg_ctrl_reg[1]_0 (u_timer_regs_n_173),
        .\reg_ctrl_reg[3]_0 (u_timer_regs_n_73),
        .\reg_ctrl_reg[3]_1 (u_timer_regs_n_139),
        .\reg_ctrl_reg[5]_0 (u_timer_regs_n_88),
        .reg_load(reg_load_0),
        .\reg_load_reg[12]_0 (u_timer_regs_n_78),
        .\reg_load_reg[29]_0 ({reg_load[29],reg_load[27],reg_load[24:23],reg_load[21:20],reg_load[17],reg_load[11],reg_load[8],reg_load[5:4],reg_load[1:0]}),
        .\reg_load_reg[2]_0 (u_timer_regs_n_86),
        .\reg_load_reg[30]_0 (u_timer_regs_n_72),
        .\reg_load_reg[3]_0 (u_timer_regs_n_85),
        .\reg_load_reg[6]_0 (u_timer_regs_n_84),
        .\reg_load_reg[7]_0 (u_timer_regs_n_83),
        .\reg_pre_reg[15]_0 (reg_pre),
        .trigger_o_OBUF(trigger_o_OBUF));
endmodule

module timer_core
   (trigger_o_OBUF,
    capture_stb,
    CO,
    op_done_reg_0,
    \reg_ctrl_reg[1] ,
    \counter_reg[19]_0 ,
    \counter_reg[25]_0 ,
    \counter_reg[13]_0 ,
    reg_load,
    \reg_ctrl_reg[1]_0 ,
    \reg_ctrl_reg[1]_1 ,
    \reg_ctrl_reg[1]_2 ,
    \reg_ctrl_reg[1]_3 ,
    \reg_ctrl_reg[1]_4 ,
    \counter_reg[31]_0 ,
    penable,
    ext_meas_d_reg_0,
    \counter_reg[31]_1 ,
    \reg_ctrl_reg[3] ,
    \reg_ctrl_reg[3]_0 ,
    \reg_ctrl_reg[3]_1 ,
    \reg_ctrl_reg[3]_2 ,
    \reg_ctrl_reg[3]_3 ,
    \reg_ctrl_reg[3]_4 ,
    \reg_ctrl_reg[3]_5 ,
    \reg_ctrl_reg[3]_6 ,
    \reg_ctrl_reg[3]_7 ,
    \reg_ctrl_reg[3]_8 ,
    \reg_ctrl_reg[3]_9 ,
    \reg_ctrl_reg[3]_10 ,
    \reg_ctrl_reg[3]_11 ,
    \reg_ctrl_reg[3]_12 ,
    \counter_reg[13]_1 ,
    \prescaler_reg[14]_0 ,
    \counter_reg[31]_2 ,
    \counter_reg[31]_3 ,
    \reg_ctrl_reg[3]_13 ,
    \capture_val_reg[31]_0 ,
    irq_reg_0,
    CLK,
    ext_meas_d_reg_1,
    clk_tick7_out,
    ext_meas_i_IBUF,
    capture_i_IBUF,
    S,
    \op_done1_inferred__0/i__carry__1_0 ,
    irq_reg_1,
    op_done_reg_1,
    \counter_reg[30]_0 ,
    Q,
    \counter_reg[29]_0 ,
    D,
    \counter_reg[27]_0 ,
    \counter_reg[12]_0 ,
    \counter_reg[7]_0 ,
    \counter_reg[6]_0 ,
    \counter_reg[3]_0 ,
    \counter_reg[2]_0 ,
    \counter_reg[0]_0 ,
    paddr_IBUF,
    penable_IBUF,
    psel_IBUF,
    pwrite_IBUF,
    pwm_o_OBUF_inst_i_3_0,
    pwm_o_OBUF_inst_i_31_0,
    pwm_o_OBUF_inst_i_13_0,
    pwm_o_OBUF_inst_i_3_1,
    pwm_o_OBUF_inst_i_1,
    pwm_o_OBUF_inst_i_22_0,
    pwm_o_OBUF_inst_i_4_0,
    pwm_o_OBUF_inst_i_2_0,
    pwm_o_OBUF_inst_i_1_0,
    \prescaler_reg[15]_0 ,
    E,
    \counter_reg[31]_4 ,
    \prescaler_reg[15]_1 );
  output trigger_o_OBUF;
  output capture_stb;
  output [0:0]CO;
  output op_done_reg_0;
  output \reg_ctrl_reg[1] ;
  output \counter_reg[19]_0 ;
  output \counter_reg[25]_0 ;
  output \counter_reg[13]_0 ;
  output reg_load;
  output \reg_ctrl_reg[1]_0 ;
  output \reg_ctrl_reg[1]_1 ;
  output \reg_ctrl_reg[1]_2 ;
  output \reg_ctrl_reg[1]_3 ;
  output \reg_ctrl_reg[1]_4 ;
  output [31:0]\counter_reg[31]_0 ;
  output penable;
  output ext_meas_d_reg_0;
  output [18:0]\counter_reg[31]_1 ;
  output \reg_ctrl_reg[3] ;
  output \reg_ctrl_reg[3]_0 ;
  output \reg_ctrl_reg[3]_1 ;
  output \reg_ctrl_reg[3]_2 ;
  output \reg_ctrl_reg[3]_3 ;
  output \reg_ctrl_reg[3]_4 ;
  output \reg_ctrl_reg[3]_5 ;
  output \reg_ctrl_reg[3]_6 ;
  output \reg_ctrl_reg[3]_7 ;
  output \reg_ctrl_reg[3]_8 ;
  output \reg_ctrl_reg[3]_9 ;
  output \reg_ctrl_reg[3]_10 ;
  output \reg_ctrl_reg[3]_11 ;
  output \reg_ctrl_reg[3]_12 ;
  output \counter_reg[13]_1 ;
  output \prescaler_reg[14]_0 ;
  output [0:0]\counter_reg[31]_2 ;
  output [0:0]\counter_reg[31]_3 ;
  output \reg_ctrl_reg[3]_13 ;
  output [31:0]\capture_val_reg[31]_0 ;
  input irq_reg_0;
  input CLK;
  input ext_meas_d_reg_1;
  input clk_tick7_out;
  input ext_meas_i_IBUF;
  input capture_i_IBUF;
  input [3:0]S;
  input [3:0]\op_done1_inferred__0/i__carry__1_0 ;
  input [2:0]irq_reg_1;
  input op_done_reg_1;
  input \counter_reg[30]_0 ;
  input [3:0]Q;
  input [12:0]\counter_reg[29]_0 ;
  input [12:0]D;
  input \counter_reg[27]_0 ;
  input \counter_reg[12]_0 ;
  input \counter_reg[7]_0 ;
  input \counter_reg[6]_0 ;
  input \counter_reg[3]_0 ;
  input \counter_reg[2]_0 ;
  input \counter_reg[0]_0 ;
  input [5:0]paddr_IBUF;
  input penable_IBUF;
  input psel_IBUF;
  input pwrite_IBUF;
  input [31:0]pwm_o_OBUF_inst_i_3_0;
  input [3:0]pwm_o_OBUF_inst_i_31_0;
  input [3:0]pwm_o_OBUF_inst_i_13_0;
  input [3:0]pwm_o_OBUF_inst_i_3_1;
  input [3:0]pwm_o_OBUF_inst_i_1;
  input [3:0]pwm_o_OBUF_inst_i_22_0;
  input [3:0]pwm_o_OBUF_inst_i_4_0;
  input [3:0]pwm_o_OBUF_inst_i_2_0;
  input [3:0]pwm_o_OBUF_inst_i_1_0;
  input [15:0]\prescaler_reg[15]_0 ;
  input [0:0]E;
  input [18:0]\counter_reg[31]_4 ;
  input [0:0]\prescaler_reg[15]_1 ;

  wire CLK;
  wire [0:0]CO;
  wire [12:0]D;
  wire [0:0]E;
  wire [3:0]Q;
  wire [3:0]S;
  wire capture_d;
  wire capture_i_IBUF;
  wire capture_re;
  wire capture_stb;
  wire [31:0]\capture_val_reg[31]_0 ;
  wire clk_tick;
  wire clk_tick7_out;
  wire [29:1]counter0;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[0]_i_2_n_0 ;
  wire \counter[11]_i_1_n_0 ;
  wire \counter[11]_i_2_n_0 ;
  wire \counter[12]_i_6_n_0 ;
  wire \counter[12]_i_7_n_0 ;
  wire \counter[12]_i_8_n_0 ;
  wire \counter[12]_i_9_n_0 ;
  wire \counter[16]_i_10_n_0 ;
  wire \counter[16]_i_7_n_0 ;
  wire \counter[16]_i_8_n_0 ;
  wire \counter[16]_i_9_n_0 ;
  wire \counter[17]_i_1_n_0 ;
  wire \counter[17]_i_2_n_0 ;
  wire \counter[1]_i_1_n_0 ;
  wire \counter[1]_i_2_n_0 ;
  wire \counter[20]_i_1_n_0 ;
  wire \counter[20]_i_2_n_0 ;
  wire \counter[20]_i_5_n_0 ;
  wire \counter[20]_i_6_n_0 ;
  wire \counter[20]_i_7_n_0 ;
  wire \counter[20]_i_8_n_0 ;
  wire \counter[21]_i_1_n_0 ;
  wire \counter[21]_i_2_n_0 ;
  wire \counter[23]_i_1_n_0 ;
  wire \counter[23]_i_2_n_0 ;
  wire \counter[24]_i_1_n_0 ;
  wire \counter[24]_i_2_n_0 ;
  wire \counter[24]_i_5_n_0 ;
  wire \counter[24]_i_6_n_0 ;
  wire \counter[24]_i_7_n_0 ;
  wire \counter[24]_i_8_n_0 ;
  wire \counter[27]_i_1_n_0 ;
  wire \counter[27]_i_2_n_0 ;
  wire \counter[28]_i_10_n_0 ;
  wire \counter[28]_i_7_n_0 ;
  wire \counter[28]_i_8_n_0 ;
  wire \counter[28]_i_9_n_0 ;
  wire \counter[29]_i_1_n_0 ;
  wire \counter[29]_i_2_n_0 ;
  wire \counter[29]_i_3_n_0 ;
  wire \counter[29]_i_5_n_0 ;
  wire \counter[29]_i_6_n_0 ;
  wire \counter[29]_i_7_n_0 ;
  wire \counter[30]_i_5_n_0 ;
  wire \counter[30]_i_6_n_0 ;
  wire \counter[31]_i_10_n_0 ;
  wire \counter[31]_i_11_n_0 ;
  wire \counter[31]_i_9_n_0 ;
  wire \counter[4]_i_1_n_0 ;
  wire \counter[4]_i_2_n_0 ;
  wire \counter[4]_i_5_n_0 ;
  wire \counter[4]_i_6_n_0 ;
  wire \counter[4]_i_7_n_0 ;
  wire \counter[4]_i_8_n_0 ;
  wire \counter[5]_i_1_n_0 ;
  wire \counter[5]_i_2_n_0 ;
  wire \counter[8]_i_1_n_0 ;
  wire \counter[8]_i_2_n_0 ;
  wire \counter[8]_i_5_n_0 ;
  wire \counter[8]_i_6_n_0 ;
  wire \counter[8]_i_7_n_0 ;
  wire \counter[8]_i_8_n_0 ;
  wire \counter_reg[0]_0 ;
  wire \counter_reg[12]_0 ;
  wire \counter_reg[12]_i_4_n_0 ;
  wire \counter_reg[12]_i_4_n_1 ;
  wire \counter_reg[12]_i_4_n_2 ;
  wire \counter_reg[12]_i_4_n_3 ;
  wire \counter_reg[12]_i_5_n_0 ;
  wire \counter_reg[12]_i_5_n_1 ;
  wire \counter_reg[12]_i_5_n_2 ;
  wire \counter_reg[12]_i_5_n_3 ;
  wire \counter_reg[12]_i_5_n_4 ;
  wire \counter_reg[12]_i_5_n_5 ;
  wire \counter_reg[12]_i_5_n_6 ;
  wire \counter_reg[12]_i_5_n_7 ;
  wire \counter_reg[13]_0 ;
  wire \counter_reg[13]_1 ;
  wire \counter_reg[16]_i_5_n_0 ;
  wire \counter_reg[16]_i_5_n_1 ;
  wire \counter_reg[16]_i_5_n_2 ;
  wire \counter_reg[16]_i_5_n_3 ;
  wire \counter_reg[16]_i_6_n_0 ;
  wire \counter_reg[16]_i_6_n_1 ;
  wire \counter_reg[16]_i_6_n_2 ;
  wire \counter_reg[16]_i_6_n_3 ;
  wire \counter_reg[16]_i_6_n_4 ;
  wire \counter_reg[16]_i_6_n_5 ;
  wire \counter_reg[16]_i_6_n_6 ;
  wire \counter_reg[16]_i_6_n_7 ;
  wire \counter_reg[19]_0 ;
  wire \counter_reg[20]_i_3_n_0 ;
  wire \counter_reg[20]_i_3_n_1 ;
  wire \counter_reg[20]_i_3_n_2 ;
  wire \counter_reg[20]_i_3_n_3 ;
  wire \counter_reg[20]_i_4_n_0 ;
  wire \counter_reg[20]_i_4_n_1 ;
  wire \counter_reg[20]_i_4_n_2 ;
  wire \counter_reg[20]_i_4_n_3 ;
  wire \counter_reg[20]_i_4_n_4 ;
  wire \counter_reg[20]_i_4_n_5 ;
  wire \counter_reg[20]_i_4_n_6 ;
  wire \counter_reg[20]_i_4_n_7 ;
  wire \counter_reg[24]_i_3_n_0 ;
  wire \counter_reg[24]_i_3_n_1 ;
  wire \counter_reg[24]_i_3_n_2 ;
  wire \counter_reg[24]_i_3_n_3 ;
  wire \counter_reg[24]_i_4_n_0 ;
  wire \counter_reg[24]_i_4_n_1 ;
  wire \counter_reg[24]_i_4_n_2 ;
  wire \counter_reg[24]_i_4_n_3 ;
  wire \counter_reg[24]_i_4_n_4 ;
  wire \counter_reg[24]_i_4_n_5 ;
  wire \counter_reg[24]_i_4_n_6 ;
  wire \counter_reg[24]_i_4_n_7 ;
  wire \counter_reg[25]_0 ;
  wire \counter_reg[27]_0 ;
  wire \counter_reg[28]_i_5_n_0 ;
  wire \counter_reg[28]_i_5_n_1 ;
  wire \counter_reg[28]_i_5_n_2 ;
  wire \counter_reg[28]_i_5_n_3 ;
  wire \counter_reg[28]_i_5_n_4 ;
  wire \counter_reg[28]_i_5_n_5 ;
  wire \counter_reg[28]_i_5_n_6 ;
  wire \counter_reg[28]_i_5_n_7 ;
  wire \counter_reg[28]_i_6_n_0 ;
  wire \counter_reg[28]_i_6_n_1 ;
  wire \counter_reg[28]_i_6_n_2 ;
  wire \counter_reg[28]_i_6_n_3 ;
  wire [12:0]\counter_reg[29]_0 ;
  wire \counter_reg[2]_0 ;
  wire \counter_reg[30]_0 ;
  wire [31:0]\counter_reg[31]_0 ;
  wire [18:0]\counter_reg[31]_1 ;
  wire [0:0]\counter_reg[31]_2 ;
  wire [0:0]\counter_reg[31]_3 ;
  wire [18:0]\counter_reg[31]_4 ;
  wire \counter_reg[31]_i_7_n_2 ;
  wire \counter_reg[31]_i_7_n_3 ;
  wire \counter_reg[31]_i_8_n_2 ;
  wire \counter_reg[31]_i_8_n_3 ;
  wire \counter_reg[31]_i_8_n_5 ;
  wire \counter_reg[31]_i_8_n_6 ;
  wire \counter_reg[31]_i_8_n_7 ;
  wire \counter_reg[3]_0 ;
  wire \counter_reg[4]_i_3_n_0 ;
  wire \counter_reg[4]_i_3_n_1 ;
  wire \counter_reg[4]_i_3_n_2 ;
  wire \counter_reg[4]_i_3_n_3 ;
  wire \counter_reg[4]_i_4_n_0 ;
  wire \counter_reg[4]_i_4_n_1 ;
  wire \counter_reg[4]_i_4_n_2 ;
  wire \counter_reg[4]_i_4_n_3 ;
  wire \counter_reg[4]_i_4_n_4 ;
  wire \counter_reg[4]_i_4_n_5 ;
  wire \counter_reg[4]_i_4_n_6 ;
  wire \counter_reg[4]_i_4_n_7 ;
  wire \counter_reg[6]_0 ;
  wire \counter_reg[7]_0 ;
  wire \counter_reg[8]_i_3_n_0 ;
  wire \counter_reg[8]_i_3_n_1 ;
  wire \counter_reg[8]_i_3_n_2 ;
  wire \counter_reg[8]_i_3_n_3 ;
  wire \counter_reg[8]_i_4_n_0 ;
  wire \counter_reg[8]_i_4_n_1 ;
  wire \counter_reg[8]_i_4_n_2 ;
  wire \counter_reg[8]_i_4_n_3 ;
  wire \counter_reg[8]_i_4_n_4 ;
  wire \counter_reg[8]_i_4_n_5 ;
  wire \counter_reg[8]_i_4_n_6 ;
  wire \counter_reg[8]_i_4_n_7 ;
  wire [15:1]data1;
  wire ext_meas_d;
  wire ext_meas_d_reg_0;
  wire ext_meas_d_reg_1;
  wire ext_meas_i_IBUF;
  wire i__carry__0_i_1__0_n_0;
  wire i__carry__0_i_2__0_n_0;
  wire i__carry__0_i_3__0_n_0;
  wire i__carry__0_i_4__0_n_0;
  wire i__carry__1_i_1__0_n_0;
  wire i__carry__1_i_2__0_n_0;
  wire i__carry__1_i_3__0_n_0;
  wire i__carry__1_i_4__0_n_0;
  wire i__carry__2_i_1_n_0;
  wire i__carry__2_i_2_n_0;
  wire i__carry__2_i_3_n_0;
  wire i__carry_i_1__0_n_0;
  wire i__carry_i_2__0_n_0;
  wire i__carry_i_3__0_n_0;
  wire i__carry_i_4__0_n_0;
  wire irq_i_10_n_0;
  wire irq_i_11_n_0;
  wire irq_i_6_n_0;
  wire irq_i_7_n_0;
  wire irq_i_8_n_0;
  wire irq_i_9_n_0;
  wire irq_reg_0;
  wire [2:0]irq_reg_1;
  wire \op_done1_inferred__0/i__carry__0_n_0 ;
  wire \op_done1_inferred__0/i__carry__0_n_1 ;
  wire \op_done1_inferred__0/i__carry__0_n_2 ;
  wire \op_done1_inferred__0/i__carry__0_n_3 ;
  wire [3:0]\op_done1_inferred__0/i__carry__1_0 ;
  wire \op_done1_inferred__0/i__carry__1_n_2 ;
  wire \op_done1_inferred__0/i__carry__1_n_3 ;
  wire \op_done1_inferred__0/i__carry_n_0 ;
  wire \op_done1_inferred__0/i__carry_n_1 ;
  wire \op_done1_inferred__0/i__carry_n_2 ;
  wire \op_done1_inferred__0/i__carry_n_3 ;
  wire op_done_reg_0;
  wire op_done_reg_1;
  wire [15:0]p_1_in;
  wire [5:0]paddr_IBUF;
  wire penable;
  wire penable_IBUF;
  wire [15:0]prescaler;
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
  wire \prescaler[15]_i_3_n_0 ;
  wire \prescaler[15]_i_4_n_0 ;
  wire \prescaler[15]_i_5_n_0 ;
  wire \prescaler[15]_i_6_n_0 ;
  wire \prescaler_reg[14]_0 ;
  wire [15:0]\prescaler_reg[15]_0 ;
  wire [0:0]\prescaler_reg[15]_1 ;
  wire psel_IBUF;
  wire [3:0]pwm_o_OBUF_inst_i_1;
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
  wire [3:0]pwm_o_OBUF_inst_i_2_0;
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
  wire [31:0]pwm_o_OBUF_inst_i_3_0;
  wire [3:0]pwm_o_OBUF_inst_i_3_1;
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
  wire pwrite_IBUF;
  wire \reg_ctrl_reg[1] ;
  wire \reg_ctrl_reg[1]_0 ;
  wire \reg_ctrl_reg[1]_1 ;
  wire \reg_ctrl_reg[1]_2 ;
  wire \reg_ctrl_reg[1]_3 ;
  wire \reg_ctrl_reg[1]_4 ;
  wire \reg_ctrl_reg[3] ;
  wire \reg_ctrl_reg[3]_0 ;
  wire \reg_ctrl_reg[3]_1 ;
  wire \reg_ctrl_reg[3]_10 ;
  wire \reg_ctrl_reg[3]_11 ;
  wire \reg_ctrl_reg[3]_12 ;
  wire \reg_ctrl_reg[3]_13 ;
  wire \reg_ctrl_reg[3]_2 ;
  wire \reg_ctrl_reg[3]_3 ;
  wire \reg_ctrl_reg[3]_4 ;
  wire \reg_ctrl_reg[3]_5 ;
  wire \reg_ctrl_reg[3]_6 ;
  wire \reg_ctrl_reg[3]_7 ;
  wire \reg_ctrl_reg[3]_8 ;
  wire \reg_ctrl_reg[3]_9 ;
  wire reg_load;
  wire trigger_o_OBUF;
  wire [3:2]\NLW_counter_reg[31]_i_7_CO_UNCONNECTED ;
  wire [3:3]\NLW_counter_reg[31]_i_7_O_UNCONNECTED ;
  wire [3:2]\NLW_counter_reg[31]_i_8_CO_UNCONNECTED ;
  wire [3:3]\NLW_counter_reg[31]_i_8_O_UNCONNECTED ;
  wire [3:0]\NLW_op_done1_inferred__0/i__carry_O_UNCONNECTED ;
  wire [3:0]\NLW_op_done1_inferred__0/i__carry__0_O_UNCONNECTED ;
  wire [3:3]\NLW_op_done1_inferred__0/i__carry__1_CO_UNCONNECTED ;
  wire [3:0]\NLW_op_done1_inferred__0/i__carry__1_O_UNCONNECTED ;
  wire [3:2]\NLW_prescaler0_inferred__0/i__carry__2_CO_UNCONNECTED ;
  wire [3:3]\NLW_prescaler0_inferred__0/i__carry__2_O_UNCONNECTED ;
  wire [3:0]NLW_pwm_o_OBUF_inst_i_13_O_UNCONNECTED;
  wire [3:0]NLW_pwm_o_OBUF_inst_i_2_O_UNCONNECTED;
  wire [3:0]NLW_pwm_o_OBUF_inst_i_22_O_UNCONNECTED;
  wire [3:0]NLW_pwm_o_OBUF_inst_i_3_O_UNCONNECTED;
  wire [3:0]NLW_pwm_o_OBUF_inst_i_31_O_UNCONNECTED;
  wire [3:0]NLW_pwm_o_OBUF_inst_i_4_O_UNCONNECTED;
  wire [3:0]NLW_pwm_o_OBUF_inst_i_40_O_UNCONNECTED;
  wire [3:0]NLW_pwm_o_OBUF_inst_i_49_O_UNCONNECTED;

  FDCE capture_d_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(ext_meas_d_reg_1),
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
        .CLR(ext_meas_d_reg_1),
        .D(capture_re),
        .Q(capture_stb));
  FDCE \capture_val_reg[0] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [0]),
        .Q(\capture_val_reg[31]_0 [0]));
  FDCE \capture_val_reg[10] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [10]),
        .Q(\capture_val_reg[31]_0 [10]));
  FDCE \capture_val_reg[11] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [11]),
        .Q(\capture_val_reg[31]_0 [11]));
  FDCE \capture_val_reg[12] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [12]),
        .Q(\capture_val_reg[31]_0 [12]));
  FDCE \capture_val_reg[13] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [13]),
        .Q(\capture_val_reg[31]_0 [13]));
  FDCE \capture_val_reg[14] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [14]),
        .Q(\capture_val_reg[31]_0 [14]));
  FDCE \capture_val_reg[15] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [15]),
        .Q(\capture_val_reg[31]_0 [15]));
  FDCE \capture_val_reg[16] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [16]),
        .Q(\capture_val_reg[31]_0 [16]));
  FDCE \capture_val_reg[17] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [17]),
        .Q(\capture_val_reg[31]_0 [17]));
  FDCE \capture_val_reg[18] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [18]),
        .Q(\capture_val_reg[31]_0 [18]));
  FDCE \capture_val_reg[19] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [19]),
        .Q(\capture_val_reg[31]_0 [19]));
  FDCE \capture_val_reg[1] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [1]),
        .Q(\capture_val_reg[31]_0 [1]));
  FDCE \capture_val_reg[20] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [20]),
        .Q(\capture_val_reg[31]_0 [20]));
  FDCE \capture_val_reg[21] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [21]),
        .Q(\capture_val_reg[31]_0 [21]));
  FDCE \capture_val_reg[22] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [22]),
        .Q(\capture_val_reg[31]_0 [22]));
  FDCE \capture_val_reg[23] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [23]),
        .Q(\capture_val_reg[31]_0 [23]));
  FDCE \capture_val_reg[24] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [24]),
        .Q(\capture_val_reg[31]_0 [24]));
  FDCE \capture_val_reg[25] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [25]),
        .Q(\capture_val_reg[31]_0 [25]));
  FDCE \capture_val_reg[26] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [26]),
        .Q(\capture_val_reg[31]_0 [26]));
  FDCE \capture_val_reg[27] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [27]),
        .Q(\capture_val_reg[31]_0 [27]));
  FDCE \capture_val_reg[28] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [28]),
        .Q(\capture_val_reg[31]_0 [28]));
  FDCE \capture_val_reg[29] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [29]),
        .Q(\capture_val_reg[31]_0 [29]));
  FDCE \capture_val_reg[2] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [2]),
        .Q(\capture_val_reg[31]_0 [2]));
  FDCE \capture_val_reg[30] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [30]),
        .Q(\capture_val_reg[31]_0 [30]));
  FDCE \capture_val_reg[31] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [31]),
        .Q(\capture_val_reg[31]_0 [31]));
  FDCE \capture_val_reg[3] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [3]),
        .Q(\capture_val_reg[31]_0 [3]));
  FDCE \capture_val_reg[4] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [4]),
        .Q(\capture_val_reg[31]_0 [4]));
  FDCE \capture_val_reg[5] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [5]),
        .Q(\capture_val_reg[31]_0 [5]));
  FDCE \capture_val_reg[6] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [6]),
        .Q(\capture_val_reg[31]_0 [6]));
  FDCE \capture_val_reg[7] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [7]),
        .Q(\capture_val_reg[31]_0 [7]));
  FDCE \capture_val_reg[8] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [8]),
        .Q(\capture_val_reg[31]_0 [8]));
  FDCE \capture_val_reg[9] 
       (.C(CLK),
        .CE(capture_re),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_0 [9]),
        .Q(\capture_val_reg[31]_0 [9]));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    clk_tick_i_2
       (.I0(\prescaler[15]_i_6_n_0 ),
        .I1(prescaler[14]),
        .I2(prescaler[13]),
        .I3(prescaler[15]),
        .I4(prescaler[6]),
        .I5(\prescaler[15]_i_3_n_0 ),
        .O(\prescaler_reg[14]_0 ));
  FDCE clk_tick_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(ext_meas_d_reg_1),
        .D(clk_tick7_out),
        .Q(clk_tick));
  LUT6 #(
    .INIT(64'hABFF0155ABAB0101)) 
    \counter[0]_i_1 
       (.I0(reg_load),
        .I1(\counter[0]_i_2_n_0 ),
        .I2(\counter_reg[31]_0 [0]),
        .I3(\counter_reg[0]_0 ),
        .I4(D[0]),
        .I5(\counter_reg[29]_0 [0]),
        .O(\counter[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF000000040004)) 
    \counter[0]_i_2 
       (.I0(\counter_reg[13]_0 ),
        .I1(\counter_reg[25]_0 ),
        .I2(irq_i_6_n_0),
        .I3(irq_i_7_n_0),
        .I4(CO),
        .I5(Q[2]),
        .O(\counter[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AAAAAA8A)) 
    \counter[10]_i_2 
       (.I0(\counter_reg[12]_i_5_n_6 ),
        .I1(\counter_reg[13]_0 ),
        .I2(\counter_reg[25]_0 ),
        .I3(irq_i_6_n_0),
        .I4(irq_i_7_n_0),
        .I5(Q[2]),
        .O(\reg_ctrl_reg[3]_0 ));
  LUT6 #(
    .INIT(64'hFBFA5150FFFA5550)) 
    \counter[11]_i_1 
       (.I0(reg_load),
        .I1(\counter[29]_i_2_n_0 ),
        .I2(\counter[11]_i_2_n_0 ),
        .I3(\counter_reg[29]_0 [5]),
        .I4(D[5]),
        .I5(\counter_reg[27]_0 ),
        .O(\counter[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4F404F4040404F40)) 
    \counter[11]_i_2 
       (.I0(CO),
        .I1(counter0[11]),
        .I2(Q[2]),
        .I3(\counter_reg[12]_i_5_n_5 ),
        .I4(\counter[29]_i_5_n_0 ),
        .I5(\counter_reg[19]_0 ),
        .O(\counter[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAC0AAAA)) 
    \counter[12]_i_3 
       (.I0(\counter_reg[12]_i_5_n_4 ),
        .I1(\counter_reg[12]_0 ),
        .I2(Q[0]),
        .I3(\counter_reg[19]_0 ),
        .I4(\counter_reg[25]_0 ),
        .I5(\counter_reg[13]_0 ),
        .O(\reg_ctrl_reg[1]_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[12]_i_6 
       (.I0(\counter_reg[31]_0 [12]),
        .O(\counter[12]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[12]_i_7 
       (.I0(\counter_reg[31]_0 [11]),
        .O(\counter[12]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[12]_i_8 
       (.I0(\counter_reg[31]_0 [10]),
        .O(\counter[12]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[12]_i_9 
       (.I0(\counter_reg[31]_0 [9]),
        .O(\counter[12]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AAAAAA8A)) 
    \counter[13]_i_2 
       (.I0(\counter_reg[16]_i_6_n_7 ),
        .I1(\counter_reg[13]_0 ),
        .I2(\counter_reg[25]_0 ),
        .I3(irq_i_6_n_0),
        .I4(irq_i_7_n_0),
        .I5(Q[2]),
        .O(\reg_ctrl_reg[3]_1 ));
  LUT6 #(
    .INIT(64'h00000000AAAAAA8A)) 
    \counter[14]_i_2 
       (.I0(\counter_reg[16]_i_6_n_6 ),
        .I1(\counter_reg[13]_0 ),
        .I2(\counter_reg[25]_0 ),
        .I3(irq_i_6_n_0),
        .I4(irq_i_7_n_0),
        .I5(Q[2]),
        .O(\reg_ctrl_reg[3]_2 ));
  LUT6 #(
    .INIT(64'h00000000AAAAAA8A)) 
    \counter[15]_i_4 
       (.I0(\counter_reg[16]_i_6_n_5 ),
        .I1(\counter_reg[13]_0 ),
        .I2(\counter_reg[25]_0 ),
        .I3(irq_i_6_n_0),
        .I4(irq_i_7_n_0),
        .I5(Q[2]),
        .O(\reg_ctrl_reg[3]_3 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[16]_i_10 
       (.I0(\counter_reg[31]_0 [13]),
        .O(\counter[16]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AAAAAA8A)) 
    \counter[16]_i_4 
       (.I0(\counter_reg[16]_i_6_n_4 ),
        .I1(\counter_reg[13]_0 ),
        .I2(\counter_reg[25]_0 ),
        .I3(irq_i_6_n_0),
        .I4(irq_i_7_n_0),
        .I5(Q[2]),
        .O(\reg_ctrl_reg[3]_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[16]_i_7 
       (.I0(\counter_reg[31]_0 [16]),
        .O(\counter[16]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[16]_i_8 
       (.I0(\counter_reg[31]_0 [15]),
        .O(\counter[16]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[16]_i_9 
       (.I0(\counter_reg[31]_0 [14]),
        .O(\counter[16]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFBFA5150FFFA5550)) 
    \counter[17]_i_1 
       (.I0(reg_load),
        .I1(\counter[29]_i_2_n_0 ),
        .I2(\counter[17]_i_2_n_0 ),
        .I3(\counter_reg[29]_0 [6]),
        .I4(D[6]),
        .I5(\counter_reg[27]_0 ),
        .O(\counter[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4F404F4040404F40)) 
    \counter[17]_i_2 
       (.I0(CO),
        .I1(counter0[17]),
        .I2(Q[2]),
        .I3(\counter_reg[20]_i_4_n_7 ),
        .I4(\counter[29]_i_5_n_0 ),
        .I5(\counter_reg[19]_0 ),
        .O(\counter[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AAAAAA8A)) 
    \counter[18]_i_4 
       (.I0(\counter_reg[20]_i_4_n_6 ),
        .I1(\counter_reg[13]_0 ),
        .I2(\counter_reg[25]_0 ),
        .I3(irq_i_6_n_0),
        .I4(irq_i_7_n_0),
        .I5(Q[2]),
        .O(\reg_ctrl_reg[3]_5 ));
  LUT6 #(
    .INIT(64'h00000000AAAAAA8A)) 
    \counter[19]_i_4 
       (.I0(\counter_reg[20]_i_4_n_5 ),
        .I1(\counter_reg[13]_0 ),
        .I2(\counter_reg[25]_0 ),
        .I3(irq_i_6_n_0),
        .I4(irq_i_7_n_0),
        .I5(Q[2]),
        .O(\reg_ctrl_reg[3]_6 ));
  LUT6 #(
    .INIT(64'hFBFA5150FFFA5550)) 
    \counter[1]_i_1 
       (.I0(reg_load),
        .I1(\counter[29]_i_2_n_0 ),
        .I2(\counter[1]_i_2_n_0 ),
        .I3(\counter_reg[29]_0 [1]),
        .I4(D[1]),
        .I5(\counter_reg[27]_0 ),
        .O(\counter[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4F404F4040404F40)) 
    \counter[1]_i_2 
       (.I0(CO),
        .I1(counter0[1]),
        .I2(Q[2]),
        .I3(\counter_reg[4]_i_4_n_7 ),
        .I4(\counter[29]_i_5_n_0 ),
        .I5(\counter_reg[19]_0 ),
        .O(\counter[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFBFA5150FFFA5550)) 
    \counter[20]_i_1 
       (.I0(reg_load),
        .I1(\counter[29]_i_2_n_0 ),
        .I2(\counter[20]_i_2_n_0 ),
        .I3(\counter_reg[29]_0 [7]),
        .I4(D[7]),
        .I5(\counter_reg[27]_0 ),
        .O(\counter[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4F404F4040404F40)) 
    \counter[20]_i_2 
       (.I0(CO),
        .I1(counter0[20]),
        .I2(Q[2]),
        .I3(\counter_reg[20]_i_4_n_4 ),
        .I4(\counter[29]_i_5_n_0 ),
        .I5(\counter_reg[19]_0 ),
        .O(\counter[20]_i_2_n_0 ));
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
    .INIT(64'hFBFA5150FFFA5550)) 
    \counter[21]_i_1 
       (.I0(reg_load),
        .I1(\counter[29]_i_2_n_0 ),
        .I2(\counter[21]_i_2_n_0 ),
        .I3(\counter_reg[29]_0 [8]),
        .I4(D[8]),
        .I5(\counter_reg[27]_0 ),
        .O(\counter[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4F404F4040404F40)) 
    \counter[21]_i_2 
       (.I0(CO),
        .I1(counter0[21]),
        .I2(Q[2]),
        .I3(\counter_reg[24]_i_4_n_7 ),
        .I4(\counter[29]_i_5_n_0 ),
        .I5(\counter_reg[19]_0 ),
        .O(\counter[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AAAAAA8A)) 
    \counter[22]_i_4 
       (.I0(\counter_reg[24]_i_4_n_6 ),
        .I1(\counter_reg[13]_0 ),
        .I2(\counter_reg[25]_0 ),
        .I3(irq_i_6_n_0),
        .I4(irq_i_7_n_0),
        .I5(Q[2]),
        .O(\reg_ctrl_reg[3]_7 ));
  LUT6 #(
    .INIT(64'hFBFA5150FFFA5550)) 
    \counter[23]_i_1 
       (.I0(reg_load),
        .I1(\counter[29]_i_2_n_0 ),
        .I2(\counter[23]_i_2_n_0 ),
        .I3(\counter_reg[29]_0 [9]),
        .I4(D[9]),
        .I5(\counter_reg[27]_0 ),
        .O(\counter[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4F404F4040404F40)) 
    \counter[23]_i_2 
       (.I0(CO),
        .I1(counter0[23]),
        .I2(Q[2]),
        .I3(\counter_reg[24]_i_4_n_5 ),
        .I4(\counter[29]_i_5_n_0 ),
        .I5(\counter_reg[19]_0 ),
        .O(\counter[23]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFBFA5150FFFA5550)) 
    \counter[24]_i_1 
       (.I0(reg_load),
        .I1(\counter[29]_i_2_n_0 ),
        .I2(\counter[24]_i_2_n_0 ),
        .I3(\counter_reg[29]_0 [10]),
        .I4(D[10]),
        .I5(\counter_reg[27]_0 ),
        .O(\counter[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4F404F4040404F40)) 
    \counter[24]_i_2 
       (.I0(CO),
        .I1(counter0[24]),
        .I2(Q[2]),
        .I3(\counter_reg[24]_i_4_n_4 ),
        .I4(\counter[29]_i_5_n_0 ),
        .I5(\counter_reg[19]_0 ),
        .O(\counter[24]_i_2_n_0 ));
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
    .INIT(64'h00000000AAAAAA8A)) 
    \counter[25]_i_4 
       (.I0(\counter_reg[28]_i_5_n_7 ),
        .I1(\counter_reg[13]_0 ),
        .I2(\counter_reg[25]_0 ),
        .I3(irq_i_6_n_0),
        .I4(irq_i_7_n_0),
        .I5(Q[2]),
        .O(\reg_ctrl_reg[3]_8 ));
  LUT6 #(
    .INIT(64'h00000000AAAAAA8A)) 
    \counter[26]_i_2 
       (.I0(\counter_reg[28]_i_5_n_6 ),
        .I1(\counter_reg[13]_0 ),
        .I2(\counter_reg[25]_0 ),
        .I3(irq_i_6_n_0),
        .I4(irq_i_7_n_0),
        .I5(Q[2]),
        .O(\reg_ctrl_reg[3]_9 ));
  LUT6 #(
    .INIT(64'hFBFA5150FFFA5550)) 
    \counter[27]_i_1 
       (.I0(reg_load),
        .I1(\counter[29]_i_2_n_0 ),
        .I2(\counter[27]_i_2_n_0 ),
        .I3(\counter_reg[29]_0 [11]),
        .I4(D[11]),
        .I5(\counter_reg[27]_0 ),
        .O(\counter[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4F404F4040404F40)) 
    \counter[27]_i_2 
       (.I0(CO),
        .I1(counter0[27]),
        .I2(Q[2]),
        .I3(\counter_reg[28]_i_5_n_5 ),
        .I4(\counter[29]_i_5_n_0 ),
        .I5(\counter_reg[19]_0 ),
        .O(\counter[27]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[28]_i_10 
       (.I0(\counter_reg[31]_0 [25]),
        .O(\counter[28]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AAAAAA8A)) 
    \counter[28]_i_3 
       (.I0(\counter_reg[28]_i_5_n_4 ),
        .I1(\counter_reg[13]_0 ),
        .I2(\counter_reg[25]_0 ),
        .I3(irq_i_6_n_0),
        .I4(irq_i_7_n_0),
        .I5(Q[2]),
        .O(\reg_ctrl_reg[3]_10 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[28]_i_7 
       (.I0(\counter_reg[31]_0 [28]),
        .O(\counter[28]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[28]_i_8 
       (.I0(\counter_reg[31]_0 [27]),
        .O(\counter[28]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[28]_i_9 
       (.I0(\counter_reg[31]_0 [26]),
        .O(\counter[28]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFBFA5150FFFA5550)) 
    \counter[29]_i_1 
       (.I0(reg_load),
        .I1(\counter[29]_i_2_n_0 ),
        .I2(\counter[29]_i_3_n_0 ),
        .I3(\counter_reg[29]_0 [12]),
        .I4(D[12]),
        .I5(\counter_reg[27]_0 ),
        .O(\counter[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFEFFFFFFFFF)) 
    \counter[29]_i_2 
       (.I0(Q[2]),
        .I1(\counter_reg[13]_0 ),
        .I2(\counter_reg[25]_0 ),
        .I3(irq_i_6_n_0),
        .I4(irq_i_7_n_0),
        .I5(Q[0]),
        .O(\counter[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4F404F4040404F40)) 
    \counter[29]_i_3 
       (.I0(CO),
        .I1(counter0[29]),
        .I2(Q[2]),
        .I3(\counter_reg[31]_i_8_n_7 ),
        .I4(\counter[29]_i_5_n_0 ),
        .I5(\counter_reg[19]_0 ),
        .O(\counter[29]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \counter[29]_i_5 
       (.I0(irq_i_9_n_0),
        .I1(\counter[29]_i_6_n_0 ),
        .I2(irq_i_8_n_0),
        .I3(\counter[29]_i_7_n_0 ),
        .O(\counter[29]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \counter[29]_i_6 
       (.I0(\counter_reg[31]_0 [27]),
        .I1(\counter_reg[31]_0 [24]),
        .I2(\counter_reg[31]_0 [26]),
        .I3(\counter_reg[31]_0 [25]),
        .O(\counter[29]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \counter[29]_i_7 
       (.I0(\counter_reg[31]_0 [15]),
        .I1(\counter_reg[31]_0 [12]),
        .I2(\counter_reg[31]_0 [14]),
        .I3(\counter_reg[31]_0 [13]),
        .O(\counter[29]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAC0AAAA)) 
    \counter[2]_i_3 
       (.I0(\counter_reg[4]_i_4_n_6 ),
        .I1(\counter_reg[2]_0 ),
        .I2(Q[0]),
        .I3(\counter_reg[19]_0 ),
        .I4(\counter_reg[25]_0 ),
        .I5(\counter_reg[13]_0 ),
        .O(\reg_ctrl_reg[1]_4 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAC0AAAA)) 
    \counter[30]_i_3 
       (.I0(\counter_reg[31]_i_8_n_6 ),
        .I1(\counter_reg[30]_0 ),
        .I2(Q[0]),
        .I3(\counter_reg[19]_0 ),
        .I4(\counter_reg[25]_0 ),
        .I5(\counter_reg[13]_0 ),
        .O(\reg_ctrl_reg[1] ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \counter[30]_i_4 
       (.I0(irq_i_11_n_0),
        .I1(\counter[30]_i_5_n_0 ),
        .I2(irq_i_10_n_0),
        .I3(\counter[30]_i_6_n_0 ),
        .O(\counter_reg[19]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \counter[30]_i_5 
       (.I0(\counter_reg[31]_0 [3]),
        .I1(\counter_reg[31]_0 [0]),
        .I2(\counter_reg[31]_0 [2]),
        .I3(\counter_reg[31]_0 [1]),
        .O(\counter[30]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \counter[30]_i_6 
       (.I0(\counter_reg[31]_0 [23]),
        .I1(\counter_reg[31]_0 [20]),
        .I2(\counter_reg[31]_0 [22]),
        .I3(\counter_reg[31]_0 [21]),
        .O(\counter[30]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[31]_i_10 
       (.I0(\counter_reg[31]_0 [30]),
        .O(\counter[31]_i_10_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[31]_i_11 
       (.I0(\counter_reg[31]_0 [29]),
        .O(\counter[31]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAABAAAAAAAAA)) 
    \counter[31]_i_4 
       (.I0(Q[2]),
        .I1(\counter_reg[13]_0 ),
        .I2(\counter_reg[25]_0 ),
        .I3(irq_i_6_n_0),
        .I4(irq_i_7_n_0),
        .I5(Q[0]),
        .O(\reg_ctrl_reg[3]_13 ));
  LUT6 #(
    .INIT(64'h00000000AAAAAA8A)) 
    \counter[31]_i_6 
       (.I0(\counter_reg[31]_i_8_n_5 ),
        .I1(\counter_reg[13]_0 ),
        .I2(\counter_reg[25]_0 ),
        .I3(irq_i_6_n_0),
        .I4(irq_i_7_n_0),
        .I5(Q[2]),
        .O(\reg_ctrl_reg[3]_11 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[31]_i_9 
       (.I0(\counter_reg[31]_0 [31]),
        .O(\counter[31]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAC0AAAA)) 
    \counter[3]_i_3 
       (.I0(\counter_reg[4]_i_4_n_5 ),
        .I1(\counter_reg[3]_0 ),
        .I2(Q[0]),
        .I3(\counter_reg[19]_0 ),
        .I4(\counter_reg[25]_0 ),
        .I5(\counter_reg[13]_0 ),
        .O(\reg_ctrl_reg[1]_3 ));
  LUT6 #(
    .INIT(64'hFBFA5150FFFA5550)) 
    \counter[4]_i_1 
       (.I0(reg_load),
        .I1(\counter[29]_i_2_n_0 ),
        .I2(\counter[4]_i_2_n_0 ),
        .I3(\counter_reg[29]_0 [2]),
        .I4(D[2]),
        .I5(\counter_reg[27]_0 ),
        .O(\counter[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4F404F4040404F40)) 
    \counter[4]_i_2 
       (.I0(CO),
        .I1(counter0[4]),
        .I2(Q[2]),
        .I3(\counter_reg[4]_i_4_n_4 ),
        .I4(\counter[29]_i_5_n_0 ),
        .I5(\counter_reg[19]_0 ),
        .O(\counter[4]_i_2_n_0 ));
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
    .INIT(64'hFBFA5150FFFA5550)) 
    \counter[5]_i_1 
       (.I0(reg_load),
        .I1(\counter[29]_i_2_n_0 ),
        .I2(\counter[5]_i_2_n_0 ),
        .I3(\counter_reg[29]_0 [3]),
        .I4(D[3]),
        .I5(\counter_reg[27]_0 ),
        .O(\counter[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4F404F4040404F40)) 
    \counter[5]_i_2 
       (.I0(CO),
        .I1(counter0[5]),
        .I2(Q[2]),
        .I3(\counter_reg[8]_i_4_n_7 ),
        .I4(\counter[29]_i_5_n_0 ),
        .I5(\counter_reg[19]_0 ),
        .O(\counter[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAC0AAAA)) 
    \counter[6]_i_3 
       (.I0(\counter_reg[8]_i_4_n_6 ),
        .I1(\counter_reg[6]_0 ),
        .I2(Q[0]),
        .I3(\counter_reg[19]_0 ),
        .I4(\counter_reg[25]_0 ),
        .I5(\counter_reg[13]_0 ),
        .O(\reg_ctrl_reg[1]_2 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAC0AAAA)) 
    \counter[7]_i_3 
       (.I0(\counter_reg[8]_i_4_n_5 ),
        .I1(\counter_reg[7]_0 ),
        .I2(Q[0]),
        .I3(\counter_reg[19]_0 ),
        .I4(\counter_reg[25]_0 ),
        .I5(\counter_reg[13]_0 ),
        .O(\reg_ctrl_reg[1]_1 ));
  LUT6 #(
    .INIT(64'hFBFA5150FFFA5550)) 
    \counter[8]_i_1 
       (.I0(reg_load),
        .I1(\counter[29]_i_2_n_0 ),
        .I2(\counter[8]_i_2_n_0 ),
        .I3(\counter_reg[29]_0 [4]),
        .I4(D[4]),
        .I5(\counter_reg[27]_0 ),
        .O(\counter[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4F404F4040404F40)) 
    \counter[8]_i_2 
       (.I0(CO),
        .I1(counter0[8]),
        .I2(Q[2]),
        .I3(\counter_reg[8]_i_4_n_4 ),
        .I4(\counter[29]_i_5_n_0 ),
        .I5(\counter_reg[19]_0 ),
        .O(\counter[8]_i_2_n_0 ));
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
    .INIT(64'h00000000AAAAAA8A)) 
    \counter[9]_i_2 
       (.I0(\counter_reg[12]_i_5_n_7 ),
        .I1(\counter_reg[13]_0 ),
        .I2(\counter_reg[25]_0 ),
        .I3(irq_i_6_n_0),
        .I4(irq_i_7_n_0),
        .I5(Q[2]),
        .O(\reg_ctrl_reg[3] ));
  FDCE \counter_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter[0]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [0]));
  FDCE \counter_reg[10] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_4 [5]),
        .Q(\counter_reg[31]_0 [10]));
  FDCE \counter_reg[11] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter[11]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [11]));
  FDCE \counter_reg[12] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_4 [6]),
        .Q(\counter_reg[31]_0 [12]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[12]_i_4 
       (.CI(\counter_reg[8]_i_3_n_0 ),
        .CO({\counter_reg[12]_i_4_n_0 ,\counter_reg[12]_i_4_n_1 ,\counter_reg[12]_i_4_n_2 ,\counter_reg[12]_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[31]_1 [6],counter0[11],\counter_reg[31]_1 [5:4]}),
        .S(\counter_reg[31]_0 [12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[12]_i_5 
       (.CI(\counter_reg[8]_i_4_n_0 ),
        .CO({\counter_reg[12]_i_5_n_0 ,\counter_reg[12]_i_5_n_1 ,\counter_reg[12]_i_5_n_2 ,\counter_reg[12]_i_5_n_3 }),
        .CYINIT(1'b0),
        .DI(\counter_reg[31]_0 [12:9]),
        .O({\counter_reg[12]_i_5_n_4 ,\counter_reg[12]_i_5_n_5 ,\counter_reg[12]_i_5_n_6 ,\counter_reg[12]_i_5_n_7 }),
        .S({\counter[12]_i_6_n_0 ,\counter[12]_i_7_n_0 ,\counter[12]_i_8_n_0 ,\counter[12]_i_9_n_0 }));
  FDCE \counter_reg[13] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_4 [7]),
        .Q(\counter_reg[31]_0 [13]));
  FDCE \counter_reg[14] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_4 [8]),
        .Q(\counter_reg[31]_0 [14]));
  FDCE \counter_reg[15] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_4 [9]),
        .Q(\counter_reg[31]_0 [15]));
  FDCE \counter_reg[16] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_4 [10]),
        .Q(\counter_reg[31]_0 [16]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[16]_i_5 
       (.CI(\counter_reg[12]_i_4_n_0 ),
        .CO({\counter_reg[16]_i_5_n_0 ,\counter_reg[16]_i_5_n_1 ,\counter_reg[16]_i_5_n_2 ,\counter_reg[16]_i_5_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\counter_reg[31]_1 [10:7]),
        .S(\counter_reg[31]_0 [16:13]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[16]_i_6 
       (.CI(\counter_reg[12]_i_5_n_0 ),
        .CO({\counter_reg[16]_i_6_n_0 ,\counter_reg[16]_i_6_n_1 ,\counter_reg[16]_i_6_n_2 ,\counter_reg[16]_i_6_n_3 }),
        .CYINIT(1'b0),
        .DI(\counter_reg[31]_0 [16:13]),
        .O({\counter_reg[16]_i_6_n_4 ,\counter_reg[16]_i_6_n_5 ,\counter_reg[16]_i_6_n_6 ,\counter_reg[16]_i_6_n_7 }),
        .S({\counter[16]_i_7_n_0 ,\counter[16]_i_8_n_0 ,\counter[16]_i_9_n_0 ,\counter[16]_i_10_n_0 }));
  FDCE \counter_reg[17] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter[17]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [17]));
  FDCE \counter_reg[18] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_4 [11]),
        .Q(\counter_reg[31]_0 [18]));
  FDCE \counter_reg[19] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_4 [12]),
        .Q(\counter_reg[31]_0 [19]));
  FDCE \counter_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter[1]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [1]));
  FDCE \counter_reg[20] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter[20]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [20]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[20]_i_3 
       (.CI(\counter_reg[16]_i_5_n_0 ),
        .CO({\counter_reg[20]_i_3_n_0 ,\counter_reg[20]_i_3_n_1 ,\counter_reg[20]_i_3_n_2 ,\counter_reg[20]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({counter0[20],\counter_reg[31]_1 [12:11],counter0[17]}),
        .S(\counter_reg[31]_0 [20:17]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[20]_i_4 
       (.CI(\counter_reg[16]_i_6_n_0 ),
        .CO({\counter_reg[20]_i_4_n_0 ,\counter_reg[20]_i_4_n_1 ,\counter_reg[20]_i_4_n_2 ,\counter_reg[20]_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI(\counter_reg[31]_0 [20:17]),
        .O({\counter_reg[20]_i_4_n_4 ,\counter_reg[20]_i_4_n_5 ,\counter_reg[20]_i_4_n_6 ,\counter_reg[20]_i_4_n_7 }),
        .S({\counter[20]_i_5_n_0 ,\counter[20]_i_6_n_0 ,\counter[20]_i_7_n_0 ,\counter[20]_i_8_n_0 }));
  FDCE \counter_reg[21] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter[21]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [21]));
  FDCE \counter_reg[22] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_4 [13]),
        .Q(\counter_reg[31]_0 [22]));
  FDCE \counter_reg[23] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter[23]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [23]));
  FDCE \counter_reg[24] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter[24]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [24]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[24]_i_3 
       (.CI(\counter_reg[20]_i_3_n_0 ),
        .CO({\counter_reg[24]_i_3_n_0 ,\counter_reg[24]_i_3_n_1 ,\counter_reg[24]_i_3_n_2 ,\counter_reg[24]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({counter0[24:23],\counter_reg[31]_1 [13],counter0[21]}),
        .S(\counter_reg[31]_0 [24:21]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[24]_i_4 
       (.CI(\counter_reg[20]_i_4_n_0 ),
        .CO({\counter_reg[24]_i_4_n_0 ,\counter_reg[24]_i_4_n_1 ,\counter_reg[24]_i_4_n_2 ,\counter_reg[24]_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI(\counter_reg[31]_0 [24:21]),
        .O({\counter_reg[24]_i_4_n_4 ,\counter_reg[24]_i_4_n_5 ,\counter_reg[24]_i_4_n_6 ,\counter_reg[24]_i_4_n_7 }),
        .S({\counter[24]_i_5_n_0 ,\counter[24]_i_6_n_0 ,\counter[24]_i_7_n_0 ,\counter[24]_i_8_n_0 }));
  FDCE \counter_reg[25] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_4 [14]),
        .Q(\counter_reg[31]_0 [25]));
  FDCE \counter_reg[26] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_4 [15]),
        .Q(\counter_reg[31]_0 [26]));
  FDCE \counter_reg[27] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter[27]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [27]));
  FDCE \counter_reg[28] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_4 [16]),
        .Q(\counter_reg[31]_0 [28]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[28]_i_5 
       (.CI(\counter_reg[24]_i_4_n_0 ),
        .CO({\counter_reg[28]_i_5_n_0 ,\counter_reg[28]_i_5_n_1 ,\counter_reg[28]_i_5_n_2 ,\counter_reg[28]_i_5_n_3 }),
        .CYINIT(1'b0),
        .DI(\counter_reg[31]_0 [28:25]),
        .O({\counter_reg[28]_i_5_n_4 ,\counter_reg[28]_i_5_n_5 ,\counter_reg[28]_i_5_n_6 ,\counter_reg[28]_i_5_n_7 }),
        .S({\counter[28]_i_7_n_0 ,\counter[28]_i_8_n_0 ,\counter[28]_i_9_n_0 ,\counter[28]_i_10_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[28]_i_6 
       (.CI(\counter_reg[24]_i_3_n_0 ),
        .CO({\counter_reg[28]_i_6_n_0 ,\counter_reg[28]_i_6_n_1 ,\counter_reg[28]_i_6_n_2 ,\counter_reg[28]_i_6_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[31]_1 [16],counter0[27],\counter_reg[31]_1 [15:14]}),
        .S(\counter_reg[31]_0 [28:25]));
  FDCE \counter_reg[29] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter[29]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [29]));
  FDCE \counter_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_4 [0]),
        .Q(\counter_reg[31]_0 [2]));
  FDCE \counter_reg[30] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_4 [17]),
        .Q(\counter_reg[31]_0 [30]));
  FDCE \counter_reg[31] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_4 [18]),
        .Q(\counter_reg[31]_0 [31]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[31]_i_7 
       (.CI(\counter_reg[28]_i_6_n_0 ),
        .CO({\NLW_counter_reg[31]_i_7_CO_UNCONNECTED [3:2],\counter_reg[31]_i_7_n_2 ,\counter_reg[31]_i_7_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_counter_reg[31]_i_7_O_UNCONNECTED [3],\counter_reg[31]_1 [18:17],counter0[29]}),
        .S({1'b0,\counter_reg[31]_0 [31:29]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[31]_i_8 
       (.CI(\counter_reg[28]_i_5_n_0 ),
        .CO({\NLW_counter_reg[31]_i_8_CO_UNCONNECTED [3:2],\counter_reg[31]_i_8_n_2 ,\counter_reg[31]_i_8_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\counter_reg[31]_0 [30:29]}),
        .O({\NLW_counter_reg[31]_i_8_O_UNCONNECTED [3],\counter_reg[31]_i_8_n_5 ,\counter_reg[31]_i_8_n_6 ,\counter_reg[31]_i_8_n_7 }),
        .S({1'b0,\counter[31]_i_9_n_0 ,\counter[31]_i_10_n_0 ,\counter[31]_i_11_n_0 }));
  FDCE \counter_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_4 [1]),
        .Q(\counter_reg[31]_0 [3]));
  FDCE \counter_reg[4] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter[4]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [4]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[4]_i_3 
       (.CI(1'b0),
        .CO({\counter_reg[4]_i_3_n_0 ,\counter_reg[4]_i_3_n_1 ,\counter_reg[4]_i_3_n_2 ,\counter_reg[4]_i_3_n_3 }),
        .CYINIT(\counter_reg[31]_0 [0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({counter0[4],\counter_reg[31]_1 [1:0],counter0[1]}),
        .S(\counter_reg[31]_0 [4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[4]_i_4 
       (.CI(1'b0),
        .CO({\counter_reg[4]_i_4_n_0 ,\counter_reg[4]_i_4_n_1 ,\counter_reg[4]_i_4_n_2 ,\counter_reg[4]_i_4_n_3 }),
        .CYINIT(\counter_reg[31]_0 [0]),
        .DI(\counter_reg[31]_0 [4:1]),
        .O({\counter_reg[4]_i_4_n_4 ,\counter_reg[4]_i_4_n_5 ,\counter_reg[4]_i_4_n_6 ,\counter_reg[4]_i_4_n_7 }),
        .S({\counter[4]_i_5_n_0 ,\counter[4]_i_6_n_0 ,\counter[4]_i_7_n_0 ,\counter[4]_i_8_n_0 }));
  FDCE \counter_reg[5] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter[5]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [5]));
  FDCE \counter_reg[6] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_4 [2]),
        .Q(\counter_reg[31]_0 [6]));
  FDCE \counter_reg[7] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_4 [3]),
        .Q(\counter_reg[31]_0 [7]));
  FDCE \counter_reg[8] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter[8]_i_1_n_0 ),
        .Q(\counter_reg[31]_0 [8]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[8]_i_3 
       (.CI(\counter_reg[4]_i_3_n_0 ),
        .CO({\counter_reg[8]_i_3_n_0 ,\counter_reg[8]_i_3_n_1 ,\counter_reg[8]_i_3_n_2 ,\counter_reg[8]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({counter0[8],\counter_reg[31]_1 [3:2],counter0[5]}),
        .S(\counter_reg[31]_0 [8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[8]_i_4 
       (.CI(\counter_reg[4]_i_4_n_0 ),
        .CO({\counter_reg[8]_i_4_n_0 ,\counter_reg[8]_i_4_n_1 ,\counter_reg[8]_i_4_n_2 ,\counter_reg[8]_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI(\counter_reg[31]_0 [8:5]),
        .O({\counter_reg[8]_i_4_n_4 ,\counter_reg[8]_i_4_n_5 ,\counter_reg[8]_i_4_n_6 ,\counter_reg[8]_i_4_n_7 }),
        .S({\counter[8]_i_5_n_0 ,\counter[8]_i_6_n_0 ,\counter[8]_i_7_n_0 ,\counter[8]_i_8_n_0 }));
  FDCE \counter_reg[9] 
       (.C(CLK),
        .CE(E),
        .CLR(ext_meas_d_reg_1),
        .D(\counter_reg[31]_4 [4]),
        .Q(\counter_reg[31]_0 [9]));
  FDCE ext_meas_d_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(ext_meas_d_reg_1),
        .D(ext_meas_i_IBUF),
        .Q(ext_meas_d));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_1__0
       (.I0(prescaler[8]),
        .O(i__carry__0_i_1__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_2__0
       (.I0(prescaler[7]),
        .O(i__carry__0_i_2__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_3__0
       (.I0(prescaler[6]),
        .O(i__carry__0_i_3__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_4__0
       (.I0(prescaler[5]),
        .O(i__carry__0_i_4__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_1__0
       (.I0(prescaler[12]),
        .O(i__carry__1_i_1__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_2__0
       (.I0(prescaler[11]),
        .O(i__carry__1_i_2__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_3__0
       (.I0(prescaler[10]),
        .O(i__carry__1_i_3__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_4__0
       (.I0(prescaler[9]),
        .O(i__carry__1_i_4__0_n_0));
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
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_1__0
       (.I0(prescaler[4]),
        .O(i__carry_i_1__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_2__0
       (.I0(prescaler[3]),
        .O(i__carry_i_2__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_3__0
       (.I0(prescaler[2]),
        .O(i__carry_i_3__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_4__0
       (.I0(prescaler[1]),
        .O(i__carry_i_4__0_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    irq_i_10
       (.I0(\counter_reg[31]_0 [7]),
        .I1(\counter_reg[31]_0 [4]),
        .I2(\counter_reg[31]_0 [6]),
        .I3(\counter_reg[31]_0 [5]),
        .O(irq_i_10_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    irq_i_11
       (.I0(\counter_reg[31]_0 [19]),
        .I1(\counter_reg[31]_0 [16]),
        .I2(\counter_reg[31]_0 [18]),
        .I3(\counter_reg[31]_0 [17]),
        .O(irq_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    irq_i_2
       (.I0(\counter_reg[13]_0 ),
        .I1(\counter_reg[25]_0 ),
        .I2(irq_i_6_n_0),
        .I3(irq_i_7_n_0),
        .O(\counter_reg[13]_1 ));
  LUT5 #(
    .INIT(32'hFFFFB0BF)) 
    irq_i_3
       (.I0(ext_meas_d),
        .I1(ext_meas_i_IBUF),
        .I2(Q[3]),
        .I3(clk_tick),
        .I4(op_done_reg_0),
        .O(ext_meas_d_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    irq_i_4
       (.I0(\counter_reg[31]_0 [13]),
        .I1(\counter_reg[31]_0 [14]),
        .I2(\counter_reg[31]_0 [12]),
        .I3(\counter_reg[31]_0 [15]),
        .I4(irq_i_8_n_0),
        .O(\counter_reg[13]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    irq_i_5
       (.I0(\counter_reg[31]_0 [25]),
        .I1(\counter_reg[31]_0 [26]),
        .I2(\counter_reg[31]_0 [24]),
        .I3(\counter_reg[31]_0 [27]),
        .I4(irq_i_9_n_0),
        .O(\counter_reg[25]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    irq_i_6
       (.I0(\counter_reg[31]_0 [21]),
        .I1(\counter_reg[31]_0 [22]),
        .I2(\counter_reg[31]_0 [20]),
        .I3(\counter_reg[31]_0 [23]),
        .I4(irq_i_10_n_0),
        .O(irq_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    irq_i_7
       (.I0(\counter_reg[31]_0 [1]),
        .I1(\counter_reg[31]_0 [2]),
        .I2(\counter_reg[31]_0 [0]),
        .I3(\counter_reg[31]_0 [3]),
        .I4(irq_i_11_n_0),
        .O(irq_i_7_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    irq_i_8
       (.I0(\counter_reg[31]_0 [31]),
        .I1(\counter_reg[31]_0 [28]),
        .I2(\counter_reg[31]_0 [30]),
        .I3(\counter_reg[31]_0 [29]),
        .O(irq_i_8_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    irq_i_9
       (.I0(\counter_reg[31]_0 [11]),
        .I1(\counter_reg[31]_0 [8]),
        .I2(\counter_reg[31]_0 [10]),
        .I3(\counter_reg[31]_0 [9]),
        .O(irq_i_9_n_0));
  FDCE irq_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(ext_meas_d_reg_1),
        .D(irq_reg_0),
        .Q(trigger_o_OBUF));
  CARRY4 \op_done1_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\op_done1_inferred__0/i__carry_n_0 ,\op_done1_inferred__0/i__carry_n_1 ,\op_done1_inferred__0/i__carry_n_2 ,\op_done1_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_op_done1_inferred__0/i__carry_O_UNCONNECTED [3:0]),
        .S(S));
  CARRY4 \op_done1_inferred__0/i__carry__0 
       (.CI(\op_done1_inferred__0/i__carry_n_0 ),
        .CO({\op_done1_inferred__0/i__carry__0_n_0 ,\op_done1_inferred__0/i__carry__0_n_1 ,\op_done1_inferred__0/i__carry__0_n_2 ,\op_done1_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_op_done1_inferred__0/i__carry__0_O_UNCONNECTED [3:0]),
        .S(\op_done1_inferred__0/i__carry__1_0 ));
  CARRY4 \op_done1_inferred__0/i__carry__1 
       (.CI(\op_done1_inferred__0/i__carry__0_n_0 ),
        .CO({\NLW_op_done1_inferred__0/i__carry__1_CO_UNCONNECTED [3],CO,\op_done1_inferred__0/i__carry__1_n_2 ,\op_done1_inferred__0/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_op_done1_inferred__0/i__carry__1_O_UNCONNECTED [3:0]),
        .S({1'b0,irq_reg_1}));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hAAAAABAA)) 
    op_done_i_3
       (.I0(Q[2]),
        .I1(irq_i_7_n_0),
        .I2(irq_i_6_n_0),
        .I3(\counter_reg[25]_0 ),
        .I4(\counter_reg[13]_0 ),
        .O(\reg_ctrl_reg[3]_12 ));
  FDCE op_done_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(ext_meas_d_reg_1),
        .D(op_done_reg_1),
        .Q(op_done_reg_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \prescaler0_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\prescaler0_inferred__0/i__carry_n_0 ,\prescaler0_inferred__0/i__carry_n_1 ,\prescaler0_inferred__0/i__carry_n_2 ,\prescaler0_inferred__0/i__carry_n_3 }),
        .CYINIT(prescaler[0]),
        .DI(prescaler[4:1]),
        .O(data1[4:1]),
        .S({i__carry_i_1__0_n_0,i__carry_i_2__0_n_0,i__carry_i_3__0_n_0,i__carry_i_4__0_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \prescaler0_inferred__0/i__carry__0 
       (.CI(\prescaler0_inferred__0/i__carry_n_0 ),
        .CO({\prescaler0_inferred__0/i__carry__0_n_0 ,\prescaler0_inferred__0/i__carry__0_n_1 ,\prescaler0_inferred__0/i__carry__0_n_2 ,\prescaler0_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI(prescaler[8:5]),
        .O(data1[8:5]),
        .S({i__carry__0_i_1__0_n_0,i__carry__0_i_2__0_n_0,i__carry__0_i_3__0_n_0,i__carry__0_i_4__0_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \prescaler0_inferred__0/i__carry__1 
       (.CI(\prescaler0_inferred__0/i__carry__0_n_0 ),
        .CO({\prescaler0_inferred__0/i__carry__1_n_0 ,\prescaler0_inferred__0/i__carry__1_n_1 ,\prescaler0_inferred__0/i__carry__1_n_2 ,\prescaler0_inferred__0/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI(prescaler[12:9]),
        .O(data1[12:9]),
        .S({i__carry__1_i_1__0_n_0,i__carry__1_i_2__0_n_0,i__carry__1_i_3__0_n_0,i__carry__1_i_4__0_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \prescaler0_inferred__0/i__carry__2 
       (.CI(\prescaler0_inferred__0/i__carry__1_n_0 ),
        .CO({\NLW_prescaler0_inferred__0/i__carry__2_CO_UNCONNECTED [3:2],\prescaler0_inferred__0/i__carry__2_n_2 ,\prescaler0_inferred__0/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,prescaler[14:13]}),
        .O({\NLW_prescaler0_inferred__0/i__carry__2_O_UNCONNECTED [3],data1[15:13]}),
        .S({1'b0,i__carry__2_i_1_n_0,i__carry__2_i_2_n_0,i__carry__2_i_3_n_0}));
  LUT6 #(
    .INIT(64'hBAFF0045AAAA0000)) 
    \prescaler[0]_i_1 
       (.I0(reg_load),
        .I1(\prescaler[15]_i_3_n_0 ),
        .I2(\prescaler[15]_i_4_n_0 ),
        .I3(prescaler[0]),
        .I4(\prescaler_reg[15]_0 [0]),
        .I5(Q[1]),
        .O(p_1_in[0]));
  LUT6 #(
    .INIT(64'hFFBA4500AAAA0000)) 
    \prescaler[10]_i_1 
       (.I0(reg_load),
        .I1(\prescaler[15]_i_3_n_0 ),
        .I2(\prescaler[15]_i_4_n_0 ),
        .I3(data1[10]),
        .I4(\prescaler_reg[15]_0 [10]),
        .I5(Q[1]),
        .O(p_1_in[10]));
  LUT6 #(
    .INIT(64'hFF45BA00AA00AA00)) 
    \prescaler[11]_i_1 
       (.I0(reg_load),
        .I1(\prescaler[15]_i_3_n_0 ),
        .I2(\prescaler[15]_i_4_n_0 ),
        .I3(\prescaler_reg[15]_0 [11]),
        .I4(data1[11]),
        .I5(Q[1]),
        .O(p_1_in[11]));
  LUT6 #(
    .INIT(64'hFFBA4500AAAA0000)) 
    \prescaler[12]_i_1 
       (.I0(reg_load),
        .I1(\prescaler[15]_i_3_n_0 ),
        .I2(\prescaler[15]_i_4_n_0 ),
        .I3(data1[12]),
        .I4(\prescaler_reg[15]_0 [12]),
        .I5(Q[1]),
        .O(p_1_in[12]));
  LUT6 #(
    .INIT(64'hFFBA4500AAAA0000)) 
    \prescaler[13]_i_1 
       (.I0(reg_load),
        .I1(\prescaler[15]_i_3_n_0 ),
        .I2(\prescaler[15]_i_4_n_0 ),
        .I3(data1[13]),
        .I4(\prescaler_reg[15]_0 [13]),
        .I5(Q[1]),
        .O(p_1_in[13]));
  LUT6 #(
    .INIT(64'hFF45BA00AA00AA00)) 
    \prescaler[14]_i_1 
       (.I0(reg_load),
        .I1(\prescaler[15]_i_3_n_0 ),
        .I2(\prescaler[15]_i_4_n_0 ),
        .I3(\prescaler_reg[15]_0 [14]),
        .I4(data1[14]),
        .I5(Q[1]),
        .O(p_1_in[14]));
  LUT6 #(
    .INIT(64'hFFBA4500AAAA0000)) 
    \prescaler[15]_i_2 
       (.I0(reg_load),
        .I1(\prescaler[15]_i_3_n_0 ),
        .I2(\prescaler[15]_i_4_n_0 ),
        .I3(data1[15]),
        .I4(\prescaler_reg[15]_0 [15]),
        .I5(Q[1]),
        .O(p_1_in[15]));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \prescaler[15]_i_3 
       (.I0(prescaler[4]),
        .I1(prescaler[10]),
        .I2(prescaler[8]),
        .I3(prescaler[9]),
        .I4(\prescaler[15]_i_5_n_0 ),
        .O(\prescaler[15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \prescaler[15]_i_4 
       (.I0(prescaler[6]),
        .I1(prescaler[15]),
        .I2(prescaler[13]),
        .I3(prescaler[14]),
        .I4(\prescaler[15]_i_6_n_0 ),
        .O(\prescaler[15]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \prescaler[15]_i_5 
       (.I0(prescaler[5]),
        .I1(prescaler[1]),
        .I2(prescaler[11]),
        .I3(prescaler[3]),
        .O(\prescaler[15]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \prescaler[15]_i_6 
       (.I0(prescaler[7]),
        .I1(prescaler[0]),
        .I2(prescaler[12]),
        .I3(prescaler[2]),
        .O(\prescaler[15]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFBA4500AAAA0000)) 
    \prescaler[1]_i_1 
       (.I0(reg_load),
        .I1(\prescaler[15]_i_3_n_0 ),
        .I2(\prescaler[15]_i_4_n_0 ),
        .I3(data1[1]),
        .I4(\prescaler_reg[15]_0 [1]),
        .I5(Q[1]),
        .O(p_1_in[1]));
  LUT6 #(
    .INIT(64'hFFBA4500AAAA0000)) 
    \prescaler[2]_i_1 
       (.I0(reg_load),
        .I1(\prescaler[15]_i_3_n_0 ),
        .I2(\prescaler[15]_i_4_n_0 ),
        .I3(data1[2]),
        .I4(\prescaler_reg[15]_0 [2]),
        .I5(Q[1]),
        .O(p_1_in[2]));
  LUT6 #(
    .INIT(64'hFFBA4500AAAA0000)) 
    \prescaler[3]_i_1 
       (.I0(reg_load),
        .I1(\prescaler[15]_i_3_n_0 ),
        .I2(\prescaler[15]_i_4_n_0 ),
        .I3(data1[3]),
        .I4(\prescaler_reg[15]_0 [3]),
        .I5(Q[1]),
        .O(p_1_in[3]));
  LUT6 #(
    .INIT(64'hFF45BA00AA00AA00)) 
    \prescaler[4]_i_1 
       (.I0(reg_load),
        .I1(\prescaler[15]_i_3_n_0 ),
        .I2(\prescaler[15]_i_4_n_0 ),
        .I3(\prescaler_reg[15]_0 [4]),
        .I4(data1[4]),
        .I5(Q[1]),
        .O(p_1_in[4]));
  LUT6 #(
    .INIT(64'hFFBA4500AAAA0000)) 
    \prescaler[5]_i_1 
       (.I0(reg_load),
        .I1(\prescaler[15]_i_3_n_0 ),
        .I2(\prescaler[15]_i_4_n_0 ),
        .I3(data1[5]),
        .I4(\prescaler_reg[15]_0 [5]),
        .I5(Q[1]),
        .O(p_1_in[5]));
  LUT6 #(
    .INIT(64'hFFBA4500AAAA0000)) 
    \prescaler[6]_i_1 
       (.I0(reg_load),
        .I1(\prescaler[15]_i_3_n_0 ),
        .I2(\prescaler[15]_i_4_n_0 ),
        .I3(data1[6]),
        .I4(\prescaler_reg[15]_0 [6]),
        .I5(Q[1]),
        .O(p_1_in[6]));
  LUT6 #(
    .INIT(64'hFF45BA00AA00AA00)) 
    \prescaler[7]_i_1 
       (.I0(reg_load),
        .I1(\prescaler[15]_i_3_n_0 ),
        .I2(\prescaler[15]_i_4_n_0 ),
        .I3(\prescaler_reg[15]_0 [7]),
        .I4(data1[7]),
        .I5(Q[1]),
        .O(p_1_in[7]));
  LUT6 #(
    .INIT(64'hFFBA4500AAAA0000)) 
    \prescaler[8]_i_1 
       (.I0(reg_load),
        .I1(\prescaler[15]_i_3_n_0 ),
        .I2(\prescaler[15]_i_4_n_0 ),
        .I3(data1[8]),
        .I4(\prescaler_reg[15]_0 [8]),
        .I5(Q[1]),
        .O(p_1_in[8]));
  LUT6 #(
    .INIT(64'hFFBA4500AAAA0000)) 
    \prescaler[9]_i_1 
       (.I0(reg_load),
        .I1(\prescaler[15]_i_3_n_0 ),
        .I2(\prescaler[15]_i_4_n_0 ),
        .I3(data1[9]),
        .I4(\prescaler_reg[15]_0 [9]),
        .I5(Q[1]),
        .O(p_1_in[9]));
  FDCE \prescaler_reg[0] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_1 ),
        .CLR(ext_meas_d_reg_1),
        .D(p_1_in[0]),
        .Q(prescaler[0]));
  FDCE \prescaler_reg[10] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_1 ),
        .CLR(ext_meas_d_reg_1),
        .D(p_1_in[10]),
        .Q(prescaler[10]));
  FDCE \prescaler_reg[11] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_1 ),
        .CLR(ext_meas_d_reg_1),
        .D(p_1_in[11]),
        .Q(prescaler[11]));
  FDCE \prescaler_reg[12] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_1 ),
        .CLR(ext_meas_d_reg_1),
        .D(p_1_in[12]),
        .Q(prescaler[12]));
  FDCE \prescaler_reg[13] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_1 ),
        .CLR(ext_meas_d_reg_1),
        .D(p_1_in[13]),
        .Q(prescaler[13]));
  FDCE \prescaler_reg[14] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_1 ),
        .CLR(ext_meas_d_reg_1),
        .D(p_1_in[14]),
        .Q(prescaler[14]));
  FDCE \prescaler_reg[15] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_1 ),
        .CLR(ext_meas_d_reg_1),
        .D(p_1_in[15]),
        .Q(prescaler[15]));
  FDCE \prescaler_reg[1] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_1 ),
        .CLR(ext_meas_d_reg_1),
        .D(p_1_in[1]),
        .Q(prescaler[1]));
  FDCE \prescaler_reg[2] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_1 ),
        .CLR(ext_meas_d_reg_1),
        .D(p_1_in[2]),
        .Q(prescaler[2]));
  FDCE \prescaler_reg[3] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_1 ),
        .CLR(ext_meas_d_reg_1),
        .D(p_1_in[3]),
        .Q(prescaler[3]));
  FDCE \prescaler_reg[4] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_1 ),
        .CLR(ext_meas_d_reg_1),
        .D(p_1_in[4]),
        .Q(prescaler[4]));
  FDCE \prescaler_reg[5] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_1 ),
        .CLR(ext_meas_d_reg_1),
        .D(p_1_in[5]),
        .Q(prescaler[5]));
  FDCE \prescaler_reg[6] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_1 ),
        .CLR(ext_meas_d_reg_1),
        .D(p_1_in[6]),
        .Q(prescaler[6]));
  FDCE \prescaler_reg[7] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_1 ),
        .CLR(ext_meas_d_reg_1),
        .D(p_1_in[7]),
        .Q(prescaler[7]));
  FDCE \prescaler_reg[8] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_1 ),
        .CLR(ext_meas_d_reg_1),
        .D(p_1_in[8]),
        .Q(prescaler[8]));
  FDCE \prescaler_reg[9] 
       (.C(CLK),
        .CE(\prescaler_reg[15]_1 ),
        .CLR(ext_meas_d_reg_1),
        .D(p_1_in[9]),
        .Q(prescaler[9]));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_o_OBUF_inst_i_13
       (.CI(pwm_o_OBUF_inst_i_31_n_0),
        .CO({pwm_o_OBUF_inst_i_13_n_0,pwm_o_OBUF_inst_i_13_n_1,pwm_o_OBUF_inst_i_13_n_2,pwm_o_OBUF_inst_i_13_n_3}),
        .CYINIT(1'b0),
        .DI({pwm_o_OBUF_inst_i_32_n_0,pwm_o_OBUF_inst_i_33_n_0,pwm_o_OBUF_inst_i_34_n_0,pwm_o_OBUF_inst_i_35_n_0}),
        .O(NLW_pwm_o_OBUF_inst_i_13_O_UNCONNECTED[3:0]),
        .S(pwm_o_OBUF_inst_i_3_1));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_14
       (.I0(\counter_reg[31]_0 [31]),
        .I1(pwm_o_OBUF_inst_i_3_0[31]),
        .I2(pwm_o_OBUF_inst_i_3_0[30]),
        .I3(\counter_reg[31]_0 [30]),
        .O(pwm_o_OBUF_inst_i_14_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_15
       (.I0(\counter_reg[31]_0 [29]),
        .I1(pwm_o_OBUF_inst_i_3_0[29]),
        .I2(pwm_o_OBUF_inst_i_3_0[28]),
        .I3(\counter_reg[31]_0 [28]),
        .O(pwm_o_OBUF_inst_i_15_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_16
       (.I0(\counter_reg[31]_0 [27]),
        .I1(pwm_o_OBUF_inst_i_3_0[27]),
        .I2(pwm_o_OBUF_inst_i_3_0[26]),
        .I3(\counter_reg[31]_0 [26]),
        .O(pwm_o_OBUF_inst_i_16_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_17
       (.I0(\counter_reg[31]_0 [25]),
        .I1(pwm_o_OBUF_inst_i_3_0[25]),
        .I2(pwm_o_OBUF_inst_i_3_0[24]),
        .I3(\counter_reg[31]_0 [24]),
        .O(pwm_o_OBUF_inst_i_17_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_o_OBUF_inst_i_2
       (.CI(pwm_o_OBUF_inst_i_4_n_0),
        .CO({\counter_reg[31]_3 ,pwm_o_OBUF_inst_i_2_n_1,pwm_o_OBUF_inst_i_2_n_2,pwm_o_OBUF_inst_i_2_n_3}),
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
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_23
       (.I0(\counter_reg[31]_0 [23]),
        .I1(pwm_o_OBUF_inst_i_3_0[23]),
        .I2(pwm_o_OBUF_inst_i_3_0[22]),
        .I3(\counter_reg[31]_0 [22]),
        .O(pwm_o_OBUF_inst_i_23_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_24
       (.I0(\counter_reg[31]_0 [21]),
        .I1(pwm_o_OBUF_inst_i_3_0[21]),
        .I2(pwm_o_OBUF_inst_i_3_0[20]),
        .I3(\counter_reg[31]_0 [20]),
        .O(pwm_o_OBUF_inst_i_24_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_25
       (.I0(\counter_reg[31]_0 [19]),
        .I1(pwm_o_OBUF_inst_i_3_0[19]),
        .I2(pwm_o_OBUF_inst_i_3_0[18]),
        .I3(\counter_reg[31]_0 [18]),
        .O(pwm_o_OBUF_inst_i_25_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_26
       (.I0(\counter_reg[31]_0 [17]),
        .I1(pwm_o_OBUF_inst_i_3_0[17]),
        .I2(pwm_o_OBUF_inst_i_3_0[16]),
        .I3(\counter_reg[31]_0 [16]),
        .O(pwm_o_OBUF_inst_i_26_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_o_OBUF_inst_i_3
       (.CI(pwm_o_OBUF_inst_i_13_n_0),
        .CO({\counter_reg[31]_2 ,pwm_o_OBUF_inst_i_3_n_1,pwm_o_OBUF_inst_i_3_n_2,pwm_o_OBUF_inst_i_3_n_3}),
        .CYINIT(1'b0),
        .DI({pwm_o_OBUF_inst_i_14_n_0,pwm_o_OBUF_inst_i_15_n_0,pwm_o_OBUF_inst_i_16_n_0,pwm_o_OBUF_inst_i_17_n_0}),
        .O(NLW_pwm_o_OBUF_inst_i_3_O_UNCONNECTED[3:0]),
        .S(pwm_o_OBUF_inst_i_1));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_o_OBUF_inst_i_31
       (.CI(pwm_o_OBUF_inst_i_49_n_0),
        .CO({pwm_o_OBUF_inst_i_31_n_0,pwm_o_OBUF_inst_i_31_n_1,pwm_o_OBUF_inst_i_31_n_2,pwm_o_OBUF_inst_i_31_n_3}),
        .CYINIT(1'b0),
        .DI({pwm_o_OBUF_inst_i_50_n_0,pwm_o_OBUF_inst_i_51_n_0,pwm_o_OBUF_inst_i_52_n_0,pwm_o_OBUF_inst_i_53_n_0}),
        .O(NLW_pwm_o_OBUF_inst_i_31_O_UNCONNECTED[3:0]),
        .S(pwm_o_OBUF_inst_i_13_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_32
       (.I0(\counter_reg[31]_0 [23]),
        .I1(pwm_o_OBUF_inst_i_3_0[23]),
        .I2(pwm_o_OBUF_inst_i_3_0[22]),
        .I3(\counter_reg[31]_0 [22]),
        .O(pwm_o_OBUF_inst_i_32_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_33
       (.I0(\counter_reg[31]_0 [21]),
        .I1(pwm_o_OBUF_inst_i_3_0[21]),
        .I2(pwm_o_OBUF_inst_i_3_0[20]),
        .I3(\counter_reg[31]_0 [20]),
        .O(pwm_o_OBUF_inst_i_33_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_34
       (.I0(\counter_reg[31]_0 [19]),
        .I1(pwm_o_OBUF_inst_i_3_0[19]),
        .I2(pwm_o_OBUF_inst_i_3_0[18]),
        .I3(\counter_reg[31]_0 [18]),
        .O(pwm_o_OBUF_inst_i_34_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_35
       (.I0(\counter_reg[31]_0 [17]),
        .I1(pwm_o_OBUF_inst_i_3_0[17]),
        .I2(pwm_o_OBUF_inst_i_3_0[16]),
        .I3(\counter_reg[31]_0 [16]),
        .O(pwm_o_OBUF_inst_i_35_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_o_OBUF_inst_i_4
       (.CI(pwm_o_OBUF_inst_i_22_n_0),
        .CO({pwm_o_OBUF_inst_i_4_n_0,pwm_o_OBUF_inst_i_4_n_1,pwm_o_OBUF_inst_i_4_n_2,pwm_o_OBUF_inst_i_4_n_3}),
        .CYINIT(1'b0),
        .DI({pwm_o_OBUF_inst_i_23_n_0,pwm_o_OBUF_inst_i_24_n_0,pwm_o_OBUF_inst_i_25_n_0,pwm_o_OBUF_inst_i_26_n_0}),
        .O(NLW_pwm_o_OBUF_inst_i_4_O_UNCONNECTED[3:0]),
        .S(pwm_o_OBUF_inst_i_2_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_o_OBUF_inst_i_40
       (.CI(1'b0),
        .CO({pwm_o_OBUF_inst_i_40_n_0,pwm_o_OBUF_inst_i_40_n_1,pwm_o_OBUF_inst_i_40_n_2,pwm_o_OBUF_inst_i_40_n_3}),
        .CYINIT(1'b1),
        .DI({pwm_o_OBUF_inst_i_58_n_0,pwm_o_OBUF_inst_i_59_n_0,pwm_o_OBUF_inst_i_60_n_0,pwm_o_OBUF_inst_i_61_n_0}),
        .O(NLW_pwm_o_OBUF_inst_i_40_O_UNCONNECTED[3:0]),
        .S(pwm_o_OBUF_inst_i_22_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_41
       (.I0(\counter_reg[31]_0 [15]),
        .I1(pwm_o_OBUF_inst_i_3_0[15]),
        .I2(pwm_o_OBUF_inst_i_3_0[14]),
        .I3(\counter_reg[31]_0 [14]),
        .O(pwm_o_OBUF_inst_i_41_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_42
       (.I0(\counter_reg[31]_0 [13]),
        .I1(pwm_o_OBUF_inst_i_3_0[13]),
        .I2(pwm_o_OBUF_inst_i_3_0[12]),
        .I3(\counter_reg[31]_0 [12]),
        .O(pwm_o_OBUF_inst_i_42_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_43
       (.I0(\counter_reg[31]_0 [11]),
        .I1(pwm_o_OBUF_inst_i_3_0[11]),
        .I2(pwm_o_OBUF_inst_i_3_0[10]),
        .I3(\counter_reg[31]_0 [10]),
        .O(pwm_o_OBUF_inst_i_43_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_44
       (.I0(\counter_reg[31]_0 [9]),
        .I1(pwm_o_OBUF_inst_i_3_0[9]),
        .I2(pwm_o_OBUF_inst_i_3_0[8]),
        .I3(\counter_reg[31]_0 [8]),
        .O(pwm_o_OBUF_inst_i_44_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_o_OBUF_inst_i_49
       (.CI(1'b0),
        .CO({pwm_o_OBUF_inst_i_49_n_0,pwm_o_OBUF_inst_i_49_n_1,pwm_o_OBUF_inst_i_49_n_2,pwm_o_OBUF_inst_i_49_n_3}),
        .CYINIT(1'b0),
        .DI({pwm_o_OBUF_inst_i_66_n_0,pwm_o_OBUF_inst_i_67_n_0,pwm_o_OBUF_inst_i_68_n_0,pwm_o_OBUF_inst_i_69_n_0}),
        .O(NLW_pwm_o_OBUF_inst_i_49_O_UNCONNECTED[3:0]),
        .S(pwm_o_OBUF_inst_i_31_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_5
       (.I0(\counter_reg[31]_0 [31]),
        .I1(pwm_o_OBUF_inst_i_3_0[31]),
        .I2(pwm_o_OBUF_inst_i_3_0[30]),
        .I3(\counter_reg[31]_0 [30]),
        .O(pwm_o_OBUF_inst_i_5_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_50
       (.I0(\counter_reg[31]_0 [15]),
        .I1(pwm_o_OBUF_inst_i_3_0[15]),
        .I2(pwm_o_OBUF_inst_i_3_0[14]),
        .I3(\counter_reg[31]_0 [14]),
        .O(pwm_o_OBUF_inst_i_50_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_51
       (.I0(\counter_reg[31]_0 [13]),
        .I1(pwm_o_OBUF_inst_i_3_0[13]),
        .I2(pwm_o_OBUF_inst_i_3_0[12]),
        .I3(\counter_reg[31]_0 [12]),
        .O(pwm_o_OBUF_inst_i_51_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_52
       (.I0(\counter_reg[31]_0 [11]),
        .I1(pwm_o_OBUF_inst_i_3_0[11]),
        .I2(pwm_o_OBUF_inst_i_3_0[10]),
        .I3(\counter_reg[31]_0 [10]),
        .O(pwm_o_OBUF_inst_i_52_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_53
       (.I0(\counter_reg[31]_0 [9]),
        .I1(pwm_o_OBUF_inst_i_3_0[9]),
        .I2(pwm_o_OBUF_inst_i_3_0[8]),
        .I3(\counter_reg[31]_0 [8]),
        .O(pwm_o_OBUF_inst_i_53_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_58
       (.I0(\counter_reg[31]_0 [7]),
        .I1(pwm_o_OBUF_inst_i_3_0[7]),
        .I2(pwm_o_OBUF_inst_i_3_0[6]),
        .I3(\counter_reg[31]_0 [6]),
        .O(pwm_o_OBUF_inst_i_58_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_59
       (.I0(\counter_reg[31]_0 [5]),
        .I1(pwm_o_OBUF_inst_i_3_0[5]),
        .I2(pwm_o_OBUF_inst_i_3_0[4]),
        .I3(\counter_reg[31]_0 [4]),
        .O(pwm_o_OBUF_inst_i_59_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_6
       (.I0(\counter_reg[31]_0 [29]),
        .I1(pwm_o_OBUF_inst_i_3_0[29]),
        .I2(pwm_o_OBUF_inst_i_3_0[28]),
        .I3(\counter_reg[31]_0 [28]),
        .O(pwm_o_OBUF_inst_i_6_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_60
       (.I0(\counter_reg[31]_0 [3]),
        .I1(pwm_o_OBUF_inst_i_3_0[3]),
        .I2(pwm_o_OBUF_inst_i_3_0[2]),
        .I3(\counter_reg[31]_0 [2]),
        .O(pwm_o_OBUF_inst_i_60_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_61
       (.I0(\counter_reg[31]_0 [1]),
        .I1(pwm_o_OBUF_inst_i_3_0[1]),
        .I2(pwm_o_OBUF_inst_i_3_0[0]),
        .I3(\counter_reg[31]_0 [0]),
        .O(pwm_o_OBUF_inst_i_61_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_66
       (.I0(\counter_reg[31]_0 [7]),
        .I1(pwm_o_OBUF_inst_i_3_0[7]),
        .I2(pwm_o_OBUF_inst_i_3_0[6]),
        .I3(\counter_reg[31]_0 [6]),
        .O(pwm_o_OBUF_inst_i_66_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_67
       (.I0(\counter_reg[31]_0 [5]),
        .I1(pwm_o_OBUF_inst_i_3_0[5]),
        .I2(pwm_o_OBUF_inst_i_3_0[4]),
        .I3(\counter_reg[31]_0 [4]),
        .O(pwm_o_OBUF_inst_i_67_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_68
       (.I0(\counter_reg[31]_0 [3]),
        .I1(pwm_o_OBUF_inst_i_3_0[3]),
        .I2(pwm_o_OBUF_inst_i_3_0[2]),
        .I3(\counter_reg[31]_0 [2]),
        .O(pwm_o_OBUF_inst_i_68_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_69
       (.I0(\counter_reg[31]_0 [1]),
        .I1(pwm_o_OBUF_inst_i_3_0[1]),
        .I2(pwm_o_OBUF_inst_i_3_0[0]),
        .I3(\counter_reg[31]_0 [0]),
        .O(pwm_o_OBUF_inst_i_69_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_7
       (.I0(\counter_reg[31]_0 [27]),
        .I1(pwm_o_OBUF_inst_i_3_0[27]),
        .I2(pwm_o_OBUF_inst_i_3_0[26]),
        .I3(\counter_reg[31]_0 [26]),
        .O(pwm_o_OBUF_inst_i_7_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    pwm_o_OBUF_inst_i_8
       (.I0(\counter_reg[31]_0 [25]),
        .I1(pwm_o_OBUF_inst_i_3_0[25]),
        .I2(pwm_o_OBUF_inst_i_3_0[24]),
        .I3(\counter_reg[31]_0 [24]),
        .O(pwm_o_OBUF_inst_i_8_n_0));
  LUT4 #(
    .INIT(16'h0010)) 
    \reg_load[31]_i_1 
       (.I0(penable),
        .I1(paddr_IBUF[3]),
        .I2(paddr_IBUF[2]),
        .I3(paddr_IBUF[4]),
        .O(reg_load));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFF7F)) 
    \reg_load[31]_i_2 
       (.I0(penable_IBUF),
        .I1(psel_IBUF),
        .I2(pwrite_IBUF),
        .I3(paddr_IBUF[1]),
        .I4(paddr_IBUF[0]),
        .I5(paddr_IBUF[5]),
        .O(penable));
endmodule

module timer_regs
   (prdata_OBUF,
    clk_tick7_out,
    Q,
    \pwdata[31] ,
    \reg_load_reg[29]_0 ,
    \counter_reg[30] ,
    \reg_load_reg[30]_0 ,
    \reg_ctrl_reg[3]_0 ,
    \counter_reg[22] ,
    \reg_load_reg[12]_0 ,
    S,
    \reg_load_reg[7]_0 ,
    \reg_load_reg[6]_0 ,
    \reg_load_reg[3]_0 ,
    \reg_load_reg[2]_0 ,
    \reg_ctrl_reg[0]_0 ,
    \reg_ctrl_reg[5]_0 ,
    pwm_o_OBUF,
    irq_OBUF,
    \reg_cmp_reg[31]_0 ,
    \reg_cmp_reg[31]_1 ,
    \reg_cmp_reg[23]_0 ,
    \reg_cmp_reg[15]_0 ,
    \reg_cmp_reg[7]_0 ,
    \reg_ctrl_reg[3]_1 ,
    \reg_pre_reg[15]_0 ,
    \reg_cmp_reg[7]_1 ,
    \reg_cmp_reg[15]_1 ,
    \reg_cmp_reg[23]_1 ,
    \reg_cmp_reg[31]_2 ,
    presetn,
    \reg_ctrl_reg[1]_0 ,
    E,
    paddr_IBUF,
    penable_IBUF,
    psel_IBUF,
    pwrite_IBUF,
    \reg_cmp_reg[0]_0 ,
    clk_tick_reg,
    reg_load,
    pwdata_IBUF,
    \counter_reg[30]_0 ,
    CO,
    \counter_reg[31] ,
    pwm_o_OBUF_inst_i_3,
    \counter_reg[31]_0 ,
    \counter_reg[31]_1 ,
    \counter_reg[28] ,
    \counter_reg[25] ,
    \counter_reg[26] ,
    \counter_reg[22]_0 ,
    \counter_reg[18] ,
    \counter_reg[19] ,
    \counter_reg[16] ,
    \counter_reg[15] ,
    \counter_reg[12] ,
    \counter_reg[13] ,
    \counter_reg[14] ,
    \counter_reg[9] ,
    \counter_reg[10] ,
    \counter_reg[7] ,
    \counter_reg[6] ,
    \counter_reg[3] ,
    \counter_reg[2] ,
    irq_reg,
    op_done_reg,
    capture_stb,
    \counter_reg[28]_0 ,
    \counter_reg[28]_1 ,
    \counter_reg[28]_2 ,
    pwm_o,
    pwm_o_0,
    presetn_IBUF,
    op_done_reg_0,
    op_done_reg_1,
    CLK,
    trigger_o_OBUF,
    D);
  output [31:0]prdata_OBUF;
  output clk_tick7_out;
  output [3:0]Q;
  output [18:0]\pwdata[31] ;
  output [12:0]\reg_load_reg[29]_0 ;
  output [2:0]\counter_reg[30] ;
  output \reg_load_reg[30]_0 ;
  output \reg_ctrl_reg[3]_0 ;
  output [3:0]\counter_reg[22] ;
  output \reg_load_reg[12]_0 ;
  output [3:0]S;
  output \reg_load_reg[7]_0 ;
  output \reg_load_reg[6]_0 ;
  output \reg_load_reg[3]_0 ;
  output \reg_load_reg[2]_0 ;
  output \reg_ctrl_reg[0]_0 ;
  output [0:0]\reg_ctrl_reg[5]_0 ;
  output pwm_o_OBUF;
  output irq_OBUF;
  output [3:0]\reg_cmp_reg[31]_0 ;
  output [31:0]\reg_cmp_reg[31]_1 ;
  output [3:0]\reg_cmp_reg[23]_0 ;
  output [3:0]\reg_cmp_reg[15]_0 ;
  output [3:0]\reg_cmp_reg[7]_0 ;
  output \reg_ctrl_reg[3]_1 ;
  output [15:0]\reg_pre_reg[15]_0 ;
  output [3:0]\reg_cmp_reg[7]_1 ;
  output [3:0]\reg_cmp_reg[15]_1 ;
  output [3:0]\reg_cmp_reg[23]_1 ;
  output [3:0]\reg_cmp_reg[31]_2 ;
  output presetn;
  output \reg_ctrl_reg[1]_0 ;
  output [0:0]E;
  input [5:0]paddr_IBUF;
  input penable_IBUF;
  input psel_IBUF;
  input pwrite_IBUF;
  input \reg_cmp_reg[0]_0 ;
  input clk_tick_reg;
  input reg_load;
  input [31:0]pwdata_IBUF;
  input \counter_reg[30]_0 ;
  input [0:0]CO;
  input [18:0]\counter_reg[31] ;
  input [31:0]pwm_o_OBUF_inst_i_3;
  input \counter_reg[31]_0 ;
  input \counter_reg[31]_1 ;
  input \counter_reg[28] ;
  input \counter_reg[25] ;
  input \counter_reg[26] ;
  input \counter_reg[22]_0 ;
  input \counter_reg[18] ;
  input \counter_reg[19] ;
  input \counter_reg[16] ;
  input \counter_reg[15] ;
  input \counter_reg[12] ;
  input \counter_reg[13] ;
  input \counter_reg[14] ;
  input \counter_reg[9] ;
  input \counter_reg[10] ;
  input \counter_reg[7] ;
  input \counter_reg[6] ;
  input \counter_reg[3] ;
  input \counter_reg[2] ;
  input irq_reg;
  input op_done_reg;
  input capture_stb;
  input \counter_reg[28]_0 ;
  input \counter_reg[28]_1 ;
  input \counter_reg[28]_2 ;
  input [0:0]pwm_o;
  input [0:0]pwm_o_0;
  input presetn_IBUF;
  input op_done_reg_0;
  input op_done_reg_1;
  input CLK;
  input trigger_o_OBUF;
  input [31:0]D;

  wire CLK;
  wire [0:0]CO;
  wire [31:0]D;
  wire [0:0]E;
  wire [3:0]Q;
  wire [3:0]S;
  wire capture_stb;
  wire clk_tick7_out;
  wire clk_tick_reg;
  wire \counter[10]_i_3_n_0 ;
  wire \counter[12]_i_2_n_0 ;
  wire \counter[13]_i_3_n_0 ;
  wire \counter[14]_i_3_n_0 ;
  wire \counter[15]_i_2_n_0 ;
  wire \counter[15]_i_3_n_0 ;
  wire \counter[16]_i_2_n_0 ;
  wire \counter[16]_i_3_n_0 ;
  wire \counter[18]_i_2_n_0 ;
  wire \counter[18]_i_3_n_0 ;
  wire \counter[19]_i_2_n_0 ;
  wire \counter[19]_i_3_n_0 ;
  wire \counter[22]_i_2_n_0 ;
  wire \counter[22]_i_3_n_0 ;
  wire \counter[25]_i_2_n_0 ;
  wire \counter[25]_i_3_n_0 ;
  wire \counter[26]_i_3_n_0 ;
  wire \counter[28]_i_4_n_0 ;
  wire \counter[2]_i_2_n_0 ;
  wire \counter[30]_i_2_n_0 ;
  wire \counter[31]_i_3_n_0 ;
  wire \counter[31]_i_5_n_0 ;
  wire \counter[3]_i_2_n_0 ;
  wire \counter[6]_i_2_n_0 ;
  wire \counter[7]_i_2_n_0 ;
  wire \counter[9]_i_3_n_0 ;
  wire \counter_reg[10] ;
  wire \counter_reg[12] ;
  wire \counter_reg[13] ;
  wire \counter_reg[14] ;
  wire \counter_reg[15] ;
  wire \counter_reg[16] ;
  wire \counter_reg[18] ;
  wire \counter_reg[19] ;
  wire [3:0]\counter_reg[22] ;
  wire \counter_reg[22]_0 ;
  wire \counter_reg[25] ;
  wire \counter_reg[26] ;
  wire \counter_reg[28] ;
  wire \counter_reg[28]_0 ;
  wire \counter_reg[28]_1 ;
  wire \counter_reg[28]_2 ;
  wire \counter_reg[2] ;
  wire [2:0]\counter_reg[30] ;
  wire \counter_reg[30]_0 ;
  wire [18:0]\counter_reg[31] ;
  wire \counter_reg[31]_0 ;
  wire \counter_reg[31]_1 ;
  wire \counter_reg[3] ;
  wire \counter_reg[6] ;
  wire \counter_reg[7] ;
  wire \counter_reg[9] ;
  wire en;
  wire i__carry__0_i_10_n_0;
  wire i__carry__0_i_11_n_0;
  wire i__carry__0_i_12_n_0;
  wire i__carry__0_i_13_n_0;
  wire i__carry__0_i_15_n_0;
  wire i__carry__0_i_16_n_0;
  wire i__carry__0_i_5_n_0;
  wire i__carry__0_i_6_n_0;
  wire i__carry__0_i_7_n_0;
  wire i__carry__0_i_8_n_0;
  wire i__carry__0_i_9_n_0;
  wire i__carry__1_i_10_n_0;
  wire i__carry__1_i_5_n_0;
  wire i__carry__1_i_6_n_0;
  wire i__carry__1_i_7_n_0;
  wire i__carry__1_i_8_n_0;
  wire i__carry__1_i_9_n_0;
  wire i__carry_i_11_n_0;
  wire i__carry_i_12_n_0;
  wire i__carry_i_14_n_0;
  wire i__carry_i_16_n_0;
  wire i__carry_i_5_n_0;
  wire i__carry_i_6_n_0;
  wire i__carry_i_7_n_0;
  wire i__carry_i_9_n_0;
  wire irq_OBUF;
  wire irq_reg;
  wire op_done_i_2_n_0;
  wire op_done_i_4_n_0;
  wire op_done_reg;
  wire op_done_reg_0;
  wire op_done_reg_1;
  wire [5:0]paddr_IBUF;
  wire penable_IBUF;
  wire [31:0]prdata_OBUF;
  wire \prdata_OBUF[0]_inst_i_2_n_0 ;
  wire \prdata_OBUF[0]_inst_i_3_n_0 ;
  wire \prdata_OBUF[10]_inst_i_2_n_0 ;
  wire \prdata_OBUF[10]_inst_i_3_n_0 ;
  wire \prdata_OBUF[11]_inst_i_2_n_0 ;
  wire \prdata_OBUF[11]_inst_i_3_n_0 ;
  wire \prdata_OBUF[12]_inst_i_2_n_0 ;
  wire \prdata_OBUF[12]_inst_i_3_n_0 ;
  wire \prdata_OBUF[13]_inst_i_2_n_0 ;
  wire \prdata_OBUF[13]_inst_i_3_n_0 ;
  wire \prdata_OBUF[14]_inst_i_2_n_0 ;
  wire \prdata_OBUF[14]_inst_i_3_n_0 ;
  wire \prdata_OBUF[15]_inst_i_2_n_0 ;
  wire \prdata_OBUF[15]_inst_i_3_n_0 ;
  wire \prdata_OBUF[16]_inst_i_2_n_0 ;
  wire \prdata_OBUF[16]_inst_i_3_n_0 ;
  wire \prdata_OBUF[17]_inst_i_2_n_0 ;
  wire \prdata_OBUF[17]_inst_i_3_n_0 ;
  wire \prdata_OBUF[18]_inst_i_2_n_0 ;
  wire \prdata_OBUF[18]_inst_i_3_n_0 ;
  wire \prdata_OBUF[19]_inst_i_2_n_0 ;
  wire \prdata_OBUF[19]_inst_i_3_n_0 ;
  wire \prdata_OBUF[1]_inst_i_2_n_0 ;
  wire \prdata_OBUF[1]_inst_i_3_n_0 ;
  wire \prdata_OBUF[20]_inst_i_2_n_0 ;
  wire \prdata_OBUF[20]_inst_i_3_n_0 ;
  wire \prdata_OBUF[21]_inst_i_2_n_0 ;
  wire \prdata_OBUF[21]_inst_i_3_n_0 ;
  wire \prdata_OBUF[22]_inst_i_2_n_0 ;
  wire \prdata_OBUF[22]_inst_i_3_n_0 ;
  wire \prdata_OBUF[23]_inst_i_2_n_0 ;
  wire \prdata_OBUF[23]_inst_i_3_n_0 ;
  wire \prdata_OBUF[24]_inst_i_2_n_0 ;
  wire \prdata_OBUF[24]_inst_i_3_n_0 ;
  wire \prdata_OBUF[25]_inst_i_2_n_0 ;
  wire \prdata_OBUF[25]_inst_i_3_n_0 ;
  wire \prdata_OBUF[26]_inst_i_2_n_0 ;
  wire \prdata_OBUF[26]_inst_i_3_n_0 ;
  wire \prdata_OBUF[27]_inst_i_2_n_0 ;
  wire \prdata_OBUF[27]_inst_i_3_n_0 ;
  wire \prdata_OBUF[28]_inst_i_2_n_0 ;
  wire \prdata_OBUF[28]_inst_i_3_n_0 ;
  wire \prdata_OBUF[29]_inst_i_2_n_0 ;
  wire \prdata_OBUF[29]_inst_i_3_n_0 ;
  wire \prdata_OBUF[2]_inst_i_2_n_0 ;
  wire \prdata_OBUF[2]_inst_i_3_n_0 ;
  wire \prdata_OBUF[30]_inst_i_2_n_0 ;
  wire \prdata_OBUF[30]_inst_i_3_n_0 ;
  wire \prdata_OBUF[31]_inst_i_2_n_0 ;
  wire \prdata_OBUF[31]_inst_i_3_n_0 ;
  wire \prdata_OBUF[31]_inst_i_4_n_0 ;
  wire \prdata_OBUF[3]_inst_i_2_n_0 ;
  wire \prdata_OBUF[3]_inst_i_3_n_0 ;
  wire \prdata_OBUF[4]_inst_i_2_n_0 ;
  wire \prdata_OBUF[4]_inst_i_3_n_0 ;
  wire \prdata_OBUF[5]_inst_i_2_n_0 ;
  wire \prdata_OBUF[5]_inst_i_3_n_0 ;
  wire \prdata_OBUF[6]_inst_i_2_n_0 ;
  wire \prdata_OBUF[6]_inst_i_3_n_0 ;
  wire \prdata_OBUF[7]_inst_i_2_n_0 ;
  wire \prdata_OBUF[7]_inst_i_3_n_0 ;
  wire \prdata_OBUF[8]_inst_i_2_n_0 ;
  wire \prdata_OBUF[8]_inst_i_3_n_0 ;
  wire \prdata_OBUF[9]_inst_i_2_n_0 ;
  wire \prdata_OBUF[9]_inst_i_3_n_0 ;
  wire presetn;
  wire presetn_IBUF;
  wire psel_IBUF;
  wire [18:0]\pwdata[31] ;
  wire [31:0]pwdata_IBUF;
  wire pwm_en;
  wire [0:0]pwm_o;
  wire [0:0]pwm_o_0;
  wire pwm_o_OBUF;
  wire [31:0]pwm_o_OBUF_inst_i_3;
  wire pwrite_IBUF;
  wire [31:0]reg_cap;
  wire reg_cap0;
  wire reg_cmp;
  wire \reg_cmp_reg[0]_0 ;
  wire [3:0]\reg_cmp_reg[15]_0 ;
  wire [3:0]\reg_cmp_reg[15]_1 ;
  wire [3:0]\reg_cmp_reg[23]_0 ;
  wire [3:0]\reg_cmp_reg[23]_1 ;
  wire [3:0]\reg_cmp_reg[31]_0 ;
  wire [31:0]\reg_cmp_reg[31]_1 ;
  wire [3:0]\reg_cmp_reg[31]_2 ;
  wire [3:0]\reg_cmp_reg[7]_0 ;
  wire [3:0]\reg_cmp_reg[7]_1 ;
  wire reg_ctrl;
  wire \reg_ctrl[31]_i_3_n_0 ;
  wire \reg_ctrl_reg[0]_0 ;
  wire \reg_ctrl_reg[1]_0 ;
  wire \reg_ctrl_reg[3]_0 ;
  wire \reg_ctrl_reg[3]_1 ;
  wire [0:0]\reg_ctrl_reg[5]_0 ;
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
  wire \reg_ctrl_reg_n_0_[6] ;
  wire \reg_ctrl_reg_n_0_[7] ;
  wire \reg_ctrl_reg_n_0_[8] ;
  wire \reg_ctrl_reg_n_0_[9] ;
  wire reg_int_en;
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
  wire \reg_int_sts[0]_i_1_n_0 ;
  wire \reg_int_sts[1]_i_1_n_0 ;
  wire \reg_int_sts[1]_i_2_n_0 ;
  wire \reg_int_sts[1]_i_3_n_0 ;
  wire \reg_int_sts[1]_i_4_n_0 ;
  wire reg_load;
  wire [31:2]reg_load__0;
  wire \reg_load_reg[12]_0 ;
  wire [12:0]\reg_load_reg[29]_0 ;
  wire \reg_load_reg[2]_0 ;
  wire \reg_load_reg[30]_0 ;
  wire \reg_load_reg[3]_0 ;
  wire \reg_load_reg[6]_0 ;
  wire \reg_load_reg[7]_0 ;
  wire [31:16]reg_pre;
  wire reg_pre_0;
  wire [15:0]\reg_pre_reg[15]_0 ;
  wire trigger_o_OBUF;

  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h000000D0)) 
    clk_tick_i_1
       (.I0(Q[1]),
        .I1(clk_tick_reg),
        .I2(en),
        .I3(Q[3]),
        .I4(reg_load),
        .O(clk_tick7_out));
  LUT6 #(
    .INIT(64'hF5F5F5F5F5F5B1A0)) 
    \counter[10]_i_1 
       (.I0(reg_load),
        .I1(\reg_ctrl_reg[3]_0 ),
        .I2(pwdata_IBUF[10]),
        .I3(reg_load__0[10]),
        .I4(\counter_reg[10] ),
        .I5(\counter[10]_i_3_n_0 ),
        .O(\pwdata[31] [5]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[10]_i_3 
       (.I0(\counter_reg[31] [5]),
        .I1(CO),
        .I2(Q[2]),
        .O(\counter[10]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \counter[12]_i_1 
       (.I0(pwdata_IBUF[12]),
        .I1(reg_load),
        .I2(\counter[12]_i_2_n_0 ),
        .I3(Q[2]),
        .I4(\counter_reg[12] ),
        .O(\pwdata[31] [6]));
  LUT6 #(
    .INIT(64'h4540FFFF45400000)) 
    \counter[12]_i_2 
       (.I0(Q[0]),
        .I1(pwdata_IBUF[12]),
        .I2(reg_load),
        .I3(reg_load__0[12]),
        .I4(CO),
        .I5(\counter_reg[31] [6]),
        .O(\counter[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF5F5F5F5F5F5B1A0)) 
    \counter[13]_i_1 
       (.I0(reg_load),
        .I1(\reg_ctrl_reg[3]_0 ),
        .I2(pwdata_IBUF[13]),
        .I3(reg_load__0[13]),
        .I4(\counter_reg[13] ),
        .I5(\counter[13]_i_3_n_0 ),
        .O(\pwdata[31] [7]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[13]_i_3 
       (.I0(\counter_reg[31] [7]),
        .I1(CO),
        .I2(Q[2]),
        .O(\counter[13]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF5F5F5F5F5F5B1A0)) 
    \counter[14]_i_1 
       (.I0(reg_load),
        .I1(\reg_ctrl_reg[3]_0 ),
        .I2(pwdata_IBUF[14]),
        .I3(reg_load__0[14]),
        .I4(\counter_reg[14] ),
        .I5(\counter[14]_i_3_n_0 ),
        .O(\pwdata[31] [8]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[14]_i_3 
       (.I0(\counter_reg[31] [8]),
        .I1(CO),
        .I2(Q[2]),
        .O(\counter[14]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBBB8B88)) 
    \counter[15]_i_1 
       (.I0(pwdata_IBUF[15]),
        .I1(reg_load),
        .I2(\counter[15]_i_2_n_0 ),
        .I3(\counter_reg[31]_0 ),
        .I4(\counter[15]_i_3_n_0 ),
        .I5(\counter_reg[15] ),
        .O(\pwdata[31] [9]));
  LUT6 #(
    .INIT(64'hFFFF47FF47474747)) 
    \counter[15]_i_2 
       (.I0(pwdata_IBUF[15]),
        .I1(reg_load),
        .I2(reg_load__0[15]),
        .I3(CO),
        .I4(Q[0]),
        .I5(Q[2]),
        .O(\counter[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[15]_i_3 
       (.I0(\counter_reg[31] [9]),
        .I1(CO),
        .I2(Q[2]),
        .O(\counter[15]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBBB8B88)) 
    \counter[16]_i_1 
       (.I0(pwdata_IBUF[16]),
        .I1(reg_load),
        .I2(\counter[16]_i_2_n_0 ),
        .I3(\counter_reg[31]_0 ),
        .I4(\counter[16]_i_3_n_0 ),
        .I5(\counter_reg[16] ),
        .O(\pwdata[31] [10]));
  LUT6 #(
    .INIT(64'hFFFF47FF47474747)) 
    \counter[16]_i_2 
       (.I0(pwdata_IBUF[16]),
        .I1(reg_load),
        .I2(reg_load__0[16]),
        .I3(CO),
        .I4(Q[0]),
        .I5(Q[2]),
        .O(\counter[16]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[16]_i_3 
       (.I0(\counter_reg[31] [10]),
        .I1(CO),
        .I2(Q[2]),
        .O(\counter[16]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBBB8B88)) 
    \counter[18]_i_1 
       (.I0(pwdata_IBUF[18]),
        .I1(reg_load),
        .I2(\counter[18]_i_2_n_0 ),
        .I3(\counter_reg[31]_0 ),
        .I4(\counter[18]_i_3_n_0 ),
        .I5(\counter_reg[18] ),
        .O(\pwdata[31] [11]));
  LUT6 #(
    .INIT(64'hFFFF47FF47474747)) 
    \counter[18]_i_2 
       (.I0(pwdata_IBUF[18]),
        .I1(reg_load),
        .I2(reg_load__0[18]),
        .I3(CO),
        .I4(Q[0]),
        .I5(Q[2]),
        .O(\counter[18]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[18]_i_3 
       (.I0(\counter_reg[31] [11]),
        .I1(CO),
        .I2(Q[2]),
        .O(\counter[18]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBBB8B88)) 
    \counter[19]_i_1 
       (.I0(pwdata_IBUF[19]),
        .I1(reg_load),
        .I2(\counter[19]_i_2_n_0 ),
        .I3(\counter_reg[31]_0 ),
        .I4(\counter[19]_i_3_n_0 ),
        .I5(\counter_reg[19] ),
        .O(\pwdata[31] [12]));
  LUT6 #(
    .INIT(64'hFFFF47FF47474747)) 
    \counter[19]_i_2 
       (.I0(pwdata_IBUF[19]),
        .I1(reg_load),
        .I2(reg_load__0[19]),
        .I3(CO),
        .I4(Q[0]),
        .I5(Q[2]),
        .O(\counter[19]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[19]_i_3 
       (.I0(\counter_reg[31] [12]),
        .I1(CO),
        .I2(Q[2]),
        .O(\counter[19]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBBB8B88)) 
    \counter[22]_i_1 
       (.I0(pwdata_IBUF[22]),
        .I1(reg_load),
        .I2(\counter[22]_i_2_n_0 ),
        .I3(\counter_reg[31]_0 ),
        .I4(\counter[22]_i_3_n_0 ),
        .I5(\counter_reg[22]_0 ),
        .O(\pwdata[31] [13]));
  LUT6 #(
    .INIT(64'hFFFF47FF47474747)) 
    \counter[22]_i_2 
       (.I0(pwdata_IBUF[22]),
        .I1(reg_load),
        .I2(reg_load__0[22]),
        .I3(CO),
        .I4(Q[0]),
        .I5(Q[2]),
        .O(\counter[22]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[22]_i_3 
       (.I0(\counter_reg[31] [13]),
        .I1(CO),
        .I2(Q[2]),
        .O(\counter[22]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBBB8B88)) 
    \counter[25]_i_1 
       (.I0(pwdata_IBUF[25]),
        .I1(reg_load),
        .I2(\counter[25]_i_2_n_0 ),
        .I3(\counter_reg[31]_0 ),
        .I4(\counter[25]_i_3_n_0 ),
        .I5(\counter_reg[25] ),
        .O(\pwdata[31] [14]));
  LUT6 #(
    .INIT(64'hFFFF47FF47474747)) 
    \counter[25]_i_2 
       (.I0(pwdata_IBUF[25]),
        .I1(reg_load),
        .I2(reg_load__0[25]),
        .I3(CO),
        .I4(Q[0]),
        .I5(Q[2]),
        .O(\counter[25]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[25]_i_3 
       (.I0(\counter_reg[31] [14]),
        .I1(CO),
        .I2(Q[2]),
        .O(\counter[25]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF5F5F5F5F5F5B1A0)) 
    \counter[26]_i_1 
       (.I0(reg_load),
        .I1(\reg_ctrl_reg[3]_0 ),
        .I2(pwdata_IBUF[26]),
        .I3(reg_load__0[26]),
        .I4(\counter_reg[26] ),
        .I5(\counter[26]_i_3_n_0 ),
        .O(\pwdata[31] [15]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[26]_i_3 
       (.I0(\counter_reg[31] [15]),
        .I1(CO),
        .I2(Q[2]),
        .O(\counter[26]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF5F5F5F5F5F5B1A0)) 
    \counter[28]_i_1 
       (.I0(reg_load),
        .I1(\reg_ctrl_reg[3]_0 ),
        .I2(pwdata_IBUF[28]),
        .I3(reg_load__0[28]),
        .I4(\counter_reg[28] ),
        .I5(\counter[28]_i_4_n_0 ),
        .O(\pwdata[31] [16]));
  LUT6 #(
    .INIT(64'hF7F7F7F7F7C7F7F7)) 
    \counter[28]_i_2 
       (.I0(CO),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(\counter_reg[28]_0 ),
        .I4(\counter_reg[28]_1 ),
        .I5(\counter_reg[28]_2 ),
        .O(\reg_ctrl_reg[3]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[28]_i_4 
       (.I0(\counter_reg[31] [16]),
        .I1(CO),
        .I2(Q[2]),
        .O(\counter[28]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \counter[29]_i_4 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(CO),
        .O(\reg_ctrl_reg[3]_1 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \counter[2]_i_1 
       (.I0(pwdata_IBUF[2]),
        .I1(reg_load),
        .I2(\counter[2]_i_2_n_0 ),
        .I3(Q[2]),
        .I4(\counter_reg[2] ),
        .O(\pwdata[31] [0]));
  LUT6 #(
    .INIT(64'h4540FFFF45400000)) 
    \counter[2]_i_2 
       (.I0(Q[0]),
        .I1(pwdata_IBUF[2]),
        .I2(reg_load),
        .I3(reg_load__0[2]),
        .I4(CO),
        .I5(\counter_reg[31] [0]),
        .O(\counter[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \counter[30]_i_1 
       (.I0(pwdata_IBUF[30]),
        .I1(reg_load),
        .I2(\counter[30]_i_2_n_0 ),
        .I3(Q[2]),
        .I4(\counter_reg[30]_0 ),
        .O(\pwdata[31] [17]));
  LUT6 #(
    .INIT(64'h4540FFFF45400000)) 
    \counter[30]_i_2 
       (.I0(Q[0]),
        .I1(pwdata_IBUF[30]),
        .I2(reg_load),
        .I3(reg_load__0[30]),
        .I4(CO),
        .I5(\counter_reg[31] [17]),
        .O(\counter[30]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hAE)) 
    \counter[31]_i_1 
       (.I0(reg_load),
        .I1(en),
        .I2(op_done_reg),
        .O(E));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBBB8B88)) 
    \counter[31]_i_2 
       (.I0(pwdata_IBUF[31]),
        .I1(reg_load),
        .I2(\counter[31]_i_3_n_0 ),
        .I3(\counter_reg[31]_0 ),
        .I4(\counter[31]_i_5_n_0 ),
        .I5(\counter_reg[31]_1 ),
        .O(\pwdata[31] [18]));
  LUT6 #(
    .INIT(64'hFFFF47FF47474747)) 
    \counter[31]_i_3 
       (.I0(pwdata_IBUF[31]),
        .I1(reg_load),
        .I2(reg_load__0[31]),
        .I3(CO),
        .I4(Q[0]),
        .I5(Q[2]),
        .O(\counter[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[31]_i_5 
       (.I0(\counter_reg[31] [18]),
        .I1(CO),
        .I2(Q[2]),
        .O(\counter[31]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \counter[3]_i_1 
       (.I0(pwdata_IBUF[3]),
        .I1(reg_load),
        .I2(\counter[3]_i_2_n_0 ),
        .I3(Q[2]),
        .I4(\counter_reg[3] ),
        .O(\pwdata[31] [1]));
  LUT6 #(
    .INIT(64'h4540FFFF45400000)) 
    \counter[3]_i_2 
       (.I0(Q[0]),
        .I1(pwdata_IBUF[3]),
        .I2(reg_load),
        .I3(reg_load__0[3]),
        .I4(CO),
        .I5(\counter_reg[31] [1]),
        .O(\counter[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \counter[6]_i_1 
       (.I0(pwdata_IBUF[6]),
        .I1(reg_load),
        .I2(\counter[6]_i_2_n_0 ),
        .I3(Q[2]),
        .I4(\counter_reg[6] ),
        .O(\pwdata[31] [2]));
  LUT6 #(
    .INIT(64'h4540FFFF45400000)) 
    \counter[6]_i_2 
       (.I0(Q[0]),
        .I1(pwdata_IBUF[6]),
        .I2(reg_load),
        .I3(reg_load__0[6]),
        .I4(CO),
        .I5(\counter_reg[31] [2]),
        .O(\counter[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \counter[7]_i_1 
       (.I0(pwdata_IBUF[7]),
        .I1(reg_load),
        .I2(\counter[7]_i_2_n_0 ),
        .I3(Q[2]),
        .I4(\counter_reg[7] ),
        .O(\pwdata[31] [3]));
  LUT6 #(
    .INIT(64'h4540FFFF45400000)) 
    \counter[7]_i_2 
       (.I0(Q[0]),
        .I1(pwdata_IBUF[7]),
        .I2(reg_load),
        .I3(reg_load__0[7]),
        .I4(CO),
        .I5(\counter_reg[31] [3]),
        .O(\counter[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF5F5F5F5F5F5B1A0)) 
    \counter[9]_i_1 
       (.I0(reg_load),
        .I1(\reg_ctrl_reg[3]_0 ),
        .I2(pwdata_IBUF[9]),
        .I3(reg_load__0[9]),
        .I4(\counter_reg[9] ),
        .I5(\counter[9]_i_3_n_0 ),
        .O(\pwdata[31] [4]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[9]_i_3 
       (.I0(\counter_reg[31] [4]),
        .I1(CO),
        .I2(Q[2]),
        .O(\counter[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6006000000006006)) 
    i__carry__0_i_1
       (.I0(i__carry__0_i_5_n_0),
        .I1(pwm_o_OBUF_inst_i_3[22]),
        .I2(pwm_o_OBUF_inst_i_3[21]),
        .I3(i__carry__0_i_6_n_0),
        .I4(pwm_o_OBUF_inst_i_3[23]),
        .I5(i__carry__0_i_7_n_0),
        .O(\counter_reg[22] [3]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h1D)) 
    i__carry__0_i_10
       (.I0(reg_load__0[19]),
        .I1(reg_load),
        .I2(pwdata_IBUF[19]),
        .O(i__carry__0_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h1D)) 
    i__carry__0_i_11
       (.I0(reg_load__0[16]),
        .I1(reg_load),
        .I2(pwdata_IBUF[16]),
        .O(i__carry__0_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__0_i_12
       (.I0(pwdata_IBUF[17]),
        .I1(reg_load),
        .I2(\reg_load_reg[29]_0 [6]),
        .O(i__carry__0_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h1D)) 
    i__carry__0_i_13
       (.I0(reg_load__0[15]),
        .I1(reg_load),
        .I2(pwdata_IBUF[15]),
        .O(i__carry__0_i_13_n_0));
  LUT6 #(
    .INIT(64'hFFFFFEFF00000200)) 
    i__carry__0_i_14
       (.I0(pwdata_IBUF[12]),
        .I1(\reg_cmp_reg[0]_0 ),
        .I2(paddr_IBUF[3]),
        .I3(paddr_IBUF[2]),
        .I4(paddr_IBUF[4]),
        .I5(reg_load__0[12]),
        .O(\reg_load_reg[12]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__0_i_15
       (.I0(pwdata_IBUF[14]),
        .I1(reg_load),
        .I2(reg_load__0[14]),
        .O(i__carry__0_i_15_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__0_i_16
       (.I0(pwdata_IBUF[13]),
        .I1(reg_load),
        .I2(reg_load__0[13]),
        .O(i__carry__0_i_16_n_0));
  LUT6 #(
    .INIT(64'h0000600660060000)) 
    i__carry__0_i_2
       (.I0(i__carry__0_i_8_n_0),
        .I1(pwm_o_OBUF_inst_i_3[18]),
        .I2(pwm_o_OBUF_inst_i_3[20]),
        .I3(i__carry__0_i_9_n_0),
        .I4(pwm_o_OBUF_inst_i_3[19]),
        .I5(i__carry__0_i_10_n_0),
        .O(\counter_reg[22] [2]));
  LUT6 #(
    .INIT(64'h0000600660060000)) 
    i__carry__0_i_3
       (.I0(i__carry__0_i_11_n_0),
        .I1(pwm_o_OBUF_inst_i_3[16]),
        .I2(pwm_o_OBUF_inst_i_3[17]),
        .I3(i__carry__0_i_12_n_0),
        .I4(pwm_o_OBUF_inst_i_3[15]),
        .I5(i__carry__0_i_13_n_0),
        .O(\counter_reg[22] [1]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_4
       (.I0(\reg_load_reg[12]_0 ),
        .I1(pwm_o_OBUF_inst_i_3[12]),
        .I2(pwm_o_OBUF_inst_i_3[14]),
        .I3(i__carry__0_i_15_n_0),
        .I4(pwm_o_OBUF_inst_i_3[13]),
        .I5(i__carry__0_i_16_n_0),
        .O(\counter_reg[22] [0]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h1D)) 
    i__carry__0_i_5
       (.I0(reg_load__0[22]),
        .I1(reg_load),
        .I2(pwdata_IBUF[22]),
        .O(i__carry__0_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__0_i_6
       (.I0(pwdata_IBUF[21]),
        .I1(reg_load),
        .I2(\reg_load_reg[29]_0 [8]),
        .O(i__carry__0_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__0_i_7
       (.I0(pwdata_IBUF[23]),
        .I1(reg_load),
        .I2(\reg_load_reg[29]_0 [9]),
        .O(i__carry__0_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h1D)) 
    i__carry__0_i_8
       (.I0(reg_load__0[18]),
        .I1(reg_load),
        .I2(pwdata_IBUF[18]),
        .O(i__carry__0_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__0_i_9
       (.I0(pwdata_IBUF[20]),
        .I1(reg_load),
        .I2(\reg_load_reg[29]_0 [7]),
        .O(i__carry__0_i_9_n_0));
  LUT6 #(
    .INIT(64'h9990009000099909)) 
    i__carry__1_i_1
       (.I0(\reg_load_reg[30]_0 ),
        .I1(pwm_o_OBUF_inst_i_3[30]),
        .I2(reg_load__0[31]),
        .I3(reg_load),
        .I4(pwdata_IBUF[31]),
        .I5(pwm_o_OBUF_inst_i_3[31]),
        .O(\counter_reg[30] [2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__1_i_10
       (.I0(pwdata_IBUF[26]),
        .I1(reg_load),
        .I2(reg_load__0[26]),
        .O(i__carry__1_i_10_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__1_i_2
       (.I0(i__carry__1_i_5_n_0),
        .I1(pwm_o_OBUF_inst_i_3[27]),
        .I2(pwm_o_OBUF_inst_i_3[29]),
        .I3(i__carry__1_i_6_n_0),
        .I4(pwm_o_OBUF_inst_i_3[28]),
        .I5(i__carry__1_i_7_n_0),
        .O(\counter_reg[30] [1]));
  LUT6 #(
    .INIT(64'h6006000000006006)) 
    i__carry__1_i_3
       (.I0(i__carry__1_i_8_n_0),
        .I1(pwm_o_OBUF_inst_i_3[25]),
        .I2(pwm_o_OBUF_inst_i_3[24]),
        .I3(i__carry__1_i_9_n_0),
        .I4(pwm_o_OBUF_inst_i_3[26]),
        .I5(i__carry__1_i_10_n_0),
        .O(\counter_reg[30] [0]));
  LUT6 #(
    .INIT(64'hFFFFFEFF00000200)) 
    i__carry__1_i_4
       (.I0(pwdata_IBUF[30]),
        .I1(\reg_cmp_reg[0]_0 ),
        .I2(paddr_IBUF[3]),
        .I3(paddr_IBUF[2]),
        .I4(paddr_IBUF[4]),
        .I5(reg_load__0[30]),
        .O(\reg_load_reg[30]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__1_i_5
       (.I0(pwdata_IBUF[27]),
        .I1(reg_load),
        .I2(\reg_load_reg[29]_0 [11]),
        .O(i__carry__1_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__1_i_6
       (.I0(pwdata_IBUF[29]),
        .I1(reg_load),
        .I2(\reg_load_reg[29]_0 [12]),
        .O(i__carry__1_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__1_i_7
       (.I0(pwdata_IBUF[28]),
        .I1(reg_load),
        .I2(reg_load__0[28]),
        .O(i__carry__1_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h1D)) 
    i__carry__1_i_8
       (.I0(reg_load__0[25]),
        .I1(reg_load),
        .I2(pwdata_IBUF[25]),
        .O(i__carry__1_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry__1_i_9
       (.I0(pwdata_IBUF[24]),
        .I1(reg_load),
        .I2(\reg_load_reg[29]_0 [10]),
        .O(i__carry__1_i_9_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_1
       (.I0(i__carry_i_5_n_0),
        .I1(pwm_o_OBUF_inst_i_3[9]),
        .I2(pwm_o_OBUF_inst_i_3[11]),
        .I3(i__carry_i_6_n_0),
        .I4(pwm_o_OBUF_inst_i_3[10]),
        .I5(i__carry_i_7_n_0),
        .O(S[3]));
  LUT6 #(
    .INIT(64'hFFFFFEFF00000200)) 
    i__carry_i_10
       (.I0(pwdata_IBUF[6]),
        .I1(\reg_cmp_reg[0]_0 ),
        .I2(paddr_IBUF[3]),
        .I3(paddr_IBUF[2]),
        .I4(paddr_IBUF[4]),
        .I5(reg_load__0[6]),
        .O(\reg_load_reg[6]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry_i_11
       (.I0(pwdata_IBUF[4]),
        .I1(reg_load),
        .I2(\reg_load_reg[29]_0 [2]),
        .O(i__carry_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry_i_12
       (.I0(pwdata_IBUF[5]),
        .I1(reg_load),
        .I2(\reg_load_reg[29]_0 [3]),
        .O(i__carry_i_12_n_0));
  LUT6 #(
    .INIT(64'hFFFFFEFF00000200)) 
    i__carry_i_13
       (.I0(pwdata_IBUF[3]),
        .I1(\reg_cmp_reg[0]_0 ),
        .I2(paddr_IBUF[3]),
        .I3(paddr_IBUF[2]),
        .I4(paddr_IBUF[4]),
        .I5(reg_load__0[3]),
        .O(\reg_load_reg[3]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry_i_14
       (.I0(pwdata_IBUF[1]),
        .I1(reg_load),
        .I2(\reg_load_reg[29]_0 [1]),
        .O(i__carry_i_14_n_0));
  LUT6 #(
    .INIT(64'hFFFFFEFF00000200)) 
    i__carry_i_15
       (.I0(pwdata_IBUF[2]),
        .I1(\reg_cmp_reg[0]_0 ),
        .I2(paddr_IBUF[3]),
        .I3(paddr_IBUF[2]),
        .I4(paddr_IBUF[4]),
        .I5(reg_load__0[2]),
        .O(\reg_load_reg[2]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry_i_16
       (.I0(pwdata_IBUF[0]),
        .I1(reg_load),
        .I2(\reg_load_reg[29]_0 [0]),
        .O(i__carry_i_16_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_2
       (.I0(\reg_load_reg[7]_0 ),
        .I1(pwm_o_OBUF_inst_i_3[7]),
        .I2(pwm_o_OBUF_inst_i_3[8]),
        .I3(i__carry_i_9_n_0),
        .I4(pwm_o_OBUF_inst_i_3[6]),
        .I5(\reg_load_reg[6]_0 ),
        .O(S[2]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_3
       (.I0(i__carry_i_11_n_0),
        .I1(pwm_o_OBUF_inst_i_3[4]),
        .I2(pwm_o_OBUF_inst_i_3[5]),
        .I3(i__carry_i_12_n_0),
        .I4(pwm_o_OBUF_inst_i_3[3]),
        .I5(\reg_load_reg[3]_0 ),
        .O(S[1]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_4
       (.I0(i__carry_i_14_n_0),
        .I1(pwm_o_OBUF_inst_i_3[1]),
        .I2(pwm_o_OBUF_inst_i_3[2]),
        .I3(\reg_load_reg[2]_0 ),
        .I4(pwm_o_OBUF_inst_i_3[0]),
        .I5(i__carry_i_16_n_0),
        .O(S[0]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry_i_5
       (.I0(pwdata_IBUF[9]),
        .I1(reg_load),
        .I2(reg_load__0[9]),
        .O(i__carry_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry_i_6
       (.I0(pwdata_IBUF[11]),
        .I1(reg_load),
        .I2(\reg_load_reg[29]_0 [5]),
        .O(i__carry_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry_i_7
       (.I0(pwdata_IBUF[10]),
        .I1(reg_load),
        .I2(reg_load__0[10]),
        .O(i__carry_i_7_n_0));
  LUT6 #(
    .INIT(64'hFFFFFEFF00000200)) 
    i__carry_i_8
       (.I0(pwdata_IBUF[7]),
        .I1(\reg_cmp_reg[0]_0 ),
        .I2(paddr_IBUF[3]),
        .I3(paddr_IBUF[2]),
        .I4(paddr_IBUF[4]),
        .I5(reg_load__0[7]),
        .O(\reg_load_reg[7]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i__carry_i_9
       (.I0(pwdata_IBUF[8]),
        .I1(reg_load),
        .I2(\reg_load_reg[29]_0 [4]),
        .O(i__carry_i_9_n_0));
  LUT4 #(
    .INIT(16'hF888)) 
    irq_OBUF_inst_i_1
       (.I0(reg_int_sts[1]),
        .I1(\reg_int_en_reg_n_0_[1] ),
        .I2(reg_int_sts[0]),
        .I3(\reg_int_en_reg_n_0_[0] ),
        .O(irq_OBUF));
  LUT6 #(
    .INIT(64'h0000000044004040)) 
    irq_i_1
       (.I0(reg_load),
        .I1(en),
        .I2(irq_reg),
        .I3(CO),
        .I4(Q[2]),
        .I5(op_done_reg),
        .O(\reg_ctrl_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h5555555500000100)) 
    op_done_i_1
       (.I0(op_done_i_2_n_0),
        .I1(Q[0]),
        .I2(op_done_reg),
        .I3(op_done_reg_0),
        .I4(op_done_i_4_n_0),
        .I5(op_done_reg_1),
        .O(\reg_ctrl_reg[1]_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    op_done_i_2
       (.I0(reg_load),
        .I1(en),
        .O(op_done_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    op_done_i_4
       (.I0(Q[2]),
        .I1(CO),
        .O(op_done_i_4_n_0));
  LUT6 #(
    .INIT(64'h0000000053555353)) 
    \prdata_OBUF[0]_inst_i_1 
       (.I0(\prdata_OBUF[0]_inst_i_2_n_0 ),
        .I1(\prdata_OBUF[0]_inst_i_3_n_0 ),
        .I2(paddr_IBUF[1]),
        .I3(paddr_IBUF[0]),
        .I4(paddr_IBUF[4]),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[0]));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F)) 
    \prdata_OBUF[0]_inst_i_2 
       (.I0(reg_cap[0]),
        .I1(\reg_cmp_reg[31]_1 [0]),
        .I2(paddr_IBUF[3]),
        .I3(reg_int_sts[0]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_int_en_reg_n_0_[0] ),
        .O(\prdata_OBUF[0]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h05F5030305F5F3F3)) 
    \prdata_OBUF[0]_inst_i_3 
       (.I0(\reg_load_reg[29]_0 [0]),
        .I1(en),
        .I2(paddr_IBUF[3]),
        .I3(\reg_pre_reg[15]_0 [0]),
        .I4(paddr_IBUF[2]),
        .I5(pwm_o_OBUF_inst_i_3[0]),
        .O(\prdata_OBUF[0]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[10]_inst_i_1 
       (.I0(\prdata_OBUF[10]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[10]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[10]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[10]_inst_i_2 
       (.I0(\reg_pre_reg[15]_0 [10]),
        .I1(pwm_o_OBUF_inst_i_3[10]),
        .I2(paddr_IBUF[3]),
        .I3(reg_load__0[10]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[10] ),
        .O(\prdata_OBUF[10]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[10]_inst_i_3 
       (.I0(reg_cap[10]),
        .I1(\reg_cmp_reg[31]_1 [10]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[10] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[10]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[11]_inst_i_1 
       (.I0(\prdata_OBUF[11]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[11]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[11]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[11]_inst_i_2 
       (.I0(\reg_pre_reg[15]_0 [11]),
        .I1(pwm_o_OBUF_inst_i_3[11]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_load_reg[29]_0 [5]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[11] ),
        .O(\prdata_OBUF[11]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[11]_inst_i_3 
       (.I0(reg_cap[11]),
        .I1(\reg_cmp_reg[31]_1 [11]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[11] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[11]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[12]_inst_i_1 
       (.I0(\prdata_OBUF[12]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[12]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[12]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[12]_inst_i_2 
       (.I0(\reg_pre_reg[15]_0 [12]),
        .I1(pwm_o_OBUF_inst_i_3[12]),
        .I2(paddr_IBUF[3]),
        .I3(reg_load__0[12]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[12] ),
        .O(\prdata_OBUF[12]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[12]_inst_i_3 
       (.I0(reg_cap[12]),
        .I1(\reg_cmp_reg[31]_1 [12]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[12] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[12]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[13]_inst_i_1 
       (.I0(\prdata_OBUF[13]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[13]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[13]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[13]_inst_i_2 
       (.I0(\reg_pre_reg[15]_0 [13]),
        .I1(pwm_o_OBUF_inst_i_3[13]),
        .I2(paddr_IBUF[3]),
        .I3(reg_load__0[13]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[13] ),
        .O(\prdata_OBUF[13]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[13]_inst_i_3 
       (.I0(reg_cap[13]),
        .I1(\reg_cmp_reg[31]_1 [13]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[13] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[13]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[14]_inst_i_1 
       (.I0(\prdata_OBUF[14]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[14]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[14]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[14]_inst_i_2 
       (.I0(\reg_pre_reg[15]_0 [14]),
        .I1(pwm_o_OBUF_inst_i_3[14]),
        .I2(paddr_IBUF[3]),
        .I3(reg_load__0[14]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[14] ),
        .O(\prdata_OBUF[14]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[14]_inst_i_3 
       (.I0(reg_cap[14]),
        .I1(\reg_cmp_reg[31]_1 [14]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[14] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[14]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000DFDD1011)) 
    \prdata_OBUF[15]_inst_i_1 
       (.I0(\prdata_OBUF[15]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[15]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[15]));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F)) 
    \prdata_OBUF[15]_inst_i_2 
       (.I0(\reg_pre_reg[15]_0 [15]),
        .I1(pwm_o_OBUF_inst_i_3[15]),
        .I2(paddr_IBUF[3]),
        .I3(reg_load__0[15]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[15] ),
        .O(\prdata_OBUF[15]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[15]_inst_i_3 
       (.I0(reg_cap[15]),
        .I1(\reg_cmp_reg[31]_1 [15]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[15] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[15]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[16]_inst_i_1 
       (.I0(\prdata_OBUF[16]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[16]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[16]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[16]_inst_i_2 
       (.I0(reg_pre[16]),
        .I1(pwm_o_OBUF_inst_i_3[16]),
        .I2(paddr_IBUF[3]),
        .I3(reg_load__0[16]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[16] ),
        .O(\prdata_OBUF[16]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[16]_inst_i_3 
       (.I0(reg_cap[16]),
        .I1(\reg_cmp_reg[31]_1 [16]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[16] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[16]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[17]_inst_i_1 
       (.I0(\prdata_OBUF[17]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[17]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[17]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[17]_inst_i_2 
       (.I0(reg_pre[17]),
        .I1(pwm_o_OBUF_inst_i_3[17]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_load_reg[29]_0 [6]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[17] ),
        .O(\prdata_OBUF[17]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[17]_inst_i_3 
       (.I0(reg_cap[17]),
        .I1(\reg_cmp_reg[31]_1 [17]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[17] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[17]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[18]_inst_i_1 
       (.I0(\prdata_OBUF[18]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[18]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[18]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[18]_inst_i_2 
       (.I0(reg_pre[18]),
        .I1(pwm_o_OBUF_inst_i_3[18]),
        .I2(paddr_IBUF[3]),
        .I3(reg_load__0[18]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[18] ),
        .O(\prdata_OBUF[18]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[18]_inst_i_3 
       (.I0(reg_cap[18]),
        .I1(\reg_cmp_reg[31]_1 [18]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[18] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[18]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[19]_inst_i_1 
       (.I0(\prdata_OBUF[19]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[19]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[19]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[19]_inst_i_2 
       (.I0(reg_pre[19]),
        .I1(pwm_o_OBUF_inst_i_3[19]),
        .I2(paddr_IBUF[3]),
        .I3(reg_load__0[19]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[19] ),
        .O(\prdata_OBUF[19]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[19]_inst_i_3 
       (.I0(reg_cap[19]),
        .I1(\reg_cmp_reg[31]_1 [19]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[19] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[19]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000A3AAA3A3)) 
    \prdata_OBUF[1]_inst_i_1 
       (.I0(\prdata_OBUF[1]_inst_i_2_n_0 ),
        .I1(\prdata_OBUF[1]_inst_i_3_n_0 ),
        .I2(paddr_IBUF[1]),
        .I3(paddr_IBUF[0]),
        .I4(paddr_IBUF[4]),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[1]_inst_i_2 
       (.I0(reg_cap[1]),
        .I1(\reg_cmp_reg[31]_1 [1]),
        .I2(paddr_IBUF[3]),
        .I3(reg_int_sts[1]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_int_en_reg_n_0_[1] ),
        .O(\prdata_OBUF[1]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h05F5030305F5F3F3)) 
    \prdata_OBUF[1]_inst_i_3 
       (.I0(\reg_load_reg[29]_0 [1]),
        .I1(Q[0]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_pre_reg[15]_0 [1]),
        .I4(paddr_IBUF[2]),
        .I5(pwm_o_OBUF_inst_i_3[1]),
        .O(\prdata_OBUF[1]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[20]_inst_i_1 
       (.I0(\prdata_OBUF[20]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[20]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[20]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[20]_inst_i_2 
       (.I0(reg_pre[20]),
        .I1(pwm_o_OBUF_inst_i_3[20]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_load_reg[29]_0 [7]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[20] ),
        .O(\prdata_OBUF[20]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[20]_inst_i_3 
       (.I0(reg_cap[20]),
        .I1(\reg_cmp_reg[31]_1 [20]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[20] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[20]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[21]_inst_i_1 
       (.I0(\prdata_OBUF[21]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[21]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[21]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[21]_inst_i_2 
       (.I0(reg_pre[21]),
        .I1(pwm_o_OBUF_inst_i_3[21]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_load_reg[29]_0 [8]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[21] ),
        .O(\prdata_OBUF[21]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[21]_inst_i_3 
       (.I0(reg_cap[21]),
        .I1(\reg_cmp_reg[31]_1 [21]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[21] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[21]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[22]_inst_i_1 
       (.I0(\prdata_OBUF[22]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[22]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[22]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[22]_inst_i_2 
       (.I0(reg_pre[22]),
        .I1(pwm_o_OBUF_inst_i_3[22]),
        .I2(paddr_IBUF[3]),
        .I3(reg_load__0[22]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[22] ),
        .O(\prdata_OBUF[22]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[22]_inst_i_3 
       (.I0(reg_cap[22]),
        .I1(\reg_cmp_reg[31]_1 [22]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[22] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[22]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000DFDD1011)) 
    \prdata_OBUF[23]_inst_i_1 
       (.I0(\prdata_OBUF[23]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[23]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[23]));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F)) 
    \prdata_OBUF[23]_inst_i_2 
       (.I0(reg_pre[23]),
        .I1(pwm_o_OBUF_inst_i_3[23]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_load_reg[29]_0 [9]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[23] ),
        .O(\prdata_OBUF[23]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[23]_inst_i_3 
       (.I0(reg_cap[23]),
        .I1(\reg_cmp_reg[31]_1 [23]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[23] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[23]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[24]_inst_i_1 
       (.I0(\prdata_OBUF[24]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[24]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[24]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[24]_inst_i_2 
       (.I0(reg_pre[24]),
        .I1(pwm_o_OBUF_inst_i_3[24]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_load_reg[29]_0 [10]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[24] ),
        .O(\prdata_OBUF[24]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[24]_inst_i_3 
       (.I0(reg_cap[24]),
        .I1(\reg_cmp_reg[31]_1 [24]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[24] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[24]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[25]_inst_i_1 
       (.I0(\prdata_OBUF[25]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[25]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[25]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[25]_inst_i_2 
       (.I0(reg_pre[25]),
        .I1(pwm_o_OBUF_inst_i_3[25]),
        .I2(paddr_IBUF[3]),
        .I3(reg_load__0[25]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[25] ),
        .O(\prdata_OBUF[25]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[25]_inst_i_3 
       (.I0(reg_cap[25]),
        .I1(\reg_cmp_reg[31]_1 [25]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[25] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[25]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[26]_inst_i_1 
       (.I0(\prdata_OBUF[26]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[26]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[26]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[26]_inst_i_2 
       (.I0(reg_pre[26]),
        .I1(pwm_o_OBUF_inst_i_3[26]),
        .I2(paddr_IBUF[3]),
        .I3(reg_load__0[26]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[26] ),
        .O(\prdata_OBUF[26]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[26]_inst_i_3 
       (.I0(reg_cap[26]),
        .I1(\reg_cmp_reg[31]_1 [26]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[26] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[26]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[27]_inst_i_1 
       (.I0(\prdata_OBUF[27]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[27]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[27]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[27]_inst_i_2 
       (.I0(reg_pre[27]),
        .I1(pwm_o_OBUF_inst_i_3[27]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_load_reg[29]_0 [11]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[27] ),
        .O(\prdata_OBUF[27]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[27]_inst_i_3 
       (.I0(reg_cap[27]),
        .I1(\reg_cmp_reg[31]_1 [27]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[27] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[27]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[28]_inst_i_1 
       (.I0(\prdata_OBUF[28]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[28]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[28]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[28]_inst_i_2 
       (.I0(reg_pre[28]),
        .I1(pwm_o_OBUF_inst_i_3[28]),
        .I2(paddr_IBUF[3]),
        .I3(reg_load__0[28]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[28] ),
        .O(\prdata_OBUF[28]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[28]_inst_i_3 
       (.I0(reg_cap[28]),
        .I1(\reg_cmp_reg[31]_1 [28]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[28] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[28]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[29]_inst_i_1 
       (.I0(\prdata_OBUF[29]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[29]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[29]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[29]_inst_i_2 
       (.I0(reg_pre[29]),
        .I1(pwm_o_OBUF_inst_i_3[29]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_load_reg[29]_0 [12]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[29] ),
        .O(\prdata_OBUF[29]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[29]_inst_i_3 
       (.I0(reg_cap[29]),
        .I1(\reg_cmp_reg[31]_1 [29]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[29] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[29]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000DFDD1011)) 
    \prdata_OBUF[2]_inst_i_1 
       (.I0(\prdata_OBUF[2]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[2]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[2]));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F)) 
    \prdata_OBUF[2]_inst_i_2 
       (.I0(\reg_pre_reg[15]_0 [2]),
        .I1(pwm_o_OBUF_inst_i_3[2]),
        .I2(paddr_IBUF[3]),
        .I3(reg_load__0[2]),
        .I4(paddr_IBUF[2]),
        .I5(Q[1]),
        .O(\prdata_OBUF[2]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[2]_inst_i_3 
       (.I0(reg_cap[2]),
        .I1(\reg_cmp_reg[31]_1 [2]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[2] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[2]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[30]_inst_i_1 
       (.I0(\prdata_OBUF[30]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[30]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[30]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[30]_inst_i_2 
       (.I0(reg_pre[30]),
        .I1(pwm_o_OBUF_inst_i_3[30]),
        .I2(paddr_IBUF[3]),
        .I3(reg_load__0[30]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[30] ),
        .O(\prdata_OBUF[30]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[30]_inst_i_3 
       (.I0(reg_cap[30]),
        .I1(\reg_cmp_reg[31]_1 [30]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[30] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[30]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h3133313101000101)) 
    \prdata_OBUF[31]_inst_i_1 
       (.I0(\prdata_OBUF[31]_inst_i_2_n_0 ),
        .I1(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .I2(paddr_IBUF[1]),
        .I3(paddr_IBUF[0]),
        .I4(paddr_IBUF[4]),
        .I5(\prdata_OBUF[31]_inst_i_4_n_0 ),
        .O(prdata_OBUF[31]));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F)) 
    \prdata_OBUF[31]_inst_i_2 
       (.I0(reg_pre[31]),
        .I1(pwm_o_OBUF_inst_i_3[31]),
        .I2(paddr_IBUF[3]),
        .I3(reg_load__0[31]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[31] ),
        .O(\prdata_OBUF[31]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFEFFFFFFFEFEFFFF)) 
    \prdata_OBUF[31]_inst_i_3 
       (.I0(paddr_IBUF[1]),
        .I1(paddr_IBUF[0]),
        .I2(paddr_IBUF[5]),
        .I3(penable_IBUF),
        .I4(psel_IBUF),
        .I5(pwrite_IBUF),
        .O(\prdata_OBUF[31]_inst_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[31]_inst_i_4 
       (.I0(reg_cap[31]),
        .I1(\reg_cmp_reg[31]_1 [31]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[31] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[31]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[3]_inst_i_1 
       (.I0(\prdata_OBUF[3]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[3]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[3]_inst_i_2 
       (.I0(\reg_pre_reg[15]_0 [3]),
        .I1(pwm_o_OBUF_inst_i_3[3]),
        .I2(paddr_IBUF[3]),
        .I3(reg_load__0[3]),
        .I4(paddr_IBUF[2]),
        .I5(Q[2]),
        .O(\prdata_OBUF[3]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[3]_inst_i_3 
       (.I0(reg_cap[3]),
        .I1(\reg_cmp_reg[31]_1 [3]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[3] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[3]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[4]_inst_i_1 
       (.I0(\prdata_OBUF[4]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[4]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[4]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[4]_inst_i_2 
       (.I0(\reg_pre_reg[15]_0 [4]),
        .I1(pwm_o_OBUF_inst_i_3[4]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_load_reg[29]_0 [2]),
        .I4(paddr_IBUF[2]),
        .I5(pwm_en),
        .O(\prdata_OBUF[4]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[4]_inst_i_3 
       (.I0(reg_cap[4]),
        .I1(\reg_cmp_reg[31]_1 [4]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[4] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[4]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[5]_inst_i_1 
       (.I0(\prdata_OBUF[5]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[5]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[5]_inst_i_2 
       (.I0(\reg_pre_reg[15]_0 [5]),
        .I1(pwm_o_OBUF_inst_i_3[5]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_load_reg[29]_0 [3]),
        .I4(paddr_IBUF[2]),
        .I5(Q[3]),
        .O(\prdata_OBUF[5]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[5]_inst_i_3 
       (.I0(reg_cap[5]),
        .I1(\reg_cmp_reg[31]_1 [5]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[5] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[5]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[6]_inst_i_1 
       (.I0(\prdata_OBUF[6]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[6]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[6]_inst_i_2 
       (.I0(\reg_pre_reg[15]_0 [6]),
        .I1(pwm_o_OBUF_inst_i_3[6]),
        .I2(paddr_IBUF[3]),
        .I3(reg_load__0[6]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[6] ),
        .O(\prdata_OBUF[6]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[6]_inst_i_3 
       (.I0(reg_cap[6]),
        .I1(\reg_cmp_reg[31]_1 [6]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[6] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[6]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[7]_inst_i_1 
       (.I0(\prdata_OBUF[7]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[7]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[7]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[7]_inst_i_2 
       (.I0(\reg_pre_reg[15]_0 [7]),
        .I1(pwm_o_OBUF_inst_i_3[7]),
        .I2(paddr_IBUF[3]),
        .I3(reg_load__0[7]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[7] ),
        .O(\prdata_OBUF[7]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[7]_inst_i_3 
       (.I0(reg_cap[7]),
        .I1(\reg_cmp_reg[31]_1 [7]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[7] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[7]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000DFDD1011)) 
    \prdata_OBUF[8]_inst_i_1 
       (.I0(\prdata_OBUF[8]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[8]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[8]));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F)) 
    \prdata_OBUF[8]_inst_i_2 
       (.I0(\reg_pre_reg[15]_0 [8]),
        .I1(pwm_o_OBUF_inst_i_3[8]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_load_reg[29]_0 [4]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[8] ),
        .O(\prdata_OBUF[8]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[8]_inst_i_3 
       (.I0(reg_cap[8]),
        .I1(\reg_cmp_reg[31]_1 [8]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[8] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[8]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEE2022)) 
    \prdata_OBUF[9]_inst_i_1 
       (.I0(\prdata_OBUF[9]_inst_i_2_n_0 ),
        .I1(paddr_IBUF[1]),
        .I2(paddr_IBUF[0]),
        .I3(paddr_IBUF[4]),
        .I4(\prdata_OBUF[9]_inst_i_3_n_0 ),
        .I5(\prdata_OBUF[31]_inst_i_3_n_0 ),
        .O(prdata_OBUF[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \prdata_OBUF[9]_inst_i_2 
       (.I0(\reg_pre_reg[15]_0 [9]),
        .I1(pwm_o_OBUF_inst_i_3[9]),
        .I2(paddr_IBUF[3]),
        .I3(reg_load__0[9]),
        .I4(paddr_IBUF[2]),
        .I5(\reg_ctrl_reg_n_0_[9] ),
        .O(\prdata_OBUF[9]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \prdata_OBUF[9]_inst_i_3 
       (.I0(reg_cap[9]),
        .I1(\reg_cmp_reg[31]_1 [9]),
        .I2(paddr_IBUF[3]),
        .I3(\reg_int_en_reg_n_0_[9] ),
        .I4(paddr_IBUF[2]),
        .O(\prdata_OBUF[9]_inst_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \prescaler[15]_i_1 
       (.I0(reg_load),
        .I1(Q[3]),
        .I2(en),
        .O(\reg_ctrl_reg[5]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hA808)) 
    pwm_o_OBUF_inst_i_1
       (.I0(pwm_en),
        .I1(pwm_o),
        .I2(Q[2]),
        .I3(pwm_o_0),
        .O(pwm_o_OBUF));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_10
       (.I0(\reg_cmp_reg[31]_1 [29]),
        .I1(pwm_o_OBUF_inst_i_3[29]),
        .I2(\reg_cmp_reg[31]_1 [28]),
        .I3(pwm_o_OBUF_inst_i_3[28]),
        .O(\reg_cmp_reg[31]_0 [2]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_11
       (.I0(\reg_cmp_reg[31]_1 [27]),
        .I1(pwm_o_OBUF_inst_i_3[27]),
        .I2(\reg_cmp_reg[31]_1 [26]),
        .I3(pwm_o_OBUF_inst_i_3[26]),
        .O(\reg_cmp_reg[31]_0 [1]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_12
       (.I0(\reg_cmp_reg[31]_1 [25]),
        .I1(pwm_o_OBUF_inst_i_3[25]),
        .I2(\reg_cmp_reg[31]_1 [24]),
        .I3(pwm_o_OBUF_inst_i_3[24]),
        .O(\reg_cmp_reg[31]_0 [0]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_18
       (.I0(\reg_cmp_reg[31]_1 [31]),
        .I1(pwm_o_OBUF_inst_i_3[31]),
        .I2(\reg_cmp_reg[31]_1 [30]),
        .I3(pwm_o_OBUF_inst_i_3[30]),
        .O(\reg_cmp_reg[31]_2 [3]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_19
       (.I0(\reg_cmp_reg[31]_1 [29]),
        .I1(pwm_o_OBUF_inst_i_3[29]),
        .I2(\reg_cmp_reg[31]_1 [28]),
        .I3(pwm_o_OBUF_inst_i_3[28]),
        .O(\reg_cmp_reg[31]_2 [2]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_20
       (.I0(\reg_cmp_reg[31]_1 [27]),
        .I1(pwm_o_OBUF_inst_i_3[27]),
        .I2(\reg_cmp_reg[31]_1 [26]),
        .I3(pwm_o_OBUF_inst_i_3[26]),
        .O(\reg_cmp_reg[31]_2 [1]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_21
       (.I0(\reg_cmp_reg[31]_1 [25]),
        .I1(pwm_o_OBUF_inst_i_3[25]),
        .I2(\reg_cmp_reg[31]_1 [24]),
        .I3(pwm_o_OBUF_inst_i_3[24]),
        .O(\reg_cmp_reg[31]_2 [0]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_27
       (.I0(\reg_cmp_reg[31]_1 [23]),
        .I1(pwm_o_OBUF_inst_i_3[23]),
        .I2(\reg_cmp_reg[31]_1 [22]),
        .I3(pwm_o_OBUF_inst_i_3[22]),
        .O(\reg_cmp_reg[23]_0 [3]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_28
       (.I0(\reg_cmp_reg[31]_1 [21]),
        .I1(pwm_o_OBUF_inst_i_3[21]),
        .I2(\reg_cmp_reg[31]_1 [20]),
        .I3(pwm_o_OBUF_inst_i_3[20]),
        .O(\reg_cmp_reg[23]_0 [2]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_29
       (.I0(\reg_cmp_reg[31]_1 [19]),
        .I1(pwm_o_OBUF_inst_i_3[19]),
        .I2(\reg_cmp_reg[31]_1 [18]),
        .I3(pwm_o_OBUF_inst_i_3[18]),
        .O(\reg_cmp_reg[23]_0 [1]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_30
       (.I0(\reg_cmp_reg[31]_1 [17]),
        .I1(pwm_o_OBUF_inst_i_3[17]),
        .I2(\reg_cmp_reg[31]_1 [16]),
        .I3(pwm_o_OBUF_inst_i_3[16]),
        .O(\reg_cmp_reg[23]_0 [0]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_36
       (.I0(\reg_cmp_reg[31]_1 [23]),
        .I1(pwm_o_OBUF_inst_i_3[23]),
        .I2(\reg_cmp_reg[31]_1 [22]),
        .I3(pwm_o_OBUF_inst_i_3[22]),
        .O(\reg_cmp_reg[23]_1 [3]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_37
       (.I0(\reg_cmp_reg[31]_1 [21]),
        .I1(pwm_o_OBUF_inst_i_3[21]),
        .I2(\reg_cmp_reg[31]_1 [20]),
        .I3(pwm_o_OBUF_inst_i_3[20]),
        .O(\reg_cmp_reg[23]_1 [2]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_38
       (.I0(\reg_cmp_reg[31]_1 [19]),
        .I1(pwm_o_OBUF_inst_i_3[19]),
        .I2(\reg_cmp_reg[31]_1 [18]),
        .I3(pwm_o_OBUF_inst_i_3[18]),
        .O(\reg_cmp_reg[23]_1 [1]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_39
       (.I0(\reg_cmp_reg[31]_1 [17]),
        .I1(pwm_o_OBUF_inst_i_3[17]),
        .I2(\reg_cmp_reg[31]_1 [16]),
        .I3(pwm_o_OBUF_inst_i_3[16]),
        .O(\reg_cmp_reg[23]_1 [0]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_45
       (.I0(\reg_cmp_reg[31]_1 [15]),
        .I1(pwm_o_OBUF_inst_i_3[15]),
        .I2(\reg_cmp_reg[31]_1 [14]),
        .I3(pwm_o_OBUF_inst_i_3[14]),
        .O(\reg_cmp_reg[15]_0 [3]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_46
       (.I0(\reg_cmp_reg[31]_1 [13]),
        .I1(pwm_o_OBUF_inst_i_3[13]),
        .I2(\reg_cmp_reg[31]_1 [12]),
        .I3(pwm_o_OBUF_inst_i_3[12]),
        .O(\reg_cmp_reg[15]_0 [2]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_47
       (.I0(\reg_cmp_reg[31]_1 [11]),
        .I1(pwm_o_OBUF_inst_i_3[11]),
        .I2(\reg_cmp_reg[31]_1 [10]),
        .I3(pwm_o_OBUF_inst_i_3[10]),
        .O(\reg_cmp_reg[15]_0 [1]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_48
       (.I0(\reg_cmp_reg[31]_1 [9]),
        .I1(pwm_o_OBUF_inst_i_3[9]),
        .I2(\reg_cmp_reg[31]_1 [8]),
        .I3(pwm_o_OBUF_inst_i_3[8]),
        .O(\reg_cmp_reg[15]_0 [0]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_54
       (.I0(\reg_cmp_reg[31]_1 [15]),
        .I1(pwm_o_OBUF_inst_i_3[15]),
        .I2(\reg_cmp_reg[31]_1 [14]),
        .I3(pwm_o_OBUF_inst_i_3[14]),
        .O(\reg_cmp_reg[15]_1 [3]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_55
       (.I0(\reg_cmp_reg[31]_1 [13]),
        .I1(pwm_o_OBUF_inst_i_3[13]),
        .I2(\reg_cmp_reg[31]_1 [12]),
        .I3(pwm_o_OBUF_inst_i_3[12]),
        .O(\reg_cmp_reg[15]_1 [2]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_56
       (.I0(\reg_cmp_reg[31]_1 [11]),
        .I1(pwm_o_OBUF_inst_i_3[11]),
        .I2(\reg_cmp_reg[31]_1 [10]),
        .I3(pwm_o_OBUF_inst_i_3[10]),
        .O(\reg_cmp_reg[15]_1 [1]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_57
       (.I0(\reg_cmp_reg[31]_1 [9]),
        .I1(pwm_o_OBUF_inst_i_3[9]),
        .I2(\reg_cmp_reg[31]_1 [8]),
        .I3(pwm_o_OBUF_inst_i_3[8]),
        .O(\reg_cmp_reg[15]_1 [0]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_62
       (.I0(\reg_cmp_reg[31]_1 [7]),
        .I1(pwm_o_OBUF_inst_i_3[7]),
        .I2(\reg_cmp_reg[31]_1 [6]),
        .I3(pwm_o_OBUF_inst_i_3[6]),
        .O(\reg_cmp_reg[7]_0 [3]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_63
       (.I0(\reg_cmp_reg[31]_1 [5]),
        .I1(pwm_o_OBUF_inst_i_3[5]),
        .I2(\reg_cmp_reg[31]_1 [4]),
        .I3(pwm_o_OBUF_inst_i_3[4]),
        .O(\reg_cmp_reg[7]_0 [2]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_64
       (.I0(\reg_cmp_reg[31]_1 [3]),
        .I1(pwm_o_OBUF_inst_i_3[3]),
        .I2(\reg_cmp_reg[31]_1 [2]),
        .I3(pwm_o_OBUF_inst_i_3[2]),
        .O(\reg_cmp_reg[7]_0 [1]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_65
       (.I0(\reg_cmp_reg[31]_1 [1]),
        .I1(pwm_o_OBUF_inst_i_3[1]),
        .I2(\reg_cmp_reg[31]_1 [0]),
        .I3(pwm_o_OBUF_inst_i_3[0]),
        .O(\reg_cmp_reg[7]_0 [0]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_70
       (.I0(\reg_cmp_reg[31]_1 [7]),
        .I1(pwm_o_OBUF_inst_i_3[7]),
        .I2(\reg_cmp_reg[31]_1 [6]),
        .I3(pwm_o_OBUF_inst_i_3[6]),
        .O(\reg_cmp_reg[7]_1 [3]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_71
       (.I0(\reg_cmp_reg[31]_1 [5]),
        .I1(pwm_o_OBUF_inst_i_3[5]),
        .I2(\reg_cmp_reg[31]_1 [4]),
        .I3(pwm_o_OBUF_inst_i_3[4]),
        .O(\reg_cmp_reg[7]_1 [2]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_72
       (.I0(\reg_cmp_reg[31]_1 [3]),
        .I1(pwm_o_OBUF_inst_i_3[3]),
        .I2(\reg_cmp_reg[31]_1 [2]),
        .I3(pwm_o_OBUF_inst_i_3[2]),
        .O(\reg_cmp_reg[7]_1 [1]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_73
       (.I0(\reg_cmp_reg[31]_1 [1]),
        .I1(pwm_o_OBUF_inst_i_3[1]),
        .I2(\reg_cmp_reg[31]_1 [0]),
        .I3(pwm_o_OBUF_inst_i_3[0]),
        .O(\reg_cmp_reg[7]_1 [0]));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_o_OBUF_inst_i_9
       (.I0(\reg_cmp_reg[31]_1 [31]),
        .I1(pwm_o_OBUF_inst_i_3[31]),
        .I2(\reg_cmp_reg[31]_1 [30]),
        .I3(pwm_o_OBUF_inst_i_3[30]),
        .O(\reg_cmp_reg[31]_0 [3]));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_cap[31]_i_1 
       (.I0(\reg_ctrl_reg_n_0_[6] ),
        .I1(capture_stb),
        .O(reg_cap0));
  FDCE \reg_cap_reg[0] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[0]),
        .Q(reg_cap[0]));
  FDCE \reg_cap_reg[10] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[10]),
        .Q(reg_cap[10]));
  FDCE \reg_cap_reg[11] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[11]),
        .Q(reg_cap[11]));
  FDCE \reg_cap_reg[12] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[12]),
        .Q(reg_cap[12]));
  FDCE \reg_cap_reg[13] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[13]),
        .Q(reg_cap[13]));
  FDCE \reg_cap_reg[14] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[14]),
        .Q(reg_cap[14]));
  FDCE \reg_cap_reg[15] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[15]),
        .Q(reg_cap[15]));
  FDCE \reg_cap_reg[16] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[16]),
        .Q(reg_cap[16]));
  FDCE \reg_cap_reg[17] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[17]),
        .Q(reg_cap[17]));
  FDCE \reg_cap_reg[18] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[18]),
        .Q(reg_cap[18]));
  FDCE \reg_cap_reg[19] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[19]),
        .Q(reg_cap[19]));
  FDCE \reg_cap_reg[1] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[1]),
        .Q(reg_cap[1]));
  FDCE \reg_cap_reg[20] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[20]),
        .Q(reg_cap[20]));
  FDCE \reg_cap_reg[21] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[21]),
        .Q(reg_cap[21]));
  FDCE \reg_cap_reg[22] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[22]),
        .Q(reg_cap[22]));
  FDCE \reg_cap_reg[23] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[23]),
        .Q(reg_cap[23]));
  FDCE \reg_cap_reg[24] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[24]),
        .Q(reg_cap[24]));
  FDCE \reg_cap_reg[25] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[25]),
        .Q(reg_cap[25]));
  FDCE \reg_cap_reg[26] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[26]),
        .Q(reg_cap[26]));
  FDCE \reg_cap_reg[27] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[27]),
        .Q(reg_cap[27]));
  FDCE \reg_cap_reg[28] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[28]),
        .Q(reg_cap[28]));
  FDCE \reg_cap_reg[29] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[29]),
        .Q(reg_cap[29]));
  FDCE \reg_cap_reg[2] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[2]),
        .Q(reg_cap[2]));
  FDCE \reg_cap_reg[30] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[30]),
        .Q(reg_cap[30]));
  FDCE \reg_cap_reg[31] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[31]),
        .Q(reg_cap[31]));
  FDCE \reg_cap_reg[3] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[3]),
        .Q(reg_cap[3]));
  FDCE \reg_cap_reg[4] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[4]),
        .Q(reg_cap[4]));
  FDCE \reg_cap_reg[5] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[5]),
        .Q(reg_cap[5]));
  FDCE \reg_cap_reg[6] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[6]),
        .Q(reg_cap[6]));
  FDCE \reg_cap_reg[7] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[7]),
        .Q(reg_cap[7]));
  FDCE \reg_cap_reg[8] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[8]),
        .Q(reg_cap[8]));
  FDCE \reg_cap_reg[9] 
       (.C(CLK),
        .CE(reg_cap0),
        .CLR(presetn),
        .D(D[9]),
        .Q(reg_cap[9]));
  LUT4 #(
    .INIT(16'h0020)) 
    \reg_cmp[31]_i_1 
       (.I0(paddr_IBUF[3]),
        .I1(paddr_IBUF[2]),
        .I2(paddr_IBUF[4]),
        .I3(\reg_cmp_reg[0]_0 ),
        .O(reg_cmp));
  FDCE \reg_cmp_reg[0] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[0]),
        .Q(\reg_cmp_reg[31]_1 [0]));
  FDCE \reg_cmp_reg[10] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[10]),
        .Q(\reg_cmp_reg[31]_1 [10]));
  FDCE \reg_cmp_reg[11] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[11]),
        .Q(\reg_cmp_reg[31]_1 [11]));
  FDCE \reg_cmp_reg[12] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[12]),
        .Q(\reg_cmp_reg[31]_1 [12]));
  FDCE \reg_cmp_reg[13] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[13]),
        .Q(\reg_cmp_reg[31]_1 [13]));
  FDCE \reg_cmp_reg[14] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[14]),
        .Q(\reg_cmp_reg[31]_1 [14]));
  FDCE \reg_cmp_reg[15] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[15]),
        .Q(\reg_cmp_reg[31]_1 [15]));
  FDCE \reg_cmp_reg[16] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[16]),
        .Q(\reg_cmp_reg[31]_1 [16]));
  FDCE \reg_cmp_reg[17] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[17]),
        .Q(\reg_cmp_reg[31]_1 [17]));
  FDCE \reg_cmp_reg[18] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[18]),
        .Q(\reg_cmp_reg[31]_1 [18]));
  FDCE \reg_cmp_reg[19] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[19]),
        .Q(\reg_cmp_reg[31]_1 [19]));
  FDCE \reg_cmp_reg[1] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[1]),
        .Q(\reg_cmp_reg[31]_1 [1]));
  FDCE \reg_cmp_reg[20] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[20]),
        .Q(\reg_cmp_reg[31]_1 [20]));
  FDCE \reg_cmp_reg[21] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[21]),
        .Q(\reg_cmp_reg[31]_1 [21]));
  FDCE \reg_cmp_reg[22] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[22]),
        .Q(\reg_cmp_reg[31]_1 [22]));
  FDCE \reg_cmp_reg[23] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[23]),
        .Q(\reg_cmp_reg[31]_1 [23]));
  FDCE \reg_cmp_reg[24] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[24]),
        .Q(\reg_cmp_reg[31]_1 [24]));
  FDCE \reg_cmp_reg[25] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[25]),
        .Q(\reg_cmp_reg[31]_1 [25]));
  FDCE \reg_cmp_reg[26] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[26]),
        .Q(\reg_cmp_reg[31]_1 [26]));
  FDCE \reg_cmp_reg[27] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[27]),
        .Q(\reg_cmp_reg[31]_1 [27]));
  FDCE \reg_cmp_reg[28] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[28]),
        .Q(\reg_cmp_reg[31]_1 [28]));
  FDCE \reg_cmp_reg[29] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[29]),
        .Q(\reg_cmp_reg[31]_1 [29]));
  FDCE \reg_cmp_reg[2] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[2]),
        .Q(\reg_cmp_reg[31]_1 [2]));
  FDCE \reg_cmp_reg[30] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[30]),
        .Q(\reg_cmp_reg[31]_1 [30]));
  FDCE \reg_cmp_reg[31] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[31]),
        .Q(\reg_cmp_reg[31]_1 [31]));
  FDCE \reg_cmp_reg[3] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[3]),
        .Q(\reg_cmp_reg[31]_1 [3]));
  FDCE \reg_cmp_reg[4] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[4]),
        .Q(\reg_cmp_reg[31]_1 [4]));
  FDCE \reg_cmp_reg[5] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[5]),
        .Q(\reg_cmp_reg[31]_1 [5]));
  FDCE \reg_cmp_reg[6] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[6]),
        .Q(\reg_cmp_reg[31]_1 [6]));
  FDCE \reg_cmp_reg[7] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[7]),
        .Q(\reg_cmp_reg[31]_1 [7]));
  FDCE \reg_cmp_reg[8] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[8]),
        .Q(\reg_cmp_reg[31]_1 [8]));
  FDCE \reg_cmp_reg[9] 
       (.C(CLK),
        .CE(reg_cmp),
        .CLR(presetn),
        .D(pwdata_IBUF[9]),
        .Q(\reg_cmp_reg[31]_1 [9]));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \reg_ctrl[31]_i_1 
       (.I0(\reg_ctrl[31]_i_3_n_0 ),
        .I1(paddr_IBUF[3]),
        .I2(paddr_IBUF[2]),
        .I3(paddr_IBUF[4]),
        .I4(paddr_IBUF[0]),
        .I5(paddr_IBUF[1]),
        .O(reg_ctrl));
  LUT1 #(
    .INIT(2'h1)) 
    \reg_ctrl[31]_i_2 
       (.I0(presetn_IBUF),
        .O(presetn));
  LUT4 #(
    .INIT(16'h4000)) 
    \reg_ctrl[31]_i_3 
       (.I0(paddr_IBUF[5]),
        .I1(penable_IBUF),
        .I2(psel_IBUF),
        .I3(pwrite_IBUF),
        .O(\reg_ctrl[31]_i_3_n_0 ));
  FDCE \reg_ctrl_reg[0] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[0]),
        .Q(en));
  FDCE \reg_ctrl_reg[10] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[10]),
        .Q(\reg_ctrl_reg_n_0_[10] ));
  FDCE \reg_ctrl_reg[11] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[11]),
        .Q(\reg_ctrl_reg_n_0_[11] ));
  FDCE \reg_ctrl_reg[12] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[12]),
        .Q(\reg_ctrl_reg_n_0_[12] ));
  FDCE \reg_ctrl_reg[13] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[13]),
        .Q(\reg_ctrl_reg_n_0_[13] ));
  FDCE \reg_ctrl_reg[14] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[14]),
        .Q(\reg_ctrl_reg_n_0_[14] ));
  FDCE \reg_ctrl_reg[15] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[15]),
        .Q(\reg_ctrl_reg_n_0_[15] ));
  FDCE \reg_ctrl_reg[16] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[16]),
        .Q(\reg_ctrl_reg_n_0_[16] ));
  FDCE \reg_ctrl_reg[17] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[17]),
        .Q(\reg_ctrl_reg_n_0_[17] ));
  FDCE \reg_ctrl_reg[18] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[18]),
        .Q(\reg_ctrl_reg_n_0_[18] ));
  FDCE \reg_ctrl_reg[19] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[19]),
        .Q(\reg_ctrl_reg_n_0_[19] ));
  FDCE \reg_ctrl_reg[1] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[1]),
        .Q(Q[0]));
  FDCE \reg_ctrl_reg[20] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[20]),
        .Q(\reg_ctrl_reg_n_0_[20] ));
  FDCE \reg_ctrl_reg[21] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[21]),
        .Q(\reg_ctrl_reg_n_0_[21] ));
  FDCE \reg_ctrl_reg[22] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[22]),
        .Q(\reg_ctrl_reg_n_0_[22] ));
  FDCE \reg_ctrl_reg[23] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[23]),
        .Q(\reg_ctrl_reg_n_0_[23] ));
  FDCE \reg_ctrl_reg[24] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[24]),
        .Q(\reg_ctrl_reg_n_0_[24] ));
  FDCE \reg_ctrl_reg[25] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[25]),
        .Q(\reg_ctrl_reg_n_0_[25] ));
  FDCE \reg_ctrl_reg[26] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[26]),
        .Q(\reg_ctrl_reg_n_0_[26] ));
  FDCE \reg_ctrl_reg[27] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[27]),
        .Q(\reg_ctrl_reg_n_0_[27] ));
  FDCE \reg_ctrl_reg[28] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[28]),
        .Q(\reg_ctrl_reg_n_0_[28] ));
  FDCE \reg_ctrl_reg[29] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[29]),
        .Q(\reg_ctrl_reg_n_0_[29] ));
  FDCE \reg_ctrl_reg[2] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[2]),
        .Q(Q[1]));
  FDCE \reg_ctrl_reg[30] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[30]),
        .Q(\reg_ctrl_reg_n_0_[30] ));
  FDCE \reg_ctrl_reg[31] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[31]),
        .Q(\reg_ctrl_reg_n_0_[31] ));
  FDCE \reg_ctrl_reg[3] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[3]),
        .Q(Q[2]));
  FDCE \reg_ctrl_reg[4] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[4]),
        .Q(pwm_en));
  FDCE \reg_ctrl_reg[5] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[5]),
        .Q(Q[3]));
  FDCE \reg_ctrl_reg[6] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[6]),
        .Q(\reg_ctrl_reg_n_0_[6] ));
  FDCE \reg_ctrl_reg[7] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[7]),
        .Q(\reg_ctrl_reg_n_0_[7] ));
  FDCE \reg_ctrl_reg[8] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[8]),
        .Q(\reg_ctrl_reg_n_0_[8] ));
  FDCE \reg_ctrl_reg[9] 
       (.C(CLK),
        .CE(reg_ctrl),
        .CLR(presetn),
        .D(pwdata_IBUF[9]),
        .Q(\reg_ctrl_reg_n_0_[9] ));
  LUT6 #(
    .INIT(64'h0000000000000200)) 
    \reg_int_en[31]_i_1 
       (.I0(\reg_ctrl[31]_i_3_n_0 ),
        .I1(paddr_IBUF[2]),
        .I2(paddr_IBUF[1]),
        .I3(paddr_IBUF[4]),
        .I4(paddr_IBUF[0]),
        .I5(paddr_IBUF[3]),
        .O(reg_int_en));
  FDCE \reg_int_en_reg[0] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[0]),
        .Q(\reg_int_en_reg_n_0_[0] ));
  FDCE \reg_int_en_reg[10] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[10]),
        .Q(\reg_int_en_reg_n_0_[10] ));
  FDCE \reg_int_en_reg[11] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[11]),
        .Q(\reg_int_en_reg_n_0_[11] ));
  FDCE \reg_int_en_reg[12] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[12]),
        .Q(\reg_int_en_reg_n_0_[12] ));
  FDCE \reg_int_en_reg[13] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[13]),
        .Q(\reg_int_en_reg_n_0_[13] ));
  FDCE \reg_int_en_reg[14] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[14]),
        .Q(\reg_int_en_reg_n_0_[14] ));
  FDCE \reg_int_en_reg[15] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[15]),
        .Q(\reg_int_en_reg_n_0_[15] ));
  FDCE \reg_int_en_reg[16] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[16]),
        .Q(\reg_int_en_reg_n_0_[16] ));
  FDCE \reg_int_en_reg[17] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[17]),
        .Q(\reg_int_en_reg_n_0_[17] ));
  FDCE \reg_int_en_reg[18] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[18]),
        .Q(\reg_int_en_reg_n_0_[18] ));
  FDCE \reg_int_en_reg[19] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[19]),
        .Q(\reg_int_en_reg_n_0_[19] ));
  FDCE \reg_int_en_reg[1] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[1]),
        .Q(\reg_int_en_reg_n_0_[1] ));
  FDCE \reg_int_en_reg[20] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[20]),
        .Q(\reg_int_en_reg_n_0_[20] ));
  FDCE \reg_int_en_reg[21] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[21]),
        .Q(\reg_int_en_reg_n_0_[21] ));
  FDCE \reg_int_en_reg[22] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[22]),
        .Q(\reg_int_en_reg_n_0_[22] ));
  FDCE \reg_int_en_reg[23] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[23]),
        .Q(\reg_int_en_reg_n_0_[23] ));
  FDCE \reg_int_en_reg[24] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[24]),
        .Q(\reg_int_en_reg_n_0_[24] ));
  FDCE \reg_int_en_reg[25] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[25]),
        .Q(\reg_int_en_reg_n_0_[25] ));
  FDCE \reg_int_en_reg[26] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[26]),
        .Q(\reg_int_en_reg_n_0_[26] ));
  FDCE \reg_int_en_reg[27] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[27]),
        .Q(\reg_int_en_reg_n_0_[27] ));
  FDCE \reg_int_en_reg[28] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[28]),
        .Q(\reg_int_en_reg_n_0_[28] ));
  FDCE \reg_int_en_reg[29] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[29]),
        .Q(\reg_int_en_reg_n_0_[29] ));
  FDCE \reg_int_en_reg[2] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[2]),
        .Q(\reg_int_en_reg_n_0_[2] ));
  FDCE \reg_int_en_reg[30] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[30]),
        .Q(\reg_int_en_reg_n_0_[30] ));
  FDCE \reg_int_en_reg[31] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[31]),
        .Q(\reg_int_en_reg_n_0_[31] ));
  FDCE \reg_int_en_reg[3] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[3]),
        .Q(\reg_int_en_reg_n_0_[3] ));
  FDCE \reg_int_en_reg[4] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[4]),
        .Q(\reg_int_en_reg_n_0_[4] ));
  FDCE \reg_int_en_reg[5] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[5]),
        .Q(\reg_int_en_reg_n_0_[5] ));
  FDCE \reg_int_en_reg[6] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[6]),
        .Q(\reg_int_en_reg_n_0_[6] ));
  FDCE \reg_int_en_reg[7] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[7]),
        .Q(\reg_int_en_reg_n_0_[7] ));
  FDCE \reg_int_en_reg[8] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[8]),
        .Q(\reg_int_en_reg_n_0_[8] ));
  FDCE \reg_int_en_reg[9] 
       (.C(CLK),
        .CE(reg_int_en),
        .CLR(presetn),
        .D(pwdata_IBUF[9]),
        .Q(\reg_int_en_reg_n_0_[9] ));
  LUT6 #(
    .INIT(64'h3F307F7F30307070)) 
    \reg_int_sts[0]_i_1 
       (.I0(\reg_int_sts[1]_i_2_n_0 ),
        .I1(\reg_int_sts[1]_i_3_n_0 ),
        .I2(trigger_o_OBUF),
        .I3(\reg_int_sts[1]_i_4_n_0 ),
        .I4(pwdata_IBUF[0]),
        .I5(reg_int_sts[0]),
        .O(\reg_int_sts[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3F307F7F30307070)) 
    \reg_int_sts[1]_i_1 
       (.I0(\reg_int_sts[1]_i_2_n_0 ),
        .I1(\reg_int_sts[1]_i_3_n_0 ),
        .I2(capture_stb),
        .I3(\reg_int_sts[1]_i_4_n_0 ),
        .I4(pwdata_IBUF[1]),
        .I5(reg_int_sts[1]),
        .O(\reg_int_sts[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFEFFFFFF)) 
    \reg_int_sts[1]_i_2 
       (.I0(paddr_IBUF[1]),
        .I1(paddr_IBUF[0]),
        .I2(paddr_IBUF[3]),
        .I3(paddr_IBUF[2]),
        .I4(paddr_IBUF[4]),
        .O(\reg_int_sts[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \reg_int_sts[1]_i_3 
       (.I0(\reg_ctrl[31]_i_3_n_0 ),
        .I1(paddr_IBUF[3]),
        .I2(paddr_IBUF[2]),
        .I3(paddr_IBUF[1]),
        .I4(paddr_IBUF[0]),
        .I5(paddr_IBUF[4]),
        .O(\reg_int_sts[1]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \reg_int_sts[1]_i_4 
       (.I0(paddr_IBUF[2]),
        .I1(paddr_IBUF[3]),
        .I2(paddr_IBUF[4]),
        .I3(\reg_cmp_reg[0]_0 ),
        .O(\reg_int_sts[1]_i_4_n_0 ));
  FDCE \reg_int_sts_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(presetn),
        .D(\reg_int_sts[0]_i_1_n_0 ),
        .Q(reg_int_sts[0]));
  FDCE \reg_int_sts_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(presetn),
        .D(\reg_int_sts[1]_i_1_n_0 ),
        .Q(reg_int_sts[1]));
  FDCE \reg_load_reg[0] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[0]),
        .Q(\reg_load_reg[29]_0 [0]));
  FDCE \reg_load_reg[10] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[10]),
        .Q(reg_load__0[10]));
  FDCE \reg_load_reg[11] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[11]),
        .Q(\reg_load_reg[29]_0 [5]));
  FDCE \reg_load_reg[12] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[12]),
        .Q(reg_load__0[12]));
  FDCE \reg_load_reg[13] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[13]),
        .Q(reg_load__0[13]));
  FDCE \reg_load_reg[14] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[14]),
        .Q(reg_load__0[14]));
  FDCE \reg_load_reg[15] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[15]),
        .Q(reg_load__0[15]));
  FDCE \reg_load_reg[16] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[16]),
        .Q(reg_load__0[16]));
  FDCE \reg_load_reg[17] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[17]),
        .Q(\reg_load_reg[29]_0 [6]));
  FDCE \reg_load_reg[18] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[18]),
        .Q(reg_load__0[18]));
  FDCE \reg_load_reg[19] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[19]),
        .Q(reg_load__0[19]));
  FDCE \reg_load_reg[1] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[1]),
        .Q(\reg_load_reg[29]_0 [1]));
  FDCE \reg_load_reg[20] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[20]),
        .Q(\reg_load_reg[29]_0 [7]));
  FDCE \reg_load_reg[21] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[21]),
        .Q(\reg_load_reg[29]_0 [8]));
  FDCE \reg_load_reg[22] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[22]),
        .Q(reg_load__0[22]));
  FDCE \reg_load_reg[23] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[23]),
        .Q(\reg_load_reg[29]_0 [9]));
  FDCE \reg_load_reg[24] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[24]),
        .Q(\reg_load_reg[29]_0 [10]));
  FDCE \reg_load_reg[25] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[25]),
        .Q(reg_load__0[25]));
  FDCE \reg_load_reg[26] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[26]),
        .Q(reg_load__0[26]));
  FDCE \reg_load_reg[27] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[27]),
        .Q(\reg_load_reg[29]_0 [11]));
  FDCE \reg_load_reg[28] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[28]),
        .Q(reg_load__0[28]));
  FDCE \reg_load_reg[29] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[29]),
        .Q(\reg_load_reg[29]_0 [12]));
  FDCE \reg_load_reg[2] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[2]),
        .Q(reg_load__0[2]));
  FDCE \reg_load_reg[30] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[30]),
        .Q(reg_load__0[30]));
  FDCE \reg_load_reg[31] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[31]),
        .Q(reg_load__0[31]));
  FDCE \reg_load_reg[3] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[3]),
        .Q(reg_load__0[3]));
  FDCE \reg_load_reg[4] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[4]),
        .Q(\reg_load_reg[29]_0 [2]));
  FDCE \reg_load_reg[5] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[5]),
        .Q(\reg_load_reg[29]_0 [3]));
  FDCE \reg_load_reg[6] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[6]),
        .Q(reg_load__0[6]));
  FDCE \reg_load_reg[7] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[7]),
        .Q(reg_load__0[7]));
  FDCE \reg_load_reg[8] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[8]),
        .Q(\reg_load_reg[29]_0 [4]));
  FDCE \reg_load_reg[9] 
       (.C(CLK),
        .CE(reg_load),
        .CLR(presetn),
        .D(pwdata_IBUF[9]),
        .Q(reg_load__0[9]));
  LUT6 #(
    .INIT(64'h0000000000000080)) 
    \reg_pre[31]_i_1 
       (.I0(\reg_ctrl[31]_i_3_n_0 ),
        .I1(paddr_IBUF[3]),
        .I2(paddr_IBUF[2]),
        .I3(paddr_IBUF[4]),
        .I4(paddr_IBUF[0]),
        .I5(paddr_IBUF[1]),
        .O(reg_pre_0));
  FDCE \reg_pre_reg[0] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[0]),
        .Q(\reg_pre_reg[15]_0 [0]));
  FDCE \reg_pre_reg[10] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[10]),
        .Q(\reg_pre_reg[15]_0 [10]));
  FDCE \reg_pre_reg[11] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[11]),
        .Q(\reg_pre_reg[15]_0 [11]));
  FDCE \reg_pre_reg[12] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[12]),
        .Q(\reg_pre_reg[15]_0 [12]));
  FDCE \reg_pre_reg[13] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[13]),
        .Q(\reg_pre_reg[15]_0 [13]));
  FDCE \reg_pre_reg[14] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[14]),
        .Q(\reg_pre_reg[15]_0 [14]));
  FDCE \reg_pre_reg[15] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[15]),
        .Q(\reg_pre_reg[15]_0 [15]));
  FDCE \reg_pre_reg[16] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[16]),
        .Q(reg_pre[16]));
  FDCE \reg_pre_reg[17] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[17]),
        .Q(reg_pre[17]));
  FDCE \reg_pre_reg[18] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[18]),
        .Q(reg_pre[18]));
  FDCE \reg_pre_reg[19] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[19]),
        .Q(reg_pre[19]));
  FDCE \reg_pre_reg[1] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[1]),
        .Q(\reg_pre_reg[15]_0 [1]));
  FDCE \reg_pre_reg[20] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[20]),
        .Q(reg_pre[20]));
  FDCE \reg_pre_reg[21] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[21]),
        .Q(reg_pre[21]));
  FDCE \reg_pre_reg[22] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[22]),
        .Q(reg_pre[22]));
  FDCE \reg_pre_reg[23] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[23]),
        .Q(reg_pre[23]));
  FDCE \reg_pre_reg[24] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[24]),
        .Q(reg_pre[24]));
  FDCE \reg_pre_reg[25] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[25]),
        .Q(reg_pre[25]));
  FDCE \reg_pre_reg[26] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[26]),
        .Q(reg_pre[26]));
  FDCE \reg_pre_reg[27] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[27]),
        .Q(reg_pre[27]));
  FDCE \reg_pre_reg[28] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[28]),
        .Q(reg_pre[28]));
  FDCE \reg_pre_reg[29] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[29]),
        .Q(reg_pre[29]));
  FDCE \reg_pre_reg[2] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[2]),
        .Q(\reg_pre_reg[15]_0 [2]));
  FDCE \reg_pre_reg[30] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[30]),
        .Q(reg_pre[30]));
  FDCE \reg_pre_reg[31] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[31]),
        .Q(reg_pre[31]));
  FDCE \reg_pre_reg[3] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[3]),
        .Q(\reg_pre_reg[15]_0 [3]));
  FDCE \reg_pre_reg[4] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[4]),
        .Q(\reg_pre_reg[15]_0 [4]));
  FDCE \reg_pre_reg[5] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[5]),
        .Q(\reg_pre_reg[15]_0 [5]));
  FDCE \reg_pre_reg[6] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[6]),
        .Q(\reg_pre_reg[15]_0 [6]));
  FDCE \reg_pre_reg[7] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[7]),
        .Q(\reg_pre_reg[15]_0 [7]));
  FDCE \reg_pre_reg[8] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[8]),
        .Q(\reg_pre_reg[15]_0 [8]));
  FDCE \reg_pre_reg[9] 
       (.C(CLK),
        .CE(reg_pre_0),
        .CLR(presetn),
        .D(pwdata_IBUF[9]),
        .Q(\reg_pre_reg[15]_0 [9]));
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
