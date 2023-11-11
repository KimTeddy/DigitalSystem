// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Nov  9 11:56:07 2023
// Host        : TeddyLaptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bram8x8_sim_netlist.v
// Design      : bram8x8
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bram8x8,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [2:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [2:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire [0:0]wea;
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
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [2:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [2:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "3" *) 
  (* C_ADDRB_WIDTH = "3" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.54005 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
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
  (* C_INIT_FILE = "bram8x8.mem" *) 
  (* C_INIT_FILE_NAME = "bram8x8.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "8" *) 
  (* C_READ_DEPTH_B = "8" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
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
  (* C_WRITE_DEPTH_A = "8" *) 
  (* C_WRITE_DEPTH_B = "8" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[2:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[2:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20256)
`pragma protect data_block
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
VQKcSnZKVejMJd5IqsXns5riSbVV
`pragma protect end_protected
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
