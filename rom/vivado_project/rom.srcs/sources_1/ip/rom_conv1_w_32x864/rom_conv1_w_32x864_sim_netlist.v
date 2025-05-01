// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Apr  3 19:37:01 2025
// Host        : Irving-Wang running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/18740/Desktop/Project_Vivado/rom_conv1_w/vivado_project/rom.srcs/sources_1/ip/rom_conv1_w_32x864/rom_conv1_w_32x864_sim_netlist.v
// Design      : rom_conv1_w_32x864
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "rom_conv1_w_32x864,blk_mem_gen_v8_4_2,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module rom_conv1_w_32x864
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [31:0]douta;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.622 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "rom_conv1_w_32x864.mem" *) 
  (* C_INIT_FILE_NAME = "rom_conv1_w_32x864.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "864" *) 
  (* C_READ_DEPTH_B = "864" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "864" *) 
  (* C_WRITE_DEPTH_B = "864" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  rom_conv1_w_32x864_blk_mem_gen_v8_4_2 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module rom_conv1_w_32x864_blk_mem_gen_generic_cstr
   (douta,
    clka,
    addra);
  output [31:0]douta;
  input clka;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [31:0]douta;

  rom_conv1_w_32x864_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.addra(addra),
        .clka(clka),
        .douta(douta));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module rom_conv1_w_32x864_blk_mem_gen_prim_width
   (douta,
    clka,
    addra);
  output [31:0]douta;
  input clka;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [31:0]douta;

  rom_conv1_w_32x864_blk_mem_gen_prim_wrapper_init \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .douta(douta));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module rom_conv1_w_32x864_blk_mem_gen_prim_wrapper_init
   (douta,
    clka,
    addra);
  output [31:0]douta;
  input clka;
  input [9:0]addra;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_68 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_69 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_70 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_71 ;
  wire [9:0]addra;
  wire clka;
  wire [31:0]douta;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hBE456768BE37ACF03D8CDC523E49FECE3A9A24AFBE34713BBD169F1BBDE315CE),
    .INIT_01(256'h3DA7A06B3E933167BD20E657BD5D50AB3DC4ADEF3D5610403CBFA633BE333F97),
    .INIT_02(256'h3E1BE1DABDD85BB0BE17746BBE2B2BC23D24FF2BBE4F8CEE3E22CCA6BEA26417),
    .INIT_03(256'hBE07D562BCAF5599BE071BAE3BC8B627BE2F1B6BBD27E8AABDE3D39BBD225BA0),
    .INIT_04(256'h3DE3D7F1BDF28357BE837F4DBD8CA3C4BE8F4498BE46B5C9BD15DECFBE6C5B97),
    .INIT_05(256'h3E851289BD1017553E62EB41BE9FB879BC07A82BBD45A1D33E6E981A3E302D16),
    .INIT_06(256'hBE90ED6F3C775AB53C530596BE83E8F13E3D6BB5BCBB98423E8CA1B93E050EC9),
    .INIT_07(256'h3D65D077BEBE3A013D2081C3BD5D1118BEC579E03DDCABDCBE0719F0BE037B8B),
    .INIT_08(256'hBD8A232C3E144724BE8278B7BD7D0D44BE06B5E0BDC78EA73E48C972BD32F441),
    .INIT_09(256'hBD85A88A3E5A46B63E29F7E03E1774493E817721BE0DA6BA3E1796183E3A29D1),
    .INIT_0A(256'h3EAB638C3D0D20F8BE46C75BBE4DB1DB3E26EA553D85C82A3D5A4DFF3E3D9059),
    .INIT_0B(256'hBEB7352D3C38EFF6BE5078D53D865B893E21B7ECBCBA658C3E705C5E3D798D2A),
    .INIT_0C(256'hBE43B702BD8AF545BD950A8C3DA749E7BE37A260BE9300BF3E60CCAD3D401C98),
    .INIT_0D(256'h3E05DD4C3BC10833BD9950A5BC6FD880BDAFA6AF3D9928633E287EC6BD94D076),
    .INIT_0E(256'h3E379270BCB9873BBE38F03B3DDFD3653D797CAEBE2FFEB3BD53FD6EBE6DDD93),
    .INIT_0F(256'hBD1B3DFC3DBCD22FBE1442D3BE586F5ABE3C99FE3E6B77EE3D6BF6B9BD8D5AAC),
    .INIT_10(256'h3D83288F3CC62CD5BE3382533E02FA1BBDB11BD3BDE3CD303DF3E75CBE70956F),
    .INIT_11(256'h3EBEED1A3D5A20173EA5D4EEBE905BB33C6A03E03DBD542F3E5D97F03DFA56B3),
    .INIT_12(256'hBE89CF2A3DAC7EF53E0FA27ABBA2B7503DAA772BBDC326D03E3DF2493DDFB2FB),
    .INIT_13(256'hBD6D9A62BE8B6E74BE09FAAA3D4292DABE8587DD3DC47CCDBE6BF778BDB0A19E),
    .INIT_14(256'hBDEBED5DBC2D6818BE06B4ED3E3EB6AEBE5F63FBBD4B1C7C3D6B895BBDF60473),
    .INIT_15(256'h3D2A95043E22A9833D44256CBCABAE393E9C0167BB849FB73E0B4DBC3E67C944),
    .INIT_16(256'h3E95FFC6BDD96AEEBE9414B43DD06A8E3C23848A3E3B84A83D8F8CB63D85A524),
    .INIT_17(256'hBE8875183D1FA82FBC81B68E3E246B9DBD0AB9C23E018517BCE34DA23D1CBC49),
    .INIT_18(256'hBE08BCD8BE5EBFE73DC80F593DE57E683DD8C040BE6BAE9E3D7F7427BDA0FEB2),
    .INIT_19(256'hBDED5DE63BE841073CD3C118BDAB92423D6C75A7BE25C2ACBA125989BD36915A),
    .INIT_1A(256'hBD839906BE138505BE16F77E3DA95FEC3D337B62BE229A84BD59D6A3BE954375),
    .INIT_1B(256'hBD933D6C3DAE1275BE0E43DBBE442A00BCCAD1DB3E581461BDBCF4C3BDB0DA39),
    .INIT_1C(256'h3CCD1AEBBD65B757BE04D21CBD9CC298BDF584B8BE30A62ABCC62C85BD54E2EE),
    .INIT_1D(256'h3EA1CF69BE95002C3DADDA42BE9C7E873D18A0173E830D273E444888BBCCA9BC),
    .INIT_1E(256'hBEAB4B69BD757400BD580BE33D0763BF3C5E1EA4BCBA104C3DE9D9733D5523F9),
    .INIT_1F(256'hBD4BF5B7BE7302D63ACB2354BD51E96FBE52FBA53E1A5407BE346C5CBD775EFA),
    .INIT_20(256'hBE4DC60B3E463F553DDAA3073DF2DB39BD3DAACE3CE5751F3DDCA63CBD11D065),
    .INIT_21(256'hBC64ACD33E14EDA13D21E1A7BD51D93E3E24FECDBDAAC8EF3DB649B63E68D7C1),
    .INIT_22(256'h3BC05403BE23A135BEB41C4D3E0839E5BE29FB073D103309BDA44A0A3E76B423),
    .INIT_23(256'hBE7CFB683D8342F3BE4265063E6F42E93DA40F65BCE207373DF16D273E3F82CD),
    .INIT_24(256'hBE4D9DA73DDD2F5E3D69C3583DE41DEC3D8CDEE7BDEE2A7C3E1BA892BB4144AE),
    .INIT_25(256'h3DD7F86D3E346603BCEC0999BE1A16973D31EDD4BE849D3F3DCA0E4EBDB603B5),
    .INIT_26(256'h3E28B2D1BE47029EBDED67E63DCCD1D43E3E913CBE62E578BCC242B0BE37FBFA),
    .INIT_27(256'h3D9121433E476BC1BE06D258BE83A4A8BE46D565BEB3922CBD66BD033DE7B942),
    .INIT_28(256'h3E24FEDA3E189A46BD948D7FBE05B1EBBD8E10F0BD8488E1BD3CA057BE58A5DF),
    .INIT_29(256'h3E02955DBE2E391D3E8444A2BD23B5BFBE62AD1A3DCD193C3E998F2F3D7F79E8),
    .INIT_2A(256'hBE95DA23BD114EEDBD760F2E3D038BD33E1EE7C3BE1DFA52BDF6A7133C36D432),
    .INIT_2B(256'h3D048F41BE236C79BE16954D3DEFC36CBE791BDCBE8FEF79BC8805F9BBA35788),
    .INIT_2C(256'hBE724E673E4729E2BEB326B4BC5F650BBD56C435BD662F773E4B9DE2BE6C6BE1),
    .INIT_2D(256'hBCB190A13DA32EACBB6DD6323E06FC063EA4D51DBE811533BD2743383DE0091B),
    .INIT_2E(256'h3DC0A3723DD4EE09BEB52A3C3E24AFDA3E3CA0B33C33C7C3BDD8EEAFBC856A07),
    .INIT_2F(256'hBE85467C3D5E5E65BE80090A3E88464E3C3F0E7EBE202C4A3E89C24C3E255DE4),
    .INIT_30(256'hBDEA57E0BCD444D1BDD5399ABDBE0480BD808E6E3E1122EB3D86088D3D825B21),
    .INIT_31(256'hBE2F90BFBC4DDBE13C8B036FBE77AB1F3DD07126BE3942933E506D30BDDDC0EF),
    .INIT_32(256'h3DD87B3BBE68B3B93DD1505F3E7F4A41BD30C7A1BE85013EBE30194EBE74678D),
    .INIT_33(256'h3D08E8673E928B07BD935328BE744A54BD90B1FF3D21E6953AD80F20BE2DADF9),
    .INIT_34(256'h3E4ACB273DAF79C8BE874FFABE8D3329BE310B4F3E1740763CF08411BDBBF58B),
    .INIT_35(256'h3E164962BE1753B63E5AEEE1BDBE33F1BE235D17BCC1C67F3ECB11F53CCE9BA4),
    .INIT_36(256'hBEA58B0ABD8E998D3E0D926A3EA11AC73E796F7DBDF7375BBE1BC0D0BC925700),
    .INIT_37(256'h3CEF0F62BDA9DE01BD8464C3BDA3CC72BE12CA8CBE1736C9BBFE2EC53C68E7C0),
    .INIT_38(256'hBE8257453E5C94EDBE86D198BE72A613BE4FC6F13DD5F75C3D741EDEBE852244),
    .INIT_39(256'hBE35FAB73D3BCD593E1366043DD4731C3EA3FF06BC904E41BD751D433CD21C88),
    .INIT_3A(256'h3E1B128E3C091FEFBDA223DC3E4D9E1F3DCE5424BDFC9BE83DB7D3E73E29B077),
    .INIT_3B(256'hBE084BD83D55F1593CE392563E83633C3D9B8A74BD463D0B3E99A74BBDE76ADC),
    .INIT_3C(256'hBE8896F7BD3307443E9A30C2BE5489DABDEBE04D3D11600D3E5B82DEBD598E61),
    .INIT_3D(256'hBE705AFCBC92E76EBCB99D0FBE5CB0BDBD6E30B5BDCBBE9A3C529FB5BE665DF4),
    .INIT_3E(256'h3E1B0038BE5871E93DC197A83D1DF8A7BE75D721BE931C65BEA5FD98BD450BAB),
    .INIT_3F(256'h3D1D368F3E9D0044BDD90D44BE51ABA7BD8556463E8057CBBC9B2DE9BD878935),
    .INIT_40(256'h3E1A315F3E3746FEBBEB8387BE96C88BBE0838543CCF3929BD014F30BE3B7CBE),
    .INIT_41(256'hBD4F367CBEA32A3B3D287B87BDF9CA01BDEC14FF3E68A80E3EA804493DCF278F),
    .INIT_42(256'hBEBDE4A23DABFD1E3E3976E3BD847070BDEC64593D399265BE907E9F3D6E5662),
    .INIT_43(256'h3D0141D2BDB21A45BE095D0CBC41C14BBE3CB28E3E601277BE1155C1BB813E84),
    .INIT_44(256'hBE3F21583E80E6983E58BCF4BE86429DBB991ECA3CFEC52D3DD686C9BDE31344),
    .INIT_45(256'hBE136CAABDD8446B3C851C4F3E2516ED3EAF321E3BF3327DBDC983973CBD741A),
    .INIT_46(256'h3CE4D52CBE037EC6BE08E8C8BD2E5E4FBE3C48C03DDADEB9BE83368D3E810C98),
    .INIT_47(256'hBEAA213C3D04B89FBE8FF3C83E8A7AD23E2FF4D93E1B32653E90B6153E71BFE1),
    .INIT_48(256'hBE1ABB69BA0DCDDE3DF28A593E806F6D3CDBEE383E4C2A0BBE849AD53E2E6D7C),
    .INIT_49(256'h3CA3A6183D55E92B3DC43FC8BDFA4E6FBDD191BCBE80BE6B3E510253BDB86888),
    .INIT_4A(256'hBC07FA6B3BDFE8083D95482CBD9399C6BE30ADA5BE95BD2FBD8C130FBE6F8A50),
    .INIT_4B(256'h3D37C1753E7D91693BABC7C4BE001B43BE4ABC91BD871F88BE0CEF68BE3B741D),
    .INIT_4C(256'hBC8B9EFA3DEFF6D9BE949864BDCFD67ABD9805153E8679CEBEC18E9FBD5DFC60),
    .INIT_4D(256'hBC131D9FBD31A48D3E32C524BCBB6FE3BE2C2704BB16CF0F3EC0D0113E442DF4),
    .INIT_4E(256'hBEAEA8AA3E9C0E183EAF00E23CA4DB413C64E532BE41CA43BD072447BDA101FF),
    .INIT_4F(256'hBE194C79BD9D0B91BCA5FBE83DB25EAFBE36C7093D2F7281BE562174BE498A98),
    .INIT_50(256'hBE6FDDCB3E443CC0BE95A89C3E51ED833E9581093DC601A0BE2E81D8BE24B4E9),
    .INIT_51(256'hBDC3E983BC7F22AB3DA94D003DAB81393E94A95CBE06B2733D816FC43DEDC116),
    .INIT_52(256'hBDAF79D33E5E77CEBDD426653D9E1C123E233333BD46480B3E0E972FBCB07AB2),
    .INIT_53(256'hBEBF7A383E58DB8BBE73FE7A3D8468C83E7880C43DC2B2833D67F669BE4A272D),
    .INIT_54(256'hBD2663163DE05159BC13D7C33E6B53CE3E9338323E74DFA2BE54EE333D5081F1),
    .INIT_55(256'hBE6BA95C3E245A12BD28EC553D1F3807BE065802BCB97E4C3E2E2EEABA6EA087),
    .INIT_56(256'h3D54CBBCBDBF5388BCC6AC9DBD6BEE20BDFC5044BDD1A450BE13041CBE3E6FA5),
    .INIT_57(256'h3DBCD6663EBE29173DB87857BE6A4CF4BBD8B92ABE87D19B3DB4AEB53D834269),
    .INIT_58(256'h3E390FCC3E4D8ADC3C9F9A653CCC99303E1552463E133952BE8D413EBDF28100),
    .INIT_59(256'hBD736499BD4EBCFC3D895754BE4A477EBE5959A43BDDB24D3EA381403E03432A),
    .INIT_5A(256'hBEB319523E6C35AD3E78B813BD8983153E204374BD90FEC6BD1A93743E01740C),
    .INIT_5B(256'h3CF375D9BD34B0FF3DE24AE53BCD56A0BE265E5CBD8DC1D73BF77A8B3CC1C847),
    .INIT_5C(256'hBE23E2063E8BF90EBD0F0D9ABBBCE2CA3E8489B9BC5E5C573D9C996EBD29E0FA),
    .INIT_5D(256'hBE84E7BB3E092CEABD3C3D533D8739BB3E882449BE36C14C3D8FD3B03DC66A31),
    .INIT_5E(256'hBDA1DED23E0390B5BE372968BE5DF7263DEC2853BDECC07DBA2218C43DAEF2AB),
    .INIT_5F(256'hBEC0AEC03DB27D753D43EC993E9179523E9FA6AFBE1A62343DD0DF06BCCD3C69),
    .INIT_60(256'hBE5283723CB993043EB197703B949AED3E6F4D033D8696263DFB577F3C3D92B3),
    .INIT_61(256'hBE85FD63BC87890BBE207F7DBDCD2EC33DC7B8BABE5014AD3D9592B3BE805592),
    .INIT_62(256'h3C7823723D731B283E5DAE49BE71CA1ABE8EBA36BE738AAABE483E1ABE00DB45),
    .INIT_63(256'hBDB7DBB83DE9720FBD19073DBD4FA54C3D781D02BDE80A18BE1E52143B9AD7F3),
    .INIT_64(256'h3E292DF43CE9E2A73E5CB3323D88E0193DAF9E1C3E282945BE0BB9073C65280D),
    .INIT_65(256'h3AA16494BE89B0A93DA67752BE8841B6BE0C8F3C3D23CD423E450FD53E121F4B),
    .INIT_66(256'hBEC904B13DDE8E583ED09BBDBD0FA54CBDC944CB3D980CDBBDF0ADE33E1797EE),
    .INIT_67(256'h3D5ECDFCBC24A094BE30FAB1BDBAC28FBCDB77F03D3A3E7DBE9D32AD3DD33886),
    .INIT_68(256'hBE7A512A3DFB3B3E3EBBE21E3DF126243E2711ABBDEC6A303DE6A813BDD5C6A1),
    .INIT_69(256'hBE8930173D9128F8BDFFCDCB3E532BF13EB023893DE9DAABBD90B1A0BD6D1A50),
    .INIT_6A(256'hBDB7B5F03B7A01B9BE501A26BE6C74B63D433E53BDD703C73D7E0A043CB61164),
    .INIT_6B(256'hBEC639343E84C625BE8156E73E34527A3E403DE43D843C813E035B6F3E46007C),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(douta),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_68 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_69 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_70 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_71 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(1'b1),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module rom_conv1_w_32x864_blk_mem_gen_top
   (douta,
    clka,
    addra);
  output [31:0]douta;
  input clka;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [31:0]douta;

  rom_conv1_w_32x864_blk_mem_gen_generic_cstr \valid.cstr 
       (.addra(addra),
        .clka(clka),
        .douta(douta));
endmodule

(* C_ADDRA_WIDTH = "10" *) (* C_ADDRB_WIDTH = "10" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "0" *) (* C_COUNT_18K_BRAM = "0" *) 
(* C_COUNT_36K_BRAM = "1" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.622 mW" *) 
(* C_FAMILY = "zynq" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "0" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "rom_conv1_w_32x864.mem" *) 
(* C_INIT_FILE_NAME = "rom_conv1_w_32x864.mif" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) 
(* C_MEM_TYPE = "3" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "864" *) (* C_READ_DEPTH_B = "864" *) (* C_READ_LATENCY_A = "1" *) 
(* C_READ_LATENCY_B = "1" *) (* C_READ_WIDTH_A = "32" *) (* C_READ_WIDTH_B = "32" *) 
(* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) (* C_RST_PRIORITY_A = "CE" *) 
(* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) (* C_USE_BRAM_BLOCK = "0" *) 
(* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) (* C_USE_DEFAULT_DATA = "0" *) 
(* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) (* C_USE_URAM = "0" *) 
(* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) (* C_WRITE_DEPTH_A = "864" *) 
(* C_WRITE_DEPTH_B = "864" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
(* C_WRITE_WIDTH_A = "32" *) (* C_WRITE_WIDTH_B = "32" *) (* C_XDEVICEFAMILY = "zynq" *) 
(* ORIG_REF_NAME = "blk_mem_gen_v8_4_2" *) (* downgradeipidentifiedwarnings = "yes" *) 
module rom_conv1_w_32x864_blk_mem_gen_v8_4_2
   (clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    doutb,
    injectsbiterr,
    injectdbiterr,
    eccpipece,
    sbiterr,
    dbiterr,
    rdaddrecc,
    sleep,
    deepsleep,
    shutdown,
    rsta_busy,
    rstb_busy,
    s_aclk,
    s_aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_injectsbiterr,
    s_axi_injectdbiterr,
    s_axi_sbiterr,
    s_axi_dbiterr,
    s_axi_rdaddrecc);
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [9:0]addra;
  input [31:0]dina;
  output [31:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [9:0]addrb;
  input [31:0]dinb;
  output [31:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [9:0]rdaddrecc;
  input sleep;
  input deepsleep;
  input shutdown;
  output rsta_busy;
  output rstb_busy;
  input s_aclk;
  input s_aresetn;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [0:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [9:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [9:0]addra;
  wire clka;
  wire [31:0]douta;

  assign dbiterr = \<const0> ;
  assign doutb[31] = \<const0> ;
  assign doutb[30] = \<const0> ;
  assign doutb[29] = \<const0> ;
  assign doutb[28] = \<const0> ;
  assign doutb[27] = \<const0> ;
  assign doutb[26] = \<const0> ;
  assign doutb[25] = \<const0> ;
  assign doutb[24] = \<const0> ;
  assign doutb[23] = \<const0> ;
  assign doutb[22] = \<const0> ;
  assign doutb[21] = \<const0> ;
  assign doutb[20] = \<const0> ;
  assign doutb[19] = \<const0> ;
  assign doutb[18] = \<const0> ;
  assign doutb[17] = \<const0> ;
  assign doutb[16] = \<const0> ;
  assign doutb[15] = \<const0> ;
  assign doutb[14] = \<const0> ;
  assign doutb[13] = \<const0> ;
  assign doutb[12] = \<const0> ;
  assign doutb[11] = \<const0> ;
  assign doutb[10] = \<const0> ;
  assign doutb[9] = \<const0> ;
  assign doutb[8] = \<const0> ;
  assign doutb[7] = \<const0> ;
  assign doutb[6] = \<const0> ;
  assign doutb[5] = \<const0> ;
  assign doutb[4] = \<const0> ;
  assign doutb[3] = \<const0> ;
  assign doutb[2] = \<const0> ;
  assign doutb[1] = \<const0> ;
  assign doutb[0] = \<const0> ;
  assign rdaddrecc[9] = \<const0> ;
  assign rdaddrecc[8] = \<const0> ;
  assign rdaddrecc[7] = \<const0> ;
  assign rdaddrecc[6] = \<const0> ;
  assign rdaddrecc[5] = \<const0> ;
  assign rdaddrecc[4] = \<const0> ;
  assign rdaddrecc[3] = \<const0> ;
  assign rdaddrecc[2] = \<const0> ;
  assign rdaddrecc[1] = \<const0> ;
  assign rdaddrecc[0] = \<const0> ;
  assign rsta_busy = \<const0> ;
  assign rstb_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[3] = \<const0> ;
  assign s_axi_bid[2] = \<const0> ;
  assign s_axi_bid[1] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_dbiterr = \<const0> ;
  assign s_axi_rdaddrecc[9] = \<const0> ;
  assign s_axi_rdaddrecc[8] = \<const0> ;
  assign s_axi_rdaddrecc[7] = \<const0> ;
  assign s_axi_rdaddrecc[6] = \<const0> ;
  assign s_axi_rdaddrecc[5] = \<const0> ;
  assign s_axi_rdaddrecc[4] = \<const0> ;
  assign s_axi_rdaddrecc[3] = \<const0> ;
  assign s_axi_rdaddrecc[2] = \<const0> ;
  assign s_axi_rdaddrecc[1] = \<const0> ;
  assign s_axi_rdaddrecc[0] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[3] = \<const0> ;
  assign s_axi_rid[2] = \<const0> ;
  assign s_axi_rid[1] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_sbiterr = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  GND GND
       (.G(\<const0> ));
  rom_conv1_w_32x864_blk_mem_gen_v8_4_2_synth inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .douta(douta));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_2_synth" *) 
module rom_conv1_w_32x864_blk_mem_gen_v8_4_2_synth
   (douta,
    clka,
    addra);
  output [31:0]douta;
  input clka;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [31:0]douta;

  rom_conv1_w_32x864_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .clka(clka),
        .douta(douta));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
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

endmodule
`endif
