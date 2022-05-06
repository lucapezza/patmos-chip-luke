module HelloMorse(
  input   clock,
  input   reset,
  output  io_led,
  output  io_audio,
  output  io_gain,
  output  io_nshutdown
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
`endif // RANDOMIZE_REG_INIT
  reg  regs_0; // @[HelloMorse.scala 72:21]
  reg  regs_1; // @[HelloMorse.scala 72:21]
  reg  regs_2; // @[HelloMorse.scala 72:21]
  reg  regs_3; // @[HelloMorse.scala 72:21]
  reg  regs_4; // @[HelloMorse.scala 72:21]
  reg  regs_5; // @[HelloMorse.scala 72:21]
  reg  regs_6; // @[HelloMorse.scala 72:21]
  reg  regs_7; // @[HelloMorse.scala 72:21]
  reg  regs_8; // @[HelloMorse.scala 72:21]
  reg  regs_9; // @[HelloMorse.scala 72:21]
  reg  regs_10; // @[HelloMorse.scala 72:21]
  reg  regs_11; // @[HelloMorse.scala 72:21]
  reg  regs_12; // @[HelloMorse.scala 72:21]
  reg  regs_13; // @[HelloMorse.scala 72:21]
  reg  regs_14; // @[HelloMorse.scala 72:21]
  reg  regs_15; // @[HelloMorse.scala 72:21]
  reg  regs_16; // @[HelloMorse.scala 72:21]
  reg  regs_17; // @[HelloMorse.scala 72:21]
  reg  regs_18; // @[HelloMorse.scala 72:21]
  reg  regs_19; // @[HelloMorse.scala 72:21]
  reg  regs_20; // @[HelloMorse.scala 72:21]
  reg  regs_21; // @[HelloMorse.scala 72:21]
  reg  regs_22; // @[HelloMorse.scala 72:21]
  reg  regs_23; // @[HelloMorse.scala 72:21]
  reg  regs_24; // @[HelloMorse.scala 72:21]
  reg  regs_25; // @[HelloMorse.scala 72:21]
  reg  regs_26; // @[HelloMorse.scala 72:21]
  reg  regs_27; // @[HelloMorse.scala 72:21]
  reg  regs_28; // @[HelloMorse.scala 72:21]
  reg  regs_29; // @[HelloMorse.scala 72:21]
  reg  regs_30; // @[HelloMorse.scala 72:21]
  reg  regs_31; // @[HelloMorse.scala 72:21]
  reg  regs_32; // @[HelloMorse.scala 72:21]
  reg  regs_33; // @[HelloMorse.scala 72:21]
  reg  regs_34; // @[HelloMorse.scala 72:21]
  reg  regs_35; // @[HelloMorse.scala 72:21]
  reg  regs_36; // @[HelloMorse.scala 72:21]
  reg  regs_37; // @[HelloMorse.scala 72:21]
  reg  regs_38; // @[HelloMorse.scala 72:21]
  reg  regs_39; // @[HelloMorse.scala 72:21]
  reg  regs_40; // @[HelloMorse.scala 72:21]
  reg  regs_41; // @[HelloMorse.scala 72:21]
  reg  regs_42; // @[HelloMorse.scala 72:21]
  reg  regs_43; // @[HelloMorse.scala 72:21]
  reg  regs_44; // @[HelloMorse.scala 72:21]
  reg  regs_45; // @[HelloMorse.scala 72:21]
  reg  regs_46; // @[HelloMorse.scala 72:21]
  reg  regs_47; // @[HelloMorse.scala 72:21]
  reg  regs_48; // @[HelloMorse.scala 72:21]
  reg  regs_49; // @[HelloMorse.scala 72:21]
  reg  regs_50; // @[HelloMorse.scala 72:21]
  reg  regs_51; // @[HelloMorse.scala 72:21]
  reg  regs_52; // @[HelloMorse.scala 72:21]
  reg  regs_53; // @[HelloMorse.scala 72:21]
  reg  regs_54; // @[HelloMorse.scala 72:21]
  reg  regs_55; // @[HelloMorse.scala 72:21]
  reg  regs_56; // @[HelloMorse.scala 72:21]
  reg  regs_57; // @[HelloMorse.scala 72:21]
  reg  regs_58; // @[HelloMorse.scala 72:21]
  reg  regs_59; // @[HelloMorse.scala 72:21]
  reg  regs_60; // @[HelloMorse.scala 72:21]
  reg  regs_61; // @[HelloMorse.scala 72:21]
  reg  regs_62; // @[HelloMorse.scala 72:21]
  reg  regs_63; // @[HelloMorse.scala 72:21]
  reg  regs_64; // @[HelloMorse.scala 72:21]
  reg  regs_65; // @[HelloMorse.scala 72:21]
  reg  regs_66; // @[HelloMorse.scala 72:21]
  reg  regs_67; // @[HelloMorse.scala 72:21]
  reg  regs_68; // @[HelloMorse.scala 72:21]
  reg  regs_69; // @[HelloMorse.scala 72:21]
  reg  regs_70; // @[HelloMorse.scala 72:21]
  reg  regs_71; // @[HelloMorse.scala 72:21]
  reg  regs_72; // @[HelloMorse.scala 72:21]
  reg  regs_73; // @[HelloMorse.scala 72:21]
  reg  regs_74; // @[HelloMorse.scala 72:21]
  reg  regs_75; // @[HelloMorse.scala 72:21]
  reg  regs_76; // @[HelloMorse.scala 72:21]
  reg  regs_77; // @[HelloMorse.scala 72:21]
  reg  regs_78; // @[HelloMorse.scala 72:21]
  reg  regs_79; // @[HelloMorse.scala 72:21]
  reg  regs_80; // @[HelloMorse.scala 72:21]
  reg  regs_81; // @[HelloMorse.scala 72:21]
  reg  regs_82; // @[HelloMorse.scala 72:21]
  reg  regs_83; // @[HelloMorse.scala 72:21]
  reg  regs_84; // @[HelloMorse.scala 72:21]
  reg  regs_85; // @[HelloMorse.scala 72:21]
  reg  regs_86; // @[HelloMorse.scala 72:21]
  reg  regs_87; // @[HelloMorse.scala 72:21]
  reg  regs_88; // @[HelloMorse.scala 72:21]
  reg  regs_89; // @[HelloMorse.scala 72:21]
  reg  regs_90; // @[HelloMorse.scala 72:21]
  reg  regs_91; // @[HelloMorse.scala 72:21]
  reg  regs_92; // @[HelloMorse.scala 72:21]
  reg  regs_93; // @[HelloMorse.scala 72:21]
  reg  regs_94; // @[HelloMorse.scala 72:21]
  reg  regs_95; // @[HelloMorse.scala 72:21]
  reg  regs_96; // @[HelloMorse.scala 72:21]
  reg  regs_97; // @[HelloMorse.scala 72:21]
  reg  regs_98; // @[HelloMorse.scala 72:21]
  reg  regs_99; // @[HelloMorse.scala 72:21]
  reg  regs_100; // @[HelloMorse.scala 72:21]
  reg  regs_101; // @[HelloMorse.scala 72:21]
  reg  regs_102; // @[HelloMorse.scala 72:21]
  reg  regs_103; // @[HelloMorse.scala 72:21]
  reg  regs_104; // @[HelloMorse.scala 72:21]
  reg  regs_105; // @[HelloMorse.scala 72:21]
  reg  regs_106; // @[HelloMorse.scala 72:21]
  reg  regs_107; // @[HelloMorse.scala 72:21]
  reg  regs_108; // @[HelloMorse.scala 72:21]
  reg  regs_109; // @[HelloMorse.scala 72:21]
  reg  regs_110; // @[HelloMorse.scala 72:21]
  reg  regs_111; // @[HelloMorse.scala 72:21]
  reg  regs_112; // @[HelloMorse.scala 72:21]
  reg  regs_113; // @[HelloMorse.scala 72:21]
  reg  regs_114; // @[HelloMorse.scala 72:21]
  reg  regs_115; // @[HelloMorse.scala 72:21]
  reg  regs_116; // @[HelloMorse.scala 72:21]
  reg  regs_117; // @[HelloMorse.scala 72:21]
  reg  regs_118; // @[HelloMorse.scala 72:21]
  reg  regs_119; // @[HelloMorse.scala 72:21]
  reg  regs_120; // @[HelloMorse.scala 72:21]
  reg  regs_121; // @[HelloMorse.scala 72:21]
  reg  regs_122; // @[HelloMorse.scala 72:21]
  reg  regs_123; // @[HelloMorse.scala 72:21]
  reg  regs_124; // @[HelloMorse.scala 72:21]
  reg  regs_125; // @[HelloMorse.scala 72:21]
  reg  regs_126; // @[HelloMorse.scala 72:21]
  reg  regs_127; // @[HelloMorse.scala 72:21]
  reg  regs_128; // @[HelloMorse.scala 72:21]
  reg  regs_129; // @[HelloMorse.scala 72:21]
  reg  regs_130; // @[HelloMorse.scala 72:21]
  reg  regs_131; // @[HelloMorse.scala 72:21]
  reg  regs_132; // @[HelloMorse.scala 72:21]
  reg  regs_133; // @[HelloMorse.scala 72:21]
  reg  regs_134; // @[HelloMorse.scala 72:21]
  reg  regs_135; // @[HelloMorse.scala 72:21]
  reg  regs_136; // @[HelloMorse.scala 72:21]
  reg  regs_137; // @[HelloMorse.scala 72:21]
  reg [20:0] cntReg; // @[HelloMorse.scala 74:23]
  wire  tick = cntReg == 21'h0; // @[HelloMorse.scala 75:21]
  wire [20:0] _cntReg_T_1 = cntReg - 21'h1; // @[HelloMorse.scala 76:35]
  wire  _GEN_0 = tick ? regs_1 : regs_0; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_2 = tick ? regs_3 : regs_2; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_4 = tick ? regs_5 : regs_4; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_6 = tick ? regs_7 : regs_6; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_11 = tick ? regs_12 : regs_11; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_16 = tick ? regs_17 : regs_16; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_18 = tick ? regs_19 : regs_18; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_19 = tick ? regs_20 : regs_19; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_20 = tick ? regs_21 : regs_20; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_22 = tick ? regs_23 : regs_22; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_24 = tick ? regs_25 : regs_24; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_29 = tick ? regs_30 : regs_29; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_31 = tick ? regs_32 : regs_31; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_32 = tick ? regs_33 : regs_32; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_33 = tick ? regs_34 : regs_33; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_35 = tick ? regs_36 : regs_35; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_37 = tick ? regs_38 : regs_37; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_42 = tick ? regs_43 : regs_42; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_43 = tick ? regs_44 : regs_43; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_44 = tick ? regs_45 : regs_44; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_46 = tick ? regs_47 : regs_46; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_47 = tick ? regs_48 : regs_47; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_48 = tick ? regs_49 : regs_48; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_50 = tick ? regs_51 : regs_50; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_51 = tick ? regs_52 : regs_51; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_52 = tick ? regs_53 : regs_52; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_64 = tick ? regs_65 : regs_64; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_66 = tick ? regs_67 : regs_66; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_67 = tick ? regs_68 : regs_67; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_68 = tick ? regs_69 : regs_68; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_70 = tick ? regs_71 : regs_70; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_71 = tick ? regs_72 : regs_71; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_72 = tick ? regs_73 : regs_72; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_77 = tick ? regs_78 : regs_77; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_78 = tick ? regs_79 : regs_78; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_79 = tick ? regs_80 : regs_79; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_81 = tick ? regs_82 : regs_81; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_82 = tick ? regs_83 : regs_82; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_83 = tick ? regs_84 : regs_83; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_85 = tick ? regs_86 : regs_85; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_86 = tick ? regs_87 : regs_86; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_87 = tick ? regs_88 : regs_87; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_92 = tick ? regs_93 : regs_92; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_94 = tick ? regs_95 : regs_94; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_95 = tick ? regs_96 : regs_95; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_96 = tick ? regs_97 : regs_96; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_98 = tick ? regs_99 : regs_98; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_103 = tick ? regs_104 : regs_103; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_105 = tick ? regs_106 : regs_105; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_106 = tick ? regs_107 : regs_106; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_107 = tick ? regs_108 : regs_107; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_109 = tick ? regs_110 : regs_109; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_111 = tick ? regs_112 : regs_111; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_116 = tick ? regs_117 : regs_116; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_117 = tick ? regs_118 : regs_117; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_118 = tick ? regs_119 : regs_118; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_120 = tick ? regs_121 : regs_120; // @[HelloMorse.scala 79:17 80:15 72:21]
  wire  _GEN_122 = tick ? regs_123 : regs_122; // @[HelloMorse.scala 79:17 80:15 72:21]
  reg [13:0] audioCntReg; // @[HelloMorse.scala 93:28]
  wire  toggleTick = audioCntReg == 14'h0; // @[HelloMorse.scala 94:32]
  reg  toggleReg; // @[HelloMorse.scala 95:26]
  wire [13:0] _audioCntReg_T_1 = audioCntReg - 14'h1; // @[HelloMorse.scala 96:30]
  wire  _T = ~toggleReg; // @[HelloMorse.scala 98:21]
  assign io_led = regs_0; // @[HelloMorse.scala 109:10]
  assign io_audio = toggleReg & regs_0; // @[HelloMorse.scala 108:25]
  assign io_gain = 1'h0; // @[HelloMorse.scala 106:11]
  assign io_nshutdown = 1'h1; // @[HelloMorse.scala 107:16]
  always @(posedge clock) begin
    regs_0 <= reset | _GEN_0; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_1 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_1 <= regs_2; // @[HelloMorse.scala 80:15]
    end
    regs_2 <= reset | _GEN_2; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_3 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_3 <= regs_4; // @[HelloMorse.scala 80:15]
    end
    regs_4 <= reset | _GEN_4; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_5 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_5 <= regs_6; // @[HelloMorse.scala 80:15]
    end
    regs_6 <= reset | _GEN_6; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_7 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_7 <= regs_8; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_8 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_8 <= regs_9; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_9 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_9 <= regs_10; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_10 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_10 <= regs_11; // @[HelloMorse.scala 80:15]
    end
    regs_11 <= reset | _GEN_11; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_12 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_12 <= regs_13; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_13 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_13 <= regs_14; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_14 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_14 <= regs_15; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_15 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_15 <= regs_16; // @[HelloMorse.scala 80:15]
    end
    regs_16 <= reset | _GEN_16; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_17 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_17 <= regs_18; // @[HelloMorse.scala 80:15]
    end
    regs_18 <= reset | _GEN_18; // @[HelloMorse.scala 72:{21,21}]
    regs_19 <= reset | _GEN_19; // @[HelloMorse.scala 72:{21,21}]
    regs_20 <= reset | _GEN_20; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_21 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_21 <= regs_22; // @[HelloMorse.scala 80:15]
    end
    regs_22 <= reset | _GEN_22; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_23 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_23 <= regs_24; // @[HelloMorse.scala 80:15]
    end
    regs_24 <= reset | _GEN_24; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_25 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_25 <= regs_26; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_26 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_26 <= regs_27; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_27 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_27 <= regs_28; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_28 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_28 <= regs_29; // @[HelloMorse.scala 80:15]
    end
    regs_29 <= reset | _GEN_29; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_30 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_30 <= regs_31; // @[HelloMorse.scala 80:15]
    end
    regs_31 <= reset | _GEN_31; // @[HelloMorse.scala 72:{21,21}]
    regs_32 <= reset | _GEN_32; // @[HelloMorse.scala 72:{21,21}]
    regs_33 <= reset | _GEN_33; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_34 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_34 <= regs_35; // @[HelloMorse.scala 80:15]
    end
    regs_35 <= reset | _GEN_35; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_36 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_36 <= regs_37; // @[HelloMorse.scala 80:15]
    end
    regs_37 <= reset | _GEN_37; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_38 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_38 <= regs_39; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_39 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_39 <= regs_40; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_40 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_40 <= regs_41; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_41 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_41 <= regs_42; // @[HelloMorse.scala 80:15]
    end
    regs_42 <= reset | _GEN_42; // @[HelloMorse.scala 72:{21,21}]
    regs_43 <= reset | _GEN_43; // @[HelloMorse.scala 72:{21,21}]
    regs_44 <= reset | _GEN_44; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_45 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_45 <= regs_46; // @[HelloMorse.scala 80:15]
    end
    regs_46 <= reset | _GEN_46; // @[HelloMorse.scala 72:{21,21}]
    regs_47 <= reset | _GEN_47; // @[HelloMorse.scala 72:{21,21}]
    regs_48 <= reset | _GEN_48; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_49 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_49 <= regs_50; // @[HelloMorse.scala 80:15]
    end
    regs_50 <= reset | _GEN_50; // @[HelloMorse.scala 72:{21,21}]
    regs_51 <= reset | _GEN_51; // @[HelloMorse.scala 72:{21,21}]
    regs_52 <= reset | _GEN_52; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_53 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_53 <= regs_54; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_54 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_54 <= regs_55; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_55 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_55 <= regs_56; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_56 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_56 <= regs_57; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_57 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_57 <= regs_58; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_58 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_58 <= regs_59; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_59 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_59 <= regs_60; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_60 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_60 <= regs_61; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_61 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_61 <= regs_62; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_62 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_62 <= regs_63; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_63 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_63 <= regs_64; // @[HelloMorse.scala 80:15]
    end
    regs_64 <= reset | _GEN_64; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_65 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_65 <= regs_66; // @[HelloMorse.scala 80:15]
    end
    regs_66 <= reset | _GEN_66; // @[HelloMorse.scala 72:{21,21}]
    regs_67 <= reset | _GEN_67; // @[HelloMorse.scala 72:{21,21}]
    regs_68 <= reset | _GEN_68; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_69 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_69 <= regs_70; // @[HelloMorse.scala 80:15]
    end
    regs_70 <= reset | _GEN_70; // @[HelloMorse.scala 72:{21,21}]
    regs_71 <= reset | _GEN_71; // @[HelloMorse.scala 72:{21,21}]
    regs_72 <= reset | _GEN_72; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_73 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_73 <= regs_74; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_74 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_74 <= regs_75; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_75 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_75 <= regs_76; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_76 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_76 <= regs_77; // @[HelloMorse.scala 80:15]
    end
    regs_77 <= reset | _GEN_77; // @[HelloMorse.scala 72:{21,21}]
    regs_78 <= reset | _GEN_78; // @[HelloMorse.scala 72:{21,21}]
    regs_79 <= reset | _GEN_79; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_80 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_80 <= regs_81; // @[HelloMorse.scala 80:15]
    end
    regs_81 <= reset | _GEN_81; // @[HelloMorse.scala 72:{21,21}]
    regs_82 <= reset | _GEN_82; // @[HelloMorse.scala 72:{21,21}]
    regs_83 <= reset | _GEN_83; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_84 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_84 <= regs_85; // @[HelloMorse.scala 80:15]
    end
    regs_85 <= reset | _GEN_85; // @[HelloMorse.scala 72:{21,21}]
    regs_86 <= reset | _GEN_86; // @[HelloMorse.scala 72:{21,21}]
    regs_87 <= reset | _GEN_87; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_88 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_88 <= regs_89; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_89 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_89 <= regs_90; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_90 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_90 <= regs_91; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_91 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_91 <= regs_92; // @[HelloMorse.scala 80:15]
    end
    regs_92 <= reset | _GEN_92; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_93 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_93 <= regs_94; // @[HelloMorse.scala 80:15]
    end
    regs_94 <= reset | _GEN_94; // @[HelloMorse.scala 72:{21,21}]
    regs_95 <= reset | _GEN_95; // @[HelloMorse.scala 72:{21,21}]
    regs_96 <= reset | _GEN_96; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_97 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_97 <= regs_98; // @[HelloMorse.scala 80:15]
    end
    regs_98 <= reset | _GEN_98; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_99 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_99 <= regs_100; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_100 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_100 <= regs_101; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_101 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_101 <= regs_102; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_102 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_102 <= regs_103; // @[HelloMorse.scala 80:15]
    end
    regs_103 <= reset | _GEN_103; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_104 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_104 <= regs_105; // @[HelloMorse.scala 80:15]
    end
    regs_105 <= reset | _GEN_105; // @[HelloMorse.scala 72:{21,21}]
    regs_106 <= reset | _GEN_106; // @[HelloMorse.scala 72:{21,21}]
    regs_107 <= reset | _GEN_107; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_108 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_108 <= regs_109; // @[HelloMorse.scala 80:15]
    end
    regs_109 <= reset | _GEN_109; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_110 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_110 <= regs_111; // @[HelloMorse.scala 80:15]
    end
    regs_111 <= reset | _GEN_111; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_112 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_112 <= regs_113; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_113 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_113 <= regs_114; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_114 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_114 <= regs_115; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_115 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_115 <= regs_116; // @[HelloMorse.scala 80:15]
    end
    regs_116 <= reset | _GEN_116; // @[HelloMorse.scala 72:{21,21}]
    regs_117 <= reset | _GEN_117; // @[HelloMorse.scala 72:{21,21}]
    regs_118 <= reset | _GEN_118; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_119 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_119 <= regs_120; // @[HelloMorse.scala 80:15]
    end
    regs_120 <= reset | _GEN_120; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_121 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_121 <= regs_122; // @[HelloMorse.scala 80:15]
    end
    regs_122 <= reset | _GEN_122; // @[HelloMorse.scala 72:{21,21}]
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_123 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_123 <= regs_124; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_124 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_124 <= regs_125; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_125 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_125 <= regs_126; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_126 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_126 <= regs_127; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_127 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_127 <= regs_128; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_128 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_128 <= regs_129; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_129 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_129 <= regs_130; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_130 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_130 <= regs_131; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_131 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_131 <= regs_132; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_132 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_132 <= regs_133; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_133 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_133 <= regs_134; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_134 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_134 <= regs_135; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_135 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_135 <= regs_136; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_136 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 79:17]
      regs_136 <= regs_137; // @[HelloMorse.scala 80:15]
    end
    if (reset) begin // @[HelloMorse.scala 72:21]
      regs_137 <= 1'h0; // @[HelloMorse.scala 72:21]
    end else if (tick) begin // @[HelloMorse.scala 83:15]
      regs_137 <= regs_0; // @[HelloMorse.scala 84:23]
    end
    if (reset) begin // @[HelloMorse.scala 74:23]
      cntReg <= 21'h10f446; // @[HelloMorse.scala 74:23]
    end else if (tick) begin // @[HelloMorse.scala 76:16]
      cntReg <= 21'h10f446;
    end else begin
      cntReg <= _cntReg_T_1;
    end
    if (reset) begin // @[HelloMorse.scala 93:28]
      audioCntReg <= 14'h14; // @[HelloMorse.scala 93:28]
    end else if (toggleTick) begin // @[HelloMorse.scala 97:21]
      if (~toggleReg) begin // @[HelloMorse.scala 98:30]
        audioCntReg <= 14'h14; // @[HelloMorse.scala 99:19]
      end else begin
        audioCntReg <= 14'h26fc; // @[HelloMorse.scala 101:19]
      end
    end else begin
      audioCntReg <= _audioCntReg_T_1; // @[HelloMorse.scala 96:15]
    end
    if (reset) begin // @[HelloMorse.scala 95:26]
      toggleReg <= 1'h0; // @[HelloMorse.scala 95:26]
    end else if (toggleTick) begin // @[HelloMorse.scala 97:21]
      toggleReg <= _T; // @[HelloMorse.scala 103:15]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  regs_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  regs_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  regs_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  regs_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  regs_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  regs_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  regs_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  regs_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  regs_8 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  regs_9 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  regs_10 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  regs_11 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  regs_12 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  regs_13 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  regs_14 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  regs_15 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  regs_16 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  regs_17 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  regs_18 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  regs_19 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  regs_20 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  regs_21 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  regs_22 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  regs_23 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  regs_24 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  regs_25 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  regs_26 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  regs_27 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  regs_28 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  regs_29 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  regs_30 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  regs_31 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  regs_32 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  regs_33 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  regs_34 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  regs_35 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  regs_36 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  regs_37 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  regs_38 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  regs_39 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  regs_40 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  regs_41 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  regs_42 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  regs_43 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  regs_44 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  regs_45 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  regs_46 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  regs_47 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  regs_48 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  regs_49 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  regs_50 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  regs_51 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  regs_52 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  regs_53 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  regs_54 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  regs_55 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  regs_56 = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  regs_57 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  regs_58 = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  regs_59 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  regs_60 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  regs_61 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  regs_62 = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  regs_63 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  regs_64 = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  regs_65 = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  regs_66 = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  regs_67 = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  regs_68 = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  regs_69 = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  regs_70 = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  regs_71 = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  regs_72 = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  regs_73 = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  regs_74 = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  regs_75 = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  regs_76 = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  regs_77 = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  regs_78 = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  regs_79 = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  regs_80 = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  regs_81 = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  regs_82 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  regs_83 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  regs_84 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  regs_85 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  regs_86 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  regs_87 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  regs_88 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  regs_89 = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  regs_90 = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  regs_91 = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  regs_92 = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  regs_93 = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  regs_94 = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  regs_95 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  regs_96 = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  regs_97 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  regs_98 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  regs_99 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  regs_100 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  regs_101 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  regs_102 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  regs_103 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  regs_104 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  regs_105 = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  regs_106 = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  regs_107 = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  regs_108 = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  regs_109 = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  regs_110 = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  regs_111 = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  regs_112 = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  regs_113 = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  regs_114 = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  regs_115 = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  regs_116 = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  regs_117 = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  regs_118 = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  regs_119 = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  regs_120 = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  regs_121 = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  regs_122 = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  regs_123 = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  regs_124 = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  regs_125 = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  regs_126 = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  regs_127 = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  regs_128 = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  regs_129 = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  regs_130 = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  regs_131 = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  regs_132 = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  regs_133 = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  regs_134 = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  regs_135 = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  regs_136 = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  regs_137 = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  cntReg = _RAND_138[20:0];
  _RAND_139 = {1{`RANDOM}};
  audioCntReg = _RAND_139[13:0];
  _RAND_140 = {1{`RANDOM}};
  toggleReg = _RAND_140[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
