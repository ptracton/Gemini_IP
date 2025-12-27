// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Fri Dec 26 18:21:42 2025
// Host        : salvage running 64-bit Linux Mint 22.1
// Command     : write_verilog -mode timesim -sdf_anno true -force results/bus_matrix_ahb_verilog/bus_matrix_ahb_netlist.v
// Design      : bus_matrix_ahb
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ADDR_WIDTH = "32" *) (* DATA_WIDTH = "32" *) (* DEFAULT_SLAVE_INDEX = "0" *) 
(* INPUT_PIPE_STAGES = "1'b0" *) (* M_SLAVES = "2" *) (* N_MASTERS = "2" *) 
(* OUTPUT_PIPE_STAGES = "1'b0" *) (* REGION_MAP_FLAT = "132'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" *) (* USE_DEFAULT_SLAVE = "1'b0" *) 
(* NotValidForBitStream *)
module bus_matrix_ahb
   (HCLK,
    HRESETn,
    HSEL_i,
    HADDR_i,
    HTRANS_i,
    HWRITE_i,
    HSIZE_i,
    HBURST_i,
    HPROT_i,
    HWDATA_i,
    HREADYOUT_o,
    HRESP_o,
    HRDATA_o,
    HSEL_o,
    HADDR_o,
    HTRANS_o,
    HWRITE_o,
    HSIZE_o,
    HBURST_o,
    HPROT_o,
    HWDATA_o,
    HREADY_i,
    HRESP_i,
    HRDATA_i);
  input HCLK;
  input HRESETn;
  input [1:0]HSEL_i;
  input [63:0]HADDR_i;
  input [3:0]HTRANS_i;
  input [1:0]HWRITE_i;
  input [5:0]HSIZE_i;
  input [5:0]HBURST_i;
  input [7:0]HPROT_i;
  input [63:0]HWDATA_i;
  output [1:0]HREADYOUT_o;
  output [3:0]HRESP_o;
  output [63:0]HRDATA_o;
  output [1:0]HSEL_o;
  output [63:0]HADDR_o;
  output [3:0]HTRANS_o;
  output [1:0]HWRITE_o;
  output [5:0]HSIZE_o;
  output [5:0]HBURST_o;
  output [7:0]HPROT_o;
  output [63:0]HWDATA_o;
  input [1:0]HREADY_i;
  input [3:0]HRESP_i;
  input [63:0]HRDATA_i;

  wire \GEN_ARBITERS[0].u_arb_n_0 ;
  wire \GEN_ARBITERS[0].u_arb_n_1 ;
  wire \GEN_ARBITERS[0].u_arb_n_52 ;
  wire \GEN_DECODERS[0].u_dec/slave_sel_o4__0 ;
  wire \GEN_DECODERS[1].u_dec/slave_sel_o4__0 ;
  wire [63:0]HADDR_i;
  wire [63:0]HADDR_i_IBUF;
  wire [63:0]HADDR_o;
  wire [31:0]HADDR_o_OBUF;
  wire [5:0]HBURST_i;
  wire [5:0]HBURST_i_IBUF;
  wire [5:0]HBURST_o;
  wire [2:0]HBURST_o_OBUF;
  wire HCLK;
  wire HCLK_IBUF;
  wire HCLK_IBUF_BUFG;
  wire [7:0]HPROT_i;
  wire [7:0]HPROT_i_IBUF;
  wire [7:0]HPROT_o;
  wire [3:0]HPROT_o_OBUF;
  wire [63:0]HRDATA_i;
  wire [31:0]HRDATA_i_IBUF;
  wire [63:0]HRDATA_o;
  wire [63:0]HRDATA_o_OBUF;
  wire [1:0]HREADYOUT_o;
  wire [1:0]HREADYOUT_o_OBUF;
  wire [1:0]HREADY_i;
  wire [0:0]HREADY_i_IBUF;
  wire HRESETn;
  wire HRESETn_IBUF;
  wire [3:0]HRESP_i;
  wire [1:0]HRESP_i_IBUF;
  wire [3:0]HRESP_o;
  wire [3:0]HRESP_o_OBUF;
  wire [1:0]HSEL_o;
  wire [0:0]HSEL_o_OBUF;
  wire [5:0]HSIZE_i;
  wire [5:0]HSIZE_i_IBUF;
  wire [5:0]HSIZE_o;
  wire [2:0]HSIZE_o_OBUF;
  wire [3:0]HTRANS_i;
  wire [3:0]HTRANS_i_IBUF;
  wire [3:0]HTRANS_o;
  wire [1:0]HTRANS_o_OBUF;
  wire [63:0]HWDATA_i;
  wire [63:0]HWDATA_i_IBUF;
  wire [63:0]HWDATA_o;
  wire [31:0]HWDATA_o_OBUF;
  wire [1:0]HWRITE_i;
  wire [1:0]HWRITE_i_IBUF;
  wire [1:0]HWRITE_o;
  wire [0:0]HWRITE_o_OBUF;
  wire \master_gnt_vector_data[1]_0 ;
  wire \slave_gnt_vector_data_reg_n_0_[0][0] ;

initial begin
 $sdf_annotate("bus_matrix_ahb_netlist.sdf",,,,"tool_control");
