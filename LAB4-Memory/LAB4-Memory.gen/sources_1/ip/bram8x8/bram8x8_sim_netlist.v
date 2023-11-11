// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Nov  9 11:56:08 2023
// Host        : TeddyLaptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/DigitalSystem/LAB4-Memory/LAB4-Memory.gen/sources_1/ip/bram8x8/bram8x8_sim_netlist.v
// Design      : bram8x8
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bram8x8,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module bram8x8
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
  bram8x8_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20160)
`pragma protect data_block
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
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
