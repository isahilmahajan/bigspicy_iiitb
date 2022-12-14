module iiitb_4bbc (UpOrDown,
    clkin,
    reset,
    Count);
 input UpOrDown;
 input clkin;
 input reset;
 output [3:0] Count;

 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;
 wire _06_;
 wire _07_;
 wire _08_;
 wire _09_;
 wire _10_;
 wire _11_;
 wire _12_;
 wire _13_;
 wire _14_;
 wire _15_;
 wire _16_;
 wire _17_;
 wire _18_;
 wire _19_;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire clknet_0_clkin;
 wire clknet_1_0__leaf_clkin;
 wire clknet_1_1__leaf_clkin;

 sky130_fd_sc_hd__clkbuf_1 _20_ (.A(net3),
    .X(_08_));
 sky130_fd_sc_hd__nand2_1 _22_ (.A(_08_),
    .B(net4),
    .Y(_09_));
 sky130_fd_sc_hd__or2_1 _23_ (.A(_08_),
    .B(net4),
    .X(_10_));
 sky130_fd_sc_hd__a21oi_1 _24_ (.A1(_09_),
    .A2(_10_),
    .B1(net1),
    .Y(_11_));
 sky130_fd_sc_hd__and3_1 _25_ (.A(net1),
    .B(_09_),
    .C(_10_),
    .X(_12_));
 sky130_fd_sc_hd__or2_1 _26_ (.A(_11_),
    .B(_12_),
    .X(_13_));
 sky130_fd_sc_hd__clkbuf_1 _27_ (.A(_13_),
    .X(_01_));
 sky130_fd_sc_hd__nand3_1 _28_ (.A(_08_),
    .B(net4),
    .C(net5),
    .Y(_14_));
 sky130_fd_sc_hd__a21o_1 _29_ (.A1(_08_),
    .A2(net4),
    .B1(net5),
    .X(_15_));
 sky130_fd_sc_hd__nand2_1 _30_ (.A(_14_),
    .B(_15_),
    .Y(_16_));
 sky130_fd_sc_hd__xnor2_1 _31_ (.A(_11_),
    .B(_16_),
    .Y(_02_));
 sky130_fd_sc_hd__or3_1 _32_ (.A(_08_),
    .B(net4),
    .C(net5),
    .X(_17_));
 sky130_fd_sc_hd__mux2_1 _33_ (.A0(_17_),
    .A1(_14_),
    .S(net1),
    .X(_18_));
 sky130_fd_sc_hd__xnor2_1 _34_ (.A(net6),
    .B(_18_),
    .Y(_03_));
 sky130_fd_sc_hd__buf_1 _35_ (.A(net2),
    .X(_19_));
 sky130_fd_sc_hd__dfrtp_1 _40_ (.CLK(clknet_1_0__leaf_clkin),
    .D(_00_),
    .RESET_B(_04_),
    .Q(net3));
 sky130_fd_sc_hd__dfrtp_1 _41_ (.CLK(clknet_1_0__leaf_clkin),
    .D(_01_),
    .RESET_B(_05_),
    .Q(net4));
 sky130_fd_sc_hd__dfrtp_1 _42_ (.CLK(clknet_1_1__leaf_clkin),
    .D(_02_),
    .RESET_B(_06_),
    .Q(net5));
 sky130_fd_sc_hd__dfrtp_1 _43_ (.CLK(clknet_1_1__leaf_clkin),
    .D(_03_),
    .RESET_B(_07_),
    .Q(net6));
 sky130_fd_sc_hd__decap_3 PHY_0 ();
 sky130_fd_sc_hd__decap_3 PHY_1 ();
 sky130_fd_sc_hd__decap_3 PHY_2 ();
 sky130_fd_sc_hd__decap_3 PHY_3 ();
 sky130_fd_sc_hd__decap_3 PHY_4 ();
 sky130_fd_sc_hd__decap_3 PHY_5 ();
 sky130_fd_sc_hd__decap_3 PHY_6 ();
 sky130_fd_sc_hd__decap_3 PHY_7 ();
 sky130_fd_sc_hd__decap_3 PHY_8 ();
 sky130_fd_sc_hd__decap_3 PHY_9 ();
 sky130_fd_sc_hd__decap_3 PHY_10 ();
 sky130_fd_sc_hd__decap_3 PHY_11 ();
 sky130_fd_sc_hd__decap_3 PHY_12 ();
 sky130_fd_sc_hd__decap_3 PHY_13 ();
 sky130_fd_sc_hd__decap_3 PHY_14 ();
 sky130_fd_sc_hd__decap_3 PHY_15 ();
 sky130_fd_sc_hd__decap_3 PHY_16 ();
 sky130_fd_sc_hd__decap_3 PHY_17 ();
 sky130_fd_sc_hd__decap_3 PHY_18 ();
 sky130_fd_sc_hd__decap_3 PHY_19 ();
 sky130_fd_sc_hd__decap_3 PHY_20 ();
 sky130_fd_sc_hd__decap_3 PHY_21 ();
 sky130_fd_sc_hd__decap_3 PHY_22 ();
 sky130_fd_sc_hd__decap_3 PHY_23 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_24 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_25 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_26 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_27 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_28 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_29 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_30 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_31 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_32 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_33 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_34 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_35 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_36 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_37 ();
 sky130_fd_sc_hd__clkbuf_1 input1 (.A(UpOrDown),
    .X(net1));
 sky130_fd_sc_hd__clkbuf_1 input2 (.A(reset),
    .X(net2));
 sky130_fd_sc_hd__buf_2 output3 (.A(net3),
    .X(Count[0]));
 sky130_fd_sc_hd__buf_2 output4 (.A(net4),
    .X(Count[1]));
 sky130_fd_sc_hd__buf_2 output5 (.A(net5),
    .X(Count[2]));
 sky130_fd_sc_hd__buf_2 output6 (.A(net6),
    .X(Count[3]));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_0_clkin (.A(clkin),
    .X(clknet_0_clkin));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_1_0__f_clkin (.A(clknet_0_clkin),
    .X(clknet_1_0__leaf_clkin));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_1_1__f_clkin (.A(clknet_0_clkin),
    .X(clknet_1_1__leaf_clkin));
 sky130_fd_sc_hd__fill_2 FILLER_0_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_21 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_29 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_41 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_49 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_55 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_57 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_68 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_1_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_1_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_1_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_2_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_41 ();
 sky130_fd_sc_hd__decap_6 FILLER_2_53 ();
 sky130_fd_sc_hd__decap_8 FILLER_2_62 ();
 sky130_fd_sc_hd__decap_8 FILLER_3_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_11 ();
 sky130_fd_sc_hd__decap_4 FILLER_3_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_24 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_36 ();
 sky130_fd_sc_hd__decap_8 FILLER_3_48 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_69 ();
 sky130_fd_sc_hd__decap_3 FILLER_4_3 ();
 sky130_fd_sc_hd__decap_6 FILLER_4_13 ();
 sky130_fd_sc_hd__decap_3 FILLER_4_25 ();
 sky130_fd_sc_hd__fill_2 FILLER_4_29 ();
 sky130_fd_sc_hd__decap_4 FILLER_4_35 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_39 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_43 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_55 ();
 sky130_fd_sc_hd__decap_3 FILLER_4_67 ();
 sky130_fd_sc_hd__fill_2 FILLER_5_3 ();
 sky130_fd_sc_hd__decap_6 FILLER_5_9 ();
 sky130_fd_sc_hd__decap_4 FILLER_5_24 ();
 sky130_fd_sc_hd__decap_8 FILLER_5_48 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_69 ();
 sky130_fd_sc_hd__decap_3 FILLER_6_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_26 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_6_36 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_44 ();
 sky130_fd_sc_hd__decap_4 FILLER_6_65 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_69 ();
 sky130_fd_sc_hd__fill_2 FILLER_7_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_7_10 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_21 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_33 ();
 sky130_fd_sc_hd__fill_2 FILLER_7_54 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_3 ();
 sky130_fd_sc_hd__decap_3 FILLER_8_15 ();
 sky130_fd_sc_hd__decap_4 FILLER_8_23 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_27 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_29 ();
 sky130_fd_sc_hd__decap_6 FILLER_8_34 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_40 ();
 sky130_fd_sc_hd__decap_4 FILLER_8_44 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_68 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_20 ();
 sky130_fd_sc_hd__fill_2 FILLER_9_32 ();
 sky130_fd_sc_hd__fill_2 FILLER_9_54 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_10_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_10_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_10_29 ();
 sky130_fd_sc_hd__decap_6 FILLER_10_41 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_47 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_68 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_8 ();
 sky130_fd_sc_hd__decap_8 FILLER_11_20 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_41 ();
 sky130_fd_sc_hd__decap_3 FILLER_11_53 ();
 sky130_fd_sc_hd__decap_6 FILLER_11_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_63 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_68 ();
endmodule