end
  bus_matrix_arbiter \GEN_ARBITERS[0].u_arb 
       (.HADDR_i_IBUF(HADDR_i_IBUF),
        .HADDR_o_OBUF(HADDR_o_OBUF),
        .HBURST_i_IBUF(HBURST_i_IBUF),
        .HBURST_o_OBUF(HBURST_o_OBUF),
        .HCLK_IBUF_BUFG(HCLK_IBUF_BUFG),
        .HPROT_i_IBUF(HPROT_i_IBUF),
        .HPROT_o_OBUF(HPROT_o_OBUF),
        .HREADYOUT_o_OBUF(HREADYOUT_o_OBUF),
        .HREADY_i_IBUF(HREADY_i_IBUF),
        .HRESETn(\GEN_ARBITERS[0].u_arb_n_52 ),
        .HRESETn_IBUF(HRESETn_IBUF),
        .HSEL_o_OBUF(HSEL_o_OBUF),
        .HSIZE_i_IBUF(HSIZE_i_IBUF),
        .HSIZE_o_OBUF(HSIZE_o_OBUF),
        .HTRANS_i_IBUF(HTRANS_i_IBUF),
        .HTRANS_o_OBUF(HTRANS_o_OBUF),
        .HWRITE_i_IBUF(HWRITE_i_IBUF),
        .HWRITE_o_OBUF(HWRITE_o_OBUF),
        .\gnt_o_reg[0]_0 (\GEN_ARBITERS[0].u_arb_n_1 ),
        .\gnt_o_reg[1]_0 (\GEN_ARBITERS[0].u_arb_n_0 ),
        .\master_gnt_vector_data[1]_0 (\master_gnt_vector_data[1]_0 ),
        .\slave_gnt_vector_data_reg[0][0] (\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .slave_sel_o4__0(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .slave_sel_o4__0_0(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ));
  IBUF \HADDR_i_IBUF[0]_inst 
       (.I(HADDR_i[0]),
        .O(HADDR_i_IBUF[0]));
  IBUF \HADDR_i_IBUF[10]_inst 
       (.I(HADDR_i[10]),
        .O(HADDR_i_IBUF[10]));
  IBUF \HADDR_i_IBUF[11]_inst 
       (.I(HADDR_i[11]),
        .O(HADDR_i_IBUF[11]));
  IBUF \HADDR_i_IBUF[12]_inst 
       (.I(HADDR_i[12]),
        .O(HADDR_i_IBUF[12]));
  IBUF \HADDR_i_IBUF[13]_inst 
       (.I(HADDR_i[13]),
        .O(HADDR_i_IBUF[13]));
  IBUF \HADDR_i_IBUF[14]_inst 
       (.I(HADDR_i[14]),
        .O(HADDR_i_IBUF[14]));
  IBUF \HADDR_i_IBUF[15]_inst 
       (.I(HADDR_i[15]),
        .O(HADDR_i_IBUF[15]));
  IBUF \HADDR_i_IBUF[16]_inst 
       (.I(HADDR_i[16]),
        .O(HADDR_i_IBUF[16]));
  IBUF \HADDR_i_IBUF[17]_inst 
       (.I(HADDR_i[17]),
        .O(HADDR_i_IBUF[17]));
  IBUF \HADDR_i_IBUF[18]_inst 
       (.I(HADDR_i[18]),
        .O(HADDR_i_IBUF[18]));
  IBUF \HADDR_i_IBUF[19]_inst 
       (.I(HADDR_i[19]),
        .O(HADDR_i_IBUF[19]));
  IBUF \HADDR_i_IBUF[1]_inst 
       (.I(HADDR_i[1]),
        .O(HADDR_i_IBUF[1]));
  IBUF \HADDR_i_IBUF[20]_inst 
       (.I(HADDR_i[20]),
        .O(HADDR_i_IBUF[20]));
  IBUF \HADDR_i_IBUF[21]_inst 
       (.I(HADDR_i[21]),
        .O(HADDR_i_IBUF[21]));
  IBUF \HADDR_i_IBUF[22]_inst 
       (.I(HADDR_i[22]),
        .O(HADDR_i_IBUF[22]));
  IBUF \HADDR_i_IBUF[23]_inst 
       (.I(HADDR_i[23]),
        .O(HADDR_i_IBUF[23]));
  IBUF \HADDR_i_IBUF[24]_inst 
       (.I(HADDR_i[24]),
        .O(HADDR_i_IBUF[24]));
  IBUF \HADDR_i_IBUF[25]_inst 
       (.I(HADDR_i[25]),
        .O(HADDR_i_IBUF[25]));
  IBUF \HADDR_i_IBUF[26]_inst 
       (.I(HADDR_i[26]),
        .O(HADDR_i_IBUF[26]));
  IBUF \HADDR_i_IBUF[27]_inst 
       (.I(HADDR_i[27]),
        .O(HADDR_i_IBUF[27]));
  IBUF \HADDR_i_IBUF[28]_inst 
       (.I(HADDR_i[28]),
        .O(HADDR_i_IBUF[28]));
  IBUF \HADDR_i_IBUF[29]_inst 
       (.I(HADDR_i[29]),
        .O(HADDR_i_IBUF[29]));
  IBUF \HADDR_i_IBUF[2]_inst 
       (.I(HADDR_i[2]),
        .O(HADDR_i_IBUF[2]));
  IBUF \HADDR_i_IBUF[30]_inst 
       (.I(HADDR_i[30]),
        .O(HADDR_i_IBUF[30]));
  IBUF \HADDR_i_IBUF[31]_inst 
       (.I(HADDR_i[31]),
        .O(HADDR_i_IBUF[31]));
  IBUF \HADDR_i_IBUF[32]_inst 
       (.I(HADDR_i[32]),
        .O(HADDR_i_IBUF[32]));
  IBUF \HADDR_i_IBUF[33]_inst 
       (.I(HADDR_i[33]),
        .O(HADDR_i_IBUF[33]));
  IBUF \HADDR_i_IBUF[34]_inst 
       (.I(HADDR_i[34]),
        .O(HADDR_i_IBUF[34]));
  IBUF \HADDR_i_IBUF[35]_inst 
       (.I(HADDR_i[35]),
        .O(HADDR_i_IBUF[35]));
  IBUF \HADDR_i_IBUF[36]_inst 
       (.I(HADDR_i[36]),
        .O(HADDR_i_IBUF[36]));
  IBUF \HADDR_i_IBUF[37]_inst 
       (.I(HADDR_i[37]),
        .O(HADDR_i_IBUF[37]));
  IBUF \HADDR_i_IBUF[38]_inst 
       (.I(HADDR_i[38]),
        .O(HADDR_i_IBUF[38]));
  IBUF \HADDR_i_IBUF[39]_inst 
       (.I(HADDR_i[39]),
        .O(HADDR_i_IBUF[39]));
  IBUF \HADDR_i_IBUF[3]_inst 
       (.I(HADDR_i[3]),
        .O(HADDR_i_IBUF[3]));
  IBUF \HADDR_i_IBUF[40]_inst 
       (.I(HADDR_i[40]),
        .O(HADDR_i_IBUF[40]));
  IBUF \HADDR_i_IBUF[41]_inst 
       (.I(HADDR_i[41]),
        .O(HADDR_i_IBUF[41]));
  IBUF \HADDR_i_IBUF[42]_inst 
       (.I(HADDR_i[42]),
        .O(HADDR_i_IBUF[42]));
  IBUF \HADDR_i_IBUF[43]_inst 
       (.I(HADDR_i[43]),
        .O(HADDR_i_IBUF[43]));
  IBUF \HADDR_i_IBUF[44]_inst 
       (.I(HADDR_i[44]),
        .O(HADDR_i_IBUF[44]));
  IBUF \HADDR_i_IBUF[45]_inst 
       (.I(HADDR_i[45]),
        .O(HADDR_i_IBUF[45]));
  IBUF \HADDR_i_IBUF[46]_inst 
       (.I(HADDR_i[46]),
        .O(HADDR_i_IBUF[46]));
  IBUF \HADDR_i_IBUF[47]_inst 
       (.I(HADDR_i[47]),
        .O(HADDR_i_IBUF[47]));
  IBUF \HADDR_i_IBUF[48]_inst 
       (.I(HADDR_i[48]),
        .O(HADDR_i_IBUF[48]));
  IBUF \HADDR_i_IBUF[49]_inst 
       (.I(HADDR_i[49]),
        .O(HADDR_i_IBUF[49]));
  IBUF \HADDR_i_IBUF[4]_inst 
       (.I(HADDR_i[4]),
        .O(HADDR_i_IBUF[4]));
  IBUF \HADDR_i_IBUF[50]_inst 
       (.I(HADDR_i[50]),
        .O(HADDR_i_IBUF[50]));
  IBUF \HADDR_i_IBUF[51]_inst 
       (.I(HADDR_i[51]),
        .O(HADDR_i_IBUF[51]));
  IBUF \HADDR_i_IBUF[52]_inst 
       (.I(HADDR_i[52]),
        .O(HADDR_i_IBUF[52]));
  IBUF \HADDR_i_IBUF[53]_inst 
       (.I(HADDR_i[53]),
        .O(HADDR_i_IBUF[53]));
  IBUF \HADDR_i_IBUF[54]_inst 
       (.I(HADDR_i[54]),
        .O(HADDR_i_IBUF[54]));
  IBUF \HADDR_i_IBUF[55]_inst 
       (.I(HADDR_i[55]),
        .O(HADDR_i_IBUF[55]));
  IBUF \HADDR_i_IBUF[56]_inst 
       (.I(HADDR_i[56]),
        .O(HADDR_i_IBUF[56]));
  IBUF \HADDR_i_IBUF[57]_inst 
       (.I(HADDR_i[57]),
        .O(HADDR_i_IBUF[57]));
  IBUF \HADDR_i_IBUF[58]_inst 
       (.I(HADDR_i[58]),
        .O(HADDR_i_IBUF[58]));
  IBUF \HADDR_i_IBUF[59]_inst 
       (.I(HADDR_i[59]),
        .O(HADDR_i_IBUF[59]));
  IBUF \HADDR_i_IBUF[5]_inst 
       (.I(HADDR_i[5]),
        .O(HADDR_i_IBUF[5]));
  IBUF \HADDR_i_IBUF[60]_inst 
       (.I(HADDR_i[60]),
        .O(HADDR_i_IBUF[60]));
  IBUF \HADDR_i_IBUF[61]_inst 
       (.I(HADDR_i[61]),
        .O(HADDR_i_IBUF[61]));
  IBUF \HADDR_i_IBUF[62]_inst 
       (.I(HADDR_i[62]),
        .O(HADDR_i_IBUF[62]));
  IBUF \HADDR_i_IBUF[63]_inst 
       (.I(HADDR_i[63]),
        .O(HADDR_i_IBUF[63]));
  IBUF \HADDR_i_IBUF[6]_inst 
       (.I(HADDR_i[6]),
        .O(HADDR_i_IBUF[6]));
  IBUF \HADDR_i_IBUF[7]_inst 
       (.I(HADDR_i[7]),
        .O(HADDR_i_IBUF[7]));
  IBUF \HADDR_i_IBUF[8]_inst 
       (.I(HADDR_i[8]),
        .O(HADDR_i_IBUF[8]));
  IBUF \HADDR_i_IBUF[9]_inst 
       (.I(HADDR_i[9]),
        .O(HADDR_i_IBUF[9]));
  OBUF \HADDR_o_OBUF[0]_inst 
       (.I(HADDR_o_OBUF[0]),
        .O(HADDR_o[0]));
  OBUF \HADDR_o_OBUF[10]_inst 
       (.I(HADDR_o_OBUF[10]),
        .O(HADDR_o[10]));
  OBUF \HADDR_o_OBUF[11]_inst 
       (.I(HADDR_o_OBUF[11]),
        .O(HADDR_o[11]));
  OBUF \HADDR_o_OBUF[12]_inst 
       (.I(HADDR_o_OBUF[12]),
        .O(HADDR_o[12]));
  OBUF \HADDR_o_OBUF[13]_inst 
       (.I(HADDR_o_OBUF[13]),
        .O(HADDR_o[13]));
  OBUF \HADDR_o_OBUF[14]_inst 
       (.I(HADDR_o_OBUF[14]),
        .O(HADDR_o[14]));
  OBUF \HADDR_o_OBUF[15]_inst 
       (.I(HADDR_o_OBUF[15]),
        .O(HADDR_o[15]));
  OBUF \HADDR_o_OBUF[16]_inst 
       (.I(HADDR_o_OBUF[16]),
        .O(HADDR_o[16]));
  OBUF \HADDR_o_OBUF[17]_inst 
       (.I(HADDR_o_OBUF[17]),
        .O(HADDR_o[17]));
  OBUF \HADDR_o_OBUF[18]_inst 
       (.I(HADDR_o_OBUF[18]),
        .O(HADDR_o[18]));
  OBUF \HADDR_o_OBUF[19]_inst 
       (.I(HADDR_o_OBUF[19]),
        .O(HADDR_o[19]));
  OBUF \HADDR_o_OBUF[1]_inst 
       (.I(HADDR_o_OBUF[1]),
        .O(HADDR_o[1]));
  OBUF \HADDR_o_OBUF[20]_inst 
       (.I(HADDR_o_OBUF[20]),
        .O(HADDR_o[20]));
  OBUF \HADDR_o_OBUF[21]_inst 
       (.I(HADDR_o_OBUF[21]),
        .O(HADDR_o[21]));
  OBUF \HADDR_o_OBUF[22]_inst 
       (.I(HADDR_o_OBUF[22]),
        .O(HADDR_o[22]));
  OBUF \HADDR_o_OBUF[23]_inst 
       (.I(HADDR_o_OBUF[23]),
        .O(HADDR_o[23]));
  OBUF \HADDR_o_OBUF[24]_inst 
       (.I(HADDR_o_OBUF[24]),
        .O(HADDR_o[24]));
  OBUF \HADDR_o_OBUF[25]_inst 
       (.I(HADDR_o_OBUF[25]),
        .O(HADDR_o[25]));
  OBUF \HADDR_o_OBUF[26]_inst 
       (.I(HADDR_o_OBUF[26]),
        .O(HADDR_o[26]));
  OBUF \HADDR_o_OBUF[27]_inst 
       (.I(HADDR_o_OBUF[27]),
        .O(HADDR_o[27]));
  OBUF \HADDR_o_OBUF[28]_inst 
       (.I(HADDR_o_OBUF[28]),
        .O(HADDR_o[28]));
  OBUF \HADDR_o_OBUF[29]_inst 
       (.I(HADDR_o_OBUF[29]),
        .O(HADDR_o[29]));
  OBUF \HADDR_o_OBUF[2]_inst 
       (.I(HADDR_o_OBUF[2]),
        .O(HADDR_o[2]));
  OBUF \HADDR_o_OBUF[30]_inst 
       (.I(HADDR_o_OBUF[30]),
        .O(HADDR_o[30]));
  OBUF \HADDR_o_OBUF[31]_inst 
       (.I(HADDR_o_OBUF[31]),
        .O(HADDR_o[31]));
  OBUF \HADDR_o_OBUF[32]_inst 
       (.I(1'b0),
        .O(HADDR_o[32]));
  OBUF \HADDR_o_OBUF[33]_inst 
       (.I(1'b0),
        .O(HADDR_o[33]));
  OBUF \HADDR_o_OBUF[34]_inst 
       (.I(1'b0),
        .O(HADDR_o[34]));
  OBUF \HADDR_o_OBUF[35]_inst 
       (.I(1'b0),
        .O(HADDR_o[35]));
  OBUF \HADDR_o_OBUF[36]_inst 
       (.I(1'b0),
        .O(HADDR_o[36]));
  OBUF \HADDR_o_OBUF[37]_inst 
       (.I(1'b0),
        .O(HADDR_o[37]));
  OBUF \HADDR_o_OBUF[38]_inst 
       (.I(1'b0),
        .O(HADDR_o[38]));
  OBUF \HADDR_o_OBUF[39]_inst 
       (.I(1'b0),
        .O(HADDR_o[39]));
  OBUF \HADDR_o_OBUF[3]_inst 
       (.I(HADDR_o_OBUF[3]),
        .O(HADDR_o[3]));
  OBUF \HADDR_o_OBUF[40]_inst 
       (.I(1'b0),
        .O(HADDR_o[40]));
  OBUF \HADDR_o_OBUF[41]_inst 
       (.I(1'b0),
        .O(HADDR_o[41]));
  OBUF \HADDR_o_OBUF[42]_inst 
       (.I(1'b0),
        .O(HADDR_o[42]));
  OBUF \HADDR_o_OBUF[43]_inst 
       (.I(1'b0),
        .O(HADDR_o[43]));
  OBUF \HADDR_o_OBUF[44]_inst 
       (.I(1'b0),
        .O(HADDR_o[44]));
  OBUF \HADDR_o_OBUF[45]_inst 
       (.I(1'b0),
        .O(HADDR_o[45]));
  OBUF \HADDR_o_OBUF[46]_inst 
       (.I(1'b0),
        .O(HADDR_o[46]));
  OBUF \HADDR_o_OBUF[47]_inst 
       (.I(1'b0),
        .O(HADDR_o[47]));
  OBUF \HADDR_o_OBUF[48]_inst 
       (.I(1'b0),
        .O(HADDR_o[48]));
  OBUF \HADDR_o_OBUF[49]_inst 
       (.I(1'b0),
        .O(HADDR_o[49]));
  OBUF \HADDR_o_OBUF[4]_inst 
       (.I(HADDR_o_OBUF[4]),
        .O(HADDR_o[4]));
  OBUF \HADDR_o_OBUF[50]_inst 
       (.I(1'b0),
        .O(HADDR_o[50]));
  OBUF \HADDR_o_OBUF[51]_inst 
       (.I(1'b0),
        .O(HADDR_o[51]));
  OBUF \HADDR_o_OBUF[52]_inst 
       (.I(1'b0),
        .O(HADDR_o[52]));
  OBUF \HADDR_o_OBUF[53]_inst 
       (.I(1'b0),
        .O(HADDR_o[53]));
  OBUF \HADDR_o_OBUF[54]_inst 
       (.I(1'b0),
        .O(HADDR_o[54]));
  OBUF \HADDR_o_OBUF[55]_inst 
       (.I(1'b0),
        .O(HADDR_o[55]));
  OBUF \HADDR_o_OBUF[56]_inst 
       (.I(1'b0),
        .O(HADDR_o[56]));
  OBUF \HADDR_o_OBUF[57]_inst 
       (.I(1'b0),
        .O(HADDR_o[57]));
  OBUF \HADDR_o_OBUF[58]_inst 
       (.I(1'b0),
        .O(HADDR_o[58]));
  OBUF \HADDR_o_OBUF[59]_inst 
       (.I(1'b0),
        .O(HADDR_o[59]));
  OBUF \HADDR_o_OBUF[5]_inst 
       (.I(HADDR_o_OBUF[5]),
        .O(HADDR_o[5]));
  OBUF \HADDR_o_OBUF[60]_inst 
       (.I(1'b0),
        .O(HADDR_o[60]));
  OBUF \HADDR_o_OBUF[61]_inst 
       (.I(1'b0),
        .O(HADDR_o[61]));
  OBUF \HADDR_o_OBUF[62]_inst 
       (.I(1'b0),
        .O(HADDR_o[62]));
  OBUF \HADDR_o_OBUF[63]_inst 
       (.I(1'b0),
        .O(HADDR_o[63]));
  OBUF \HADDR_o_OBUF[6]_inst 
       (.I(HADDR_o_OBUF[6]),
        .O(HADDR_o[6]));
  OBUF \HADDR_o_OBUF[7]_inst 
       (.I(HADDR_o_OBUF[7]),
        .O(HADDR_o[7]));
  OBUF \HADDR_o_OBUF[8]_inst 
       (.I(HADDR_o_OBUF[8]),
        .O(HADDR_o[8]));
  OBUF \HADDR_o_OBUF[9]_inst 
       (.I(HADDR_o_OBUF[9]),
        .O(HADDR_o[9]));
  IBUF \HBURST_i_IBUF[0]_inst 
       (.I(HBURST_i[0]),
        .O(HBURST_i_IBUF[0]));
  IBUF \HBURST_i_IBUF[1]_inst 
       (.I(HBURST_i[1]),
        .O(HBURST_i_IBUF[1]));
  IBUF \HBURST_i_IBUF[2]_inst 
       (.I(HBURST_i[2]),
        .O(HBURST_i_IBUF[2]));
  IBUF \HBURST_i_IBUF[3]_inst 
       (.I(HBURST_i[3]),
        .O(HBURST_i_IBUF[3]));
  IBUF \HBURST_i_IBUF[4]_inst 
       (.I(HBURST_i[4]),
        .O(HBURST_i_IBUF[4]));
  IBUF \HBURST_i_IBUF[5]_inst 
       (.I(HBURST_i[5]),
        .O(HBURST_i_IBUF[5]));
  OBUF \HBURST_o_OBUF[0]_inst 
       (.I(HBURST_o_OBUF[0]),
        .O(HBURST_o[0]));
  OBUF \HBURST_o_OBUF[1]_inst 
       (.I(HBURST_o_OBUF[1]),
        .O(HBURST_o[1]));
  OBUF \HBURST_o_OBUF[2]_inst 
       (.I(HBURST_o_OBUF[2]),
        .O(HBURST_o[2]));
  OBUF \HBURST_o_OBUF[3]_inst 
       (.I(1'b0),
        .O(HBURST_o[3]));
  OBUF \HBURST_o_OBUF[4]_inst 
       (.I(1'b0),
        .O(HBURST_o[4]));
  OBUF \HBURST_o_OBUF[5]_inst 
       (.I(1'b0),
        .O(HBURST_o[5]));
  BUFG HCLK_IBUF_BUFG_inst
       (.I(HCLK_IBUF),
        .O(HCLK_IBUF_BUFG));
  IBUF HCLK_IBUF_inst
       (.I(HCLK),
        .O(HCLK_IBUF));
  IBUF \HPROT_i_IBUF[0]_inst 
       (.I(HPROT_i[0]),
        .O(HPROT_i_IBUF[0]));
  IBUF \HPROT_i_IBUF[1]_inst 
       (.I(HPROT_i[1]),
        .O(HPROT_i_IBUF[1]));
  IBUF \HPROT_i_IBUF[2]_inst 
       (.I(HPROT_i[2]),
        .O(HPROT_i_IBUF[2]));
  IBUF \HPROT_i_IBUF[3]_inst 
       (.I(HPROT_i[3]),
        .O(HPROT_i_IBUF[3]));
  IBUF \HPROT_i_IBUF[4]_inst 
       (.I(HPROT_i[4]),
        .O(HPROT_i_IBUF[4]));
  IBUF \HPROT_i_IBUF[5]_inst 
       (.I(HPROT_i[5]),
        .O(HPROT_i_IBUF[5]));
  IBUF \HPROT_i_IBUF[6]_inst 
       (.I(HPROT_i[6]),
        .O(HPROT_i_IBUF[6]));
  IBUF \HPROT_i_IBUF[7]_inst 
       (.I(HPROT_i[7]),
        .O(HPROT_i_IBUF[7]));
  OBUF \HPROT_o_OBUF[0]_inst 
       (.I(HPROT_o_OBUF[0]),
        .O(HPROT_o[0]));
  OBUF \HPROT_o_OBUF[1]_inst 
       (.I(HPROT_o_OBUF[1]),
        .O(HPROT_o[1]));
  OBUF \HPROT_o_OBUF[2]_inst 
       (.I(HPROT_o_OBUF[2]),
        .O(HPROT_o[2]));
  OBUF \HPROT_o_OBUF[3]_inst 
       (.I(HPROT_o_OBUF[3]),
        .O(HPROT_o[3]));
  OBUF \HPROT_o_OBUF[4]_inst 
       (.I(1'b0),
        .O(HPROT_o[4]));
  OBUF \HPROT_o_OBUF[5]_inst 
       (.I(1'b0),
        .O(HPROT_o[5]));
  OBUF \HPROT_o_OBUF[6]_inst 
       (.I(1'b0),
        .O(HPROT_o[6]));
  OBUF \HPROT_o_OBUF[7]_inst 
       (.I(1'b0),
        .O(HPROT_o[7]));
  IBUF \HRDATA_i_IBUF[0]_inst 
       (.I(HRDATA_i[0]),
        .O(HRDATA_i_IBUF[0]));
  IBUF \HRDATA_i_IBUF[10]_inst 
       (.I(HRDATA_i[10]),
        .O(HRDATA_i_IBUF[10]));
  IBUF \HRDATA_i_IBUF[11]_inst 
       (.I(HRDATA_i[11]),
        .O(HRDATA_i_IBUF[11]));
  IBUF \HRDATA_i_IBUF[12]_inst 
       (.I(HRDATA_i[12]),
        .O(HRDATA_i_IBUF[12]));
  IBUF \HRDATA_i_IBUF[13]_inst 
       (.I(HRDATA_i[13]),
        .O(HRDATA_i_IBUF[13]));
  IBUF \HRDATA_i_IBUF[14]_inst 
       (.I(HRDATA_i[14]),
        .O(HRDATA_i_IBUF[14]));
  IBUF \HRDATA_i_IBUF[15]_inst 
       (.I(HRDATA_i[15]),
        .O(HRDATA_i_IBUF[15]));
  IBUF \HRDATA_i_IBUF[16]_inst 
       (.I(HRDATA_i[16]),
        .O(HRDATA_i_IBUF[16]));
  IBUF \HRDATA_i_IBUF[17]_inst 
       (.I(HRDATA_i[17]),
        .O(HRDATA_i_IBUF[17]));
  IBUF \HRDATA_i_IBUF[18]_inst 
       (.I(HRDATA_i[18]),
        .O(HRDATA_i_IBUF[18]));
  IBUF \HRDATA_i_IBUF[19]_inst 
       (.I(HRDATA_i[19]),
        .O(HRDATA_i_IBUF[19]));
  IBUF \HRDATA_i_IBUF[1]_inst 
       (.I(HRDATA_i[1]),
        .O(HRDATA_i_IBUF[1]));
  IBUF \HRDATA_i_IBUF[20]_inst 
       (.I(HRDATA_i[20]),
        .O(HRDATA_i_IBUF[20]));
  IBUF \HRDATA_i_IBUF[21]_inst 
       (.I(HRDATA_i[21]),
        .O(HRDATA_i_IBUF[21]));
  IBUF \HRDATA_i_IBUF[22]_inst 
       (.I(HRDATA_i[22]),
        .O(HRDATA_i_IBUF[22]));
  IBUF \HRDATA_i_IBUF[23]_inst 
       (.I(HRDATA_i[23]),
        .O(HRDATA_i_IBUF[23]));
  IBUF \HRDATA_i_IBUF[24]_inst 
       (.I(HRDATA_i[24]),
        .O(HRDATA_i_IBUF[24]));
  IBUF \HRDATA_i_IBUF[25]_inst 
       (.I(HRDATA_i[25]),
        .O(HRDATA_i_IBUF[25]));
  IBUF \HRDATA_i_IBUF[26]_inst 
       (.I(HRDATA_i[26]),
        .O(HRDATA_i_IBUF[26]));
  IBUF \HRDATA_i_IBUF[27]_inst 
       (.I(HRDATA_i[27]),
        .O(HRDATA_i_IBUF[27]));
  IBUF \HRDATA_i_IBUF[28]_inst 
       (.I(HRDATA_i[28]),
        .O(HRDATA_i_IBUF[28]));
  IBUF \HRDATA_i_IBUF[29]_inst 
       (.I(HRDATA_i[29]),
        .O(HRDATA_i_IBUF[29]));
  IBUF \HRDATA_i_IBUF[2]_inst 
       (.I(HRDATA_i[2]),
        .O(HRDATA_i_IBUF[2]));
  IBUF \HRDATA_i_IBUF[30]_inst 
       (.I(HRDATA_i[30]),
        .O(HRDATA_i_IBUF[30]));
  IBUF \HRDATA_i_IBUF[31]_inst 
       (.I(HRDATA_i[31]),
        .O(HRDATA_i_IBUF[31]));
  IBUF \HRDATA_i_IBUF[3]_inst 
       (.I(HRDATA_i[3]),
        .O(HRDATA_i_IBUF[3]));
  IBUF \HRDATA_i_IBUF[4]_inst 
       (.I(HRDATA_i[4]),
        .O(HRDATA_i_IBUF[4]));
  IBUF \HRDATA_i_IBUF[5]_inst 
       (.I(HRDATA_i[5]),
        .O(HRDATA_i_IBUF[5]));
  IBUF \HRDATA_i_IBUF[6]_inst 
       (.I(HRDATA_i[6]),
        .O(HRDATA_i_IBUF[6]));
  IBUF \HRDATA_i_IBUF[7]_inst 
       (.I(HRDATA_i[7]),
        .O(HRDATA_i_IBUF[7]));
  IBUF \HRDATA_i_IBUF[8]_inst 
       (.I(HRDATA_i[8]),
        .O(HRDATA_i_IBUF[8]));
  IBUF \HRDATA_i_IBUF[9]_inst 
       (.I(HRDATA_i[9]),
        .O(HRDATA_i_IBUF[9]));
  OBUF \HRDATA_o_OBUF[0]_inst 
       (.I(HRDATA_o_OBUF[0]),
        .O(HRDATA_o[0]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[0]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[0]),
        .O(HRDATA_o_OBUF[0]));
  OBUF \HRDATA_o_OBUF[10]_inst 
       (.I(HRDATA_o_OBUF[10]),
        .O(HRDATA_o[10]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[10]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[10]),
        .O(HRDATA_o_OBUF[10]));
  OBUF \HRDATA_o_OBUF[11]_inst 
       (.I(HRDATA_o_OBUF[11]),
        .O(HRDATA_o[11]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[11]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[11]),
        .O(HRDATA_o_OBUF[11]));
  OBUF \HRDATA_o_OBUF[12]_inst 
       (.I(HRDATA_o_OBUF[12]),
        .O(HRDATA_o[12]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[12]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[12]),
        .O(HRDATA_o_OBUF[12]));
  OBUF \HRDATA_o_OBUF[13]_inst 
       (.I(HRDATA_o_OBUF[13]),
        .O(HRDATA_o[13]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[13]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[13]),
        .O(HRDATA_o_OBUF[13]));
  OBUF \HRDATA_o_OBUF[14]_inst 
       (.I(HRDATA_o_OBUF[14]),
        .O(HRDATA_o[14]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[14]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[14]),
        .O(HRDATA_o_OBUF[14]));
  OBUF \HRDATA_o_OBUF[15]_inst 
       (.I(HRDATA_o_OBUF[15]),
        .O(HRDATA_o[15]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[15]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[15]),
        .O(HRDATA_o_OBUF[15]));
  OBUF \HRDATA_o_OBUF[16]_inst 
       (.I(HRDATA_o_OBUF[16]),
        .O(HRDATA_o[16]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[16]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[16]),
        .O(HRDATA_o_OBUF[16]));
  OBUF \HRDATA_o_OBUF[17]_inst 
       (.I(HRDATA_o_OBUF[17]),
        .O(HRDATA_o[17]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[17]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[17]),
        .O(HRDATA_o_OBUF[17]));
  OBUF \HRDATA_o_OBUF[18]_inst 
       (.I(HRDATA_o_OBUF[18]),
        .O(HRDATA_o[18]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[18]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[18]),
        .O(HRDATA_o_OBUF[18]));
  OBUF \HRDATA_o_OBUF[19]_inst 
       (.I(HRDATA_o_OBUF[19]),
        .O(HRDATA_o[19]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[19]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[19]),
        .O(HRDATA_o_OBUF[19]));
  OBUF \HRDATA_o_OBUF[1]_inst 
       (.I(HRDATA_o_OBUF[1]),
        .O(HRDATA_o[1]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[1]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[1]),
        .O(HRDATA_o_OBUF[1]));
  OBUF \HRDATA_o_OBUF[20]_inst 
       (.I(HRDATA_o_OBUF[20]),
        .O(HRDATA_o[20]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[20]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[20]),
        .O(HRDATA_o_OBUF[20]));
  OBUF \HRDATA_o_OBUF[21]_inst 
       (.I(HRDATA_o_OBUF[21]),
        .O(HRDATA_o[21]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[21]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[21]),
        .O(HRDATA_o_OBUF[21]));
  OBUF \HRDATA_o_OBUF[22]_inst 
       (.I(HRDATA_o_OBUF[22]),
        .O(HRDATA_o[22]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[22]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[22]),
        .O(HRDATA_o_OBUF[22]));
  OBUF \HRDATA_o_OBUF[23]_inst 
       (.I(HRDATA_o_OBUF[23]),
        .O(HRDATA_o[23]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[23]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[23]),
        .O(HRDATA_o_OBUF[23]));
  OBUF \HRDATA_o_OBUF[24]_inst 
       (.I(HRDATA_o_OBUF[24]),
        .O(HRDATA_o[24]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[24]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[24]),
        .O(HRDATA_o_OBUF[24]));
  OBUF \HRDATA_o_OBUF[25]_inst 
       (.I(HRDATA_o_OBUF[25]),
        .O(HRDATA_o[25]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[25]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[25]),
        .O(HRDATA_o_OBUF[25]));
  OBUF \HRDATA_o_OBUF[26]_inst 
       (.I(HRDATA_o_OBUF[26]),
        .O(HRDATA_o[26]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[26]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[26]),
        .O(HRDATA_o_OBUF[26]));
  OBUF \HRDATA_o_OBUF[27]_inst 
       (.I(HRDATA_o_OBUF[27]),
        .O(HRDATA_o[27]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[27]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[27]),
        .O(HRDATA_o_OBUF[27]));
  OBUF \HRDATA_o_OBUF[28]_inst 
       (.I(HRDATA_o_OBUF[28]),
        .O(HRDATA_o[28]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[28]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[28]),
        .O(HRDATA_o_OBUF[28]));
  OBUF \HRDATA_o_OBUF[29]_inst 
       (.I(HRDATA_o_OBUF[29]),
        .O(HRDATA_o[29]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[29]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[29]),
        .O(HRDATA_o_OBUF[29]));
  OBUF \HRDATA_o_OBUF[2]_inst 
       (.I(HRDATA_o_OBUF[2]),
        .O(HRDATA_o[2]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[2]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[2]),
        .O(HRDATA_o_OBUF[2]));
  OBUF \HRDATA_o_OBUF[30]_inst 
       (.I(HRDATA_o_OBUF[30]),
        .O(HRDATA_o[30]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[30]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[30]),
        .O(HRDATA_o_OBUF[30]));
  OBUF \HRDATA_o_OBUF[31]_inst 
       (.I(HRDATA_o_OBUF[31]),
        .O(HRDATA_o[31]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[31]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[31]),
        .O(HRDATA_o_OBUF[31]));
  OBUF \HRDATA_o_OBUF[32]_inst 
       (.I(HRDATA_o_OBUF[32]),
        .O(HRDATA_o[32]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[32]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[0]),
        .O(HRDATA_o_OBUF[32]));
  OBUF \HRDATA_o_OBUF[33]_inst 
       (.I(HRDATA_o_OBUF[33]),
        .O(HRDATA_o[33]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[33]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[1]),
        .O(HRDATA_o_OBUF[33]));
  OBUF \HRDATA_o_OBUF[34]_inst 
       (.I(HRDATA_o_OBUF[34]),
        .O(HRDATA_o[34]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[34]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[2]),
        .O(HRDATA_o_OBUF[34]));
  OBUF \HRDATA_o_OBUF[35]_inst 
       (.I(HRDATA_o_OBUF[35]),
        .O(HRDATA_o[35]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[35]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[3]),
        .O(HRDATA_o_OBUF[35]));
  OBUF \HRDATA_o_OBUF[36]_inst 
       (.I(HRDATA_o_OBUF[36]),
        .O(HRDATA_o[36]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[36]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[4]),
        .O(HRDATA_o_OBUF[36]));
  OBUF \HRDATA_o_OBUF[37]_inst 
       (.I(HRDATA_o_OBUF[37]),
        .O(HRDATA_o[37]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[37]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[5]),
        .O(HRDATA_o_OBUF[37]));
  OBUF \HRDATA_o_OBUF[38]_inst 
       (.I(HRDATA_o_OBUF[38]),
        .O(HRDATA_o[38]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[38]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[6]),
        .O(HRDATA_o_OBUF[38]));
  OBUF \HRDATA_o_OBUF[39]_inst 
       (.I(HRDATA_o_OBUF[39]),
        .O(HRDATA_o[39]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[39]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[7]),
        .O(HRDATA_o_OBUF[39]));
  OBUF \HRDATA_o_OBUF[3]_inst 
       (.I(HRDATA_o_OBUF[3]),
        .O(HRDATA_o[3]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[3]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[3]),
        .O(HRDATA_o_OBUF[3]));
  OBUF \HRDATA_o_OBUF[40]_inst 
       (.I(HRDATA_o_OBUF[40]),
        .O(HRDATA_o[40]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[40]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[8]),
        .O(HRDATA_o_OBUF[40]));
  OBUF \HRDATA_o_OBUF[41]_inst 
       (.I(HRDATA_o_OBUF[41]),
        .O(HRDATA_o[41]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[41]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[9]),
        .O(HRDATA_o_OBUF[41]));
  OBUF \HRDATA_o_OBUF[42]_inst 
       (.I(HRDATA_o_OBUF[42]),
        .O(HRDATA_o[42]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[42]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[10]),
        .O(HRDATA_o_OBUF[42]));
  OBUF \HRDATA_o_OBUF[43]_inst 
       (.I(HRDATA_o_OBUF[43]),
        .O(HRDATA_o[43]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[43]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[11]),
        .O(HRDATA_o_OBUF[43]));
  OBUF \HRDATA_o_OBUF[44]_inst 
       (.I(HRDATA_o_OBUF[44]),
        .O(HRDATA_o[44]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[44]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[12]),
        .O(HRDATA_o_OBUF[44]));
  OBUF \HRDATA_o_OBUF[45]_inst 
       (.I(HRDATA_o_OBUF[45]),
        .O(HRDATA_o[45]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[45]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[13]),
        .O(HRDATA_o_OBUF[45]));
  OBUF \HRDATA_o_OBUF[46]_inst 
       (.I(HRDATA_o_OBUF[46]),
        .O(HRDATA_o[46]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[46]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[14]),
        .O(HRDATA_o_OBUF[46]));
  OBUF \HRDATA_o_OBUF[47]_inst 
       (.I(HRDATA_o_OBUF[47]),
        .O(HRDATA_o[47]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[47]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[15]),
        .O(HRDATA_o_OBUF[47]));
  OBUF \HRDATA_o_OBUF[48]_inst 
       (.I(HRDATA_o_OBUF[48]),
        .O(HRDATA_o[48]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[48]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[16]),
        .O(HRDATA_o_OBUF[48]));
  OBUF \HRDATA_o_OBUF[49]_inst 
       (.I(HRDATA_o_OBUF[49]),
        .O(HRDATA_o[49]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[49]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[17]),
        .O(HRDATA_o_OBUF[49]));
  OBUF \HRDATA_o_OBUF[4]_inst 
       (.I(HRDATA_o_OBUF[4]),
        .O(HRDATA_o[4]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[4]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[4]),
        .O(HRDATA_o_OBUF[4]));
  OBUF \HRDATA_o_OBUF[50]_inst 
       (.I(HRDATA_o_OBUF[50]),
        .O(HRDATA_o[50]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[50]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[18]),
        .O(HRDATA_o_OBUF[50]));
  OBUF \HRDATA_o_OBUF[51]_inst 
       (.I(HRDATA_o_OBUF[51]),
        .O(HRDATA_o[51]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[51]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[19]),
        .O(HRDATA_o_OBUF[51]));
  OBUF \HRDATA_o_OBUF[52]_inst 
       (.I(HRDATA_o_OBUF[52]),
        .O(HRDATA_o[52]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[52]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[20]),
        .O(HRDATA_o_OBUF[52]));
  OBUF \HRDATA_o_OBUF[53]_inst 
       (.I(HRDATA_o_OBUF[53]),
        .O(HRDATA_o[53]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[53]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[21]),
        .O(HRDATA_o_OBUF[53]));
  OBUF \HRDATA_o_OBUF[54]_inst 
       (.I(HRDATA_o_OBUF[54]),
        .O(HRDATA_o[54]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[54]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[22]),
        .O(HRDATA_o_OBUF[54]));
  OBUF \HRDATA_o_OBUF[55]_inst 
       (.I(HRDATA_o_OBUF[55]),
        .O(HRDATA_o[55]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[55]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[23]),
        .O(HRDATA_o_OBUF[55]));
  OBUF \HRDATA_o_OBUF[56]_inst 
       (.I(HRDATA_o_OBUF[56]),
        .O(HRDATA_o[56]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[56]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[24]),
        .O(HRDATA_o_OBUF[56]));
  OBUF \HRDATA_o_OBUF[57]_inst 
       (.I(HRDATA_o_OBUF[57]),
        .O(HRDATA_o[57]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[57]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[25]),
        .O(HRDATA_o_OBUF[57]));
  OBUF \HRDATA_o_OBUF[58]_inst 
       (.I(HRDATA_o_OBUF[58]),
        .O(HRDATA_o[58]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[58]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[26]),
        .O(HRDATA_o_OBUF[58]));
  OBUF \HRDATA_o_OBUF[59]_inst 
       (.I(HRDATA_o_OBUF[59]),
        .O(HRDATA_o[59]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[59]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[27]),
        .O(HRDATA_o_OBUF[59]));
  OBUF \HRDATA_o_OBUF[5]_inst 
       (.I(HRDATA_o_OBUF[5]),
        .O(HRDATA_o[5]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[5]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[5]),
        .O(HRDATA_o_OBUF[5]));
  OBUF \HRDATA_o_OBUF[60]_inst 
       (.I(HRDATA_o_OBUF[60]),
        .O(HRDATA_o[60]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[60]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[28]),
        .O(HRDATA_o_OBUF[60]));
  OBUF \HRDATA_o_OBUF[61]_inst 
       (.I(HRDATA_o_OBUF[61]),
        .O(HRDATA_o[61]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[61]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[29]),
        .O(HRDATA_o_OBUF[61]));
  OBUF \HRDATA_o_OBUF[62]_inst 
       (.I(HRDATA_o_OBUF[62]),
        .O(HRDATA_o[62]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[62]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[30]),
        .O(HRDATA_o_OBUF[62]));
  OBUF \HRDATA_o_OBUF[63]_inst 
       (.I(HRDATA_o_OBUF[63]),
        .O(HRDATA_o[63]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[63]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRDATA_i_IBUF[31]),
        .O(HRDATA_o_OBUF[63]));
  OBUF \HRDATA_o_OBUF[6]_inst 
       (.I(HRDATA_o_OBUF[6]),
        .O(HRDATA_o[6]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[6]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[6]),
        .O(HRDATA_o_OBUF[6]));
  OBUF \HRDATA_o_OBUF[7]_inst 
       (.I(HRDATA_o_OBUF[7]),
        .O(HRDATA_o[7]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[7]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[7]),
        .O(HRDATA_o_OBUF[7]));
  OBUF \HRDATA_o_OBUF[8]_inst 
       (.I(HRDATA_o_OBUF[8]),
        .O(HRDATA_o[8]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[8]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[8]),
        .O(HRDATA_o_OBUF[8]));
  OBUF \HRDATA_o_OBUF[9]_inst 
       (.I(HRDATA_o_OBUF[9]),
        .O(HRDATA_o[9]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRDATA_o_OBUF[9]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRDATA_i_IBUF[9]),
        .O(HRDATA_o_OBUF[9]));
  OBUF \HREADYOUT_o_OBUF[0]_inst 
       (.I(HREADYOUT_o_OBUF[0]),
        .O(HREADYOUT_o[0]));
  OBUF \HREADYOUT_o_OBUF[1]_inst 
       (.I(HREADYOUT_o_OBUF[1]),
        .O(HREADYOUT_o[1]));
  IBUF \HREADY_i_IBUF[0]_inst 
       (.I(HREADY_i[0]),
        .O(HREADY_i_IBUF));
  IBUF HRESETn_IBUF_inst
       (.I(HRESETn),
        .O(HRESETn_IBUF));
  IBUF \HRESP_i_IBUF[0]_inst 
       (.I(HRESP_i[0]),
        .O(HRESP_i_IBUF[0]));
  IBUF \HRESP_i_IBUF[1]_inst 
       (.I(HRESP_i[1]),
        .O(HRESP_i_IBUF[1]));
  OBUF \HRESP_o_OBUF[0]_inst 
       (.I(HRESP_o_OBUF[0]),
        .O(HRESP_o[0]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h8F88)) 
    \HRESP_o_OBUF[0]_inst_i_1 
       (.I0(HRESP_i_IBUF[0]),
        .I1(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I2(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I3(HTRANS_i_IBUF[1]),
        .O(HRESP_o_OBUF[0]));
  OBUF \HRESP_o_OBUF[1]_inst 
       (.I(HRESP_o_OBUF[1]),
        .O(HRESP_o[1]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRESP_o_OBUF[1]_inst_i_1 
       (.I0(HTRANS_i_IBUF[1]),
        .I1(\GEN_DECODERS[0].u_dec/slave_sel_o4__0 ),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(HRESP_i_IBUF[1]),
        .O(HRESP_o_OBUF[1]));
  OBUF \HRESP_o_OBUF[2]_inst 
       (.I(HRESP_o_OBUF[2]),
        .O(HRESP_o[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h8F88)) 
    \HRESP_o_OBUF[2]_inst_i_1 
       (.I0(HRESP_i_IBUF[0]),
        .I1(\master_gnt_vector_data[1]_0 ),
        .I2(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I3(HTRANS_i_IBUF[3]),
        .O(HRESP_o_OBUF[2]));
  OBUF \HRESP_o_OBUF[3]_inst 
       (.I(HRESP_o_OBUF[3]),
        .O(HRESP_o[3]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hD000)) 
    \HRESP_o_OBUF[3]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(\GEN_DECODERS[1].u_dec/slave_sel_o4__0 ),
        .I2(\master_gnt_vector_data[1]_0 ),
        .I3(HRESP_i_IBUF[1]),
        .O(HRESP_o_OBUF[3]));
  OBUF \HSEL_o_OBUF[0]_inst 
       (.I(HSEL_o_OBUF),
        .O(HSEL_o[0]));
  OBUF \HSEL_o_OBUF[1]_inst 
       (.I(1'b0),
        .O(HSEL_o[1]));
  IBUF \HSIZE_i_IBUF[0]_inst 
       (.I(HSIZE_i[0]),
        .O(HSIZE_i_IBUF[0]));
  IBUF \HSIZE_i_IBUF[1]_inst 
       (.I(HSIZE_i[1]),
        .O(HSIZE_i_IBUF[1]));
  IBUF \HSIZE_i_IBUF[2]_inst 
       (.I(HSIZE_i[2]),
        .O(HSIZE_i_IBUF[2]));
  IBUF \HSIZE_i_IBUF[3]_inst 
       (.I(HSIZE_i[3]),
        .O(HSIZE_i_IBUF[3]));
  IBUF \HSIZE_i_IBUF[4]_inst 
       (.I(HSIZE_i[4]),
        .O(HSIZE_i_IBUF[4]));
  IBUF \HSIZE_i_IBUF[5]_inst 
       (.I(HSIZE_i[5]),
        .O(HSIZE_i_IBUF[5]));
  OBUF \HSIZE_o_OBUF[0]_inst 
       (.I(HSIZE_o_OBUF[0]),
        .O(HSIZE_o[0]));
  OBUF \HSIZE_o_OBUF[1]_inst 
       (.I(HSIZE_o_OBUF[1]),
        .O(HSIZE_o[1]));
  OBUF \HSIZE_o_OBUF[2]_inst 
       (.I(HSIZE_o_OBUF[2]),
        .O(HSIZE_o[2]));
  OBUF \HSIZE_o_OBUF[3]_inst 
       (.I(1'b0),
        .O(HSIZE_o[3]));
  OBUF \HSIZE_o_OBUF[4]_inst 
       (.I(1'b0),
        .O(HSIZE_o[4]));
  OBUF \HSIZE_o_OBUF[5]_inst 
       (.I(1'b0),
        .O(HSIZE_o[5]));
  IBUF \HTRANS_i_IBUF[0]_inst 
       (.I(HTRANS_i[0]),
        .O(HTRANS_i_IBUF[0]));
  IBUF \HTRANS_i_IBUF[1]_inst 
       (.I(HTRANS_i[1]),
        .O(HTRANS_i_IBUF[1]));
  IBUF \HTRANS_i_IBUF[2]_inst 
       (.I(HTRANS_i[2]),
        .O(HTRANS_i_IBUF[2]));
  IBUF \HTRANS_i_IBUF[3]_inst 
       (.I(HTRANS_i[3]),
        .O(HTRANS_i_IBUF[3]));
  OBUF \HTRANS_o_OBUF[0]_inst 
       (.I(HTRANS_o_OBUF[0]),
        .O(HTRANS_o[0]));
  OBUF \HTRANS_o_OBUF[1]_inst 
       (.I(HTRANS_o_OBUF[1]),
        .O(HTRANS_o[1]));
  OBUF \HTRANS_o_OBUF[2]_inst 
       (.I(1'b0),
        .O(HTRANS_o[2]));
  OBUF \HTRANS_o_OBUF[3]_inst 
       (.I(1'b0),
        .O(HTRANS_o[3]));
  IBUF \HWDATA_i_IBUF[0]_inst 
       (.I(HWDATA_i[0]),
        .O(HWDATA_i_IBUF[0]));
  IBUF \HWDATA_i_IBUF[10]_inst 
       (.I(HWDATA_i[10]),
        .O(HWDATA_i_IBUF[10]));
  IBUF \HWDATA_i_IBUF[11]_inst 
       (.I(HWDATA_i[11]),
        .O(HWDATA_i_IBUF[11]));
  IBUF \HWDATA_i_IBUF[12]_inst 
       (.I(HWDATA_i[12]),
        .O(HWDATA_i_IBUF[12]));
  IBUF \HWDATA_i_IBUF[13]_inst 
       (.I(HWDATA_i[13]),
        .O(HWDATA_i_IBUF[13]));
  IBUF \HWDATA_i_IBUF[14]_inst 
       (.I(HWDATA_i[14]),
        .O(HWDATA_i_IBUF[14]));
  IBUF \HWDATA_i_IBUF[15]_inst 
       (.I(HWDATA_i[15]),
        .O(HWDATA_i_IBUF[15]));
  IBUF \HWDATA_i_IBUF[16]_inst 
       (.I(HWDATA_i[16]),
        .O(HWDATA_i_IBUF[16]));
  IBUF \HWDATA_i_IBUF[17]_inst 
       (.I(HWDATA_i[17]),
        .O(HWDATA_i_IBUF[17]));
  IBUF \HWDATA_i_IBUF[18]_inst 
       (.I(HWDATA_i[18]),
        .O(HWDATA_i_IBUF[18]));
  IBUF \HWDATA_i_IBUF[19]_inst 
       (.I(HWDATA_i[19]),
        .O(HWDATA_i_IBUF[19]));
  IBUF \HWDATA_i_IBUF[1]_inst 
       (.I(HWDATA_i[1]),
        .O(HWDATA_i_IBUF[1]));
  IBUF \HWDATA_i_IBUF[20]_inst 
       (.I(HWDATA_i[20]),
        .O(HWDATA_i_IBUF[20]));
  IBUF \HWDATA_i_IBUF[21]_inst 
       (.I(HWDATA_i[21]),
        .O(HWDATA_i_IBUF[21]));
  IBUF \HWDATA_i_IBUF[22]_inst 
       (.I(HWDATA_i[22]),
        .O(HWDATA_i_IBUF[22]));
  IBUF \HWDATA_i_IBUF[23]_inst 
       (.I(HWDATA_i[23]),
        .O(HWDATA_i_IBUF[23]));
  IBUF \HWDATA_i_IBUF[24]_inst 
       (.I(HWDATA_i[24]),
        .O(HWDATA_i_IBUF[24]));
  IBUF \HWDATA_i_IBUF[25]_inst 
       (.I(HWDATA_i[25]),
        .O(HWDATA_i_IBUF[25]));
  IBUF \HWDATA_i_IBUF[26]_inst 
       (.I(HWDATA_i[26]),
        .O(HWDATA_i_IBUF[26]));
  IBUF \HWDATA_i_IBUF[27]_inst 
       (.I(HWDATA_i[27]),
        .O(HWDATA_i_IBUF[27]));
  IBUF \HWDATA_i_IBUF[28]_inst 
       (.I(HWDATA_i[28]),
        .O(HWDATA_i_IBUF[28]));
  IBUF \HWDATA_i_IBUF[29]_inst 
       (.I(HWDATA_i[29]),
        .O(HWDATA_i_IBUF[29]));
  IBUF \HWDATA_i_IBUF[2]_inst 
       (.I(HWDATA_i[2]),
        .O(HWDATA_i_IBUF[2]));
  IBUF \HWDATA_i_IBUF[30]_inst 
       (.I(HWDATA_i[30]),
        .O(HWDATA_i_IBUF[30]));
  IBUF \HWDATA_i_IBUF[31]_inst 
       (.I(HWDATA_i[31]),
        .O(HWDATA_i_IBUF[31]));
  IBUF \HWDATA_i_IBUF[32]_inst 
       (.I(HWDATA_i[32]),
        .O(HWDATA_i_IBUF[32]));
  IBUF \HWDATA_i_IBUF[33]_inst 
       (.I(HWDATA_i[33]),
        .O(HWDATA_i_IBUF[33]));
  IBUF \HWDATA_i_IBUF[34]_inst 
       (.I(HWDATA_i[34]),
        .O(HWDATA_i_IBUF[34]));
  IBUF \HWDATA_i_IBUF[35]_inst 
       (.I(HWDATA_i[35]),
        .O(HWDATA_i_IBUF[35]));
  IBUF \HWDATA_i_IBUF[36]_inst 
       (.I(HWDATA_i[36]),
        .O(HWDATA_i_IBUF[36]));
  IBUF \HWDATA_i_IBUF[37]_inst 
       (.I(HWDATA_i[37]),
        .O(HWDATA_i_IBUF[37]));
  IBUF \HWDATA_i_IBUF[38]_inst 
       (.I(HWDATA_i[38]),
        .O(HWDATA_i_IBUF[38]));
  IBUF \HWDATA_i_IBUF[39]_inst 
       (.I(HWDATA_i[39]),
        .O(HWDATA_i_IBUF[39]));
  IBUF \HWDATA_i_IBUF[3]_inst 
       (.I(HWDATA_i[3]),
        .O(HWDATA_i_IBUF[3]));
  IBUF \HWDATA_i_IBUF[40]_inst 
       (.I(HWDATA_i[40]),
        .O(HWDATA_i_IBUF[40]));
  IBUF \HWDATA_i_IBUF[41]_inst 
       (.I(HWDATA_i[41]),
        .O(HWDATA_i_IBUF[41]));
  IBUF \HWDATA_i_IBUF[42]_inst 
       (.I(HWDATA_i[42]),
        .O(HWDATA_i_IBUF[42]));
  IBUF \HWDATA_i_IBUF[43]_inst 
       (.I(HWDATA_i[43]),
        .O(HWDATA_i_IBUF[43]));
  IBUF \HWDATA_i_IBUF[44]_inst 
       (.I(HWDATA_i[44]),
        .O(HWDATA_i_IBUF[44]));
  IBUF \HWDATA_i_IBUF[45]_inst 
       (.I(HWDATA_i[45]),
        .O(HWDATA_i_IBUF[45]));
  IBUF \HWDATA_i_IBUF[46]_inst 
       (.I(HWDATA_i[46]),
        .O(HWDATA_i_IBUF[46]));
  IBUF \HWDATA_i_IBUF[47]_inst 
       (.I(HWDATA_i[47]),
        .O(HWDATA_i_IBUF[47]));
  IBUF \HWDATA_i_IBUF[48]_inst 
       (.I(HWDATA_i[48]),
        .O(HWDATA_i_IBUF[48]));
  IBUF \HWDATA_i_IBUF[49]_inst 
       (.I(HWDATA_i[49]),
        .O(HWDATA_i_IBUF[49]));
  IBUF \HWDATA_i_IBUF[4]_inst 
       (.I(HWDATA_i[4]),
        .O(HWDATA_i_IBUF[4]));
  IBUF \HWDATA_i_IBUF[50]_inst 
       (.I(HWDATA_i[50]),
        .O(HWDATA_i_IBUF[50]));
  IBUF \HWDATA_i_IBUF[51]_inst 
       (.I(HWDATA_i[51]),
        .O(HWDATA_i_IBUF[51]));
  IBUF \HWDATA_i_IBUF[52]_inst 
       (.I(HWDATA_i[52]),
        .O(HWDATA_i_IBUF[52]));
  IBUF \HWDATA_i_IBUF[53]_inst 
       (.I(HWDATA_i[53]),
        .O(HWDATA_i_IBUF[53]));
  IBUF \HWDATA_i_IBUF[54]_inst 
       (.I(HWDATA_i[54]),
        .O(HWDATA_i_IBUF[54]));
  IBUF \HWDATA_i_IBUF[55]_inst 
       (.I(HWDATA_i[55]),
        .O(HWDATA_i_IBUF[55]));
  IBUF \HWDATA_i_IBUF[56]_inst 
       (.I(HWDATA_i[56]),
        .O(HWDATA_i_IBUF[56]));
  IBUF \HWDATA_i_IBUF[57]_inst 
       (.I(HWDATA_i[57]),
        .O(HWDATA_i_IBUF[57]));
  IBUF \HWDATA_i_IBUF[58]_inst 
       (.I(HWDATA_i[58]),
        .O(HWDATA_i_IBUF[58]));
  IBUF \HWDATA_i_IBUF[59]_inst 
       (.I(HWDATA_i[59]),
        .O(HWDATA_i_IBUF[59]));
  IBUF \HWDATA_i_IBUF[5]_inst 
       (.I(HWDATA_i[5]),
        .O(HWDATA_i_IBUF[5]));
  IBUF \HWDATA_i_IBUF[60]_inst 
       (.I(HWDATA_i[60]),
        .O(HWDATA_i_IBUF[60]));
  IBUF \HWDATA_i_IBUF[61]_inst 
       (.I(HWDATA_i[61]),
        .O(HWDATA_i_IBUF[61]));
  IBUF \HWDATA_i_IBUF[62]_inst 
       (.I(HWDATA_i[62]),
        .O(HWDATA_i_IBUF[62]));
  IBUF \HWDATA_i_IBUF[63]_inst 
       (.I(HWDATA_i[63]),
        .O(HWDATA_i_IBUF[63]));
  IBUF \HWDATA_i_IBUF[6]_inst 
       (.I(HWDATA_i[6]),
        .O(HWDATA_i_IBUF[6]));
  IBUF \HWDATA_i_IBUF[7]_inst 
       (.I(HWDATA_i[7]),
        .O(HWDATA_i_IBUF[7]));
  IBUF \HWDATA_i_IBUF[8]_inst 
       (.I(HWDATA_i[8]),
        .O(HWDATA_i_IBUF[8]));
  IBUF \HWDATA_i_IBUF[9]_inst 
       (.I(HWDATA_i[9]),
        .O(HWDATA_i_IBUF[9]));
  OBUF \HWDATA_o_OBUF[0]_inst 
       (.I(HWDATA_o_OBUF[0]),
        .O(HWDATA_o[0]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[0]_inst_i_1 
       (.I0(HWDATA_i_IBUF[32]),
        .I1(HWDATA_i_IBUF[0]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[0]));
  OBUF \HWDATA_o_OBUF[10]_inst 
       (.I(HWDATA_o_OBUF[10]),
        .O(HWDATA_o[10]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[10]_inst_i_1 
       (.I0(HWDATA_i_IBUF[42]),
        .I1(HWDATA_i_IBUF[10]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[10]));
  OBUF \HWDATA_o_OBUF[11]_inst 
       (.I(HWDATA_o_OBUF[11]),
        .O(HWDATA_o[11]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[11]_inst_i_1 
       (.I0(HWDATA_i_IBUF[43]),
        .I1(HWDATA_i_IBUF[11]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[11]));
  OBUF \HWDATA_o_OBUF[12]_inst 
       (.I(HWDATA_o_OBUF[12]),
        .O(HWDATA_o[12]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[12]_inst_i_1 
       (.I0(HWDATA_i_IBUF[44]),
        .I1(HWDATA_i_IBUF[12]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[12]));
  OBUF \HWDATA_o_OBUF[13]_inst 
       (.I(HWDATA_o_OBUF[13]),
        .O(HWDATA_o[13]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[13]_inst_i_1 
       (.I0(HWDATA_i_IBUF[45]),
        .I1(HWDATA_i_IBUF[13]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[13]));
  OBUF \HWDATA_o_OBUF[14]_inst 
       (.I(HWDATA_o_OBUF[14]),
        .O(HWDATA_o[14]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[14]_inst_i_1 
       (.I0(HWDATA_i_IBUF[46]),
        .I1(HWDATA_i_IBUF[14]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[14]));
  OBUF \HWDATA_o_OBUF[15]_inst 
       (.I(HWDATA_o_OBUF[15]),
        .O(HWDATA_o[15]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[15]_inst_i_1 
       (.I0(HWDATA_i_IBUF[47]),
        .I1(HWDATA_i_IBUF[15]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[15]));
  OBUF \HWDATA_o_OBUF[16]_inst 
       (.I(HWDATA_o_OBUF[16]),
        .O(HWDATA_o[16]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[16]_inst_i_1 
       (.I0(HWDATA_i_IBUF[48]),
        .I1(HWDATA_i_IBUF[16]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[16]));
  OBUF \HWDATA_o_OBUF[17]_inst 
       (.I(HWDATA_o_OBUF[17]),
        .O(HWDATA_o[17]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[17]_inst_i_1 
       (.I0(HWDATA_i_IBUF[49]),
        .I1(HWDATA_i_IBUF[17]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[17]));
  OBUF \HWDATA_o_OBUF[18]_inst 
       (.I(HWDATA_o_OBUF[18]),
        .O(HWDATA_o[18]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[18]_inst_i_1 
       (.I0(HWDATA_i_IBUF[50]),
        .I1(HWDATA_i_IBUF[18]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[18]));
  OBUF \HWDATA_o_OBUF[19]_inst 
       (.I(HWDATA_o_OBUF[19]),
        .O(HWDATA_o[19]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[19]_inst_i_1 
       (.I0(HWDATA_i_IBUF[51]),
        .I1(HWDATA_i_IBUF[19]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[19]));
  OBUF \HWDATA_o_OBUF[1]_inst 
       (.I(HWDATA_o_OBUF[1]),
        .O(HWDATA_o[1]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[1]_inst_i_1 
       (.I0(HWDATA_i_IBUF[33]),
        .I1(HWDATA_i_IBUF[1]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[1]));
  OBUF \HWDATA_o_OBUF[20]_inst 
       (.I(HWDATA_o_OBUF[20]),
        .O(HWDATA_o[20]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[20]_inst_i_1 
       (.I0(HWDATA_i_IBUF[52]),
        .I1(HWDATA_i_IBUF[20]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[20]));
  OBUF \HWDATA_o_OBUF[21]_inst 
       (.I(HWDATA_o_OBUF[21]),
        .O(HWDATA_o[21]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[21]_inst_i_1 
       (.I0(HWDATA_i_IBUF[53]),
        .I1(HWDATA_i_IBUF[21]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[21]));
  OBUF \HWDATA_o_OBUF[22]_inst 
       (.I(HWDATA_o_OBUF[22]),
        .O(HWDATA_o[22]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[22]_inst_i_1 
       (.I0(HWDATA_i_IBUF[54]),
        .I1(HWDATA_i_IBUF[22]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[22]));
  OBUF \HWDATA_o_OBUF[23]_inst 
       (.I(HWDATA_o_OBUF[23]),
        .O(HWDATA_o[23]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[23]_inst_i_1 
       (.I0(HWDATA_i_IBUF[55]),
        .I1(HWDATA_i_IBUF[23]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[23]));
  OBUF \HWDATA_o_OBUF[24]_inst 
       (.I(HWDATA_o_OBUF[24]),
        .O(HWDATA_o[24]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[24]_inst_i_1 
       (.I0(HWDATA_i_IBUF[56]),
        .I1(HWDATA_i_IBUF[24]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[24]));
  OBUF \HWDATA_o_OBUF[25]_inst 
       (.I(HWDATA_o_OBUF[25]),
        .O(HWDATA_o[25]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[25]_inst_i_1 
       (.I0(HWDATA_i_IBUF[57]),
        .I1(HWDATA_i_IBUF[25]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[25]));
  OBUF \HWDATA_o_OBUF[26]_inst 
       (.I(HWDATA_o_OBUF[26]),
        .O(HWDATA_o[26]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[26]_inst_i_1 
       (.I0(HWDATA_i_IBUF[58]),
        .I1(HWDATA_i_IBUF[26]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[26]));
  OBUF \HWDATA_o_OBUF[27]_inst 
       (.I(HWDATA_o_OBUF[27]),
        .O(HWDATA_o[27]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[27]_inst_i_1 
       (.I0(HWDATA_i_IBUF[59]),
        .I1(HWDATA_i_IBUF[27]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[27]));
  OBUF \HWDATA_o_OBUF[28]_inst 
       (.I(HWDATA_o_OBUF[28]),
        .O(HWDATA_o[28]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[28]_inst_i_1 
       (.I0(HWDATA_i_IBUF[60]),
        .I1(HWDATA_i_IBUF[28]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[28]));
  OBUF \HWDATA_o_OBUF[29]_inst 
       (.I(HWDATA_o_OBUF[29]),
        .O(HWDATA_o[29]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[29]_inst_i_1 
       (.I0(HWDATA_i_IBUF[61]),
        .I1(HWDATA_i_IBUF[29]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[29]));
  OBUF \HWDATA_o_OBUF[2]_inst 
       (.I(HWDATA_o_OBUF[2]),
        .O(HWDATA_o[2]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[2]_inst_i_1 
       (.I0(HWDATA_i_IBUF[34]),
        .I1(HWDATA_i_IBUF[2]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[2]));
  OBUF \HWDATA_o_OBUF[30]_inst 
       (.I(HWDATA_o_OBUF[30]),
        .O(HWDATA_o[30]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[30]_inst_i_1 
       (.I0(HWDATA_i_IBUF[62]),
        .I1(HWDATA_i_IBUF[30]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[30]));
  OBUF \HWDATA_o_OBUF[31]_inst 
       (.I(HWDATA_o_OBUF[31]),
        .O(HWDATA_o[31]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[31]_inst_i_1 
       (.I0(HWDATA_i_IBUF[63]),
        .I1(HWDATA_i_IBUF[31]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[31]));
  OBUF \HWDATA_o_OBUF[32]_inst 
       (.I(1'b0),
        .O(HWDATA_o[32]));
  OBUF \HWDATA_o_OBUF[33]_inst 
       (.I(1'b0),
        .O(HWDATA_o[33]));
  OBUF \HWDATA_o_OBUF[34]_inst 
       (.I(1'b0),
        .O(HWDATA_o[34]));
  OBUF \HWDATA_o_OBUF[35]_inst 
       (.I(1'b0),
        .O(HWDATA_o[35]));
  OBUF \HWDATA_o_OBUF[36]_inst 
       (.I(1'b0),
        .O(HWDATA_o[36]));
  OBUF \HWDATA_o_OBUF[37]_inst 
       (.I(1'b0),
        .O(HWDATA_o[37]));
  OBUF \HWDATA_o_OBUF[38]_inst 
       (.I(1'b0),
        .O(HWDATA_o[38]));
  OBUF \HWDATA_o_OBUF[39]_inst 
       (.I(1'b0),
        .O(HWDATA_o[39]));
  OBUF \HWDATA_o_OBUF[3]_inst 
       (.I(HWDATA_o_OBUF[3]),
        .O(HWDATA_o[3]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[3]_inst_i_1 
       (.I0(HWDATA_i_IBUF[35]),
        .I1(HWDATA_i_IBUF[3]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[3]));
  OBUF \HWDATA_o_OBUF[40]_inst 
       (.I(1'b0),
        .O(HWDATA_o[40]));
  OBUF \HWDATA_o_OBUF[41]_inst 
       (.I(1'b0),
        .O(HWDATA_o[41]));
  OBUF \HWDATA_o_OBUF[42]_inst 
       (.I(1'b0),
        .O(HWDATA_o[42]));
  OBUF \HWDATA_o_OBUF[43]_inst 
       (.I(1'b0),
        .O(HWDATA_o[43]));
  OBUF \HWDATA_o_OBUF[44]_inst 
       (.I(1'b0),
        .O(HWDATA_o[44]));
  OBUF \HWDATA_o_OBUF[45]_inst 
       (.I(1'b0),
        .O(HWDATA_o[45]));
  OBUF \HWDATA_o_OBUF[46]_inst 
       (.I(1'b0),
        .O(HWDATA_o[46]));
  OBUF \HWDATA_o_OBUF[47]_inst 
       (.I(1'b0),
        .O(HWDATA_o[47]));
  OBUF \HWDATA_o_OBUF[48]_inst 
       (.I(1'b0),
        .O(HWDATA_o[48]));
  OBUF \HWDATA_o_OBUF[49]_inst 
       (.I(1'b0),
        .O(HWDATA_o[49]));
  OBUF \HWDATA_o_OBUF[4]_inst 
       (.I(HWDATA_o_OBUF[4]),
        .O(HWDATA_o[4]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[4]_inst_i_1 
       (.I0(HWDATA_i_IBUF[36]),
        .I1(HWDATA_i_IBUF[4]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[4]));
  OBUF \HWDATA_o_OBUF[50]_inst 
       (.I(1'b0),
        .O(HWDATA_o[50]));
  OBUF \HWDATA_o_OBUF[51]_inst 
       (.I(1'b0),
        .O(HWDATA_o[51]));
  OBUF \HWDATA_o_OBUF[52]_inst 
       (.I(1'b0),
        .O(HWDATA_o[52]));
  OBUF \HWDATA_o_OBUF[53]_inst 
       (.I(1'b0),
        .O(HWDATA_o[53]));
  OBUF \HWDATA_o_OBUF[54]_inst 
       (.I(1'b0),
        .O(HWDATA_o[54]));
  OBUF \HWDATA_o_OBUF[55]_inst 
       (.I(1'b0),
        .O(HWDATA_o[55]));
  OBUF \HWDATA_o_OBUF[56]_inst 
       (.I(1'b0),
        .O(HWDATA_o[56]));
  OBUF \HWDATA_o_OBUF[57]_inst 
       (.I(1'b0),
        .O(HWDATA_o[57]));
  OBUF \HWDATA_o_OBUF[58]_inst 
       (.I(1'b0),
        .O(HWDATA_o[58]));
  OBUF \HWDATA_o_OBUF[59]_inst 
       (.I(1'b0),
        .O(HWDATA_o[59]));
  OBUF \HWDATA_o_OBUF[5]_inst 
       (.I(HWDATA_o_OBUF[5]),
        .O(HWDATA_o[5]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[5]_inst_i_1 
       (.I0(HWDATA_i_IBUF[37]),
        .I1(HWDATA_i_IBUF[5]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[5]));
  OBUF \HWDATA_o_OBUF[60]_inst 
       (.I(1'b0),
        .O(HWDATA_o[60]));
  OBUF \HWDATA_o_OBUF[61]_inst 
       (.I(1'b0),
        .O(HWDATA_o[61]));
  OBUF \HWDATA_o_OBUF[62]_inst 
       (.I(1'b0),
        .O(HWDATA_o[62]));
  OBUF \HWDATA_o_OBUF[63]_inst 
       (.I(1'b0),
        .O(HWDATA_o[63]));
  OBUF \HWDATA_o_OBUF[6]_inst 
       (.I(HWDATA_o_OBUF[6]),
        .O(HWDATA_o[6]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[6]_inst_i_1 
       (.I0(HWDATA_i_IBUF[38]),
        .I1(HWDATA_i_IBUF[6]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[6]));
  OBUF \HWDATA_o_OBUF[7]_inst 
       (.I(HWDATA_o_OBUF[7]),
        .O(HWDATA_o[7]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[7]_inst_i_1 
       (.I0(HWDATA_i_IBUF[39]),
        .I1(HWDATA_i_IBUF[7]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[7]));
  OBUF \HWDATA_o_OBUF[8]_inst 
       (.I(HWDATA_o_OBUF[8]),
        .O(HWDATA_o[8]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[8]_inst_i_1 
       (.I0(HWDATA_i_IBUF[40]),
        .I1(HWDATA_i_IBUF[8]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[8]));
  OBUF \HWDATA_o_OBUF[9]_inst 
       (.I(HWDATA_o_OBUF[9]),
        .O(HWDATA_o[9]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWDATA_o_OBUF[9]_inst_i_1 
       (.I0(HWDATA_i_IBUF[41]),
        .I1(HWDATA_i_IBUF[9]),
        .I2(\slave_gnt_vector_data_reg_n_0_[0][0] ),
        .I3(\master_gnt_vector_data[1]_0 ),
        .O(HWDATA_o_OBUF[9]));
  IBUF \HWRITE_i_IBUF[0]_inst 
       (.I(HWRITE_i[0]),
        .O(HWRITE_i_IBUF[0]));
  IBUF \HWRITE_i_IBUF[1]_inst 
       (.I(HWRITE_i[1]),
        .O(HWRITE_i_IBUF[1]));
  OBUF \HWRITE_o_OBUF[0]_inst 
       (.I(HWRITE_o_OBUF),
        .O(HWRITE_o[0]));
  OBUF \HWRITE_o_OBUF[1]_inst 
       (.I(1'b0),
        .O(HWRITE_o[1]));
  FDCE \slave_gnt_vector_data_reg[0][0] 
       (.C(HCLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\GEN_ARBITERS[0].u_arb_n_52 ),
        .D(\GEN_ARBITERS[0].u_arb_n_1 ),
        .Q(\slave_gnt_vector_data_reg_n_0_[0][0] ));
  FDCE \slave_gnt_vector_data_reg[0][1] 
       (.C(HCLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\GEN_ARBITERS[0].u_arb_n_52 ),
        .D(\GEN_ARBITERS[0].u_arb_n_0 ),
        .Q(\master_gnt_vector_data[1]_0 ));
endmodule

module bus_matrix_arbiter
   (\gnt_o_reg[1]_0 ,
    \gnt_o_reg[0]_0 ,
    HREADYOUT_o_OBUF,
    slave_sel_o4__0,
    slave_sel_o4__0_0,
    HSEL_o_OBUF,
    HADDR_o_OBUF,
    HPROT_o_OBUF,
    HBURST_o_OBUF,
    HSIZE_o_OBUF,
    HWRITE_o_OBUF,
    HTRANS_o_OBUF,
    HRESETn,
    HREADY_i_IBUF,
    \master_gnt_vector_data[1]_0 ,
    \slave_gnt_vector_data_reg[0][0] ,
    HTRANS_i_IBUF,
    HADDR_i_IBUF,
    HPROT_i_IBUF,
    HBURST_i_IBUF,
    HSIZE_i_IBUF,
    HWRITE_i_IBUF,
    HRESETn_IBUF,
    HCLK_IBUF_BUFG);
  output \gnt_o_reg[1]_0 ;
  output \gnt_o_reg[0]_0 ;
  output [1:0]HREADYOUT_o_OBUF;
  output slave_sel_o4__0;
  output slave_sel_o4__0_0;
  output [0:0]HSEL_o_OBUF;
  output [31:0]HADDR_o_OBUF;
  output [3:0]HPROT_o_OBUF;
  output [2:0]HBURST_o_OBUF;
  output [2:0]HSIZE_o_OBUF;
  output [0:0]HWRITE_o_OBUF;
  output [1:0]HTRANS_o_OBUF;
  output HRESETn;
  input [0:0]HREADY_i_IBUF;
  input \master_gnt_vector_data[1]_0 ;
  input \slave_gnt_vector_data_reg[0][0] ;
  input [3:0]HTRANS_i_IBUF;
  input [63:0]HADDR_i_IBUF;
  input [7:0]HPROT_i_IBUF;
  input [5:0]HBURST_i_IBUF;
  input [5:0]HSIZE_i_IBUF;
  input [1:0]HWRITE_i_IBUF;
  input HRESETn_IBUF;
  input HCLK_IBUF_BUFG;

  wire [63:0]HADDR_i_IBUF;
  wire [31:0]HADDR_o_OBUF;
  wire [5:0]HBURST_i_IBUF;
  wire [2:0]HBURST_o_OBUF;
  wire HCLK_IBUF_BUFG;
  wire [7:0]HPROT_i_IBUF;
  wire [3:0]HPROT_o_OBUF;
  wire [1:0]HREADYOUT_o_OBUF;
  wire \HREADYOUT_o_OBUF[0]_inst_i_3_n_0 ;
  wire \HREADYOUT_o_OBUF[0]_inst_i_4_n_0 ;
  wire \HREADYOUT_o_OBUF[0]_inst_i_5_n_0 ;
  wire \HREADYOUT_o_OBUF[0]_inst_i_6_n_0 ;
  wire \HREADYOUT_o_OBUF[0]_inst_i_7_n_0 ;
  wire \HREADYOUT_o_OBUF[0]_inst_i_8_n_0 ;
  wire \HREADYOUT_o_OBUF[0]_inst_i_9_n_0 ;
  wire \HREADYOUT_o_OBUF[1]_inst_i_3_n_0 ;
  wire \HREADYOUT_o_OBUF[1]_inst_i_4_n_0 ;
  wire \HREADYOUT_o_OBUF[1]_inst_i_5_n_0 ;
  wire \HREADYOUT_o_OBUF[1]_inst_i_6_n_0 ;
  wire \HREADYOUT_o_OBUF[1]_inst_i_7_n_0 ;
  wire \HREADYOUT_o_OBUF[1]_inst_i_8_n_0 ;
  wire \HREADYOUT_o_OBUF[1]_inst_i_9_n_0 ;
  wire [0:0]HREADY_i_IBUF;
  wire HRESETn;
  wire HRESETn_IBUF;
  wire [0:0]HSEL_o_OBUF;
  wire [5:0]HSIZE_i_IBUF;
  wire [2:0]HSIZE_o_OBUF;
  wire [3:0]HTRANS_i_IBUF;
  wire [1:0]HTRANS_o_OBUF;
  wire [1:0]HWRITE_i_IBUF;
  wire [0:0]HWRITE_o_OBUF;
  wire \gnt_o[0]_i_1_n_0 ;
  wire \gnt_o[1]_i_1_n_0 ;
  wire \gnt_o[1]_i_3_n_0 ;
  wire \gnt_o[1]_i_4_n_0 ;
  wire \gnt_o[1]_i_5_n_0 ;
  wire \gnt_o_reg[0]_0 ;
  wire \gnt_o_reg[1]_0 ;
  wire \master_gnt_vector_data[1]_0 ;
  wire [1:0]\slave_gnt_vector_addr[0] ;
  wire \slave_gnt_vector_data_reg[0][0] ;
  wire slave_sel_o4__0;
  wire slave_sel_o4__0_0;

  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[0]_inst_i_1 
       (.I0(HADDR_i_IBUF[32]),
        .I1(HADDR_i_IBUF[0]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[0]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[10]_inst_i_1 
       (.I0(HADDR_i_IBUF[42]),
        .I1(HADDR_i_IBUF[10]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[10]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[11]_inst_i_1 
       (.I0(HADDR_i_IBUF[43]),
        .I1(HADDR_i_IBUF[11]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[11]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[12]_inst_i_1 
       (.I0(HADDR_i_IBUF[44]),
        .I1(HADDR_i_IBUF[12]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[12]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[13]_inst_i_1 
       (.I0(HADDR_i_IBUF[45]),
        .I1(HADDR_i_IBUF[13]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[13]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[14]_inst_i_1 
       (.I0(HADDR_i_IBUF[46]),
        .I1(HADDR_i_IBUF[14]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[14]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[15]_inst_i_1 
       (.I0(HADDR_i_IBUF[47]),
        .I1(HADDR_i_IBUF[15]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[15]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[16]_inst_i_1 
       (.I0(HADDR_i_IBUF[48]),
        .I1(HADDR_i_IBUF[16]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[16]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[17]_inst_i_1 
       (.I0(HADDR_i_IBUF[49]),
        .I1(HADDR_i_IBUF[17]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[17]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[18]_inst_i_1 
       (.I0(HADDR_i_IBUF[50]),
        .I1(HADDR_i_IBUF[18]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[18]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[19]_inst_i_1 
       (.I0(HADDR_i_IBUF[51]),
        .I1(HADDR_i_IBUF[19]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[19]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[1]_inst_i_1 
       (.I0(HADDR_i_IBUF[33]),
        .I1(HADDR_i_IBUF[1]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[1]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[20]_inst_i_1 
       (.I0(HADDR_i_IBUF[52]),
        .I1(HADDR_i_IBUF[20]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[20]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[21]_inst_i_1 
       (.I0(HADDR_i_IBUF[53]),
        .I1(HADDR_i_IBUF[21]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[21]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[22]_inst_i_1 
       (.I0(HADDR_i_IBUF[54]),
        .I1(HADDR_i_IBUF[22]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[22]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[23]_inst_i_1 
       (.I0(HADDR_i_IBUF[55]),
        .I1(HADDR_i_IBUF[23]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[23]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[24]_inst_i_1 
       (.I0(HADDR_i_IBUF[56]),
        .I1(HADDR_i_IBUF[24]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[24]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[25]_inst_i_1 
       (.I0(HADDR_i_IBUF[57]),
        .I1(HADDR_i_IBUF[25]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[25]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[26]_inst_i_1 
       (.I0(HADDR_i_IBUF[58]),
        .I1(HADDR_i_IBUF[26]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[26]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[27]_inst_i_1 
       (.I0(HADDR_i_IBUF[59]),
        .I1(HADDR_i_IBUF[27]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[27]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[28]_inst_i_1 
       (.I0(HADDR_i_IBUF[60]),
        .I1(HADDR_i_IBUF[28]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[28]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[29]_inst_i_1 
       (.I0(HADDR_i_IBUF[61]),
        .I1(HADDR_i_IBUF[29]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[29]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[2]_inst_i_1 
       (.I0(HADDR_i_IBUF[34]),
        .I1(HADDR_i_IBUF[2]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[2]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[30]_inst_i_1 
       (.I0(HADDR_i_IBUF[62]),
        .I1(HADDR_i_IBUF[30]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[30]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[31]_inst_i_1 
       (.I0(HADDR_i_IBUF[63]),
        .I1(HADDR_i_IBUF[31]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[31]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[3]_inst_i_1 
       (.I0(HADDR_i_IBUF[35]),
        .I1(HADDR_i_IBUF[3]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[3]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[4]_inst_i_1 
       (.I0(HADDR_i_IBUF[36]),
        .I1(HADDR_i_IBUF[4]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[4]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[5]_inst_i_1 
       (.I0(HADDR_i_IBUF[37]),
        .I1(HADDR_i_IBUF[5]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[5]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[6]_inst_i_1 
       (.I0(HADDR_i_IBUF[38]),
        .I1(HADDR_i_IBUF[6]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[6]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[7]_inst_i_1 
       (.I0(HADDR_i_IBUF[39]),
        .I1(HADDR_i_IBUF[7]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[7]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[8]_inst_i_1 
       (.I0(HADDR_i_IBUF[40]),
        .I1(HADDR_i_IBUF[8]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[8]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HADDR_o_OBUF[9]_inst_i_1 
       (.I0(HADDR_i_IBUF[41]),
        .I1(HADDR_i_IBUF[9]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HADDR_o_OBUF[9]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HBURST_o_OBUF[0]_inst_i_1 
       (.I0(HBURST_i_IBUF[3]),
        .I1(HBURST_i_IBUF[0]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HBURST_o_OBUF[0]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HBURST_o_OBUF[1]_inst_i_1 
       (.I0(HBURST_i_IBUF[4]),
        .I1(HBURST_i_IBUF[1]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HBURST_o_OBUF[1]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HBURST_o_OBUF[2]_inst_i_1 
       (.I0(HBURST_i_IBUF[5]),
        .I1(HBURST_i_IBUF[2]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HBURST_o_OBUF[2]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HPROT_o_OBUF[0]_inst_i_1 
       (.I0(HPROT_i_IBUF[4]),
        .I1(HPROT_i_IBUF[0]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HPROT_o_OBUF[0]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HPROT_o_OBUF[1]_inst_i_1 
       (.I0(HPROT_i_IBUF[5]),
        .I1(HPROT_i_IBUF[1]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HPROT_o_OBUF[1]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HPROT_o_OBUF[2]_inst_i_1 
       (.I0(HPROT_i_IBUF[6]),
        .I1(HPROT_i_IBUF[2]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HPROT_o_OBUF[2]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HPROT_o_OBUF[3]_inst_i_1 
       (.I0(HPROT_i_IBUF[7]),
        .I1(HPROT_i_IBUF[3]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HPROT_o_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hDF50DFDF)) 
    \HREADYOUT_o_OBUF[0]_inst_i_1 
       (.I0(slave_sel_o4__0_0),
        .I1(\slave_gnt_vector_addr[0] [0]),
        .I2(HTRANS_i_IBUF[1]),
        .I3(HREADY_i_IBUF),
        .I4(\slave_gnt_vector_data_reg[0][0] ),
        .O(HREADYOUT_o_OBUF[0]));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \HREADYOUT_o_OBUF[0]_inst_i_2 
       (.I0(\HREADYOUT_o_OBUF[0]_inst_i_3_n_0 ),
        .I1(\HREADYOUT_o_OBUF[0]_inst_i_4_n_0 ),
        .I2(HADDR_i_IBUF[0]),
        .I3(HADDR_i_IBUF[16]),
        .I4(HADDR_i_IBUF[17]),
        .I5(\HREADYOUT_o_OBUF[0]_inst_i_5_n_0 ),
        .O(slave_sel_o4__0_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \HREADYOUT_o_OBUF[0]_inst_i_3 
       (.I0(HADDR_i_IBUF[26]),
        .I1(HADDR_i_IBUF[27]),
        .I2(HADDR_i_IBUF[28]),
        .I3(HADDR_i_IBUF[29]),
        .I4(HADDR_i_IBUF[31]),
        .I5(HADDR_i_IBUF[30]),
        .O(\HREADYOUT_o_OBUF[0]_inst_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00010000)) 
    \HREADYOUT_o_OBUF[0]_inst_i_4 
       (.I0(HADDR_i_IBUF[18]),
        .I1(HADDR_i_IBUF[19]),
        .I2(HADDR_i_IBUF[20]),
        .I3(HADDR_i_IBUF[21]),
        .I4(\HREADYOUT_o_OBUF[0]_inst_i_6_n_0 ),
        .O(\HREADYOUT_o_OBUF[0]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \HREADYOUT_o_OBUF[0]_inst_i_5 
       (.I0(\HREADYOUT_o_OBUF[0]_inst_i_7_n_0 ),
        .I1(\HREADYOUT_o_OBUF[0]_inst_i_8_n_0 ),
        .I2(HADDR_i_IBUF[3]),
        .I3(HADDR_i_IBUF[2]),
        .I4(HADDR_i_IBUF[14]),
        .I5(\HREADYOUT_o_OBUF[0]_inst_i_9_n_0 ),
        .O(\HREADYOUT_o_OBUF[0]_inst_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \HREADYOUT_o_OBUF[0]_inst_i_6 
       (.I0(HADDR_i_IBUF[25]),
        .I1(HADDR_i_IBUF[24]),
        .I2(HADDR_i_IBUF[23]),
        .I3(HADDR_i_IBUF[22]),
        .O(\HREADYOUT_o_OBUF[0]_inst_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \HREADYOUT_o_OBUF[0]_inst_i_7 
       (.I0(HADDR_i_IBUF[8]),
        .I1(HADDR_i_IBUF[11]),
        .I2(HADDR_i_IBUF[6]),
        .I3(HADDR_i_IBUF[9]),
        .O(\HREADYOUT_o_OBUF[0]_inst_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \HREADYOUT_o_OBUF[0]_inst_i_8 
       (.I0(HADDR_i_IBUF[12]),
        .I1(HADDR_i_IBUF[15]),
        .I2(HADDR_i_IBUF[10]),
        .I3(HADDR_i_IBUF[13]),
        .O(\HREADYOUT_o_OBUF[0]_inst_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \HREADYOUT_o_OBUF[0]_inst_i_9 
       (.I0(HADDR_i_IBUF[4]),
        .I1(HADDR_i_IBUF[7]),
        .I2(HADDR_i_IBUF[1]),
        .I3(HADDR_i_IBUF[5]),
        .O(\HREADYOUT_o_OBUF[0]_inst_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hDF50DFDF)) 
    \HREADYOUT_o_OBUF[1]_inst_i_1 
       (.I0(slave_sel_o4__0),
        .I1(\slave_gnt_vector_addr[0] [1]),
        .I2(HTRANS_i_IBUF[3]),
        .I3(HREADY_i_IBUF),
        .I4(\master_gnt_vector_data[1]_0 ),
        .O(HREADYOUT_o_OBUF[1]));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \HREADYOUT_o_OBUF[1]_inst_i_2 
       (.I0(\HREADYOUT_o_OBUF[1]_inst_i_3_n_0 ),
        .I1(\HREADYOUT_o_OBUF[1]_inst_i_4_n_0 ),
        .I2(HADDR_i_IBUF[32]),
        .I3(HADDR_i_IBUF[48]),
        .I4(HADDR_i_IBUF[49]),
        .I5(\HREADYOUT_o_OBUF[1]_inst_i_5_n_0 ),
        .O(slave_sel_o4__0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \HREADYOUT_o_OBUF[1]_inst_i_3 
       (.I0(HADDR_i_IBUF[58]),
        .I1(HADDR_i_IBUF[59]),
        .I2(HADDR_i_IBUF[60]),
        .I3(HADDR_i_IBUF[61]),
        .I4(HADDR_i_IBUF[63]),
        .I5(HADDR_i_IBUF[62]),
        .O(\HREADYOUT_o_OBUF[1]_inst_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \HREADYOUT_o_OBUF[1]_inst_i_4 
       (.I0(HADDR_i_IBUF[50]),
        .I1(HADDR_i_IBUF[51]),
        .I2(HADDR_i_IBUF[52]),
        .I3(HADDR_i_IBUF[53]),
        .I4(\HREADYOUT_o_OBUF[1]_inst_i_6_n_0 ),
        .O(\HREADYOUT_o_OBUF[1]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \HREADYOUT_o_OBUF[1]_inst_i_5 
       (.I0(\HREADYOUT_o_OBUF[1]_inst_i_7_n_0 ),
        .I1(\HREADYOUT_o_OBUF[1]_inst_i_8_n_0 ),
        .I2(HADDR_i_IBUF[35]),
        .I3(HADDR_i_IBUF[34]),
        .I4(HADDR_i_IBUF[46]),
        .I5(\HREADYOUT_o_OBUF[1]_inst_i_9_n_0 ),
        .O(\HREADYOUT_o_OBUF[1]_inst_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \HREADYOUT_o_OBUF[1]_inst_i_6 
       (.I0(HADDR_i_IBUF[57]),
        .I1(HADDR_i_IBUF[56]),
        .I2(HADDR_i_IBUF[55]),
        .I3(HADDR_i_IBUF[54]),
        .O(\HREADYOUT_o_OBUF[1]_inst_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \HREADYOUT_o_OBUF[1]_inst_i_7 
       (.I0(HADDR_i_IBUF[40]),
        .I1(HADDR_i_IBUF[43]),
        .I2(HADDR_i_IBUF[38]),
        .I3(HADDR_i_IBUF[41]),
        .O(\HREADYOUT_o_OBUF[1]_inst_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \HREADYOUT_o_OBUF[1]_inst_i_8 
       (.I0(HADDR_i_IBUF[44]),
        .I1(HADDR_i_IBUF[47]),
        .I2(HADDR_i_IBUF[42]),
        .I3(HADDR_i_IBUF[45]),
        .O(\HREADYOUT_o_OBUF[1]_inst_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \HREADYOUT_o_OBUF[1]_inst_i_9 
       (.I0(HADDR_i_IBUF[36]),
        .I1(HADDR_i_IBUF[39]),
        .I2(HADDR_i_IBUF[33]),
        .I3(HADDR_i_IBUF[37]),
        .O(\HREADYOUT_o_OBUF[1]_inst_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \HSEL_o_OBUF[0]_inst_i_1 
       (.I0(\slave_gnt_vector_addr[0] [1]),
        .I1(\slave_gnt_vector_addr[0] [0]),
        .O(HSEL_o_OBUF));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HSIZE_o_OBUF[0]_inst_i_1 
       (.I0(HSIZE_i_IBUF[3]),
        .I1(HSIZE_i_IBUF[0]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HSIZE_o_OBUF[0]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HSIZE_o_OBUF[1]_inst_i_1 
       (.I0(HSIZE_i_IBUF[4]),
        .I1(HSIZE_i_IBUF[1]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HSIZE_o_OBUF[1]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HSIZE_o_OBUF[2]_inst_i_1 
       (.I0(HSIZE_i_IBUF[5]),
        .I1(HSIZE_i_IBUF[2]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HSIZE_o_OBUF[2]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HTRANS_o_OBUF[0]_inst_i_1 
       (.I0(HTRANS_i_IBUF[2]),
        .I1(HTRANS_i_IBUF[0]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HTRANS_o_OBUF[0]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HTRANS_o_OBUF[1]_inst_i_1 
       (.I0(HTRANS_i_IBUF[3]),
        .I1(HTRANS_i_IBUF[1]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HTRANS_o_OBUF[1]));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \HWRITE_o_OBUF[0]_inst_i_1 
       (.I0(HWRITE_i_IBUF[1]),
        .I1(HWRITE_i_IBUF[0]),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(HWRITE_o_OBUF));
  LUT4 #(
    .INIT(16'h7475)) 
    \gnt_o[0]_i_1 
       (.I0(\gnt_o[1]_i_3_n_0 ),
        .I1(HREADY_i_IBUF),
        .I2(\slave_gnt_vector_addr[0] [0]),
        .I3(\slave_gnt_vector_addr[0] [1]),
        .O(\gnt_o[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h80FF80FF80008080)) 
    \gnt_o[1]_i_1 
       (.I0(\gnt_o[1]_i_3_n_0 ),
        .I1(slave_sel_o4__0),
        .I2(HTRANS_i_IBUF[3]),
        .I3(HREADY_i_IBUF),
        .I4(\slave_gnt_vector_addr[0] [0]),
        .I5(\slave_gnt_vector_addr[0] [1]),
        .O(\gnt_o[1]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \gnt_o[1]_i_2 
       (.I0(HRESETn_IBUF),
        .O(HRESETn));
  LUT3 #(
    .INIT(8'hBF)) 
    \gnt_o[1]_i_3 
       (.I0(\HREADYOUT_o_OBUF[0]_inst_i_5_n_0 ),
        .I1(\gnt_o[1]_i_4_n_0 ),
        .I2(HTRANS_i_IBUF[1]),
        .O(\gnt_o[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0100000000000000)) 
    \gnt_o[1]_i_4 
       (.I0(HADDR_i_IBUF[17]),
        .I1(HADDR_i_IBUF[16]),
        .I2(HADDR_i_IBUF[0]),
        .I3(\gnt_o[1]_i_5_n_0 ),
        .I4(\HREADYOUT_o_OBUF[0]_inst_i_6_n_0 ),
        .I5(\HREADYOUT_o_OBUF[0]_inst_i_3_n_0 ),
        .O(\gnt_o[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \gnt_o[1]_i_5 
       (.I0(HADDR_i_IBUF[21]),
        .I1(HADDR_i_IBUF[20]),
        .I2(HADDR_i_IBUF[19]),
        .I3(HADDR_i_IBUF[18]),
        .O(\gnt_o[1]_i_5_n_0 ));
  FDCE \gnt_o_reg[0] 
       (.C(HCLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(HRESETn),
        .D(\gnt_o[0]_i_1_n_0 ),
        .Q(\slave_gnt_vector_addr[0] [0]));
  FDCE \gnt_o_reg[1] 
       (.C(HCLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(HRESETn),
        .D(\gnt_o[1]_i_1_n_0 ),
        .Q(\slave_gnt_vector_addr[0] [1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slave_gnt_vector_data[0][0]_i_1 
       (.I0(\slave_gnt_vector_addr[0] [0]),
        .I1(HREADY_i_IBUF),
        .I2(\slave_gnt_vector_data_reg[0][0] ),
        .O(\gnt_o_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slave_gnt_vector_data[0][1]_i_1 
       (.I0(\slave_gnt_vector_addr[0] [1]),
        .I1(HREADY_i_IBUF),
        .I2(\master_gnt_vector_data[1]_0 ),
        .O(\gnt_o_reg[1]_0 ));
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
