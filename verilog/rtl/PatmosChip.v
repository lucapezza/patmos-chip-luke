module NullICache(
  input         clock,
  input         reset,
  input         io_ena_in,
  input         io_exicache_doCallRet,
  input  [31:0] io_exicache_callRetBase,
  input  [31:0] io_exicache_callRetAddr,
  output [31:0] io_icachefe_base,
  output [9:0]  io_icachefe_relBase,
  output [10:0] io_icachefe_relPc,
  output [31:0] io_icachefe_reloc,
  output [1:0]  io_icachefe_memSel
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] callRetBaseReg; // @[NullICache.scala 17:31]
  reg [31:0] callAddrReg; // @[NullICache.scala 18:28]
  reg  selIspmReg; // @[NullICache.scala 19:27]
  wire [31:0] _GEN_3 = {{18'd0}, callRetBaseReg[13:0]}; // @[NullICache.scala 33:36]
  wire [31:0] _T_6 = callAddrReg + _GEN_3; // @[NullICache.scala 33:36]
  wire [14:0] _T_7 = selIspmReg ? 15'h4000 : 15'h0; // @[NullICache.scala 34:27]
  assign io_icachefe_base = callRetBaseReg; // @[NullICache.scala 31:20]
  assign io_icachefe_relBase = callRetBaseReg[9:0]; // @[NullICache.scala 32:23]
  assign io_icachefe_relPc = _T_6[10:0]; // @[NullICache.scala 33:21]
  assign io_icachefe_reloc = {{17'd0}, _T_7}; // @[NullICache.scala 34:27]
  assign io_icachefe_memSel = {selIspmReg,1'h0}; // @[Cat.scala 30:58]
  always @(posedge clock) begin
    if (reset) begin // @[NullICache.scala 17:31]
      callRetBaseReg <= 32'h1; // @[NullICache.scala 17:31]
    end else if (io_exicache_doCallRet & io_ena_in) begin // @[NullICache.scala 23:45]
      callRetBaseReg <= io_exicache_callRetBase; // @[NullICache.scala 24:20]
    end
    if (reset) begin // @[NullICache.scala 18:28]
      callAddrReg <= 32'h1; // @[NullICache.scala 18:28]
    end else if (io_exicache_doCallRet & io_ena_in) begin // @[NullICache.scala 23:45]
      callAddrReg <= io_exicache_callRetAddr; // @[NullICache.scala 25:17]
    end
    if (reset) begin // @[NullICache.scala 19:27]
      selIspmReg <= 1'h0; // @[NullICache.scala 19:27]
    end else if (io_exicache_doCallRet & io_ena_in) begin // @[NullICache.scala 23:45]
      selIspmReg <= io_exicache_callRetBase[31:14] == 18'h1; // @[NullICache.scala 26:16]
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
  callRetBaseReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  callAddrReg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  selIspmReg = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BootMemory(
  input         clock,
  input         io_write_enaEven,
  input  [8:0]  io_write_addrEven,
  input  [31:0] io_write_dataEven,
  input         io_write_enaOdd,
  input  [8:0]  io_write_addrOdd,
  input  [31:0] io_write_dataOdd,
  input  [12:0] io_read_addrEven,
  input  [12:0] io_read_addrOdd,
  output [31:0] io_read_dataEven,
  output [31:0] io_read_dataOdd
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [10:0] rom_addressEven; // @[BootMemory.scala 34:19]
  wire [10:0] rom_addressOdd; // @[BootMemory.scala 34:19]
  wire [31:0] rom_instructionEven; // @[BootMemory.scala 34:19]
  wire [31:0] rom_instructionOdd; // @[BootMemory.scala 34:19]
  wire  memWithWrEven_clk0; // @[SRAM.scala 18:22]
  wire  memWithWrEven_csb0; // @[SRAM.scala 18:22]
  wire  memWithWrEven_web0; // @[SRAM.scala 18:22]
  wire [3:0] memWithWrEven_wmask0; // @[SRAM.scala 18:22]
  wire [7:0] memWithWrEven_addr0; // @[SRAM.scala 18:22]
  wire [31:0] memWithWrEven_din0; // @[SRAM.scala 18:22]
  wire [31:0] memWithWrEven_dout0; // @[SRAM.scala 18:22]
  wire  memWithWrEven_clk1; // @[SRAM.scala 18:22]
  wire  memWithWrEven_csb1; // @[SRAM.scala 18:22]
  wire [7:0] memWithWrEven_addr1; // @[SRAM.scala 18:22]
  wire [31:0] memWithWrEven_dout1; // @[SRAM.scala 18:22]
  wire  memWithWrOdd_clk0; // @[SRAM.scala 18:22]
  wire  memWithWrOdd_csb0; // @[SRAM.scala 18:22]
  wire  memWithWrOdd_web0; // @[SRAM.scala 18:22]
  wire [3:0] memWithWrOdd_wmask0; // @[SRAM.scala 18:22]
  wire [7:0] memWithWrOdd_addr0; // @[SRAM.scala 18:22]
  wire [31:0] memWithWrOdd_din0; // @[SRAM.scala 18:22]
  wire [31:0] memWithWrOdd_dout0; // @[SRAM.scala 18:22]
  wire  memWithWrOdd_clk1; // @[SRAM.scala 18:22]
  wire  memWithWrOdd_csb1; // @[SRAM.scala 18:22]
  wire [7:0] memWithWrOdd_addr1; // @[SRAM.scala 18:22]
  wire [31:0] memWithWrOdd_dout1; // @[SRAM.scala 18:22]
  reg [12:0] rdAddrEvenReg; // @[BootMemory.scala 37:40]
  reg [12:0] rdAddrOddReg; // @[BootMemory.scala 38:39]
  wire [12:0] _T_6 = io_read_addrEven - 13'h1000; // @[BootMemory.scala 46:54]
  wire [9:0] readEven = memWithWrEven_dout0[10:1]; // @[BootMemory.scala 46:75]
  wire [12:0] _T_11 = io_read_addrOdd - 13'h1000; // @[BootMemory.scala 51:51]
  wire [9:0] readOdd = memWithWrOdd_dout0[10:1]; // @[BootMemory.scala 51:72]
  BlackBoxRom rom ( // @[BootMemory.scala 34:19]
    .addressEven(rom_addressEven),
    .addressOdd(rom_addressOdd),
    .instructionEven(rom_instructionEven),
    .instructionOdd(rom_instructionOdd)
  );
  sky130_sram_1kbyte_1rw1r_32x256_8 memWithWrEven ( // @[SRAM.scala 18:22]
    .clk0(memWithWrEven_clk0),
    .csb0(memWithWrEven_csb0),
    .web0(memWithWrEven_web0),
    .wmask0(memWithWrEven_wmask0),
    .addr0(memWithWrEven_addr0),
    .din0(memWithWrEven_din0),
    .dout0(memWithWrEven_dout0),
    .clk1(memWithWrEven_clk1),
    .csb1(memWithWrEven_csb1),
    .addr1(memWithWrEven_addr1),
    .dout1(memWithWrEven_dout1)
  );
  sky130_sram_1kbyte_1rw1r_32x256_8 memWithWrOdd ( // @[SRAM.scala 18:22]
    .clk0(memWithWrOdd_clk0),
    .csb0(memWithWrOdd_csb0),
    .web0(memWithWrOdd_web0),
    .wmask0(memWithWrOdd_wmask0),
    .addr0(memWithWrOdd_addr0),
    .din0(memWithWrOdd_din0),
    .dout0(memWithWrOdd_dout0),
    .clk1(memWithWrOdd_clk1),
    .csb1(memWithWrOdd_csb1),
    .addr1(memWithWrOdd_addr1),
    .dout1(memWithWrOdd_dout1)
  );
  assign io_read_dataEven = rdAddrEvenReg > 13'hfff ? {{22'd0}, readEven} : rom_instructionEven; // @[BootMemory.scala 54:51 BootMemory.scala 55:22 BootMemory.scala 57:22]
  assign io_read_dataOdd = rdAddrOddReg > 13'hfff ? {{22'd0}, readOdd} : rom_instructionOdd; // @[BootMemory.scala 61:50 BootMemory.scala 62:21 BootMemory.scala 64:21]
  assign rom_addressEven = {{1'd0}, rdAddrEvenReg[10:1]}; // @[BootMemory.scala 40:38]
  assign rom_addressOdd = {{1'd0}, rdAddrOddReg[10:1]}; // @[BootMemory.scala 41:36]
  assign memWithWrEven_clk0 = clock; // @[SRAM.scala 19:18]
  assign memWithWrEven_csb0 = 1'h0; // @[SRAM.scala 21:18]
  assign memWithWrEven_web0 = ~io_write_enaEven; // @[SRAM.scala 86:16]
  assign memWithWrEven_wmask0 = 4'hf; // @[SRAM.scala 85:23]
  assign memWithWrEven_addr0 = io_write_addrEven[7:0]; // @[SRAM.scala 87:14]
  assign memWithWrEven_din0 = io_write_dataEven; // @[SRAM.scala 88:13]
  assign memWithWrEven_clk1 = clock; // @[SRAM.scala 20:18]
  assign memWithWrEven_csb1 = 1'h0; // @[SRAM.scala 22:18]
  assign memWithWrEven_addr1 = _T_6[7:0]; // @[SRAM.scala 79:14]
  assign memWithWrOdd_clk0 = clock; // @[SRAM.scala 19:18]
  assign memWithWrOdd_csb0 = 1'h0; // @[SRAM.scala 21:18]
  assign memWithWrOdd_web0 = ~io_write_enaOdd; // @[SRAM.scala 86:16]
  assign memWithWrOdd_wmask0 = 4'hf; // @[SRAM.scala 85:23]
  assign memWithWrOdd_addr0 = io_write_addrOdd[7:0]; // @[SRAM.scala 87:14]
  assign memWithWrOdd_din0 = io_write_dataOdd; // @[SRAM.scala 88:13]
  assign memWithWrOdd_clk1 = clock; // @[SRAM.scala 20:18]
  assign memWithWrOdd_csb1 = 1'h0; // @[SRAM.scala 22:18]
  assign memWithWrOdd_addr1 = _T_11[7:0]; // @[SRAM.scala 79:14]
  always @(posedge clock) begin
    rdAddrEvenReg <= io_read_addrEven; // @[BootMemory.scala 37:40]
    rdAddrOddReg <= io_read_addrOdd; // @[BootMemory.scala 38:39]
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
  rdAddrEvenReg = _RAND_0[12:0];
  _RAND_1 = {1{`RANDOM}};
  rdAddrOddReg = _RAND_1[12:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Fetch(
  input         clock,
  input         reset,
  input         io_ena,
  output [31:0] io_fedec_instr_a,
  output [31:0] io_fedec_instr_b,
  output [29:0] io_fedec_pc,
  output [29:0] io_fedec_base,
  output [31:0] io_fedec_reloc,
  output [29:0] io_fedec_relPc,
  output [29:0] io_feex_pc,
  input         io_exfe_doBranch,
  input  [29:0] io_exfe_branchPc,
  input         io_memfe_doCallRet,
  input  [31:0] io_icachefe_base,
  input  [9:0]  io_icachefe_relBase,
  input  [10:0] io_icachefe_relPc,
  input  [31:0] io_icachefe_reloc,
  input  [1:0]  io_icachefe_memSel,
  input  [29:0] io_boot_pc_bootAddr,
  input         io_boot_bootMemWr_enaEven,
  input  [8:0]  io_boot_bootMemWr_addrEven,
  input  [31:0] io_boot_bootMemWr_dataEven,
  input         io_boot_bootMemWr_enaOdd,
  input  [8:0]  io_boot_bootMemWr_addrOdd,
  input  [31:0] io_boot_bootMemWr_dataOdd
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
`endif // RANDOMIZE_REG_INIT
  wire  bootMem_clock; // @[Fetch.scala 36:23]
  wire  bootMem_io_write_enaEven; // @[Fetch.scala 36:23]
  wire [8:0] bootMem_io_write_addrEven; // @[Fetch.scala 36:23]
  wire [31:0] bootMem_io_write_dataEven; // @[Fetch.scala 36:23]
  wire  bootMem_io_write_enaOdd; // @[Fetch.scala 36:23]
  wire [8:0] bootMem_io_write_addrOdd; // @[Fetch.scala 36:23]
  wire [31:0] bootMem_io_write_dataOdd; // @[Fetch.scala 36:23]
  wire [12:0] bootMem_io_read_addrEven; // @[Fetch.scala 36:23]
  wire [12:0] bootMem_io_read_addrOdd; // @[Fetch.scala 36:23]
  wire [31:0] bootMem_io_read_dataEven; // @[Fetch.scala 36:23]
  wire [31:0] bootMem_io_read_dataOdd; // @[Fetch.scala 36:23]
  reg [29:0] pcReg; // @[Fetch.scala 25:22]
  wire [29:0] _T_1 = io_boot_pc_bootAddr + 30'h1; // @[Fetch.scala 29:39]
  reg [29:0] addrEvenReg; // @[Fetch.scala 29:24]
  reg [29:0] addrOddReg; // @[Fetch.scala 30:23]
  reg  selSpm; // @[Fetch.scala 75:23]
  reg  selCache; // @[Fetch.scala 76:25]
  reg [31:0] baseReg; // @[Fetch.scala 89:24]
  reg [9:0] relBaseReg; // @[Fetch.scala 90:27]
  reg [31:0] relocReg; // @[Fetch.scala 91:25]
  wire [9:0] _GEN_2 = io_memfe_doCallRet ? io_icachefe_relBase : relBaseReg; // @[Fetch.scala 101:31 Fetch.scala 102:19 Fetch.scala 95:15]
  wire [31:0] _GEN_3 = io_memfe_doCallRet ? io_icachefe_reloc : relocReg; // @[Fetch.scala 101:31 Fetch.scala 103:17 Fetch.scala 97:13]
  wire  _T_5 = ~pcReg[0]; // @[Fetch.scala 118:34]
  wire [31:0] instr_a_rom = ~pcReg[0] ? bootMem_io_read_dataEven : bootMem_io_read_dataOdd; // @[Fetch.scala 118:24]
  wire [31:0] instr_b_rom = _T_5 ? bootMem_io_read_dataOdd : bootMem_io_read_dataEven; // @[Fetch.scala 119:24]
  wire [31:0] _T_12 = selCache ? 32'h0 : instr_a_rom; // @[Fetch.scala 127:24]
  wire [31:0] instr_a = selSpm ? 32'h0 : _T_12; // @[Fetch.scala 126:20]
  wire [31:0] _T_13 = selCache ? 32'h0 : instr_b_rom; // @[Fetch.scala 129:24]
  wire  b_valid = instr_a[31]; // @[Fetch.scala 131:24]
  wire [29:0] _T_16 = pcReg + 30'h2; // @[Fetch.scala 133:36]
  wire [29:0] _T_18 = pcReg + 30'h1; // @[Fetch.scala 133:53]
  wire [29:0] pc_cont = b_valid ? _T_16 : _T_18; // @[Fetch.scala 133:20]
  wire [29:0] _T_19 = io_exfe_doBranch ? io_exfe_branchPc : pc_cont; // @[Fetch.scala 136:16]
  wire [29:0] pc_next = io_memfe_doCallRet ? {{19'd0}, io_icachefe_relPc} : _T_19; // @[Fetch.scala 135:8]
  wire [29:0] _T_21 = pcReg + 30'h4; // @[Fetch.scala 139:37]
  wire [29:0] _T_23 = pcReg + 30'h3; // @[Fetch.scala 139:54]
  wire [29:0] pc_cont2 = b_valid ? _T_21 : _T_23; // @[Fetch.scala 139:21]
  wire [10:0] _T_25 = io_icachefe_relPc + 11'h2; // @[Fetch.scala 141:54]
  wire [29:0] _T_27 = io_exfe_branchPc + 30'h2; // @[Fetch.scala 142:48]
  wire [29:0] _T_28 = io_exfe_doBranch ? _T_27 : pc_cont2; // @[Fetch.scala 142:12]
  wire [29:0] pc_next2 = io_memfe_doCallRet ? {{19'd0}, _T_25} : _T_28; // @[Fetch.scala 141:8]
  wire [29:0] pc_inc = pc_next[0] ? pc_next2 : pc_next; // @[Fetch.scala 145:19]
  wire [28:0] hi = pc_inc[29:1]; // @[Fetch.scala 149:29]
  wire [29:0] _T_33 = {hi,1'h0}; // @[Cat.scala 30:58]
  wire [28:0] hi_1 = pc_next[29:1]; // @[Fetch.scala 150:29]
  wire [29:0] _T_34 = {hi_1,1'h1}; // @[Cat.scala 30:58]
  wire [29:0] addrEven = io_ena & ~reset ? _T_33 : addrEvenReg; // @[Fetch.scala 148:26 Fetch.scala 149:14 Fetch.scala 146:12]
  wire [29:0] addrOdd = io_ena & ~reset ? _T_34 : addrOddReg; // @[Fetch.scala 148:26 Fetch.scala 150:13 Fetch.scala 147:11]
  wire [29:0] pcNext = pc_next; // @[Fetch.scala 135:8]
  wire [29:0] _GEN_10 = {{20'd0}, relBaseReg}; // @[Fetch.scala 154:21]
  wire [29:0] relPc = pcReg - _GEN_10; // @[Fetch.scala 154:21]
  wire [29:0] _T_37 = relPc + 30'h2; // @[Fetch.scala 163:36]
  wire [29:0] _T_39 = relPc + 30'h1; // @[Fetch.scala 163:53]
  wire  selSpmNext = io_ena ? io_icachefe_memSel[1] : selSpm; // @[Fetch.scala 83:17 Fetch.scala 84:16 Fetch.scala 79:14]
  wire  selCacheNext = io_ena ? io_icachefe_memSel[0] : selCache; // @[Fetch.scala 83:17 Fetch.scala 85:18 Fetch.scala 81:16]
  wire [9:0] relBaseNext = io_ena ? _GEN_2 : relBaseReg; // @[Fetch.scala 99:16 Fetch.scala 95:15]
  wire [31:0] relocNext = io_ena ? _GEN_3 : relocReg; // @[Fetch.scala 99:16 Fetch.scala 97:13]
  BootMemory bootMem ( // @[Fetch.scala 36:23]
    .clock(bootMem_clock),
    .io_write_enaEven(bootMem_io_write_enaEven),
    .io_write_addrEven(bootMem_io_write_addrEven),
    .io_write_dataEven(bootMem_io_write_dataEven),
    .io_write_enaOdd(bootMem_io_write_enaOdd),
    .io_write_addrOdd(bootMem_io_write_addrOdd),
    .io_write_dataOdd(bootMem_io_write_dataOdd),
    .io_read_addrEven(bootMem_io_read_addrEven),
    .io_read_addrOdd(bootMem_io_read_addrOdd),
    .io_read_dataEven(bootMem_io_read_dataEven),
    .io_read_dataOdd(bootMem_io_read_dataOdd)
  );
  assign io_fedec_instr_a = selSpm ? 32'h0 : _T_12; // @[Fetch.scala 126:20]
  assign io_fedec_instr_b = selSpm ? 32'h0 : _T_13; // @[Fetch.scala 128:20]
  assign io_fedec_pc = pcReg; // @[Fetch.scala 156:15]
  assign io_fedec_base = baseReg[29:0]; // @[Fetch.scala 157:17]
  assign io_fedec_reloc = relocReg; // @[Fetch.scala 158:18]
  assign io_fedec_relPc = pcReg - _GEN_10; // @[Fetch.scala 154:21]
  assign io_feex_pc = b_valid ? _T_37 : _T_39; // @[Fetch.scala 163:20]
  assign bootMem_clock = clock;
  assign bootMem_io_write_enaEven = io_boot_bootMemWr_enaEven; // @[Fetch.scala 37:28]
  assign bootMem_io_write_addrEven = io_boot_bootMemWr_addrEven; // @[Fetch.scala 38:29]
  assign bootMem_io_write_dataEven = io_boot_bootMemWr_dataEven; // @[Fetch.scala 39:29]
  assign bootMem_io_write_enaOdd = io_boot_bootMemWr_enaOdd; // @[Fetch.scala 40:27]
  assign bootMem_io_write_addrOdd = io_boot_bootMemWr_addrOdd; // @[Fetch.scala 41:28]
  assign bootMem_io_write_dataOdd = io_boot_bootMemWr_dataOdd; // @[Fetch.scala 42:28]
  assign bootMem_io_read_addrEven = addrEven[12:0]; // @[Fetch.scala 113:28]
  assign bootMem_io_read_addrOdd = addrOdd[12:0]; // @[Fetch.scala 114:27]
  always @(posedge clock) begin
    if (reset) begin // @[Fetch.scala 25:22]
      pcReg <= io_boot_pc_bootAddr; // @[Fetch.scala 25:22]
    end else if (io_ena & ~reset) begin // @[Fetch.scala 148:26]
      pcReg <= pcNext; // @[Fetch.scala 151:11]
    end
    if (reset) begin // @[Fetch.scala 29:24]
      addrEvenReg <= _T_1; // @[Fetch.scala 29:24]
    end else if (io_ena & ~reset) begin // @[Fetch.scala 148:26]
      addrEvenReg <= _T_33; // @[Fetch.scala 149:14]
    end
    if (reset) begin // @[Fetch.scala 30:23]
      addrOddReg <= io_boot_pc_bootAddr; // @[Fetch.scala 30:23]
    end else if (io_ena & ~reset) begin // @[Fetch.scala 148:26]
      addrOddReg <= _T_34; // @[Fetch.scala 150:13]
    end
    if (reset) begin // @[Fetch.scala 75:23]
      selSpm <= 1'h0; // @[Fetch.scala 75:23]
    end else if (io_ena) begin // @[Fetch.scala 83:17]
      selSpm <= io_icachefe_memSel[1]; // @[Fetch.scala 84:16]
    end
    if (reset) begin // @[Fetch.scala 76:25]
      selCache <= 1'h0; // @[Fetch.scala 76:25]
    end else if (io_ena) begin // @[Fetch.scala 83:17]
      selCache <= io_icachefe_memSel[0]; // @[Fetch.scala 85:18]
    end
    if (reset) begin // @[Fetch.scala 89:24]
      baseReg <= 32'h0; // @[Fetch.scala 89:24]
    end else if (io_ena) begin // @[Fetch.scala 99:16]
      baseReg <= io_icachefe_base; // @[Fetch.scala 100:13]
    end
    if (reset) begin // @[Fetch.scala 90:27]
      relBaseReg <= 10'h1; // @[Fetch.scala 90:27]
    end else if (io_ena) begin // @[Fetch.scala 99:16]
      if (io_memfe_doCallRet) begin // @[Fetch.scala 101:31]
        relBaseReg <= io_icachefe_relBase; // @[Fetch.scala 102:19]
      end
    end
    if (reset) begin // @[Fetch.scala 91:25]
      relocReg <= 32'h0; // @[Fetch.scala 91:25]
    end else if (io_ena) begin // @[Fetch.scala 99:16]
      if (io_memfe_doCallRet) begin // @[Fetch.scala 101:31]
        relocReg <= io_icachefe_reloc; // @[Fetch.scala 103:17]
      end
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
  pcReg = _RAND_0[29:0];
  _RAND_1 = {1{`RANDOM}};
  addrEvenReg = _RAND_1[29:0];
  _RAND_2 = {1{`RANDOM}};
  addrOddReg = _RAND_2[29:0];
  _RAND_3 = {1{`RANDOM}};
  selSpm = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  selCache = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  baseReg = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  relBaseReg = _RAND_6[9:0];
  _RAND_7 = {1{`RANDOM}};
  relocReg = _RAND_7[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RegisterFile(
  input         clock,
  input         io_ena,
  input  [4:0]  io_rfRead_rsAddr_0,
  input  [4:0]  io_rfRead_rsAddr_1,
  output [31:0] io_rfRead_rsData_0,
  output [31:0] io_rfRead_rsData_1,
  input  [4:0]  io_rfWrite_0_addr,
  input  [31:0] io_rfWrite_0_data,
  input         io_rfWrite_0_valid
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] rf [0:31];
  wire [31:0] rf_MPORT_data;
  wire [4:0] rf_MPORT_addr;
  wire [31:0] rf_MPORT_1_data;
  wire [4:0] rf_MPORT_1_addr;
  wire [31:0] rf_MPORT_2_data;
  wire [4:0] rf_MPORT_2_addr;
  wire  rf_MPORT_2_mask;
  wire  rf_MPORT_2_en;
  reg [4:0] addrReg_0; // @[RegisterFile.scala 22:20]
  reg [4:0] addrReg_1; // @[RegisterFile.scala 22:20]
  reg [31:0] wrReg_0_data; // @[RegisterFile.scala 23:20]
  reg  fwReg_0_0; // @[RegisterFile.scala 24:20]
  reg  fwReg_1_0; // @[RegisterFile.scala 24:20]
  wire [31:0] _GEN_7 = fwReg_0_0 ? wrReg_0_data : rf_MPORT_data; // @[RegisterFile.scala 40:26 RegisterFile.scala 41:29 RegisterFile.scala 38:25]
  wire [31:0] _GEN_9 = fwReg_1_0 ? wrReg_0_data : rf_MPORT_1_data; // @[RegisterFile.scala 40:26 RegisterFile.scala 41:29 RegisterFile.scala 38:25]
  assign rf_MPORT_addr = addrReg_0;
  assign rf_MPORT_data = rf[rf_MPORT_addr];
  assign rf_MPORT_1_addr = addrReg_1;
  assign rf_MPORT_1_data = rf[rf_MPORT_1_addr];
  assign rf_MPORT_2_data = io_rfWrite_0_data;
  assign rf_MPORT_2_addr = io_rfWrite_0_addr;
  assign rf_MPORT_2_mask = 1'h1;
  assign rf_MPORT_2_en = io_rfWrite_0_valid;
  assign io_rfRead_rsData_0 = addrReg_0 == 5'h0 ? 32'h0 : _GEN_7; // @[RegisterFile.scala 44:34 RegisterFile.scala 45:27]
  assign io_rfRead_rsData_1 = addrReg_1 == 5'h0 ? 32'h0 : _GEN_9; // @[RegisterFile.scala 44:34 RegisterFile.scala 45:27]
  always @(posedge clock) begin
    if(rf_MPORT_2_en & rf_MPORT_2_mask) begin
      rf[rf_MPORT_2_addr] <= rf_MPORT_2_data;
    end
    if (io_ena) begin // @[RegisterFile.scala 26:17]
      addrReg_0 <= io_rfRead_rsAddr_0; // @[RegisterFile.scala 27:13]
    end
    if (io_ena) begin // @[RegisterFile.scala 26:17]
      addrReg_1 <= io_rfRead_rsAddr_1; // @[RegisterFile.scala 27:13]
    end
    if (io_ena) begin // @[RegisterFile.scala 26:17]
      wrReg_0_data <= io_rfWrite_0_data; // @[RegisterFile.scala 28:11]
    end
    if (io_ena) begin // @[RegisterFile.scala 26:17]
      fwReg_0_0 <= io_rfRead_rsAddr_0 == io_rfWrite_0_addr & io_rfWrite_0_valid; // @[RegisterFile.scala 31:21]
    end
    if (io_ena) begin // @[RegisterFile.scala 26:17]
      fwReg_1_0 <= io_rfRead_rsAddr_1 == io_rfWrite_0_addr & io_rfWrite_0_valid; // @[RegisterFile.scala 31:21]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    rf[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  addrReg_0 = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  addrReg_1 = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  wrReg_0_data = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  fwReg_0_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  fwReg_1_0 = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Decode(
  input         clock,
  input         reset,
  input         io_ena,
  input         io_flush,
  input  [31:0] io_fedec_instr_a,
  input  [31:0] io_fedec_instr_b,
  input  [29:0] io_fedec_pc,
  input  [29:0] io_fedec_base,
  input  [31:0] io_fedec_reloc,
  input  [29:0] io_fedec_relPc,
  output [29:0] io_decex_base,
  output [29:0] io_decex_relPc,
  output [3:0]  io_decex_pred_0,
  output [3:0]  io_decex_aluOp_0_func,
  output        io_decex_aluOp_0_isMul,
  output        io_decex_aluOp_0_isCmp,
  output        io_decex_aluOp_0_isPred,
  output        io_decex_aluOp_0_isBCpy,
  output        io_decex_aluOp_0_isMTS,
  output        io_decex_aluOp_0_isMFS,
  output [1:0]  io_decex_predOp_0_func,
  output [2:0]  io_decex_predOp_0_dest,
  output [3:0]  io_decex_predOp_0_s1Addr,
  output [3:0]  io_decex_predOp_0_s2Addr,
  output        io_decex_jmpOp_branch,
  output [29:0] io_decex_jmpOp_target,
  output [31:0] io_decex_jmpOp_reloc,
  output        io_decex_memOp_load,
  output        io_decex_memOp_store,
  output        io_decex_memOp_hword,
  output        io_decex_memOp_byte,
  output        io_decex_memOp_zext,
  output [1:0]  io_decex_memOp_typ,
  output [2:0]  io_decex_stackOp,
  output [4:0]  io_decex_rsAddr_0,
  output [4:0]  io_decex_rsAddr_1,
  output [31:0] io_decex_rsData_0,
  output [31:0] io_decex_rsData_1,
  output [4:0]  io_decex_rdAddr_0,
  output [31:0] io_decex_immVal_0,
  output        io_decex_immOp_0,
  output        io_decex_wrRd_0,
  output [31:0] io_decex_callAddr,
  output        io_decex_call,
  output        io_decex_ret,
  output        io_decex_brcf,
  output        io_decex_trap,
  output        io_decex_xcall,
  output        io_decex_xret,
  output [4:0]  io_decex_xsrc,
  output        io_decex_nonDelayed,
  output        io_decex_illOp,
  input  [4:0]  io_rfWrite_0_addr,
  input  [31:0] io_rfWrite_0_data,
  input         io_rfWrite_0_valid,
  input         io_exc_exc,
  input  [29:0] io_exc_excBase,
  input  [29:0] io_exc_excAddr,
  input         io_exc_intr,
  input  [31:0] io_exc_addr,
  input  [4:0]  io_exc_src,
  input         io_exc_local
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  rf_clock; // @[Decode.scala 19:18]
  wire  rf_io_ena; // @[Decode.scala 19:18]
  wire [4:0] rf_io_rfRead_rsAddr_0; // @[Decode.scala 19:18]
  wire [4:0] rf_io_rfRead_rsAddr_1; // @[Decode.scala 19:18]
  wire [31:0] rf_io_rfRead_rsData_0; // @[Decode.scala 19:18]
  wire [31:0] rf_io_rfRead_rsData_1; // @[Decode.scala 19:18]
  wire [4:0] rf_io_rfWrite_0_addr; // @[Decode.scala 19:18]
  wire [31:0] rf_io_rfWrite_0_data; // @[Decode.scala 19:18]
  wire  rf_io_rfWrite_0_valid; // @[Decode.scala 19:18]
  reg [31:0] decReg_instr_a; // @[Decode.scala 32:19]
  reg [31:0] decReg_instr_b; // @[Decode.scala 32:19]
  reg [29:0] decReg_pc; // @[Decode.scala 32:19]
  reg [29:0] decReg_base; // @[Decode.scala 32:19]
  reg [31:0] decReg_reloc; // @[Decode.scala 32:19]
  reg [29:0] decReg_relPc; // @[Decode.scala 32:19]
  wire [11:0] lo = decReg_instr_a[11:0]; // @[Decode.scala 72:33]
  wire [12:0] _T_10 = {1'h0,lo}; // @[Cat.scala 30:58]
  wire  _T_13 = decReg_instr_a[26:25] == 2'h0; // @[Decode.scala 78:23]
  wire [2:0] lo_1 = decReg_instr_a[24:22]; // @[Decode.scala 79:51]
  wire [3:0] _T_14 = {1'h0,lo_1}; // @[Cat.scala 30:58]
  wire [3:0] _GEN_9 = decReg_instr_a[26:25] == 2'h0 ? _T_14 : decReg_instr_a[3:0]; // @[Decode.scala 78:40 Decode.scala 79:30 Decode.scala 75:28]
  wire  _T_16 = 3'h0 == decReg_instr_a[6:4]; // @[Conditional.scala 37:30]
  wire  _T_17 = 3'h1 == decReg_instr_a[6:4]; // @[Conditional.scala 37:30]
  wire  _T_18 = 3'h2 == decReg_instr_a[6:4]; // @[Conditional.scala 37:30]
  wire  _T_19 = 3'h3 == decReg_instr_a[6:4]; // @[Conditional.scala 37:30]
  wire  _T_20 = 3'h6 == decReg_instr_a[6:4]; // @[Conditional.scala 37:30]
  wire [5:0] _T_21 = {1'h0,decReg_instr_a[11:7]}; // @[Cat.scala 30:58]
  wire  _T_22 = 3'h4 == decReg_instr_a[6:4]; // @[Conditional.scala 37:30]
  wire  _T_23 = 3'h5 == decReg_instr_a[6:4]; // @[Conditional.scala 37:30]
  wire  _GEN_13 = _T_23 | _T_13; // @[Conditional.scala 39:67 Decode.scala 114:28]
  wire [12:0] _GEN_16 = _T_23 ? {{7'd0}, _T_21} : _T_10; // @[Conditional.scala 39:67 Decode.scala 117:18 Decode.scala 72:12]
  wire  _GEN_19 = _T_22 | _GEN_13; // @[Conditional.scala 39:67 Decode.scala 111:22]
  wire  _GEN_20 = _T_22 ? _T_13 : _GEN_13; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_22 ? 1'h0 : _T_23; // @[Conditional.scala 39:67 connections.scala 50:12]
  wire [12:0] _GEN_23 = _T_22 ? _T_10 : _GEN_16; // @[Conditional.scala 39:67 Decode.scala 72:12]
  wire  _GEN_25 = _T_20 | _GEN_20; // @[Conditional.scala 39:67 Decode.scala 105:29]
  wire [12:0] _GEN_26 = _T_20 ? {{7'd0}, _T_21} : _GEN_23; // @[Conditional.scala 39:67 Decode.scala 106:18]
  wire  _GEN_27 = _T_20 | _GEN_19; // @[Conditional.scala 39:67 Decode.scala 107:22]
  wire  _GEN_28 = _T_20 ? 1'h0 : _T_22; // @[Conditional.scala 39:67 connections.scala 49:12]
  wire  _GEN_29 = _T_20 ? _T_13 : _GEN_20; // @[Conditional.scala 39:67]
  wire  _GEN_30 = _T_20 ? 1'h0 : _GEN_21; // @[Conditional.scala 39:67 connections.scala 50:12]
  wire  _GEN_31 = _T_19 | _T_20; // @[Conditional.scala 39:67 Decode.scala 100:35]
  wire  _GEN_32 = _T_19 | _GEN_27; // @[Conditional.scala 39:67 Decode.scala 101:22]
  wire  _GEN_33 = _T_19 ? _T_13 : _GEN_25; // @[Conditional.scala 39:67]
  wire [12:0] _GEN_34 = _T_19 ? _T_10 : _GEN_26; // @[Conditional.scala 39:67 Decode.scala 72:12]
  wire  _GEN_35 = _T_19 ? 1'h0 : _GEN_28; // @[Conditional.scala 39:67 connections.scala 49:12]
  wire  _GEN_36 = _T_19 ? _T_13 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_19 ? 1'h0 : _GEN_30; // @[Conditional.scala 39:67 connections.scala 50:12]
  wire  _GEN_39 = _T_18 | _GEN_32; // @[Conditional.scala 39:67 Decode.scala 97:22]
  wire  _GEN_40 = _T_18 ? 1'h0 : _GEN_31; // @[Conditional.scala 39:67 connections.scala 48:11]
  wire  _GEN_41 = _T_18 ? _T_13 : _GEN_33; // @[Conditional.scala 39:67]
  wire [12:0] _GEN_42 = _T_18 ? _T_10 : _GEN_34; // @[Conditional.scala 39:67 Decode.scala 72:12]
  wire  _GEN_43 = _T_18 ? 1'h0 : _GEN_35; // @[Conditional.scala 39:67 connections.scala 49:12]
  wire  _GEN_44 = _T_18 ? _T_13 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_18 ? 1'h0 : _GEN_37; // @[Conditional.scala 39:67 connections.scala 50:12]
  wire  _GEN_46 = _T_17 | _GEN_44; // @[Conditional.scala 39:67 Decode.scala 92:28]
  wire  _GEN_47 = _T_17 | _GEN_39; // @[Conditional.scala 39:67 Decode.scala 93:22]
  wire  _GEN_48 = _T_17 ? 1'h0 : _T_18; // @[Conditional.scala 39:67 connections.scala 47:11]
  wire  _GEN_49 = _T_17 ? 1'h0 : _GEN_40; // @[Conditional.scala 39:67 connections.scala 48:11]
  wire  _GEN_50 = _T_17 ? _T_13 : _GEN_41; // @[Conditional.scala 39:67]
  wire [12:0] _GEN_51 = _T_17 ? _T_10 : _GEN_42; // @[Conditional.scala 39:67 Decode.scala 72:12]
  wire  _GEN_52 = _T_17 ? 1'h0 : _GEN_43; // @[Conditional.scala 39:67 connections.scala 49:12]
  wire  _GEN_53 = _T_17 ? 1'h0 : _GEN_45; // @[Conditional.scala 39:67 connections.scala 50:12]
  wire  _GEN_54 = _T_16 | _GEN_46; // @[Conditional.scala 40:58 Decode.scala 88:28]
  wire  _GEN_55 = _T_16 | _GEN_47; // @[Conditional.scala 40:58 Decode.scala 89:22]
  wire  _GEN_56 = _T_16 ? 1'h0 : _GEN_48; // @[Conditional.scala 40:58 connections.scala 47:11]
  wire  _GEN_57 = _T_16 ? 1'h0 : _GEN_49; // @[Conditional.scala 40:58 connections.scala 48:11]
  wire  _GEN_58 = _T_16 ? _T_13 : _GEN_50; // @[Conditional.scala 40:58]
  wire [12:0] _GEN_59 = _T_16 ? _T_10 : _GEN_51; // @[Conditional.scala 40:58 Decode.scala 72:12]
  wire  _GEN_60 = _T_16 ? 1'h0 : _GEN_52; // @[Conditional.scala 40:58 connections.scala 49:12]
  wire  _GEN_61 = _T_16 ? 1'h0 : _GEN_53; // @[Conditional.scala 40:58 connections.scala 50:12]
  wire  _GEN_62 = decReg_instr_a[26:22] == 5'h8 ? _GEN_54 : _T_13; // @[Decode.scala 85:33]
  wire  _GEN_63 = decReg_instr_a[26:22] == 5'h8 ? _GEN_55 : _T_13; // @[Decode.scala 85:33]
  wire  _GEN_64 = decReg_instr_a[26:22] == 5'h8 & _GEN_56; // @[Decode.scala 85:33 connections.scala 47:11]
  wire  _GEN_65 = decReg_instr_a[26:22] == 5'h8 & _GEN_57; // @[Decode.scala 85:33 connections.scala 48:11]
  wire  _GEN_66 = decReg_instr_a[26:22] == 5'h8 ? _GEN_58 : _T_13; // @[Decode.scala 85:33]
  wire [12:0] _GEN_67 = decReg_instr_a[26:22] == 5'h8 ? _GEN_59 : _T_10; // @[Decode.scala 85:33 Decode.scala 72:12]
  wire  _GEN_68 = decReg_instr_a[26:22] == 5'h8 & _GEN_60; // @[Decode.scala 85:33 connections.scala 49:12]
  wire  _GEN_69 = decReg_instr_a[26:22] == 5'h8 & _GEN_61; // @[Decode.scala 85:33 connections.scala 50:12]
  wire  _GEN_71 = _T_19 | _GEN_62; // @[Conditional.scala 39:67 Decode.scala 131:28]
  wire  _GEN_72 = _T_19 | _GEN_63; // @[Conditional.scala 39:67 Decode.scala 132:22]
  wire  _GEN_74 = _T_18 | _GEN_72; // @[Conditional.scala 40:58 Decode.scala 127:22]
  wire  _GEN_75 = _T_18 ? 1'h0 : _T_19; // @[Conditional.scala 40:58 connections.scala 52:11]
  wire  _GEN_76 = _T_18 ? _GEN_62 : _GEN_71; // @[Conditional.scala 40:58]
  wire  _GEN_77 = decReg_instr_a[26:22] == 5'h9 & _T_18; // @[Decode.scala 123:33 connections.scala 51:11]
  wire  _GEN_78 = decReg_instr_a[26:22] == 5'h9 ? _GEN_74 : _GEN_63; // @[Decode.scala 123:33]
  wire  _GEN_79 = decReg_instr_a[26:22] == 5'h9 & _GEN_75; // @[Decode.scala 123:33 connections.scala 52:11]
  wire  _GEN_80 = decReg_instr_a[26:22] == 5'h9 ? _GEN_76 : _GEN_62; // @[Decode.scala 123:33]
  wire  hi = decReg_instr_a[3]; // @[Decode.scala 141:41]
  wire  lo_4 = decReg_instr_a[0]; // @[Decode.scala 141:51]
  wire [1:0] _T_28 = {hi,lo_4}; // @[Cat.scala 30:58]
  wire [2:0] ldsize = decReg_instr_a[11:9]; // @[Decode.scala 156:21]
  wire [1:0] ldtype = decReg_instr_a[8:7]; // @[Decode.scala 157:21]
  wire [2:0] stsize = decReg_instr_a[21:19]; // @[Decode.scala 158:21]
  wire [1:0] sttype = decReg_instr_a[18:17]; // @[Decode.scala 159:21]
  wire [3:0] stcfun = decReg_instr_a[21:18]; // @[Decode.scala 160:21]
  wire [17:0] hi_lo = decReg_instr_a[17:0]; // @[Decode.scala 169:34]
  wire [20:0] stcImm = {1'h0,hi_lo,2'h0}; // @[Cat.scala 30:58]
  wire  longImm = decReg_instr_a[26:22] == 5'h1f & decReg_instr_a[6:4] == 3'h0; // @[Decode.scala 183:31]
  wire [3:0] _GEN_81 = longImm ? decReg_instr_a[3:0] : _GEN_9; // @[Decode.scala 183:59 Decode.scala 184:28]
  wire  _GEN_82 = longImm | _GEN_66; // @[Decode.scala 183:59 Decode.scala 185:23]
  wire  _GEN_84 = longImm | _GEN_80; // @[Decode.scala 183:59 Decode.scala 187:22]
  wire  _GEN_85 = longImm | _GEN_78; // @[Decode.scala 183:59 Decode.scala 188:16]
  wire  _T_40 = 4'h0 == stcfun; // @[Conditional.scala 37:30]
  wire  _T_41 = 4'h4 == stcfun; // @[Conditional.scala 37:30]
  wire  _T_42 = 4'h5 == stcfun; // @[Conditional.scala 37:30]
  wire  _T_43 = 4'h8 == stcfun; // @[Conditional.scala 37:30]
  wire  _T_44 = 4'hc == stcfun; // @[Conditional.scala 37:30]
  wire  _T_45 = 4'hd == stcfun; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_87 = _T_45 ? 3'h6 : 3'h0; // @[Conditional.scala 39:67 Decode.scala 224:26 connections.scala 164:13]
  wire  _GEN_88 = _T_45 | _GEN_85; // @[Conditional.scala 39:67 Decode.scala 225:20]
  wire  _GEN_89 = _T_44 | _T_45; // @[Conditional.scala 39:67 Decode.scala 217:15]
  wire [2:0] _GEN_90 = _T_44 ? 3'h6 : _GEN_87; // @[Conditional.scala 39:67 Decode.scala 218:26]
  wire  _GEN_91 = _T_44 | _GEN_82; // @[Conditional.scala 39:67 Decode.scala 219:27]
  wire  _GEN_92 = _T_44 | _GEN_88; // @[Conditional.scala 39:67 Decode.scala 220:20]
  wire  _GEN_93 = _T_43 | _GEN_89; // @[Conditional.scala 39:67 Decode.scala 211:15]
  wire [2:0] _GEN_94 = _T_43 ? 3'h5 : _GEN_90; // @[Conditional.scala 39:67 Decode.scala 212:26]
  wire  _GEN_95 = _T_43 | _GEN_91; // @[Conditional.scala 39:67 Decode.scala 213:27]
  wire  _GEN_96 = _T_43 | _GEN_92; // @[Conditional.scala 39:67 Decode.scala 214:20]
  wire  _GEN_97 = _T_42 | _GEN_93; // @[Conditional.scala 39:67 Decode.scala 206:15]
  wire [2:0] _GEN_98 = _T_42 ? 3'h4 : _GEN_94; // @[Conditional.scala 39:67 Decode.scala 207:26]
  wire  _GEN_99 = _T_42 | _GEN_96; // @[Conditional.scala 39:67 Decode.scala 208:20]
  wire  _GEN_100 = _T_42 ? _GEN_82 : _GEN_95; // @[Conditional.scala 39:67]
  wire  _GEN_101 = _T_41 | _GEN_97; // @[Conditional.scala 39:67 Decode.scala 200:15]
  wire [2:0] _GEN_102 = _T_41 ? 3'h4 : _GEN_98; // @[Conditional.scala 39:67 Decode.scala 201:26]
  wire  _GEN_103 = _T_41 | _GEN_100; // @[Conditional.scala 39:67 Decode.scala 202:27]
  wire  _GEN_104 = _T_41 | _GEN_99; // @[Conditional.scala 39:67 Decode.scala 203:20]
  wire  _GEN_105 = _T_40 | _GEN_101; // @[Conditional.scala 40:58 Decode.scala 194:15]
  wire [2:0] _GEN_106 = _T_40 ? 3'h3 : _GEN_102; // @[Conditional.scala 40:58 Decode.scala 195:26]
  wire  _GEN_107 = _T_40 | _GEN_103; // @[Conditional.scala 40:58 Decode.scala 196:27]
  wire  _GEN_108 = _T_40 | _GEN_104; // @[Conditional.scala 40:58 Decode.scala 197:20]
  wire  isSTC = decReg_instr_a[26:22] == 5'hc & _GEN_105; // @[Decode.scala 191:31 Decode.scala 177:9]
  wire [2:0] _GEN_110 = decReg_instr_a[26:22] == 5'hc ? _GEN_106 : 3'h0; // @[Decode.scala 191:31 connections.scala 164:13]
  wire  _GEN_111 = decReg_instr_a[26:22] == 5'hc ? _GEN_107 : _GEN_82; // @[Decode.scala 191:31]
  wire  _GEN_112 = decReg_instr_a[26:22] == 5'hc ? _GEN_108 : _GEN_85; // @[Decode.scala 191:31]
  wire  _T_46 = decReg_instr_a[26:22] == 5'h16; // @[Decode.scala 231:15]
  wire [4:0] _GEN_114 = decReg_instr_a[26:22] == 5'h16 ? decReg_instr_a[4:0] : 5'h0; // @[Decode.scala 231:36 Decode.scala 233:19 connections.scala 179:10]
  wire  _GEN_115 = decReg_instr_a[26:22] == 5'h16 | _GEN_112; // @[Decode.scala 231:36 Decode.scala 234:16]
  wire  _T_50 = decReg_instr_a[26:22] == 5'h11 | decReg_instr_a[26:22] == 5'h10; // @[Decode.scala 236:35]
  wire  _GEN_116 = decReg_instr_a[26:22] == 5'h11 | decReg_instr_a[26:22] == 5'h10 | _GEN_111; // @[Decode.scala 236:68 Decode.scala 237:23]
  wire  _GEN_118 = (decReg_instr_a[26:22] == 5'h11 | decReg_instr_a[26:22] == 5'h10) & decReg_instr_a[26:22] == 5'h10; // @[Decode.scala 236:68 Decode.scala 239:25 connections.scala 180:16]
  wire  _GEN_119 = decReg_instr_a[26:22] == 5'h11 | decReg_instr_a[26:22] == 5'h10 | _GEN_115; // @[Decode.scala 236:68 Decode.scala 240:16]
  wire  _T_54 = decReg_instr_a[26:22] == 5'h13 | decReg_instr_a[26:22] == 5'h12; // @[Decode.scala 242:33]
  wire  _GEN_120 = decReg_instr_a[26:22] == 5'h13 | decReg_instr_a[26:22] == 5'h12 | _GEN_116; // @[Decode.scala 242:64 Decode.scala 243:23]
  wire  _GEN_122 = decReg_instr_a[26:22] == 5'h13 | decReg_instr_a[26:22] == 5'h12 ? decReg_instr_a[26:22] == 5'h12 :
    _GEN_118; // @[Decode.scala 242:64 Decode.scala 245:25]
  wire  _GEN_123 = decReg_instr_a[26:22] == 5'h13 | decReg_instr_a[26:22] == 5'h12 | _GEN_119; // @[Decode.scala 242:64 Decode.scala 246:16]
  wire  _T_58 = decReg_instr_a[26:22] == 5'h15 | decReg_instr_a[26:22] == 5'h14; // @[Decode.scala 248:35]
  wire  _GEN_124 = decReg_instr_a[26:22] == 5'h15 | decReg_instr_a[26:22] == 5'h14 | _GEN_120; // @[Decode.scala 248:68 Decode.scala 249:23]
  wire  _GEN_126 = decReg_instr_a[26:22] == 5'h15 | decReg_instr_a[26:22] == 5'h14 ? decReg_instr_a[26:22] == 5'h14 :
    _GEN_122; // @[Decode.scala 248:68 Decode.scala 251:25]
  wire  _GEN_127 = decReg_instr_a[26:22] == 5'h15 | decReg_instr_a[26:22] == 5'h14 | _GEN_123; // @[Decode.scala 248:68 Decode.scala 252:16]
  wire  _T_63 = 4'h0 == decReg_instr_a[3:0]; // @[Conditional.scala 37:30]
  wire  _T_64 = 4'h1 == decReg_instr_a[3:0]; // @[Conditional.scala 37:30]
  wire  _T_65 = 4'h4 == decReg_instr_a[3:0]; // @[Conditional.scala 37:30]
  wire  _T_66 = 4'h5 == decReg_instr_a[3:0]; // @[Conditional.scala 37:30]
  wire  _T_67 = 4'ha == decReg_instr_a[3:0]; // @[Conditional.scala 37:30]
  wire  _GEN_128 = _T_67 | _T_58; // @[Conditional.scala 39:67 Decode.scala 273:23]
  wire  _GEN_129 = _T_67 | _GEN_127; // @[Conditional.scala 39:67 Decode.scala 274:20]
  wire  _GEN_130 = _T_66 | _T_54; // @[Conditional.scala 39:67 Decode.scala 269:31]
  wire  _GEN_131 = _T_66 | _GEN_129; // @[Conditional.scala 39:67 Decode.scala 270:20]
  wire  _GEN_132 = _T_66 ? _T_58 : _GEN_128; // @[Conditional.scala 39:67]
  wire  _GEN_133 = _T_65 | _T_50; // @[Conditional.scala 39:67 Decode.scala 265:23]
  wire  _GEN_134 = _T_65 | _GEN_131; // @[Conditional.scala 39:67 Decode.scala 266:20]
  wire  _GEN_135 = _T_65 ? _T_54 : _GEN_130; // @[Conditional.scala 39:67]
  wire  _GEN_136 = _T_65 ? _T_58 : _GEN_132; // @[Conditional.scala 39:67]
  wire  _GEN_138 = _T_64 | _GEN_134; // @[Conditional.scala 39:67 Decode.scala 262:20]
  wire  _GEN_139 = _T_64 ? _T_50 : _GEN_133; // @[Conditional.scala 39:67]
  wire  _GEN_140 = _T_64 ? _T_54 : _GEN_135; // @[Conditional.scala 39:67]
  wire  _GEN_141 = _T_64 ? _T_58 : _GEN_136; // @[Conditional.scala 39:67]
  wire  _GEN_143 = _T_63 | _GEN_138; // @[Conditional.scala 40:58 Decode.scala 258:20]
  wire  _GEN_144 = _T_63 ? 1'h0 : _T_64; // @[Conditional.scala 40:58 connections.scala 178:10]
  wire  _GEN_145 = _T_63 ? _T_50 : _GEN_139; // @[Conditional.scala 40:58]
  wire  _GEN_146 = _T_63 ? _T_54 : _GEN_140; // @[Conditional.scala 40:58]
  wire  _GEN_147 = _T_63 ? _T_58 : _GEN_141; // @[Conditional.scala 40:58]
  wire  _GEN_148 = (decReg_instr_a[26:22] == 5'h19 | decReg_instr_a[26:22] == 5'h18) & _T_63; // @[Decode.scala 254:68 connections.scala 174:9]
  wire  _GEN_149 = decReg_instr_a[26:22] == 5'h19 | decReg_instr_a[26:22] == 5'h18 ? _GEN_143 : _GEN_127; // @[Decode.scala 254:68]
  wire  _GEN_150 = (decReg_instr_a[26:22] == 5'h19 | decReg_instr_a[26:22] == 5'h18) & _GEN_144; // @[Decode.scala 254:68 connections.scala 178:10]
  wire  _GEN_151 = decReg_instr_a[26:22] == 5'h19 | decReg_instr_a[26:22] == 5'h18 ? _GEN_145 : _T_50; // @[Decode.scala 254:68]
  wire  _GEN_152 = decReg_instr_a[26:22] == 5'h19 | decReg_instr_a[26:22] == 5'h18 ? _GEN_146 : _T_54; // @[Decode.scala 254:68]
  wire  _GEN_153 = decReg_instr_a[26:22] == 5'h19 | decReg_instr_a[26:22] == 5'h18 ? _GEN_147 : _T_58; // @[Decode.scala 254:68]
  wire  _GEN_154 = decReg_instr_a[26:22] == 5'h19 | decReg_instr_a[26:22] == 5'h18 ? decReg_instr_a[26:22] == 5'h18 :
    _GEN_126; // @[Decode.scala 254:68 Decode.scala 277:25]
  wire  _T_69 = decReg_instr_a[26:22] == 5'ha; // @[Decode.scala 283:15]
  wire  _T_70 = 3'h0 == ldsize; // @[Conditional.scala 37:30]
  wire  _T_71 = 3'h1 == ldsize; // @[Conditional.scala 37:30]
  wire  _T_72 = 3'h2 == ldsize; // @[Conditional.scala 37:30]
  wire  _T_73 = 3'h3 == ldsize; // @[Conditional.scala 37:30]
  wire  _T_74 = 3'h4 == ldsize; // @[Conditional.scala 37:30]
  wire  _GEN_157 = _T_73 | _T_74; // @[Conditional.scala 39:67 Decode.scala 301:29]
  wire  _GEN_158 = _T_73 ? 1'h0 : _T_74; // @[Conditional.scala 39:67 connections.scala 94:10]
  wire  _GEN_159 = _T_72 | _GEN_158; // @[Conditional.scala 39:67 Decode.scala 296:29]
  wire  _GEN_160 = _T_72 ? 1'h0 : _T_73; // @[Conditional.scala 39:67 Decode.scala 281:9]
  wire  _GEN_161 = _T_72 ? 1'h0 : _GEN_157; // @[Conditional.scala 39:67 connections.scala 95:10]
  wire  _GEN_162 = _T_71 | _GEN_160; // @[Conditional.scala 39:67 Decode.scala 292:15]
  wire  _GEN_163 = _T_71 ? 1'h0 : _GEN_159; // @[Conditional.scala 39:67 connections.scala 94:10]
  wire  _GEN_164 = _T_71 ? 1'h0 : _GEN_161; // @[Conditional.scala 39:67 connections.scala 95:10]
  wire [1:0] _GEN_165 = _T_70 ? 2'h2 : {{1'd0}, _GEN_162}; // @[Conditional.scala 40:58 Decode.scala 289:15]
  wire  _GEN_166 = _T_70 ? 1'h0 : _GEN_162; // @[Conditional.scala 40:58 connections.scala 93:11]
  wire  _GEN_167 = _T_70 ? 1'h0 : _GEN_163; // @[Conditional.scala 40:58 connections.scala 94:10]
  wire  _GEN_168 = _T_70 ? 1'h0 : _GEN_164; // @[Conditional.scala 40:58 connections.scala 95:10]
  wire [1:0] _GEN_169 = ldtype == 2'h2 & io_exc_local ? 2'h1 : ldtype; // @[Decode.scala 309:46 Decode.scala 310:26 Decode.scala 308:24]
  wire  _T_77 = ldtype == 2'h0; // @[Decode.scala 312:17]
  wire  _GEN_172 = decReg_instr_a[26:22] == 5'ha | _GEN_84; // @[Decode.scala 283:31 Decode.scala 286:22]
  wire [1:0] _GEN_173 = decReg_instr_a[26:22] == 5'ha ? _GEN_165 : 2'h0; // @[Decode.scala 283:31 Decode.scala 281:9]
  wire  _GEN_174 = decReg_instr_a[26:22] == 5'ha & _GEN_166; // @[Decode.scala 283:31 connections.scala 93:11]
  wire  _GEN_175 = decReg_instr_a[26:22] == 5'ha & _GEN_167; // @[Decode.scala 283:31 connections.scala 94:10]
  wire  _GEN_176 = decReg_instr_a[26:22] == 5'ha & _GEN_168; // @[Decode.scala 283:31 connections.scala 95:10]
  wire [1:0] _GEN_177 = decReg_instr_a[26:22] == 5'ha ? _GEN_169 : 2'h0; // @[Decode.scala 283:31 connections.scala 96:9]
  wire  _GEN_178 = decReg_instr_a[26:22] == 5'ha & _T_77; // @[Decode.scala 283:31 Decode.scala 176:11]
  wire  _GEN_179 = decReg_instr_a[26:22] == 5'ha | _GEN_149; // @[Decode.scala 283:31 Decode.scala 315:16]
  wire  _T_78 = decReg_instr_a[26:22] == 5'hb; // @[Decode.scala 318:15]
  wire  _T_79 = 3'h0 == stsize; // @[Conditional.scala 37:30]
  wire  _T_80 = 3'h1 == stsize; // @[Conditional.scala 37:30]
  wire  _T_81 = 3'h2 == stsize; // @[Conditional.scala 37:30]
  wire  _GEN_180 = _T_81 | _GEN_175; // @[Conditional.scala 39:67 Decode.scala 330:29]
  wire [1:0] _GEN_181 = _T_80 ? 2'h1 : _GEN_173; // @[Conditional.scala 39:67 Decode.scala 326:15]
  wire  _GEN_182 = _T_80 | _GEN_174; // @[Conditional.scala 39:67 Decode.scala 327:30]
  wire  _GEN_183 = _T_80 ? _GEN_175 : _GEN_180; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_184 = _T_79 ? 2'h2 : _GEN_181; // @[Conditional.scala 40:58 Decode.scala 323:15]
  wire  _GEN_185 = _T_79 ? _GEN_174 : _GEN_182; // @[Conditional.scala 40:58]
  wire  _GEN_186 = _T_79 ? _GEN_175 : _GEN_183; // @[Conditional.scala 40:58]
  wire [1:0] _GEN_187 = sttype == 2'h2 & io_exc_local ? 2'h1 : sttype; // @[Decode.scala 334:46 Decode.scala 335:26 Decode.scala 333:24]
  wire  _GEN_188 = sttype == 2'h0 | _GEN_178; // @[Decode.scala 337:30 Decode.scala 338:15]
  wire  isMem = decReg_instr_a[26:22] == 5'hb | _T_69; // @[Decode.scala 318:31 Decode.scala 319:11]
  wire [1:0] shamt = decReg_instr_a[26:22] == 5'hb ? _GEN_184 : _GEN_173; // @[Decode.scala 318:31]
  wire  _GEN_192 = decReg_instr_a[26:22] == 5'hb ? _GEN_185 : _GEN_174; // @[Decode.scala 318:31]
  wire  _GEN_193 = decReg_instr_a[26:22] == 5'hb ? _GEN_186 : _GEN_175; // @[Decode.scala 318:31]
  wire [1:0] _GEN_194 = decReg_instr_a[26:22] == 5'hb ? _GEN_187 : _GEN_177; // @[Decode.scala 318:31]
  wire  isStack = decReg_instr_a[26:22] == 5'hb ? _GEN_188 : _GEN_178; // @[Decode.scala 318:31]
  wire  decoded_0 = decReg_instr_a[26:22] == 5'hb | _GEN_179; // @[Decode.scala 318:31 Decode.scala 340:16]
  wire [6:0] lo_5 = decReg_instr_a[6:0]; // @[Decode.scala 384:32]
  wire [7:0] _T_85 = {1'h0,lo_5}; // @[Cat.scala 30:58]
  wire  _T_86 = 2'h1 == shamt; // @[Conditional.scala 37:30]
  wire [8:0] _T_87 = {1'h0,lo_5,1'h0}; // @[Cat.scala 30:58]
  wire  _T_88 = 2'h2 == shamt; // @[Conditional.scala 37:30]
  wire [9:0] _T_89 = {1'h0,lo_5,2'h0}; // @[Cat.scala 30:58]
  wire [9:0] _GEN_197 = _T_88 ? _T_89 : {{2'd0}, _T_85}; // @[Conditional.scala 39:67 Decode.scala 387:27 Decode.scala 384:11]
  wire [9:0] addrImm = _T_86 ? {{1'd0}, _T_87} : _GEN_197; // @[Conditional.scala 40:58 Decode.scala 386:27]
  wire [31:0] _T_93 = isMem ? {{22'd0}, addrImm} : decReg_instr_b; // @[Decode.scala 394:38]
  wire [31:0] _T_94 = isStack ? {{22'd0}, addrImm} : _T_93; // @[Decode.scala 393:34]
  wire [31:0] _T_95 = isSTC ? {{11'd0}, stcImm} : _T_94; // @[Decode.scala 392:30]
  wire [31:0] _GEN_199 = isSTC | isStack | isMem | longImm ? _T_95 : {{19'd0}, _GEN_67}; // @[Decode.scala 391:47 Decode.scala 392:24 Decode.scala 138:24]
  wire [21:0] hi_lo_3 = decReg_instr_a[21:0]; // @[Decode.scala 400:42]
  wire [24:0] _T_96 = {1'h0,hi_lo_3,2'h0}; // @[Cat.scala 30:58]
  wire [7:0] hi_5 = decReg_instr_a[21] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [29:0] _T_99 = {hi_5,hi_lo_3}; // @[Cat.scala 30:58]
  wire [29:0] _T_101 = decReg_pc + _T_99; // @[Decode.scala 404:38]
  wire  _GEN_200 = io_decex_rdAddr_0 == 5'h0 ? 1'h0 : _GEN_172; // @[Decode.scala 417:49 Decode.scala 418:24]
  reg [1:0] inDelaySlot; // @[Decode.scala 426:24]
  wire  _T_106 = io_exc_intr & inDelaySlot == 2'h0; // @[Decode.scala 429:21]
  wire  _T_107 = io_exc_exc | _T_106; // @[Decode.scala 428:19]
  wire [29:0] _T_109 = io_exc_exc ? io_exc_excBase : decReg_base; // @[Decode.scala 436:25]
  wire [29:0] _T_110 = io_exc_exc ? io_exc_excAddr : decReg_relPc; // @[Decode.scala 437:26]
  wire [1:0] _T_112 = inDelaySlot - 2'h1; // @[Decode.scala 442:36]
  wire  _T_115 = io_decex_call | io_decex_ret | io_decex_brcf | io_decex_xcall; // @[Decode.scala 444:75]
  wire  _T_116 = _T_115 | io_decex_xret; // @[Decode.scala 445:43]
  wire [1:0] _T_118 = inDelaySlot > 2'h1 ? _T_112 : 2'h1; // @[Decode.scala 448:39]
  wire [1:0] _T_120 = inDelaySlot != 2'h0 ? _T_112 : 2'h0; // @[Decode.scala 449:39]
  wire [1:0] _T_121 = io_decex_aluOp_0_isMul ? _T_118 : _T_120; // @[Decode.scala 447:35]
  RegisterFile rf ( // @[Decode.scala 19:18]
    .clock(rf_clock),
    .io_ena(rf_io_ena),
    .io_rfRead_rsAddr_0(rf_io_rfRead_rsAddr_0),
    .io_rfRead_rsAddr_1(rf_io_rfRead_rsAddr_1),
    .io_rfRead_rsData_0(rf_io_rfRead_rsData_0),
    .io_rfRead_rsData_1(rf_io_rfRead_rsData_1),
    .io_rfWrite_0_addr(rf_io_rfWrite_0_addr),
    .io_rfWrite_0_data(rf_io_rfWrite_0_data),
    .io_rfWrite_0_valid(rf_io_rfWrite_0_valid)
  );
  assign io_decex_base = _T_107 ? _T_109 : decReg_base; // @[Decode.scala 429:50 Decode.scala 436:19 Decode.scala 409:17]
  assign io_decex_relPc = _T_107 ? _T_110 : decReg_relPc; // @[Decode.scala 429:50 Decode.scala 437:20 Decode.scala 410:18]
  assign io_decex_pred_0 = _T_107 ? 4'h0 : decReg_instr_a[30:27]; // @[Decode.scala 429:50 Decode.scala 431:22 Decode.scala 145:22]
  assign io_decex_aluOp_0_func = _T_107 ? 4'h0 : _GEN_81; // @[Decode.scala 429:50 connections.scala 46:10]
  assign io_decex_aluOp_0_isMul = _T_107 ? 1'h0 : _GEN_64; // @[Decode.scala 429:50 connections.scala 47:11]
  assign io_decex_aluOp_0_isCmp = _T_107 ? 1'h0 : _GEN_65; // @[Decode.scala 429:50 connections.scala 48:11]
  assign io_decex_aluOp_0_isPred = _T_107 ? 1'h0 : _GEN_68; // @[Decode.scala 429:50 connections.scala 49:12]
  assign io_decex_aluOp_0_isBCpy = _T_107 ? 1'h0 : _GEN_69; // @[Decode.scala 429:50 connections.scala 50:12]
  assign io_decex_aluOp_0_isMTS = _T_107 ? 1'h0 : _GEN_77; // @[Decode.scala 429:50 connections.scala 51:11]
  assign io_decex_aluOp_0_isMFS = _T_107 ? 1'h0 : _GEN_79; // @[Decode.scala 429:50 connections.scala 52:11]
  assign io_decex_predOp_0_func = _T_107 ? 2'h0 : _T_28; // @[Decode.scala 429:50 connections.scala 63:10 Decode.scala 141:29]
  assign io_decex_predOp_0_dest = _T_107 ? 3'h0 : decReg_instr_a[19:17]; // @[Decode.scala 429:50 connections.scala 64:10 Decode.scala 144:29]
  assign io_decex_predOp_0_s1Addr = _T_107 ? 4'h0 : decReg_instr_a[15:12]; // @[Decode.scala 429:50 connections.scala 65:12 Decode.scala 142:31]
  assign io_decex_predOp_0_s2Addr = _T_107 ? 4'h0 : decReg_instr_a[10:7]; // @[Decode.scala 429:50 connections.scala 66:12 Decode.scala 143:31]
  assign io_decex_jmpOp_branch = _T_107 ? 1'h0 : _GEN_152; // @[Decode.scala 429:50 connections.scala 76:12]
  assign io_decex_jmpOp_target = _T_107 ? 30'h0 : _T_101; // @[Decode.scala 429:50 connections.scala 77:12 Decode.scala 404:25]
  assign io_decex_jmpOp_reloc = _T_107 ? 32'h0 : decReg_reloc; // @[Decode.scala 429:50 connections.scala 78:11 Decode.scala 405:24]
  assign io_decex_memOp_load = _T_107 ? 1'h0 : _T_69; // @[Decode.scala 429:50 connections.scala 91:10]
  assign io_decex_memOp_store = _T_107 ? 1'h0 : _T_78; // @[Decode.scala 429:50 connections.scala 92:11]
  assign io_decex_memOp_hword = _T_107 ? 1'h0 : _GEN_192; // @[Decode.scala 429:50 connections.scala 93:11]
  assign io_decex_memOp_byte = _T_107 ? 1'h0 : _GEN_193; // @[Decode.scala 429:50 connections.scala 94:10]
  assign io_decex_memOp_zext = _T_107 ? 1'h0 : _GEN_176; // @[Decode.scala 429:50 connections.scala 95:10]
  assign io_decex_memOp_typ = _T_107 ? 2'h0 : _GEN_194; // @[Decode.scala 429:50 connections.scala 96:9]
  assign io_decex_stackOp = _T_107 ? 3'h0 : _GEN_110; // @[Decode.scala 429:50 connections.scala 164:13]
  assign io_decex_rsAddr_0 = _T_107 ? 5'h0 : decReg_instr_a[16:12]; // @[Decode.scala 429:50 connections.scala 166:12 Decode.scala 45:22]
  assign io_decex_rsAddr_1 = _T_107 ? 5'h0 : decReg_instr_a[11:7]; // @[Decode.scala 429:50 connections.scala 166:12 Decode.scala 46:22]
  assign io_decex_rsData_0 = _T_107 ? 32'h0 : rf_io_rfRead_rsData_0; // @[Decode.scala 429:50 connections.scala 167:12 Decode.scala 52:22]
  assign io_decex_rsData_1 = _T_107 ? 32'h0 : rf_io_rfRead_rsData_1; // @[Decode.scala 429:50 connections.scala 167:12 Decode.scala 53:22]
  assign io_decex_rdAddr_0 = _T_107 ? 5'h0 : decReg_instr_a[21:17]; // @[Decode.scala 429:50 connections.scala 168:12 Decode.scala 413:22]
  assign io_decex_immVal_0 = _T_107 ? 32'h0 : _GEN_199; // @[Decode.scala 429:50 connections.scala 169:12]
  assign io_decex_immOp_0 = _T_107 | _GEN_124; // @[Decode.scala 429:50 Decode.scala 435:23]
  assign io_decex_wrRd_0 = _T_107 ? 1'h0 : _GEN_200; // @[Decode.scala 429:50 connections.scala 171:10]
  assign io_decex_callAddr = _T_107 ? io_exc_addr : {{7'd0}, _T_96}; // @[Decode.scala 429:50 Decode.scala 434:23 Decode.scala 400:21]
  assign io_decex_call = _T_107 ? 1'h0 : _GEN_151; // @[Decode.scala 429:50 connections.scala 173:10]
  assign io_decex_ret = _T_107 ? 1'h0 : _GEN_148; // @[Decode.scala 429:50 connections.scala 174:9]
  assign io_decex_brcf = _T_107 ? 1'h0 : _GEN_153; // @[Decode.scala 429:50 connections.scala 175:10]
  assign io_decex_trap = _T_107 ? 1'h0 : _T_46; // @[Decode.scala 429:50 connections.scala 176:10]
  assign io_decex_xcall = io_exc_exc | _T_106; // @[Decode.scala 428:19]
  assign io_decex_xret = _T_107 ? 1'h0 : _GEN_150; // @[Decode.scala 429:50 connections.scala 178:10]
  assign io_decex_xsrc = _T_107 ? io_exc_src : _GEN_114; // @[Decode.scala 429:50 Decode.scala 433:19]
  assign io_decex_nonDelayed = _T_107 ? 1'h0 : _GEN_154; // @[Decode.scala 429:50 connections.scala 180:16]
  assign io_decex_illOp = _T_107 ? 1'h0 : ~decoded_0; // @[Decode.scala 429:50 connections.scala 181:11 Decode.scala 423:18]
  assign rf_clock = clock;
  assign rf_io_ena = io_ena; // @[Decode.scala 27:13]
  assign rf_io_rfRead_rsAddr_0 = io_fedec_instr_a[16:12]; // @[Decode.scala 21:45]
  assign rf_io_rfRead_rsAddr_1 = io_fedec_instr_a[11:7]; // @[Decode.scala 22:45]
  assign rf_io_rfWrite_0_addr = io_rfWrite_0_addr; // @[Decode.scala 29:17]
  assign rf_io_rfWrite_0_data = io_rfWrite_0_data; // @[Decode.scala 29:17]
  assign rf_io_rfWrite_0_valid = io_rfWrite_0_valid; // @[Decode.scala 29:17]
  always @(posedge clock) begin
    if (reset) begin // @[Decode.scala 453:15]
      decReg_instr_a <= 32'h0; // @[connections.scala 31:13]
    end else if (io_ena) begin // @[Decode.scala 33:16]
      if (io_flush) begin // @[Decode.scala 35:20]
        decReg_instr_a <= 32'h0; // @[connections.scala 31:13]
      end else begin
        decReg_instr_a <= io_fedec_instr_a; // @[Decode.scala 34:12]
      end
    end
    if (reset) begin // @[Decode.scala 453:15]
      decReg_instr_b <= 32'h0; // @[connections.scala 32:13]
    end else if (io_ena) begin // @[Decode.scala 33:16]
      if (io_flush) begin // @[Decode.scala 35:20]
        decReg_instr_b <= 32'h0; // @[connections.scala 32:13]
      end else begin
        decReg_instr_b <= io_fedec_instr_b; // @[Decode.scala 34:12]
      end
    end
    if (io_ena) begin // @[Decode.scala 33:16]
      decReg_pc <= io_fedec_pc; // @[Decode.scala 34:12]
    end
    if (io_ena) begin // @[Decode.scala 33:16]
      decReg_base <= io_fedec_base; // @[Decode.scala 34:12]
    end
    if (io_ena) begin // @[Decode.scala 33:16]
      decReg_reloc <= io_fedec_reloc; // @[Decode.scala 34:12]
    end
    if (io_ena) begin // @[Decode.scala 33:16]
      decReg_relPc <= io_fedec_relPc;
    end
    if (io_ena) begin // @[Decode.scala 441:16]
      if (io_flush) begin // @[Decode.scala 443:23]
        inDelaySlot <= 2'h1;
      end else if (_T_116) begin // @[Decode.scala 444:27]
        inDelaySlot <= 2'h3;
      end else if (io_decex_jmpOp_branch) begin // @[Decode.scala 446:31]
        inDelaySlot <= 2'h2;
      end else begin
        inDelaySlot <= _T_121;
      end
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
  decReg_instr_a = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  decReg_instr_b = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  decReg_pc = _RAND_2[29:0];
  _RAND_3 = {1{`RANDOM}};
  decReg_base = _RAND_3[29:0];
  _RAND_4 = {1{`RANDOM}};
  decReg_reloc = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  decReg_relPc = _RAND_5[29:0];
  _RAND_6 = {1{`RANDOM}};
  inDelaySlot = _RAND_6[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Execute(
  input         clock,
  input         reset,
  input         io_ena_in,
  input         io_flush,
  output        io_brflush,
  input  [29:0] io_decex_base,
  input  [29:0] io_decex_relPc,
  input  [3:0]  io_decex_pred_0,
  input  [3:0]  io_decex_aluOp_0_func,
  input         io_decex_aluOp_0_isMul,
  input         io_decex_aluOp_0_isCmp,
  input         io_decex_aluOp_0_isPred,
  input         io_decex_aluOp_0_isBCpy,
  input         io_decex_aluOp_0_isMTS,
  input         io_decex_aluOp_0_isMFS,
  input  [1:0]  io_decex_predOp_0_func,
  input  [2:0]  io_decex_predOp_0_dest,
  input  [3:0]  io_decex_predOp_0_s1Addr,
  input  [3:0]  io_decex_predOp_0_s2Addr,
  input         io_decex_jmpOp_branch,
  input  [29:0] io_decex_jmpOp_target,
  input  [31:0] io_decex_jmpOp_reloc,
  input         io_decex_memOp_load,
  input         io_decex_memOp_store,
  input         io_decex_memOp_hword,
  input         io_decex_memOp_byte,
  input         io_decex_memOp_zext,
  input  [1:0]  io_decex_memOp_typ,
  input  [2:0]  io_decex_stackOp,
  input  [4:0]  io_decex_rsAddr_0,
  input  [4:0]  io_decex_rsAddr_1,
  input  [31:0] io_decex_rsData_0,
  input  [31:0] io_decex_rsData_1,
  input  [4:0]  io_decex_rdAddr_0,
  input  [31:0] io_decex_immVal_0,
  input         io_decex_immOp_0,
  input         io_decex_wrRd_0,
  input  [31:0] io_decex_callAddr,
  input         io_decex_call,
  input         io_decex_ret,
  input         io_decex_brcf,
  input         io_decex_trap,
  input         io_decex_xcall,
  input         io_decex_xret,
  input  [4:0]  io_decex_xsrc,
  input         io_decex_nonDelayed,
  input         io_decex_illOp,
  output [4:0]  io_exmem_rd_0_addr,
  output [31:0] io_exmem_rd_0_data,
  output        io_exmem_rd_0_valid,
  output        io_exmem_mem_load,
  output        io_exmem_mem_store,
  output        io_exmem_mem_hword,
  output        io_exmem_mem_byte,
  output        io_exmem_mem_zext,
  output [1:0]  io_exmem_mem_typ,
  output [31:0] io_exmem_mem_addr,
  output [31:0] io_exmem_mem_data,
  output        io_exmem_mem_call,
  output        io_exmem_mem_ret,
  output        io_exmem_mem_brcf,
  output        io_exmem_mem_trap,
  output        io_exmem_mem_xcall,
  output        io_exmem_mem_xret,
  output [4:0]  io_exmem_mem_xsrc,
  output        io_exmem_mem_illOp,
  output        io_exmem_mem_nonDelayed,
  output [29:0] io_exmem_base,
  output [29:0] io_exmem_relPc,
  output        io_exicache_doCallRet,
  output [31:0] io_exicache_callRetBase,
  output [31:0] io_exicache_callRetAddr,
  input  [29:0] io_feex_pc,
  input  [4:0]  io_exResult_0_addr,
  input  [31:0] io_exResult_0_data,
  input         io_exResult_0_valid,
  input  [4:0]  io_memResult_0_addr,
  input  [31:0] io_memResult_0_data,
  input         io_memResult_0_valid,
  output        io_exfe_doBranch,
  output [29:0] io_exfe_branchPc,
  output [2:0]  io_exsc_op,
  output [31:0] io_exsc_opData,
  output [31:0] io_exsc_opOff,
  input  [31:0] io_scex_stackTop,
  input  [31:0] io_scex_memTop
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
  reg [63:0] _RAND_60;
  reg [63:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
`endif // RANDOMIZE_REG_INIT
  reg [29:0] exReg_base; // @[Execute.scala 21:18]
  reg [29:0] exReg_relPc; // @[Execute.scala 21:18]
  reg [3:0] exReg_pred_0; // @[Execute.scala 21:18]
  reg [3:0] exReg_aluOp_0_func; // @[Execute.scala 21:18]
  reg  exReg_aluOp_0_isMul; // @[Execute.scala 21:18]
  reg  exReg_aluOp_0_isCmp; // @[Execute.scala 21:18]
  reg  exReg_aluOp_0_isPred; // @[Execute.scala 21:18]
  reg  exReg_aluOp_0_isBCpy; // @[Execute.scala 21:18]
  reg  exReg_aluOp_0_isMTS; // @[Execute.scala 21:18]
  reg  exReg_aluOp_0_isMFS; // @[Execute.scala 21:18]
  reg [1:0] exReg_predOp_0_func; // @[Execute.scala 21:18]
  reg [2:0] exReg_predOp_0_dest; // @[Execute.scala 21:18]
  reg [3:0] exReg_predOp_0_s1Addr; // @[Execute.scala 21:18]
  reg [3:0] exReg_predOp_0_s2Addr; // @[Execute.scala 21:18]
  reg  exReg_jmpOp_branch; // @[Execute.scala 21:18]
  reg [29:0] exReg_jmpOp_target; // @[Execute.scala 21:18]
  reg [31:0] exReg_jmpOp_reloc; // @[Execute.scala 21:18]
  reg  exReg_memOp_load; // @[Execute.scala 21:18]
  reg  exReg_memOp_store; // @[Execute.scala 21:18]
  reg  exReg_memOp_hword; // @[Execute.scala 21:18]
  reg  exReg_memOp_byte; // @[Execute.scala 21:18]
  reg  exReg_memOp_zext; // @[Execute.scala 21:18]
  reg [1:0] exReg_memOp_typ; // @[Execute.scala 21:18]
  reg [2:0] exReg_stackOp; // @[Execute.scala 21:18]
  reg [31:0] exReg_rsData_0; // @[Execute.scala 21:18]
  reg [31:0] exReg_rsData_1; // @[Execute.scala 21:18]
  reg [4:0] exReg_rdAddr_0; // @[Execute.scala 21:18]
  reg [31:0] exReg_immVal_0; // @[Execute.scala 21:18]
  reg  exReg_immOp_0; // @[Execute.scala 21:18]
  reg  exReg_wrRd_0; // @[Execute.scala 21:18]
  reg [31:0] exReg_callAddr; // @[Execute.scala 21:18]
  reg  exReg_call; // @[Execute.scala 21:18]
  reg  exReg_ret; // @[Execute.scala 21:18]
  reg  exReg_brcf; // @[Execute.scala 21:18]
  reg  exReg_trap; // @[Execute.scala 21:18]
  reg  exReg_xcall; // @[Execute.scala 21:18]
  reg  exReg_xret; // @[Execute.scala 21:18]
  reg [4:0] exReg_xsrc; // @[Execute.scala 21:18]
  reg  exReg_nonDelayed; // @[Execute.scala 21:18]
  reg  exReg_illOp; // @[Execute.scala 21:18]
  reg [2:0] fwReg_0; // @[Execute.scala 84:19]
  reg [2:0] fwReg_1; // @[Execute.scala 84:19]
  reg [31:0] memResultDataReg_0; // @[Execute.scala 86:29]
  reg [31:0] exResultDataReg_0; // @[Execute.scala 87:29]
  wire  _T_12 = ~io_ena_in; // @[Execute.scala 113:23]
  wire [31:0] _T_17 = fwReg_0[1] ? memResultDataReg_0 : exReg_rsData_0; // @[Execute.scala 125:23]
  wire [31:0] op_0 = fwReg_0[0] ? exResultDataReg_0 : _T_17; // @[Execute.scala 124:19]
  wire [31:0] _T_22 = fwReg_1[2] ? exReg_immVal_0 : exReg_rsData_1; // @[Execute.scala 130:29]
  wire [31:0] _T_23 = fwReg_1[1] ? memResultDataReg_0 : _T_22; // @[Execute.scala 129:25]
  wire [31:0] op_1 = fwReg_1[0] ? exResultDataReg_0 : _T_23; // @[Execute.scala 128:21]
  reg  predReg_1; // @[Execute.scala 135:20]
  reg  predReg_2; // @[Execute.scala 135:20]
  reg  predReg_3; // @[Execute.scala 135:20]
  reg  predReg_4; // @[Execute.scala 135:20]
  reg  predReg_5; // @[Execute.scala 135:20]
  reg  predReg_6; // @[Execute.scala 135:20]
  reg  predReg_7; // @[Execute.scala 135:20]
  wire  _GEN_69 = 3'h1 == exReg_pred_0[2:0] ? predReg_1 : 1'h1; // @[Execute.scala 140:64 Execute.scala 140:64]
  wire  _GEN_70 = 3'h2 == exReg_pred_0[2:0] ? predReg_2 : _GEN_69; // @[Execute.scala 140:64 Execute.scala 140:64]
  wire  _GEN_71 = 3'h3 == exReg_pred_0[2:0] ? predReg_3 : _GEN_70; // @[Execute.scala 140:64 Execute.scala 140:64]
  wire  _GEN_72 = 3'h4 == exReg_pred_0[2:0] ? predReg_4 : _GEN_71; // @[Execute.scala 140:64 Execute.scala 140:64]
  wire  _GEN_73 = 3'h5 == exReg_pred_0[2:0] ? predReg_5 : _GEN_72; // @[Execute.scala 140:64 Execute.scala 140:64]
  wire  _GEN_74 = 3'h6 == exReg_pred_0[2:0] ? predReg_6 : _GEN_73; // @[Execute.scala 140:64 Execute.scala 140:64]
  wire  _GEN_75 = 3'h7 == exReg_pred_0[2:0] ? predReg_7 : _GEN_74; // @[Execute.scala 140:64 Execute.scala 140:64]
  wire  _T_27 = _GEN_75 ^ exReg_pred_0[3]; // @[Execute.scala 140:64]
  wire  doExecute_0 = io_flush ? 1'h0 : _T_27; // @[Execute.scala 139:24]
  reg [31:0] retBaseReg; // @[Execute.scala 144:23]
  reg [31:0] retOffReg; // @[Execute.scala 145:22]
  reg  saveRetOff; // @[Execute.scala 146:23]
  reg  saveND; // @[Execute.scala 147:19]
  reg [31:0] excBaseReg; // @[Execute.scala 150:23]
  reg [31:0] excOffReg; // @[Execute.scala 151:22]
  reg [31:0] mulLoReg; // @[Execute.scala 156:21]
  reg [31:0] mulHiReg; // @[Execute.scala 157:21]
  reg [31:0] mulLLReg; // @[Execute.scala 160:24]
  reg [32:0] mulLHReg; // @[Execute.scala 161:24]
  reg [32:0] mulHLReg; // @[Execute.scala 162:24]
  reg [31:0] mulHHReg; // @[Execute.scala 163:24]
  reg  mulPipeReg; // @[Execute.scala 165:23]
  wire  _T_30 = exReg_aluOp_0_func == 4'h0; // @[Execute.scala 171:38]
  wire  hi = _T_30 & op_0[31]; // @[Execute.scala 173:23]
  wire [15:0] lo = op_0[31:16]; // @[Execute.scala 174:25]
  wire [16:0] _T_33 = {hi,lo}; // @[Execute.scala 174:55]
  wire  hi_1 = _T_30 & op_1[31]; // @[Execute.scala 176:23]
  wire [15:0] lo_1 = op_1[31:16]; // @[Execute.scala 177:25]
  wire [16:0] _T_37 = {hi_1,lo_1}; // @[Execute.scala 177:55]
  wire [31:0] _T_39 = op_0[15:0] * op_1[15:0]; // @[Execute.scala 180:22]
  wire [16:0] _T_40 = {1'b0,$signed(op_0[15:0])}; // @[Execute.scala 181:22]
  wire [33:0] _T_41 = $signed(_T_37) * $signed(_T_40); // @[Execute.scala 181:22]
  wire [32:0] _T_43 = _T_41[32:0]; // @[Execute.scala 181:22]
  wire [16:0] _T_44 = {1'b0,$signed(op_1[15:0])}; // @[Execute.scala 182:22]
  wire [33:0] _T_45 = $signed(_T_33) * $signed(_T_44); // @[Execute.scala 182:22]
  wire [32:0] _T_47 = _T_45[32:0]; // @[Execute.scala 182:22]
  wire [33:0] _T_49 = $signed(_T_33) * $signed(_T_37); // @[Execute.scala 183:31]
  wire [63:0] _T_51 = {mulHHReg,mulLLReg}; // @[Execute.scala 185:46]
  wire [48:0] _T_53 = {mulHLReg,16'h0}; // @[Execute.scala 186:69]
  wire [63:0] _GEN_231 = {{15{_T_53[48]}},_T_53}; // @[Execute.scala 186:22]
  wire [63:0] _T_56 = $signed(_T_51) + $signed(_GEN_231); // @[Execute.scala 186:22]
  wire [48:0] _T_58 = {mulLHReg,16'h0}; // @[Execute.scala 187:69]
  wire [63:0] _GEN_232 = {{15{_T_58[48]}},_T_58}; // @[Execute.scala 187:22]
  wire [63:0] _T_61 = $signed(_T_56) + $signed(_GEN_232); // @[Execute.scala 187:22]
  wire [31:0] _GEN_76 = mulPipeReg ? _T_61[63:32] : mulHiReg; // @[Execute.scala 189:22 Execute.scala 190:16 Execute.scala 157:21]
  wire [31:0] _GEN_77 = mulPipeReg ? _T_61[31:0] : mulLoReg; // @[Execute.scala 189:22 Execute.scala 191:16 Execute.scala 156:21]
  wire [33:0] _GEN_82 = io_ena_in ? _T_49 : {{2'd0}, mulHHReg}; // @[Execute.scala 168:19 Execute.scala 183:14 Execute.scala 163:24]
  wire [31:0] _GEN_83 = io_ena_in ? _GEN_76 : mulHiReg; // @[Execute.scala 168:19 Execute.scala 157:21]
  wire [31:0] _GEN_84 = io_ena_in ? _GEN_77 : mulLoReg; // @[Execute.scala 168:19 Execute.scala 156:21]
  wire [2:0] _GEN_85 = ~io_brflush & doExecute_0 ? exReg_stackOp : 3'h0; // @[Execute.scala 201:37 Execute.scala 202:16 Execute.scala 196:14]
  wire  _T_68 = exReg_aluOp_0_func == 4'hc; // @[Execute.scala 33:41]
  wire [1:0] _T_70 = exReg_aluOp_0_func == 4'hd ? 2'h2 : {{1'd0}, _T_68}; // @[Execute.scala 32:31]
  wire [34:0] _GEN_233 = {{3'd0}, op_0}; // @[Execute.scala 32:25]
  wire [34:0] _T_71 = _GEN_233 << _T_70; // @[Execute.scala 32:25]
  wire [34:0] _GEN_234 = {{3'd0}, op_1}; // @[Execute.scala 35:25]
  wire [34:0] _T_73 = _T_71 + _GEN_234; // @[Execute.scala 35:25]
  wire  _T_77 = exReg_aluOp_0_func == 4'h5 & op_0[31]; // @[Execute.scala 38:19]
  wire  _T_79 = 4'h0 == exReg_aluOp_0_func; // @[Conditional.scala 37:30]
  wire  _T_80 = 4'h1 == exReg_aluOp_0_func; // @[Conditional.scala 37:30]
  wire [31:0] _T_82 = op_0 - op_1; // @[Execute.scala 43:39]
  wire  _T_83 = 4'h2 == exReg_aluOp_0_func; // @[Conditional.scala 37:30]
  wire [31:0] _T_84 = op_0 ^ op_1; // @[Execute.scala 44:40]
  wire  _T_85 = 4'h3 == exReg_aluOp_0_func; // @[Conditional.scala 37:30]
  wire [62:0] _GEN_235 = {{31'd0}, op_0}; // @[Execute.scala 45:40]
  wire [62:0] _T_86 = _GEN_235 << op_1[4:0]; // @[Execute.scala 45:40]
  wire  _T_88 = 4'h4 == exReg_aluOp_0_func; // @[Conditional.scala 37:30]
  wire  _T_89 = 4'h5 == exReg_aluOp_0_func; // @[Conditional.scala 37:30]
  wire  _T_90 = 4'h4 == exReg_aluOp_0_func | 4'h5 == exReg_aluOp_0_func; // @[Conditional.scala 37:55]
  wire [32:0] _T_91 = {_T_77,op_0}; // @[Execute.scala 46:47]
  wire [32:0] _T_93 = $signed(_T_91) >>> op_1[4:0]; // @[Execute.scala 46:64]
  wire  _T_94 = 4'h6 == exReg_aluOp_0_func; // @[Conditional.scala 37:30]
  wire [31:0] _T_95 = op_0 | op_1; // @[Execute.scala 47:40]
  wire  _T_96 = 4'h7 == exReg_aluOp_0_func; // @[Conditional.scala 37:30]
  wire [31:0] _T_97 = op_0 & op_1; // @[Execute.scala 48:40]
  wire  _T_98 = 4'hb == exReg_aluOp_0_func; // @[Conditional.scala 37:30]
  wire [31:0] _T_100 = ~_T_95; // @[Execute.scala 49:36]
  wire [34:0] _GEN_88 = _T_98 ? {{3'd0}, _T_100} : _T_73; // @[Conditional.scala 39:67 Execute.scala 49:32]
  wire [34:0] _GEN_89 = _T_96 ? {{3'd0}, _T_97} : _GEN_88; // @[Conditional.scala 39:67 Execute.scala 48:32]
  wire [34:0] _GEN_90 = _T_94 ? {{3'd0}, _T_95} : _GEN_89; // @[Conditional.scala 39:67 Execute.scala 47:32]
  wire [34:0] _GEN_91 = _T_90 ? {{2'd0}, _T_93} : _GEN_90; // @[Conditional.scala 39:67 Execute.scala 46:38]
  wire [34:0] _GEN_92 = _T_85 ? {{3'd0}, _T_86[31:0]} : _GEN_91; // @[Conditional.scala 39:67 Execute.scala 45:32]
  wire [34:0] _GEN_93 = _T_83 ? {{3'd0}, _T_84} : _GEN_92; // @[Conditional.scala 39:67 Execute.scala 44:32]
  wire [34:0] _GEN_94 = _T_80 ? {{3'd0}, _T_82} : _GEN_93; // @[Conditional.scala 39:67 Execute.scala 43:32]
  wire [34:0] _GEN_95 = _T_79 ? _T_73 : _GEN_94; // @[Conditional.scala 40:58 Execute.scala 42:32]
  wire [31:0] _T_103 = fwReg_0[0] ? exResultDataReg_0 : _T_17; // @[Execute.scala 57:20]
  wire [31:0] _T_104 = fwReg_1[0] ? exResultDataReg_0 : _T_23; // @[Execute.scala 58:20]
  wire [31:0] _T_106 = 32'h1 << op_1[4:0]; // @[Execute.scala 59:26]
  wire  _T_107 = op_0 == op_1; // @[Execute.scala 62:18]
  wire  _T_108 = $signed(_T_103) < $signed(_T_104); // @[Execute.scala 63:19]
  wire  _T_109 = op_0 < op_1; // @[Execute.scala 64:19]
  wire  _T_110 = ~_T_107; // @[Execute.scala 67:21]
  wire  _T_111 = _T_108 | _T_107; // @[Execute.scala 69:24]
  wire  _T_112 = _T_109 | _T_107; // @[Execute.scala 71:25]
  wire [31:0] _T_113 = op_0 & _T_106; // @[Execute.scala 72:26]
  wire  _T_114 = _T_113 != 32'h0; // @[Execute.scala 72:36]
  wire  _T_118 = _T_80 ? _T_110 : _T_79 & _T_107; // @[Mux.scala 80:57]
  wire  _T_120 = _T_83 ? _T_108 : _T_118; // @[Mux.scala 80:57]
  wire  _T_122 = _T_85 ? _T_111 : _T_120; // @[Mux.scala 80:57]
  wire  _T_124 = _T_88 ? _T_109 : _T_122; // @[Mux.scala 80:57]
  wire  _T_126 = _T_89 ? _T_112 : _T_124; // @[Mux.scala 80:57]
  wire  _T_128 = _T_94 ? _T_114 : _T_126; // @[Mux.scala 80:57]
  wire  _GEN_97 = 3'h1 == exReg_aluOp_0_func[2:0] ? predReg_1 : 1'h1; // @[Execute.scala 211:63 Execute.scala 211:63]
  wire  _GEN_98 = 3'h2 == exReg_aluOp_0_func[2:0] ? predReg_2 : _GEN_97; // @[Execute.scala 211:63 Execute.scala 211:63]
  wire  _GEN_99 = 3'h3 == exReg_aluOp_0_func[2:0] ? predReg_3 : _GEN_98; // @[Execute.scala 211:63 Execute.scala 211:63]
  wire  _GEN_100 = 3'h4 == exReg_aluOp_0_func[2:0] ? predReg_4 : _GEN_99; // @[Execute.scala 211:63 Execute.scala 211:63]
  wire  _GEN_101 = 3'h5 == exReg_aluOp_0_func[2:0] ? predReg_5 : _GEN_100; // @[Execute.scala 211:63 Execute.scala 211:63]
  wire  _GEN_102 = 3'h6 == exReg_aluOp_0_func[2:0] ? predReg_6 : _GEN_101; // @[Execute.scala 211:63 Execute.scala 211:63]
  wire  _GEN_103 = 3'h7 == exReg_aluOp_0_func[2:0] ? predReg_7 : _GEN_102; // @[Execute.scala 211:63 Execute.scala 211:63]
  wire  _T_131 = _GEN_103 ^ exReg_aluOp_0_func[3]; // @[Execute.scala 211:63]
  wire [31:0] _T_132 = {31'h0,_T_131}; // @[Execute.scala 212:45]
  wire [62:0] _GEN_236 = {{31'd0}, _T_132}; // @[Execute.scala 212:56]
  wire [62:0] _T_134 = _GEN_236 << op_1[4:0]; // @[Execute.scala 212:56]
  wire [62:0] _T_137 = 63'h1 << op_1[4:0]; // @[Execute.scala 213:60]
  wire [31:0] _T_139 = ~_T_137[31:0]; // @[Execute.scala 213:30]
  wire [31:0] _T_140 = op_0 & _T_139; // @[Execute.scala 213:28]
  wire [31:0] _T_141 = _T_140 | _T_134[31:0]; // @[Execute.scala 214:31]
  wire  _GEN_105 = 3'h1 == exReg_predOp_0_s1Addr[2:0] ? predReg_1 : 1'h1; // @[Execute.scala 217:62 Execute.scala 217:62]
  wire  _GEN_106 = 3'h2 == exReg_predOp_0_s1Addr[2:0] ? predReg_2 : _GEN_105; // @[Execute.scala 217:62 Execute.scala 217:62]
  wire  _GEN_107 = 3'h3 == exReg_predOp_0_s1Addr[2:0] ? predReg_3 : _GEN_106; // @[Execute.scala 217:62 Execute.scala 217:62]
  wire  _GEN_108 = 3'h4 == exReg_predOp_0_s1Addr[2:0] ? predReg_4 : _GEN_107; // @[Execute.scala 217:62 Execute.scala 217:62]
  wire  _GEN_109 = 3'h5 == exReg_predOp_0_s1Addr[2:0] ? predReg_5 : _GEN_108; // @[Execute.scala 217:62 Execute.scala 217:62]
  wire  _GEN_110 = 3'h6 == exReg_predOp_0_s1Addr[2:0] ? predReg_6 : _GEN_109; // @[Execute.scala 217:62 Execute.scala 217:62]
  wire  _GEN_111 = 3'h7 == exReg_predOp_0_s1Addr[2:0] ? predReg_7 : _GEN_110; // @[Execute.scala 217:62 Execute.scala 217:62]
  wire  _T_144 = _GEN_111 ^ exReg_predOp_0_s1Addr[3]; // @[Execute.scala 217:62]
  wire  _GEN_113 = 3'h1 == exReg_predOp_0_s2Addr[2:0] ? predReg_1 : 1'h1; // @[Execute.scala 218:62 Execute.scala 218:62]
  wire  _GEN_114 = 3'h2 == exReg_predOp_0_s2Addr[2:0] ? predReg_2 : _GEN_113; // @[Execute.scala 218:62 Execute.scala 218:62]
  wire  _GEN_115 = 3'h3 == exReg_predOp_0_s2Addr[2:0] ? predReg_3 : _GEN_114; // @[Execute.scala 218:62 Execute.scala 218:62]
  wire  _GEN_116 = 3'h4 == exReg_predOp_0_s2Addr[2:0] ? predReg_4 : _GEN_115; // @[Execute.scala 218:62 Execute.scala 218:62]
  wire  _GEN_117 = 3'h5 == exReg_predOp_0_s2Addr[2:0] ? predReg_5 : _GEN_116; // @[Execute.scala 218:62 Execute.scala 218:62]
  wire  _GEN_118 = 3'h6 == exReg_predOp_0_s2Addr[2:0] ? predReg_6 : _GEN_117; // @[Execute.scala 218:62 Execute.scala 218:62]
  wire  _GEN_119 = 3'h7 == exReg_predOp_0_s2Addr[2:0] ? predReg_7 : _GEN_118; // @[Execute.scala 218:62 Execute.scala 218:62]
  wire  _T_147 = _GEN_119 ^ exReg_predOp_0_s2Addr[3]; // @[Execute.scala 218:62]
  wire  _T_148 = _T_144 | _T_147; // @[Execute.scala 77:22]
  wire  _T_149 = _T_144 & _T_147; // @[Execute.scala 78:23]
  wire  _T_150 = _T_144 ^ _T_147; // @[Execute.scala 79:23]
  wire  _T_152 = ~_T_148; // @[Execute.scala 80:19]
  wire  _T_154 = 2'h1 == exReg_predOp_0_func ? _T_149 : _T_148; // @[Mux.scala 80:57]
  wire  _T_156 = 2'h2 == exReg_predOp_0_func ? _T_150 : _T_154; // @[Mux.scala 80:57]
  wire  _T_158 = 2'h3 == exReg_predOp_0_func ? _T_152 : _T_156; // @[Mux.scala 80:57]
  wire  _T_161 = exReg_aluOp_0_isCmp ? _T_128 : _T_158; // @[Execute.scala 222:43]
  wire  _GEN_121 = 3'h1 == exReg_predOp_0_dest ? _T_161 : predReg_1; // @[Execute.scala 222:37 Execute.scala 222:37 Execute.scala 135:20]
  wire  _GEN_122 = 3'h2 == exReg_predOp_0_dest ? _T_161 : predReg_2; // @[Execute.scala 222:37 Execute.scala 222:37 Execute.scala 135:20]
  wire  _GEN_123 = 3'h3 == exReg_predOp_0_dest ? _T_161 : predReg_3; // @[Execute.scala 222:37 Execute.scala 222:37 Execute.scala 135:20]
  wire  _GEN_124 = 3'h4 == exReg_predOp_0_dest ? _T_161 : predReg_4; // @[Execute.scala 222:37 Execute.scala 222:37 Execute.scala 135:20]
  wire  _GEN_125 = 3'h5 == exReg_predOp_0_dest ? _T_161 : predReg_5; // @[Execute.scala 222:37 Execute.scala 222:37 Execute.scala 135:20]
  wire  _GEN_126 = 3'h6 == exReg_predOp_0_dest ? _T_161 : predReg_6; // @[Execute.scala 222:37 Execute.scala 222:37 Execute.scala 135:20]
  wire  _GEN_127 = 3'h7 == exReg_predOp_0_dest ? _T_161 : predReg_7; // @[Execute.scala 222:37 Execute.scala 222:37 Execute.scala 135:20]
  wire  _GEN_129 = (exReg_aluOp_0_isCmp | exReg_aluOp_0_isPred) & doExecute_0 ? _GEN_121 : predReg_1; // @[Execute.scala 221:75 Execute.scala 135:20]
  wire  _GEN_130 = (exReg_aluOp_0_isCmp | exReg_aluOp_0_isPred) & doExecute_0 ? _GEN_122 : predReg_2; // @[Execute.scala 221:75 Execute.scala 135:20]
  wire  _GEN_131 = (exReg_aluOp_0_isCmp | exReg_aluOp_0_isPred) & doExecute_0 ? _GEN_123 : predReg_3; // @[Execute.scala 221:75 Execute.scala 135:20]
  wire  _GEN_132 = (exReg_aluOp_0_isCmp | exReg_aluOp_0_isPred) & doExecute_0 ? _GEN_124 : predReg_4; // @[Execute.scala 221:75 Execute.scala 135:20]
  wire  _GEN_133 = (exReg_aluOp_0_isCmp | exReg_aluOp_0_isPred) & doExecute_0 ? _GEN_125 : predReg_5; // @[Execute.scala 221:75 Execute.scala 135:20]
  wire  _GEN_134 = (exReg_aluOp_0_isCmp | exReg_aluOp_0_isPred) & doExecute_0 ? _GEN_126 : predReg_6; // @[Execute.scala 221:75 Execute.scala 135:20]
  wire  _GEN_135 = (exReg_aluOp_0_isCmp | exReg_aluOp_0_isPred) & doExecute_0 ? _GEN_127 : predReg_7; // @[Execute.scala 221:75 Execute.scala 135:20]
  wire  _T_177 = 4'h8 == exReg_aluOp_0_func; // @[Conditional.scala 37:30]
  wire  _T_178 = 4'h9 == exReg_aluOp_0_func; // @[Conditional.scala 37:30]
  wire  _T_179 = 4'ha == exReg_aluOp_0_func; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_136 = _T_179 ? op_0 : excOffReg; // @[Conditional.scala 39:67 Execute.scala 260:21 Execute.scala 151:22]
  wire [31:0] _GEN_137 = _T_178 ? op_0 : excBaseReg; // @[Conditional.scala 39:67 Execute.scala 257:22 Execute.scala 150:23]
  wire [31:0] _GEN_138 = _T_178 ? excOffReg : _GEN_136; // @[Conditional.scala 39:67 Execute.scala 151:22]
  wire [31:0] _GEN_139 = _T_177 ? op_0 : retOffReg; // @[Conditional.scala 39:67 Execute.scala 254:21 Execute.scala 145:22]
  wire [31:0] _GEN_140 = _T_177 ? excBaseReg : _GEN_137; // @[Conditional.scala 39:67 Execute.scala 150:23]
  wire [31:0] _GEN_141 = _T_177 ? excOffReg : _GEN_138; // @[Conditional.scala 39:67 Execute.scala 151:22]
  wire [31:0] _GEN_142 = _T_96 ? op_0 : retBaseReg; // @[Conditional.scala 39:67 Execute.scala 251:22 Execute.scala 144:23]
  wire [31:0] _GEN_143 = _T_96 ? retOffReg : _GEN_139; // @[Conditional.scala 39:67 Execute.scala 145:22]
  wire [31:0] _GEN_144 = _T_96 ? excBaseReg : _GEN_140; // @[Conditional.scala 39:67 Execute.scala 150:23]
  wire [31:0] _GEN_145 = _T_96 ? excOffReg : _GEN_141; // @[Conditional.scala 39:67 Execute.scala 151:22]
  wire [2:0] _GEN_146 = _T_89 ? 3'h2 : _GEN_85; // @[Conditional.scala 39:67 Execute.scala 248:22]
  wire [31:0] _GEN_147 = _T_89 ? retBaseReg : _GEN_142; // @[Conditional.scala 39:67 Execute.scala 144:23]
  wire [31:0] _GEN_148 = _T_89 ? retOffReg : _GEN_143; // @[Conditional.scala 39:67 Execute.scala 145:22]
  wire [31:0] _GEN_149 = _T_89 ? excBaseReg : _GEN_144; // @[Conditional.scala 39:67 Execute.scala 150:23]
  wire [31:0] _GEN_150 = _T_89 ? excOffReg : _GEN_145; // @[Conditional.scala 39:67 Execute.scala 151:22]
  wire [2:0] _GEN_151 = _T_94 ? 3'h1 : _GEN_146; // @[Conditional.scala 39:67 Execute.scala 245:22]
  wire [31:0] _GEN_152 = _T_94 ? retBaseReg : _GEN_147; // @[Conditional.scala 39:67 Execute.scala 144:23]
  wire [31:0] _GEN_153 = _T_94 ? retOffReg : _GEN_148; // @[Conditional.scala 39:67 Execute.scala 145:22]
  wire [31:0] _GEN_154 = _T_94 ? excBaseReg : _GEN_149; // @[Conditional.scala 39:67 Execute.scala 150:23]
  wire [31:0] _GEN_155 = _T_94 ? excOffReg : _GEN_150; // @[Conditional.scala 39:67 Execute.scala 151:22]
  wire [31:0] _GEN_156 = _T_85 ? op_0 : _GEN_83; // @[Conditional.scala 39:67 Execute.scala 242:20]
  wire [2:0] _GEN_157 = _T_85 ? _GEN_85 : _GEN_151; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_158 = _T_85 ? retBaseReg : _GEN_152; // @[Conditional.scala 39:67 Execute.scala 144:23]
  wire [31:0] _GEN_159 = _T_85 ? retOffReg : _GEN_153; // @[Conditional.scala 39:67 Execute.scala 145:22]
  wire [31:0] _GEN_160 = _T_85 ? excBaseReg : _GEN_154; // @[Conditional.scala 39:67 Execute.scala 150:23]
  wire [31:0] _GEN_161 = _T_85 ? excOffReg : _GEN_155; // @[Conditional.scala 39:67 Execute.scala 151:22]
  wire [2:0] _GEN_164 = _T_83 ? _GEN_85 : _GEN_157; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_165 = _T_83 ? retBaseReg : _GEN_158; // @[Conditional.scala 39:67 Execute.scala 144:23]
  wire [31:0] _GEN_166 = _T_83 ? retOffReg : _GEN_159; // @[Conditional.scala 39:67 Execute.scala 145:22]
  wire [31:0] _GEN_167 = _T_83 ? excBaseReg : _GEN_160; // @[Conditional.scala 39:67 Execute.scala 150:23]
  wire [31:0] _GEN_168 = _T_83 ? excOffReg : _GEN_161; // @[Conditional.scala 39:67 Execute.scala 151:22]
  wire [2:0] _GEN_179 = _T_79 ? _GEN_85 : _GEN_164; // @[Conditional.scala 40:58]
  wire [31:0] _T_181 = {24'h0,predReg_7,predReg_6,predReg_5,predReg_4,predReg_3,predReg_2,predReg_1,1'h1}; // @[Cat.scala 30:58]
  wire [31:0] _GEN_200 = _T_179 ? excOffReg : 32'h0; // @[Conditional.scala 39:67 Execute.scala 292:19 Execute.scala 265:15]
  wire [31:0] _GEN_201 = _T_178 ? excBaseReg : _GEN_200; // @[Conditional.scala 39:67 Execute.scala 289:19]
  wire [31:0] _GEN_202 = _T_177 ? retOffReg : _GEN_201; // @[Conditional.scala 39:67 Execute.scala 286:19]
  wire [31:0] _GEN_203 = _T_96 ? retBaseReg : _GEN_202; // @[Conditional.scala 39:67 Execute.scala 283:19]
  wire [31:0] _GEN_204 = _T_89 ? io_scex_memTop : _GEN_203; // @[Conditional.scala 39:67 Execute.scala 280:19]
  wire [31:0] _GEN_205 = _T_94 ? io_scex_stackTop : _GEN_204; // @[Conditional.scala 39:67 Execute.scala 277:19]
  wire [31:0] _GEN_206 = _T_85 ? mulHiReg : _GEN_205; // @[Conditional.scala 39:67 Execute.scala 274:19]
  wire [31:0] _GEN_207 = _T_83 ? mulLoReg : _GEN_206; // @[Conditional.scala 39:67 Execute.scala 271:19]
  wire [31:0] _GEN_208 = _T_79 ? _T_181 : _GEN_207; // @[Conditional.scala 40:58 Execute.scala 268:19]
  wire [31:0] _T_191 = exReg_aluOp_0_isBCpy ? _T_141 : _GEN_95[31:0]; // @[Execute.scala 300:35]
  wire  _T_197 = exReg_call & doExecute_0; // @[Execute.scala 315:35]
  wire  _T_201 = exReg_xcall & doExecute_0; // @[Execute.scala 319:37]
  wire  _T_205 = exReg_call | exReg_ret | exReg_brcf | exReg_xcall; // @[Execute.scala 325:58]
  wire [31:0] brcfOff = exReg_immOp_0 ? 32'h0 : op_1; // @[Execute.scala 328:20]
  wire  _T_207 = exReg_call | exReg_xcall; // @[Execute.scala 329:36]
  wire [31:0] _T_208 = exReg_xret ? excOffReg : retOffReg; // @[Execute.scala 331:32]
  wire [31:0] _T_209 = exReg_brcf ? brcfOff : _T_208; // @[Execute.scala 330:28]
  wire [31:0] callRetAddr = exReg_call | exReg_xcall ? 32'h0 : _T_209; // @[Execute.scala 329:24]
  wire [31:0] callBase = exReg_immOp_0 ? exReg_callAddr : op_0; // @[Execute.scala 333:21]
  wire [31:0] _T_212 = exReg_xret ? excBaseReg : retBaseReg; // @[Execute.scala 335:28]
  wire [31:0] callRetBase = _T_207 | exReg_brcf ? callBase : _T_212; // @[Execute.scala 334:24]
  wire [31:0] _T_214 = {exReg_base,2'h0}; // @[Cat.scala 30:58]
  wire [31:0] _T_219 = {exReg_relPc,2'h0}; // @[Cat.scala 30:58]
  wire [31:0] _GEN_237 = {{2'd0}, op_0[31:2]}; // @[Execute.scala 358:50]
  wire [31:0] _T_223 = _GEN_237 - exReg_jmpOp_reloc; // @[Execute.scala 358:50]
  wire [31:0] target = exReg_immOp_0 ? {{2'd0}, exReg_jmpOp_target} : _T_223; // @[Execute.scala 356:19]
  wire [29:0] hi_5 = saveND ? exReg_relPc : io_feex_pc; // @[Execute.scala 416:25]
  wire [31:0] _T_231 = {hi_5,2'h0}; // @[Cat.scala 30:58]
  assign io_brflush = exReg_nonDelayed & exReg_jmpOp_branch & doExecute_0; // @[Execute.scala 360:56]
  assign io_exmem_rd_0_addr = exReg_rdAddr_0; // @[Execute.scala 297:25]
  assign io_exmem_rd_0_data = exReg_aluOp_0_isMFS ? _GEN_208 : _T_191; // @[Execute.scala 299:31]
  assign io_exmem_rd_0_valid = exReg_wrRd_0 & doExecute_0; // @[Execute.scala 298:43]
  assign io_exmem_mem_load = exReg_memOp_load & doExecute_0; // @[Execute.scala 305:41]
  assign io_exmem_mem_store = exReg_memOp_store & doExecute_0; // @[Execute.scala 306:43]
  assign io_exmem_mem_hword = exReg_memOp_hword; // @[Execute.scala 307:22]
  assign io_exmem_mem_byte = exReg_memOp_byte; // @[Execute.scala 308:21]
  assign io_exmem_mem_zext = exReg_memOp_zext; // @[Execute.scala 309:21]
  assign io_exmem_mem_typ = exReg_memOp_typ; // @[Execute.scala 310:20]
  assign io_exmem_mem_addr = op_0 + exReg_immVal_0; // @[Execute.scala 311:30]
  assign io_exmem_mem_data = fwReg_1[0] ? exResultDataReg_0 : _T_23; // @[Execute.scala 128:21]
  assign io_exmem_mem_call = exReg_call & doExecute_0; // @[Execute.scala 315:35]
  assign io_exmem_mem_ret = exReg_ret & doExecute_0; // @[Execute.scala 316:34]
  assign io_exmem_mem_brcf = exReg_brcf & doExecute_0; // @[Execute.scala 317:35]
  assign io_exmem_mem_trap = exReg_trap & doExecute_0; // @[Execute.scala 318:35]
  assign io_exmem_mem_xcall = exReg_xcall & doExecute_0; // @[Execute.scala 319:37]
  assign io_exmem_mem_xret = exReg_xret & doExecute_0; // @[Execute.scala 320:35]
  assign io_exmem_mem_xsrc = exReg_xsrc; // @[Execute.scala 321:21]
  assign io_exmem_mem_illOp = exReg_illOp; // @[Execute.scala 323:22]
  assign io_exmem_mem_nonDelayed = exReg_nonDelayed; // @[Execute.scala 322:27]
  assign io_exmem_base = exReg_base; // @[Execute.scala 364:17]
  assign io_exmem_relPc = exReg_relPc; // @[Execute.scala 365:18]
  assign io_exicache_doCallRet = (_T_205 | exReg_xret) & doExecute_0; // @[Execute.scala 326:47]
  assign io_exicache_callRetBase = {{2'd0}, callRetBase[31:2]}; // @[Execute.scala 369:41]
  assign io_exicache_callRetAddr = {{2'd0}, callRetAddr[31:2]}; // @[Execute.scala 370:41]
  assign io_exfe_doBranch = exReg_jmpOp_branch & doExecute_0; // @[Execute.scala 355:42]
  assign io_exfe_branchPc = target[29:0]; // @[Execute.scala 359:20]
  assign io_exsc_op = exReg_aluOp_0_isMTS & doExecute_0 ? _GEN_179 : _GEN_85; // @[Execute.scala 227:48]
  assign io_exsc_opData = exReg_aluOp_0_isMTS & doExecute_0 ? op_0 : 32'h0; // @[Execute.scala 227:48 Execute.scala 228:22 Execute.scala 197:18]
  assign io_exsc_opOff = exReg_immOp_0 ? exReg_immVal_0 : op_0; // @[Execute.scala 198:23]
  always @(posedge clock) begin
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_base <= io_decex_base; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_relPc <= io_decex_relPc;
    end
    if (reset) begin // @[Execute.scala 420:15]
      exReg_pred_0 <= 4'h8; // @[connections.scala 151:10]
    end else if (io_ena_in) begin // @[Execute.scala 22:32]
      if (io_flush | io_brflush) begin // @[Execute.scala 24:34]
        exReg_pred_0 <= 4'h8; // @[connections.scala 151:10]
      end else begin
        exReg_pred_0 <= io_decex_pred_0; // @[Execute.scala 23:11]
      end
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_aluOp_0_func <= io_decex_aluOp_0_func; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_aluOp_0_isMul <= io_decex_aluOp_0_isMul; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_aluOp_0_isCmp <= io_decex_aluOp_0_isCmp; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_aluOp_0_isPred <= io_decex_aluOp_0_isPred; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_aluOp_0_isBCpy <= io_decex_aluOp_0_isBCpy; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_aluOp_0_isMTS <= io_decex_aluOp_0_isMTS; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_aluOp_0_isMFS <= io_decex_aluOp_0_isMFS; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_predOp_0_func <= io_decex_predOp_0_func; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_predOp_0_dest <= io_decex_predOp_0_dest; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_predOp_0_s1Addr <= io_decex_predOp_0_s1Addr; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_predOp_0_s2Addr <= io_decex_predOp_0_s2Addr; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_jmpOp_branch <= io_decex_jmpOp_branch; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_jmpOp_target <= io_decex_jmpOp_target; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_jmpOp_reloc <= io_decex_jmpOp_reloc; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_memOp_load <= io_decex_memOp_load; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_memOp_store <= io_decex_memOp_store; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_memOp_hword <= io_decex_memOp_hword; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_memOp_byte <= io_decex_memOp_byte; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_memOp_zext <= io_decex_memOp_zext; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_memOp_typ <= io_decex_memOp_typ; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_stackOp <= io_decex_stackOp; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_rsData_0 <= io_decex_rsData_0; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_rsData_1 <= io_decex_rsData_1; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_rdAddr_0 <= io_decex_rdAddr_0; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_immVal_0 <= io_decex_immVal_0; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_immOp_0 <= io_decex_immOp_0; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_wrRd_0 <= io_decex_wrRd_0; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_callAddr <= io_decex_callAddr; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_call <= io_decex_call; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_ret <= io_decex_ret; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_brcf <= io_decex_brcf; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_trap <= io_decex_trap; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_xcall <= io_decex_xcall; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_xret <= io_decex_xret; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_xsrc <= io_decex_xsrc; // @[Execute.scala 23:11]
    end
    if (io_ena_in) begin // @[Execute.scala 22:32]
      exReg_nonDelayed <= io_decex_nonDelayed; // @[Execute.scala 23:11]
    end
    if (reset) begin // @[Execute.scala 420:15]
      exReg_illOp <= 1'h0; // @[connections.scala 152:11]
    end else if (io_ena_in) begin // @[Execute.scala 22:32]
      if (io_flush | io_brflush) begin // @[Execute.scala 24:34]
        exReg_illOp <= 1'h0; // @[connections.scala 152:11]
      end else begin
        exReg_illOp <= io_decex_illOp; // @[Execute.scala 23:11]
      end
    end
    if (!(~io_ena_in)) begin // @[Execute.scala 113:35]
      if (io_decex_rsAddr_0 == io_exResult_0_addr & io_exResult_0_valid) begin // @[Execute.scala 101:80]
        fwReg_0 <= 3'h1; // @[Execute.scala 102:18]
      end else if (io_decex_rsAddr_0 == io_memResult_0_addr & io_memResult_0_valid) begin // @[Execute.scala 95:82]
        fwReg_0 <= 3'h2; // @[Execute.scala 96:18]
      end else begin
        fwReg_0 <= 3'h0; // @[Execute.scala 92:14]
      end
    end
    if (!(~io_ena_in)) begin // @[Execute.scala 113:35]
      if (io_decex_immOp_0) begin // @[Execute.scala 108:29]
        fwReg_1 <= 3'h4; // @[Execute.scala 109:20]
      end else if (io_decex_rsAddr_1 == io_exResult_0_addr & io_exResult_0_valid) begin // @[Execute.scala 101:80]
        fwReg_1 <= 3'h1; // @[Execute.scala 102:18]
      end else if (io_decex_rsAddr_1 == io_memResult_0_addr & io_memResult_0_valid) begin // @[Execute.scala 95:82]
        fwReg_1 <= 3'h2; // @[Execute.scala 96:18]
      end else begin
        fwReg_1 <= 3'h0; // @[Execute.scala 92:14]
      end
    end
    if (io_ena_in) begin // @[Execute.scala 117:33]
      memResultDataReg_0 <= io_memResult_0_data; // @[Execute.scala 118:22]
    end
    if (io_ena_in) begin // @[Execute.scala 117:33]
      exResultDataReg_0 <= io_exResult_0_data; // @[Execute.scala 119:21]
    end
    if (!(_T_12)) begin // @[Execute.scala 404:34]
      if (exReg_aluOp_0_isMTS & doExecute_0) begin // @[Execute.scala 227:48]
        if (_T_79) begin // @[Conditional.scala 40:58]
          predReg_1 <= op_0[1]; // @[Execute.scala 233:24]
        end else begin
          predReg_1 <= _GEN_129;
        end
      end else begin
        predReg_1 <= _GEN_129;
      end
    end
    if (!(_T_12)) begin // @[Execute.scala 404:34]
      if (exReg_aluOp_0_isMTS & doExecute_0) begin // @[Execute.scala 227:48]
        if (_T_79) begin // @[Conditional.scala 40:58]
          predReg_2 <= op_0[2]; // @[Execute.scala 233:24]
        end else begin
          predReg_2 <= _GEN_130;
        end
      end else begin
        predReg_2 <= _GEN_130;
      end
    end
    if (!(_T_12)) begin // @[Execute.scala 404:34]
      if (exReg_aluOp_0_isMTS & doExecute_0) begin // @[Execute.scala 227:48]
        if (_T_79) begin // @[Conditional.scala 40:58]
          predReg_3 <= op_0[3]; // @[Execute.scala 233:24]
        end else begin
          predReg_3 <= _GEN_131;
        end
      end else begin
        predReg_3 <= _GEN_131;
      end
    end
    if (!(_T_12)) begin // @[Execute.scala 404:34]
      if (exReg_aluOp_0_isMTS & doExecute_0) begin // @[Execute.scala 227:48]
        if (_T_79) begin // @[Conditional.scala 40:58]
          predReg_4 <= op_0[4]; // @[Execute.scala 233:24]
        end else begin
          predReg_4 <= _GEN_132;
        end
      end else begin
        predReg_4 <= _GEN_132;
      end
    end
    if (!(_T_12)) begin // @[Execute.scala 404:34]
      if (exReg_aluOp_0_isMTS & doExecute_0) begin // @[Execute.scala 227:48]
        if (_T_79) begin // @[Conditional.scala 40:58]
          predReg_5 <= op_0[5]; // @[Execute.scala 233:24]
        end else begin
          predReg_5 <= _GEN_133;
        end
      end else begin
        predReg_5 <= _GEN_133;
      end
    end
    if (!(_T_12)) begin // @[Execute.scala 404:34]
      if (exReg_aluOp_0_isMTS & doExecute_0) begin // @[Execute.scala 227:48]
        if (_T_79) begin // @[Conditional.scala 40:58]
          predReg_6 <= op_0[6]; // @[Execute.scala 233:24]
        end else begin
          predReg_6 <= _GEN_134;
        end
      end else begin
        predReg_6 <= _GEN_134;
      end
    end
    if (!(_T_12)) begin // @[Execute.scala 404:34]
      if (exReg_aluOp_0_isMTS & doExecute_0) begin // @[Execute.scala 227:48]
        if (_T_79) begin // @[Conditional.scala 40:58]
          predReg_7 <= op_0[7]; // @[Execute.scala 233:24]
        end else begin
          predReg_7 <= _GEN_135;
        end
      end else begin
        predReg_7 <= _GEN_135;
      end
    end
    if (!(_T_12)) begin // @[Execute.scala 404:34]
      if (_T_197) begin // @[Execute.scala 341:36]
        retBaseReg <= _T_214; // @[Execute.scala 342:16]
      end else if (exReg_aluOp_0_isMTS & doExecute_0) begin // @[Execute.scala 227:48]
        if (!(_T_79)) begin // @[Conditional.scala 40:58]
          retBaseReg <= _GEN_165;
        end
      end
    end
    if (saveRetOff) begin // @[Execute.scala 415:20]
      retOffReg <= _T_231; // @[Execute.scala 416:15]
    end else if (!(_T_12)) begin // @[Execute.scala 404:34]
      if (exReg_aluOp_0_isMTS & doExecute_0) begin // @[Execute.scala 227:48]
        if (!(_T_79)) begin // @[Conditional.scala 40:58]
          retOffReg <= _GEN_166;
        end
      end
    end
    saveRetOff <= _T_197 & io_ena_in; // @[Execute.scala 345:44]
    saveND <= exReg_nonDelayed; // @[Execute.scala 346:10]
    if (!(_T_12)) begin // @[Execute.scala 404:34]
      if (_T_201) begin // @[Execute.scala 349:37]
        excBaseReg <= _T_214; // @[Execute.scala 350:16]
      end else if (exReg_aluOp_0_isMTS & doExecute_0) begin // @[Execute.scala 227:48]
        if (!(_T_79)) begin // @[Conditional.scala 40:58]
          excBaseReg <= _GEN_167;
        end
      end
    end
    if (!(_T_12)) begin // @[Execute.scala 404:34]
      if (_T_201) begin // @[Execute.scala 349:37]
        excOffReg <= _T_219; // @[Execute.scala 351:15]
      end else if (exReg_aluOp_0_isMTS & doExecute_0) begin // @[Execute.scala 227:48]
        if (!(_T_79)) begin // @[Conditional.scala 40:58]
          excOffReg <= _GEN_168;
        end
      end
    end
    if (!(_T_12)) begin // @[Execute.scala 404:34]
      if (exReg_aluOp_0_isMTS & doExecute_0) begin // @[Execute.scala 227:48]
        if (_T_79) begin // @[Conditional.scala 40:58]
          mulLoReg <= _GEN_84;
        end else if (_T_83) begin // @[Conditional.scala 39:67]
          mulLoReg <= op_0; // @[Execute.scala 239:20]
        end else begin
          mulLoReg <= _GEN_84;
        end
      end else begin
        mulLoReg <= _GEN_84;
      end
    end
    if (!(_T_12)) begin // @[Execute.scala 404:34]
      if (exReg_aluOp_0_isMTS & doExecute_0) begin // @[Execute.scala 227:48]
        if (_T_79) begin // @[Conditional.scala 40:58]
          mulHiReg <= _GEN_83;
        end else if (_T_83) begin // @[Conditional.scala 39:67]
          mulHiReg <= _GEN_83;
        end else begin
          mulHiReg <= _GEN_156;
        end
      end else begin
        mulHiReg <= _GEN_83;
      end
    end
    if (io_ena_in) begin // @[Execute.scala 168:19]
      mulLLReg <= _T_39; // @[Execute.scala 180:14]
    end
    if (io_ena_in) begin // @[Execute.scala 168:19]
      mulLHReg <= _T_43; // @[Execute.scala 181:14]
    end
    if (io_ena_in) begin // @[Execute.scala 168:19]
      mulHLReg <= _T_47; // @[Execute.scala 182:14]
    end
    mulHHReg <= _GEN_82[31:0];
    if (io_ena_in) begin // @[Execute.scala 168:19]
      mulPipeReg <= exReg_aluOp_0_isMul & doExecute_0; // @[Execute.scala 169:16]
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
  exReg_base = _RAND_0[29:0];
  _RAND_1 = {1{`RANDOM}};
  exReg_relPc = _RAND_1[29:0];
  _RAND_2 = {1{`RANDOM}};
  exReg_pred_0 = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  exReg_aluOp_0_func = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  exReg_aluOp_0_isMul = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  exReg_aluOp_0_isCmp = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  exReg_aluOp_0_isPred = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  exReg_aluOp_0_isBCpy = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  exReg_aluOp_0_isMTS = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  exReg_aluOp_0_isMFS = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  exReg_predOp_0_func = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  exReg_predOp_0_dest = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  exReg_predOp_0_s1Addr = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  exReg_predOp_0_s2Addr = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  exReg_jmpOp_branch = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  exReg_jmpOp_target = _RAND_15[29:0];
  _RAND_16 = {1{`RANDOM}};
  exReg_jmpOp_reloc = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  exReg_memOp_load = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  exReg_memOp_store = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  exReg_memOp_hword = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  exReg_memOp_byte = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  exReg_memOp_zext = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  exReg_memOp_typ = _RAND_22[1:0];
  _RAND_23 = {1{`RANDOM}};
  exReg_stackOp = _RAND_23[2:0];
  _RAND_24 = {1{`RANDOM}};
  exReg_rsData_0 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  exReg_rsData_1 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  exReg_rdAddr_0 = _RAND_26[4:0];
  _RAND_27 = {1{`RANDOM}};
  exReg_immVal_0 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  exReg_immOp_0 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  exReg_wrRd_0 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  exReg_callAddr = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  exReg_call = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  exReg_ret = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  exReg_brcf = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  exReg_trap = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  exReg_xcall = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  exReg_xret = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  exReg_xsrc = _RAND_37[4:0];
  _RAND_38 = {1{`RANDOM}};
  exReg_nonDelayed = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  exReg_illOp = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  fwReg_0 = _RAND_40[2:0];
  _RAND_41 = {1{`RANDOM}};
  fwReg_1 = _RAND_41[2:0];
  _RAND_42 = {1{`RANDOM}};
  memResultDataReg_0 = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  exResultDataReg_0 = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  predReg_1 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  predReg_2 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  predReg_3 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  predReg_4 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  predReg_5 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  predReg_6 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  predReg_7 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  retBaseReg = _RAND_51[31:0];
  _RAND_52 = {1{`RANDOM}};
  retOffReg = _RAND_52[31:0];
  _RAND_53 = {1{`RANDOM}};
  saveRetOff = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  saveND = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  excBaseReg = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  excOffReg = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  mulLoReg = _RAND_57[31:0];
  _RAND_58 = {1{`RANDOM}};
  mulHiReg = _RAND_58[31:0];
  _RAND_59 = {1{`RANDOM}};
  mulLLReg = _RAND_59[31:0];
  _RAND_60 = {2{`RANDOM}};
  mulLHReg = _RAND_60[32:0];
  _RAND_61 = {2{`RANDOM}};
  mulHLReg = _RAND_61[32:0];
  _RAND_62 = {1{`RANDOM}};
  mulHHReg = _RAND_62[31:0];
  _RAND_63 = {1{`RANDOM}};
  mulPipeReg = _RAND_63[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Memory(
  input         clock,
  input         reset,
  output        io_ena_out,
  input         io_ena_in,
  output        io_flush,
  input  [4:0]  io_exmem_rd_0_addr,
  input  [31:0] io_exmem_rd_0_data,
  input         io_exmem_rd_0_valid,
  input         io_exmem_mem_load,
  input         io_exmem_mem_store,
  input         io_exmem_mem_hword,
  input         io_exmem_mem_byte,
  input         io_exmem_mem_zext,
  input  [1:0]  io_exmem_mem_typ,
  input  [31:0] io_exmem_mem_addr,
  input  [31:0] io_exmem_mem_data,
  input         io_exmem_mem_call,
  input         io_exmem_mem_ret,
  input         io_exmem_mem_brcf,
  input         io_exmem_mem_trap,
  input         io_exmem_mem_xcall,
  input         io_exmem_mem_xret,
  input  [4:0]  io_exmem_mem_xsrc,
  input         io_exmem_mem_illOp,
  input         io_exmem_mem_nonDelayed,
  input  [29:0] io_exmem_base,
  input  [29:0] io_exmem_relPc,
  output [4:0]  io_memwb_rd_0_addr,
  output [31:0] io_memwb_rd_0_data,
  output        io_memwb_rd_0_valid,
  output        io_memfe_doCallRet,
  output [4:0]  io_exResult_0_addr,
  output [31:0] io_exResult_0_data,
  output        io_exResult_0_valid,
  output [2:0]  io_localInOut_M_Cmd,
  output [31:0] io_localInOut_M_Addr,
  output [31:0] io_localInOut_M_Data,
  output [3:0]  io_localInOut_M_ByteEn,
  input  [1:0]  io_localInOut_S_Resp,
  input  [31:0] io_localInOut_S_Data,
  output [2:0]  io_globalInOut_M_Cmd,
  output [31:0] io_globalInOut_M_Addr,
  output [31:0] io_globalInOut_M_Data,
  output [3:0]  io_globalInOut_M_ByteEn,
  output [1:0]  io_globalInOut_M_AddrSpace,
  input  [1:0]  io_globalInOut_S_Resp,
  input  [31:0] io_globalInOut_S_Data,
  output        io_exc_call,
  output        io_exc_ret,
  output [4:0]  io_exc_src,
  output        io_exc_exc,
  output [29:0] io_exc_excBase,
  output [29:0] io_exc_excAddr
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
`endif // RANDOMIZE_REG_INIT
  reg [4:0] memReg_rd_0_addr; // @[Memory.scala 21:19]
  reg [31:0] memReg_rd_0_data; // @[Memory.scala 21:19]
  reg  memReg_rd_0_valid; // @[Memory.scala 21:19]
  reg  memReg_mem_load; // @[Memory.scala 21:19]
  reg  memReg_mem_hword; // @[Memory.scala 21:19]
  reg  memReg_mem_byte; // @[Memory.scala 21:19]
  reg  memReg_mem_zext; // @[Memory.scala 21:19]
  reg [1:0] memReg_mem_typ; // @[Memory.scala 21:19]
  reg [31:0] memReg_mem_addr; // @[Memory.scala 21:19]
  reg  memReg_mem_call; // @[Memory.scala 21:19]
  reg  memReg_mem_ret; // @[Memory.scala 21:19]
  reg  memReg_mem_brcf; // @[Memory.scala 21:19]
  reg  memReg_mem_trap; // @[Memory.scala 21:19]
  reg  memReg_mem_xcall; // @[Memory.scala 21:19]
  reg  memReg_mem_xret; // @[Memory.scala 21:19]
  reg [4:0] memReg_mem_xsrc; // @[Memory.scala 21:19]
  reg  memReg_mem_illOp; // @[Memory.scala 21:19]
  reg  memReg_mem_nonDelayed; // @[Memory.scala 21:19]
  reg [29:0] memReg_base; // @[Memory.scala 21:19]
  reg [29:0] memReg_relPc; // @[Memory.scala 21:19]
  wire  _T_1 = io_globalInOut_S_Resp == 2'h3; // @[Memory.scala 25:39]
  wire  illMem = io_localInOut_S_Resp == 2'h3 | _T_1; // @[Memory.scala 24:54]
  reg  illMemReg; // @[Memory.scala 27:22]
  wire  _T_6 = memReg_mem_call | memReg_mem_ret | memReg_mem_brcf; // @[Memory.scala 31:52]
  wire  _T_8 = (_T_6 | memReg_mem_xret) & memReg_mem_nonDelayed; // @[Memory.scala 32:54]
  wire  _T_9 = memReg_mem_xcall | memReg_mem_trap | _T_8; // @[Memory.scala 30:52]
  wire  _T_10 = _T_9 | memReg_mem_illOp; // @[Memory.scala 32:80]
  wire  flush = _T_10 | illMemReg; // @[Memory.scala 33:33]
  reg  mayStallReg; // @[Memory.scala 37:28]
  wire  _T_11 = io_localInOut_S_Resp == 2'h1; // @[Memory.scala 38:38]
  wire  _T_13 = _T_11 | io_globalInOut_S_Resp == 2'h1; // @[Memory.scala 39:17]
  wire  enable = _T_13 | ~mayStallReg; // @[Memory.scala 40:17]
  wire  _T_15 = enable & io_ena_in; // @[Memory.scala 44:15]
  wire  _GEN_10 = flush ? 1'h0 : io_exmem_mem_load | io_exmem_mem_store; // @[Memory.scala 47:17 Memory.scala 49:19 Memory.scala 46:17]
  wire  _GEN_36 = enable & io_ena_in ? _GEN_10 : mayStallReg; // @[Memory.scala 44:29 Memory.scala 37:28]
  wire  _GEN_37 = illMem ? 1'h0 : _GEN_36; // @[Memory.scala 52:16 Memory.scala 53:19]
  wire [7:0] _GEN_45 = io_exmem_mem_addr[1] ? io_exmem_mem_data[7:0] : io_exmem_mem_data[7:0]; // @[Memory.scala 92:52 Memory.scala 93:17 Memory.scala 82:15]
  wire [7:0] _GEN_46 = io_exmem_mem_addr[1] ? io_exmem_mem_data[15:8] : io_exmem_mem_data[15:8]; // @[Memory.scala 92:52 Memory.scala 94:17 Memory.scala 82:15]
  wire [3:0] _GEN_47 = io_exmem_mem_addr[1] ? 4'h3 : 4'hf; // @[Memory.scala 92:52 Memory.scala 95:14 Memory.scala 85:10]
  wire [7:0] _GEN_48 = ~io_exmem_mem_addr[1] ? io_exmem_mem_data[7:0] : io_exmem_mem_data[23:16]; // @[Memory.scala 88:47 Memory.scala 89:17 Memory.scala 82:15]
  wire [7:0] _GEN_49 = ~io_exmem_mem_addr[1] ? io_exmem_mem_data[15:8] : io_exmem_mem_data[31:24]; // @[Memory.scala 88:47 Memory.scala 90:17 Memory.scala 82:15]
  wire [3:0] _GEN_50 = ~io_exmem_mem_addr[1] ? 4'hc : _GEN_47; // @[Memory.scala 88:47 Memory.scala 91:14]
  wire [7:0] _GEN_51 = ~io_exmem_mem_addr[1] ? io_exmem_mem_data[7:0] : _GEN_45; // @[Memory.scala 88:47 Memory.scala 82:15]
  wire [7:0] _GEN_52 = ~io_exmem_mem_addr[1] ? io_exmem_mem_data[15:8] : _GEN_46; // @[Memory.scala 88:47 Memory.scala 82:15]
  wire [7:0] _GEN_53 = io_exmem_mem_hword ? _GEN_48 : io_exmem_mem_data[23:16]; // @[Memory.scala 87:28 Memory.scala 82:15]
  wire [7:0] _GEN_54 = io_exmem_mem_hword ? _GEN_49 : io_exmem_mem_data[31:24]; // @[Memory.scala 87:28 Memory.scala 82:15]
  wire [3:0] _GEN_55 = io_exmem_mem_hword ? _GEN_50 : 4'hf; // @[Memory.scala 87:28 Memory.scala 85:10]
  wire [7:0] _GEN_56 = io_exmem_mem_hword ? _GEN_51 : io_exmem_mem_data[7:0]; // @[Memory.scala 87:28 Memory.scala 82:15]
  wire [7:0] _GEN_57 = io_exmem_mem_hword ? _GEN_52 : io_exmem_mem_data[15:8]; // @[Memory.scala 87:28 Memory.scala 82:15]
  wire  _T_36 = 2'h0 == io_exmem_mem_addr[1:0]; // @[Conditional.scala 37:30]
  wire  _T_38 = 2'h1 == io_exmem_mem_addr[1:0]; // @[Conditional.scala 37:30]
  wire  _T_40 = 2'h2 == io_exmem_mem_addr[1:0]; // @[Conditional.scala 37:30]
  wire  _T_42 = 2'h3 == io_exmem_mem_addr[1:0]; // @[Conditional.scala 37:30]
  wire [7:0] _GEN_58 = _T_42 ? io_exmem_mem_data[7:0] : _GEN_56; // @[Conditional.scala 39:67 Memory.scala 114:19]
  wire [3:0] _GEN_59 = _T_42 ? 4'h1 : _GEN_55; // @[Conditional.scala 39:67 Memory.scala 115:16]
  wire [7:0] _GEN_60 = _T_40 ? io_exmem_mem_data[7:0] : _GEN_57; // @[Conditional.scala 39:67 Memory.scala 110:19]
  wire [3:0] _GEN_61 = _T_40 ? 4'h2 : _GEN_59; // @[Conditional.scala 39:67 Memory.scala 111:16]
  wire [7:0] _GEN_62 = _T_40 ? _GEN_56 : _GEN_58; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_63 = _T_38 ? io_exmem_mem_data[7:0] : _GEN_53; // @[Conditional.scala 39:67 Memory.scala 106:19]
  wire [3:0] _GEN_64 = _T_38 ? 4'h4 : _GEN_61; // @[Conditional.scala 39:67 Memory.scala 107:16]
  wire [7:0] _GEN_65 = _T_38 ? _GEN_57 : _GEN_60; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_66 = _T_38 ? _GEN_56 : _GEN_62; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_67 = _T_36 ? io_exmem_mem_data[7:0] : _GEN_54; // @[Conditional.scala 40:58 Memory.scala 102:19]
  wire [3:0] _GEN_68 = _T_36 ? 4'h8 : _GEN_64; // @[Conditional.scala 40:58 Memory.scala 103:16]
  wire [7:0] _GEN_69 = _T_36 ? _GEN_53 : _GEN_63; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_70 = _T_36 ? _GEN_57 : _GEN_65; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_71 = _T_36 ? _GEN_56 : _GEN_66; // @[Conditional.scala 40:58]
  wire [7:0] wrData_3 = io_exmem_mem_byte ? _GEN_67 : _GEN_54; // @[Memory.scala 99:27]
  wire [7:0] wrData_2 = io_exmem_mem_byte ? _GEN_69 : _GEN_53; // @[Memory.scala 99:27]
  wire [7:0] wrData_1 = io_exmem_mem_byte ? _GEN_70 : _GEN_57; // @[Memory.scala 99:27]
  wire [7:0] wrData_0 = io_exmem_mem_byte ? _GEN_71 : _GEN_56; // @[Memory.scala 99:27]
  wire [2:0] _T_48 = {1'h0,io_exmem_mem_load,io_exmem_mem_store}; // @[Memory.scala 123:49]
  wire [2:0] cmd = _T_15 & ~flush ? _T_48 : 3'h0; // @[Memory.scala 122:16]
  wire [29:0] hi = io_exmem_mem_addr[31:2]; // @[Memory.scala 127:48]
  wire [15:0] lo = {wrData_1,wrData_0}; // @[Cat.scala 30:58]
  wire [15:0] hi_1 = {wrData_3,wrData_2}; // @[Cat.scala 30:58]
  wire [1:0] _T_59 = io_exmem_mem_typ == 2'h2 ? 2'h2 : 2'h3; // @[Memory.scala 136:40]
  wire [31:0] _T_63 = memReg_mem_typ == 2'h1 ? io_localInOut_S_Data : io_globalInOut_S_Data; // @[Memory.scala 150:33]
  wire [7:0] rdData_0 = _T_63[7:0]; // @[Memory.scala 142:24]
  wire [7:0] rdData_1 = _T_63[15:8]; // @[Memory.scala 142:24]
  wire [7:0] rdData_2 = _T_63[23:16]; // @[Memory.scala 142:24]
  wire [7:0] rdData_3 = _T_63[31:24]; // @[Memory.scala 142:24]
  wire [15:0] lo_2 = {rdData_1,rdData_0}; // @[Cat.scala 30:58]
  wire [15:0] hi_4 = {rdData_3,rdData_2}; // @[Cat.scala 30:58]
  wire [31:0] _T_69 = {rdData_3,rdData_2,rdData_1,rdData_0}; // @[Cat.scala 30:58]
  wire [7:0] _T_72 = 2'h1 == memReg_mem_addr[1:0] ? rdData_2 : rdData_3; // @[Mux.scala 80:57]
  wire [7:0] _T_74 = 2'h2 == memReg_mem_addr[1:0] ? rdData_1 : _T_72; // @[Mux.scala 80:57]
  wire [7:0] bval = 2'h3 == memReg_mem_addr[1:0] ? rdData_0 : _T_74; // @[Mux.scala 80:57]
  wire [15:0] hval = ~memReg_mem_addr[1] ? hi_4 : lo_2; // @[Memory.scala 164:17]
  wire [23:0] _T_82 = bval[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [23:0] _T_83 = memReg_mem_zext ? 24'h0 : _T_82; // @[Memory.scala 170:16]
  wire [31:0] _T_84 = {_T_83,bval}; // @[Memory.scala 172:66]
  wire [31:0] _GEN_77 = memReg_mem_byte ? _T_84 : _T_69; // @[Memory.scala 169:25 Memory.scala 170:10 Memory.scala 155:8]
  wire [15:0] _T_87 = hval[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [15:0] _T_88 = memReg_mem_zext ? 16'h0 : _T_87; // @[Memory.scala 175:16]
  wire [31:0] _T_89 = {_T_88,hval}; // @[Memory.scala 177:70]
  wire [31:0] dout = memReg_mem_hword ? _T_89 : _GEN_77; // @[Memory.scala 174:26 Memory.scala 175:10]
  wire  _T_93 = _T_6 | memReg_mem_xcall; // @[Memory.scala 186:79]
  wire [4:0] _T_101 = illMemReg ? 5'h1 : memReg_mem_xsrc; // @[Memory.scala 206:24]
  wire [29:0] _T_104 = memReg_relPc + 30'h1; // @[Memory.scala 209:55]
  assign io_ena_out = _T_13 | ~mayStallReg; // @[Memory.scala 40:17]
  assign io_flush = _T_10 | illMemReg; // @[Memory.scala 33:33]
  assign io_memwb_rd_0_addr = memReg_rd_0_addr; // @[Memory.scala 181:15]
  assign io_memwb_rd_0_data = memReg_mem_load ? dout : memReg_rd_0_data; // @[Memory.scala 183:29]
  assign io_memwb_rd_0_valid = memReg_rd_0_valid; // @[Memory.scala 181:15]
  assign io_memfe_doCallRet = _T_93 | memReg_mem_xret; // @[Memory.scala 187:43]
  assign io_exResult_0_addr = io_exmem_rd_0_addr; // @[Memory.scala 197:15]
  assign io_exResult_0_data = io_exmem_rd_0_data; // @[Memory.scala 197:15]
  assign io_exResult_0_valid = io_exmem_rd_0_valid; // @[Memory.scala 197:15]
  assign io_localInOut_M_Cmd = io_exmem_mem_typ == 2'h1 ? cmd : 3'h0; // @[Memory.scala 126:29]
  assign io_localInOut_M_Addr = {hi,2'h0}; // @[Cat.scala 30:58]
  assign io_localInOut_M_Data = {hi_1,lo}; // @[Cat.scala 30:58]
  assign io_localInOut_M_ByteEn = io_exmem_mem_byte ? _GEN_68 : _GEN_55; // @[Memory.scala 99:27]
  assign io_globalInOut_M_Cmd = io_exmem_mem_typ != 2'h1 ? cmd : 3'h0; // @[Memory.scala 131:30]
  assign io_globalInOut_M_Addr = {hi,2'h0}; // @[Cat.scala 30:58]
  assign io_globalInOut_M_Data = {hi_1,lo}; // @[Cat.scala 30:58]
  assign io_globalInOut_M_ByteEn = io_exmem_mem_byte ? _GEN_68 : _GEN_55; // @[Memory.scala 99:27]
  assign io_globalInOut_M_AddrSpace = io_exmem_mem_typ == 2'h0 ? 2'h0 : _T_59; // @[Memory.scala 135:36]
  assign io_exc_call = memReg_mem_xcall; // @[Memory.scala 200:15]
  assign io_exc_ret = memReg_mem_xret; // @[Memory.scala 201:14]
  assign io_exc_src = memReg_mem_illOp ? 5'h0 : _T_101; // @[Memory.scala 205:20]
  assign io_exc_exc = memReg_mem_trap | memReg_mem_illOp | illMemReg; // @[Memory.scala 203:53]
  assign io_exc_excBase = memReg_base; // @[Memory.scala 208:18]
  assign io_exc_excAddr = memReg_mem_trap ? _T_104 : memReg_relPc; // @[Memory.scala 209:24]
  always @(posedge clock) begin
    if (enable & io_ena_in) begin // @[Memory.scala 44:29]
      memReg_rd_0_addr <= io_exmem_rd_0_addr; // @[Memory.scala 45:12]
    end
    if (enable & io_ena_in) begin // @[Memory.scala 44:29]
      memReg_rd_0_data <= io_exmem_rd_0_data; // @[Memory.scala 45:12]
    end
    if (reset) begin // @[Memory.scala 215:15]
      memReg_rd_0_valid <= 1'h0; // @[connections.scala 191:11]
    end else if (enable & io_ena_in) begin // @[Memory.scala 44:29]
      if (flush) begin // @[Memory.scala 47:17]
        memReg_rd_0_valid <= 1'h0; // @[connections.scala 191:11]
      end else begin
        memReg_rd_0_valid <= io_exmem_rd_0_valid; // @[Memory.scala 45:12]
      end
    end
    if (reset) begin // @[Memory.scala 215:15]
      memReg_mem_load <= 1'h0; // @[connections.scala 217:10]
    end else if (enable & io_ena_in) begin // @[Memory.scala 44:29]
      if (flush) begin // @[Memory.scala 47:17]
        memReg_mem_load <= 1'h0; // @[connections.scala 217:10]
      end else begin
        memReg_mem_load <= io_exmem_mem_load; // @[Memory.scala 45:12]
      end
    end
    if (enable & io_ena_in) begin // @[Memory.scala 44:29]
      memReg_mem_hword <= io_exmem_mem_hword; // @[Memory.scala 45:12]
    end
    if (enable & io_ena_in) begin // @[Memory.scala 44:29]
      memReg_mem_byte <= io_exmem_mem_byte; // @[Memory.scala 45:12]
    end
    if (enable & io_ena_in) begin // @[Memory.scala 44:29]
      memReg_mem_zext <= io_exmem_mem_zext; // @[Memory.scala 45:12]
    end
    if (enable & io_ena_in) begin // @[Memory.scala 44:29]
      memReg_mem_typ <= io_exmem_mem_typ; // @[Memory.scala 45:12]
    end
    if (enable & io_ena_in) begin // @[Memory.scala 44:29]
      memReg_mem_addr <= io_exmem_mem_addr; // @[Memory.scala 45:12]
    end
    if (reset) begin // @[Memory.scala 215:15]
      memReg_mem_call <= 1'h0; // @[connections.scala 219:10]
    end else if (enable & io_ena_in) begin // @[Memory.scala 44:29]
      if (flush) begin // @[Memory.scala 47:17]
        memReg_mem_call <= 1'h0; // @[connections.scala 219:10]
      end else begin
        memReg_mem_call <= io_exmem_mem_call; // @[Memory.scala 45:12]
      end
    end
    if (reset) begin // @[Memory.scala 215:15]
      memReg_mem_ret <= 1'h0; // @[connections.scala 220:9]
    end else if (enable & io_ena_in) begin // @[Memory.scala 44:29]
      if (flush) begin // @[Memory.scala 47:17]
        memReg_mem_ret <= 1'h0; // @[connections.scala 220:9]
      end else begin
        memReg_mem_ret <= io_exmem_mem_ret; // @[Memory.scala 45:12]
      end
    end
    if (reset) begin // @[Memory.scala 215:15]
      memReg_mem_brcf <= 1'h0; // @[connections.scala 221:10]
    end else if (enable & io_ena_in) begin // @[Memory.scala 44:29]
      if (flush) begin // @[Memory.scala 47:17]
        memReg_mem_brcf <= 1'h0; // @[connections.scala 221:10]
      end else begin
        memReg_mem_brcf <= io_exmem_mem_brcf; // @[Memory.scala 45:12]
      end
    end
    if (reset) begin // @[Memory.scala 215:15]
      memReg_mem_trap <= 1'h0; // @[connections.scala 222:10]
    end else if (enable & io_ena_in) begin // @[Memory.scala 44:29]
      if (flush) begin // @[Memory.scala 47:17]
        memReg_mem_trap <= 1'h0; // @[connections.scala 222:10]
      end else begin
        memReg_mem_trap <= io_exmem_mem_trap; // @[Memory.scala 45:12]
      end
    end
    if (reset) begin // @[Memory.scala 215:15]
      memReg_mem_xcall <= 1'h0; // @[connections.scala 223:11]
    end else if (enable & io_ena_in) begin // @[Memory.scala 44:29]
      if (flush) begin // @[Memory.scala 47:17]
        memReg_mem_xcall <= 1'h0; // @[connections.scala 223:11]
      end else begin
        memReg_mem_xcall <= io_exmem_mem_xcall; // @[Memory.scala 45:12]
      end
    end
    if (reset) begin // @[Memory.scala 215:15]
      memReg_mem_xret <= 1'h0; // @[connections.scala 224:10]
    end else if (enable & io_ena_in) begin // @[Memory.scala 44:29]
      if (flush) begin // @[Memory.scala 47:17]
        memReg_mem_xret <= 1'h0; // @[connections.scala 224:10]
      end else begin
        memReg_mem_xret <= io_exmem_mem_xret; // @[Memory.scala 45:12]
      end
    end
    if (enable & io_ena_in) begin // @[Memory.scala 44:29]
      memReg_mem_xsrc <= io_exmem_mem_xsrc; // @[Memory.scala 45:12]
    end
    if (reset) begin // @[Memory.scala 215:15]
      memReg_mem_illOp <= 1'h0; // @[connections.scala 225:11]
    end else if (enable & io_ena_in) begin // @[Memory.scala 44:29]
      if (flush) begin // @[Memory.scala 47:17]
        memReg_mem_illOp <= 1'h0; // @[connections.scala 225:11]
      end else begin
        memReg_mem_illOp <= io_exmem_mem_illOp; // @[Memory.scala 45:12]
      end
    end
    if (enable & io_ena_in) begin // @[Memory.scala 44:29]
      memReg_mem_nonDelayed <= io_exmem_mem_nonDelayed; // @[Memory.scala 45:12]
    end
    if (enable & io_ena_in) begin // @[Memory.scala 44:29]
      memReg_base <= io_exmem_base; // @[Memory.scala 45:12]
    end
    if (enable & io_ena_in) begin // @[Memory.scala 44:29]
      memReg_relPc <= io_exmem_relPc; // @[Memory.scala 45:12]
    end
    illMemReg <= io_localInOut_S_Resp == 2'h3 | _T_1; // @[Memory.scala 24:54]
    if (reset) begin // @[Memory.scala 37:28]
      mayStallReg <= 1'h0; // @[Memory.scala 37:28]
    end else if (~io_ena_in) begin // @[Memory.scala 60:21]
      if (io_localInOut_S_Resp != 2'h0 | io_globalInOut_S_Resp != 2'h0) begin // @[Memory.scala 61:92]
        mayStallReg <= 1'h0; // @[Memory.scala 62:19]
      end else begin
        mayStallReg <= _GEN_37;
      end
    end else begin
      mayStallReg <= _GEN_37;
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
  memReg_rd_0_addr = _RAND_0[4:0];
  _RAND_1 = {1{`RANDOM}};
  memReg_rd_0_data = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  memReg_rd_0_valid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  memReg_mem_load = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  memReg_mem_hword = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  memReg_mem_byte = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  memReg_mem_zext = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  memReg_mem_typ = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  memReg_mem_addr = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  memReg_mem_call = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  memReg_mem_ret = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  memReg_mem_brcf = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  memReg_mem_trap = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  memReg_mem_xcall = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  memReg_mem_xret = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  memReg_mem_xsrc = _RAND_15[4:0];
  _RAND_16 = {1{`RANDOM}};
  memReg_mem_illOp = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  memReg_mem_nonDelayed = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  memReg_base = _RAND_18[29:0];
  _RAND_19 = {1{`RANDOM}};
  memReg_relPc = _RAND_19[29:0];
  _RAND_20 = {1{`RANDOM}};
  illMemReg = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  mayStallReg = _RAND_21[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module WriteBack(
  input  [4:0]  io_memwb_rd_0_addr,
  input  [31:0] io_memwb_rd_0_data,
  input         io_memwb_rd_0_valid,
  output [4:0]  io_rfWrite_0_addr,
  output [31:0] io_rfWrite_0_data,
  output        io_rfWrite_0_valid,
  output [4:0]  io_memResult_0_addr,
  output [31:0] io_memResult_0_data,
  output        io_memResult_0_valid
);
  assign io_rfWrite_0_addr = io_memwb_rd_0_addr; // @[WriteBack.scala 21:14]
  assign io_rfWrite_0_data = io_memwb_rd_0_data; // @[WriteBack.scala 21:14]
  assign io_rfWrite_0_valid = io_memwb_rd_0_valid; // @[WriteBack.scala 21:14]
  assign io_memResult_0_addr = io_memwb_rd_0_addr; // @[WriteBack.scala 23:16]
  assign io_memResult_0_data = io_memwb_rd_0_data; // @[WriteBack.scala 23:16]
  assign io_memResult_0_valid = io_memwb_rd_0_valid; // @[WriteBack.scala 23:16]
endmodule
module Exceptions(
  input         clock,
  input         reset,
  input         io_ena,
  input  [2:0]  io_ocp_M_Cmd,
  input  [31:0] io_ocp_M_Addr,
  input  [31:0] io_ocp_M_Data,
  output [1:0]  io_ocp_S_Resp,
  output [31:0] io_ocp_S_Data,
  input         io_intrs_0,
  input         io_intrs_1,
  output        io_excdec_exc,
  output [29:0] io_excdec_excBase,
  output [29:0] io_excdec_excAddr,
  output        io_excdec_intr,
  output [31:0] io_excdec_addr,
  output [4:0]  io_excdec_src,
  output        io_excdec_local,
  input         io_memexc_call,
  input         io_memexc_ret,
  input  [4:0]  io_memexc_src,
  input         io_memexc_exc,
  input  [29:0] io_memexc_excBase,
  input  [29:0] io_memexc_excAddr
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
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
`endif // RANDOMIZE_REG_INIT
  reg [31:0] vec [0:31];
  wire [31:0] vec_MPORT_data;
  wire [4:0] vec_MPORT_addr;
  wire [31:0] vec_MPORT_1_data;
  wire [4:0] vec_MPORT_1_addr;
  wire  vec_MPORT_1_mask;
  wire  vec_MPORT_1_en;
  reg [31:0] vecDup [0:31];
  wire [31:0] vecDup_MPORT_3_data;
  wire [4:0] vecDup_MPORT_3_addr;
  wire [31:0] vecDup_MPORT_2_data;
  wire [4:0] vecDup_MPORT_2_addr;
  wire  vecDup_MPORT_2_mask;
  wire  vecDup_MPORT_2_en;
  reg [2:0] masterReg_Cmd; // @[Exceptions.scala 21:26]
  reg [31:0] masterReg_Addr; // @[Exceptions.scala 21:26]
  reg [31:0] masterReg_Data; // @[Exceptions.scala 21:26]
  reg [31:0] statusReg; // @[Exceptions.scala 23:26]
  reg [31:0] maskReg; // @[Exceptions.scala 24:22]
  reg [31:0] sourceReg; // @[Exceptions.scala 25:22]
  wire  intrEna = statusReg[0]; // @[Exceptions.scala 27:26]
  wire  superMode = statusReg[1]; // @[Exceptions.scala 28:28]
  reg  localModeReg; // @[Exceptions.scala 30:29]
  reg  sleepReg; // @[Exceptions.scala 39:25]
  reg  excPendReg_0; // @[Exceptions.scala 43:28]
  reg  excPendReg_1; // @[Exceptions.scala 43:28]
  reg  excPendReg_2; // @[Exceptions.scala 43:28]
  reg  excPendReg_3; // @[Exceptions.scala 43:28]
  reg  excPendReg_4; // @[Exceptions.scala 43:28]
  reg  excPendReg_5; // @[Exceptions.scala 43:28]
  reg  excPendReg_6; // @[Exceptions.scala 43:28]
  reg  excPendReg_7; // @[Exceptions.scala 43:28]
  reg  excPendReg_8; // @[Exceptions.scala 43:28]
  reg  excPendReg_9; // @[Exceptions.scala 43:28]
  reg  excPendReg_10; // @[Exceptions.scala 43:28]
  reg  excPendReg_11; // @[Exceptions.scala 43:28]
  reg  excPendReg_12; // @[Exceptions.scala 43:28]
  reg  excPendReg_13; // @[Exceptions.scala 43:28]
  reg  excPendReg_14; // @[Exceptions.scala 43:28]
  reg  excPendReg_15; // @[Exceptions.scala 43:28]
  reg  excPendReg_16; // @[Exceptions.scala 43:28]
  reg  excPendReg_17; // @[Exceptions.scala 43:28]
  reg  excPendReg_18; // @[Exceptions.scala 43:28]
  reg  excPendReg_19; // @[Exceptions.scala 43:28]
  reg  excPendReg_20; // @[Exceptions.scala 43:28]
  reg  excPendReg_21; // @[Exceptions.scala 43:28]
  reg  excPendReg_22; // @[Exceptions.scala 43:28]
  reg  excPendReg_23; // @[Exceptions.scala 43:28]
  reg  excPendReg_24; // @[Exceptions.scala 43:28]
  reg  excPendReg_25; // @[Exceptions.scala 43:28]
  reg  excPendReg_26; // @[Exceptions.scala 43:28]
  reg  excPendReg_27; // @[Exceptions.scala 43:28]
  reg  excPendReg_28; // @[Exceptions.scala 43:28]
  reg  excPendReg_29; // @[Exceptions.scala 43:28]
  reg  excPendReg_30; // @[Exceptions.scala 43:28]
  reg  excPendReg_31; // @[Exceptions.scala 43:28]
  reg  intrPendReg_16; // @[Exceptions.scala 45:28]
  reg  intrPendReg_17; // @[Exceptions.scala 45:28]
  wire  _T_2 = masterReg_Cmd == 3'h2; // @[Exceptions.scala 61:22]
  wire  _T_4 = 6'h0 == masterReg_Addr[7:2]; // @[Conditional.scala 37:30]
  wire  _T_5 = 6'h1 == masterReg_Addr[7:2]; // @[Conditional.scala 37:30]
  wire  _T_6 = 6'h3 == masterReg_Addr[7:2]; // @[Conditional.scala 37:30]
  wire  _T_7 = 6'h2 == masterReg_Addr[7:2]; // @[Conditional.scala 37:30]
  wire [31:0] _T_8 = {8'h0,4'h0,2'h0,intrPendReg_17,intrPendReg_16,16'h0}; // @[Exceptions.scala 68:58]
  wire  _T_9 = 6'h5 == masterReg_Addr[7:2]; // @[Conditional.scala 37:30]
  wire [31:0] _T_10 = {localModeReg,31'h0}; // @[Exceptions.scala 69:59]
  wire [31:0] _GEN_0 = _T_9 ? _T_10 : 32'h0; // @[Conditional.scala 39:67 Exceptions.scala 69:43 Exceptions.scala 51:17]
  wire [31:0] _GEN_1 = _T_7 ? _T_8 : _GEN_0; // @[Conditional.scala 39:67 Exceptions.scala 68:43]
  wire [31:0] _GEN_2 = _T_6 ? sourceReg : _GEN_1; // @[Conditional.scala 39:67 Exceptions.scala 67:43]
  wire [31:0] _GEN_3 = _T_5 ? maskReg : _GEN_2; // @[Conditional.scala 39:67 Exceptions.scala 66:43]
  wire [31:0] _GEN_4 = _T_4 ? statusReg : _GEN_3; // @[Conditional.scala 40:58 Exceptions.scala 65:43]
  wire [31:0] _GEN_8 = masterReg_Addr[7] ? vec_MPORT_data : _GEN_4; // @[Exceptions.scala 71:59 Exceptions.scala 72:21]
  wire [1:0] _GEN_9 = masterReg_Cmd == 3'h2 ? 2'h1 : 2'h0; // @[Exceptions.scala 61:37 Exceptions.scala 62:19 Exceptions.scala 50:17]
  wire  _T_14 = masterReg_Cmd == 3'h1; // @[Exceptions.scala 77:22]
  wire [31:0] _GEN_14 = superMode ? masterReg_Data : statusReg; // @[Exceptions.scala 33:22 Exceptions.scala 80:48 Exceptions.scala 23:26]
  wire [1:0] _GEN_15 = superMode ? 2'h1 : 2'h3; // @[Exceptions.scala 33:22 Exceptions.scala 78:19 Exceptions.scala 33:58]
  wire [31:0] _GEN_17 = superMode ? masterReg_Data : sourceReg; // @[Exceptions.scala 33:22 Exceptions.scala 82:48 Exceptions.scala 25:22]
  wire  _GEN_34 = superMode ? intrPendReg_16 & masterReg_Data[16] : intrPendReg_16; // @[Exceptions.scala 33:22 Exceptions.scala 86:25 Exceptions.scala 47:12]
  wire  _GEN_35 = superMode ? intrPendReg_17 & masterReg_Data[17] : intrPendReg_17; // @[Exceptions.scala 33:22 Exceptions.scala 86:25 Exceptions.scala 47:12]
  wire  _T_84 = 6'h4 == masterReg_Addr[7:2]; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_50 = superMode ? 2'h0 : 2'h3; // @[Exceptions.scala 33:22 Exceptions.scala 92:25 Exceptions.scala 33:58]
  wire  _GEN_51 = superMode | sleepReg; // @[Exceptions.scala 33:22 Exceptions.scala 93:20 Exceptions.scala 39:25]
  wire  _GEN_54 = superMode ? localModeReg ^ masterReg_Data[31] : localModeReg; // @[Exceptions.scala 33:22 Exceptions.scala 100:24 Exceptions.scala 30:29]
  wire  _GEN_57 = _T_9 ? _GEN_54 : localModeReg; // @[Conditional.scala 39:67 Exceptions.scala 30:29]
  wire [1:0] _GEN_58 = _T_9 ? _GEN_15 : 2'h1; // @[Conditional.scala 39:67 Exceptions.scala 78:19]
  wire [1:0] _GEN_59 = _T_84 ? _GEN_50 : _GEN_58; // @[Conditional.scala 39:67]
  wire  _GEN_60 = _T_84 ? _GEN_51 : sleepReg; // @[Conditional.scala 39:67 Exceptions.scala 39:25]
  wire  _GEN_63 = _T_84 ? localModeReg : _GEN_57; // @[Conditional.scala 39:67 Exceptions.scala 30:29]
  wire  _GEN_80 = _T_7 ? _GEN_34 : intrPendReg_16; // @[Conditional.scala 39:67 Exceptions.scala 47:12]
  wire  _GEN_81 = _T_7 ? _GEN_35 : intrPendReg_17; // @[Conditional.scala 39:67 Exceptions.scala 47:12]
  wire [1:0] _GEN_96 = _T_7 ? _GEN_15 : _GEN_59; // @[Conditional.scala 39:67]
  wire  _GEN_97 = _T_7 ? sleepReg : _GEN_60; // @[Conditional.scala 39:67 Exceptions.scala 39:25]
  wire  _GEN_100 = _T_7 ? localModeReg : _GEN_63; // @[Conditional.scala 39:67 Exceptions.scala 30:29]
  wire [31:0] _GEN_101 = _T_6 ? _GEN_17 : sourceReg; // @[Conditional.scala 39:67 Exceptions.scala 25:22]
  wire [1:0] _GEN_102 = _T_6 ? _GEN_15 : _GEN_96; // @[Conditional.scala 39:67]
  wire  _GEN_119 = _T_6 ? intrPendReg_16 : _GEN_80; // @[Conditional.scala 39:67 Exceptions.scala 47:12]
  wire  _GEN_120 = _T_6 ? intrPendReg_17 : _GEN_81; // @[Conditional.scala 39:67 Exceptions.scala 47:12]
  wire  _GEN_135 = _T_6 ? sleepReg : _GEN_97; // @[Conditional.scala 39:67 Exceptions.scala 39:25]
  wire  _GEN_138 = _T_6 ? localModeReg : _GEN_100; // @[Conditional.scala 39:67 Exceptions.scala 30:29]
  wire [1:0] _GEN_140 = _T_5 ? _GEN_15 : _GEN_102; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_141 = _T_5 ? sourceReg : _GEN_101; // @[Conditional.scala 39:67 Exceptions.scala 25:22]
  wire  _GEN_158 = _T_5 ? intrPendReg_16 : _GEN_119; // @[Conditional.scala 39:67 Exceptions.scala 47:12]
  wire  _GEN_159 = _T_5 ? intrPendReg_17 : _GEN_120; // @[Conditional.scala 39:67 Exceptions.scala 47:12]
  wire  _GEN_174 = _T_5 ? sleepReg : _GEN_135; // @[Conditional.scala 39:67 Exceptions.scala 39:25]
  wire [31:0] _GEN_178 = _T_4 ? _GEN_14 : statusReg; // @[Conditional.scala 40:58 Exceptions.scala 23:26]
  wire [1:0] _GEN_179 = _T_4 ? _GEN_15 : _GEN_140; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_181 = _T_4 ? sourceReg : _GEN_141; // @[Conditional.scala 40:58 Exceptions.scala 25:22]
  wire  _GEN_198 = _T_4 ? intrPendReg_16 : _GEN_158; // @[Conditional.scala 40:58 Exceptions.scala 47:12]
  wire  _GEN_199 = _T_4 ? intrPendReg_17 : _GEN_159; // @[Conditional.scala 40:58 Exceptions.scala 47:12]
  wire [1:0] _GEN_224 = superMode ? _GEN_179 : 2'h3; // @[Exceptions.scala 33:22 Exceptions.scala 33:58]
  wire  _GEN_227 = masterReg_Addr[7] & superMode; // @[Exceptions.scala 104:59]
  wire [1:0] _GEN_231 = masterReg_Addr[7] ? _GEN_224 : _GEN_179; // @[Exceptions.scala 104:59]
  wire [1:0] _GEN_232 = masterReg_Cmd == 3'h1 ? _GEN_231 : _GEN_9; // @[Exceptions.scala 77:37]
  wire [31:0] _GEN_233 = masterReg_Cmd == 3'h1 ? _GEN_178 : statusReg; // @[Exceptions.scala 77:37 Exceptions.scala 23:26]
  wire [31:0] _GEN_235 = masterReg_Cmd == 3'h1 ? _GEN_181 : sourceReg; // @[Exceptions.scala 77:37 Exceptions.scala 25:22]
  wire  _GEN_252 = masterReg_Cmd == 3'h1 ? _GEN_198 : intrPendReg_16; // @[Exceptions.scala 77:37 Exceptions.scala 47:12]
  wire  _GEN_253 = masterReg_Cmd == 3'h1 ? _GEN_199 : intrPendReg_17; // @[Exceptions.scala 77:37 Exceptions.scala 47:12]
  wire  _GEN_278 = 5'h0 == io_memexc_src ? 1'h0 : excPendReg_0; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_279 = 5'h1 == io_memexc_src ? 1'h0 : excPendReg_1; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_280 = 5'h2 == io_memexc_src ? 1'h0 : excPendReg_2; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_281 = 5'h3 == io_memexc_src ? 1'h0 : excPendReg_3; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_282 = 5'h4 == io_memexc_src ? 1'h0 : excPendReg_4; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_283 = 5'h5 == io_memexc_src ? 1'h0 : excPendReg_5; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_284 = 5'h6 == io_memexc_src ? 1'h0 : excPendReg_6; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_285 = 5'h7 == io_memexc_src ? 1'h0 : excPendReg_7; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_286 = 5'h8 == io_memexc_src ? 1'h0 : excPendReg_8; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_287 = 5'h9 == io_memexc_src ? 1'h0 : excPendReg_9; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_288 = 5'ha == io_memexc_src ? 1'h0 : excPendReg_10; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_289 = 5'hb == io_memexc_src ? 1'h0 : excPendReg_11; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_290 = 5'hc == io_memexc_src ? 1'h0 : excPendReg_12; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_291 = 5'hd == io_memexc_src ? 1'h0 : excPendReg_13; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_292 = 5'he == io_memexc_src ? 1'h0 : excPendReg_14; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_293 = 5'hf == io_memexc_src ? 1'h0 : excPendReg_15; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_294 = 5'h10 == io_memexc_src ? 1'h0 : excPendReg_16; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_295 = 5'h11 == io_memexc_src ? 1'h0 : excPendReg_17; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_296 = 5'h12 == io_memexc_src ? 1'h0 : excPendReg_18; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_297 = 5'h13 == io_memexc_src ? 1'h0 : excPendReg_19; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_298 = 5'h14 == io_memexc_src ? 1'h0 : excPendReg_20; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_299 = 5'h15 == io_memexc_src ? 1'h0 : excPendReg_21; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_300 = 5'h16 == io_memexc_src ? 1'h0 : excPendReg_22; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_301 = 5'h17 == io_memexc_src ? 1'h0 : excPendReg_23; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_302 = 5'h18 == io_memexc_src ? 1'h0 : excPendReg_24; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_303 = 5'h19 == io_memexc_src ? 1'h0 : excPendReg_25; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_304 = 5'h1a == io_memexc_src ? 1'h0 : excPendReg_26; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_305 = 5'h1b == io_memexc_src ? 1'h0 : excPendReg_27; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_306 = 5'h1c == io_memexc_src ? 1'h0 : excPendReg_28; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_307 = 5'h1d == io_memexc_src ? 1'h0 : excPendReg_29; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_308 = 5'h1e == io_memexc_src ? 1'h0 : excPendReg_30; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_309 = 5'h1f == io_memexc_src ? 1'h0 : excPendReg_31; // @[Exceptions.scala 114:28 Exceptions.scala 114:28 Exceptions.scala 46:11]
  wire  _GEN_326 = 5'h10 == io_memexc_src ? 1'h0 : _GEN_252; // @[Exceptions.scala 115:29 Exceptions.scala 115:29]
  wire  _GEN_327 = 5'h11 == io_memexc_src ? 1'h0 : _GEN_253; // @[Exceptions.scala 115:29 Exceptions.scala 115:29]
  wire [33:0] _GEN_560 = {statusReg, 2'h0}; // @[Exceptions.scala 119:31]
  wire [34:0] _T_94 = {{1'd0}, _GEN_560}; // @[Exceptions.scala 119:31]
  wire [34:0] _T_95 = _T_94 | 35'h2; // @[Exceptions.scala 119:43]
  wire [34:0] _GEN_343 = io_ena ? _T_95 : {{3'd0}, _GEN_233}; // @[Exceptions.scala 116:18 Exceptions.scala 119:17]
  wire  _GEN_344 = io_memexc_call ? _GEN_278 : excPendReg_0; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_345 = io_memexc_call ? _GEN_279 : excPendReg_1; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_346 = io_memexc_call ? _GEN_280 : excPendReg_2; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_347 = io_memexc_call ? _GEN_281 : excPendReg_3; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_348 = io_memexc_call ? _GEN_282 : excPendReg_4; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_349 = io_memexc_call ? _GEN_283 : excPendReg_5; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_350 = io_memexc_call ? _GEN_284 : excPendReg_6; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_351 = io_memexc_call ? _GEN_285 : excPendReg_7; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_352 = io_memexc_call ? _GEN_286 : excPendReg_8; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_353 = io_memexc_call ? _GEN_287 : excPendReg_9; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_354 = io_memexc_call ? _GEN_288 : excPendReg_10; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_355 = io_memexc_call ? _GEN_289 : excPendReg_11; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_356 = io_memexc_call ? _GEN_290 : excPendReg_12; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_357 = io_memexc_call ? _GEN_291 : excPendReg_13; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_358 = io_memexc_call ? _GEN_292 : excPendReg_14; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_359 = io_memexc_call ? _GEN_293 : excPendReg_15; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_360 = io_memexc_call ? _GEN_294 : excPendReg_16; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_361 = io_memexc_call ? _GEN_295 : excPendReg_17; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_362 = io_memexc_call ? _GEN_296 : excPendReg_18; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_363 = io_memexc_call ? _GEN_297 : excPendReg_19; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_364 = io_memexc_call ? _GEN_298 : excPendReg_20; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_365 = io_memexc_call ? _GEN_299 : excPendReg_21; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_366 = io_memexc_call ? _GEN_300 : excPendReg_22; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_367 = io_memexc_call ? _GEN_301 : excPendReg_23; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_368 = io_memexc_call ? _GEN_302 : excPendReg_24; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_369 = io_memexc_call ? _GEN_303 : excPendReg_25; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_370 = io_memexc_call ? _GEN_304 : excPendReg_26; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_371 = io_memexc_call ? _GEN_305 : excPendReg_27; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_372 = io_memexc_call ? _GEN_306 : excPendReg_28; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_373 = io_memexc_call ? _GEN_307 : excPendReg_29; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_374 = io_memexc_call ? _GEN_308 : excPendReg_30; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_375 = io_memexc_call ? _GEN_309 : excPendReg_31; // @[Exceptions.scala 113:24 Exceptions.scala 46:11]
  wire  _GEN_392 = io_memexc_call ? _GEN_326 : _GEN_252; // @[Exceptions.scala 113:24]
  wire  _GEN_393 = io_memexc_call ? _GEN_327 : _GEN_253; // @[Exceptions.scala 113:24]
  wire [34:0] _GEN_409 = io_memexc_call ? _GEN_343 : {{3'd0}, _GEN_233}; // @[Exceptions.scala 113:24]
  wire [31:0] _T_96 = {{2'd0}, statusReg[31:2]}; // @[Exceptions.scala 126:30]
  wire [34:0] _GEN_410 = io_ena ? {{3'd0}, _T_96} : _GEN_409; // @[Exceptions.scala 124:18 Exceptions.scala 126:17]
  wire [34:0] _GEN_411 = io_memexc_ret ? _GEN_410 : _GEN_409; // @[Exceptions.scala 123:23]
  reg  REG; // @[Exceptions.scala 132:17]
  wire  intrPend_16 = REG | _GEN_392; // @[Exceptions.scala 132:32 Exceptions.scala 133:22]
  reg  REG_1; // @[Exceptions.scala 132:17]
  wire  intrPend_17 = REG_1 | _GEN_393; // @[Exceptions.scala 132:32 Exceptions.scala 133:22]
  reg [29:0] excBaseReg; // @[Exceptions.scala 138:23]
  reg [29:0] excAddrReg; // @[Exceptions.scala 139:23]
  wire  _GEN_428 = 5'h0 == io_memexc_src | _GEN_344; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_429 = 5'h1 == io_memexc_src | _GEN_345; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_430 = 5'h2 == io_memexc_src | _GEN_346; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_431 = 5'h3 == io_memexc_src | _GEN_347; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_432 = 5'h4 == io_memexc_src | _GEN_348; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_433 = 5'h5 == io_memexc_src | _GEN_349; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_434 = 5'h6 == io_memexc_src | _GEN_350; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_435 = 5'h7 == io_memexc_src | _GEN_351; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_436 = 5'h8 == io_memexc_src | _GEN_352; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_437 = 5'h9 == io_memexc_src | _GEN_353; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_438 = 5'ha == io_memexc_src | _GEN_354; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_439 = 5'hb == io_memexc_src | _GEN_355; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_440 = 5'hc == io_memexc_src | _GEN_356; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_441 = 5'hd == io_memexc_src | _GEN_357; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_442 = 5'he == io_memexc_src | _GEN_358; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_443 = 5'hf == io_memexc_src | _GEN_359; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_444 = 5'h10 == io_memexc_src | _GEN_360; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_445 = 5'h11 == io_memexc_src | _GEN_361; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_446 = 5'h12 == io_memexc_src | _GEN_362; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_447 = 5'h13 == io_memexc_src | _GEN_363; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_448 = 5'h14 == io_memexc_src | _GEN_364; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_449 = 5'h15 == io_memexc_src | _GEN_365; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_450 = 5'h16 == io_memexc_src | _GEN_366; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_451 = 5'h17 == io_memexc_src | _GEN_367; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_452 = 5'h18 == io_memexc_src | _GEN_368; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_453 = 5'h19 == io_memexc_src | _GEN_369; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_454 = 5'h1a == io_memexc_src | _GEN_370; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_455 = 5'h1b == io_memexc_src | _GEN_371; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_456 = 5'h1c == io_memexc_src | _GEN_372; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_457 = 5'h1d == io_memexc_src | _GEN_373; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_458 = 5'h1e == io_memexc_src | _GEN_374; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  _GEN_459 = 5'h1f == io_memexc_src | _GEN_375; // @[Exceptions.scala 141:28 Exceptions.scala 141:28]
  wire  excPend_0 = io_memexc_exc ? _GEN_428 : _GEN_344; // @[Exceptions.scala 140:23]
  wire  excPend_1 = io_memexc_exc ? _GEN_429 : _GEN_345; // @[Exceptions.scala 140:23]
  wire  excPend_2 = io_memexc_exc ? _GEN_430 : _GEN_346; // @[Exceptions.scala 140:23]
  wire  excPend_3 = io_memexc_exc ? _GEN_431 : _GEN_347; // @[Exceptions.scala 140:23]
  wire  excPend_4 = io_memexc_exc ? _GEN_432 : _GEN_348; // @[Exceptions.scala 140:23]
  wire  excPend_5 = io_memexc_exc ? _GEN_433 : _GEN_349; // @[Exceptions.scala 140:23]
  wire  excPend_6 = io_memexc_exc ? _GEN_434 : _GEN_350; // @[Exceptions.scala 140:23]
  wire  excPend_7 = io_memexc_exc ? _GEN_435 : _GEN_351; // @[Exceptions.scala 140:23]
  wire  excPend_8 = io_memexc_exc ? _GEN_436 : _GEN_352; // @[Exceptions.scala 140:23]
  wire  excPend_9 = io_memexc_exc ? _GEN_437 : _GEN_353; // @[Exceptions.scala 140:23]
  wire  excPend_10 = io_memexc_exc ? _GEN_438 : _GEN_354; // @[Exceptions.scala 140:23]
  wire  excPend_11 = io_memexc_exc ? _GEN_439 : _GEN_355; // @[Exceptions.scala 140:23]
  wire  excPend_12 = io_memexc_exc ? _GEN_440 : _GEN_356; // @[Exceptions.scala 140:23]
  wire  excPend_13 = io_memexc_exc ? _GEN_441 : _GEN_357; // @[Exceptions.scala 140:23]
  wire  excPend_14 = io_memexc_exc ? _GEN_442 : _GEN_358; // @[Exceptions.scala 140:23]
  wire  excPend_15 = io_memexc_exc ? _GEN_443 : _GEN_359; // @[Exceptions.scala 140:23]
  wire  excPend_16 = io_memexc_exc ? _GEN_444 : _GEN_360; // @[Exceptions.scala 140:23]
  wire  excPend_17 = io_memexc_exc ? _GEN_445 : _GEN_361; // @[Exceptions.scala 140:23]
  wire  excPend_18 = io_memexc_exc ? _GEN_446 : _GEN_362; // @[Exceptions.scala 140:23]
  wire  excPend_19 = io_memexc_exc ? _GEN_447 : _GEN_363; // @[Exceptions.scala 140:23]
  wire  excPend_20 = io_memexc_exc ? _GEN_448 : _GEN_364; // @[Exceptions.scala 140:23]
  wire  excPend_21 = io_memexc_exc ? _GEN_449 : _GEN_365; // @[Exceptions.scala 140:23]
  wire  excPend_22 = io_memexc_exc ? _GEN_450 : _GEN_366; // @[Exceptions.scala 140:23]
  wire  excPend_23 = io_memexc_exc ? _GEN_451 : _GEN_367; // @[Exceptions.scala 140:23]
  wire  excPend_24 = io_memexc_exc ? _GEN_452 : _GEN_368; // @[Exceptions.scala 140:23]
  wire  excPend_25 = io_memexc_exc ? _GEN_453 : _GEN_369; // @[Exceptions.scala 140:23]
  wire  excPend_26 = io_memexc_exc ? _GEN_454 : _GEN_370; // @[Exceptions.scala 140:23]
  wire  excPend_27 = io_memexc_exc ? _GEN_455 : _GEN_371; // @[Exceptions.scala 140:23]
  wire  excPend_28 = io_memexc_exc ? _GEN_456 : _GEN_372; // @[Exceptions.scala 140:23]
  wire  excPend_29 = io_memexc_exc ? _GEN_457 : _GEN_373; // @[Exceptions.scala 140:23]
  wire  excPend_30 = io_memexc_exc ? _GEN_458 : _GEN_374; // @[Exceptions.scala 140:23]
  wire  excPend_31 = io_memexc_exc ? _GEN_459 : _GEN_375; // @[Exceptions.scala 140:23]
  reg [4:0] srcReg; // @[Exceptions.scala 152:23]
  wire [4:0] _GEN_508 = intrPend_17 & maskReg[17] ? 5'h11 : 5'h0; // @[Exceptions.scala 155:51 Exceptions.scala 155:57]
  wire [4:0] _GEN_509 = intrPend_16 & maskReg[16] ? 5'h10 : _GEN_508; // @[Exceptions.scala 155:51 Exceptions.scala 155:57]
  wire [4:0] _GEN_526 = excPend_31 ? 5'h1f : _GEN_509; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_527 = excPend_30 ? 5'h1e : _GEN_526; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_528 = excPend_29 ? 5'h1d : _GEN_527; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_529 = excPend_28 ? 5'h1c : _GEN_528; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_530 = excPend_27 ? 5'h1b : _GEN_529; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_531 = excPend_26 ? 5'h1a : _GEN_530; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_532 = excPend_25 ? 5'h19 : _GEN_531; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_533 = excPend_24 ? 5'h18 : _GEN_532; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_534 = excPend_23 ? 5'h17 : _GEN_533; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_535 = excPend_22 ? 5'h16 : _GEN_534; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_536 = excPend_21 ? 5'h15 : _GEN_535; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_537 = excPend_20 ? 5'h14 : _GEN_536; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_538 = excPend_19 ? 5'h13 : _GEN_537; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_539 = excPend_18 ? 5'h12 : _GEN_538; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_540 = excPend_17 ? 5'h11 : _GEN_539; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_541 = excPend_16 ? 5'h10 : _GEN_540; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_542 = excPend_15 ? 5'hf : _GEN_541; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_543 = excPend_14 ? 5'he : _GEN_542; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_544 = excPend_13 ? 5'hd : _GEN_543; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_545 = excPend_12 ? 5'hc : _GEN_544; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_546 = excPend_11 ? 5'hb : _GEN_545; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_547 = excPend_10 ? 5'ha : _GEN_546; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_548 = excPend_9 ? 5'h9 : _GEN_547; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_549 = excPend_8 ? 5'h8 : _GEN_548; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_550 = excPend_7 ? 5'h7 : _GEN_549; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_551 = excPend_6 ? 5'h6 : _GEN_550; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_552 = excPend_5 ? 5'h5 : _GEN_551; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [4:0] _GEN_553 = excPend_4 ? 5'h4 : _GEN_552; // @[Exceptions.scala 158:22 Exceptions.scala 158:28]
  wire [7:0] lo_lo_1 = {excPend_7,excPend_6,excPend_5,excPend_4,excPend_3,excPend_2,excPend_1,excPend_0}; // @[Exceptions.scala 162:29]
  wire [15:0] lo_1 = {excPend_15,excPend_14,excPend_13,excPend_12,excPend_11,excPend_10,excPend_9,excPend_8,lo_lo_1}; // @[Exceptions.scala 162:29]
  wire [7:0] hi_lo_1 = {excPend_23,excPend_22,excPend_21,excPend_20,excPend_19,excPend_18,excPend_17,excPend_16}; // @[Exceptions.scala 162:29]
  wire [31:0] _T_193 = {excPend_31,excPend_30,excPend_29,excPend_28,excPend_27,excPend_26,excPend_25,excPend_24,hi_lo_1,
    lo_1}; // @[Exceptions.scala 162:29]
  reg  exc; // @[Exceptions.scala 162:20]
  wire [31:0] _T_195 = {8'h0,4'h0,2'h0,intrPend_17,intrPend_16,16'h0}; // @[Exceptions.scala 163:32]
  wire [31:0] _T_196 = _T_195 & maskReg; // @[Exceptions.scala 163:39]
  reg  intr; // @[Exceptions.scala 163:21]
  wire  _T_198 = intr & intrEna; // @[Exceptions.scala 166:27]
  assign vec_MPORT_addr = masterReg_Addr[6:2];
  assign vec_MPORT_data = vec[vec_MPORT_addr];
  assign vec_MPORT_1_data = masterReg_Data;
  assign vec_MPORT_1_addr = masterReg_Addr[6:2];
  assign vec_MPORT_1_mask = 1'h1;
  assign vec_MPORT_1_en = _T_14 & _GEN_227;
  assign vecDup_MPORT_3_addr = srcReg;
  assign vecDup_MPORT_3_data = vecDup[vecDup_MPORT_3_addr];
  assign vecDup_MPORT_2_data = masterReg_Data;
  assign vecDup_MPORT_2_addr = masterReg_Addr[6:2];
  assign vecDup_MPORT_2_mask = 1'h1;
  assign vecDup_MPORT_2_en = _T_14 & _GEN_227;
  assign io_ocp_S_Resp = sleepReg & (exc | _T_198) ? 2'h1 : _GEN_232; // @[Exceptions.scala 175:61 Exceptions.scala 176:19]
  assign io_ocp_S_Data = masterReg_Cmd == 3'h2 ? _GEN_8 : 32'h0; // @[Exceptions.scala 61:37 Exceptions.scala 51:17]
  assign io_excdec_exc = exc; // @[Exceptions.scala 165:19]
  assign io_excdec_excBase = excBaseReg; // @[Exceptions.scala 171:21]
  assign io_excdec_excAddr = excAddrReg; // @[Exceptions.scala 172:21]
  assign io_excdec_intr = intr & intrEna; // @[Exceptions.scala 166:27]
  assign io_excdec_addr = vecDup_MPORT_3_data; // @[Exceptions.scala 167:19]
  assign io_excdec_src = srcReg; // @[Exceptions.scala 168:19]
  assign io_excdec_local = localModeReg; // @[Exceptions.scala 169:19]
  always @(posedge clock) begin
    if(vec_MPORT_1_en & vec_MPORT_1_mask) begin
      vec[vec_MPORT_1_addr] <= vec_MPORT_1_data;
    end
    if(vecDup_MPORT_2_en & vecDup_MPORT_2_mask) begin
      vecDup[vecDup_MPORT_2_addr] <= vecDup_MPORT_2_data;
    end
    masterReg_Cmd <= io_ocp_M_Cmd; // @[Exceptions.scala 21:26]
    masterReg_Addr <= io_ocp_M_Addr; // @[Exceptions.scala 21:26]
    masterReg_Data <= io_ocp_M_Data; // @[Exceptions.scala 21:26]
    if (reset) begin // @[Exceptions.scala 23:26]
      statusReg <= 32'h2; // @[Exceptions.scala 23:26]
    end else begin
      statusReg <= _GEN_411[31:0];
    end
    if (masterReg_Cmd == 3'h1) begin // @[Exceptions.scala 77:37]
      if (!(_T_4)) begin // @[Conditional.scala 40:58]
        if (_T_5) begin // @[Conditional.scala 39:67]
          if (superMode) begin // @[Exceptions.scala 33:22]
            maskReg <= masterReg_Data; // @[Exceptions.scala 81:46]
          end
        end
      end
    end
    if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (io_ena) begin // @[Exceptions.scala 116:18]
        sourceReg <= {{27'd0}, io_memexc_src}; // @[Exceptions.scala 117:17]
      end else begin
        sourceReg <= _GEN_235;
      end
    end else begin
      sourceReg <= _GEN_235;
    end
    if (reset) begin // @[Exceptions.scala 30:29]
      localModeReg <= 1'h0; // @[Exceptions.scala 30:29]
    end else if (masterReg_Cmd == 3'h1) begin // @[Exceptions.scala 77:37]
      if (!(_T_4)) begin // @[Conditional.scala 40:58]
        if (!(_T_5)) begin // @[Conditional.scala 39:67]
          localModeReg <= _GEN_138;
        end
      end
    end
    if (reset) begin // @[Exceptions.scala 39:25]
      sleepReg <= 1'h0; // @[Exceptions.scala 39:25]
    end else if (sleepReg & (exc | _T_198)) begin // @[Exceptions.scala 175:61]
      sleepReg <= 1'h0; // @[Exceptions.scala 177:14]
    end else if (masterReg_Cmd == 3'h1) begin // @[Exceptions.scala 77:37]
      if (!(_T_4)) begin // @[Conditional.scala 40:58]
        sleepReg <= _GEN_174;
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_0 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_0 <= _GEN_428;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h0 == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_0 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_1 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_1 <= _GEN_429;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h1 == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_1 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_2 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_2 <= _GEN_430;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h2 == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_2 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_3 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_3 <= _GEN_431;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h3 == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_3 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_4 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_4 <= _GEN_432;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h4 == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_4 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_5 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_5 <= _GEN_433;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h5 == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_5 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_6 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_6 <= _GEN_434;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h6 == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_6 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_7 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_7 <= _GEN_435;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h7 == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_7 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_8 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_8 <= _GEN_436;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h8 == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_8 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_9 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_9 <= _GEN_437;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h9 == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_9 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_10 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_10 <= _GEN_438;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'ha == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_10 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_11 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_11 <= _GEN_439;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'hb == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_11 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_12 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_12 <= _GEN_440;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'hc == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_12 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_13 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_13 <= _GEN_441;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'hd == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_13 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_14 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_14 <= _GEN_442;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'he == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_14 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_15 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_15 <= _GEN_443;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'hf == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_15 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_16 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_16 <= _GEN_444;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h10 == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_16 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_17 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_17 <= _GEN_445;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h11 == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_17 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_18 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_18 <= _GEN_446;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h12 == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_18 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_19 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_19 <= _GEN_447;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h13 == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_19 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_20 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_20 <= _GEN_448;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h14 == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_20 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_21 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_21 <= _GEN_449;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h15 == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_21 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_22 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_22 <= _GEN_450;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h16 == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_22 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_23 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_23 <= _GEN_451;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h17 == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_23 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_24 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_24 <= _GEN_452;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h18 == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_24 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_25 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_25 <= _GEN_453;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h19 == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_25 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_26 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_26 <= _GEN_454;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h1a == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_26 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_27 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_27 <= _GEN_455;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h1b == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_27 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_28 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_28 <= _GEN_456;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h1c == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_28 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_29 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_29 <= _GEN_457;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h1d == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_29 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_30 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_30 <= _GEN_458;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h1e == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_30 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 43:28]
      excPendReg_31 <= 1'h0; // @[Exceptions.scala 43:28]
    end else if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excPendReg_31 <= _GEN_459;
    end else if (io_memexc_call) begin // @[Exceptions.scala 113:24]
      if (5'h1f == io_memexc_src) begin // @[Exceptions.scala 114:28]
        excPendReg_31 <= 1'h0; // @[Exceptions.scala 114:28]
      end
    end
    if (reset) begin // @[Exceptions.scala 45:28]
      intrPendReg_16 <= 1'h0; // @[Exceptions.scala 45:28]
    end else begin
      intrPendReg_16 <= intrPend_16; // @[Exceptions.scala 148:15]
    end
    if (reset) begin // @[Exceptions.scala 45:28]
      intrPendReg_17 <= 1'h0; // @[Exceptions.scala 45:28]
    end else begin
      intrPendReg_17 <= intrPend_17; // @[Exceptions.scala 148:15]
    end
    REG <= io_intrs_0; // @[Exceptions.scala 132:17]
    REG_1 <= io_intrs_1; // @[Exceptions.scala 132:17]
    if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excBaseReg <= io_memexc_excBase; // @[Exceptions.scala 142:16]
    end
    if (io_memexc_exc) begin // @[Exceptions.scala 140:23]
      excAddrReg <= io_memexc_excAddr; // @[Exceptions.scala 143:16]
    end
    if (excPend_0) begin // @[Exceptions.scala 158:22]
      srcReg <= 5'h0; // @[Exceptions.scala 158:28]
    end else if (excPend_1) begin // @[Exceptions.scala 158:22]
      srcReg <= 5'h1; // @[Exceptions.scala 158:28]
    end else if (excPend_2) begin // @[Exceptions.scala 158:22]
      srcReg <= 5'h2; // @[Exceptions.scala 158:28]
    end else if (excPend_3) begin // @[Exceptions.scala 158:22]
      srcReg <= 5'h3; // @[Exceptions.scala 158:28]
    end else begin
      srcReg <= _GEN_553;
    end
    exc <= _T_193 != 32'h0; // @[Exceptions.scala 162:36]
    intr <= _T_196 != 32'h0; // @[Exceptions.scala 163:50]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    vec[initvar] = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    vecDup[initvar] = _RAND_1[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  masterReg_Cmd = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  masterReg_Addr = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  masterReg_Data = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  statusReg = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  maskReg = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  sourceReg = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  localModeReg = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  sleepReg = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  excPendReg_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  excPendReg_1 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  excPendReg_2 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  excPendReg_3 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  excPendReg_4 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  excPendReg_5 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  excPendReg_6 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  excPendReg_7 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  excPendReg_8 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  excPendReg_9 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  excPendReg_10 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  excPendReg_11 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  excPendReg_12 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  excPendReg_13 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  excPendReg_14 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  excPendReg_15 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  excPendReg_16 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  excPendReg_17 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  excPendReg_18 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  excPendReg_19 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  excPendReg_20 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  excPendReg_21 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  excPendReg_22 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  excPendReg_23 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  excPendReg_24 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  excPendReg_25 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  excPendReg_26 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  excPendReg_27 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  excPendReg_28 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  excPendReg_29 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  excPendReg_30 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  excPendReg_31 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  intrPendReg_16 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  intrPendReg_17 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  REG = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  REG_1 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  excBaseReg = _RAND_46[29:0];
  _RAND_47 = {1{`RANDOM}};
  excAddrReg = _RAND_47[29:0];
  _RAND_48 = {1{`RANDOM}};
  srcReg = _RAND_48[4:0];
  _RAND_49 = {1{`RANDOM}};
  exc = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  intr = _RAND_50[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module NullCache(
  input         clock,
  input         reset,
  input  [2:0]  io_master_M_Cmd,
  input  [31:0] io_master_M_Addr,
  output [1:0]  io_master_S_Resp,
  output [31:0] io_master_S_Data,
  output [2:0]  io_slave_M_Cmd,
  output [31:0] io_slave_M_Addr,
  input  [1:0]  io_slave_S_Resp,
  input  [31:0] io_slave_S_Data,
  input         io_slave_S_CmdAccept
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stateReg; // @[NullCache.scala 32:21]
  reg [1:0] burstCntReg; // @[NullCache.scala 33:24]
  reg [1:0] posReg; // @[NullCache.scala 34:19]
  reg [2:0] masterReg_Cmd; // @[NullCache.scala 37:22]
  reg [31:0] masterReg_Addr; // @[NullCache.scala 37:22]
  reg [1:0] slaveReg_Resp; // @[NullCache.scala 40:21]
  reg [31:0] slaveReg_Data; // @[NullCache.scala 40:21]
  wire [27:0] hi = masterReg_Addr[31:4]; // @[NullCache.scala 51:40]
  wire [1:0] _GEN_7 = burstCntReg == 2'h3 ? 2'h2 : stateReg; // @[NullCache.scala 66:50 NullCache.scala 67:18 NullCache.scala 32:21]
  wire [1:0] _T_10 = burstCntReg + 2'h1; // @[NullCache.scala 69:34]
  wire [1:0] _GEN_8 = io_slave_S_Resp != 2'h0 ? _GEN_7 : stateReg; // @[NullCache.scala 65:44 NullCache.scala 32:21]
  wire [1:0] _GEN_12 = stateReg == 2'h1 ? _GEN_8 : stateReg; // @[NullCache.scala 61:27 NullCache.scala 32:21]
  wire [1:0] _GEN_16 = stateReg == 2'h2 ? 2'h0 : _GEN_12; // @[NullCache.scala 73:31 NullCache.scala 75:14]
  assign io_master_S_Resp = stateReg == 2'h2 ? slaveReg_Resp : 2'h0; // @[NullCache.scala 73:31 NullCache.scala 74:17 NullCache.scala 57:20]
  assign io_master_S_Data = stateReg == 2'h2 ? slaveReg_Data : 32'h0; // @[NullCache.scala 73:31 NullCache.scala 74:17 NullCache.scala 58:20]
  assign io_slave_M_Cmd = masterReg_Cmd == 3'h2 ? 3'h2 : 3'h0; // @[NullCache.scala 79:37 NullCache.scala 80:20 NullCache.scala 50:18]
  assign io_slave_M_Addr = {hi,4'h0}; // @[Cat.scala 30:58]
  always @(posedge clock) begin
    if (reset) begin // @[NullCache.scala 32:21]
      stateReg <= 2'h0; // @[NullCache.scala 32:21]
    end else if (masterReg_Cmd == 3'h2) begin // @[NullCache.scala 79:37]
      if (io_slave_S_CmdAccept) begin // @[NullCache.scala 81:44]
        stateReg <= 2'h1; // @[NullCache.scala 82:16]
      end else begin
        stateReg <= _GEN_16;
      end
    end else begin
      stateReg <= _GEN_16;
    end
    if (reset) begin // @[NullCache.scala 33:24]
      burstCntReg <= 2'h0; // @[NullCache.scala 33:24]
    end else if (stateReg == 2'h1) begin // @[NullCache.scala 61:27]
      if (io_slave_S_Resp != 2'h0) begin // @[NullCache.scala 65:44]
        burstCntReg <= _T_10; // @[NullCache.scala 69:19]
      end
    end
    if (masterReg_Cmd == 3'h2) begin // @[NullCache.scala 79:37]
      if (io_slave_S_CmdAccept) begin // @[NullCache.scala 81:44]
        posReg <= masterReg_Addr[3:2]; // @[NullCache.scala 83:14]
      end
    end
    if (reset) begin // @[NullCache.scala 45:15]
      masterReg_Cmd <= 3'h0; // @[NullCache.scala 46:19]
    end else if (masterReg_Cmd != 3'h2 | io_slave_S_CmdAccept) begin // @[NullCache.scala 42:73]
      masterReg_Cmd <= io_master_M_Cmd; // @[NullCache.scala 43:15]
    end
    if (masterReg_Cmd != 3'h2 | io_slave_S_CmdAccept) begin // @[NullCache.scala 42:73]
      masterReg_Addr <= io_master_M_Addr; // @[NullCache.scala 43:15]
    end
    if (stateReg == 2'h1) begin // @[NullCache.scala 61:27]
      if (burstCntReg == posReg) begin // @[NullCache.scala 62:34]
        slaveReg_Resp <= io_slave_S_Resp; // @[NullCache.scala 63:16]
      end
    end
    if (stateReg == 2'h1) begin // @[NullCache.scala 61:27]
      if (burstCntReg == posReg) begin // @[NullCache.scala 62:34]
        slaveReg_Data <= io_slave_S_Data; // @[NullCache.scala 63:16]
      end
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
  stateReg = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  burstCntReg = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  posReg = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  masterReg_Cmd = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  masterReg_Addr = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  slaveReg_Resp = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  slaveReg_Data = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module WriteNoBuffer(
  input         clock,
  input         reset,
  input  [2:0]  io_readMaster_M_Cmd,
  input  [31:0] io_readMaster_M_Addr,
  input  [31:0] io_readMaster_M_Data,
  input         io_readMaster_M_DataValid,
  input  [3:0]  io_readMaster_M_DataByteEn,
  output [1:0]  io_readMaster_S_Resp,
  output [31:0] io_readMaster_S_Data,
  output        io_readMaster_S_CmdAccept,
  output        io_readMaster_S_DataAccept,
  input  [2:0]  io_writeMaster_M_Cmd,
  input  [31:0] io_writeMaster_M_Addr,
  input  [31:0] io_writeMaster_M_Data,
  input  [3:0]  io_writeMaster_M_ByteEn,
  output [1:0]  io_writeMaster_S_Resp,
  output [2:0]  io_slave_M_Cmd,
  output [31:0] io_slave_M_Addr,
  output [31:0] io_slave_M_Data,
  output        io_slave_M_DataValid,
  output [3:0]  io_slave_M_DataByteEn,
  input  [1:0]  io_slave_S_Resp,
  input  [31:0] io_slave_S_Data,
  input         io_slave_S_CmdAccept,
  input         io_slave_S_DataAccept
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] state; // @[WriteNoBuffer.scala 68:18]
  reg [1:0] cntReg; // @[WriteNoBuffer.scala 69:19]
  reg [31:0] writeMasterReg_Addr; // @[WriteNoBuffer.scala 72:27]
  reg [31:0] writeMasterReg_Data; // @[WriteNoBuffer.scala 72:27]
  reg [3:0] writeMasterReg_ByteEn; // @[WriteNoBuffer.scala 72:27]
  wire [1:0] wrPos = writeMasterReg_Addr[3:2]; // @[WriteNoBuffer.scala 82:34]
  wire [27:0] hi = writeMasterReg_Addr[31:4]; // @[WriteNoBuffer.scala 89:49]
  wire [31:0] _T_2 = {hi,4'h0}; // @[Cat.scala 30:58]
  wire [2:0] _GEN_0 = cntReg == 2'h0 ? 3'h1 : io_readMaster_M_Cmd; // @[WriteNoBuffer.scala 87:30 WriteNoBuffer.scala 88:22 WriteNoBuffer.scala 80:14]
  wire [31:0] _GEN_1 = cntReg == 2'h0 ? _T_2 : io_readMaster_M_Addr; // @[WriteNoBuffer.scala 87:30 WriteNoBuffer.scala 89:23 WriteNoBuffer.scala 80:14]
  wire [3:0] _GEN_2 = cntReg == wrPos ? writeMasterReg_ByteEn : 4'h0; // @[WriteNoBuffer.scala 95:28 WriteNoBuffer.scala 96:29 WriteNoBuffer.scala 94:27]
  wire [1:0] _T_6 = cntReg + 2'h1; // @[WriteNoBuffer.scala 99:24]
  wire [1:0] _GEN_4 = cntReg == 2'h3 ? 2'h2 : state; // @[WriteNoBuffer.scala 101:44 WriteNoBuffer.scala 102:13 WriteNoBuffer.scala 68:18]
  wire [1:0] _GEN_5 = state == 2'h1 ? 2'h0 : io_slave_S_Resp; // @[WriteNoBuffer.scala 85:25 WriteNoBuffer.scala 86:26 WriteNoBuffer.scala 75:19]
  wire [1:0] _GEN_12 = state == 2'h1 ? _GEN_4 : state; // @[WriteNoBuffer.scala 85:25 WriteNoBuffer.scala 68:18]
  assign io_readMaster_S_Resp = state == 2'h2 ? 2'h0 : _GEN_5; // @[WriteNoBuffer.scala 105:29 WriteNoBuffer.scala 106:26]
  assign io_readMaster_S_Data = io_slave_S_Data; // @[WriteNoBuffer.scala 75:19]
  assign io_readMaster_S_CmdAccept = io_slave_S_CmdAccept; // @[WriteNoBuffer.scala 75:19]
  assign io_readMaster_S_DataAccept = io_slave_S_DataAccept; // @[WriteNoBuffer.scala 75:19]
  assign io_writeMaster_S_Resp = state == 2'h2 ? io_slave_S_Resp : 2'h0; // @[WriteNoBuffer.scala 105:29 WriteNoBuffer.scala 107:27 WriteNoBuffer.scala 77:25]
  assign io_slave_M_Cmd = state == 2'h1 ? _GEN_0 : io_readMaster_M_Cmd; // @[WriteNoBuffer.scala 85:25 WriteNoBuffer.scala 80:14]
  assign io_slave_M_Addr = state == 2'h1 ? _GEN_1 : io_readMaster_M_Addr; // @[WriteNoBuffer.scala 85:25 WriteNoBuffer.scala 80:14]
  assign io_slave_M_Data = state == 2'h1 ? writeMasterReg_Data : io_readMaster_M_Data; // @[WriteNoBuffer.scala 85:25 WriteNoBuffer.scala 93:21 WriteNoBuffer.scala 80:14]
  assign io_slave_M_DataValid = state == 2'h1 | io_readMaster_M_DataValid; // @[WriteNoBuffer.scala 85:25 WriteNoBuffer.scala 92:26 WriteNoBuffer.scala 80:14]
  assign io_slave_M_DataByteEn = state == 2'h1 ? _GEN_2 : io_readMaster_M_DataByteEn; // @[WriteNoBuffer.scala 85:25 WriteNoBuffer.scala 80:14]
  always @(posedge clock) begin
    if (reset) begin // @[WriteNoBuffer.scala 68:18]
      state <= 2'h0; // @[WriteNoBuffer.scala 68:18]
    end else if (io_writeMaster_M_Cmd == 3'h1) begin // @[WriteNoBuffer.scala 117:44]
      state <= 2'h1; // @[WriteNoBuffer.scala 118:11]
    end else if (state == 2'h2) begin // @[WriteNoBuffer.scala 105:29]
      if (io_slave_S_Resp != 2'h0) begin // @[WriteNoBuffer.scala 108:44]
        state <= 2'h0; // @[WriteNoBuffer.scala 109:13]
      end else begin
        state <= _GEN_12;
      end
    end else begin
      state <= _GEN_12;
    end
    if (reset) begin // @[WriteNoBuffer.scala 69:19]
      cntReg <= 2'h0; // @[WriteNoBuffer.scala 69:19]
    end else if (state == 2'h1) begin // @[WriteNoBuffer.scala 85:25]
      if (io_slave_S_DataAccept) begin // @[WriteNoBuffer.scala 98:45]
        cntReg <= _T_6; // @[WriteNoBuffer.scala 99:14]
      end
    end
    if (state != 2'h1) begin // @[WriteNoBuffer.scala 112:25]
      writeMasterReg_Addr <= io_writeMaster_M_Addr; // @[WriteNoBuffer.scala 113:20]
    end
    if (state != 2'h1) begin // @[WriteNoBuffer.scala 112:25]
      writeMasterReg_Data <= io_writeMaster_M_Data; // @[WriteNoBuffer.scala 113:20]
    end
    if (state != 2'h1) begin // @[WriteNoBuffer.scala 112:25]
      writeMasterReg_ByteEn <= io_writeMaster_M_ByteEn; // @[WriteNoBuffer.scala 113:20]
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
  state = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  cntReg = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  writeMasterReg_Addr = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  writeMasterReg_Data = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  writeMasterReg_ByteEn = _RAND_4[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module NullStackCache(
  input         clock,
  input         reset,
  input         io_ena_in,
  input  [2:0]  io_exsc_op,
  input  [31:0] io_exsc_opData,
  input  [31:0] io_exsc_opOff,
  output [31:0] io_scex_stackTop,
  output [31:0] io_scex_memTop,
  input  [2:0]  io_fromCPU_M_Cmd,
  input  [31:0] io_fromCPU_M_Addr,
  input  [31:0] io_fromCPU_M_Data,
  input  [3:0]  io_fromCPU_M_ByteEn,
  output [1:0]  io_fromCPU_S_Resp,
  output [31:0] io_fromCPU_S_Data,
  output [2:0]  io_toMemory_M_Cmd,
  output [31:0] io_toMemory_M_Addr,
  output [31:0] io_toMemory_M_Data,
  output        io_toMemory_M_DataValid,
  output [3:0]  io_toMemory_M_DataByteEn,
  input  [1:0]  io_toMemory_S_Resp,
  input  [31:0] io_toMemory_S_Data,
  input         io_toMemory_S_CmdAccept,
  input         io_toMemory_S_DataAccept
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  nc_clock; // @[NullStackCache.scala 78:18]
  wire  nc_reset; // @[NullStackCache.scala 78:18]
  wire [2:0] nc_io_master_M_Cmd; // @[NullStackCache.scala 78:18]
  wire [31:0] nc_io_master_M_Addr; // @[NullStackCache.scala 78:18]
  wire [1:0] nc_io_master_S_Resp; // @[NullStackCache.scala 78:18]
  wire [31:0] nc_io_master_S_Data; // @[NullStackCache.scala 78:18]
  wire [2:0] nc_io_slave_M_Cmd; // @[NullStackCache.scala 78:18]
  wire [31:0] nc_io_slave_M_Addr; // @[NullStackCache.scala 78:18]
  wire [1:0] nc_io_slave_S_Resp; // @[NullStackCache.scala 78:18]
  wire [31:0] nc_io_slave_S_Data; // @[NullStackCache.scala 78:18]
  wire  nc_io_slave_S_CmdAccept; // @[NullStackCache.scala 78:18]
  wire  wc_clock; // @[NullStackCache.scala 83:18]
  wire  wc_reset; // @[NullStackCache.scala 83:18]
  wire [2:0] wc_io_readMaster_M_Cmd; // @[NullStackCache.scala 83:18]
  wire [31:0] wc_io_readMaster_M_Addr; // @[NullStackCache.scala 83:18]
  wire [31:0] wc_io_readMaster_M_Data; // @[NullStackCache.scala 83:18]
  wire  wc_io_readMaster_M_DataValid; // @[NullStackCache.scala 83:18]
  wire [3:0] wc_io_readMaster_M_DataByteEn; // @[NullStackCache.scala 83:18]
  wire [1:0] wc_io_readMaster_S_Resp; // @[NullStackCache.scala 83:18]
  wire [31:0] wc_io_readMaster_S_Data; // @[NullStackCache.scala 83:18]
  wire  wc_io_readMaster_S_CmdAccept; // @[NullStackCache.scala 83:18]
  wire  wc_io_readMaster_S_DataAccept; // @[NullStackCache.scala 83:18]
  wire [2:0] wc_io_writeMaster_M_Cmd; // @[NullStackCache.scala 83:18]
  wire [31:0] wc_io_writeMaster_M_Addr; // @[NullStackCache.scala 83:18]
  wire [31:0] wc_io_writeMaster_M_Data; // @[NullStackCache.scala 83:18]
  wire [3:0] wc_io_writeMaster_M_ByteEn; // @[NullStackCache.scala 83:18]
  wire [1:0] wc_io_writeMaster_S_Resp; // @[NullStackCache.scala 83:18]
  wire [2:0] wc_io_slave_M_Cmd; // @[NullStackCache.scala 83:18]
  wire [31:0] wc_io_slave_M_Addr; // @[NullStackCache.scala 83:18]
  wire [31:0] wc_io_slave_M_Data; // @[NullStackCache.scala 83:18]
  wire  wc_io_slave_M_DataValid; // @[NullStackCache.scala 83:18]
  wire [3:0] wc_io_slave_M_DataByteEn; // @[NullStackCache.scala 83:18]
  wire [1:0] wc_io_slave_S_Resp; // @[NullStackCache.scala 83:18]
  wire [31:0] wc_io_slave_S_Data; // @[NullStackCache.scala 83:18]
  wire  wc_io_slave_S_CmdAccept; // @[NullStackCache.scala 83:18]
  wire  wc_io_slave_S_DataAccept; // @[NullStackCache.scala 83:18]
  reg [31:0] stackTopReg; // @[NullStackCache.scala 66:24]
  reg [31:0] memTopReg; // @[NullStackCache.scala 68:22]
  wire  _T_5 = 3'h0 == io_exsc_op; // @[Conditional.scala 37:30]
  wire  _T_6 = 3'h1 == io_exsc_op; // @[Conditional.scala 37:30]
  wire  _T_7 = 3'h2 == io_exsc_op; // @[Conditional.scala 37:30]
  wire  _T_8 = 3'h4 == io_exsc_op; // @[Conditional.scala 37:30]
  wire  _T_9 = 3'h5 == io_exsc_op; // @[Conditional.scala 37:30]
  wire [31:0] _T_11 = stackTopReg + io_exsc_opOff; // @[NullStackCache.scala 116:36]
  wire  _T_12 = 3'h3 == io_exsc_op; // @[Conditional.scala 37:30]
  wire [31:0] _T_14 = stackTopReg - io_exsc_opOff; // @[NullStackCache.scala 120:36]
  wire [31:0] _GEN_0 = _T_12 ? _T_14 : stackTopReg; // @[Conditional.scala 39:67 NullStackCache.scala 120:21 NullStackCache.scala 66:24]
  wire [31:0] _GEN_1 = _T_9 ? _T_11 : _GEN_0; // @[Conditional.scala 39:67 NullStackCache.scala 116:21]
  wire [31:0] _GEN_2 = _T_8 ? stackTopReg : _GEN_1; // @[Conditional.scala 39:67 NullStackCache.scala 66:24]
  NullCache nc ( // @[NullStackCache.scala 78:18]
    .clock(nc_clock),
    .reset(nc_reset),
    .io_master_M_Cmd(nc_io_master_M_Cmd),
    .io_master_M_Addr(nc_io_master_M_Addr),
    .io_master_S_Resp(nc_io_master_S_Resp),
    .io_master_S_Data(nc_io_master_S_Data),
    .io_slave_M_Cmd(nc_io_slave_M_Cmd),
    .io_slave_M_Addr(nc_io_slave_M_Addr),
    .io_slave_S_Resp(nc_io_slave_S_Resp),
    .io_slave_S_Data(nc_io_slave_S_Data),
    .io_slave_S_CmdAccept(nc_io_slave_S_CmdAccept)
  );
  WriteNoBuffer wc ( // @[NullStackCache.scala 83:18]
    .clock(wc_clock),
    .reset(wc_reset),
    .io_readMaster_M_Cmd(wc_io_readMaster_M_Cmd),
    .io_readMaster_M_Addr(wc_io_readMaster_M_Addr),
    .io_readMaster_M_Data(wc_io_readMaster_M_Data),
    .io_readMaster_M_DataValid(wc_io_readMaster_M_DataValid),
    .io_readMaster_M_DataByteEn(wc_io_readMaster_M_DataByteEn),
    .io_readMaster_S_Resp(wc_io_readMaster_S_Resp),
    .io_readMaster_S_Data(wc_io_readMaster_S_Data),
    .io_readMaster_S_CmdAccept(wc_io_readMaster_S_CmdAccept),
    .io_readMaster_S_DataAccept(wc_io_readMaster_S_DataAccept),
    .io_writeMaster_M_Cmd(wc_io_writeMaster_M_Cmd),
    .io_writeMaster_M_Addr(wc_io_writeMaster_M_Addr),
    .io_writeMaster_M_Data(wc_io_writeMaster_M_Data),
    .io_writeMaster_M_ByteEn(wc_io_writeMaster_M_ByteEn),
    .io_writeMaster_S_Resp(wc_io_writeMaster_S_Resp),
    .io_slave_M_Cmd(wc_io_slave_M_Cmd),
    .io_slave_M_Addr(wc_io_slave_M_Addr),
    .io_slave_M_Data(wc_io_slave_M_Data),
    .io_slave_M_DataValid(wc_io_slave_M_DataValid),
    .io_slave_M_DataByteEn(wc_io_slave_M_DataByteEn),
    .io_slave_S_Resp(wc_io_slave_S_Resp),
    .io_slave_S_Data(wc_io_slave_S_Data),
    .io_slave_S_CmdAccept(wc_io_slave_S_CmdAccept),
    .io_slave_S_DataAccept(wc_io_slave_S_DataAccept)
  );
  assign io_scex_stackTop = stackTopReg; // @[NullStackCache.scala 74:20]
  assign io_scex_memTop = memTopReg; // @[NullStackCache.scala 75:18]
  assign io_fromCPU_S_Resp = nc_io_master_S_Resp | wc_io_writeMaster_S_Resp; // @[NullStackCache.scala 93:44]
  assign io_fromCPU_S_Data = nc_io_master_S_Data; // @[NullStackCache.scala 92:21]
  assign io_toMemory_M_Cmd = wc_io_slave_M_Cmd; // @[NullStackCache.scala 88:17]
  assign io_toMemory_M_Addr = wc_io_slave_M_Addr; // @[NullStackCache.scala 88:17]
  assign io_toMemory_M_Data = wc_io_slave_M_Data; // @[NullStackCache.scala 88:17]
  assign io_toMemory_M_DataValid = wc_io_slave_M_DataValid; // @[NullStackCache.scala 88:17]
  assign io_toMemory_M_DataByteEn = wc_io_slave_M_DataByteEn; // @[NullStackCache.scala 88:17]
  assign nc_clock = clock;
  assign nc_reset = reset;
  assign nc_io_master_M_Cmd = io_fromCPU_M_Cmd; // @[NullStackCache.scala 79:18]
  assign nc_io_master_M_Addr = io_fromCPU_M_Addr + stackTopReg; // @[NullStackCache.scala 80:44]
  assign nc_io_slave_S_Resp = wc_io_readMaster_S_Resp; // @[NullStackCache.scala 85:17]
  assign nc_io_slave_S_Data = wc_io_readMaster_S_Data; // @[NullStackCache.scala 85:17]
  assign nc_io_slave_S_CmdAccept = wc_io_readMaster_S_CmdAccept; // @[NullStackCache.scala 85:17]
  assign wc_clock = clock;
  assign wc_reset = reset;
  assign wc_io_readMaster_M_Cmd = nc_io_slave_M_Cmd; // @[NullStackCache.scala 84:22]
  assign wc_io_readMaster_M_Addr = nc_io_slave_M_Addr; // @[NullStackCache.scala 84:22]
  assign wc_io_readMaster_M_Data = 32'h0; // @[NullStackCache.scala 84:22]
  assign wc_io_readMaster_M_DataValid = 1'h0; // @[NullStackCache.scala 84:22]
  assign wc_io_readMaster_M_DataByteEn = 4'h0; // @[NullStackCache.scala 84:22]
  assign wc_io_writeMaster_M_Cmd = io_fromCPU_M_Cmd; // @[NullStackCache.scala 86:23]
  assign wc_io_writeMaster_M_Addr = io_fromCPU_M_Addr + stackTopReg; // @[NullStackCache.scala 87:49]
  assign wc_io_writeMaster_M_Data = io_fromCPU_M_Data; // @[NullStackCache.scala 86:23]
  assign wc_io_writeMaster_M_ByteEn = io_fromCPU_M_ByteEn; // @[NullStackCache.scala 86:23]
  assign wc_io_slave_S_Resp = io_toMemory_S_Resp; // @[NullStackCache.scala 89:17]
  assign wc_io_slave_S_Data = io_toMemory_S_Data; // @[NullStackCache.scala 89:17]
  assign wc_io_slave_S_CmdAccept = io_toMemory_S_CmdAccept; // @[NullStackCache.scala 89:17]
  assign wc_io_slave_S_DataAccept = io_toMemory_S_DataAccept; // @[NullStackCache.scala 89:17]
  always @(posedge clock) begin
    if (io_ena_in) begin // @[NullStackCache.scala 98:20]
      if (!(_T_5)) begin // @[Conditional.scala 40:58]
        if (_T_6) begin // @[Conditional.scala 39:67]
          stackTopReg <= io_exsc_opData; // @[NullStackCache.scala 105:21]
        end else if (!(_T_7)) begin // @[Conditional.scala 39:67]
          stackTopReg <= _GEN_2;
        end
      end
    end
    if (io_ena_in) begin // @[NullStackCache.scala 98:20]
      if (!(_T_5)) begin // @[Conditional.scala 40:58]
        if (!(_T_6)) begin // @[Conditional.scala 39:67]
          if (_T_7) begin // @[Conditional.scala 39:67]
            memTopReg <= io_exsc_opData; // @[NullStackCache.scala 109:19]
          end
        end
      end
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
  stackTopReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  memTopReg = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module OcpBurstBus(
  output [2:0]  io_master_M_Cmd,
  output [31:0] io_master_M_Addr,
  output [31:0] io_master_M_Data,
  output        io_master_M_DataValid,
  output [3:0]  io_master_M_DataByteEn,
  input  [1:0]  io_master_S_Resp,
  input  [31:0] io_master_S_Data,
  input         io_master_S_CmdAccept,
  input         io_master_S_DataAccept,
  input  [2:0]  io_slave_M_Cmd,
  input  [31:0] io_slave_M_Addr,
  input  [31:0] io_slave_M_Data,
  input         io_slave_M_DataValid,
  input  [3:0]  io_slave_M_DataByteEn,
  output [1:0]  io_slave_S_Resp,
  output [31:0] io_slave_S_Data,
  output        io_slave_S_CmdAccept,
  output        io_slave_S_DataAccept
);
  assign io_master_M_Cmd = io_slave_M_Cmd; // @[OcpBurst.scala 244:15]
  assign io_master_M_Addr = io_slave_M_Addr; // @[OcpBurst.scala 244:15]
  assign io_master_M_Data = io_slave_M_Data; // @[OcpBurst.scala 244:15]
  assign io_master_M_DataValid = io_slave_M_DataValid; // @[OcpBurst.scala 244:15]
  assign io_master_M_DataByteEn = io_slave_M_DataByteEn; // @[OcpBurst.scala 244:15]
  assign io_slave_S_Resp = io_master_S_Resp; // @[OcpBurst.scala 245:14]
  assign io_slave_S_Data = io_master_S_Data; // @[OcpBurst.scala 245:14]
  assign io_slave_S_CmdAccept = io_master_S_CmdAccept; // @[OcpBurst.scala 245:14]
  assign io_slave_S_DataAccept = io_master_S_DataAccept; // @[OcpBurst.scala 245:14]
endmodule
module DataCache(
  input         clock,
  input         reset,
  input  [2:0]  io_master_M_Cmd,
  input  [31:0] io_master_M_Addr,
  input  [31:0] io_master_M_Data,
  input  [3:0]  io_master_M_ByteEn,
  input  [1:0]  io_master_M_AddrSpace,
  output [1:0]  io_master_S_Resp,
  output [31:0] io_master_S_Data,
  output [2:0]  io_slave_M_Cmd,
  output [31:0] io_slave_M_Addr,
  output [31:0] io_slave_M_Data,
  output        io_slave_M_DataValid,
  output [3:0]  io_slave_M_DataByteEn,
  input  [1:0]  io_slave_S_Resp,
  input  [31:0] io_slave_S_Data,
  input         io_slave_S_CmdAccept,
  input         io_slave_S_DataAccept,
  input         io_scIO_ena_in,
  input  [2:0]  io_scIO_exsc_op,
  input  [31:0] io_scIO_exsc_opData,
  input  [31:0] io_scIO_exsc_opOff,
  output [31:0] io_scIO_scex_stackTop,
  output [31:0] io_scIO_scex_memTop
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  dm_clock; // @[DataCache.scala 42:13]
  wire  dm_reset; // @[DataCache.scala 42:13]
  wire [2:0] dm_io_master_M_Cmd; // @[DataCache.scala 42:13]
  wire [31:0] dm_io_master_M_Addr; // @[DataCache.scala 42:13]
  wire [1:0] dm_io_master_S_Resp; // @[DataCache.scala 42:13]
  wire [31:0] dm_io_master_S_Data; // @[DataCache.scala 42:13]
  wire [2:0] dm_io_slave_M_Cmd; // @[DataCache.scala 42:13]
  wire [31:0] dm_io_slave_M_Addr; // @[DataCache.scala 42:13]
  wire [1:0] dm_io_slave_S_Resp; // @[DataCache.scala 42:13]
  wire [31:0] dm_io_slave_S_Data; // @[DataCache.scala 42:13]
  wire  dm_io_slave_S_CmdAccept; // @[DataCache.scala 42:13]
  wire  sc_clock; // @[DataCache.scala 66:18]
  wire  sc_reset; // @[DataCache.scala 66:18]
  wire  sc_io_ena_in; // @[DataCache.scala 66:18]
  wire [2:0] sc_io_exsc_op; // @[DataCache.scala 66:18]
  wire [31:0] sc_io_exsc_opData; // @[DataCache.scala 66:18]
  wire [31:0] sc_io_exsc_opOff; // @[DataCache.scala 66:18]
  wire [31:0] sc_io_scex_stackTop; // @[DataCache.scala 66:18]
  wire [31:0] sc_io_scex_memTop; // @[DataCache.scala 66:18]
  wire [2:0] sc_io_fromCPU_M_Cmd; // @[DataCache.scala 66:18]
  wire [31:0] sc_io_fromCPU_M_Addr; // @[DataCache.scala 66:18]
  wire [31:0] sc_io_fromCPU_M_Data; // @[DataCache.scala 66:18]
  wire [3:0] sc_io_fromCPU_M_ByteEn; // @[DataCache.scala 66:18]
  wire [1:0] sc_io_fromCPU_S_Resp; // @[DataCache.scala 66:18]
  wire [31:0] sc_io_fromCPU_S_Data; // @[DataCache.scala 66:18]
  wire [2:0] sc_io_toMemory_M_Cmd; // @[DataCache.scala 66:18]
  wire [31:0] sc_io_toMemory_M_Addr; // @[DataCache.scala 66:18]
  wire [31:0] sc_io_toMemory_M_Data; // @[DataCache.scala 66:18]
  wire  sc_io_toMemory_M_DataValid; // @[DataCache.scala 66:18]
  wire [3:0] sc_io_toMemory_M_DataByteEn; // @[DataCache.scala 66:18]
  wire [1:0] sc_io_toMemory_S_Resp; // @[DataCache.scala 66:18]
  wire [31:0] sc_io_toMemory_S_Data; // @[DataCache.scala 66:18]
  wire  sc_io_toMemory_S_CmdAccept; // @[DataCache.scala 66:18]
  wire  sc_io_toMemory_S_DataAccept; // @[DataCache.scala 66:18]
  wire  bp_clock; // @[DataCache.scala 75:18]
  wire  bp_reset; // @[DataCache.scala 75:18]
  wire [2:0] bp_io_master_M_Cmd; // @[DataCache.scala 75:18]
  wire [31:0] bp_io_master_M_Addr; // @[DataCache.scala 75:18]
  wire [1:0] bp_io_master_S_Resp; // @[DataCache.scala 75:18]
  wire [31:0] bp_io_master_S_Data; // @[DataCache.scala 75:18]
  wire [2:0] bp_io_slave_M_Cmd; // @[DataCache.scala 75:18]
  wire [31:0] bp_io_slave_M_Addr; // @[DataCache.scala 75:18]
  wire [1:0] bp_io_slave_S_Resp; // @[DataCache.scala 75:18]
  wire [31:0] bp_io_slave_S_Data; // @[DataCache.scala 75:18]
  wire  bp_io_slave_S_CmdAccept; // @[DataCache.scala 75:18]
  wire [2:0] burstReadBus1_io_master_M_Cmd; // @[DataCache.scala 81:29]
  wire [31:0] burstReadBus1_io_master_M_Addr; // @[DataCache.scala 81:29]
  wire [31:0] burstReadBus1_io_master_M_Data; // @[DataCache.scala 81:29]
  wire  burstReadBus1_io_master_M_DataValid; // @[DataCache.scala 81:29]
  wire [3:0] burstReadBus1_io_master_M_DataByteEn; // @[DataCache.scala 81:29]
  wire [1:0] burstReadBus1_io_master_S_Resp; // @[DataCache.scala 81:29]
  wire [31:0] burstReadBus1_io_master_S_Data; // @[DataCache.scala 81:29]
  wire  burstReadBus1_io_master_S_CmdAccept; // @[DataCache.scala 81:29]
  wire  burstReadBus1_io_master_S_DataAccept; // @[DataCache.scala 81:29]
  wire [2:0] burstReadBus1_io_slave_M_Cmd; // @[DataCache.scala 81:29]
  wire [31:0] burstReadBus1_io_slave_M_Addr; // @[DataCache.scala 81:29]
  wire [31:0] burstReadBus1_io_slave_M_Data; // @[DataCache.scala 81:29]
  wire  burstReadBus1_io_slave_M_DataValid; // @[DataCache.scala 81:29]
  wire [3:0] burstReadBus1_io_slave_M_DataByteEn; // @[DataCache.scala 81:29]
  wire [1:0] burstReadBus1_io_slave_S_Resp; // @[DataCache.scala 81:29]
  wire [31:0] burstReadBus1_io_slave_S_Data; // @[DataCache.scala 81:29]
  wire  burstReadBus1_io_slave_S_CmdAccept; // @[DataCache.scala 81:29]
  wire  burstReadBus1_io_slave_S_DataAccept; // @[DataCache.scala 81:29]
  wire [2:0] burstReadBus2_io_master_M_Cmd; // @[DataCache.scala 84:29]
  wire [31:0] burstReadBus2_io_master_M_Addr; // @[DataCache.scala 84:29]
  wire [31:0] burstReadBus2_io_master_M_Data; // @[DataCache.scala 84:29]
  wire  burstReadBus2_io_master_M_DataValid; // @[DataCache.scala 84:29]
  wire [3:0] burstReadBus2_io_master_M_DataByteEn; // @[DataCache.scala 84:29]
  wire [1:0] burstReadBus2_io_master_S_Resp; // @[DataCache.scala 84:29]
  wire [31:0] burstReadBus2_io_master_S_Data; // @[DataCache.scala 84:29]
  wire  burstReadBus2_io_master_S_CmdAccept; // @[DataCache.scala 84:29]
  wire  burstReadBus2_io_master_S_DataAccept; // @[DataCache.scala 84:29]
  wire [2:0] burstReadBus2_io_slave_M_Cmd; // @[DataCache.scala 84:29]
  wire [31:0] burstReadBus2_io_slave_M_Addr; // @[DataCache.scala 84:29]
  wire [31:0] burstReadBus2_io_slave_M_Data; // @[DataCache.scala 84:29]
  wire  burstReadBus2_io_slave_M_DataValid; // @[DataCache.scala 84:29]
  wire [3:0] burstReadBus2_io_slave_M_DataByteEn; // @[DataCache.scala 84:29]
  wire [1:0] burstReadBus2_io_slave_S_Resp; // @[DataCache.scala 84:29]
  wire [31:0] burstReadBus2_io_slave_S_Data; // @[DataCache.scala 84:29]
  wire  burstReadBus2_io_slave_S_CmdAccept; // @[DataCache.scala 84:29]
  wire  burstReadBus2_io_slave_S_DataAccept; // @[DataCache.scala 84:29]
  wire  wc_clock; // @[DataCache.scala 88:18]
  wire  wc_reset; // @[DataCache.scala 88:18]
  wire [2:0] wc_io_readMaster_M_Cmd; // @[DataCache.scala 88:18]
  wire [31:0] wc_io_readMaster_M_Addr; // @[DataCache.scala 88:18]
  wire [31:0] wc_io_readMaster_M_Data; // @[DataCache.scala 88:18]
  wire  wc_io_readMaster_M_DataValid; // @[DataCache.scala 88:18]
  wire [3:0] wc_io_readMaster_M_DataByteEn; // @[DataCache.scala 88:18]
  wire [1:0] wc_io_readMaster_S_Resp; // @[DataCache.scala 88:18]
  wire [31:0] wc_io_readMaster_S_Data; // @[DataCache.scala 88:18]
  wire  wc_io_readMaster_S_CmdAccept; // @[DataCache.scala 88:18]
  wire  wc_io_readMaster_S_DataAccept; // @[DataCache.scala 88:18]
  wire [2:0] wc_io_writeMaster_M_Cmd; // @[DataCache.scala 88:18]
  wire [31:0] wc_io_writeMaster_M_Addr; // @[DataCache.scala 88:18]
  wire [31:0] wc_io_writeMaster_M_Data; // @[DataCache.scala 88:18]
  wire [3:0] wc_io_writeMaster_M_ByteEn; // @[DataCache.scala 88:18]
  wire [1:0] wc_io_writeMaster_S_Resp; // @[DataCache.scala 88:18]
  wire [2:0] wc_io_slave_M_Cmd; // @[DataCache.scala 88:18]
  wire [31:0] wc_io_slave_M_Addr; // @[DataCache.scala 88:18]
  wire [31:0] wc_io_slave_M_Data; // @[DataCache.scala 88:18]
  wire  wc_io_slave_M_DataValid; // @[DataCache.scala 88:18]
  wire [3:0] wc_io_slave_M_DataByteEn; // @[DataCache.scala 88:18]
  wire [1:0] wc_io_slave_S_Resp; // @[DataCache.scala 88:18]
  wire [31:0] wc_io_slave_S_Data; // @[DataCache.scala 88:18]
  wire  wc_io_slave_S_CmdAccept; // @[DataCache.scala 88:18]
  wire  wc_io_slave_S_DataAccept; // @[DataCache.scala 88:18]
  wire  selSC = io_master_M_AddrSpace == 2'h0; // @[DataCache.scala 32:37]
  reg  selSCReg; // @[DataCache.scala 33:21]
  wire  _T_9 = ~selSC; // @[DataCache.scala 77:39]
  reg  REG; // @[OcpBurst.scala 144:24]
  wire  _T_14 = bp_io_slave_M_Cmd != 3'h0 | REG; // @[OcpBurst.scala 147:25]
  wire  _T_15 = dm_io_slave_M_Cmd != 3'h0 ? 1'h0 : _T_14; // @[OcpBurst.scala 146:18]
  reg  REG_1; // @[OcpBurst.scala 144:24]
  wire  _T_20 = burstReadBus1_io_master_M_Cmd != 3'h0 | REG_1; // @[OcpBurst.scala 147:25]
  wire  _T_21 = sc_io_toMemory_M_Cmd != 3'h0 ? 1'h0 : _T_20; // @[OcpBurst.scala 146:18]
  wire [31:0] _GEN_16 = bp_io_master_S_Data; // @[DataCache.scala 99:18 DataCache.scala 99:37 DataCache.scala 98:20]
  wire [1:0] _T_29 = dm_io_master_S_Resp | sc_io_fromCPU_S_Resp; // @[DataCache.scala 103:32]
  wire [1:0] _T_30 = _T_29 | bp_io_master_S_Resp; // @[DataCache.scala 103:43]
  NullCache dm ( // @[DataCache.scala 42:13]
    .clock(dm_clock),
    .reset(dm_reset),
    .io_master_M_Cmd(dm_io_master_M_Cmd),
    .io_master_M_Addr(dm_io_master_M_Addr),
    .io_master_S_Resp(dm_io_master_S_Resp),
    .io_master_S_Data(dm_io_master_S_Data),
    .io_slave_M_Cmd(dm_io_slave_M_Cmd),
    .io_slave_M_Addr(dm_io_slave_M_Addr),
    .io_slave_S_Resp(dm_io_slave_S_Resp),
    .io_slave_S_Data(dm_io_slave_S_Data),
    .io_slave_S_CmdAccept(dm_io_slave_S_CmdAccept)
  );
  NullStackCache sc ( // @[DataCache.scala 66:18]
    .clock(sc_clock),
    .reset(sc_reset),
    .io_ena_in(sc_io_ena_in),
    .io_exsc_op(sc_io_exsc_op),
    .io_exsc_opData(sc_io_exsc_opData),
    .io_exsc_opOff(sc_io_exsc_opOff),
    .io_scex_stackTop(sc_io_scex_stackTop),
    .io_scex_memTop(sc_io_scex_memTop),
    .io_fromCPU_M_Cmd(sc_io_fromCPU_M_Cmd),
    .io_fromCPU_M_Addr(sc_io_fromCPU_M_Addr),
    .io_fromCPU_M_Data(sc_io_fromCPU_M_Data),
    .io_fromCPU_M_ByteEn(sc_io_fromCPU_M_ByteEn),
    .io_fromCPU_S_Resp(sc_io_fromCPU_S_Resp),
    .io_fromCPU_S_Data(sc_io_fromCPU_S_Data),
    .io_toMemory_M_Cmd(sc_io_toMemory_M_Cmd),
    .io_toMemory_M_Addr(sc_io_toMemory_M_Addr),
    .io_toMemory_M_Data(sc_io_toMemory_M_Data),
    .io_toMemory_M_DataValid(sc_io_toMemory_M_DataValid),
    .io_toMemory_M_DataByteEn(sc_io_toMemory_M_DataByteEn),
    .io_toMemory_S_Resp(sc_io_toMemory_S_Resp),
    .io_toMemory_S_Data(sc_io_toMemory_S_Data),
    .io_toMemory_S_CmdAccept(sc_io_toMemory_S_CmdAccept),
    .io_toMemory_S_DataAccept(sc_io_toMemory_S_DataAccept)
  );
  NullCache bp ( // @[DataCache.scala 75:18]
    .clock(bp_clock),
    .reset(bp_reset),
    .io_master_M_Cmd(bp_io_master_M_Cmd),
    .io_master_M_Addr(bp_io_master_M_Addr),
    .io_master_S_Resp(bp_io_master_S_Resp),
    .io_master_S_Data(bp_io_master_S_Data),
    .io_slave_M_Cmd(bp_io_slave_M_Cmd),
    .io_slave_M_Addr(bp_io_slave_M_Addr),
    .io_slave_S_Resp(bp_io_slave_S_Resp),
    .io_slave_S_Data(bp_io_slave_S_Data),
    .io_slave_S_CmdAccept(bp_io_slave_S_CmdAccept)
  );
  OcpBurstBus burstReadBus1 ( // @[DataCache.scala 81:29]
    .io_master_M_Cmd(burstReadBus1_io_master_M_Cmd),
    .io_master_M_Addr(burstReadBus1_io_master_M_Addr),
    .io_master_M_Data(burstReadBus1_io_master_M_Data),
    .io_master_M_DataValid(burstReadBus1_io_master_M_DataValid),
    .io_master_M_DataByteEn(burstReadBus1_io_master_M_DataByteEn),
    .io_master_S_Resp(burstReadBus1_io_master_S_Resp),
    .io_master_S_Data(burstReadBus1_io_master_S_Data),
    .io_master_S_CmdAccept(burstReadBus1_io_master_S_CmdAccept),
    .io_master_S_DataAccept(burstReadBus1_io_master_S_DataAccept),
    .io_slave_M_Cmd(burstReadBus1_io_slave_M_Cmd),
    .io_slave_M_Addr(burstReadBus1_io_slave_M_Addr),
    .io_slave_M_Data(burstReadBus1_io_slave_M_Data),
    .io_slave_M_DataValid(burstReadBus1_io_slave_M_DataValid),
    .io_slave_M_DataByteEn(burstReadBus1_io_slave_M_DataByteEn),
    .io_slave_S_Resp(burstReadBus1_io_slave_S_Resp),
    .io_slave_S_Data(burstReadBus1_io_slave_S_Data),
    .io_slave_S_CmdAccept(burstReadBus1_io_slave_S_CmdAccept),
    .io_slave_S_DataAccept(burstReadBus1_io_slave_S_DataAccept)
  );
  OcpBurstBus burstReadBus2 ( // @[DataCache.scala 84:29]
    .io_master_M_Cmd(burstReadBus2_io_master_M_Cmd),
    .io_master_M_Addr(burstReadBus2_io_master_M_Addr),
    .io_master_M_Data(burstReadBus2_io_master_M_Data),
    .io_master_M_DataValid(burstReadBus2_io_master_M_DataValid),
    .io_master_M_DataByteEn(burstReadBus2_io_master_M_DataByteEn),
    .io_master_S_Resp(burstReadBus2_io_master_S_Resp),
    .io_master_S_Data(burstReadBus2_io_master_S_Data),
    .io_master_S_CmdAccept(burstReadBus2_io_master_S_CmdAccept),
    .io_master_S_DataAccept(burstReadBus2_io_master_S_DataAccept),
    .io_slave_M_Cmd(burstReadBus2_io_slave_M_Cmd),
    .io_slave_M_Addr(burstReadBus2_io_slave_M_Addr),
    .io_slave_M_Data(burstReadBus2_io_slave_M_Data),
    .io_slave_M_DataValid(burstReadBus2_io_slave_M_DataValid),
    .io_slave_M_DataByteEn(burstReadBus2_io_slave_M_DataByteEn),
    .io_slave_S_Resp(burstReadBus2_io_slave_S_Resp),
    .io_slave_S_Data(burstReadBus2_io_slave_S_Data),
    .io_slave_S_CmdAccept(burstReadBus2_io_slave_S_CmdAccept),
    .io_slave_S_DataAccept(burstReadBus2_io_slave_S_DataAccept)
  );
  WriteNoBuffer wc ( // @[DataCache.scala 88:18]
    .clock(wc_clock),
    .reset(wc_reset),
    .io_readMaster_M_Cmd(wc_io_readMaster_M_Cmd),
    .io_readMaster_M_Addr(wc_io_readMaster_M_Addr),
    .io_readMaster_M_Data(wc_io_readMaster_M_Data),
    .io_readMaster_M_DataValid(wc_io_readMaster_M_DataValid),
    .io_readMaster_M_DataByteEn(wc_io_readMaster_M_DataByteEn),
    .io_readMaster_S_Resp(wc_io_readMaster_S_Resp),
    .io_readMaster_S_Data(wc_io_readMaster_S_Data),
    .io_readMaster_S_CmdAccept(wc_io_readMaster_S_CmdAccept),
    .io_readMaster_S_DataAccept(wc_io_readMaster_S_DataAccept),
    .io_writeMaster_M_Cmd(wc_io_writeMaster_M_Cmd),
    .io_writeMaster_M_Addr(wc_io_writeMaster_M_Addr),
    .io_writeMaster_M_Data(wc_io_writeMaster_M_Data),
    .io_writeMaster_M_ByteEn(wc_io_writeMaster_M_ByteEn),
    .io_writeMaster_S_Resp(wc_io_writeMaster_S_Resp),
    .io_slave_M_Cmd(wc_io_slave_M_Cmd),
    .io_slave_M_Addr(wc_io_slave_M_Addr),
    .io_slave_M_Data(wc_io_slave_M_Data),
    .io_slave_M_DataValid(wc_io_slave_M_DataValid),
    .io_slave_M_DataByteEn(wc_io_slave_M_DataByteEn),
    .io_slave_S_Resp(wc_io_slave_S_Resp),
    .io_slave_S_Data(wc_io_slave_S_Data),
    .io_slave_S_CmdAccept(wc_io_slave_S_CmdAccept),
    .io_slave_S_DataAccept(wc_io_slave_S_DataAccept)
  );
  assign io_master_S_Resp = _T_30 | wc_io_writeMaster_S_Resp; // @[DataCache.scala 103:54]
  assign io_master_S_Data = selSCReg ? sc_io_fromCPU_S_Data : _GEN_16; // @[DataCache.scala 100:18 DataCache.scala 100:37]
  assign io_slave_M_Cmd = wc_io_slave_M_Cmd; // @[DataCache.scala 95:12]
  assign io_slave_M_Addr = wc_io_slave_M_Addr; // @[DataCache.scala 95:12]
  assign io_slave_M_Data = wc_io_slave_M_Data; // @[DataCache.scala 95:12]
  assign io_slave_M_DataValid = wc_io_slave_M_DataValid; // @[DataCache.scala 95:12]
  assign io_slave_M_DataByteEn = wc_io_slave_M_DataByteEn; // @[DataCache.scala 95:12]
  assign io_scIO_scex_stackTop = sc_io_scex_stackTop; // @[DataCache.scala 67:11]
  assign io_scIO_scex_memTop = sc_io_scex_memTop; // @[DataCache.scala 67:11]
  assign dm_clock = clock;
  assign dm_reset = reset;
  assign dm_io_master_M_Cmd = 3'h0; // @[DataCache.scala 58:28]
  assign dm_io_master_M_Addr = io_master_M_Addr; // @[DataCache.scala 57:18]
  assign dm_io_slave_S_Resp = REG ? 2'h0 : burstReadBus1_io_slave_S_Resp; // @[OcpBurst.scala 159:21 OcpBurst.scala 160:17 OcpBurst.scala 157:10]
  assign dm_io_slave_S_Data = burstReadBus1_io_slave_S_Data; // @[OcpBurst.scala 157:10]
  assign dm_io_slave_S_CmdAccept = burstReadBus1_io_slave_S_CmdAccept; // @[OcpBurst.scala 157:10]
  assign sc_clock = clock;
  assign sc_reset = reset;
  assign sc_io_ena_in = io_scIO_ena_in; // @[DataCache.scala 67:11]
  assign sc_io_exsc_op = io_scIO_exsc_op; // @[DataCache.scala 67:11]
  assign sc_io_exsc_opData = io_scIO_exsc_opData; // @[DataCache.scala 67:11]
  assign sc_io_exsc_opOff = io_scIO_exsc_opOff; // @[DataCache.scala 67:11]
  assign sc_io_fromCPU_M_Cmd = selSC ? io_master_M_Cmd : 3'h0; // @[DataCache.scala 71:29]
  assign sc_io_fromCPU_M_Addr = io_master_M_Addr; // @[DataCache.scala 70:19]
  assign sc_io_fromCPU_M_Data = io_master_M_Data; // @[DataCache.scala 70:19]
  assign sc_io_fromCPU_M_ByteEn = io_master_M_ByteEn; // @[DataCache.scala 70:19]
  assign sc_io_toMemory_S_Resp = REG_1 ? 2'h0 : burstReadBus2_io_slave_S_Resp; // @[OcpBurst.scala 159:21 OcpBurst.scala 160:17 OcpBurst.scala 157:10]
  assign sc_io_toMemory_S_Data = burstReadBus2_io_slave_S_Data; // @[OcpBurst.scala 157:10]
  assign sc_io_toMemory_S_CmdAccept = burstReadBus2_io_slave_S_CmdAccept; // @[OcpBurst.scala 157:10]
  assign sc_io_toMemory_S_DataAccept = burstReadBus2_io_slave_S_DataAccept; // @[OcpBurst.scala 157:10]
  assign bp_clock = clock;
  assign bp_reset = reset;
  assign bp_io_master_M_Cmd = ~selSC ? io_master_M_Cmd : 3'h0; // @[DataCache.scala 77:28]
  assign bp_io_master_M_Addr = io_master_M_Addr; // @[DataCache.scala 76:18]
  assign bp_io_slave_S_Resp = REG ? burstReadBus1_io_slave_S_Resp : 2'h0; // @[OcpBurst.scala 159:21 OcpBurst.scala 156:11 OcpBurst.scala 163:18]
  assign bp_io_slave_S_Data = burstReadBus1_io_slave_S_Data; // @[OcpBurst.scala 156:11]
  assign bp_io_slave_S_CmdAccept = burstReadBus1_io_slave_S_CmdAccept; // @[OcpBurst.scala 156:11]
  assign burstReadBus1_io_master_S_Resp = REG_1 ? burstReadBus2_io_slave_S_Resp : 2'h0; // @[OcpBurst.scala 159:21 OcpBurst.scala 156:11 OcpBurst.scala 163:18]
  assign burstReadBus1_io_master_S_Data = burstReadBus2_io_slave_S_Data; // @[OcpBurst.scala 156:11]
  assign burstReadBus1_io_master_S_CmdAccept = burstReadBus2_io_slave_S_CmdAccept; // @[OcpBurst.scala 156:11]
  assign burstReadBus1_io_master_S_DataAccept = burstReadBus2_io_slave_S_DataAccept; // @[OcpBurst.scala 156:11]
  assign burstReadBus1_io_slave_M_Cmd = bp_io_slave_M_Cmd | dm_io_slave_M_Cmd; // @[OcpBurst.scala 154:31]
  assign burstReadBus1_io_slave_M_Addr = _T_15 ? bp_io_slave_M_Addr : dm_io_slave_M_Addr; // @[OcpBurst.scala 151:19 OcpBurst.scala 152:14 OcpBurst.scala 150:12]
  assign burstReadBus1_io_slave_M_Data = 32'h0; // @[OcpBurst.scala 151:19 OcpBurst.scala 152:14 OcpBurst.scala 150:12]
  assign burstReadBus1_io_slave_M_DataValid = 1'h0; // @[OcpBurst.scala 151:19 OcpBurst.scala 152:14 OcpBurst.scala 150:12]
  assign burstReadBus1_io_slave_M_DataByteEn = 4'h0; // @[OcpBurst.scala 151:19 OcpBurst.scala 152:14 OcpBurst.scala 150:12]
  assign burstReadBus2_io_master_S_Resp = wc_io_readMaster_S_Resp; // @[DataCache.scala 90:29]
  assign burstReadBus2_io_master_S_Data = wc_io_readMaster_S_Data; // @[DataCache.scala 90:29]
  assign burstReadBus2_io_master_S_CmdAccept = wc_io_readMaster_S_CmdAccept; // @[DataCache.scala 90:29]
  assign burstReadBus2_io_master_S_DataAccept = wc_io_readMaster_S_DataAccept; // @[DataCache.scala 90:29]
  assign burstReadBus2_io_slave_M_Cmd = burstReadBus1_io_master_M_Cmd | sc_io_toMemory_M_Cmd; // @[OcpBurst.scala 154:31]
  assign burstReadBus2_io_slave_M_Addr = _T_21 ? burstReadBus1_io_master_M_Addr : sc_io_toMemory_M_Addr; // @[OcpBurst.scala 151:19 OcpBurst.scala 152:14 OcpBurst.scala 150:12]
  assign burstReadBus2_io_slave_M_Data = _T_21 ? burstReadBus1_io_master_M_Data : sc_io_toMemory_M_Data; // @[OcpBurst.scala 151:19 OcpBurst.scala 152:14 OcpBurst.scala 150:12]
  assign burstReadBus2_io_slave_M_DataValid = _T_21 ? burstReadBus1_io_master_M_DataValid : sc_io_toMemory_M_DataValid; // @[OcpBurst.scala 151:19 OcpBurst.scala 152:14 OcpBurst.scala 150:12]
  assign burstReadBus2_io_slave_M_DataByteEn = _T_21 ? burstReadBus1_io_master_M_DataByteEn :
    sc_io_toMemory_M_DataByteEn; // @[OcpBurst.scala 151:19 OcpBurst.scala 152:14 OcpBurst.scala 150:12]
  assign wc_clock = clock;
  assign wc_reset = reset;
  assign wc_io_readMaster_M_Cmd = burstReadBus2_io_master_M_Cmd; // @[DataCache.scala 89:22]
  assign wc_io_readMaster_M_Addr = burstReadBus2_io_master_M_Addr; // @[DataCache.scala 89:22]
  assign wc_io_readMaster_M_Data = burstReadBus2_io_master_M_Data; // @[DataCache.scala 89:22]
  assign wc_io_readMaster_M_DataValid = burstReadBus2_io_master_M_DataValid; // @[DataCache.scala 89:22]
  assign wc_io_readMaster_M_DataByteEn = burstReadBus2_io_master_M_DataByteEn; // @[DataCache.scala 89:22]
  assign wc_io_writeMaster_M_Cmd = _T_9 ? io_master_M_Cmd : 3'h0; // @[DataCache.scala 92:33]
  assign wc_io_writeMaster_M_Addr = io_master_M_Addr; // @[DataCache.scala 91:23]
  assign wc_io_writeMaster_M_Data = io_master_M_Data; // @[DataCache.scala 91:23]
  assign wc_io_writeMaster_M_ByteEn = io_master_M_ByteEn; // @[DataCache.scala 91:23]
  assign wc_io_slave_S_Resp = io_slave_S_Resp; // @[DataCache.scala 95:12]
  assign wc_io_slave_S_Data = io_slave_S_Data; // @[DataCache.scala 95:12]
  assign wc_io_slave_S_CmdAccept = io_slave_S_CmdAccept; // @[DataCache.scala 95:12]
  assign wc_io_slave_S_DataAccept = io_slave_S_DataAccept; // @[DataCache.scala 95:12]
  always @(posedge clock) begin
    if (io_master_M_Cmd != 3'h0) begin // @[DataCache.scala 34:41]
      selSCReg <= selSC; // @[DataCache.scala 36:14]
    end
    if (dm_io_slave_M_Cmd != 3'h0) begin // @[OcpBurst.scala 146:18]
      REG <= 1'h0;
    end else begin
      REG <= _T_14;
    end
    if (sc_io_toMemory_M_Cmd != 3'h0) begin // @[OcpBurst.scala 146:18]
      REG_1 <= 1'h0;
    end else begin
      REG_1 <= _T_20;
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
  selSCReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  REG = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  REG_1 = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module NoMemoryManagement(
  input  [2:0]  io_virt_M_Cmd,
  input  [31:0] io_virt_M_Addr,
  input  [31:0] io_virt_M_Data,
  input         io_virt_M_DataValid,
  input  [3:0]  io_virt_M_DataByteEn,
  output [1:0]  io_virt_S_Resp,
  output [31:0] io_virt_S_Data,
  output        io_virt_S_CmdAccept,
  output        io_virt_S_DataAccept,
  output [2:0]  io_phys_M_Cmd,
  output [20:0] io_phys_M_Addr,
  output [31:0] io_phys_M_Data,
  output        io_phys_M_DataValid,
  output [3:0]  io_phys_M_DataByteEn,
  input  [1:0]  io_phys_S_Resp,
  input  [31:0] io_phys_S_Data,
  input         io_phys_S_CmdAccept,
  input         io_phys_S_DataAccept
);
  assign io_virt_S_Resp = io_phys_S_Resp; // @[NoMemoryManagement.scala 17:13]
  assign io_virt_S_Data = io_phys_S_Data; // @[NoMemoryManagement.scala 17:13]
  assign io_virt_S_CmdAccept = io_phys_S_CmdAccept; // @[NoMemoryManagement.scala 17:13]
  assign io_virt_S_DataAccept = io_phys_S_DataAccept; // @[NoMemoryManagement.scala 17:13]
  assign io_phys_M_Cmd = io_virt_M_Cmd; // @[NoMemoryManagement.scala 16:13]
  assign io_phys_M_Addr = io_virt_M_Addr[20:0]; // @[NoMemoryManagement.scala 16:13]
  assign io_phys_M_Data = io_virt_M_Data; // @[NoMemoryManagement.scala 16:13]
  assign io_phys_M_DataValid = io_virt_M_DataValid; // @[NoMemoryManagement.scala 16:13]
  assign io_phys_M_DataByteEn = io_virt_M_DataByteEn; // @[NoMemoryManagement.scala 16:13]
endmodule
module PatmosCore(
  input         clock,
  input         reset,
  input         io_interrupts_0,
  input         io_interrupts_1,
  output [2:0]  io_memPort_M_Cmd,
  output [20:0] io_memPort_M_Addr,
  output [31:0] io_memPort_M_Data,
  output        io_memPort_M_DataValid,
  output [3:0]  io_memPort_M_DataByteEn,
  input  [1:0]  io_memPort_S_Resp,
  input  [31:0] io_memPort_S_Data,
  input         io_memPort_S_CmdAccept,
  input         io_memPort_S_DataAccept,
  output [2:0]  io_memInOut_M_Cmd,
  output [31:0] io_memInOut_M_Addr,
  output [31:0] io_memInOut_M_Data,
  output [3:0]  io_memInOut_M_ByteEn,
  input  [1:0]  io_memInOut_S_Resp,
  input  [31:0] io_memInOut_S_Data,
  input  [2:0]  io_excInOut_M_Cmd,
  input  [31:0] io_excInOut_M_Addr,
  input  [31:0] io_excInOut_M_Data,
  output [1:0]  io_excInOut_S_Resp,
  output [31:0] io_excInOut_S_Data,
  input         io_boot_pc_stall,
  input  [29:0] io_boot_pc_bootAddr,
  input         io_boot_bootMemWr_enaEven,
  input  [8:0]  io_boot_bootMemWr_addrEven,
  input  [31:0] io_boot_bootMemWr_dataEven,
  input         io_boot_bootMemWr_enaOdd,
  input  [8:0]  io_boot_bootMemWr_addrOdd,
  input  [31:0] io_boot_bootMemWr_dataOdd
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  icache_clock; // @[Patmos.scala 46:13]
  wire  icache_reset; // @[Patmos.scala 46:13]
  wire  icache_io_ena_in; // @[Patmos.scala 46:13]
  wire  icache_io_exicache_doCallRet; // @[Patmos.scala 46:13]
  wire [31:0] icache_io_exicache_callRetBase; // @[Patmos.scala 46:13]
  wire [31:0] icache_io_exicache_callRetAddr; // @[Patmos.scala 46:13]
  wire [31:0] icache_io_icachefe_base; // @[Patmos.scala 46:13]
  wire [9:0] icache_io_icachefe_relBase; // @[Patmos.scala 46:13]
  wire [10:0] icache_io_icachefe_relPc; // @[Patmos.scala 46:13]
  wire [31:0] icache_io_icachefe_reloc; // @[Patmos.scala 46:13]
  wire [1:0] icache_io_icachefe_memSel; // @[Patmos.scala 46:13]
  wire  fetch_clock; // @[Patmos.scala 60:21]
  wire  fetch_reset; // @[Patmos.scala 60:21]
  wire  fetch_io_ena; // @[Patmos.scala 60:21]
  wire [31:0] fetch_io_fedec_instr_a; // @[Patmos.scala 60:21]
  wire [31:0] fetch_io_fedec_instr_b; // @[Patmos.scala 60:21]
  wire [29:0] fetch_io_fedec_pc; // @[Patmos.scala 60:21]
  wire [29:0] fetch_io_fedec_base; // @[Patmos.scala 60:21]
  wire [31:0] fetch_io_fedec_reloc; // @[Patmos.scala 60:21]
  wire [29:0] fetch_io_fedec_relPc; // @[Patmos.scala 60:21]
  wire [29:0] fetch_io_feex_pc; // @[Patmos.scala 60:21]
  wire  fetch_io_exfe_doBranch; // @[Patmos.scala 60:21]
  wire [29:0] fetch_io_exfe_branchPc; // @[Patmos.scala 60:21]
  wire  fetch_io_memfe_doCallRet; // @[Patmos.scala 60:21]
  wire [31:0] fetch_io_icachefe_base; // @[Patmos.scala 60:21]
  wire [9:0] fetch_io_icachefe_relBase; // @[Patmos.scala 60:21]
  wire [10:0] fetch_io_icachefe_relPc; // @[Patmos.scala 60:21]
  wire [31:0] fetch_io_icachefe_reloc; // @[Patmos.scala 60:21]
  wire [1:0] fetch_io_icachefe_memSel; // @[Patmos.scala 60:21]
  wire [29:0] fetch_io_boot_pc_bootAddr; // @[Patmos.scala 60:21]
  wire  fetch_io_boot_bootMemWr_enaEven; // @[Patmos.scala 60:21]
  wire [8:0] fetch_io_boot_bootMemWr_addrEven; // @[Patmos.scala 60:21]
  wire [31:0] fetch_io_boot_bootMemWr_dataEven; // @[Patmos.scala 60:21]
  wire  fetch_io_boot_bootMemWr_enaOdd; // @[Patmos.scala 60:21]
  wire [8:0] fetch_io_boot_bootMemWr_addrOdd; // @[Patmos.scala 60:21]
  wire [31:0] fetch_io_boot_bootMemWr_dataOdd; // @[Patmos.scala 60:21]
  wire  decode_clock; // @[Patmos.scala 61:22]
  wire  decode_reset; // @[Patmos.scala 61:22]
  wire  decode_io_ena; // @[Patmos.scala 61:22]
  wire  decode_io_flush; // @[Patmos.scala 61:22]
  wire [31:0] decode_io_fedec_instr_a; // @[Patmos.scala 61:22]
  wire [31:0] decode_io_fedec_instr_b; // @[Patmos.scala 61:22]
  wire [29:0] decode_io_fedec_pc; // @[Patmos.scala 61:22]
  wire [29:0] decode_io_fedec_base; // @[Patmos.scala 61:22]
  wire [31:0] decode_io_fedec_reloc; // @[Patmos.scala 61:22]
  wire [29:0] decode_io_fedec_relPc; // @[Patmos.scala 61:22]
  wire [29:0] decode_io_decex_base; // @[Patmos.scala 61:22]
  wire [29:0] decode_io_decex_relPc; // @[Patmos.scala 61:22]
  wire [3:0] decode_io_decex_pred_0; // @[Patmos.scala 61:22]
  wire [3:0] decode_io_decex_aluOp_0_func; // @[Patmos.scala 61:22]
  wire  decode_io_decex_aluOp_0_isMul; // @[Patmos.scala 61:22]
  wire  decode_io_decex_aluOp_0_isCmp; // @[Patmos.scala 61:22]
  wire  decode_io_decex_aluOp_0_isPred; // @[Patmos.scala 61:22]
  wire  decode_io_decex_aluOp_0_isBCpy; // @[Patmos.scala 61:22]
  wire  decode_io_decex_aluOp_0_isMTS; // @[Patmos.scala 61:22]
  wire  decode_io_decex_aluOp_0_isMFS; // @[Patmos.scala 61:22]
  wire [1:0] decode_io_decex_predOp_0_func; // @[Patmos.scala 61:22]
  wire [2:0] decode_io_decex_predOp_0_dest; // @[Patmos.scala 61:22]
  wire [3:0] decode_io_decex_predOp_0_s1Addr; // @[Patmos.scala 61:22]
  wire [3:0] decode_io_decex_predOp_0_s2Addr; // @[Patmos.scala 61:22]
  wire  decode_io_decex_jmpOp_branch; // @[Patmos.scala 61:22]
  wire [29:0] decode_io_decex_jmpOp_target; // @[Patmos.scala 61:22]
  wire [31:0] decode_io_decex_jmpOp_reloc; // @[Patmos.scala 61:22]
  wire  decode_io_decex_memOp_load; // @[Patmos.scala 61:22]
  wire  decode_io_decex_memOp_store; // @[Patmos.scala 61:22]
  wire  decode_io_decex_memOp_hword; // @[Patmos.scala 61:22]
  wire  decode_io_decex_memOp_byte; // @[Patmos.scala 61:22]
  wire  decode_io_decex_memOp_zext; // @[Patmos.scala 61:22]
  wire [1:0] decode_io_decex_memOp_typ; // @[Patmos.scala 61:22]
  wire [2:0] decode_io_decex_stackOp; // @[Patmos.scala 61:22]
  wire [4:0] decode_io_decex_rsAddr_0; // @[Patmos.scala 61:22]
  wire [4:0] decode_io_decex_rsAddr_1; // @[Patmos.scala 61:22]
  wire [31:0] decode_io_decex_rsData_0; // @[Patmos.scala 61:22]
  wire [31:0] decode_io_decex_rsData_1; // @[Patmos.scala 61:22]
  wire [4:0] decode_io_decex_rdAddr_0; // @[Patmos.scala 61:22]
  wire [31:0] decode_io_decex_immVal_0; // @[Patmos.scala 61:22]
  wire  decode_io_decex_immOp_0; // @[Patmos.scala 61:22]
  wire  decode_io_decex_wrRd_0; // @[Patmos.scala 61:22]
  wire [31:0] decode_io_decex_callAddr; // @[Patmos.scala 61:22]
  wire  decode_io_decex_call; // @[Patmos.scala 61:22]
  wire  decode_io_decex_ret; // @[Patmos.scala 61:22]
  wire  decode_io_decex_brcf; // @[Patmos.scala 61:22]
  wire  decode_io_decex_trap; // @[Patmos.scala 61:22]
  wire  decode_io_decex_xcall; // @[Patmos.scala 61:22]
  wire  decode_io_decex_xret; // @[Patmos.scala 61:22]
  wire [4:0] decode_io_decex_xsrc; // @[Patmos.scala 61:22]
  wire  decode_io_decex_nonDelayed; // @[Patmos.scala 61:22]
  wire  decode_io_decex_illOp; // @[Patmos.scala 61:22]
  wire [4:0] decode_io_rfWrite_0_addr; // @[Patmos.scala 61:22]
  wire [31:0] decode_io_rfWrite_0_data; // @[Patmos.scala 61:22]
  wire  decode_io_rfWrite_0_valid; // @[Patmos.scala 61:22]
  wire  decode_io_exc_exc; // @[Patmos.scala 61:22]
  wire [29:0] decode_io_exc_excBase; // @[Patmos.scala 61:22]
  wire [29:0] decode_io_exc_excAddr; // @[Patmos.scala 61:22]
  wire  decode_io_exc_intr; // @[Patmos.scala 61:22]
  wire [31:0] decode_io_exc_addr; // @[Patmos.scala 61:22]
  wire [4:0] decode_io_exc_src; // @[Patmos.scala 61:22]
  wire  decode_io_exc_local; // @[Patmos.scala 61:22]
  wire  execute_clock; // @[Patmos.scala 62:23]
  wire  execute_reset; // @[Patmos.scala 62:23]
  wire  execute_io_ena_in; // @[Patmos.scala 62:23]
  wire  execute_io_flush; // @[Patmos.scala 62:23]
  wire  execute_io_brflush; // @[Patmos.scala 62:23]
  wire [29:0] execute_io_decex_base; // @[Patmos.scala 62:23]
  wire [29:0] execute_io_decex_relPc; // @[Patmos.scala 62:23]
  wire [3:0] execute_io_decex_pred_0; // @[Patmos.scala 62:23]
  wire [3:0] execute_io_decex_aluOp_0_func; // @[Patmos.scala 62:23]
  wire  execute_io_decex_aluOp_0_isMul; // @[Patmos.scala 62:23]
  wire  execute_io_decex_aluOp_0_isCmp; // @[Patmos.scala 62:23]
  wire  execute_io_decex_aluOp_0_isPred; // @[Patmos.scala 62:23]
  wire  execute_io_decex_aluOp_0_isBCpy; // @[Patmos.scala 62:23]
  wire  execute_io_decex_aluOp_0_isMTS; // @[Patmos.scala 62:23]
  wire  execute_io_decex_aluOp_0_isMFS; // @[Patmos.scala 62:23]
  wire [1:0] execute_io_decex_predOp_0_func; // @[Patmos.scala 62:23]
  wire [2:0] execute_io_decex_predOp_0_dest; // @[Patmos.scala 62:23]
  wire [3:0] execute_io_decex_predOp_0_s1Addr; // @[Patmos.scala 62:23]
  wire [3:0] execute_io_decex_predOp_0_s2Addr; // @[Patmos.scala 62:23]
  wire  execute_io_decex_jmpOp_branch; // @[Patmos.scala 62:23]
  wire [29:0] execute_io_decex_jmpOp_target; // @[Patmos.scala 62:23]
  wire [31:0] execute_io_decex_jmpOp_reloc; // @[Patmos.scala 62:23]
  wire  execute_io_decex_memOp_load; // @[Patmos.scala 62:23]
  wire  execute_io_decex_memOp_store; // @[Patmos.scala 62:23]
  wire  execute_io_decex_memOp_hword; // @[Patmos.scala 62:23]
  wire  execute_io_decex_memOp_byte; // @[Patmos.scala 62:23]
  wire  execute_io_decex_memOp_zext; // @[Patmos.scala 62:23]
  wire [1:0] execute_io_decex_memOp_typ; // @[Patmos.scala 62:23]
  wire [2:0] execute_io_decex_stackOp; // @[Patmos.scala 62:23]
  wire [4:0] execute_io_decex_rsAddr_0; // @[Patmos.scala 62:23]
  wire [4:0] execute_io_decex_rsAddr_1; // @[Patmos.scala 62:23]
  wire [31:0] execute_io_decex_rsData_0; // @[Patmos.scala 62:23]
  wire [31:0] execute_io_decex_rsData_1; // @[Patmos.scala 62:23]
  wire [4:0] execute_io_decex_rdAddr_0; // @[Patmos.scala 62:23]
  wire [31:0] execute_io_decex_immVal_0; // @[Patmos.scala 62:23]
  wire  execute_io_decex_immOp_0; // @[Patmos.scala 62:23]
  wire  execute_io_decex_wrRd_0; // @[Patmos.scala 62:23]
  wire [31:0] execute_io_decex_callAddr; // @[Patmos.scala 62:23]
  wire  execute_io_decex_call; // @[Patmos.scala 62:23]
  wire  execute_io_decex_ret; // @[Patmos.scala 62:23]
  wire  execute_io_decex_brcf; // @[Patmos.scala 62:23]
  wire  execute_io_decex_trap; // @[Patmos.scala 62:23]
  wire  execute_io_decex_xcall; // @[Patmos.scala 62:23]
  wire  execute_io_decex_xret; // @[Patmos.scala 62:23]
  wire [4:0] execute_io_decex_xsrc; // @[Patmos.scala 62:23]
  wire  execute_io_decex_nonDelayed; // @[Patmos.scala 62:23]
  wire  execute_io_decex_illOp; // @[Patmos.scala 62:23]
  wire [4:0] execute_io_exmem_rd_0_addr; // @[Patmos.scala 62:23]
  wire [31:0] execute_io_exmem_rd_0_data; // @[Patmos.scala 62:23]
  wire  execute_io_exmem_rd_0_valid; // @[Patmos.scala 62:23]
  wire  execute_io_exmem_mem_load; // @[Patmos.scala 62:23]
  wire  execute_io_exmem_mem_store; // @[Patmos.scala 62:23]
  wire  execute_io_exmem_mem_hword; // @[Patmos.scala 62:23]
  wire  execute_io_exmem_mem_byte; // @[Patmos.scala 62:23]
  wire  execute_io_exmem_mem_zext; // @[Patmos.scala 62:23]
  wire [1:0] execute_io_exmem_mem_typ; // @[Patmos.scala 62:23]
  wire [31:0] execute_io_exmem_mem_addr; // @[Patmos.scala 62:23]
  wire [31:0] execute_io_exmem_mem_data; // @[Patmos.scala 62:23]
  wire  execute_io_exmem_mem_call; // @[Patmos.scala 62:23]
  wire  execute_io_exmem_mem_ret; // @[Patmos.scala 62:23]
  wire  execute_io_exmem_mem_brcf; // @[Patmos.scala 62:23]
  wire  execute_io_exmem_mem_trap; // @[Patmos.scala 62:23]
  wire  execute_io_exmem_mem_xcall; // @[Patmos.scala 62:23]
  wire  execute_io_exmem_mem_xret; // @[Patmos.scala 62:23]
  wire [4:0] execute_io_exmem_mem_xsrc; // @[Patmos.scala 62:23]
  wire  execute_io_exmem_mem_illOp; // @[Patmos.scala 62:23]
  wire  execute_io_exmem_mem_nonDelayed; // @[Patmos.scala 62:23]
  wire [29:0] execute_io_exmem_base; // @[Patmos.scala 62:23]
  wire [29:0] execute_io_exmem_relPc; // @[Patmos.scala 62:23]
  wire  execute_io_exicache_doCallRet; // @[Patmos.scala 62:23]
  wire [31:0] execute_io_exicache_callRetBase; // @[Patmos.scala 62:23]
  wire [31:0] execute_io_exicache_callRetAddr; // @[Patmos.scala 62:23]
  wire [29:0] execute_io_feex_pc; // @[Patmos.scala 62:23]
  wire [4:0] execute_io_exResult_0_addr; // @[Patmos.scala 62:23]
  wire [31:0] execute_io_exResult_0_data; // @[Patmos.scala 62:23]
  wire  execute_io_exResult_0_valid; // @[Patmos.scala 62:23]
  wire [4:0] execute_io_memResult_0_addr; // @[Patmos.scala 62:23]
  wire [31:0] execute_io_memResult_0_data; // @[Patmos.scala 62:23]
  wire  execute_io_memResult_0_valid; // @[Patmos.scala 62:23]
  wire  execute_io_exfe_doBranch; // @[Patmos.scala 62:23]
  wire [29:0] execute_io_exfe_branchPc; // @[Patmos.scala 62:23]
  wire [2:0] execute_io_exsc_op; // @[Patmos.scala 62:23]
  wire [31:0] execute_io_exsc_opData; // @[Patmos.scala 62:23]
  wire [31:0] execute_io_exsc_opOff; // @[Patmos.scala 62:23]
  wire [31:0] execute_io_scex_stackTop; // @[Patmos.scala 62:23]
  wire [31:0] execute_io_scex_memTop; // @[Patmos.scala 62:23]
  wire  memory_clock; // @[Patmos.scala 63:22]
  wire  memory_reset; // @[Patmos.scala 63:22]
  wire  memory_io_ena_out; // @[Patmos.scala 63:22]
  wire  memory_io_ena_in; // @[Patmos.scala 63:22]
  wire  memory_io_flush; // @[Patmos.scala 63:22]
  wire [4:0] memory_io_exmem_rd_0_addr; // @[Patmos.scala 63:22]
  wire [31:0] memory_io_exmem_rd_0_data; // @[Patmos.scala 63:22]
  wire  memory_io_exmem_rd_0_valid; // @[Patmos.scala 63:22]
  wire  memory_io_exmem_mem_load; // @[Patmos.scala 63:22]
  wire  memory_io_exmem_mem_store; // @[Patmos.scala 63:22]
  wire  memory_io_exmem_mem_hword; // @[Patmos.scala 63:22]
  wire  memory_io_exmem_mem_byte; // @[Patmos.scala 63:22]
  wire  memory_io_exmem_mem_zext; // @[Patmos.scala 63:22]
  wire [1:0] memory_io_exmem_mem_typ; // @[Patmos.scala 63:22]
  wire [31:0] memory_io_exmem_mem_addr; // @[Patmos.scala 63:22]
  wire [31:0] memory_io_exmem_mem_data; // @[Patmos.scala 63:22]
  wire  memory_io_exmem_mem_call; // @[Patmos.scala 63:22]
  wire  memory_io_exmem_mem_ret; // @[Patmos.scala 63:22]
  wire  memory_io_exmem_mem_brcf; // @[Patmos.scala 63:22]
  wire  memory_io_exmem_mem_trap; // @[Patmos.scala 63:22]
  wire  memory_io_exmem_mem_xcall; // @[Patmos.scala 63:22]
  wire  memory_io_exmem_mem_xret; // @[Patmos.scala 63:22]
  wire [4:0] memory_io_exmem_mem_xsrc; // @[Patmos.scala 63:22]
  wire  memory_io_exmem_mem_illOp; // @[Patmos.scala 63:22]
  wire  memory_io_exmem_mem_nonDelayed; // @[Patmos.scala 63:22]
  wire [29:0] memory_io_exmem_base; // @[Patmos.scala 63:22]
  wire [29:0] memory_io_exmem_relPc; // @[Patmos.scala 63:22]
  wire [4:0] memory_io_memwb_rd_0_addr; // @[Patmos.scala 63:22]
  wire [31:0] memory_io_memwb_rd_0_data; // @[Patmos.scala 63:22]
  wire  memory_io_memwb_rd_0_valid; // @[Patmos.scala 63:22]
  wire  memory_io_memfe_doCallRet; // @[Patmos.scala 63:22]
  wire [4:0] memory_io_exResult_0_addr; // @[Patmos.scala 63:22]
  wire [31:0] memory_io_exResult_0_data; // @[Patmos.scala 63:22]
  wire  memory_io_exResult_0_valid; // @[Patmos.scala 63:22]
  wire [2:0] memory_io_localInOut_M_Cmd; // @[Patmos.scala 63:22]
  wire [31:0] memory_io_localInOut_M_Addr; // @[Patmos.scala 63:22]
  wire [31:0] memory_io_localInOut_M_Data; // @[Patmos.scala 63:22]
  wire [3:0] memory_io_localInOut_M_ByteEn; // @[Patmos.scala 63:22]
  wire [1:0] memory_io_localInOut_S_Resp; // @[Patmos.scala 63:22]
  wire [31:0] memory_io_localInOut_S_Data; // @[Patmos.scala 63:22]
  wire [2:0] memory_io_globalInOut_M_Cmd; // @[Patmos.scala 63:22]
  wire [31:0] memory_io_globalInOut_M_Addr; // @[Patmos.scala 63:22]
  wire [31:0] memory_io_globalInOut_M_Data; // @[Patmos.scala 63:22]
  wire [3:0] memory_io_globalInOut_M_ByteEn; // @[Patmos.scala 63:22]
  wire [1:0] memory_io_globalInOut_M_AddrSpace; // @[Patmos.scala 63:22]
  wire [1:0] memory_io_globalInOut_S_Resp; // @[Patmos.scala 63:22]
  wire [31:0] memory_io_globalInOut_S_Data; // @[Patmos.scala 63:22]
  wire  memory_io_exc_call; // @[Patmos.scala 63:22]
  wire  memory_io_exc_ret; // @[Patmos.scala 63:22]
  wire [4:0] memory_io_exc_src; // @[Patmos.scala 63:22]
  wire  memory_io_exc_exc; // @[Patmos.scala 63:22]
  wire [29:0] memory_io_exc_excBase; // @[Patmos.scala 63:22]
  wire [29:0] memory_io_exc_excAddr; // @[Patmos.scala 63:22]
  wire [4:0] writeback_io_memwb_rd_0_addr; // @[Patmos.scala 64:25]
  wire [31:0] writeback_io_memwb_rd_0_data; // @[Patmos.scala 64:25]
  wire  writeback_io_memwb_rd_0_valid; // @[Patmos.scala 64:25]
  wire [4:0] writeback_io_rfWrite_0_addr; // @[Patmos.scala 64:25]
  wire [31:0] writeback_io_rfWrite_0_data; // @[Patmos.scala 64:25]
  wire  writeback_io_rfWrite_0_valid; // @[Patmos.scala 64:25]
  wire [4:0] writeback_io_memResult_0_addr; // @[Patmos.scala 64:25]
  wire [31:0] writeback_io_memResult_0_data; // @[Patmos.scala 64:25]
  wire  writeback_io_memResult_0_valid; // @[Patmos.scala 64:25]
  wire  exc_clock; // @[Patmos.scala 65:19]
  wire  exc_reset; // @[Patmos.scala 65:19]
  wire  exc_io_ena; // @[Patmos.scala 65:19]
  wire [2:0] exc_io_ocp_M_Cmd; // @[Patmos.scala 65:19]
  wire [31:0] exc_io_ocp_M_Addr; // @[Patmos.scala 65:19]
  wire [31:0] exc_io_ocp_M_Data; // @[Patmos.scala 65:19]
  wire [1:0] exc_io_ocp_S_Resp; // @[Patmos.scala 65:19]
  wire [31:0] exc_io_ocp_S_Data; // @[Patmos.scala 65:19]
  wire  exc_io_intrs_0; // @[Patmos.scala 65:19]
  wire  exc_io_intrs_1; // @[Patmos.scala 65:19]
  wire  exc_io_excdec_exc; // @[Patmos.scala 65:19]
  wire [29:0] exc_io_excdec_excBase; // @[Patmos.scala 65:19]
  wire [29:0] exc_io_excdec_excAddr; // @[Patmos.scala 65:19]
  wire  exc_io_excdec_intr; // @[Patmos.scala 65:19]
  wire [31:0] exc_io_excdec_addr; // @[Patmos.scala 65:19]
  wire [4:0] exc_io_excdec_src; // @[Patmos.scala 65:19]
  wire  exc_io_excdec_local; // @[Patmos.scala 65:19]
  wire  exc_io_memexc_call; // @[Patmos.scala 65:19]
  wire  exc_io_memexc_ret; // @[Patmos.scala 65:19]
  wire [4:0] exc_io_memexc_src; // @[Patmos.scala 65:19]
  wire  exc_io_memexc_exc; // @[Patmos.scala 65:19]
  wire [29:0] exc_io_memexc_excBase; // @[Patmos.scala 65:19]
  wire [29:0] exc_io_memexc_excAddr; // @[Patmos.scala 65:19]
  wire  dcache_clock; // @[Patmos.scala 67:22]
  wire  dcache_reset; // @[Patmos.scala 67:22]
  wire [2:0] dcache_io_master_M_Cmd; // @[Patmos.scala 67:22]
  wire [31:0] dcache_io_master_M_Addr; // @[Patmos.scala 67:22]
  wire [31:0] dcache_io_master_M_Data; // @[Patmos.scala 67:22]
  wire [3:0] dcache_io_master_M_ByteEn; // @[Patmos.scala 67:22]
  wire [1:0] dcache_io_master_M_AddrSpace; // @[Patmos.scala 67:22]
  wire [1:0] dcache_io_master_S_Resp; // @[Patmos.scala 67:22]
  wire [31:0] dcache_io_master_S_Data; // @[Patmos.scala 67:22]
  wire [2:0] dcache_io_slave_M_Cmd; // @[Patmos.scala 67:22]
  wire [31:0] dcache_io_slave_M_Addr; // @[Patmos.scala 67:22]
  wire [31:0] dcache_io_slave_M_Data; // @[Patmos.scala 67:22]
  wire  dcache_io_slave_M_DataValid; // @[Patmos.scala 67:22]
  wire [3:0] dcache_io_slave_M_DataByteEn; // @[Patmos.scala 67:22]
  wire [1:0] dcache_io_slave_S_Resp; // @[Patmos.scala 67:22]
  wire [31:0] dcache_io_slave_S_Data; // @[Patmos.scala 67:22]
  wire  dcache_io_slave_S_CmdAccept; // @[Patmos.scala 67:22]
  wire  dcache_io_slave_S_DataAccept; // @[Patmos.scala 67:22]
  wire  dcache_io_scIO_ena_in; // @[Patmos.scala 67:22]
  wire [2:0] dcache_io_scIO_exsc_op; // @[Patmos.scala 67:22]
  wire [31:0] dcache_io_scIO_exsc_opData; // @[Patmos.scala 67:22]
  wire [31:0] dcache_io_scIO_exsc_opOff; // @[Patmos.scala 67:22]
  wire [31:0] dcache_io_scIO_scex_stackTop; // @[Patmos.scala 67:22]
  wire [31:0] dcache_io_scIO_scex_memTop; // @[Patmos.scala 67:22]
  wire [2:0] burstBus_io_master_M_Cmd; // @[Patmos.scala 112:24]
  wire [31:0] burstBus_io_master_M_Addr; // @[Patmos.scala 112:24]
  wire [31:0] burstBus_io_master_M_Data; // @[Patmos.scala 112:24]
  wire  burstBus_io_master_M_DataValid; // @[Patmos.scala 112:24]
  wire [3:0] burstBus_io_master_M_DataByteEn; // @[Patmos.scala 112:24]
  wire [1:0] burstBus_io_master_S_Resp; // @[Patmos.scala 112:24]
  wire [31:0] burstBus_io_master_S_Data; // @[Patmos.scala 112:24]
  wire  burstBus_io_master_S_CmdAccept; // @[Patmos.scala 112:24]
  wire  burstBus_io_master_S_DataAccept; // @[Patmos.scala 112:24]
  wire [2:0] burstBus_io_slave_M_Cmd; // @[Patmos.scala 112:24]
  wire [31:0] burstBus_io_slave_M_Addr; // @[Patmos.scala 112:24]
  wire [31:0] burstBus_io_slave_M_Data; // @[Patmos.scala 112:24]
  wire  burstBus_io_slave_M_DataValid; // @[Patmos.scala 112:24]
  wire [3:0] burstBus_io_slave_M_DataByteEn; // @[Patmos.scala 112:24]
  wire [1:0] burstBus_io_slave_S_Resp; // @[Patmos.scala 112:24]
  wire [31:0] burstBus_io_slave_S_Data; // @[Patmos.scala 112:24]
  wire  burstBus_io_slave_S_CmdAccept; // @[Patmos.scala 112:24]
  wire  burstBus_io_slave_S_DataAccept; // @[Patmos.scala 112:24]
  wire [2:0] mmu_io_virt_M_Cmd; // @[Patmos.scala 124:19]
  wire [31:0] mmu_io_virt_M_Addr; // @[Patmos.scala 124:19]
  wire [31:0] mmu_io_virt_M_Data; // @[Patmos.scala 124:19]
  wire  mmu_io_virt_M_DataValid; // @[Patmos.scala 124:19]
  wire [3:0] mmu_io_virt_M_DataByteEn; // @[Patmos.scala 124:19]
  wire [1:0] mmu_io_virt_S_Resp; // @[Patmos.scala 124:19]
  wire [31:0] mmu_io_virt_S_Data; // @[Patmos.scala 124:19]
  wire  mmu_io_virt_S_CmdAccept; // @[Patmos.scala 124:19]
  wire  mmu_io_virt_S_DataAccept; // @[Patmos.scala 124:19]
  wire [2:0] mmu_io_phys_M_Cmd; // @[Patmos.scala 124:19]
  wire [20:0] mmu_io_phys_M_Addr; // @[Patmos.scala 124:19]
  wire [31:0] mmu_io_phys_M_Data; // @[Patmos.scala 124:19]
  wire  mmu_io_phys_M_DataValid; // @[Patmos.scala 124:19]
  wire [3:0] mmu_io_phys_M_DataByteEn; // @[Patmos.scala 124:19]
  wire [1:0] mmu_io_phys_S_Resp; // @[Patmos.scala 124:19]
  wire [31:0] mmu_io_phys_S_Data; // @[Patmos.scala 124:19]
  wire  mmu_io_phys_S_CmdAccept; // @[Patmos.scala 124:19]
  wire  mmu_io_phys_S_DataAccept; // @[Patmos.scala 124:19]
  wire  _T_6 = ~io_boot_pc_stall; // @[Patmos.scala 134:23]
  reg  enableReg; // @[Patmos.scala 147:22]
  NullICache icache ( // @[Patmos.scala 46:13]
    .clock(icache_clock),
    .reset(icache_reset),
    .io_ena_in(icache_io_ena_in),
    .io_exicache_doCallRet(icache_io_exicache_doCallRet),
    .io_exicache_callRetBase(icache_io_exicache_callRetBase),
    .io_exicache_callRetAddr(icache_io_exicache_callRetAddr),
    .io_icachefe_base(icache_io_icachefe_base),
    .io_icachefe_relBase(icache_io_icachefe_relBase),
    .io_icachefe_relPc(icache_io_icachefe_relPc),
    .io_icachefe_reloc(icache_io_icachefe_reloc),
    .io_icachefe_memSel(icache_io_icachefe_memSel)
  );
  Fetch fetch ( // @[Patmos.scala 60:21]
    .clock(fetch_clock),
    .reset(fetch_reset),
    .io_ena(fetch_io_ena),
    .io_fedec_instr_a(fetch_io_fedec_instr_a),
    .io_fedec_instr_b(fetch_io_fedec_instr_b),
    .io_fedec_pc(fetch_io_fedec_pc),
    .io_fedec_base(fetch_io_fedec_base),
    .io_fedec_reloc(fetch_io_fedec_reloc),
    .io_fedec_relPc(fetch_io_fedec_relPc),
    .io_feex_pc(fetch_io_feex_pc),
    .io_exfe_doBranch(fetch_io_exfe_doBranch),
    .io_exfe_branchPc(fetch_io_exfe_branchPc),
    .io_memfe_doCallRet(fetch_io_memfe_doCallRet),
    .io_icachefe_base(fetch_io_icachefe_base),
    .io_icachefe_relBase(fetch_io_icachefe_relBase),
    .io_icachefe_relPc(fetch_io_icachefe_relPc),
    .io_icachefe_reloc(fetch_io_icachefe_reloc),
    .io_icachefe_memSel(fetch_io_icachefe_memSel),
    .io_boot_pc_bootAddr(fetch_io_boot_pc_bootAddr),
    .io_boot_bootMemWr_enaEven(fetch_io_boot_bootMemWr_enaEven),
    .io_boot_bootMemWr_addrEven(fetch_io_boot_bootMemWr_addrEven),
    .io_boot_bootMemWr_dataEven(fetch_io_boot_bootMemWr_dataEven),
    .io_boot_bootMemWr_enaOdd(fetch_io_boot_bootMemWr_enaOdd),
    .io_boot_bootMemWr_addrOdd(fetch_io_boot_bootMemWr_addrOdd),
    .io_boot_bootMemWr_dataOdd(fetch_io_boot_bootMemWr_dataOdd)
  );
  Decode decode ( // @[Patmos.scala 61:22]
    .clock(decode_clock),
    .reset(decode_reset),
    .io_ena(decode_io_ena),
    .io_flush(decode_io_flush),
    .io_fedec_instr_a(decode_io_fedec_instr_a),
    .io_fedec_instr_b(decode_io_fedec_instr_b),
    .io_fedec_pc(decode_io_fedec_pc),
    .io_fedec_base(decode_io_fedec_base),
    .io_fedec_reloc(decode_io_fedec_reloc),
    .io_fedec_relPc(decode_io_fedec_relPc),
    .io_decex_base(decode_io_decex_base),
    .io_decex_relPc(decode_io_decex_relPc),
    .io_decex_pred_0(decode_io_decex_pred_0),
    .io_decex_aluOp_0_func(decode_io_decex_aluOp_0_func),
    .io_decex_aluOp_0_isMul(decode_io_decex_aluOp_0_isMul),
    .io_decex_aluOp_0_isCmp(decode_io_decex_aluOp_0_isCmp),
    .io_decex_aluOp_0_isPred(decode_io_decex_aluOp_0_isPred),
    .io_decex_aluOp_0_isBCpy(decode_io_decex_aluOp_0_isBCpy),
    .io_decex_aluOp_0_isMTS(decode_io_decex_aluOp_0_isMTS),
    .io_decex_aluOp_0_isMFS(decode_io_decex_aluOp_0_isMFS),
    .io_decex_predOp_0_func(decode_io_decex_predOp_0_func),
    .io_decex_predOp_0_dest(decode_io_decex_predOp_0_dest),
    .io_decex_predOp_0_s1Addr(decode_io_decex_predOp_0_s1Addr),
    .io_decex_predOp_0_s2Addr(decode_io_decex_predOp_0_s2Addr),
    .io_decex_jmpOp_branch(decode_io_decex_jmpOp_branch),
    .io_decex_jmpOp_target(decode_io_decex_jmpOp_target),
    .io_decex_jmpOp_reloc(decode_io_decex_jmpOp_reloc),
    .io_decex_memOp_load(decode_io_decex_memOp_load),
    .io_decex_memOp_store(decode_io_decex_memOp_store),
    .io_decex_memOp_hword(decode_io_decex_memOp_hword),
    .io_decex_memOp_byte(decode_io_decex_memOp_byte),
    .io_decex_memOp_zext(decode_io_decex_memOp_zext),
    .io_decex_memOp_typ(decode_io_decex_memOp_typ),
    .io_decex_stackOp(decode_io_decex_stackOp),
    .io_decex_rsAddr_0(decode_io_decex_rsAddr_0),
    .io_decex_rsAddr_1(decode_io_decex_rsAddr_1),
    .io_decex_rsData_0(decode_io_decex_rsData_0),
    .io_decex_rsData_1(decode_io_decex_rsData_1),
    .io_decex_rdAddr_0(decode_io_decex_rdAddr_0),
    .io_decex_immVal_0(decode_io_decex_immVal_0),
    .io_decex_immOp_0(decode_io_decex_immOp_0),
    .io_decex_wrRd_0(decode_io_decex_wrRd_0),
    .io_decex_callAddr(decode_io_decex_callAddr),
    .io_decex_call(decode_io_decex_call),
    .io_decex_ret(decode_io_decex_ret),
    .io_decex_brcf(decode_io_decex_brcf),
    .io_decex_trap(decode_io_decex_trap),
    .io_decex_xcall(decode_io_decex_xcall),
    .io_decex_xret(decode_io_decex_xret),
    .io_decex_xsrc(decode_io_decex_xsrc),
    .io_decex_nonDelayed(decode_io_decex_nonDelayed),
    .io_decex_illOp(decode_io_decex_illOp),
    .io_rfWrite_0_addr(decode_io_rfWrite_0_addr),
    .io_rfWrite_0_data(decode_io_rfWrite_0_data),
    .io_rfWrite_0_valid(decode_io_rfWrite_0_valid),
    .io_exc_exc(decode_io_exc_exc),
    .io_exc_excBase(decode_io_exc_excBase),
    .io_exc_excAddr(decode_io_exc_excAddr),
    .io_exc_intr(decode_io_exc_intr),
    .io_exc_addr(decode_io_exc_addr),
    .io_exc_src(decode_io_exc_src),
    .io_exc_local(decode_io_exc_local)
  );
  Execute execute ( // @[Patmos.scala 62:23]
    .clock(execute_clock),
    .reset(execute_reset),
    .io_ena_in(execute_io_ena_in),
    .io_flush(execute_io_flush),
    .io_brflush(execute_io_brflush),
    .io_decex_base(execute_io_decex_base),
    .io_decex_relPc(execute_io_decex_relPc),
    .io_decex_pred_0(execute_io_decex_pred_0),
    .io_decex_aluOp_0_func(execute_io_decex_aluOp_0_func),
    .io_decex_aluOp_0_isMul(execute_io_decex_aluOp_0_isMul),
    .io_decex_aluOp_0_isCmp(execute_io_decex_aluOp_0_isCmp),
    .io_decex_aluOp_0_isPred(execute_io_decex_aluOp_0_isPred),
    .io_decex_aluOp_0_isBCpy(execute_io_decex_aluOp_0_isBCpy),
    .io_decex_aluOp_0_isMTS(execute_io_decex_aluOp_0_isMTS),
    .io_decex_aluOp_0_isMFS(execute_io_decex_aluOp_0_isMFS),
    .io_decex_predOp_0_func(execute_io_decex_predOp_0_func),
    .io_decex_predOp_0_dest(execute_io_decex_predOp_0_dest),
    .io_decex_predOp_0_s1Addr(execute_io_decex_predOp_0_s1Addr),
    .io_decex_predOp_0_s2Addr(execute_io_decex_predOp_0_s2Addr),
    .io_decex_jmpOp_branch(execute_io_decex_jmpOp_branch),
    .io_decex_jmpOp_target(execute_io_decex_jmpOp_target),
    .io_decex_jmpOp_reloc(execute_io_decex_jmpOp_reloc),
    .io_decex_memOp_load(execute_io_decex_memOp_load),
    .io_decex_memOp_store(execute_io_decex_memOp_store),
    .io_decex_memOp_hword(execute_io_decex_memOp_hword),
    .io_decex_memOp_byte(execute_io_decex_memOp_byte),
    .io_decex_memOp_zext(execute_io_decex_memOp_zext),
    .io_decex_memOp_typ(execute_io_decex_memOp_typ),
    .io_decex_stackOp(execute_io_decex_stackOp),
    .io_decex_rsAddr_0(execute_io_decex_rsAddr_0),
    .io_decex_rsAddr_1(execute_io_decex_rsAddr_1),
    .io_decex_rsData_0(execute_io_decex_rsData_0),
    .io_decex_rsData_1(execute_io_decex_rsData_1),
    .io_decex_rdAddr_0(execute_io_decex_rdAddr_0),
    .io_decex_immVal_0(execute_io_decex_immVal_0),
    .io_decex_immOp_0(execute_io_decex_immOp_0),
    .io_decex_wrRd_0(execute_io_decex_wrRd_0),
    .io_decex_callAddr(execute_io_decex_callAddr),
    .io_decex_call(execute_io_decex_call),
    .io_decex_ret(execute_io_decex_ret),
    .io_decex_brcf(execute_io_decex_brcf),
    .io_decex_trap(execute_io_decex_trap),
    .io_decex_xcall(execute_io_decex_xcall),
    .io_decex_xret(execute_io_decex_xret),
    .io_decex_xsrc(execute_io_decex_xsrc),
    .io_decex_nonDelayed(execute_io_decex_nonDelayed),
    .io_decex_illOp(execute_io_decex_illOp),
    .io_exmem_rd_0_addr(execute_io_exmem_rd_0_addr),
    .io_exmem_rd_0_data(execute_io_exmem_rd_0_data),
    .io_exmem_rd_0_valid(execute_io_exmem_rd_0_valid),
    .io_exmem_mem_load(execute_io_exmem_mem_load),
    .io_exmem_mem_store(execute_io_exmem_mem_store),
    .io_exmem_mem_hword(execute_io_exmem_mem_hword),
    .io_exmem_mem_byte(execute_io_exmem_mem_byte),
    .io_exmem_mem_zext(execute_io_exmem_mem_zext),
    .io_exmem_mem_typ(execute_io_exmem_mem_typ),
    .io_exmem_mem_addr(execute_io_exmem_mem_addr),
    .io_exmem_mem_data(execute_io_exmem_mem_data),
    .io_exmem_mem_call(execute_io_exmem_mem_call),
    .io_exmem_mem_ret(execute_io_exmem_mem_ret),
    .io_exmem_mem_brcf(execute_io_exmem_mem_brcf),
    .io_exmem_mem_trap(execute_io_exmem_mem_trap),
    .io_exmem_mem_xcall(execute_io_exmem_mem_xcall),
    .io_exmem_mem_xret(execute_io_exmem_mem_xret),
    .io_exmem_mem_xsrc(execute_io_exmem_mem_xsrc),
    .io_exmem_mem_illOp(execute_io_exmem_mem_illOp),
    .io_exmem_mem_nonDelayed(execute_io_exmem_mem_nonDelayed),
    .io_exmem_base(execute_io_exmem_base),
    .io_exmem_relPc(execute_io_exmem_relPc),
    .io_exicache_doCallRet(execute_io_exicache_doCallRet),
    .io_exicache_callRetBase(execute_io_exicache_callRetBase),
    .io_exicache_callRetAddr(execute_io_exicache_callRetAddr),
    .io_feex_pc(execute_io_feex_pc),
    .io_exResult_0_addr(execute_io_exResult_0_addr),
    .io_exResult_0_data(execute_io_exResult_0_data),
    .io_exResult_0_valid(execute_io_exResult_0_valid),
    .io_memResult_0_addr(execute_io_memResult_0_addr),
    .io_memResult_0_data(execute_io_memResult_0_data),
    .io_memResult_0_valid(execute_io_memResult_0_valid),
    .io_exfe_doBranch(execute_io_exfe_doBranch),
    .io_exfe_branchPc(execute_io_exfe_branchPc),
    .io_exsc_op(execute_io_exsc_op),
    .io_exsc_opData(execute_io_exsc_opData),
    .io_exsc_opOff(execute_io_exsc_opOff),
    .io_scex_stackTop(execute_io_scex_stackTop),
    .io_scex_memTop(execute_io_scex_memTop)
  );
  Memory memory ( // @[Patmos.scala 63:22]
    .clock(memory_clock),
    .reset(memory_reset),
    .io_ena_out(memory_io_ena_out),
    .io_ena_in(memory_io_ena_in),
    .io_flush(memory_io_flush),
    .io_exmem_rd_0_addr(memory_io_exmem_rd_0_addr),
    .io_exmem_rd_0_data(memory_io_exmem_rd_0_data),
    .io_exmem_rd_0_valid(memory_io_exmem_rd_0_valid),
    .io_exmem_mem_load(memory_io_exmem_mem_load),
    .io_exmem_mem_store(memory_io_exmem_mem_store),
    .io_exmem_mem_hword(memory_io_exmem_mem_hword),
    .io_exmem_mem_byte(memory_io_exmem_mem_byte),
    .io_exmem_mem_zext(memory_io_exmem_mem_zext),
    .io_exmem_mem_typ(memory_io_exmem_mem_typ),
    .io_exmem_mem_addr(memory_io_exmem_mem_addr),
    .io_exmem_mem_data(memory_io_exmem_mem_data),
    .io_exmem_mem_call(memory_io_exmem_mem_call),
    .io_exmem_mem_ret(memory_io_exmem_mem_ret),
    .io_exmem_mem_brcf(memory_io_exmem_mem_brcf),
    .io_exmem_mem_trap(memory_io_exmem_mem_trap),
    .io_exmem_mem_xcall(memory_io_exmem_mem_xcall),
    .io_exmem_mem_xret(memory_io_exmem_mem_xret),
    .io_exmem_mem_xsrc(memory_io_exmem_mem_xsrc),
    .io_exmem_mem_illOp(memory_io_exmem_mem_illOp),
    .io_exmem_mem_nonDelayed(memory_io_exmem_mem_nonDelayed),
    .io_exmem_base(memory_io_exmem_base),
    .io_exmem_relPc(memory_io_exmem_relPc),
    .io_memwb_rd_0_addr(memory_io_memwb_rd_0_addr),
    .io_memwb_rd_0_data(memory_io_memwb_rd_0_data),
    .io_memwb_rd_0_valid(memory_io_memwb_rd_0_valid),
    .io_memfe_doCallRet(memory_io_memfe_doCallRet),
    .io_exResult_0_addr(memory_io_exResult_0_addr),
    .io_exResult_0_data(memory_io_exResult_0_data),
    .io_exResult_0_valid(memory_io_exResult_0_valid),
    .io_localInOut_M_Cmd(memory_io_localInOut_M_Cmd),
    .io_localInOut_M_Addr(memory_io_localInOut_M_Addr),
    .io_localInOut_M_Data(memory_io_localInOut_M_Data),
    .io_localInOut_M_ByteEn(memory_io_localInOut_M_ByteEn),
    .io_localInOut_S_Resp(memory_io_localInOut_S_Resp),
    .io_localInOut_S_Data(memory_io_localInOut_S_Data),
    .io_globalInOut_M_Cmd(memory_io_globalInOut_M_Cmd),
    .io_globalInOut_M_Addr(memory_io_globalInOut_M_Addr),
    .io_globalInOut_M_Data(memory_io_globalInOut_M_Data),
    .io_globalInOut_M_ByteEn(memory_io_globalInOut_M_ByteEn),
    .io_globalInOut_M_AddrSpace(memory_io_globalInOut_M_AddrSpace),
    .io_globalInOut_S_Resp(memory_io_globalInOut_S_Resp),
    .io_globalInOut_S_Data(memory_io_globalInOut_S_Data),
    .io_exc_call(memory_io_exc_call),
    .io_exc_ret(memory_io_exc_ret),
    .io_exc_src(memory_io_exc_src),
    .io_exc_exc(memory_io_exc_exc),
    .io_exc_excBase(memory_io_exc_excBase),
    .io_exc_excAddr(memory_io_exc_excAddr)
  );
  WriteBack writeback ( // @[Patmos.scala 64:25]
    .io_memwb_rd_0_addr(writeback_io_memwb_rd_0_addr),
    .io_memwb_rd_0_data(writeback_io_memwb_rd_0_data),
    .io_memwb_rd_0_valid(writeback_io_memwb_rd_0_valid),
    .io_rfWrite_0_addr(writeback_io_rfWrite_0_addr),
    .io_rfWrite_0_data(writeback_io_rfWrite_0_data),
    .io_rfWrite_0_valid(writeback_io_rfWrite_0_valid),
    .io_memResult_0_addr(writeback_io_memResult_0_addr),
    .io_memResult_0_data(writeback_io_memResult_0_data),
    .io_memResult_0_valid(writeback_io_memResult_0_valid)
  );
  Exceptions exc ( // @[Patmos.scala 65:19]
    .clock(exc_clock),
    .reset(exc_reset),
    .io_ena(exc_io_ena),
    .io_ocp_M_Cmd(exc_io_ocp_M_Cmd),
    .io_ocp_M_Addr(exc_io_ocp_M_Addr),
    .io_ocp_M_Data(exc_io_ocp_M_Data),
    .io_ocp_S_Resp(exc_io_ocp_S_Resp),
    .io_ocp_S_Data(exc_io_ocp_S_Data),
    .io_intrs_0(exc_io_intrs_0),
    .io_intrs_1(exc_io_intrs_1),
    .io_excdec_exc(exc_io_excdec_exc),
    .io_excdec_excBase(exc_io_excdec_excBase),
    .io_excdec_excAddr(exc_io_excdec_excAddr),
    .io_excdec_intr(exc_io_excdec_intr),
    .io_excdec_addr(exc_io_excdec_addr),
    .io_excdec_src(exc_io_excdec_src),
    .io_excdec_local(exc_io_excdec_local),
    .io_memexc_call(exc_io_memexc_call),
    .io_memexc_ret(exc_io_memexc_ret),
    .io_memexc_src(exc_io_memexc_src),
    .io_memexc_exc(exc_io_memexc_exc),
    .io_memexc_excBase(exc_io_memexc_excBase),
    .io_memexc_excAddr(exc_io_memexc_excAddr)
  );
  DataCache dcache ( // @[Patmos.scala 67:22]
    .clock(dcache_clock),
    .reset(dcache_reset),
    .io_master_M_Cmd(dcache_io_master_M_Cmd),
    .io_master_M_Addr(dcache_io_master_M_Addr),
    .io_master_M_Data(dcache_io_master_M_Data),
    .io_master_M_ByteEn(dcache_io_master_M_ByteEn),
    .io_master_M_AddrSpace(dcache_io_master_M_AddrSpace),
    .io_master_S_Resp(dcache_io_master_S_Resp),
    .io_master_S_Data(dcache_io_master_S_Data),
    .io_slave_M_Cmd(dcache_io_slave_M_Cmd),
    .io_slave_M_Addr(dcache_io_slave_M_Addr),
    .io_slave_M_Data(dcache_io_slave_M_Data),
    .io_slave_M_DataValid(dcache_io_slave_M_DataValid),
    .io_slave_M_DataByteEn(dcache_io_slave_M_DataByteEn),
    .io_slave_S_Resp(dcache_io_slave_S_Resp),
    .io_slave_S_Data(dcache_io_slave_S_Data),
    .io_slave_S_CmdAccept(dcache_io_slave_S_CmdAccept),
    .io_slave_S_DataAccept(dcache_io_slave_S_DataAccept),
    .io_scIO_ena_in(dcache_io_scIO_ena_in),
    .io_scIO_exsc_op(dcache_io_scIO_exsc_op),
    .io_scIO_exsc_opData(dcache_io_scIO_exsc_opData),
    .io_scIO_exsc_opOff(dcache_io_scIO_exsc_opOff),
    .io_scIO_scex_stackTop(dcache_io_scIO_scex_stackTop),
    .io_scIO_scex_memTop(dcache_io_scIO_scex_memTop)
  );
  OcpBurstBus burstBus ( // @[Patmos.scala 112:24]
    .io_master_M_Cmd(burstBus_io_master_M_Cmd),
    .io_master_M_Addr(burstBus_io_master_M_Addr),
    .io_master_M_Data(burstBus_io_master_M_Data),
    .io_master_M_DataValid(burstBus_io_master_M_DataValid),
    .io_master_M_DataByteEn(burstBus_io_master_M_DataByteEn),
    .io_master_S_Resp(burstBus_io_master_S_Resp),
    .io_master_S_Data(burstBus_io_master_S_Data),
    .io_master_S_CmdAccept(burstBus_io_master_S_CmdAccept),
    .io_master_S_DataAccept(burstBus_io_master_S_DataAccept),
    .io_slave_M_Cmd(burstBus_io_slave_M_Cmd),
    .io_slave_M_Addr(burstBus_io_slave_M_Addr),
    .io_slave_M_Data(burstBus_io_slave_M_Data),
    .io_slave_M_DataValid(burstBus_io_slave_M_DataValid),
    .io_slave_M_DataByteEn(burstBus_io_slave_M_DataByteEn),
    .io_slave_S_Resp(burstBus_io_slave_S_Resp),
    .io_slave_S_Data(burstBus_io_slave_S_Data),
    .io_slave_S_CmdAccept(burstBus_io_slave_S_CmdAccept),
    .io_slave_S_DataAccept(burstBus_io_slave_S_DataAccept)
  );
  NoMemoryManagement mmu ( // @[Patmos.scala 124:19]
    .io_virt_M_Cmd(mmu_io_virt_M_Cmd),
    .io_virt_M_Addr(mmu_io_virt_M_Addr),
    .io_virt_M_Data(mmu_io_virt_M_Data),
    .io_virt_M_DataValid(mmu_io_virt_M_DataValid),
    .io_virt_M_DataByteEn(mmu_io_virt_M_DataByteEn),
    .io_virt_S_Resp(mmu_io_virt_S_Resp),
    .io_virt_S_Data(mmu_io_virt_S_Data),
    .io_virt_S_CmdAccept(mmu_io_virt_S_CmdAccept),
    .io_virt_S_DataAccept(mmu_io_virt_S_DataAccept),
    .io_phys_M_Cmd(mmu_io_phys_M_Cmd),
    .io_phys_M_Addr(mmu_io_phys_M_Addr),
    .io_phys_M_Data(mmu_io_phys_M_Data),
    .io_phys_M_DataValid(mmu_io_phys_M_DataValid),
    .io_phys_M_DataByteEn(mmu_io_phys_M_DataByteEn),
    .io_phys_S_Resp(mmu_io_phys_S_Resp),
    .io_phys_S_Data(mmu_io_phys_S_Data),
    .io_phys_S_CmdAccept(mmu_io_phys_S_CmdAccept),
    .io_phys_S_DataAccept(mmu_io_phys_S_DataAccept)
  );
  assign io_memPort_M_Cmd = mmu_io_phys_M_Cmd; // @[Patmos.scala 176:14]
  assign io_memPort_M_Addr = mmu_io_phys_M_Addr; // @[Patmos.scala 176:14]
  assign io_memPort_M_Data = mmu_io_phys_M_Data; // @[Patmos.scala 176:14]
  assign io_memPort_M_DataValid = mmu_io_phys_M_DataValid; // @[Patmos.scala 176:14]
  assign io_memPort_M_DataByteEn = mmu_io_phys_M_DataByteEn; // @[Patmos.scala 176:14]
  assign io_memInOut_M_Cmd = memory_io_localInOut_M_Cmd; // @[Patmos.scala 99:15]
  assign io_memInOut_M_Addr = memory_io_localInOut_M_Addr; // @[Patmos.scala 99:15]
  assign io_memInOut_M_Data = memory_io_localInOut_M_Data; // @[Patmos.scala 99:15]
  assign io_memInOut_M_ByteEn = memory_io_localInOut_M_ByteEn; // @[Patmos.scala 99:15]
  assign io_excInOut_S_Resp = exc_io_ocp_S_Resp; // @[Patmos.scala 102:15]
  assign io_excInOut_S_Data = exc_io_ocp_S_Data; // @[Patmos.scala 102:15]
  assign icache_clock = clock;
  assign icache_reset = reset;
  assign icache_io_ena_in = _T_6 & memory_io_ena_out; // @[Patmos.scala 135:38]
  assign icache_io_exicache_doCallRet = execute_io_exicache_doCallRet; // @[Patmos.scala 73:22]
  assign icache_io_exicache_callRetBase = execute_io_exicache_callRetBase; // @[Patmos.scala 73:22]
  assign icache_io_exicache_callRetAddr = execute_io_exicache_callRetAddr; // @[Patmos.scala 73:22]
  assign fetch_clock = clock;
  assign fetch_reset = reset;
  assign fetch_io_ena = _T_6 & memory_io_ena_out; // @[Patmos.scala 142:31]
  assign fetch_io_exfe_doBranch = execute_io_exfe_doBranch; // @[Patmos.scala 93:17]
  assign fetch_io_exfe_branchPc = execute_io_exfe_branchPc; // @[Patmos.scala 93:17]
  assign fetch_io_memfe_doCallRet = memory_io_memfe_doCallRet; // @[Patmos.scala 95:18]
  assign fetch_io_icachefe_base = icache_io_icachefe_base; // @[Patmos.scala 72:21]
  assign fetch_io_icachefe_relBase = icache_io_icachefe_relBase; // @[Patmos.scala 72:21]
  assign fetch_io_icachefe_relPc = icache_io_icachefe_relPc; // @[Patmos.scala 72:21]
  assign fetch_io_icachefe_reloc = icache_io_icachefe_reloc; // @[Patmos.scala 72:21]
  assign fetch_io_icachefe_memSel = icache_io_icachefe_memSel; // @[Patmos.scala 72:21]
  assign fetch_io_boot_pc_bootAddr = io_boot_pc_bootAddr; // @[Patmos.scala 68:17]
  assign fetch_io_boot_bootMemWr_enaEven = io_boot_bootMemWr_enaEven; // @[Patmos.scala 68:17]
  assign fetch_io_boot_bootMemWr_addrEven = io_boot_bootMemWr_addrEven; // @[Patmos.scala 68:17]
  assign fetch_io_boot_bootMemWr_dataEven = io_boot_bootMemWr_dataEven; // @[Patmos.scala 68:17]
  assign fetch_io_boot_bootMemWr_enaOdd = io_boot_bootMemWr_enaOdd; // @[Patmos.scala 68:17]
  assign fetch_io_boot_bootMemWr_addrOdd = io_boot_bootMemWr_addrOdd; // @[Patmos.scala 68:17]
  assign fetch_io_boot_bootMemWr_dataOdd = io_boot_bootMemWr_dataOdd; // @[Patmos.scala 68:17]
  assign decode_clock = clock;
  assign decode_reset = reset;
  assign decode_io_ena = _T_6 & memory_io_ena_out; // @[Patmos.scala 142:31]
  assign decode_io_flush = memory_io_flush | execute_io_brflush; // @[Patmos.scala 154:28]
  assign decode_io_fedec_instr_a = fetch_io_fedec_instr_a; // @[Patmos.scala 76:19]
  assign decode_io_fedec_instr_b = fetch_io_fedec_instr_b; // @[Patmos.scala 76:19]
  assign decode_io_fedec_pc = fetch_io_fedec_pc; // @[Patmos.scala 76:19]
  assign decode_io_fedec_base = fetch_io_fedec_base; // @[Patmos.scala 76:19]
  assign decode_io_fedec_reloc = fetch_io_fedec_reloc; // @[Patmos.scala 76:19]
  assign decode_io_fedec_relPc = fetch_io_fedec_relPc; // @[Patmos.scala 76:19]
  assign decode_io_rfWrite_0_addr = writeback_io_rfWrite_0_addr; // @[Patmos.scala 81:21]
  assign decode_io_rfWrite_0_data = writeback_io_rfWrite_0_data; // @[Patmos.scala 81:21]
  assign decode_io_rfWrite_0_valid = writeback_io_rfWrite_0_valid; // @[Patmos.scala 81:21]
  assign decode_io_exc_exc = exc_io_excdec_exc; // @[Patmos.scala 104:17]
  assign decode_io_exc_excBase = exc_io_excdec_excBase; // @[Patmos.scala 104:17]
  assign decode_io_exc_excAddr = exc_io_excdec_excAddr; // @[Patmos.scala 104:17]
  assign decode_io_exc_intr = exc_io_excdec_intr; // @[Patmos.scala 104:17]
  assign decode_io_exc_addr = exc_io_excdec_addr; // @[Patmos.scala 104:17]
  assign decode_io_exc_src = exc_io_excdec_src; // @[Patmos.scala 104:17]
  assign decode_io_exc_local = exc_io_excdec_local; // @[Patmos.scala 104:17]
  assign execute_clock = clock;
  assign execute_reset = reset;
  assign execute_io_ena_in = _T_6 & memory_io_ena_out; // @[Patmos.scala 139:39]
  assign execute_io_flush = memory_io_flush; // @[Patmos.scala 155:20]
  assign execute_io_decex_base = decode_io_decex_base; // @[Patmos.scala 77:20]
  assign execute_io_decex_relPc = decode_io_decex_relPc; // @[Patmos.scala 77:20]
  assign execute_io_decex_pred_0 = decode_io_decex_pred_0; // @[Patmos.scala 77:20]
  assign execute_io_decex_aluOp_0_func = decode_io_decex_aluOp_0_func; // @[Patmos.scala 77:20]
  assign execute_io_decex_aluOp_0_isMul = decode_io_decex_aluOp_0_isMul; // @[Patmos.scala 77:20]
  assign execute_io_decex_aluOp_0_isCmp = decode_io_decex_aluOp_0_isCmp; // @[Patmos.scala 77:20]
  assign execute_io_decex_aluOp_0_isPred = decode_io_decex_aluOp_0_isPred; // @[Patmos.scala 77:20]
  assign execute_io_decex_aluOp_0_isBCpy = decode_io_decex_aluOp_0_isBCpy; // @[Patmos.scala 77:20]
  assign execute_io_decex_aluOp_0_isMTS = decode_io_decex_aluOp_0_isMTS; // @[Patmos.scala 77:20]
  assign execute_io_decex_aluOp_0_isMFS = decode_io_decex_aluOp_0_isMFS; // @[Patmos.scala 77:20]
  assign execute_io_decex_predOp_0_func = decode_io_decex_predOp_0_func; // @[Patmos.scala 77:20]
  assign execute_io_decex_predOp_0_dest = decode_io_decex_predOp_0_dest; // @[Patmos.scala 77:20]
  assign execute_io_decex_predOp_0_s1Addr = decode_io_decex_predOp_0_s1Addr; // @[Patmos.scala 77:20]
  assign execute_io_decex_predOp_0_s2Addr = decode_io_decex_predOp_0_s2Addr; // @[Patmos.scala 77:20]
  assign execute_io_decex_jmpOp_branch = decode_io_decex_jmpOp_branch; // @[Patmos.scala 77:20]
  assign execute_io_decex_jmpOp_target = decode_io_decex_jmpOp_target; // @[Patmos.scala 77:20]
  assign execute_io_decex_jmpOp_reloc = decode_io_decex_jmpOp_reloc; // @[Patmos.scala 77:20]
  assign execute_io_decex_memOp_load = decode_io_decex_memOp_load; // @[Patmos.scala 77:20]
  assign execute_io_decex_memOp_store = decode_io_decex_memOp_store; // @[Patmos.scala 77:20]
  assign execute_io_decex_memOp_hword = decode_io_decex_memOp_hword; // @[Patmos.scala 77:20]
  assign execute_io_decex_memOp_byte = decode_io_decex_memOp_byte; // @[Patmos.scala 77:20]
  assign execute_io_decex_memOp_zext = decode_io_decex_memOp_zext; // @[Patmos.scala 77:20]
  assign execute_io_decex_memOp_typ = decode_io_decex_memOp_typ; // @[Patmos.scala 77:20]
  assign execute_io_decex_stackOp = decode_io_decex_stackOp; // @[Patmos.scala 77:20]
  assign execute_io_decex_rsAddr_0 = decode_io_decex_rsAddr_0; // @[Patmos.scala 77:20]
  assign execute_io_decex_rsAddr_1 = decode_io_decex_rsAddr_1; // @[Patmos.scala 77:20]
  assign execute_io_decex_rsData_0 = decode_io_decex_rsData_0; // @[Patmos.scala 77:20]
  assign execute_io_decex_rsData_1 = decode_io_decex_rsData_1; // @[Patmos.scala 77:20]
  assign execute_io_decex_rdAddr_0 = decode_io_decex_rdAddr_0; // @[Patmos.scala 77:20]
  assign execute_io_decex_immVal_0 = decode_io_decex_immVal_0; // @[Patmos.scala 77:20]
  assign execute_io_decex_immOp_0 = decode_io_decex_immOp_0; // @[Patmos.scala 77:20]
  assign execute_io_decex_wrRd_0 = decode_io_decex_wrRd_0; // @[Patmos.scala 77:20]
  assign execute_io_decex_callAddr = decode_io_decex_callAddr; // @[Patmos.scala 77:20]
  assign execute_io_decex_call = decode_io_decex_call; // @[Patmos.scala 77:20]
  assign execute_io_decex_ret = decode_io_decex_ret; // @[Patmos.scala 77:20]
  assign execute_io_decex_brcf = decode_io_decex_brcf; // @[Patmos.scala 77:20]
  assign execute_io_decex_trap = decode_io_decex_trap; // @[Patmos.scala 77:20]
  assign execute_io_decex_xcall = decode_io_decex_xcall; // @[Patmos.scala 77:20]
  assign execute_io_decex_xret = decode_io_decex_xret; // @[Patmos.scala 77:20]
  assign execute_io_decex_xsrc = decode_io_decex_xsrc; // @[Patmos.scala 77:20]
  assign execute_io_decex_nonDelayed = decode_io_decex_nonDelayed; // @[Patmos.scala 77:20]
  assign execute_io_decex_illOp = decode_io_decex_illOp; // @[Patmos.scala 77:20]
  assign execute_io_feex_pc = fetch_io_feex_pc; // @[Patmos.scala 97:19]
  assign execute_io_exResult_0_addr = memory_io_exResult_0_addr; // @[Patmos.scala 84:23]
  assign execute_io_exResult_0_data = memory_io_exResult_0_data; // @[Patmos.scala 84:23]
  assign execute_io_exResult_0_valid = memory_io_exResult_0_valid; // @[Patmos.scala 84:23]
  assign execute_io_memResult_0_addr = writeback_io_memResult_0_addr; // @[Patmos.scala 85:24]
  assign execute_io_memResult_0_data = writeback_io_memResult_0_data; // @[Patmos.scala 85:24]
  assign execute_io_memResult_0_valid = writeback_io_memResult_0_valid; // @[Patmos.scala 85:24]
  assign execute_io_scex_stackTop = dcache_io_scIO_scex_stackTop; // @[Patmos.scala 89:19]
  assign execute_io_scex_memTop = dcache_io_scIO_scex_memTop; // @[Patmos.scala 89:19]
  assign memory_clock = clock;
  assign memory_reset = reset;
  assign memory_io_ena_in = ~io_boot_pc_stall; // @[Patmos.scala 134:23]
  assign memory_io_exmem_rd_0_addr = execute_io_exmem_rd_0_addr; // @[Patmos.scala 78:19]
  assign memory_io_exmem_rd_0_data = execute_io_exmem_rd_0_data; // @[Patmos.scala 78:19]
  assign memory_io_exmem_rd_0_valid = execute_io_exmem_rd_0_valid; // @[Patmos.scala 78:19]
  assign memory_io_exmem_mem_load = execute_io_exmem_mem_load; // @[Patmos.scala 78:19]
  assign memory_io_exmem_mem_store = execute_io_exmem_mem_store; // @[Patmos.scala 78:19]
  assign memory_io_exmem_mem_hword = execute_io_exmem_mem_hword; // @[Patmos.scala 78:19]
  assign memory_io_exmem_mem_byte = execute_io_exmem_mem_byte; // @[Patmos.scala 78:19]
  assign memory_io_exmem_mem_zext = execute_io_exmem_mem_zext; // @[Patmos.scala 78:19]
  assign memory_io_exmem_mem_typ = execute_io_exmem_mem_typ; // @[Patmos.scala 78:19]
  assign memory_io_exmem_mem_addr = execute_io_exmem_mem_addr; // @[Patmos.scala 78:19]
  assign memory_io_exmem_mem_data = execute_io_exmem_mem_data; // @[Patmos.scala 78:19]
  assign memory_io_exmem_mem_call = execute_io_exmem_mem_call; // @[Patmos.scala 78:19]
  assign memory_io_exmem_mem_ret = execute_io_exmem_mem_ret; // @[Patmos.scala 78:19]
  assign memory_io_exmem_mem_brcf = execute_io_exmem_mem_brcf; // @[Patmos.scala 78:19]
  assign memory_io_exmem_mem_trap = execute_io_exmem_mem_trap; // @[Patmos.scala 78:19]
  assign memory_io_exmem_mem_xcall = execute_io_exmem_mem_xcall; // @[Patmos.scala 78:19]
  assign memory_io_exmem_mem_xret = execute_io_exmem_mem_xret; // @[Patmos.scala 78:19]
  assign memory_io_exmem_mem_xsrc = execute_io_exmem_mem_xsrc; // @[Patmos.scala 78:19]
  assign memory_io_exmem_mem_illOp = execute_io_exmem_mem_illOp; // @[Patmos.scala 78:19]
  assign memory_io_exmem_mem_nonDelayed = execute_io_exmem_mem_nonDelayed; // @[Patmos.scala 78:19]
  assign memory_io_exmem_base = execute_io_exmem_base; // @[Patmos.scala 78:19]
  assign memory_io_exmem_relPc = execute_io_exmem_relPc; // @[Patmos.scala 78:19]
  assign memory_io_localInOut_S_Resp = io_memInOut_S_Resp; // @[Patmos.scala 99:15]
  assign memory_io_localInOut_S_Data = io_memInOut_S_Data; // @[Patmos.scala 99:15]
  assign memory_io_globalInOut_S_Resp = dcache_io_master_S_Resp; // @[Patmos.scala 109:27]
  assign memory_io_globalInOut_S_Data = dcache_io_master_S_Data; // @[Patmos.scala 109:27]
  assign writeback_io_memwb_rd_0_addr = memory_io_memwb_rd_0_addr; // @[Patmos.scala 79:22]
  assign writeback_io_memwb_rd_0_data = memory_io_memwb_rd_0_data; // @[Patmos.scala 79:22]
  assign writeback_io_memwb_rd_0_valid = memory_io_memwb_rd_0_valid; // @[Patmos.scala 79:22]
  assign exc_clock = clock;
  assign exc_reset = reset;
  assign exc_io_ena = _T_6 & memory_io_ena_out; // @[Patmos.scala 142:31]
  assign exc_io_ocp_M_Cmd = io_excInOut_M_Cmd; // @[Patmos.scala 102:15]
  assign exc_io_ocp_M_Addr = io_excInOut_M_Addr; // @[Patmos.scala 102:15]
  assign exc_io_ocp_M_Data = io_excInOut_M_Data; // @[Patmos.scala 102:15]
  assign exc_io_intrs_0 = io_interrupts_0; // @[Patmos.scala 103:16]
  assign exc_io_intrs_1 = io_interrupts_1; // @[Patmos.scala 103:16]
  assign exc_io_memexc_call = memory_io_exc_call; // @[Patmos.scala 105:17]
  assign exc_io_memexc_ret = memory_io_exc_ret; // @[Patmos.scala 105:17]
  assign exc_io_memexc_src = memory_io_exc_src; // @[Patmos.scala 105:17]
  assign exc_io_memexc_exc = memory_io_exc_exc; // @[Patmos.scala 105:17]
  assign exc_io_memexc_excBase = memory_io_exc_excBase; // @[Patmos.scala 105:17]
  assign exc_io_memexc_excAddr = memory_io_exc_excAddr; // @[Patmos.scala 105:17]
  assign dcache_clock = clock;
  assign dcache_reset = reset;
  assign dcache_io_master_M_Cmd = memory_io_globalInOut_M_Cmd; // @[Patmos.scala 108:22]
  assign dcache_io_master_M_Addr = memory_io_globalInOut_M_Addr; // @[Patmos.scala 108:22]
  assign dcache_io_master_M_Data = memory_io_globalInOut_M_Data; // @[Patmos.scala 108:22]
  assign dcache_io_master_M_ByteEn = memory_io_globalInOut_M_ByteEn; // @[Patmos.scala 108:22]
  assign dcache_io_master_M_AddrSpace = memory_io_globalInOut_M_AddrSpace; // @[Patmos.scala 108:22]
  assign dcache_io_slave_S_Resp = burstBus_io_slave_S_Resp; // @[OcpBurst.scala 159:21 OcpBurst.scala 156:11 OcpBurst.scala 163:18]
  assign dcache_io_slave_S_Data = burstBus_io_slave_S_Data; // @[OcpBurst.scala 156:11]
  assign dcache_io_slave_S_CmdAccept = burstBus_io_slave_S_CmdAccept; // @[OcpBurst.scala 156:11]
  assign dcache_io_slave_S_DataAccept = burstBus_io_slave_S_DataAccept; // @[OcpBurst.scala 156:11]
  assign dcache_io_scIO_ena_in = _T_6 & memory_io_ena_out; // @[Patmos.scala 136:43]
  assign dcache_io_scIO_exsc_op = execute_io_exsc_op; // @[Patmos.scala 88:23]
  assign dcache_io_scIO_exsc_opData = execute_io_exsc_opData; // @[Patmos.scala 88:23]
  assign dcache_io_scIO_exsc_opOff = execute_io_exsc_opOff; // @[Patmos.scala 88:23]
  assign burstBus_io_master_S_Resp = mmu_io_virt_S_Resp; // @[Patmos.scala 128:24]
  assign burstBus_io_master_S_Data = mmu_io_virt_S_Data; // @[Patmos.scala 128:24]
  assign burstBus_io_master_S_CmdAccept = mmu_io_virt_S_CmdAccept; // @[Patmos.scala 128:24]
  assign burstBus_io_master_S_DataAccept = mmu_io_virt_S_DataAccept; // @[Patmos.scala 128:24]
  assign burstBus_io_slave_M_Cmd = dcache_io_slave_M_Cmd; // @[OcpBurst.scala 154:31]
  assign burstBus_io_slave_M_Addr = dcache_io_slave_M_Addr; // @[OcpBurst.scala 151:19 OcpBurst.scala 152:14 OcpBurst.scala 150:12]
  assign burstBus_io_slave_M_Data = dcache_io_slave_M_Data; // @[OcpBurst.scala 151:19 OcpBurst.scala 152:14 OcpBurst.scala 150:12]
  assign burstBus_io_slave_M_DataValid = dcache_io_slave_M_DataValid; // @[OcpBurst.scala 151:19 OcpBurst.scala 152:14 OcpBurst.scala 150:12]
  assign burstBus_io_slave_M_DataByteEn = dcache_io_slave_M_DataByteEn; // @[OcpBurst.scala 151:19 OcpBurst.scala 152:14 OcpBurst.scala 150:12]
  assign mmu_io_virt_M_Cmd = burstBus_io_master_M_Cmd; // @[Patmos.scala 127:17]
  assign mmu_io_virt_M_Addr = burstBus_io_master_M_Addr; // @[Patmos.scala 127:17]
  assign mmu_io_virt_M_Data = burstBus_io_master_M_Data; // @[Patmos.scala 127:17]
  assign mmu_io_virt_M_DataValid = burstBus_io_master_M_DataValid; // @[Patmos.scala 127:17]
  assign mmu_io_virt_M_DataByteEn = burstBus_io_master_M_DataByteEn; // @[Patmos.scala 127:17]
  assign mmu_io_phys_S_Resp = io_memPort_S_Resp; // @[Patmos.scala 176:14]
  assign mmu_io_phys_S_Data = io_memPort_S_Data; // @[Patmos.scala 176:14]
  assign mmu_io_phys_S_CmdAccept = io_memPort_S_CmdAccept; // @[Patmos.scala 176:14]
  assign mmu_io_phys_S_DataAccept = io_memPort_S_DataAccept; // @[Patmos.scala 176:14]
  always @(posedge clock) begin
    enableReg <= _T_6 & memory_io_ena_out; // @[Patmos.scala 142:31]
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
  enableReg = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module HardlockOCPWrapper(
  input        clock,
  input        reset,
  input  [2:0] io_cores_0_M_Cmd,
  output [1:0] io_cores_0_S_Resp
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  reqReg; // @[Hardlock.scala 84:19]
  wire  _GEN_1 = reqReg ? 1'h0 : reqReg; // @[Hardlock.scala 101:86 Hardlock.scala 102:19 Hardlock.scala 87:12]
  wire  reqBools_0 = io_cores_0_M_Cmd != 3'h0 | _GEN_1; // @[Hardlock.scala 97:45 Hardlock.scala 98:19]
  assign io_cores_0_S_Resp = reqReg ? 2'h1 : 2'h0; // @[Hardlock.scala 107:81 Hardlock.scala 108:26 Hardlock.scala 106:24]
  always @(posedge clock) begin
    if (reset) begin // @[Hardlock.scala 84:19]
      reqReg <= 1'h0; // @[Hardlock.scala 84:19]
    end else if (io_cores_0_M_Cmd != 3'h0) begin // @[Hardlock.scala 97:45]
      reqReg <= reqBools_0; // @[Hardlock.scala 99:14]
    end else if (reqReg) begin // @[Hardlock.scala 101:86]
      reqReg <= reqBools_0; // @[Hardlock.scala 103:14]
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
  reqReg = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module QueueCompatibility(
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [7:0] io_enq_bits,
  input        io_deq_ready,
  output       io_deq_valid,
  output [7:0] io_deq_bits
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] ram [0:15]; // @[Decoupled.scala 218:16]
  wire [7:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire [3:0] ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [7:0] ram_MPORT_data; // @[Decoupled.scala 218:16]
  wire [3:0] ram_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_MPORT_en; // @[Decoupled.scala 218:16]
  reg [3:0] enq_ptr_value; // @[Counter.scala 60:40]
  reg [3:0] deq_ptr_value; // @[Counter.scala 60:40]
  reg  maybe_full; // @[Decoupled.scala 221:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 223:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 224:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 225:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  wire [3:0] _value_T_1 = enq_ptr_value + 4'h1; // @[Counter.scala 76:24]
  wire [3:0] _value_T_3 = deq_ptr_value + 4'h1; // @[Counter.scala 76:24]
  assign ram_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = enq_ptr_value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 241:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 240:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  always @(posedge clock) begin
    if(ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if (reset) begin // @[Counter.scala 60:40]
      enq_ptr_value <= 4'h0; // @[Counter.scala 60:40]
    end else if (do_enq) begin // @[Decoupled.scala 229:17]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 76:15]
    end
    if (reset) begin // @[Counter.scala 60:40]
      deq_ptr_value <= 4'h0; // @[Counter.scala 60:40]
    end else if (do_deq) begin // @[Decoupled.scala 233:17]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 76:15]
    end
    if (reset) begin // @[Decoupled.scala 221:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 221:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 236:28]
      maybe_full <= do_enq; // @[Decoupled.scala 237:16]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr_value = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr_value = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Uart(
  input         clock,
  input         reset,
  input  [2:0]  io_ocp_M_Cmd,
  input  [31:0] io_ocp_M_Addr,
  input  [31:0] io_ocp_M_Data,
  output [1:0]  io_ocp_S_Resp,
  output [31:0] io_ocp_S_Data,
  output        io_pins_tx,
  input         io_pins_rx
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
`endif // RANDOMIZE_REG_INIT
  wire  txQueue_clock; // @[Uart.scala 58:25]
  wire  txQueue_reset; // @[Uart.scala 58:25]
  wire  txQueue_io_enq_ready; // @[Uart.scala 58:25]
  wire  txQueue_io_enq_valid; // @[Uart.scala 58:25]
  wire [7:0] txQueue_io_enq_bits; // @[Uart.scala 58:25]
  wire  txQueue_io_deq_ready; // @[Uart.scala 58:25]
  wire  txQueue_io_deq_valid; // @[Uart.scala 58:25]
  wire [7:0] txQueue_io_deq_bits; // @[Uart.scala 58:25]
  wire  rxQueue_clock; // @[Uart.scala 76:25]
  wire  rxQueue_reset; // @[Uart.scala 76:25]
  wire  rxQueue_io_enq_ready; // @[Uart.scala 76:25]
  wire  rxQueue_io_enq_valid; // @[Uart.scala 76:25]
  wire [7:0] rxQueue_io_enq_bits; // @[Uart.scala 76:25]
  wire  rxQueue_io_deq_ready; // @[Uart.scala 76:25]
  wire  rxQueue_io_deq_valid; // @[Uart.scala 76:25]
  wire [7:0] rxQueue_io_deq_bits; // @[Uart.scala 76:25]
  reg [6:0] tx_baud_counter; // @[Uart.scala 49:34]
  reg  tx_baud_tick; // @[Uart.scala 50:34]
  reg  tx_state; // @[Uart.scala 53:34]
  reg [9:0] tx_buff; // @[Uart.scala 54:34]
  reg  tx_reg; // @[Uart.scala 55:34]
  reg [3:0] tx_counter; // @[Uart.scala 56:34]
  reg  rxd_reg0; // @[Uart.scala 63:34]
  reg  rxd_reg1; // @[Uart.scala 64:34]
  reg  rxd_reg2; // @[Uart.scala 65:34]
  reg [6:0] rx_baud_counter; // @[Uart.scala 67:34]
  reg  rx_baud_tick; // @[Uart.scala 68:34]
  reg  rx_enable; // @[Uart.scala 69:34]
  reg [7:0] rx_buff; // @[Uart.scala 71:34]
  reg [2:0] rx_counter; // @[Uart.scala 72:34]
  reg [1:0] rx_state; // @[Uart.scala 74:34]
  reg [1:0] respReg; // @[Uart.scala 82:22]
  reg [7:0] rdDataReg; // @[Uart.scala 85:24]
  wire [7:0] _T_3 = {6'h0,rxQueue_io_deq_valid,txQueue_io_enq_ready}; // @[Cat.scala 30:58]
  wire  _T_10 = tx_baud_counter == 7'h56; // @[Uart.scala 108:27]
  wire [6:0] _T_12 = tx_baud_counter + 7'h1; // @[Uart.scala 113:48]
  wire [8:0] hi_1 = {1'h1,txQueue_io_deq_bits}; // @[Cat.scala 30:58]
  wire [9:0] _T_14 = {1'h1,txQueue_io_deq_bits,1'h0}; // @[Cat.scala 30:58]
  wire  _GEN_7 = txQueue_io_deq_valid; // @[Uart.scala 120:37 Uart.scala 121:32 Uart.scala 61:29]
  wire [9:0] _GEN_8 = txQueue_io_deq_valid ? _T_14 : tx_buff; // @[Uart.scala 120:37 Uart.scala 122:32 Uart.scala 54:34]
  wire  _GEN_9 = txQueue_io_deq_valid | tx_state; // @[Uart.scala 120:37 Uart.scala 123:32 Uart.scala 53:34]
  wire  _GEN_10 = ~tx_state & _GEN_7; // @[Uart.scala 119:33 Uart.scala 61:29]
  wire [9:0] _GEN_11 = ~tx_state ? _GEN_8 : tx_buff; // @[Uart.scala 119:33 Uart.scala 54:34]
  wire  _GEN_12 = ~tx_state ? _GEN_9 : tx_state; // @[Uart.scala 119:33 Uart.scala 53:34]
  wire [8:0] lo = tx_buff[9:1]; // @[Uart.scala 129:54]
  wire [9:0] _T_17 = {1'h0,lo}; // @[Cat.scala 30:58]
  wire  _T_19 = tx_counter == 4'ha; // @[Uart.scala 131:47]
  wire [3:0] _T_21 = tx_counter + 4'h1; // @[Uart.scala 131:81]
  wire [3:0] _T_22 = tx_counter == 4'ha ? 4'h0 : _T_21; // @[Uart.scala 131:35]
  wire  _GEN_13 = txQueue_io_deq_valid | _GEN_10; // @[Uart.scala 134:43 Uart.scala 135:38]
  wire [9:0] _GEN_14 = txQueue_io_deq_valid ? {{1'd0}, hi_1} : _T_17; // @[Uart.scala 134:43 Uart.scala 136:38 Uart.scala 129:29]
  wire  _GEN_15 = txQueue_io_deq_valid ? 1'h0 : 1'h1; // @[Uart.scala 134:43 Uart.scala 137:38 Uart.scala 141:33]
  wire  _GEN_16 = txQueue_io_deq_valid & _GEN_12; // @[Uart.scala 134:43 Uart.scala 143:33]
  wire  _GEN_17 = _T_19 ? _GEN_13 : _GEN_10; // @[Uart.scala 133:44]
  wire  _GEN_19 = _T_19 ? _GEN_15 : tx_buff[0]; // @[Uart.scala 133:44 Uart.scala 130:29]
  wire  _GEN_23 = tx_baud_tick ? _GEN_19 : tx_reg; // @[Uart.scala 128:40 Uart.scala 55:34]
  wire  _GEN_25 = tx_baud_tick ? _GEN_17 : _GEN_10; // @[Uart.scala 128:40]
  wire  _GEN_28 = tx_state ? _GEN_23 : tx_reg; // @[Uart.scala 127:33 Uart.scala 55:34]
  wire  _T_25 = rx_baud_counter == 7'h56; // @[Uart.scala 155:31]
  wire [6:0] _T_27 = rx_baud_counter + 7'h1; // @[Uart.scala 160:52]
  wire [6:0] _GEN_32 = rx_baud_counter == 7'h56 ? 7'h0 : _T_27; // @[Uart.scala 155:60 Uart.scala 156:33 Uart.scala 160:33]
  wire [6:0] _GEN_34 = rx_enable ? _GEN_32 : rx_baud_counter; // @[Uart.scala 154:22 Uart.scala 67:34]
  wire  _T_29 = ~rxd_reg2; // @[Uart.scala 175:24]
  wire [6:0] _T_30 = 7'h56 / 2'h2; // @[Uart.scala 177:57]
  wire [1:0] _GEN_36 = ~rxd_reg2 ? 2'h1 : rx_state; // @[Uart.scala 175:36 Uart.scala 176:29 Uart.scala 74:34]
  wire  _GEN_38 = ~rxd_reg2 | rx_enable; // @[Uart.scala 175:36 Uart.scala 178:29 Uart.scala 69:34]
  wire [1:0] _GEN_39 = rx_state == 2'h0 ? _GEN_36 : rx_state; // @[Uart.scala 174:33 Uart.scala 74:34]
  wire  _GEN_41 = rx_state == 2'h0 ? _GEN_38 : rx_enable; // @[Uart.scala 174:33 Uart.scala 69:34]
  wire [1:0] _GEN_42 = _T_29 ? 2'h2 : 2'h0; // @[Uart.scala 184:41 Uart.scala 185:33 Uart.scala 188:33]
  wire [1:0] _GEN_43 = rx_baud_tick ? _GEN_42 : _GEN_39; // @[Uart.scala 183:41]
  wire [1:0] _GEN_44 = rx_state == 2'h1 ? _GEN_43 : _GEN_39; // @[Uart.scala 182:33]
  wire  _T_36 = rx_counter == 3'h7; // @[Uart.scala 195:40]
  wire [1:0] _T_37 = rx_counter == 3'h7 ? 2'h3 : 2'h2; // @[Uart.scala 195:28]
  wire [2:0] _T_40 = rx_counter + 3'h1; // @[Uart.scala 196:75]
  wire [6:0] lo_1 = rx_buff[7:1]; // @[Uart.scala 197:46]
  wire [7:0] _T_42 = {rxd_reg2,lo_1}; // @[Cat.scala 30:58]
  wire [1:0] _GEN_45 = rx_baud_tick ? _T_37 : _GEN_44; // @[Uart.scala 194:40 Uart.scala 195:22]
  wire [1:0] _GEN_48 = rx_state == 2'h2 ? _GEN_45 : _GEN_44; // @[Uart.scala 193:41]
  wire  _GEN_58 = rx_baud_tick & rxd_reg2; // @[Uart.scala 202:40 Uart.scala 78:29]
  wire [2:0] uartOcpEmu_Cmd = io_ocp_M_Cmd; // @[Uart.scala 44:26 Uart.scala 46:16]
  wire [31:0] uartOcpEmu_Addr = io_ocp_M_Addr; // @[Uart.scala 44:26 Uart.scala 46:16]
  wire [31:0] uartOcpEmu_Data = io_ocp_M_Data; // @[Uart.scala 44:26 Uart.scala 46:16]
  QueueCompatibility txQueue ( // @[Uart.scala 58:25]
    .clock(txQueue_clock),
    .reset(txQueue_reset),
    .io_enq_ready(txQueue_io_enq_ready),
    .io_enq_valid(txQueue_io_enq_valid),
    .io_enq_bits(txQueue_io_enq_bits),
    .io_deq_ready(txQueue_io_deq_ready),
    .io_deq_valid(txQueue_io_deq_valid),
    .io_deq_bits(txQueue_io_deq_bits)
  );
  QueueCompatibility rxQueue ( // @[Uart.scala 76:25]
    .clock(rxQueue_clock),
    .reset(rxQueue_reset),
    .io_enq_ready(rxQueue_io_enq_ready),
    .io_enq_valid(rxQueue_io_enq_valid),
    .io_enq_bits(rxQueue_io_enq_bits),
    .io_deq_ready(rxQueue_io_deq_ready),
    .io_deq_valid(rxQueue_io_deq_valid),
    .io_deq_bits(rxQueue_io_deq_bits)
  );
  assign io_ocp_S_Resp = respReg; // @[Uart.scala 104:19]
  assign io_ocp_S_Data = {{24'd0}, rdDataReg}; // @[Uart.scala 105:19]
  assign io_pins_tx = tx_reg; // @[Uart.scala 150:16]
  assign txQueue_clock = clock;
  assign txQueue_reset = reset;
  assign txQueue_io_enq_valid = io_ocp_M_Cmd == 3'h1; // @[Uart.scala 91:24]
  assign txQueue_io_enq_bits = io_ocp_M_Cmd == 3'h1 ? io_ocp_M_Data[7:0] : io_ocp_M_Data[7:0]; // @[Uart.scala 91:39 Uart.scala 93:29 Uart.scala 59:29]
  assign txQueue_io_deq_ready = tx_state ? _GEN_25 : _GEN_10; // @[Uart.scala 127:33]
  assign rxQueue_clock = clock;
  assign rxQueue_reset = reset;
  assign rxQueue_io_enq_valid = rx_state == 2'h3 & _GEN_58; // @[Uart.scala 201:37 Uart.scala 78:29]
  assign rxQueue_io_enq_bits = rx_buff; // @[Uart.scala 201:37 Uart.scala 77:29]
  assign rxQueue_io_deq_ready = io_ocp_M_Cmd == 3'h2 & io_ocp_M_Addr[2]; // @[Uart.scala 98:38 Uart.scala 100:30 Uart.scala 79:29]
  always @(posedge clock) begin
    if (reset) begin // @[Uart.scala 49:34]
      tx_baud_counter <= 7'h0; // @[Uart.scala 49:34]
    end else if (tx_baud_counter == 7'h56) begin // @[Uart.scala 108:56]
      tx_baud_counter <= 7'h0; // @[Uart.scala 109:29]
    end else begin
      tx_baud_counter <= _T_12; // @[Uart.scala 113:29]
    end
    if (reset) begin // @[Uart.scala 50:34]
      tx_baud_tick <= 1'h0; // @[Uart.scala 50:34]
    end else begin
      tx_baud_tick <= _T_10;
    end
    if (reset) begin // @[Uart.scala 53:34]
      tx_state <= 1'h0; // @[Uart.scala 53:34]
    end else if (tx_state) begin // @[Uart.scala 127:33]
      if (tx_baud_tick) begin // @[Uart.scala 128:40]
        if (_T_19) begin // @[Uart.scala 133:44]
          tx_state <= _GEN_16;
        end else begin
          tx_state <= _GEN_12;
        end
      end else begin
        tx_state <= _GEN_12;
      end
    end else begin
      tx_state <= _GEN_12;
    end
    if (reset) begin // @[Uart.scala 54:34]
      tx_buff <= 10'h0; // @[Uart.scala 54:34]
    end else if (tx_state) begin // @[Uart.scala 127:33]
      if (tx_baud_tick) begin // @[Uart.scala 128:40]
        if (_T_19) begin // @[Uart.scala 133:44]
          tx_buff <= _GEN_14;
        end else begin
          tx_buff <= _T_17; // @[Uart.scala 129:29]
        end
      end else begin
        tx_buff <= _GEN_11;
      end
    end else begin
      tx_buff <= _GEN_11;
    end
    tx_reg <= reset | _GEN_28; // @[Uart.scala 55:34 Uart.scala 55:34]
    if (reset) begin // @[Uart.scala 56:34]
      tx_counter <= 4'h0; // @[Uart.scala 56:34]
    end else if (tx_state) begin // @[Uart.scala 127:33]
      if (tx_baud_tick) begin // @[Uart.scala 128:40]
        if (tx_counter == 4'ha) begin // @[Uart.scala 133:44]
          tx_counter <= {{3'd0}, _GEN_7};
        end else begin
          tx_counter <= _T_22; // @[Uart.scala 131:29]
        end
      end
    end
    rxd_reg0 <= reset | io_pins_rx; // @[Uart.scala 63:34 Uart.scala 63:34 Uart.scala 168:29]
    rxd_reg1 <= reset | rxd_reg0; // @[Uart.scala 64:34 Uart.scala 64:34 Uart.scala 169:29]
    rxd_reg2 <= reset | rxd_reg1; // @[Uart.scala 65:34 Uart.scala 65:34 Uart.scala 170:29]
    if (reset) begin // @[Uart.scala 67:34]
      rx_baud_counter <= 7'h0; // @[Uart.scala 67:34]
    end else if (rx_state == 2'h0) begin // @[Uart.scala 174:33]
      if (~rxd_reg2) begin // @[Uart.scala 175:36]
        rx_baud_counter <= _T_30; // @[Uart.scala 177:29]
      end else begin
        rx_baud_counter <= _GEN_34;
      end
    end else begin
      rx_baud_counter <= _GEN_34;
    end
    if (reset) begin // @[Uart.scala 68:34]
      rx_baud_tick <= 1'h0; // @[Uart.scala 68:34]
    end else if (rx_enable) begin // @[Uart.scala 154:22]
      rx_baud_tick <= _T_25;
    end
    if (reset) begin // @[Uart.scala 69:34]
      rx_enable <= 1'h0; // @[Uart.scala 69:34]
    end else if (rx_state == 2'h3) begin // @[Uart.scala 201:37]
      if (rx_baud_tick) begin // @[Uart.scala 202:40]
        rx_enable <= 1'h0;
      end else begin
        rx_enable <= _GEN_41;
      end
    end else begin
      rx_enable <= _GEN_41;
    end
    if (reset) begin // @[Uart.scala 71:34]
      rx_buff <= 8'h0; // @[Uart.scala 71:34]
    end else if (rx_state == 2'h2) begin // @[Uart.scala 193:41]
      if (rx_baud_tick) begin // @[Uart.scala 194:40]
        rx_buff <= _T_42; // @[Uart.scala 197:21]
      end
    end
    if (reset) begin // @[Uart.scala 72:34]
      rx_counter <= 3'h0; // @[Uart.scala 72:34]
    end else if (rx_state == 2'h2) begin // @[Uart.scala 193:41]
      if (rx_baud_tick) begin // @[Uart.scala 194:40]
        if (_T_36) begin // @[Uart.scala 196:30]
          rx_counter <= 3'h0;
        end else begin
          rx_counter <= _T_40;
        end
      end
    end
    if (reset) begin // @[Uart.scala 74:34]
      rx_state <= 2'h0; // @[Uart.scala 74:34]
    end else if (rx_state == 2'h3) begin // @[Uart.scala 201:37]
      if (rx_baud_tick) begin // @[Uart.scala 202:40]
        rx_state <= 2'h0;
      end else begin
        rx_state <= _GEN_48;
      end
    end else begin
      rx_state <= _GEN_48;
    end
    if (reset) begin // @[Uart.scala 82:22]
      respReg <= 2'h0; // @[Uart.scala 82:22]
    end else if (io_ocp_M_Cmd == 3'h2) begin // @[Uart.scala 98:38]
      respReg <= 2'h1; // @[Uart.scala 99:17]
    end else if (io_ocp_M_Cmd == 3'h1) begin // @[Uart.scala 91:39]
      respReg <= 2'h1; // @[Uart.scala 92:17]
    end else begin
      respReg <= 2'h0; // @[Uart.scala 83:13]
    end
    if (reset) begin // @[Uart.scala 85:24]
      rdDataReg <= 8'h0; // @[Uart.scala 85:24]
    end else if (~io_ocp_M_Addr[2]) begin // @[Uart.scala 86:21]
      rdDataReg <= _T_3;
    end else begin
      rdDataReg <= rxQueue_io_deq_bits;
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
  tx_baud_counter = _RAND_0[6:0];
  _RAND_1 = {1{`RANDOM}};
  tx_baud_tick = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  tx_state = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  tx_buff = _RAND_3[9:0];
  _RAND_4 = {1{`RANDOM}};
  tx_reg = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  tx_counter = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  rxd_reg0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  rxd_reg1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  rxd_reg2 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  rx_baud_counter = _RAND_9[6:0];
  _RAND_10 = {1{`RANDOM}};
  rx_baud_tick = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  rx_enable = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  rx_buff = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  rx_counter = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  rx_state = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  respReg = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  rdDataReg = _RAND_16[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module UartCmp(
  input         clock,
  input         reset,
  input  [2:0]  io_cores_0_M_Cmd,
  input  [31:0] io_cores_0_M_Addr,
  input  [31:0] io_cores_0_M_Data,
  output [1:0]  io_cores_0_S_Resp,
  output [31:0] io_cores_0_S_Data,
  output        io_pins_tx,
  input         io_pins_rx
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  uart_clock; // @[UartCmp.scala 29:20]
  wire  uart_reset; // @[UartCmp.scala 29:20]
  wire [2:0] uart_io_ocp_M_Cmd; // @[UartCmp.scala 29:20]
  wire [31:0] uart_io_ocp_M_Addr; // @[UartCmp.scala 29:20]
  wire [31:0] uart_io_ocp_M_Data; // @[UartCmp.scala 29:20]
  wire [1:0] uart_io_ocp_S_Resp; // @[UartCmp.scala 29:20]
  wire [31:0] uart_io_ocp_S_Data; // @[UartCmp.scala 29:20]
  wire  uart_io_pins_tx; // @[UartCmp.scala 29:20]
  wire  uart_io_pins_rx; // @[UartCmp.scala 29:20]
  wire  _T = io_cores_0_M_Cmd != 3'h0; // @[UartCmp.scala 33:59]
  reg  REG; // @[UartCmp.scala 36:21]
  wire  _GEN_0 = uart_io_ocp_S_Resp == 2'h1 ? 1'h0 : REG; // @[UartCmp.scala 39:52 UartCmp.scala 40:14 UartCmp.scala 36:21]
  wire  _GEN_1 = _T | _GEN_0; // @[UartCmp.scala 37:45 UartCmp.scala 38:14]
  Uart uart ( // @[UartCmp.scala 29:20]
    .clock(uart_clock),
    .reset(uart_reset),
    .io_ocp_M_Cmd(uart_io_ocp_M_Cmd),
    .io_ocp_M_Addr(uart_io_ocp_M_Addr),
    .io_ocp_M_Data(uart_io_ocp_M_Data),
    .io_ocp_S_Resp(uart_io_ocp_S_Resp),
    .io_ocp_S_Data(uart_io_ocp_S_Data),
    .io_pins_tx(uart_io_pins_tx),
    .io_pins_rx(uart_io_pins_rx)
  );
  assign io_cores_0_S_Resp = ~REG ? 2'h0 : uart_io_ocp_S_Resp; // @[UartCmp.scala 45:33 UartCmp.scala 46:26 UartCmp.scala 44:24]
  assign io_cores_0_S_Data = uart_io_ocp_S_Data; // @[UartCmp.scala 43:24]
  assign io_pins_tx = uart_io_pins_tx; // @[UartCmp.scala 31:11]
  assign uart_clock = clock;
  assign uart_reset = reset;
  assign uart_io_ocp_M_Cmd = io_cores_0_M_Cmd; // @[UartCmp.scala 33:17]
  assign uart_io_ocp_M_Addr = io_cores_0_M_Addr; // @[UartCmp.scala 33:17]
  assign uart_io_ocp_M_Data = io_cores_0_M_Data; // @[UartCmp.scala 33:17]
  assign uart_io_pins_rx = io_pins_rx; // @[UartCmp.scala 31:11]
  always @(posedge clock) begin
    if (reset) begin // @[UartCmp.scala 36:21]
      REG <= 1'h0; // @[UartCmp.scala 36:21]
    end else begin
      REG <= _GEN_1;
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
  REG = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CpuInfo(
  input         clock,
  input  [2:0]  io_ocp_M_Cmd,
  input  [31:0] io_ocp_M_Addr,
  output [1:0]  io_ocp_S_Resp,
  output [31:0] io_ocp_S_Data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] masterReg_Cmd; // @[CpuInfo.scala 26:22]
  reg [31:0] masterReg_Addr; // @[CpuInfo.scala 26:22]
  wire [1:0] _GEN_0 = masterReg_Cmd == 3'h1 ? 2'h1 : 2'h0; // @[CpuInfo.scala 35:37 CpuInfo.scala 36:10 CpuInfo.scala 31:8]
  wire  _T_3 = 4'h0 == masterReg_Addr[5:2]; // @[Conditional.scala 37:30]
  wire  _T_4 = 4'h1 == masterReg_Addr[5:2]; // @[Conditional.scala 37:30]
  wire  _T_5 = 4'h2 == masterReg_Addr[5:2]; // @[Conditional.scala 37:30]
  wire  _T_6 = 4'h3 == masterReg_Addr[5:2]; // @[Conditional.scala 37:30]
  wire  _T_7 = 4'h4 == masterReg_Addr[5:2]; // @[Conditional.scala 37:30]
  wire  _T_8 = 4'h5 == masterReg_Addr[5:2]; // @[Conditional.scala 37:30]
  wire  _T_11 = 4'h6 == masterReg_Addr[5:2]; // @[Conditional.scala 37:30]
  wire  _T_12 = 4'h7 == masterReg_Addr[5:2]; // @[Conditional.scala 37:30]
  wire  _T_15 = 4'h8 == masterReg_Addr[5:2]; // @[Conditional.scala 37:30]
  wire  _T_16 = 4'h9 == masterReg_Addr[5:2]; // @[Conditional.scala 37:30]
  wire  _T_20 = 4'ha == masterReg_Addr[5:2]; // @[Conditional.scala 37:30]
  wire  _T_21 = 4'hb == masterReg_Addr[5:2]; // @[Conditional.scala 37:30]
  wire  _T_22 = 4'hc == masterReg_Addr[5:2]; // @[Conditional.scala 37:30]
  wire  _T_23 = 4'hd == masterReg_Addr[5:2]; // @[Conditional.scala 37:30]
  wire [10:0] _GEN_1 = _T_23 ? 11'h400 : 11'h0; // @[Conditional.scala 39:67 CpuInfo.scala 74:30 CpuInfo.scala 32:8]
  wire [10:0] _GEN_2 = _T_22 ? 11'h0 : _GEN_1; // @[Conditional.scala 39:67 CpuInfo.scala 71:30]
  wire [10:0] _GEN_3 = _T_21 ? 11'h0 : _GEN_2; // @[Conditional.scala 39:67 CpuInfo.scala 68:30]
  wire [10:0] _GEN_4 = _T_20 ? 11'h0 : _GEN_3; // @[Conditional.scala 39:67 CpuInfo.scala 66:30]
  wire [31:0] _GEN_5 = _T_16 ? 32'h1000001 : {{21'd0}, _GEN_4}; // @[Conditional.scala 39:67 CpuInfo.scala 63:30]
  wire [31:0] _GEN_6 = _T_15 ? 32'h0 : _GEN_5; // @[Conditional.scala 39:67 CpuInfo.scala 61:30]
  wire [31:0] _GEN_7 = _T_12 ? 32'h1020001 : _GEN_6; // @[Conditional.scala 39:67 CpuInfo.scala 58:30]
  wire [31:0] _GEN_8 = _T_11 ? 32'h0 : _GEN_7; // @[Conditional.scala 39:67 CpuInfo.scala 56:30]
  wire [31:0] _GEN_9 = _T_8 ? 32'h400 : _GEN_8; // @[Conditional.scala 39:67 CpuInfo.scala 53:30]
  wire [31:0] _GEN_10 = _T_7 ? 32'h200000 : _GEN_9; // @[Conditional.scala 39:67 CpuInfo.scala 51:30]
  wire [31:0] _GEN_11 = _T_6 ? 32'h1 : _GEN_10; // @[Conditional.scala 39:67 CpuInfo.scala 48:30]
  wire [31:0] _GEN_12 = _T_5 ? 32'h1 : _GEN_11; // @[Conditional.scala 39:67 CpuInfo.scala 47:30]
  wire [31:0] _GEN_13 = _T_4 ? 32'h989680 : _GEN_12; // @[Conditional.scala 39:67 CpuInfo.scala 46:30]
  wire [31:0] _GEN_14 = _T_3 ? 32'h0 : _GEN_13; // @[Conditional.scala 40:58 CpuInfo.scala 45:30]
  wire [31:0] _GEN_16 = 4'h1 == masterReg_Addr[5:2] ? 32'h0 : 32'hf0008024; // @[CpuInfo.scala 77:10 CpuInfo.scala 77:10]
  wire [31:0] _GEN_17 = 4'h2 == masterReg_Addr[5:2] ? 32'h20000 : _GEN_16; // @[CpuInfo.scala 77:10 CpuInfo.scala 77:10]
  wire [31:0] _GEN_18 = 4'h3 == masterReg_Addr[5:2] ? 32'h40c : _GEN_17; // @[CpuInfo.scala 77:10 CpuInfo.scala 77:10]
  wire [31:0] _GEN_19 = 4'h4 == masterReg_Addr[5:2] ? 32'h70c : _GEN_18; // @[CpuInfo.scala 77:10 CpuInfo.scala 77:10]
  wire [31:0] _GEN_20 = 4'h5 == masterReg_Addr[5:2] ? 32'h6bc : _GEN_19; // @[CpuInfo.scala 77:10 CpuInfo.scala 77:10]
  wire [31:0] _GEN_21 = 4'h6 == masterReg_Addr[5:2] ? 32'h6f0 : _GEN_20; // @[CpuInfo.scala 77:10 CpuInfo.scala 77:10]
  wire [31:0] _GEN_22 = 4'h7 == masterReg_Addr[5:2] ? 32'h6f8 : _GEN_21; // @[CpuInfo.scala 77:10 CpuInfo.scala 77:10]
  wire [31:0] _GEN_23 = 4'h8 == masterReg_Addr[5:2] ? 32'h700 : _GEN_22; // @[CpuInfo.scala 77:10 CpuInfo.scala 77:10]
  assign io_ocp_S_Resp = masterReg_Cmd == 3'h2 ? 2'h1 : _GEN_0; // @[CpuInfo.scala 80:37 CpuInfo.scala 81:10]
  assign io_ocp_S_Data = masterReg_Addr[15] ? _GEN_23 : _GEN_14; // @[CpuInfo.scala 76:44 CpuInfo.scala 77:10]
  always @(posedge clock) begin
    masterReg_Cmd <= io_ocp_M_Cmd; // @[CpuInfo.scala 26:22]
    masterReg_Addr <= io_ocp_M_Addr; // @[CpuInfo.scala 26:22]
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
  masterReg_Cmd = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  masterReg_Addr = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Timer(
  input         clock,
  input         reset,
  input  [2:0]  io_ocp_M_Cmd,
  input  [31:0] io_ocp_M_Addr,
  input  [31:0] io_ocp_M_Data,
  output [1:0]  io_ocp_S_Resp,
  output [31:0] io_ocp_S_Data,
  output        io_interrupts_0,
  output        io_interrupts_1
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] masterReg_Cmd; // @[Timer.scala 32:22]
  reg [31:0] masterReg_Addr; // @[Timer.scala 32:22]
  reg [31:0] masterReg_Data; // @[Timer.scala 32:22]
  reg [63:0] cycleReg; // @[Timer.scala 35:25]
  reg [63:0] cycleIntrReg; // @[Timer.scala 36:25]
  reg [3:0] usecSubReg; // @[Timer.scala 40:24]
  reg [63:0] usecReg; // @[Timer.scala 41:24]
  reg [63:0] usecIntrReg; // @[Timer.scala 42:24]
  reg [31:0] cycleHiReg; // @[Timer.scala 45:24]
  reg [31:0] usecHiReg; // @[Timer.scala 46:24]
  reg [31:0] cycleLoReg; // @[Timer.scala 49:24]
  reg [31:0] usecLoReg; // @[Timer.scala 50:24]
  wire  _T_2 = masterReg_Addr[3:2] == 2'h1; // @[Timer.scala 64:31]
  wire [31:0] _GEN_0 = masterReg_Addr[3:2] == 2'h1 ? cycleReg[31:0] : 32'h0; // @[Timer.scala 64:48 Timer.scala 65:12 Timer.scala 56:8]
  wire  _T_6 = masterReg_Addr[3:2] == 2'h0; // @[Timer.scala 68:31]
  wire [31:0] _GEN_2 = masterReg_Addr[3:2] == 2'h0 ? cycleHiReg : _GEN_0; // @[Timer.scala 68:48 Timer.scala 69:12]
  wire  _T_8 = masterReg_Addr[3:2] == 2'h3; // @[Timer.scala 74:31]
  wire [31:0] _GEN_3 = masterReg_Addr[3:2] == 2'h3 ? usecReg[31:0] : _GEN_2; // @[Timer.scala 74:48 Timer.scala 75:12]
  wire  _T_12 = masterReg_Addr[3:2] == 2'h2; // @[Timer.scala 78:31]
  wire [31:0] _GEN_5 = masterReg_Addr[3:2] == 2'h2 ? usecHiReg : _GEN_3; // @[Timer.scala 78:48 Timer.scala 79:12]
  wire [1:0] _GEN_6 = masterReg_Cmd == 3'h2 ? 2'h1 : 2'h0; // @[Timer.scala 59:37 Timer.scala 60:10 Timer.scala 55:8]
  wire [63:0] _T_18 = {masterReg_Data,cycleLoReg}; // @[Timer.scala 93:38]
  wire [63:0] _T_23 = {masterReg_Data,usecLoReg}; // @[Timer.scala 102:37]
  wire [63:0] _T_25 = cycleReg + 64'h1; // @[Timer.scala 115:24]
  wire [3:0] _T_30 = usecSubReg + 4'h1; // @[Timer.scala 121:28]
  wire [3:0] _T_32 = 4'ha - 4'h1; // @[Timer.scala 122:34]
  wire [63:0] _T_35 = usecReg + 64'h1; // @[Timer.scala 124:24]
  wire  _T_38 = _T_35 == usecIntrReg; // @[Timer.scala 126:29]
  assign io_ocp_S_Resp = masterReg_Cmd == 3'h1 ? 2'h1 : _GEN_6; // @[Timer.scala 84:37 Timer.scala 85:10]
  assign io_ocp_S_Data = masterReg_Cmd == 3'h2 ? _GEN_5 : 32'h0; // @[Timer.scala 59:37 Timer.scala 56:8]
  assign io_interrupts_0 = _T_25 == cycleIntrReg; // @[Timer.scala 117:28]
  assign io_interrupts_1 = usecSubReg == _T_32 & _T_38; // @[Timer.scala 122:45 Timer.scala 112:20]
  always @(posedge clock) begin
    masterReg_Cmd <= io_ocp_M_Cmd; // @[Timer.scala 32:22]
    masterReg_Addr <= io_ocp_M_Addr; // @[Timer.scala 32:22]
    masterReg_Data <= io_ocp_M_Data; // @[Timer.scala 32:22]
    if (reset) begin // @[Timer.scala 35:25]
      cycleReg <= 64'h0; // @[Timer.scala 35:25]
    end else begin
      cycleReg <= _T_25; // @[Timer.scala 115:12]
    end
    if (reset) begin // @[Timer.scala 36:25]
      cycleIntrReg <= 64'h0; // @[Timer.scala 36:25]
    end else if (masterReg_Cmd == 3'h1) begin // @[Timer.scala 84:37]
      if (_T_6) begin // @[Timer.scala 92:48]
        cycleIntrReg <= _T_18; // @[Timer.scala 93:20]
      end
    end
    if (reset) begin // @[Timer.scala 40:24]
      usecSubReg <= 4'h0; // @[Timer.scala 40:24]
    end else if (usecSubReg == _T_32) begin // @[Timer.scala 122:45]
      usecSubReg <= 4'h0; // @[Timer.scala 123:16]
    end else begin
      usecSubReg <= _T_30; // @[Timer.scala 121:14]
    end
    if (reset) begin // @[Timer.scala 41:24]
      usecReg <= 64'h0; // @[Timer.scala 41:24]
    end else if (usecSubReg == _T_32) begin // @[Timer.scala 122:45]
      usecReg <= _T_35; // @[Timer.scala 124:13]
    end
    if (reset) begin // @[Timer.scala 42:24]
      usecIntrReg <= 64'h0; // @[Timer.scala 42:24]
    end else if (masterReg_Cmd == 3'h1) begin // @[Timer.scala 84:37]
      if (_T_12) begin // @[Timer.scala 101:48]
        usecIntrReg <= _T_23; // @[Timer.scala 102:19]
      end
    end
    if (masterReg_Cmd == 3'h2) begin // @[Timer.scala 59:37]
      if (masterReg_Addr[3:2] == 2'h1) begin // @[Timer.scala 64:48]
        cycleHiReg <= cycleReg[63:32]; // @[Timer.scala 66:18]
      end
    end
    if (masterReg_Cmd == 3'h2) begin // @[Timer.scala 59:37]
      if (masterReg_Addr[3:2] == 2'h3) begin // @[Timer.scala 74:48]
        usecHiReg <= usecReg[63:32]; // @[Timer.scala 76:17]
      end
    end
    if (masterReg_Cmd == 3'h1) begin // @[Timer.scala 84:37]
      if (_T_2) begin // @[Timer.scala 89:48]
        cycleLoReg <= masterReg_Data; // @[Timer.scala 90:18]
      end
    end
    if (masterReg_Cmd == 3'h1) begin // @[Timer.scala 84:37]
      if (_T_8) begin // @[Timer.scala 98:48]
        usecLoReg <= masterReg_Data; // @[Timer.scala 99:17]
      end
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
  masterReg_Cmd = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  masterReg_Addr = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  masterReg_Data = _RAND_2[31:0];
  _RAND_3 = {2{`RANDOM}};
  cycleReg = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  cycleIntrReg = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  usecSubReg = _RAND_5[3:0];
  _RAND_6 = {2{`RANDOM}};
  usecReg = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  usecIntrReg = _RAND_7[63:0];
  _RAND_8 = {1{`RANDOM}};
  cycleHiReg = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  usecHiReg = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  cycleLoReg = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  usecLoReg = _RAND_11[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Deadline(
  input         clock,
  input         reset,
  input  [2:0]  io_ocp_M_Cmd,
  input  [31:0] io_ocp_M_Data,
  output [1:0]  io_ocp_S_Resp,
  output [31:0] io_ocp_S_Data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] downCountReg; // @[Deadline.scala 65:25]
  wire  downDone = downCountReg == 32'h0; // @[Deadline.scala 68:31]
  wire  _T_2 = ~downDone; // @[Deadline.scala 70:9]
  wire [31:0] _T_4 = downCountReg - 32'h1; // @[Deadline.scala 71:34]
  wire  _T_5 = io_ocp_M_Cmd == 3'h1; // @[Deadline.scala 73:22]
  reg  stallReg; // @[Deadline.scala 78:21]
  reg [1:0] respReg; // @[Deadline.scala 83:20]
  wire  _T_6 = io_ocp_M_Cmd == 3'h2; // @[Deadline.scala 86:22]
  wire  _GEN_3 = _T_6 & _T_2 | stallReg; // @[Deadline.scala 90:52 Deadline.scala 91:14 Deadline.scala 78:21]
  assign io_ocp_S_Resp = respReg; // @[Deadline.scala 101:17]
  assign io_ocp_S_Data = downCountReg; // @[Deadline.scala 100:17]
  always @(posedge clock) begin
    if (reset) begin // @[Deadline.scala 65:25]
      downCountReg <= 32'h0; // @[Deadline.scala 65:25]
    end else if (io_ocp_M_Cmd == 3'h1) begin // @[Deadline.scala 73:37]
      downCountReg <= io_ocp_M_Data; // @[Deadline.scala 74:18]
    end else if (~downDone) begin // @[Deadline.scala 70:20]
      downCountReg <= _T_4; // @[Deadline.scala 71:18]
    end
    if (reset) begin // @[Deadline.scala 78:21]
      stallReg <= 1'h0; // @[Deadline.scala 78:21]
    end else if (stallReg & downDone) begin // @[Deadline.scala 95:31]
      stallReg <= 1'h0; // @[Deadline.scala 97:14]
    end else begin
      stallReg <= _GEN_3;
    end
    if (reset) begin // @[Deadline.scala 83:20]
      respReg <= 2'h0; // @[Deadline.scala 83:20]
    end else if (stallReg & downDone) begin // @[Deadline.scala 95:31]
      respReg <= 2'h1; // @[Deadline.scala 96:13]
    end else if (io_ocp_M_Cmd == 3'h2 & downDone | _T_5) begin // @[Deadline.scala 86:80]
      respReg <= 2'h1; // @[Deadline.scala 87:13]
    end else begin
      respReg <= 2'h0; // @[Deadline.scala 84:11]
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
  downCountReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  stallReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  respReg = _RAND_2[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Leds(
  input         clock,
  input         reset,
  input  [2:0]  io_ocp_M_Cmd,
  input  [31:0] io_ocp_M_Data,
  output [1:0]  io_ocp_S_Resp,
  output [31:0] io_ocp_S_Data,
  output        io_pins_led
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg  ledReg; // @[Leds.scala 34:19]
  reg [1:0] respReg; // @[Leds.scala 37:20]
  reg  REG; // @[Leds.scala 56:21]
  assign io_ocp_S_Resp = respReg; // @[Leds.scala 52:17]
  assign io_ocp_S_Data = {{31'd0}, ledReg}; // @[Leds.scala 53:17]
  assign io_pins_led = REG; // @[Leds.scala 56:15]
  always @(posedge clock) begin
    if (reset) begin // @[Leds.scala 34:19]
      ledReg <= 1'h0; // @[Leds.scala 34:19]
    end else if (io_ocp_M_Cmd == 3'h1) begin // @[Leds.scala 41:36]
      ledReg <= io_ocp_M_Data[0]; // @[Leds.scala 43:12]
    end
    if (reset) begin // @[Leds.scala 37:20]
      respReg <= 2'h0; // @[Leds.scala 37:20]
    end else if (io_ocp_M_Cmd == 3'h2) begin // @[Leds.scala 47:36]
      respReg <= 2'h1; // @[Leds.scala 48:13]
    end else if (io_ocp_M_Cmd == 3'h1) begin // @[Leds.scala 41:36]
      respReg <= 2'h1; // @[Leds.scala 42:13]
    end else begin
      respReg <= 2'h0; // @[Leds.scala 38:11]
    end
    REG <= ledReg; // @[Leds.scala 56:21]
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
  ledReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  respReg = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  REG = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Gpio(
  input         clock,
  input         reset,
  input  [2:0]  io_ocp_M_Cmd,
  input  [31:0] io_ocp_M_Addr,
  output [1:0]  io_ocp_S_Resp,
  output [31:0] io_ocp_S_Data,
  input  [7:0]  io_pins_gpios_0
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] masterReg_Cmd; // @[Gpio.scala 58:26]
  reg [31:0] masterReg_Addr; // @[Gpio.scala 58:26]
  reg [1:0] respReg; // @[Gpio.scala 61:24]
  reg [31:0] dataReg; // @[Gpio.scala 64:24]
  reg [7:0] gpioRegVec_0; // @[Gpio.scala 67:27]
  assign io_ocp_S_Resp = respReg; // @[Gpio.scala 102:17]
  assign io_ocp_S_Data = dataReg; // @[Gpio.scala 103:17]
  always @(posedge clock) begin
    masterReg_Cmd <= io_ocp_M_Cmd; // @[Gpio.scala 58:26]
    masterReg_Addr <= io_ocp_M_Addr; // @[Gpio.scala 58:26]
    if (reset) begin // @[Gpio.scala 61:24]
      respReg <= 2'h0; // @[Gpio.scala 61:24]
    end else if (masterReg_Cmd == 3'h2) begin // @[Gpio.scala 92:38]
      respReg <= 2'h1; // @[Gpio.scala 93:15]
    end else if (masterReg_Cmd == 3'h1) begin // @[Gpio.scala 94:46]
      respReg <= 2'h3; // @[Gpio.scala 95:15]
    end else begin
      respReg <= 2'h0; // @[Gpio.scala 97:15]
    end
    if (reset) begin // @[Gpio.scala 64:24]
      dataReg <= 32'h0; // @[Gpio.scala 64:24]
    end else if (~masterReg_Addr[2]) begin // @[Gpio.scala 87:59]
      dataReg <= {{24'd0}, gpioRegVec_0}; // @[Gpio.scala 88:17]
    end
    if (reset) begin // @[Gpio.scala 67:27]
      gpioRegVec_0 <= 8'h0; // @[Gpio.scala 67:27]
    end else begin
      gpioRegVec_0 <= io_pins_gpios_0; // @[Gpio.scala 106:17]
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
  masterReg_Cmd = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  masterReg_Addr = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  respReg = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  dataReg = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  gpioRegVec_0 = _RAND_4[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Gpio_1(
  input         clock,
  input         reset,
  input  [2:0]  io_ocp_M_Cmd,
  input  [31:0] io_ocp_M_Addr,
  input  [31:0] io_ocp_M_Data,
  output [1:0]  io_ocp_S_Resp,
  output [31:0] io_ocp_S_Data,
  output [7:0]  io_pins_gpios_0
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] masterReg_Cmd; // @[Gpio.scala 58:26]
  reg [31:0] masterReg_Addr; // @[Gpio.scala 58:26]
  reg [31:0] masterReg_Data; // @[Gpio.scala 58:26]
  reg [1:0] respReg; // @[Gpio.scala 61:24]
  reg [31:0] dataReg; // @[Gpio.scala 64:24]
  reg [7:0] gpioRegVec_0; // @[Gpio.scala 67:27]
  wire  _T_2 = masterReg_Cmd == 3'h1; // @[Gpio.scala 73:28]
  assign io_ocp_S_Resp = respReg; // @[Gpio.scala 102:17]
  assign io_ocp_S_Data = dataReg; // @[Gpio.scala 103:17]
  assign io_pins_gpios_0 = gpioRegVec_0; // @[Gpio.scala 106:17]
  always @(posedge clock) begin
    masterReg_Cmd <= io_ocp_M_Cmd; // @[Gpio.scala 58:26]
    masterReg_Addr <= io_ocp_M_Addr; // @[Gpio.scala 58:26]
    masterReg_Data <= io_ocp_M_Data; // @[Gpio.scala 58:26]
    if (reset) begin // @[Gpio.scala 61:24]
      respReg <= 2'h0; // @[Gpio.scala 61:24]
    end else if (_T_2 | masterReg_Cmd == 3'h2) begin // @[Gpio.scala 80:69]
      respReg <= 2'h1; // @[Gpio.scala 81:15]
    end else begin
      respReg <= 2'h0; // @[Gpio.scala 62:11]
    end
    if (reset) begin // @[Gpio.scala 64:24]
      dataReg <= 32'h0; // @[Gpio.scala 64:24]
    end else if (~masterReg_Addr[2]) begin // @[Gpio.scala 72:59]
      dataReg <= {{24'd0}, gpioRegVec_0}; // @[Gpio.scala 76:17]
    end
    if (reset) begin // @[Gpio.scala 67:27]
      gpioRegVec_0 <= 8'h0; // @[Gpio.scala 67:27]
    end else if (~masterReg_Addr[2]) begin // @[Gpio.scala 72:59]
      if (masterReg_Cmd == 3'h1) begin // @[Gpio.scala 73:42]
        gpioRegVec_0 <= masterReg_Data[7:0]; // @[Gpio.scala 74:25]
      end
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
  masterReg_Cmd = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  masterReg_Addr = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  masterReg_Data = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  respReg = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  dataReg = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  gpioRegVec_0 = _RAND_5[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Spm(
  input         clock,
  input  [2:0]  io_M_Cmd,
  input  [9:0]  io_M_Addr,
  input  [31:0] io_M_Data,
  input  [3:0]  io_M_ByteEn,
  output [1:0]  io_S_Resp,
  output [31:0] io_S_Data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  sky130_sram_1kbyte_1rw1r_32x256_8_clk0; // @[SRAM.scala 18:22]
  wire  sky130_sram_1kbyte_1rw1r_32x256_8_csb0; // @[SRAM.scala 18:22]
  wire  sky130_sram_1kbyte_1rw1r_32x256_8_web0; // @[SRAM.scala 18:22]
  wire [3:0] sky130_sram_1kbyte_1rw1r_32x256_8_wmask0; // @[SRAM.scala 18:22]
  wire [7:0] sky130_sram_1kbyte_1rw1r_32x256_8_addr0; // @[SRAM.scala 18:22]
  wire [31:0] sky130_sram_1kbyte_1rw1r_32x256_8_din0; // @[SRAM.scala 18:22]
  wire [31:0] sky130_sram_1kbyte_1rw1r_32x256_8_dout0; // @[SRAM.scala 18:22]
  wire  sky130_sram_1kbyte_1rw1r_32x256_8_clk1; // @[SRAM.scala 18:22]
  wire  sky130_sram_1kbyte_1rw1r_32x256_8_csb1; // @[SRAM.scala 18:22]
  wire [7:0] sky130_sram_1kbyte_1rw1r_32x256_8_addr1; // @[SRAM.scala 18:22]
  wire [31:0] sky130_sram_1kbyte_1rw1r_32x256_8_dout1; // @[SRAM.scala 18:22]
  reg [2:0] cmdReg; // @[Spm.scala 32:19]
  wire  _T_4 = io_M_Cmd == 3'h1; // @[Spm.scala 59:24]
  wire [1:0] lo = {io_M_ByteEn[1],io_M_ByteEn[0]}; // @[SRAM.scala 85:23]
  wire [1:0] hi = {io_M_ByteEn[3],io_M_ByteEn[2]}; // @[SRAM.scala 85:23]
  sky130_sram_1kbyte_1rw1r_32x256_8 sky130_sram_1kbyte_1rw1r_32x256_8 ( // @[SRAM.scala 18:22]
    .clk0(sky130_sram_1kbyte_1rw1r_32x256_8_clk0),
    .csb0(sky130_sram_1kbyte_1rw1r_32x256_8_csb0),
    .web0(sky130_sram_1kbyte_1rw1r_32x256_8_web0),
    .wmask0(sky130_sram_1kbyte_1rw1r_32x256_8_wmask0),
    .addr0(sky130_sram_1kbyte_1rw1r_32x256_8_addr0),
    .din0(sky130_sram_1kbyte_1rw1r_32x256_8_din0),
    .dout0(sky130_sram_1kbyte_1rw1r_32x256_8_dout0),
    .clk1(sky130_sram_1kbyte_1rw1r_32x256_8_clk1),
    .csb1(sky130_sram_1kbyte_1rw1r_32x256_8_csb1),
    .addr1(sky130_sram_1kbyte_1rw1r_32x256_8_addr1),
    .dout1(sky130_sram_1kbyte_1rw1r_32x256_8_dout1)
  );
  assign io_S_Resp = cmdReg == 3'h1 | cmdReg == 3'h2 ? 2'h1 : 2'h0; // @[Spm.scala 33:19]
  assign io_S_Data = sky130_sram_1kbyte_1rw1r_32x256_8_dout0; // @[Spm.scala 62:15]
  assign sky130_sram_1kbyte_1rw1r_32x256_8_clk0 = clock; // @[SRAM.scala 19:18]
  assign sky130_sram_1kbyte_1rw1r_32x256_8_csb0 = 1'h0; // @[SRAM.scala 21:18]
  assign sky130_sram_1kbyte_1rw1r_32x256_8_web0 = ~_T_4; // @[SRAM.scala 86:16]
  assign sky130_sram_1kbyte_1rw1r_32x256_8_wmask0 = {hi,lo}; // @[SRAM.scala 85:23]
  assign sky130_sram_1kbyte_1rw1r_32x256_8_addr0 = io_M_Addr[9:2]; // @[Spm.scala 59:48]
  assign sky130_sram_1kbyte_1rw1r_32x256_8_din0 = io_M_Data; // @[SRAM.scala 88:13]
  assign sky130_sram_1kbyte_1rw1r_32x256_8_clk1 = clock; // @[SRAM.scala 20:18]
  assign sky130_sram_1kbyte_1rw1r_32x256_8_csb1 = 1'h0; // @[SRAM.scala 22:18]
  assign sky130_sram_1kbyte_1rw1r_32x256_8_addr1 = io_M_Addr[9:2]; // @[Spm.scala 62:36]
  always @(posedge clock) begin
    cmdReg <= io_M_Cmd; // @[Spm.scala 32:19]
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
  cmdReg = _RAND_0[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SPI(
  input         clock,
  input         reset,
  input         io_ReadEnable,
  input         io_WriteEnable,
  input  [23:0] io_Address,
  input  [31:0] io_WriteData_0,
  input  [31:0] io_WriteData_1,
  input  [31:0] io_WriteData_2,
  input  [31:0] io_WriteData_3,
  input  [15:0] io_ByteEnable,
  output [31:0] io_ReadData_0,
  output [31:0] io_ReadData_1,
  output [31:0] io_ReadData_2,
  output [31:0] io_ReadData_3,
  output        io_DataValid,
  output        io_WriteCompleted,
  output        io_SPI_interface_CE,
  output        io_SPI_interface_MOSI,
  input         io_SPI_interface_MISO,
  output        io_SPI_interface_S_CLK
);
`ifdef RANDOMIZE_REG_INIT
  reg [127:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  reg [127:0] DataReg; // @[SPI.scala 46:24]
  reg  WriteCompleted_reg; // @[SPI.scala 60:35]
  reg [2:0] StateReg; // @[SPI.scala 64:25]
  reg [2:0] SubStateReg; // @[SPI.scala 68:28]
  reg [15:0] CntReg; // @[SPI.scala 70:23]
  reg [23:0] TempAddress; // @[SPI.scala 79:28]
  reg [3:0] PosReg; // @[SPI.scala 81:23]
  reg  ClkReg; // @[SPI.scala 90:23]
  reg [7:0] ClkCounter; // @[SPI.scala 91:27]
  reg  ClkRegDelay; // @[SPI.scala 93:28]
  wire  _T_20 = 3'h0 == StateReg; // @[Conditional.scala 37:30]
  wire  _T_24 = 3'h1 == StateReg; // @[Conditional.scala 37:30]
  wire  _T_33 = 3'h2 == StateReg; // @[Conditional.scala 37:30]
  wire  _T_34 = 3'h3 == StateReg; // @[Conditional.scala 37:30]
  wire  _T_43 = 3'h4 == StateReg; // @[Conditional.scala 37:30]
  wire  _T_44 = 3'h5 == StateReg; // @[Conditional.scala 37:30]
  wire  _T_45 = 3'h0 == SubStateReg; // @[Conditional.scala 37:30]
  wire  _T_54 = 3'h1 == SubStateReg; // @[Conditional.scala 37:30]
  wire  _T_63 = 3'h4 == SubStateReg; // @[Conditional.scala 37:30]
  wire  _GEN_49 = _T_54 | _T_63; // @[Conditional.scala 39:67 SPI.scala 254:19]
  wire  _GEN_57 = _T_45 | _GEN_49; // @[Conditional.scala 40:58 SPI.scala 235:19]
  wire  _T_69 = 3'h6 == StateReg; // @[Conditional.scala 37:30]
  wire  _T_70 = 3'h5 == SubStateReg; // @[Conditional.scala 37:30]
  wire  _T_286 = 3'h2 == SubStateReg; // @[Conditional.scala 37:30]
  wire  _GEN_252 = _T_54 | _T_286; // @[Conditional.scala 39:67 SPI.scala 355:19]
  wire  _GEN_260 = _T_45 | _GEN_252; // @[Conditional.scala 39:67 SPI.scala 336:19]
  wire  _GEN_290 = _T_70 ? 1'h0 : _GEN_260; // @[Conditional.scala 40:58 SPI.scala 109:11]
  wire  _GEN_316 = _T_69 & _GEN_290; // @[Conditional.scala 39:67 SPI.scala 109:11]
  wire  _GEN_321 = _T_44 ? _GEN_57 : _GEN_316; // @[Conditional.scala 39:67]
  wire  _GEN_352 = _T_43 ? 1'h0 : _GEN_321; // @[Conditional.scala 39:67 SPI.scala 109:11]
  wire  _GEN_376 = _T_34 | _GEN_352; // @[Conditional.scala 39:67 SPI.scala 194:15]
  wire  _GEN_407 = _T_33 ? 1'h0 : _GEN_376; // @[Conditional.scala 39:67 SPI.scala 109:11]
  wire  _GEN_434 = _T_24 | _GEN_407; // @[Conditional.scala 39:67 SPI.scala 164:15]
  wire  ClockEn = _T_20 ? 1'h0 : _GEN_434; // @[Conditional.scala 40:58 SPI.scala 151:15]
  wire [7:0] _T_6 = ClkCounter + 8'h1; // @[SPI.scala 117:28]
  wire  NextStateInv = ClkCounter == 8'h1 & ClkReg; // @[SPI.scala 119:39 SPI.scala 107:16]
  wire  _T_23 = CntReg == 16'h3fff; // @[SPI.scala 155:19]
  wire  _GEN_346 = _T_44 ? 1'h0 : _T_69 & _T_70; // @[Conditional.scala 39:67 SPI.scala 110:14]
  wire  _GEN_351 = _T_43 ? io_ReadEnable : _GEN_346; // @[Conditional.scala 39:67]
  wire  _GEN_383 = _T_34 ? 1'h0 : _GEN_351; // @[Conditional.scala 39:67 SPI.scala 110:14]
  wire  _GEN_406 = _T_33 ? NextStateInv : _GEN_383; // @[Conditional.scala 39:67]
  wire  _GEN_438 = _T_24 ? 1'h0 : _GEN_406; // @[Conditional.scala 39:67 SPI.scala 110:14]
  wire  ClockReset = _T_20 ? _T_23 : _GEN_438; // @[Conditional.scala 40:58]
  wire  RisingEdge = ClkReg & ~ClkRegDelay; // @[SPI.scala 136:22]
  wire [15:0] _T_22 = CntReg + 16'h1; // @[SPI.scala 152:24]
  wire  _GEN_10 = CntReg == 16'h3fff ? 1'h0 : 1'h1; // @[SPI.scala 155:42 SPI.scala 156:29 SPI.scala 48:23]
  wire [15:0] _T_26 = 16'h7 - CntReg; // @[SPI.scala 167:51]
  wire [7:0] _T_27 = 8'h66 >> _T_26; // @[SPI.scala 167:46]
  wire [15:0] _GEN_14 = NextStateInv ? _T_22 : CntReg; // @[SPI.scala 170:25 SPI.scala 171:16 SPI.scala 168:14]
  wire  _T_32 = CntReg == 16'h7 & NextStateInv; // @[SPI.scala 174:27]
  wire [15:0] _GEN_16 = CntReg == 16'h7 & NextStateInv ? 16'h0 : _GEN_14; // @[SPI.scala 174:44 SPI.scala 176:16]
  wire  _GEN_17 = CntReg == 16'h7 & NextStateInv ? 1'h0 : _T_27[0]; // @[SPI.scala 174:44 SPI.scala 177:31 SPI.scala 167:29]
  wire [2:0] _GEN_20 = NextStateInv ? 3'h3 : 3'h2; // @[SPI.scala 187:25 SPI.scala 189:18 SPI.scala 185:16]
  wire [7:0] _T_37 = 8'h99 >> _T_26; // @[SPI.scala 198:40]
  wire [2:0] _GEN_24 = _T_32 ? 3'h4 : 3'h3; // @[SPI.scala 204:44 SPI.scala 209:18 SPI.scala 196:16]
  wire [2:0] _GEN_25 = io_WriteEnable ? 3'h6 : 3'h4; // @[SPI.scala 224:34 SPI.scala 225:18 SPI.scala 214:16]
  wire [2:0] _GEN_26 = io_WriteEnable ? 3'h5 : SubStateReg; // @[SPI.scala 224:34 SPI.scala 226:21 SPI.scala 68:28]
  wire [2:0] _GEN_27 = io_ReadEnable ? 3'h5 : _GEN_25; // @[SPI.scala 218:27 SPI.scala 219:18]
  wire [2:0] _GEN_28 = io_ReadEnable ? 3'h0 : _GEN_26; // @[SPI.scala 218:27 SPI.scala 220:21]
  wire  _GEN_29 = io_ReadEnable ? 1'h0 : 1'h1; // @[SPI.scala 218:27 SPI.scala 221:29 SPI.scala 215:27]
  wire [7:0] _T_48 = 8'h3 >> _T_26; // @[SPI.scala 239:46]
  wire [2:0] _GEN_33 = _T_32 ? 3'h1 : 3'h0; // @[SPI.scala 246:48 SPI.scala 248:25 SPI.scala 240:23]
  wire [15:0] _T_56 = 16'h17 - CntReg; // @[SPI.scala 258:52]
  wire [23:0] _T_57 = io_Address >> _T_56; // @[SPI.scala 258:46]
  wire  _T_62 = CntReg == 16'h17 & NextStateInv; // @[SPI.scala 265:32]
  wire [15:0] _GEN_35 = CntReg == 16'h17 & NextStateInv ? 16'h0 : _GEN_14; // @[SPI.scala 265:49 SPI.scala 267:20]
  wire [2:0] _GEN_36 = CntReg == 16'h17 & NextStateInv ? 3'h4 : 3'h1; // @[SPI.scala 265:49 SPI.scala 268:25 SPI.scala 259:23]
  wire [128:0] _T_64 = {DataReg,io_SPI_interface_MISO}; // @[Cat.scala 30:58]
  wire [128:0] _GEN_37 = RisingEdge ? _T_64 : {{1'd0}, DataReg}; // @[SPI.scala 279:27 SPI.scala 280:21 SPI.scala 46:24]
  wire [15:0] _GEN_38 = RisingEdge ? _T_22 : CntReg; // @[SPI.scala 279:27 SPI.scala 281:20 SPI.scala 276:18]
  wire  _T_68 = CntReg == 16'h80 & NextStateInv; // @[SPI.scala 284:33]
  wire [2:0] _GEN_40 = CntReg == 16'h80 & NextStateInv ? 3'h4 : 3'h5; // @[SPI.scala 284:50 SPI.scala 286:22 SPI.scala 230:16]
  wire  _GEN_41 = _T_63 ? 1'h0 : 1'h1; // @[Conditional.scala 39:67 SPI.scala 272:31 SPI.scala 48:23]
  wire [2:0] _GEN_43 = _T_63 ? 3'h4 : SubStateReg; // @[Conditional.scala 39:67 SPI.scala 275:23 SPI.scala 68:28]
  wire [15:0] _GEN_44 = _T_63 ? _GEN_38 : 16'h0; // @[Conditional.scala 39:67 SPI.scala 71:10]
  wire [128:0] _GEN_45 = _T_63 ? _GEN_37 : {{1'd0}, DataReg}; // @[Conditional.scala 39:67 SPI.scala 46:24]
  wire [2:0] _GEN_47 = _T_63 ? _GEN_40 : 3'h5; // @[Conditional.scala 39:67 SPI.scala 230:16]
  wire  _GEN_48 = _T_54 ? 1'h0 : _GEN_41; // @[Conditional.scala 39:67 SPI.scala 253:31]
  wire [15:0] _GEN_50 = _T_54 ? _GEN_35 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_51 = _T_54 & _T_57[0]; // @[Conditional.scala 39:67 SPI.scala 258:33 SPI.scala 49:25]
  wire [2:0] _GEN_52 = _T_54 ? _GEN_36 : _GEN_43; // @[Conditional.scala 39:67]
  wire [128:0] _GEN_53 = _T_54 ? {{1'd0}, DataReg} : _GEN_45; // @[Conditional.scala 39:67 SPI.scala 46:24]
  wire  _GEN_54 = _T_54 ? 1'h0 : _T_63 & _T_68; // @[Conditional.scala 39:67 SPI.scala 53:16]
  wire [2:0] _GEN_55 = _T_54 ? 3'h5 : _GEN_47; // @[Conditional.scala 39:67 SPI.scala 230:16]
  wire  _GEN_56 = _T_45 ? 1'h0 : _GEN_48; // @[Conditional.scala 40:58 SPI.scala 234:31]
  wire [15:0] _GEN_58 = _T_45 ? _GEN_16 : _GEN_50; // @[Conditional.scala 40:58]
  wire  _GEN_59 = _T_45 ? _T_48[0] : _GEN_51; // @[Conditional.scala 40:58 SPI.scala 239:33]
  wire [2:0] _GEN_60 = _T_45 ? _GEN_33 : _GEN_52; // @[Conditional.scala 40:58]
  wire [128:0] _GEN_61 = _T_45 ? {{1'd0}, DataReg} : _GEN_53; // @[Conditional.scala 40:58 SPI.scala 46:24]
  wire  _GEN_62 = _T_45 ? 1'h0 : _GEN_54; // @[Conditional.scala 40:58 SPI.scala 53:16]
  wire [2:0] _GEN_63 = _T_45 ? 3'h5 : _GEN_55; // @[Conditional.scala 40:58 SPI.scala 230:16]
  wire [3:0] _GEN_64 = PosReg == 4'hf ? 4'h0 : PosReg; // @[SPI.scala 297:32 SPI.scala 298:20 SPI.scala 81:23]
  wire  _GEN_65 = PosReg == 4'hf | WriteCompleted_reg; // @[SPI.scala 297:32 SPI.scala 299:32 SPI.scala 60:35]
  wire [2:0] _GEN_66 = PosReg == 4'hf ? 3'h4 : 3'h6; // @[SPI.scala 297:32 SPI.scala 300:22 SPI.scala 293:16]
  wire  _T_76 = io_ByteEnable[0] & PosReg == 4'h0; // @[SPI.scala 307:50]
  wire [23:0] _GEN_74 = io_ByteEnable[0] & PosReg == 4'h0 ? io_Address : TempAddress; // @[SPI.scala 307:68 SPI.scala 308:27]
  wire  _GEN_272 = _T_70 & _T_76; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _GEN_330 = _T_44 ? 1'h0 : _T_69 & _GEN_272; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_359 = _T_43 ? 1'h0 : _GEN_330; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_388 = _T_34 ? 1'h0 : _GEN_359; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_417 = _T_33 ? 1'h0 : _GEN_388; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_446 = _T_24 ? 1'h0 : _GEN_417; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  Carry_1 = _T_20 ? 1'h0 : _GEN_446; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _T_93 = 4'h1 > PosReg & io_ByteEnable[1] & ~Carry_1; // @[SPI.scala 312:57]
  wire [23:0] _T_95 = io_Address + 24'h1; // @[SPI.scala 313:41]
  wire [23:0] _GEN_77 = 4'h1 > PosReg & io_ByteEnable[1] & ~Carry_1 ? _T_95 : _GEN_74; // @[SPI.scala 312:70 SPI.scala 313:27]
  wire [3:0] _GEN_78 = 4'h1 > PosReg & io_ByteEnable[1] & ~Carry_1 ? 4'h1 : _GEN_64; // @[SPI.scala 312:70 SPI.scala 314:22]
  wire  _GEN_80 = Carry_1 | _T_93; // @[SPI.scala 310:33 SPI.scala 311:26]
  wire [23:0] _GEN_81 = Carry_1 ? _GEN_74 : _GEN_77; // @[SPI.scala 310:33]
  wire [3:0] _GEN_82 = Carry_1 ? _GEN_64 : _GEN_78; // @[SPI.scala 310:33]
  wire  _GEN_273 = _T_70 & _GEN_80; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _GEN_331 = _T_44 ? 1'h0 : _T_69 & _GEN_273; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_360 = _T_43 ? 1'h0 : _GEN_331; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_389 = _T_34 ? 1'h0 : _GEN_360; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_418 = _T_33 ? 1'h0 : _GEN_389; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_447 = _T_24 ? 1'h0 : _GEN_418; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  Carry_2 = _T_20 ? 1'h0 : _GEN_447; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _T_105 = 4'h2 > PosReg & io_ByteEnable[2] & ~Carry_2; // @[SPI.scala 312:57]
  wire [23:0] _T_107 = io_Address + 24'h2; // @[SPI.scala 313:41]
  wire [23:0] _GEN_86 = 4'h2 > PosReg & io_ByteEnable[2] & ~Carry_2 ? _T_107 : _GEN_81; // @[SPI.scala 312:70 SPI.scala 313:27]
  wire [3:0] _GEN_87 = 4'h2 > PosReg & io_ByteEnable[2] & ~Carry_2 ? 4'h2 : _GEN_82; // @[SPI.scala 312:70 SPI.scala 314:22]
  wire  _GEN_89 = Carry_2 | _T_105; // @[SPI.scala 310:33 SPI.scala 311:26]
  wire [23:0] _GEN_90 = Carry_2 ? _GEN_81 : _GEN_86; // @[SPI.scala 310:33]
  wire [3:0] _GEN_91 = Carry_2 ? _GEN_82 : _GEN_87; // @[SPI.scala 310:33]
  wire  _GEN_274 = _T_70 & _GEN_89; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _GEN_332 = _T_44 ? 1'h0 : _T_69 & _GEN_274; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_361 = _T_43 ? 1'h0 : _GEN_332; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_390 = _T_34 ? 1'h0 : _GEN_361; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_419 = _T_33 ? 1'h0 : _GEN_390; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_448 = _T_24 ? 1'h0 : _GEN_419; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  Carry_3 = _T_20 ? 1'h0 : _GEN_448; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _T_117 = 4'h3 > PosReg & io_ByteEnable[3] & ~Carry_3; // @[SPI.scala 312:57]
  wire [23:0] _T_119 = io_Address + 24'h3; // @[SPI.scala 313:41]
  wire [23:0] _GEN_95 = 4'h3 > PosReg & io_ByteEnable[3] & ~Carry_3 ? _T_119 : _GEN_90; // @[SPI.scala 312:70 SPI.scala 313:27]
  wire [3:0] _GEN_96 = 4'h3 > PosReg & io_ByteEnable[3] & ~Carry_3 ? 4'h3 : _GEN_91; // @[SPI.scala 312:70 SPI.scala 314:22]
  wire  _GEN_98 = Carry_3 | _T_117; // @[SPI.scala 310:33 SPI.scala 311:26]
  wire [23:0] _GEN_99 = Carry_3 ? _GEN_90 : _GEN_95; // @[SPI.scala 310:33]
  wire [3:0] _GEN_100 = Carry_3 ? _GEN_91 : _GEN_96; // @[SPI.scala 310:33]
  wire  _GEN_275 = _T_70 & _GEN_98; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _GEN_333 = _T_44 ? 1'h0 : _T_69 & _GEN_275; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_362 = _T_43 ? 1'h0 : _GEN_333; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_391 = _T_34 ? 1'h0 : _GEN_362; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_420 = _T_33 ? 1'h0 : _GEN_391; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_449 = _T_24 ? 1'h0 : _GEN_420; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  Carry_4 = _T_20 ? 1'h0 : _GEN_449; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _T_129 = 4'h4 > PosReg & io_ByteEnable[4] & ~Carry_4; // @[SPI.scala 312:57]
  wire [23:0] _T_131 = io_Address + 24'h4; // @[SPI.scala 313:41]
  wire [23:0] _GEN_104 = 4'h4 > PosReg & io_ByteEnable[4] & ~Carry_4 ? _T_131 : _GEN_99; // @[SPI.scala 312:70 SPI.scala 313:27]
  wire [3:0] _GEN_105 = 4'h4 > PosReg & io_ByteEnable[4] & ~Carry_4 ? 4'h4 : _GEN_100; // @[SPI.scala 312:70 SPI.scala 314:22]
  wire  _GEN_107 = Carry_4 | _T_129; // @[SPI.scala 310:33 SPI.scala 311:26]
  wire [23:0] _GEN_108 = Carry_4 ? _GEN_99 : _GEN_104; // @[SPI.scala 310:33]
  wire [3:0] _GEN_109 = Carry_4 ? _GEN_100 : _GEN_105; // @[SPI.scala 310:33]
  wire  _GEN_276 = _T_70 & _GEN_107; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _GEN_334 = _T_44 ? 1'h0 : _T_69 & _GEN_276; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_363 = _T_43 ? 1'h0 : _GEN_334; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_392 = _T_34 ? 1'h0 : _GEN_363; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_421 = _T_33 ? 1'h0 : _GEN_392; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_450 = _T_24 ? 1'h0 : _GEN_421; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  Carry_5 = _T_20 ? 1'h0 : _GEN_450; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _T_141 = 4'h5 > PosReg & io_ByteEnable[5] & ~Carry_5; // @[SPI.scala 312:57]
  wire [23:0] _T_143 = io_Address + 24'h5; // @[SPI.scala 313:41]
  wire [23:0] _GEN_113 = 4'h5 > PosReg & io_ByteEnable[5] & ~Carry_5 ? _T_143 : _GEN_108; // @[SPI.scala 312:70 SPI.scala 313:27]
  wire [3:0] _GEN_114 = 4'h5 > PosReg & io_ByteEnable[5] & ~Carry_5 ? 4'h5 : _GEN_109; // @[SPI.scala 312:70 SPI.scala 314:22]
  wire  _GEN_116 = Carry_5 | _T_141; // @[SPI.scala 310:33 SPI.scala 311:26]
  wire [23:0] _GEN_117 = Carry_5 ? _GEN_108 : _GEN_113; // @[SPI.scala 310:33]
  wire [3:0] _GEN_118 = Carry_5 ? _GEN_109 : _GEN_114; // @[SPI.scala 310:33]
  wire  _GEN_277 = _T_70 & _GEN_116; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _GEN_335 = _T_44 ? 1'h0 : _T_69 & _GEN_277; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_364 = _T_43 ? 1'h0 : _GEN_335; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_393 = _T_34 ? 1'h0 : _GEN_364; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_422 = _T_33 ? 1'h0 : _GEN_393; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_451 = _T_24 ? 1'h0 : _GEN_422; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  Carry_6 = _T_20 ? 1'h0 : _GEN_451; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _T_153 = 4'h6 > PosReg & io_ByteEnable[6] & ~Carry_6; // @[SPI.scala 312:57]
  wire [23:0] _T_155 = io_Address + 24'h6; // @[SPI.scala 313:41]
  wire [23:0] _GEN_122 = 4'h6 > PosReg & io_ByteEnable[6] & ~Carry_6 ? _T_155 : _GEN_117; // @[SPI.scala 312:70 SPI.scala 313:27]
  wire [3:0] _GEN_123 = 4'h6 > PosReg & io_ByteEnable[6] & ~Carry_6 ? 4'h6 : _GEN_118; // @[SPI.scala 312:70 SPI.scala 314:22]
  wire  _GEN_125 = Carry_6 | _T_153; // @[SPI.scala 310:33 SPI.scala 311:26]
  wire [23:0] _GEN_126 = Carry_6 ? _GEN_117 : _GEN_122; // @[SPI.scala 310:33]
  wire [3:0] _GEN_127 = Carry_6 ? _GEN_118 : _GEN_123; // @[SPI.scala 310:33]
  wire  _GEN_278 = _T_70 & _GEN_125; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _GEN_336 = _T_44 ? 1'h0 : _T_69 & _GEN_278; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_365 = _T_43 ? 1'h0 : _GEN_336; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_394 = _T_34 ? 1'h0 : _GEN_365; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_423 = _T_33 ? 1'h0 : _GEN_394; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_452 = _T_24 ? 1'h0 : _GEN_423; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  Carry_7 = _T_20 ? 1'h0 : _GEN_452; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _T_165 = 4'h7 > PosReg & io_ByteEnable[7] & ~Carry_7; // @[SPI.scala 312:57]
  wire [23:0] _T_167 = io_Address + 24'h7; // @[SPI.scala 313:41]
  wire [23:0] _GEN_131 = 4'h7 > PosReg & io_ByteEnable[7] & ~Carry_7 ? _T_167 : _GEN_126; // @[SPI.scala 312:70 SPI.scala 313:27]
  wire [3:0] _GEN_132 = 4'h7 > PosReg & io_ByteEnable[7] & ~Carry_7 ? 4'h7 : _GEN_127; // @[SPI.scala 312:70 SPI.scala 314:22]
  wire  _GEN_134 = Carry_7 | _T_165; // @[SPI.scala 310:33 SPI.scala 311:26]
  wire [23:0] _GEN_135 = Carry_7 ? _GEN_126 : _GEN_131; // @[SPI.scala 310:33]
  wire [3:0] _GEN_136 = Carry_7 ? _GEN_127 : _GEN_132; // @[SPI.scala 310:33]
  wire  _GEN_279 = _T_70 & _GEN_134; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _GEN_337 = _T_44 ? 1'h0 : _T_69 & _GEN_279; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_366 = _T_43 ? 1'h0 : _GEN_337; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_395 = _T_34 ? 1'h0 : _GEN_366; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_424 = _T_33 ? 1'h0 : _GEN_395; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_453 = _T_24 ? 1'h0 : _GEN_424; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  Carry_8 = _T_20 ? 1'h0 : _GEN_453; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _T_177 = 4'h8 > PosReg & io_ByteEnable[8] & ~Carry_8; // @[SPI.scala 312:57]
  wire [23:0] _T_179 = io_Address + 24'h8; // @[SPI.scala 313:41]
  wire [23:0] _GEN_140 = 4'h8 > PosReg & io_ByteEnable[8] & ~Carry_8 ? _T_179 : _GEN_135; // @[SPI.scala 312:70 SPI.scala 313:27]
  wire [3:0] _GEN_141 = 4'h8 > PosReg & io_ByteEnable[8] & ~Carry_8 ? 4'h8 : _GEN_136; // @[SPI.scala 312:70 SPI.scala 314:22]
  wire  _GEN_143 = Carry_8 | _T_177; // @[SPI.scala 310:33 SPI.scala 311:26]
  wire [23:0] _GEN_144 = Carry_8 ? _GEN_135 : _GEN_140; // @[SPI.scala 310:33]
  wire [3:0] _GEN_145 = Carry_8 ? _GEN_136 : _GEN_141; // @[SPI.scala 310:33]
  wire  _GEN_280 = _T_70 & _GEN_143; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _GEN_338 = _T_44 ? 1'h0 : _T_69 & _GEN_280; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_367 = _T_43 ? 1'h0 : _GEN_338; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_396 = _T_34 ? 1'h0 : _GEN_367; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_425 = _T_33 ? 1'h0 : _GEN_396; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_454 = _T_24 ? 1'h0 : _GEN_425; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  Carry_9 = _T_20 ? 1'h0 : _GEN_454; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _T_189 = 4'h9 > PosReg & io_ByteEnable[9] & ~Carry_9; // @[SPI.scala 312:57]
  wire [23:0] _T_191 = io_Address + 24'h9; // @[SPI.scala 313:41]
  wire [23:0] _GEN_149 = 4'h9 > PosReg & io_ByteEnable[9] & ~Carry_9 ? _T_191 : _GEN_144; // @[SPI.scala 312:70 SPI.scala 313:27]
  wire [3:0] _GEN_150 = 4'h9 > PosReg & io_ByteEnable[9] & ~Carry_9 ? 4'h9 : _GEN_145; // @[SPI.scala 312:70 SPI.scala 314:22]
  wire  _GEN_152 = Carry_9 | _T_189; // @[SPI.scala 310:33 SPI.scala 311:26]
  wire [23:0] _GEN_153 = Carry_9 ? _GEN_144 : _GEN_149; // @[SPI.scala 310:33]
  wire [3:0] _GEN_154 = Carry_9 ? _GEN_145 : _GEN_150; // @[SPI.scala 310:33]
  wire  _GEN_281 = _T_70 & _GEN_152; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _GEN_339 = _T_44 ? 1'h0 : _T_69 & _GEN_281; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_368 = _T_43 ? 1'h0 : _GEN_339; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_397 = _T_34 ? 1'h0 : _GEN_368; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_426 = _T_33 ? 1'h0 : _GEN_397; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_455 = _T_24 ? 1'h0 : _GEN_426; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  Carry_10 = _T_20 ? 1'h0 : _GEN_455; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _T_201 = 4'ha > PosReg & io_ByteEnable[10] & ~Carry_10; // @[SPI.scala 312:57]
  wire [23:0] _T_203 = io_Address + 24'ha; // @[SPI.scala 313:41]
  wire [23:0] _GEN_158 = 4'ha > PosReg & io_ByteEnable[10] & ~Carry_10 ? _T_203 : _GEN_153; // @[SPI.scala 312:70 SPI.scala 313:27]
  wire [3:0] _GEN_159 = 4'ha > PosReg & io_ByteEnable[10] & ~Carry_10 ? 4'ha : _GEN_154; // @[SPI.scala 312:70 SPI.scala 314:22]
  wire  _GEN_161 = Carry_10 | _T_201; // @[SPI.scala 310:33 SPI.scala 311:26]
  wire [23:0] _GEN_162 = Carry_10 ? _GEN_153 : _GEN_158; // @[SPI.scala 310:33]
  wire [3:0] _GEN_163 = Carry_10 ? _GEN_154 : _GEN_159; // @[SPI.scala 310:33]
  wire  _GEN_282 = _T_70 & _GEN_161; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _GEN_340 = _T_44 ? 1'h0 : _T_69 & _GEN_282; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_369 = _T_43 ? 1'h0 : _GEN_340; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_398 = _T_34 ? 1'h0 : _GEN_369; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_427 = _T_33 ? 1'h0 : _GEN_398; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_456 = _T_24 ? 1'h0 : _GEN_427; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  Carry_11 = _T_20 ? 1'h0 : _GEN_456; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _T_213 = 4'hb > PosReg & io_ByteEnable[11] & ~Carry_11; // @[SPI.scala 312:57]
  wire [23:0] _T_215 = io_Address + 24'hb; // @[SPI.scala 313:41]
  wire [23:0] _GEN_167 = 4'hb > PosReg & io_ByteEnable[11] & ~Carry_11 ? _T_215 : _GEN_162; // @[SPI.scala 312:70 SPI.scala 313:27]
  wire [3:0] _GEN_168 = 4'hb > PosReg & io_ByteEnable[11] & ~Carry_11 ? 4'hb : _GEN_163; // @[SPI.scala 312:70 SPI.scala 314:22]
  wire  _GEN_170 = Carry_11 | _T_213; // @[SPI.scala 310:33 SPI.scala 311:26]
  wire [23:0] _GEN_171 = Carry_11 ? _GEN_162 : _GEN_167; // @[SPI.scala 310:33]
  wire [3:0] _GEN_172 = Carry_11 ? _GEN_163 : _GEN_168; // @[SPI.scala 310:33]
  wire  _GEN_283 = _T_70 & _GEN_170; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _GEN_341 = _T_44 ? 1'h0 : _T_69 & _GEN_283; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_370 = _T_43 ? 1'h0 : _GEN_341; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_399 = _T_34 ? 1'h0 : _GEN_370; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_428 = _T_33 ? 1'h0 : _GEN_399; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_457 = _T_24 ? 1'h0 : _GEN_428; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  Carry_12 = _T_20 ? 1'h0 : _GEN_457; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _T_225 = 4'hc > PosReg & io_ByteEnable[12] & ~Carry_12; // @[SPI.scala 312:57]
  wire [23:0] _T_227 = io_Address + 24'hc; // @[SPI.scala 313:41]
  wire [23:0] _GEN_176 = 4'hc > PosReg & io_ByteEnable[12] & ~Carry_12 ? _T_227 : _GEN_171; // @[SPI.scala 312:70 SPI.scala 313:27]
  wire [3:0] _GEN_177 = 4'hc > PosReg & io_ByteEnable[12] & ~Carry_12 ? 4'hc : _GEN_172; // @[SPI.scala 312:70 SPI.scala 314:22]
  wire  _GEN_179 = Carry_12 | _T_225; // @[SPI.scala 310:33 SPI.scala 311:26]
  wire [23:0] _GEN_180 = Carry_12 ? _GEN_171 : _GEN_176; // @[SPI.scala 310:33]
  wire [3:0] _GEN_181 = Carry_12 ? _GEN_172 : _GEN_177; // @[SPI.scala 310:33]
  wire  _GEN_284 = _T_70 & _GEN_179; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _GEN_342 = _T_44 ? 1'h0 : _T_69 & _GEN_284; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_371 = _T_43 ? 1'h0 : _GEN_342; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_400 = _T_34 ? 1'h0 : _GEN_371; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_429 = _T_33 ? 1'h0 : _GEN_400; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_458 = _T_24 ? 1'h0 : _GEN_429; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  Carry_13 = _T_20 ? 1'h0 : _GEN_458; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _T_237 = 4'hd > PosReg & io_ByteEnable[13] & ~Carry_13; // @[SPI.scala 312:57]
  wire [23:0] _T_239 = io_Address + 24'hd; // @[SPI.scala 313:41]
  wire [23:0] _GEN_185 = 4'hd > PosReg & io_ByteEnable[13] & ~Carry_13 ? _T_239 : _GEN_180; // @[SPI.scala 312:70 SPI.scala 313:27]
  wire [3:0] _GEN_186 = 4'hd > PosReg & io_ByteEnable[13] & ~Carry_13 ? 4'hd : _GEN_181; // @[SPI.scala 312:70 SPI.scala 314:22]
  wire  _GEN_188 = Carry_13 | _T_237; // @[SPI.scala 310:33 SPI.scala 311:26]
  wire [23:0] _GEN_189 = Carry_13 ? _GEN_180 : _GEN_185; // @[SPI.scala 310:33]
  wire [3:0] _GEN_190 = Carry_13 ? _GEN_181 : _GEN_186; // @[SPI.scala 310:33]
  wire  _GEN_285 = _T_70 & _GEN_188; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _GEN_343 = _T_44 ? 1'h0 : _T_69 & _GEN_285; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_372 = _T_43 ? 1'h0 : _GEN_343; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_401 = _T_34 ? 1'h0 : _GEN_372; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_430 = _T_33 ? 1'h0 : _GEN_401; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_459 = _T_24 ? 1'h0 : _GEN_430; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  Carry_14 = _T_20 ? 1'h0 : _GEN_459; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _T_249 = 4'he > PosReg & io_ByteEnable[14] & ~Carry_14; // @[SPI.scala 312:57]
  wire [23:0] _T_251 = io_Address + 24'he; // @[SPI.scala 313:41]
  wire [23:0] _GEN_194 = 4'he > PosReg & io_ByteEnable[14] & ~Carry_14 ? _T_251 : _GEN_189; // @[SPI.scala 312:70 SPI.scala 313:27]
  wire [3:0] _GEN_195 = 4'he > PosReg & io_ByteEnable[14] & ~Carry_14 ? 4'he : _GEN_190; // @[SPI.scala 312:70 SPI.scala 314:22]
  wire  _GEN_197 = Carry_14 | _T_249; // @[SPI.scala 310:33 SPI.scala 311:26]
  wire [23:0] _GEN_198 = Carry_14 ? _GEN_189 : _GEN_194; // @[SPI.scala 310:33]
  wire [3:0] _GEN_199 = Carry_14 ? _GEN_190 : _GEN_195; // @[SPI.scala 310:33]
  wire  _GEN_286 = _T_70 & _GEN_197; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _GEN_344 = _T_44 ? 1'h0 : _T_69 & _GEN_286; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_373 = _T_43 ? 1'h0 : _GEN_344; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_402 = _T_34 ? 1'h0 : _GEN_373; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_431 = _T_33 ? 1'h0 : _GEN_402; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  _GEN_460 = _T_24 ? 1'h0 : _GEN_431; // @[Conditional.scala 39:67 SPI.scala 85:14]
  wire  Carry_15 = _T_20 ? 1'h0 : _GEN_460; // @[Conditional.scala 40:58 SPI.scala 85:14]
  wire  _T_260 = ~Carry_15; // @[SPI.scala 312:60]
  wire [23:0] _T_263 = io_Address + 24'hf; // @[SPI.scala 313:41]
  wire [23:0] _GEN_203 = 4'hf > PosReg & io_ByteEnable[15] & ~Carry_15 ? _T_263 : _GEN_198; // @[SPI.scala 312:70 SPI.scala 313:27]
  wire [3:0] _GEN_204 = 4'hf > PosReg & io_ByteEnable[15] & ~Carry_15 ? 4'hf : _GEN_199; // @[SPI.scala 312:70 SPI.scala 314:22]
  wire [23:0] _GEN_207 = Carry_15 ? _GEN_198 : _GEN_203; // @[SPI.scala 310:33]
  wire [3:0] _GEN_208 = Carry_15 ? _GEN_199 : _GEN_204; // @[SPI.scala 310:33]
  wire [3:0] _GEN_212 = _T_260 ? 4'h0 : _GEN_208; // @[SPI.scala 321:34 SPI.scala 322:20]
  wire  _GEN_213 = _T_260 | _GEN_65; // @[SPI.scala 321:34 SPI.scala 323:32]
  wire [2:0] _GEN_214 = _T_260 ? 3'h4 : _GEN_66; // @[SPI.scala 321:34 SPI.scala 324:22]
  wire [7:0] _T_269 = 8'h2 >> _T_26; // @[SPI.scala 340:47]
  wire [23:0] _T_278 = TempAddress >> _T_56; // @[SPI.scala 359:47]
  wire  _GEN_220 = _T_62 ? TempAddress[0] : _T_278[0]; // @[SPI.scala 366:48 SPI.scala 367:35 SPI.scala 359:33]
  wire [2:0] _GEN_222 = _T_62 ? 3'h2 : 3'h1; // @[SPI.scala 366:48 SPI.scala 369:25 SPI.scala 360:23]
  wire [1:0] hi = PosReg[1:0]; // @[SPI.scala 378:90]
  wire [2:0] lo = CntReg[2:0]; // @[SPI.scala 378:102]
  wire [4:0] _T_288 = {hi,lo}; // @[Cat.scala 30:58]
  wire [4:0] _T_290 = 5'h1f - _T_288; // @[SPI.scala 378:78]
  wire [31:0] _GEN_224 = 2'h1 == PosReg[3:2] ? io_WriteData_1 : io_WriteData_0; // @[SPI.scala 378:72 SPI.scala 378:72]
  wire [31:0] _GEN_225 = 2'h2 == PosReg[3:2] ? io_WriteData_2 : _GEN_224; // @[SPI.scala 378:72 SPI.scala 378:72]
  wire [31:0] _GEN_226 = 2'h3 == PosReg[3:2] ? io_WriteData_3 : _GEN_225; // @[SPI.scala 378:72 SPI.scala 378:72]
  wire [31:0] _T_291 = _GEN_226 >> _T_290; // @[SPI.scala 378:72]
  wire [3:0] _T_298 = PosReg + 4'h1; // @[SPI.scala 386:30]
  wire [15:0] _T_301 = io_ByteEnable >> _T_298; // @[SPI.scala 391:32]
  wire  _T_303 = ~_T_301[0]; // @[SPI.scala 391:18]
  wire [2:0] _GEN_229 = ~_T_301[0] ? 3'h3 : 3'h2; // @[SPI.scala 391:48 SPI.scala 393:27 SPI.scala 379:23]
  wire [3:0] _GEN_231 = _T_32 ? _T_298 : PosReg; // @[SPI.scala 385:48 SPI.scala 386:20 SPI.scala 81:23]
  wire [2:0] _GEN_233 = _T_32 ? _GEN_229 : 3'h2; // @[SPI.scala 385:48 SPI.scala 379:23]
  wire  _GEN_234 = _T_32 & _T_303; // @[SPI.scala 385:48 SPI.scala 373:31]
  wire [6:0] _T_304 = {PosReg, 3'h0}; // @[SPI.scala 398:34]
  wire [15:0] _GEN_491 = {{9'd0}, _T_304}; // @[SPI.scala 398:24]
  wire [15:0] _T_306 = CntReg + _GEN_491; // @[SPI.scala 398:24]
  wire [15:0] _GEN_235 = _T_306 == 16'h7f & NextStateInv ? 16'h0 : _GEN_16; // @[SPI.scala 398:75 SPI.scala 399:20]
  wire [3:0] _GEN_236 = _T_306 == 16'h7f & NextStateInv ? 4'h0 : _GEN_231; // @[SPI.scala 398:75 SPI.scala 400:20]
  wire  _GEN_237 = _T_306 == 16'h7f & NextStateInv | WriteCompleted_reg; // @[SPI.scala 398:75 SPI.scala 401:32 SPI.scala 60:35]
  wire [2:0] _GEN_238 = _T_306 == 16'h7f & NextStateInv ? 3'h4 : 3'h6; // @[SPI.scala 398:75 SPI.scala 402:22 SPI.scala 293:16]
  wire  _GEN_239 = _T_306 == 16'h7f & NextStateInv | _GEN_234; // @[SPI.scala 398:75 SPI.scala 403:33]
  wire  _T_309 = 3'h3 == SubStateReg; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_240 = NextStateInv ? 3'h5 : SubStateReg; // @[SPI.scala 413:29 SPI.scala 414:25 SPI.scala 68:28]
  wire [2:0] _GEN_242 = _T_309 ? _GEN_240 : SubStateReg; // @[Conditional.scala 39:67 SPI.scala 68:28]
  wire  _GEN_243 = _T_286 ? _GEN_239 : 1'h1; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_245 = _T_286 ? _GEN_235 : 16'h0; // @[Conditional.scala 39:67 SPI.scala 71:10]
  wire  _GEN_246 = _T_286 & _T_291[0]; // @[Conditional.scala 39:67 SPI.scala 378:33 SPI.scala 49:25]
  wire [2:0] _GEN_247 = _T_286 ? _GEN_233 : _GEN_242; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_248 = _T_286 ? _GEN_236 : PosReg; // @[Conditional.scala 39:67 SPI.scala 81:23]
  wire  _GEN_249 = _T_286 ? _GEN_237 : WriteCompleted_reg; // @[Conditional.scala 39:67 SPI.scala 60:35]
  wire [2:0] _GEN_250 = _T_286 ? _GEN_238 : 3'h6; // @[Conditional.scala 39:67 SPI.scala 293:16]
  wire  _GEN_251 = _T_54 ? 1'h0 : _GEN_243; // @[Conditional.scala 39:67 SPI.scala 354:31]
  wire [15:0] _GEN_253 = _T_54 ? _GEN_35 : _GEN_245; // @[Conditional.scala 39:67]
  wire  _GEN_254 = _T_54 ? _GEN_220 : _GEN_246; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_255 = _T_54 ? _GEN_222 : _GEN_247; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_256 = _T_54 ? PosReg : _GEN_248; // @[Conditional.scala 39:67 SPI.scala 81:23]
  wire  _GEN_257 = _T_54 ? WriteCompleted_reg : _GEN_249; // @[Conditional.scala 39:67 SPI.scala 60:35]
  wire [2:0] _GEN_258 = _T_54 ? 3'h6 : _GEN_250; // @[Conditional.scala 39:67 SPI.scala 293:16]
  wire  _GEN_259 = _T_45 ? 1'h0 : _GEN_251; // @[Conditional.scala 39:67 SPI.scala 335:31]
  wire [15:0] _GEN_261 = _T_45 ? _GEN_16 : _GEN_253; // @[Conditional.scala 39:67]
  wire  _GEN_262 = _T_45 ? _T_269[0] : _GEN_254; // @[Conditional.scala 39:67 SPI.scala 340:33]
  wire [2:0] _GEN_263 = _T_45 ? _GEN_33 : _GEN_255; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_264 = _T_45 ? PosReg : _GEN_256; // @[Conditional.scala 39:67 SPI.scala 81:23]
  wire  _GEN_265 = _T_45 ? WriteCompleted_reg : _GEN_257; // @[Conditional.scala 39:67 SPI.scala 60:35]
  wire [2:0] _GEN_266 = _T_45 ? 3'h6 : _GEN_258; // @[Conditional.scala 39:67 SPI.scala 293:16]
  wire [3:0] _GEN_267 = _T_70 ? _GEN_212 : _GEN_264; // @[Conditional.scala 40:58]
  wire  _GEN_268 = _T_70 ? _GEN_213 : _GEN_265; // @[Conditional.scala 40:58]
  wire [2:0] _GEN_269 = _T_70 ? _GEN_214 : _GEN_266; // @[Conditional.scala 40:58]
  wire  _GEN_270 = _T_70 ? 1'h0 : _GEN_259; // @[Conditional.scala 40:58 SPI.scala 330:31]
  wire [23:0] _GEN_271 = _T_70 ? _GEN_207 : TempAddress; // @[Conditional.scala 40:58 SPI.scala 79:28]
  wire [2:0] _GEN_288 = _T_70 ? 3'h0 : _GEN_263; // @[Conditional.scala 40:58 SPI.scala 328:23]
  wire [15:0] _GEN_291 = _T_70 ? 16'h0 : _GEN_261; // @[Conditional.scala 40:58 SPI.scala 71:10]
  wire  _GEN_292 = _T_70 ? 1'h0 : _GEN_262; // @[Conditional.scala 40:58 SPI.scala 49:25]
  wire [2:0] _GEN_293 = _T_69 ? _GEN_269 : 3'h0; // @[Conditional.scala 39:67 SPI.scala 65:12]
  wire [3:0] _GEN_294 = _T_69 ? _GEN_267 : PosReg; // @[Conditional.scala 39:67 SPI.scala 81:23]
  wire  _GEN_295 = _T_69 ? _GEN_268 : WriteCompleted_reg; // @[Conditional.scala 39:67 SPI.scala 60:35]
  wire  _GEN_296 = _T_69 ? _GEN_270 : 1'h1; // @[Conditional.scala 39:67 SPI.scala 48:23]
  wire [23:0] _GEN_297 = _T_69 ? _GEN_271 : TempAddress; // @[Conditional.scala 39:67 SPI.scala 79:28]
  wire [2:0] _GEN_314 = _T_69 ? _GEN_288 : SubStateReg; // @[Conditional.scala 39:67 SPI.scala 68:28]
  wire [15:0] _GEN_317 = _T_69 ? _GEN_291 : 16'h0; // @[Conditional.scala 39:67 SPI.scala 71:10]
  wire  _GEN_318 = _T_69 & _GEN_292; // @[Conditional.scala 39:67 SPI.scala 49:25]
  wire [2:0] _GEN_319 = _T_44 ? _GEN_63 : _GEN_293; // @[Conditional.scala 39:67]
  wire  _GEN_320 = _T_44 ? _GEN_56 : _GEN_296; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_322 = _T_44 ? _GEN_58 : _GEN_317; // @[Conditional.scala 39:67]
  wire  _GEN_323 = _T_44 ? _GEN_59 : _GEN_318; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_324 = _T_44 ? _GEN_60 : _GEN_314; // @[Conditional.scala 39:67]
  wire [128:0] _GEN_325 = _T_44 ? _GEN_61 : {{1'd0}, DataReg}; // @[Conditional.scala 39:67 SPI.scala 46:24]
  wire [3:0] _GEN_327 = _T_44 ? PosReg : _GEN_294; // @[Conditional.scala 39:67 SPI.scala 81:23]
  wire  _GEN_328 = _T_44 ? WriteCompleted_reg : _GEN_295; // @[Conditional.scala 39:67 SPI.scala 60:35]
  wire [23:0] _GEN_329 = _T_44 ? TempAddress : _GEN_297; // @[Conditional.scala 39:67 SPI.scala 79:28]
  wire [2:0] _GEN_347 = _T_43 ? _GEN_27 : _GEN_319; // @[Conditional.scala 39:67]
  wire  _GEN_348 = _T_43 ? _GEN_29 : _GEN_320; // @[Conditional.scala 39:67]
  wire  _GEN_349 = _T_43 ? 1'h0 : _GEN_328; // @[Conditional.scala 39:67 SPI.scala 216:26]
  wire [2:0] _GEN_350 = _T_43 ? _GEN_28 : _GEN_324; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_353 = _T_43 ? 16'h0 : _GEN_322; // @[Conditional.scala 39:67 SPI.scala 71:10]
  wire  _GEN_354 = _T_43 ? 1'h0 : _GEN_323; // @[Conditional.scala 39:67 SPI.scala 49:25]
  wire [128:0] _GEN_355 = _T_43 ? {{1'd0}, DataReg} : _GEN_325; // @[Conditional.scala 39:67 SPI.scala 46:24]
  wire  _GEN_356 = _T_43 ? 1'h0 : _T_44 & _GEN_62; // @[Conditional.scala 39:67 SPI.scala 53:16]
  wire [3:0] _GEN_357 = _T_43 ? PosReg : _GEN_327; // @[Conditional.scala 39:67 SPI.scala 81:23]
  wire [23:0] _GEN_358 = _T_43 ? TempAddress : _GEN_329; // @[Conditional.scala 39:67 SPI.scala 79:28]
  wire  _GEN_375 = _T_34 ? _T_32 : _GEN_348; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_377 = _T_34 ? _GEN_24 : _GEN_347; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_378 = _T_34 ? _GEN_16 : _GEN_353; // @[Conditional.scala 39:67]
  wire  _GEN_379 = _T_34 ? _T_37[0] : _GEN_354; // @[Conditional.scala 39:67 SPI.scala 198:29]
  wire  _GEN_381 = _T_34 ? WriteCompleted_reg : _GEN_349; // @[Conditional.scala 39:67 SPI.scala 60:35]
  wire [2:0] _GEN_382 = _T_34 ? SubStateReg : _GEN_350; // @[Conditional.scala 39:67 SPI.scala 68:28]
  wire [128:0] _GEN_384 = _T_34 ? {{1'd0}, DataReg} : _GEN_355; // @[Conditional.scala 39:67 SPI.scala 46:24]
  wire  _GEN_385 = _T_34 ? 1'h0 : _GEN_356; // @[Conditional.scala 39:67 SPI.scala 53:16]
  wire [3:0] _GEN_386 = _T_34 ? PosReg : _GEN_357; // @[Conditional.scala 39:67 SPI.scala 81:23]
  wire [23:0] _GEN_387 = _T_34 ? TempAddress : _GEN_358; // @[Conditional.scala 39:67 SPI.scala 79:28]
  wire  _GEN_404 = _T_33 | _GEN_375; // @[Conditional.scala 39:67 SPI.scala 183:27]
  wire  _GEN_409 = _T_33 ? 1'h0 : _GEN_379; // @[Conditional.scala 39:67 SPI.scala 49:25]
  wire [128:0] _GEN_413 = _T_33 ? {{1'd0}, DataReg} : _GEN_384; // @[Conditional.scala 39:67 SPI.scala 46:24]
  wire  _GEN_414 = _T_33 ? 1'h0 : _GEN_385; // @[Conditional.scala 39:67 SPI.scala 53:16]
  wire  _GEN_433 = _T_24 ? _T_32 : _GEN_404; // @[Conditional.scala 39:67]
  wire  _GEN_436 = _T_24 ? _GEN_17 : _GEN_409; // @[Conditional.scala 39:67]
  wire [128:0] _GEN_442 = _T_24 ? {{1'd0}, DataReg} : _GEN_413; // @[Conditional.scala 39:67 SPI.scala 46:24]
  wire  _GEN_443 = _T_24 ? 1'h0 : _GEN_414; // @[Conditional.scala 39:67 SPI.scala 53:16]
  wire [128:0] _GEN_471 = _T_20 ? {{1'd0}, DataReg} : _GEN_442; // @[Conditional.scala 40:58 SPI.scala 46:24]
  assign io_ReadData_0 = DataReg[127:96]; // @[SPI.scala 55:28]
  assign io_ReadData_1 = DataReg[95:64]; // @[SPI.scala 56:28]
  assign io_ReadData_2 = DataReg[63:32]; // @[SPI.scala 57:28]
  assign io_ReadData_3 = DataReg[31:0]; // @[SPI.scala 58:28]
  assign io_DataValid = _T_20 ? 1'h0 : _GEN_443; // @[Conditional.scala 40:58 SPI.scala 53:16]
  assign io_WriteCompleted = WriteCompleted_reg; // @[SPI.scala 61:21]
  assign io_SPI_interface_CE = _T_20 ? _GEN_10 : _GEN_433; // @[Conditional.scala 40:58]
  assign io_SPI_interface_MOSI = _T_20 ? 1'h0 : _GEN_436; // @[Conditional.scala 40:58 SPI.scala 49:25]
  assign io_SPI_interface_S_CLK = ClkReg & ClockEn; // @[SPI.scala 115:37]
  always @(posedge clock) begin
    if (reset) begin // @[SPI.scala 46:24]
      DataReg <= 128'h0; // @[SPI.scala 46:24]
    end else begin
      DataReg <= _GEN_471[127:0];
    end
    if (reset) begin // @[SPI.scala 60:35]
      WriteCompleted_reg <= 1'h0; // @[SPI.scala 60:35]
    end else if (!(_T_20)) begin // @[Conditional.scala 40:58]
      if (!(_T_24)) begin // @[Conditional.scala 39:67]
        if (!(_T_33)) begin // @[Conditional.scala 39:67]
          WriteCompleted_reg <= _GEN_381;
        end
      end
    end
    if (reset) begin // @[SPI.scala 64:25]
      StateReg <= 3'h0; // @[SPI.scala 64:25]
    end else if (_T_20) begin // @[Conditional.scala 40:58]
      if (CntReg == 16'h3fff) begin // @[SPI.scala 155:42]
        StateReg <= 3'h1; // @[SPI.scala 158:18]
      end else begin
        StateReg <= 3'h0; // @[SPI.scala 153:16]
      end
    end else if (_T_24) begin // @[Conditional.scala 39:67]
      if (CntReg == 16'h7 & NextStateInv) begin // @[SPI.scala 174:44]
        StateReg <= 3'h2; // @[SPI.scala 178:18]
      end else begin
        StateReg <= 3'h1; // @[SPI.scala 166:16]
      end
    end else if (_T_33) begin // @[Conditional.scala 39:67]
      StateReg <= _GEN_20;
    end else begin
      StateReg <= _GEN_377;
    end
    if (reset) begin // @[SPI.scala 68:28]
      SubStateReg <= 3'h0; // @[SPI.scala 68:28]
    end else if (!(_T_20)) begin // @[Conditional.scala 40:58]
      if (!(_T_24)) begin // @[Conditional.scala 39:67]
        if (!(_T_33)) begin // @[Conditional.scala 39:67]
          SubStateReg <= _GEN_382;
        end
      end
    end
    if (reset) begin // @[SPI.scala 70:23]
      CntReg <= 16'h0; // @[SPI.scala 70:23]
    end else if (_T_20) begin // @[Conditional.scala 40:58]
      if (CntReg == 16'h3fff) begin // @[SPI.scala 155:42]
        CntReg <= 16'h0; // @[SPI.scala 159:16]
      end else begin
        CntReg <= _T_22; // @[SPI.scala 152:14]
      end
    end else if (_T_24) begin // @[Conditional.scala 39:67]
      if (CntReg == 16'h7 & NextStateInv) begin // @[SPI.scala 174:44]
        CntReg <= 16'h0; // @[SPI.scala 176:16]
      end else begin
        CntReg <= _GEN_14;
      end
    end else if (_T_33) begin // @[Conditional.scala 39:67]
      CntReg <= 16'h0; // @[SPI.scala 71:10]
    end else begin
      CntReg <= _GEN_378;
    end
    if (reset) begin // @[SPI.scala 79:28]
      TempAddress <= 24'h0; // @[SPI.scala 79:28]
    end else if (!(_T_20)) begin // @[Conditional.scala 40:58]
      if (!(_T_24)) begin // @[Conditional.scala 39:67]
        if (!(_T_33)) begin // @[Conditional.scala 39:67]
          TempAddress <= _GEN_387;
        end
      end
    end
    if (reset) begin // @[SPI.scala 81:23]
      PosReg <= 4'h0; // @[SPI.scala 81:23]
    end else if (!(_T_20)) begin // @[Conditional.scala 40:58]
      if (!(_T_24)) begin // @[Conditional.scala 39:67]
        if (!(_T_33)) begin // @[Conditional.scala 39:67]
          PosReg <= _GEN_386;
        end
      end
    end
    if (reset) begin // @[SPI.scala 90:23]
      ClkReg <= 1'h0; // @[SPI.scala 90:23]
    end else if (ClockReset) begin // @[SPI.scala 131:19]
      ClkReg <= 1'h0; // @[SPI.scala 132:12]
    end else if (ClkCounter == 8'h1) begin // @[SPI.scala 119:39]
      ClkReg <= ~ClkReg; // @[SPI.scala 120:12]
    end
    if (reset) begin // @[SPI.scala 91:27]
      ClkCounter <= 8'h0; // @[SPI.scala 91:27]
    end else if (ClockReset) begin // @[SPI.scala 131:19]
      ClkCounter <= 8'h0; // @[SPI.scala 133:16]
    end else if (ClkCounter == 8'h1) begin // @[SPI.scala 119:39]
      ClkCounter <= 8'h0; // @[SPI.scala 121:16]
    end else begin
      ClkCounter <= _T_6; // @[SPI.scala 117:14]
    end
    if (reset) begin // @[SPI.scala 93:28]
      ClkRegDelay <= 1'h0; // @[SPI.scala 93:28]
    end else begin
      ClkRegDelay <= ClkReg; // @[SPI.scala 94:15]
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
  _RAND_0 = {4{`RANDOM}};
  DataReg = _RAND_0[127:0];
  _RAND_1 = {1{`RANDOM}};
  WriteCompleted_reg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  StateReg = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  SubStateReg = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  CntReg = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  TempAddress = _RAND_5[23:0];
  _RAND_6 = {1{`RANDOM}};
  PosReg = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  ClkReg = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  ClkCounter = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  ClkRegDelay = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module OCPburst_SPI_memory(
  input         clock,
  input         reset,
  input  [2:0]  io_ocp_M_Cmd,
  input  [20:0] io_ocp_M_Addr,
  input  [31:0] io_ocp_M_Data,
  input         io_ocp_M_DataValid,
  input  [3:0]  io_ocp_M_DataByteEn,
  output [1:0]  io_ocp_S_Resp,
  output [31:0] io_ocp_S_Data,
  output        io_ocp_S_CmdAccept,
  output        io_ocp_S_DataAccept,
  output        io_pins_spiOut_CE,
  output        io_pins_spiOut_MOSI,
  output        io_pins_spiOut_S_CLK,
  input         io_pins_spiIn_MISO
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
`endif // RANDOMIZE_REG_INIT
  wire  SPI_clock; // @[OCPburst_SPI_memory.scala 41:19]
  wire  SPI_reset; // @[OCPburst_SPI_memory.scala 41:19]
  wire  SPI_io_ReadEnable; // @[OCPburst_SPI_memory.scala 41:19]
  wire  SPI_io_WriteEnable; // @[OCPburst_SPI_memory.scala 41:19]
  wire [23:0] SPI_io_Address; // @[OCPburst_SPI_memory.scala 41:19]
  wire [31:0] SPI_io_WriteData_0; // @[OCPburst_SPI_memory.scala 41:19]
  wire [31:0] SPI_io_WriteData_1; // @[OCPburst_SPI_memory.scala 41:19]
  wire [31:0] SPI_io_WriteData_2; // @[OCPburst_SPI_memory.scala 41:19]
  wire [31:0] SPI_io_WriteData_3; // @[OCPburst_SPI_memory.scala 41:19]
  wire [15:0] SPI_io_ByteEnable; // @[OCPburst_SPI_memory.scala 41:19]
  wire [31:0] SPI_io_ReadData_0; // @[OCPburst_SPI_memory.scala 41:19]
  wire [31:0] SPI_io_ReadData_1; // @[OCPburst_SPI_memory.scala 41:19]
  wire [31:0] SPI_io_ReadData_2; // @[OCPburst_SPI_memory.scala 41:19]
  wire [31:0] SPI_io_ReadData_3; // @[OCPburst_SPI_memory.scala 41:19]
  wire  SPI_io_DataValid; // @[OCPburst_SPI_memory.scala 41:19]
  wire  SPI_io_WriteCompleted; // @[OCPburst_SPI_memory.scala 41:19]
  wire  SPI_io_SPI_interface_CE; // @[OCPburst_SPI_memory.scala 41:19]
  wire  SPI_io_SPI_interface_MOSI; // @[OCPburst_SPI_memory.scala 41:19]
  wire  SPI_io_SPI_interface_MISO; // @[OCPburst_SPI_memory.scala 41:19]
  wire  SPI_io_SPI_interface_S_CLK; // @[OCPburst_SPI_memory.scala 41:19]
  reg [1:0] slave_resp; // @[OCPburst_SPI_memory.scala 59:27]
  reg [2:0] StateReg; // @[OCPburst_SPI_memory.scala 63:25]
  reg [7:0] CntReg; // @[OCPburst_SPI_memory.scala 66:23]
  reg [31:0] WriteData_0; // @[OCPburst_SPI_memory.scala 68:22]
  reg [31:0] WriteData_1; // @[OCPburst_SPI_memory.scala 68:22]
  reg [31:0] WriteData_2; // @[OCPburst_SPI_memory.scala 68:22]
  reg [31:0] WriteData_3; // @[OCPburst_SPI_memory.scala 68:22]
  reg [3:0] WriteByteEN_0; // @[OCPburst_SPI_memory.scala 69:24]
  reg [3:0] WriteByteEN_1; // @[OCPburst_SPI_memory.scala 69:24]
  reg [3:0] WriteByteEN_2; // @[OCPburst_SPI_memory.scala 69:24]
  reg [3:0] WriteByteEN_3; // @[OCPburst_SPI_memory.scala 69:24]
  reg [23:0] address; // @[OCPburst_SPI_memory.scala 72:24]
  wire  _T = 3'h0 == StateReg; // @[Conditional.scala 37:30]
  wire  _T_1 = 3'h1 == io_ocp_M_Cmd; // @[Conditional.scala 37:30]
  wire  _T_2 = 3'h2 == io_ocp_M_Cmd; // @[Conditional.scala 37:30]
  wire [20:0] _GEN_2 = _T_2 ? io_ocp_M_Addr : 21'h0; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 87:19 OCPburst_SPI_memory.scala 73:11]
  wire [20:0] _GEN_5 = _T_1 ? io_ocp_M_Addr : _GEN_2; // @[Conditional.scala 40:58 OCPburst_SPI_memory.scala 82:19]
  wire  _T_3 = 3'h1 == StateReg; // @[Conditional.scala 37:30]
  wire  _T_4 = 3'h3 == StateReg; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_8 = SPI_io_ReadData_0; // @[OCPburst_SPI_memory.scala 103:21 OCPburst_SPI_memory.scala 103:21]
  wire [31:0] _GEN_9 = 2'h1 == CntReg[1:0] ? SPI_io_ReadData_1 : _GEN_8; // @[OCPburst_SPI_memory.scala 103:21 OCPburst_SPI_memory.scala 103:21]
  wire [31:0] _GEN_10 = 2'h2 == CntReg[1:0] ? SPI_io_ReadData_2 : _GEN_9; // @[OCPburst_SPI_memory.scala 103:21 OCPburst_SPI_memory.scala 103:21]
  wire [31:0] _GEN_11 = 2'h3 == CntReg[1:0] ? SPI_io_ReadData_3 : _GEN_10; // @[OCPburst_SPI_memory.scala 103:21 OCPburst_SPI_memory.scala 103:21]
  wire [7:0] _T_7 = CntReg + 8'h1; // @[OCPburst_SPI_memory.scala 104:24]
  wire  _T_8 = CntReg == 8'h3; // @[OCPburst_SPI_memory.scala 108:19]
  wire [7:0] _GEN_12 = CntReg == 8'h3 ? 8'h0 : _T_7; // @[OCPburst_SPI_memory.scala 108:28 OCPburst_SPI_memory.scala 109:16 OCPburst_SPI_memory.scala 104:14]
  wire [2:0] _GEN_13 = CntReg == 8'h3 ? 3'h0 : StateReg; // @[OCPburst_SPI_memory.scala 108:28 OCPburst_SPI_memory.scala 110:18 OCPburst_SPI_memory.scala 63:25]
  wire  _T_9 = 3'h2 == StateReg; // @[Conditional.scala 37:30]
  wire  _T_10 = CntReg == 8'h1; // @[OCPburst_SPI_memory.scala 115:19]
  wire [31:0] _GEN_15 = 2'h0 == CntReg[1:0] ? io_ocp_M_Data : WriteData_0; // @[OCPburst_SPI_memory.scala 123:27 OCPburst_SPI_memory.scala 123:27 OCPburst_SPI_memory.scala 68:22]
  wire [31:0] _GEN_16 = 2'h1 == CntReg[1:0] ? io_ocp_M_Data : WriteData_1; // @[OCPburst_SPI_memory.scala 123:27 OCPburst_SPI_memory.scala 123:27 OCPburst_SPI_memory.scala 68:22]
  wire [31:0] _GEN_17 = 2'h2 == CntReg[1:0] ? io_ocp_M_Data : WriteData_2; // @[OCPburst_SPI_memory.scala 123:27 OCPburst_SPI_memory.scala 123:27 OCPburst_SPI_memory.scala 68:22]
  wire [31:0] _GEN_18 = 2'h3 == CntReg[1:0] ? io_ocp_M_Data : WriteData_3; // @[OCPburst_SPI_memory.scala 123:27 OCPburst_SPI_memory.scala 123:27 OCPburst_SPI_memory.scala 68:22]
  wire [3:0] _GEN_19 = 2'h0 == CntReg[1:0] ? io_ocp_M_DataByteEn : WriteByteEN_0; // @[OCPburst_SPI_memory.scala 124:29 OCPburst_SPI_memory.scala 124:29 OCPburst_SPI_memory.scala 69:24]
  wire [3:0] _GEN_20 = 2'h1 == CntReg[1:0] ? io_ocp_M_DataByteEn : WriteByteEN_1; // @[OCPburst_SPI_memory.scala 124:29 OCPburst_SPI_memory.scala 124:29 OCPburst_SPI_memory.scala 69:24]
  wire [3:0] _GEN_21 = 2'h2 == CntReg[1:0] ? io_ocp_M_DataByteEn : WriteByteEN_2; // @[OCPburst_SPI_memory.scala 124:29 OCPburst_SPI_memory.scala 124:29 OCPburst_SPI_memory.scala 69:24]
  wire [3:0] _GEN_22 = 2'h3 == CntReg[1:0] ? io_ocp_M_DataByteEn : WriteByteEN_3; // @[OCPburst_SPI_memory.scala 124:29 OCPburst_SPI_memory.scala 124:29 OCPburst_SPI_memory.scala 69:24]
  wire [31:0] _GEN_23 = io_ocp_M_DataValid ? _GEN_15 : WriteData_0; // @[OCPburst_SPI_memory.scala 122:41 OCPburst_SPI_memory.scala 68:22]
  wire [31:0] _GEN_24 = io_ocp_M_DataValid ? _GEN_16 : WriteData_1; // @[OCPburst_SPI_memory.scala 122:41 OCPburst_SPI_memory.scala 68:22]
  wire [31:0] _GEN_25 = io_ocp_M_DataValid ? _GEN_17 : WriteData_2; // @[OCPburst_SPI_memory.scala 122:41 OCPburst_SPI_memory.scala 68:22]
  wire [31:0] _GEN_26 = io_ocp_M_DataValid ? _GEN_18 : WriteData_3; // @[OCPburst_SPI_memory.scala 122:41 OCPburst_SPI_memory.scala 68:22]
  wire [3:0] _GEN_27 = io_ocp_M_DataValid ? _GEN_19 : WriteByteEN_0; // @[OCPburst_SPI_memory.scala 122:41 OCPburst_SPI_memory.scala 69:24]
  wire [3:0] _GEN_28 = io_ocp_M_DataValid ? _GEN_20 : WriteByteEN_1; // @[OCPburst_SPI_memory.scala 122:41 OCPburst_SPI_memory.scala 69:24]
  wire [3:0] _GEN_29 = io_ocp_M_DataValid ? _GEN_21 : WriteByteEN_2; // @[OCPburst_SPI_memory.scala 122:41 OCPburst_SPI_memory.scala 69:24]
  wire [3:0] _GEN_30 = io_ocp_M_DataValid ? _GEN_22 : WriteByteEN_3; // @[OCPburst_SPI_memory.scala 122:41 OCPburst_SPI_memory.scala 69:24]
  wire [7:0] _GEN_31 = io_ocp_M_DataValid ? _T_7 : CntReg; // @[OCPburst_SPI_memory.scala 122:41 OCPburst_SPI_memory.scala 125:16 OCPburst_SPI_memory.scala 66:23]
  wire [7:0] _GEN_32 = _T_8 ? 8'h0 : _GEN_31; // @[OCPburst_SPI_memory.scala 128:28 OCPburst_SPI_memory.scala 129:16]
  wire [2:0] _GEN_33 = _T_8 ? 3'h4 : StateReg; // @[OCPburst_SPI_memory.scala 128:28 OCPburst_SPI_memory.scala 130:18 OCPburst_SPI_memory.scala 63:25]
  wire  _T_17 = 3'h4 == StateReg; // @[Conditional.scala 37:30]
  wire [15:0] _T_18 = {WriteByteEN_3, 12'h0}; // @[OCPburst_SPI_memory.scala 140:44]
  wire [11:0] _T_19 = {WriteByteEN_2, 8'h0}; // @[OCPburst_SPI_memory.scala 140:76]
  wire [15:0] _GEN_138 = {{4'd0}, _T_19}; // @[OCPburst_SPI_memory.scala 140:58]
  wire [15:0] _T_21 = _T_18 + _GEN_138; // @[OCPburst_SPI_memory.scala 140:58]
  wire [7:0] _T_22 = {WriteByteEN_1, 4'h0}; // @[OCPburst_SPI_memory.scala 140:107]
  wire [15:0] _GEN_139 = {{8'd0}, _T_22}; // @[OCPburst_SPI_memory.scala 140:89]
  wire [15:0] _T_24 = _T_21 + _GEN_139; // @[OCPburst_SPI_memory.scala 140:89]
  wire [15:0] _GEN_140 = {{12'd0}, WriteByteEN_0}; // @[OCPburst_SPI_memory.scala 140:120]
  wire [15:0] _T_26 = _T_24 + _GEN_140; // @[OCPburst_SPI_memory.scala 140:120]
  wire [1:0] _GEN_34 = SPI_io_WriteCompleted ? 2'h1 : slave_resp; // @[OCPburst_SPI_memory.scala 142:35 OCPburst_SPI_memory.scala 143:20 OCPburst_SPI_memory.scala 59:27]
  wire [2:0] _GEN_35 = SPI_io_WriteCompleted ? 3'h0 : 3'h4; // @[OCPburst_SPI_memory.scala 142:35 OCPburst_SPI_memory.scala 144:18 OCPburst_SPI_memory.scala 137:16]
  wire [23:0] _GEN_36 = _T_17 ? address : 24'h0; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 134:15 OCPburst_SPI_memory.scala 73:11]
  wire [2:0] _GEN_38 = _T_17 ? _GEN_35 : StateReg; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 63:25]
  wire [31:0] _GEN_39 = _T_17 ? WriteData_0 : 32'h0; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 139:24 OCPburst_SPI_memory.scala 43:25]
  wire [31:0] _GEN_40 = _T_17 ? WriteData_1 : 32'h0; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 139:24 OCPburst_SPI_memory.scala 43:25]
  wire [31:0] _GEN_41 = _T_17 ? WriteData_2 : 32'h0; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 139:24 OCPburst_SPI_memory.scala 43:25]
  wire [31:0] _GEN_42 = _T_17 ? WriteData_3 : 32'h0; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 139:24 OCPburst_SPI_memory.scala 43:25]
  wire [15:0] _GEN_43 = _T_17 ? _T_26 : 16'h0; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 140:25 OCPburst_SPI_memory.scala 49:21]
  wire [1:0] _GEN_44 = _T_17 ? _GEN_34 : slave_resp; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 59:27]
  wire [23:0] _GEN_45 = _T_9 ? address : _GEN_36; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 114:15]
  wire [7:0] _GEN_56 = _T_9 ? _GEN_32 : CntReg; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 66:23]
  wire [2:0] _GEN_57 = _T_9 ? _GEN_33 : _GEN_38; // @[Conditional.scala 39:67]
  wire [23:0] _GEN_58 = _T_9 ? 24'h0 : _GEN_36; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 46:18]
  wire  _GEN_59 = _T_9 ? 1'h0 : _T_17; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 48:22]
  wire [31:0] _GEN_60 = _T_9 ? 32'h0 : _GEN_39; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 43:25]
  wire [31:0] _GEN_61 = _T_9 ? 32'h0 : _GEN_40; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 43:25]
  wire [31:0] _GEN_62 = _T_9 ? 32'h0 : _GEN_41; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 43:25]
  wire [31:0] _GEN_63 = _T_9 ? 32'h0 : _GEN_42; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 43:25]
  wire [15:0] _GEN_64 = _T_9 ? 16'h0 : _GEN_43; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 49:21]
  wire [1:0] _GEN_65 = _T_9 ? slave_resp : _GEN_44; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 59:27]
  wire [31:0] _GEN_66 = _T_4 ? _GEN_11 : 32'h0; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 103:21 OCPburst_SPI_memory.scala 38:17]
  wire [1:0] _GEN_69 = _T_4 ? 2'h1 : slave_resp; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 106:21 OCPburst_SPI_memory.scala 60:17]
  wire  _GEN_72 = _T_4 ? 1'h0 : _T_9 & _T_10; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 36:22]
  wire  _GEN_73 = _T_4 ? 1'h0 : _T_9; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 37:23]
  wire [23:0] _GEN_82 = _T_4 ? 24'h0 : _GEN_58; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 46:18]
  wire  _GEN_83 = _T_4 ? 1'h0 : _GEN_59; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 48:22]
  wire [31:0] _GEN_84 = _T_4 ? 32'h0 : _GEN_60; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 43:25]
  wire [31:0] _GEN_85 = _T_4 ? 32'h0 : _GEN_61; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 43:25]
  wire [31:0] _GEN_86 = _T_4 ? 32'h0 : _GEN_62; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 43:25]
  wire [31:0] _GEN_87 = _T_4 ? 32'h0 : _GEN_63; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 43:25]
  wire [15:0] _GEN_88 = _T_4 ? 16'h0 : _GEN_64; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 49:21]
  wire [23:0] _GEN_91 = _T_3 ? address : _GEN_82; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 93:22]
  wire  _GEN_93 = _T_3 | _GEN_72; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 95:26]
  wire [31:0] _GEN_96 = _T_3 ? 32'h0 : _GEN_66; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 38:17]
  wire [1:0] _GEN_97 = _T_3 ? slave_resp : _GEN_69; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 60:17]
  wire  _GEN_98 = _T_3 ? 1'h0 : _GEN_73; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 37:23]
  wire  _GEN_107 = _T_3 ? 1'h0 : _GEN_83; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 48:22]
  wire [31:0] _GEN_108 = _T_3 ? 32'h0 : _GEN_84; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 43:25]
  wire [31:0] _GEN_109 = _T_3 ? 32'h0 : _GEN_85; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 43:25]
  wire [31:0] _GEN_110 = _T_3 ? 32'h0 : _GEN_86; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 43:25]
  wire [31:0] _GEN_111 = _T_3 ? 32'h0 : _GEN_87; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 43:25]
  wire [15:0] _GEN_112 = _T_3 ? 16'h0 : _GEN_88; // @[Conditional.scala 39:67 OCPburst_SPI_memory.scala 49:21]
  SPI SPI ( // @[OCPburst_SPI_memory.scala 41:19]
    .clock(SPI_clock),
    .reset(SPI_reset),
    .io_ReadEnable(SPI_io_ReadEnable),
    .io_WriteEnable(SPI_io_WriteEnable),
    .io_Address(SPI_io_Address),
    .io_WriteData_0(SPI_io_WriteData_0),
    .io_WriteData_1(SPI_io_WriteData_1),
    .io_WriteData_2(SPI_io_WriteData_2),
    .io_WriteData_3(SPI_io_WriteData_3),
    .io_ByteEnable(SPI_io_ByteEnable),
    .io_ReadData_0(SPI_io_ReadData_0),
    .io_ReadData_1(SPI_io_ReadData_1),
    .io_ReadData_2(SPI_io_ReadData_2),
    .io_ReadData_3(SPI_io_ReadData_3),
    .io_DataValid(SPI_io_DataValid),
    .io_WriteCompleted(SPI_io_WriteCompleted),
    .io_SPI_interface_CE(SPI_io_SPI_interface_CE),
    .io_SPI_interface_MOSI(SPI_io_SPI_interface_MOSI),
    .io_SPI_interface_MISO(SPI_io_SPI_interface_MISO),
    .io_SPI_interface_S_CLK(SPI_io_SPI_interface_S_CLK)
  );
  assign io_ocp_S_Resp = _T ? slave_resp : _GEN_97; // @[Conditional.scala 40:58 OCPburst_SPI_memory.scala 60:17]
  assign io_ocp_S_Data = _T ? 32'h0 : _GEN_96; // @[Conditional.scala 40:58 OCPburst_SPI_memory.scala 38:17]
  assign io_ocp_S_CmdAccept = _T ? 1'h0 : _GEN_93; // @[Conditional.scala 40:58 OCPburst_SPI_memory.scala 36:22]
  assign io_ocp_S_DataAccept = _T ? 1'h0 : _GEN_98; // @[Conditional.scala 40:58 OCPburst_SPI_memory.scala 37:23]
  assign io_pins_spiOut_CE = SPI_io_SPI_interface_CE; // @[OCPburst_SPI_memory.scala 55:21]
  assign io_pins_spiOut_MOSI = SPI_io_SPI_interface_MOSI; // @[OCPburst_SPI_memory.scala 54:23]
  assign io_pins_spiOut_S_CLK = SPI_io_SPI_interface_S_CLK; // @[OCPburst_SPI_memory.scala 57:24]
  assign SPI_clock = clock;
  assign SPI_reset = reset;
  assign SPI_io_ReadEnable = _T ? 1'h0 : _T_3; // @[Conditional.scala 40:58 OCPburst_SPI_memory.scala 47:21]
  assign SPI_io_WriteEnable = _T ? 1'h0 : _GEN_107; // @[Conditional.scala 40:58 OCPburst_SPI_memory.scala 48:22]
  assign SPI_io_Address = _T ? 24'h0 : _GEN_91; // @[Conditional.scala 40:58 OCPburst_SPI_memory.scala 46:18]
  assign SPI_io_WriteData_0 = _T ? 32'h0 : _GEN_108; // @[Conditional.scala 40:58 OCPburst_SPI_memory.scala 43:25]
  assign SPI_io_WriteData_1 = _T ? 32'h0 : _GEN_109; // @[Conditional.scala 40:58 OCPburst_SPI_memory.scala 43:25]
  assign SPI_io_WriteData_2 = _T ? 32'h0 : _GEN_110; // @[Conditional.scala 40:58 OCPburst_SPI_memory.scala 43:25]
  assign SPI_io_WriteData_3 = _T ? 32'h0 : _GEN_111; // @[Conditional.scala 40:58 OCPburst_SPI_memory.scala 43:25]
  assign SPI_io_ByteEnable = _T ? 16'h0 : _GEN_112; // @[Conditional.scala 40:58 OCPburst_SPI_memory.scala 49:21]
  assign SPI_io_SPI_interface_MISO = io_pins_spiIn_MISO; // @[OCPburst_SPI_memory.scala 56:29]
  always @(posedge clock) begin
    if (reset) begin // @[OCPburst_SPI_memory.scala 59:27]
      slave_resp <= 2'h0; // @[OCPburst_SPI_memory.scala 59:27]
    end else if (_T) begin // @[Conditional.scala 40:58]
      slave_resp <= 2'h0; // @[OCPburst_SPI_memory.scala 77:18]
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (!(_T_4)) begin // @[Conditional.scala 39:67]
        slave_resp <= _GEN_65;
      end
    end
    if (reset) begin // @[OCPburst_SPI_memory.scala 63:25]
      StateReg <= 3'h0; // @[OCPburst_SPI_memory.scala 63:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_1) begin // @[Conditional.scala 40:58]
        StateReg <= 3'h2; // @[OCPburst_SPI_memory.scala 81:20]
      end else if (_T_2) begin // @[Conditional.scala 39:67]
        StateReg <= 3'h1; // @[OCPburst_SPI_memory.scala 86:20]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (SPI_io_DataValid) begin // @[OCPburst_SPI_memory.scala 97:29]
        StateReg <= 3'h3; // @[OCPburst_SPI_memory.scala 99:18]
      end
    end else if (_T_4) begin // @[Conditional.scala 39:67]
      StateReg <= _GEN_13;
    end else begin
      StateReg <= _GEN_57;
    end
    if (reset) begin // @[OCPburst_SPI_memory.scala 66:23]
      CntReg <= 8'h0; // @[OCPburst_SPI_memory.scala 66:23]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_1) begin // @[Conditional.scala 40:58]
        CntReg <= 8'h0; // @[OCPburst_SPI_memory.scala 80:18]
      end else if (_T_2) begin // @[Conditional.scala 39:67]
        CntReg <= 8'h0; // @[OCPburst_SPI_memory.scala 85:18]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (SPI_io_DataValid) begin // @[OCPburst_SPI_memory.scala 97:29]
        CntReg <= 8'h0; // @[OCPburst_SPI_memory.scala 98:16]
      end
    end else if (_T_4) begin // @[Conditional.scala 39:67]
      CntReg <= _GEN_12;
    end else begin
      CntReg <= _GEN_56;
    end
    if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        if (!(_T_4)) begin // @[Conditional.scala 39:67]
          if (_T_9) begin // @[Conditional.scala 39:67]
            WriteData_0 <= _GEN_23;
          end
        end
      end
    end
    if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        if (!(_T_4)) begin // @[Conditional.scala 39:67]
          if (_T_9) begin // @[Conditional.scala 39:67]
            WriteData_1 <= _GEN_24;
          end
        end
      end
    end
    if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        if (!(_T_4)) begin // @[Conditional.scala 39:67]
          if (_T_9) begin // @[Conditional.scala 39:67]
            WriteData_2 <= _GEN_25;
          end
        end
      end
    end
    if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        if (!(_T_4)) begin // @[Conditional.scala 39:67]
          if (_T_9) begin // @[Conditional.scala 39:67]
            WriteData_3 <= _GEN_26;
          end
        end
      end
    end
    if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        if (!(_T_4)) begin // @[Conditional.scala 39:67]
          if (_T_9) begin // @[Conditional.scala 39:67]
            WriteByteEN_0 <= _GEN_27;
          end
        end
      end
    end
    if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        if (!(_T_4)) begin // @[Conditional.scala 39:67]
          if (_T_9) begin // @[Conditional.scala 39:67]
            WriteByteEN_1 <= _GEN_28;
          end
        end
      end
    end
    if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        if (!(_T_4)) begin // @[Conditional.scala 39:67]
          if (_T_9) begin // @[Conditional.scala 39:67]
            WriteByteEN_2 <= _GEN_29;
          end
        end
      end
    end
    if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        if (!(_T_4)) begin // @[Conditional.scala 39:67]
          if (_T_9) begin // @[Conditional.scala 39:67]
            WriteByteEN_3 <= _GEN_30;
          end
        end
      end
    end
    if (reset) begin // @[OCPburst_SPI_memory.scala 72:24]
      address <= 24'h0; // @[OCPburst_SPI_memory.scala 72:24]
    end else if (_T) begin // @[Conditional.scala 40:58]
      address <= {{3'd0}, _GEN_5};
    end else if (!(_T_3)) begin // @[Conditional.scala 39:67]
      if (_T_4) begin // @[Conditional.scala 39:67]
        address <= 24'h0; // @[OCPburst_SPI_memory.scala 73:11]
      end else begin
        address <= _GEN_45;
      end
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
  slave_resp = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  StateReg = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  CntReg = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  WriteData_0 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  WriteData_1 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  WriteData_2 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  WriteData_3 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  WriteByteEN_0 = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  WriteByteEN_1 = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  WriteByteEN_2 = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  WriteByteEN_3 = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  address = _RAND_11[23:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Patmos(
  input         clock,
  input         reset,
  output [7:0]  io_Gpio_oe_gpios_0,
  output        io_UartCmp_tx,
  output        io_Leds_led,
  input         io_OCPburst_SPI_memory_spiIn_MISO,
  input         io_boot_pc_stall,
  input  [29:0] io_boot_pc_bootAddr,
  input         io_boot_bootMemWr_enaEven,
  input  [8:0]  io_boot_bootMemWr_addrEven,
  input  [31:0] io_boot_bootMemWr_dataEven,
  input         io_boot_bootMemWr_enaOdd,
  input  [8:0]  io_boot_bootMemWr_addrOdd,
  input  [31:0] io_boot_bootMemWr_dataOdd,
  output [7:0]  io_Gpio_out_gpios_0,
  input         io_UartCmp_rx,
  input  [7:0]  io_Gpio_in_gpios_0,
  output        io_OCPburst_SPI_memory_spiOut_CE,
  output        io_OCPburst_SPI_memory_spiOut_MOSI,
  output        io_OCPburst_SPI_memory_spiOut_S_CLK
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
`endif // RANDOMIZE_REG_INIT
  wire  cores_0_clock; // @[Patmos.scala 229:48]
  wire  cores_0_reset; // @[Patmos.scala 229:48]
  wire  cores_0_io_interrupts_0; // @[Patmos.scala 229:48]
  wire  cores_0_io_interrupts_1; // @[Patmos.scala 229:48]
  wire [2:0] cores_0_io_memPort_M_Cmd; // @[Patmos.scala 229:48]
  wire [20:0] cores_0_io_memPort_M_Addr; // @[Patmos.scala 229:48]
  wire [31:0] cores_0_io_memPort_M_Data; // @[Patmos.scala 229:48]
  wire  cores_0_io_memPort_M_DataValid; // @[Patmos.scala 229:48]
  wire [3:0] cores_0_io_memPort_M_DataByteEn; // @[Patmos.scala 229:48]
  wire [1:0] cores_0_io_memPort_S_Resp; // @[Patmos.scala 229:48]
  wire [31:0] cores_0_io_memPort_S_Data; // @[Patmos.scala 229:48]
  wire  cores_0_io_memPort_S_CmdAccept; // @[Patmos.scala 229:48]
  wire  cores_0_io_memPort_S_DataAccept; // @[Patmos.scala 229:48]
  wire [2:0] cores_0_io_memInOut_M_Cmd; // @[Patmos.scala 229:48]
  wire [31:0] cores_0_io_memInOut_M_Addr; // @[Patmos.scala 229:48]
  wire [31:0] cores_0_io_memInOut_M_Data; // @[Patmos.scala 229:48]
  wire [3:0] cores_0_io_memInOut_M_ByteEn; // @[Patmos.scala 229:48]
  wire [1:0] cores_0_io_memInOut_S_Resp; // @[Patmos.scala 229:48]
  wire [31:0] cores_0_io_memInOut_S_Data; // @[Patmos.scala 229:48]
  wire [2:0] cores_0_io_excInOut_M_Cmd; // @[Patmos.scala 229:48]
  wire [31:0] cores_0_io_excInOut_M_Addr; // @[Patmos.scala 229:48]
  wire [31:0] cores_0_io_excInOut_M_Data; // @[Patmos.scala 229:48]
  wire [1:0] cores_0_io_excInOut_S_Resp; // @[Patmos.scala 229:48]
  wire [31:0] cores_0_io_excInOut_S_Data; // @[Patmos.scala 229:48]
  wire  cores_0_io_boot_pc_stall; // @[Patmos.scala 229:48]
  wire [29:0] cores_0_io_boot_pc_bootAddr; // @[Patmos.scala 229:48]
  wire  cores_0_io_boot_bootMemWr_enaEven; // @[Patmos.scala 229:48]
  wire [8:0] cores_0_io_boot_bootMemWr_addrEven; // @[Patmos.scala 229:48]
  wire [31:0] cores_0_io_boot_bootMemWr_dataEven; // @[Patmos.scala 229:48]
  wire  cores_0_io_boot_bootMemWr_enaOdd; // @[Patmos.scala 229:48]
  wire [8:0] cores_0_io_boot_bootMemWr_addrOdd; // @[Patmos.scala 229:48]
  wire [31:0] cores_0_io_boot_bootMemWr_dataOdd; // @[Patmos.scala 229:48]
  wire  HardlockOCPWrapper_clock; // @[Patmos.scala 264:63]
  wire  HardlockOCPWrapper_reset; // @[Patmos.scala 264:63]
  wire [2:0] HardlockOCPWrapper_io_cores_0_M_Cmd; // @[Patmos.scala 264:63]
  wire [1:0] HardlockOCPWrapper_io_cores_0_S_Resp; // @[Patmos.scala 264:63]
  wire  UartCmp_clock; // @[Patmos.scala 273:62]
  wire  UartCmp_reset; // @[Patmos.scala 273:62]
  wire [2:0] UartCmp_io_cores_0_M_Cmd; // @[Patmos.scala 273:62]
  wire [31:0] UartCmp_io_cores_0_M_Addr; // @[Patmos.scala 273:62]
  wire [31:0] UartCmp_io_cores_0_M_Data; // @[Patmos.scala 273:62]
  wire [1:0] UartCmp_io_cores_0_S_Resp; // @[Patmos.scala 273:62]
  wire [31:0] UartCmp_io_cores_0_S_Data; // @[Patmos.scala 273:62]
  wire  UartCmp_io_pins_tx; // @[Patmos.scala 273:62]
  wire  UartCmp_io_pins_rx; // @[Patmos.scala 273:62]
  wire  CpuInfo_clock; // @[Patmos.scala 301:25]
  wire [2:0] CpuInfo_io_ocp_M_Cmd; // @[Patmos.scala 301:25]
  wire [31:0] CpuInfo_io_ocp_M_Addr; // @[Patmos.scala 301:25]
  wire [1:0] CpuInfo_io_ocp_S_Resp; // @[Patmos.scala 301:25]
  wire [31:0] CpuInfo_io_ocp_S_Data; // @[Patmos.scala 301:25]
  wire  Timer_clock; // @[Timer.scala 22:11]
  wire  Timer_reset; // @[Timer.scala 22:11]
  wire [2:0] Timer_io_ocp_M_Cmd; // @[Timer.scala 22:11]
  wire [31:0] Timer_io_ocp_M_Addr; // @[Timer.scala 22:11]
  wire [31:0] Timer_io_ocp_M_Data; // @[Timer.scala 22:11]
  wire [1:0] Timer_io_ocp_S_Resp; // @[Timer.scala 22:11]
  wire [31:0] Timer_io_ocp_S_Data; // @[Timer.scala 22:11]
  wire  Timer_io_interrupts_0; // @[Timer.scala 22:11]
  wire  Timer_io_interrupts_1; // @[Timer.scala 22:11]
  wire  Deadline_clock; // @[Deadline.scala 53:61]
  wire  Deadline_reset; // @[Deadline.scala 53:61]
  wire [2:0] Deadline_io_ocp_M_Cmd; // @[Deadline.scala 53:61]
  wire [31:0] Deadline_io_ocp_M_Data; // @[Deadline.scala 53:61]
  wire [1:0] Deadline_io_ocp_S_Resp; // @[Deadline.scala 53:61]
  wire [31:0] Deadline_io_ocp_S_Data; // @[Deadline.scala 53:61]
  wire  Leds_clock; // @[Leds.scala 22:11]
  wire  Leds_reset; // @[Leds.scala 22:11]
  wire [2:0] Leds_io_ocp_M_Cmd; // @[Leds.scala 22:11]
  wire [31:0] Leds_io_ocp_M_Data; // @[Leds.scala 22:11]
  wire [1:0] Leds_io_ocp_S_Resp; // @[Leds.scala 22:11]
  wire [31:0] Leds_io_ocp_S_Data; // @[Leds.scala 22:11]
  wire  Leds_io_pins_led; // @[Leds.scala 22:11]
  wire  Gpio_clock; // @[Gpio.scala 41:11]
  wire  Gpio_reset; // @[Gpio.scala 41:11]
  wire [2:0] Gpio_io_ocp_M_Cmd; // @[Gpio.scala 41:11]
  wire [31:0] Gpio_io_ocp_M_Addr; // @[Gpio.scala 41:11]
  wire [1:0] Gpio_io_ocp_S_Resp; // @[Gpio.scala 41:11]
  wire [31:0] Gpio_io_ocp_S_Data; // @[Gpio.scala 41:11]
  wire [7:0] Gpio_io_pins_gpios_0; // @[Gpio.scala 41:11]
  wire  Gpio_1_clock; // @[Gpio.scala 41:11]
  wire  Gpio_1_reset; // @[Gpio.scala 41:11]
  wire [2:0] Gpio_1_io_ocp_M_Cmd; // @[Gpio.scala 41:11]
  wire [31:0] Gpio_1_io_ocp_M_Addr; // @[Gpio.scala 41:11]
  wire [31:0] Gpio_1_io_ocp_M_Data; // @[Gpio.scala 41:11]
  wire [1:0] Gpio_1_io_ocp_S_Resp; // @[Gpio.scala 41:11]
  wire [31:0] Gpio_1_io_ocp_S_Data; // @[Gpio.scala 41:11]
  wire [7:0] Gpio_1_io_pins_gpios_0; // @[Gpio.scala 41:11]
  wire  Gpio_2_clock; // @[Gpio.scala 41:11]
  wire  Gpio_2_reset; // @[Gpio.scala 41:11]
  wire [2:0] Gpio_2_io_ocp_M_Cmd; // @[Gpio.scala 41:11]
  wire [31:0] Gpio_2_io_ocp_M_Addr; // @[Gpio.scala 41:11]
  wire [31:0] Gpio_2_io_ocp_M_Data; // @[Gpio.scala 41:11]
  wire [1:0] Gpio_2_io_ocp_S_Resp; // @[Gpio.scala 41:11]
  wire [31:0] Gpio_2_io_ocp_S_Data; // @[Gpio.scala 41:11]
  wire [7:0] Gpio_2_io_pins_gpios_0; // @[Gpio.scala 41:11]
  wire  Spm_clock; // @[Patmos.scala 355:21]
  wire [2:0] Spm_io_M_Cmd; // @[Patmos.scala 355:21]
  wire [9:0] Spm_io_M_Addr; // @[Patmos.scala 355:21]
  wire [31:0] Spm_io_M_Data; // @[Patmos.scala 355:21]
  wire [3:0] Spm_io_M_ByteEn; // @[Patmos.scala 355:21]
  wire [1:0] Spm_io_S_Resp; // @[Patmos.scala 355:21]
  wire [31:0] Spm_io_S_Data; // @[Patmos.scala 355:21]
  wire  ramCtrl_clock; // @[OCPburst_SPI_memory.scala 14:11]
  wire  ramCtrl_reset; // @[OCPburst_SPI_memory.scala 14:11]
  wire [2:0] ramCtrl_io_ocp_M_Cmd; // @[OCPburst_SPI_memory.scala 14:11]
  wire [20:0] ramCtrl_io_ocp_M_Addr; // @[OCPburst_SPI_memory.scala 14:11]
  wire [31:0] ramCtrl_io_ocp_M_Data; // @[OCPburst_SPI_memory.scala 14:11]
  wire  ramCtrl_io_ocp_M_DataValid; // @[OCPburst_SPI_memory.scala 14:11]
  wire [3:0] ramCtrl_io_ocp_M_DataByteEn; // @[OCPburst_SPI_memory.scala 14:11]
  wire [1:0] ramCtrl_io_ocp_S_Resp; // @[OCPburst_SPI_memory.scala 14:11]
  wire [31:0] ramCtrl_io_ocp_S_Data; // @[OCPburst_SPI_memory.scala 14:11]
  wire  ramCtrl_io_ocp_S_CmdAccept; // @[OCPburst_SPI_memory.scala 14:11]
  wire  ramCtrl_io_ocp_S_DataAccept; // @[OCPburst_SPI_memory.scala 14:11]
  wire  ramCtrl_io_pins_spiOut_CE; // @[OCPburst_SPI_memory.scala 14:11]
  wire  ramCtrl_io_pins_spiOut_MOSI; // @[OCPburst_SPI_memory.scala 14:11]
  wire  ramCtrl_io_pins_spiOut_S_CLK; // @[OCPburst_SPI_memory.scala 14:11]
  wire  ramCtrl_io_pins_spiIn_MISO; // @[OCPburst_SPI_memory.scala 14:11]
  wire  _T_49 = cores_0_io_memInOut_M_Addr[31:16] == 16'h1; // @[Patmos.scala 405:85]
  wire [2:0] _GEN_44 = _T_49 ? cores_0_io_memInOut_M_Cmd : 3'h0; // @[Patmos.scala 410:17 Patmos.scala 411:19 Patmos.scala 409:17]
  reg [1:0] REG; // @[Patmos.scala 360:29]
  wire  _T_3 = cores_0_io_memInOut_M_Addr[31:16] == 16'hf002; // @[Patmos.scala 405:85]
  reg  REG_1; // @[Patmos.scala 414:27]
  wire  _T_5 = cores_0_io_memInOut_M_Cmd != 3'h0; // @[Patmos.scala 415:39]
  wire [31:0] _GEN_3 = REG_1 ? Timer_io_ocp_S_Data : 32'h0; // @[Patmos.scala 418:20 Patmos.scala 419:37 Patmos.scala 399:33]
  wire  _T_7 = cores_0_io_memInOut_M_Addr[31:16] == 16'hf003; // @[Patmos.scala 405:85]
  reg  REG_2; // @[Patmos.scala 414:27]
  wire [31:0] _GEN_7 = REG_2 ? Deadline_io_ocp_S_Data : _GEN_3; // @[Patmos.scala 418:20 Patmos.scala 419:37]
  wire  _T_11 = cores_0_io_memInOut_M_Addr[31:16] == 16'hf009; // @[Patmos.scala 405:85]
  reg  REG_3; // @[Patmos.scala 414:27]
  wire [31:0] _GEN_11 = REG_3 ? Leds_io_ocp_S_Data : _GEN_7; // @[Patmos.scala 418:20 Patmos.scala 419:37]
  wire  _T_15 = cores_0_io_memInOut_M_Addr[31:16] == 16'hf00a; // @[Patmos.scala 405:85]
  reg  REG_4; // @[Patmos.scala 414:27]
  wire [31:0] _GEN_15 = REG_4 ? Gpio_io_ocp_S_Data : _GEN_11; // @[Patmos.scala 418:20 Patmos.scala 419:37]
  wire  _T_19 = cores_0_io_memInOut_M_Addr[31:16] == 16'hf00b; // @[Patmos.scala 405:85]
  reg  REG_5; // @[Patmos.scala 414:27]
  wire [31:0] _GEN_19 = REG_5 ? Gpio_1_io_ocp_S_Data : _GEN_15; // @[Patmos.scala 418:20 Patmos.scala 419:37]
  wire  _T_23 = cores_0_io_memInOut_M_Addr[31:16] == 16'hf00c; // @[Patmos.scala 405:85]
  reg  REG_6; // @[Patmos.scala 414:27]
  wire [31:0] _GEN_23 = REG_6 ? Gpio_2_io_ocp_S_Data : _GEN_19; // @[Patmos.scala 418:20 Patmos.scala 419:37]
  wire  _T_27 = cores_0_io_memInOut_M_Addr[31:16] == 16'hf000; // @[Patmos.scala 405:85]
  reg  REG_7; // @[Patmos.scala 414:27]
  wire [31:0] _GEN_27 = REG_7 ? CpuInfo_io_ocp_S_Data : _GEN_23; // @[Patmos.scala 418:20 Patmos.scala 419:37]
  wire  _T_31 = cores_0_io_memInOut_M_Addr[31:16] == 16'hf001; // @[Patmos.scala 405:85]
  reg  REG_8; // @[Patmos.scala 414:27]
  wire [31:0] _GEN_31 = REG_8 ? cores_0_io_excInOut_S_Data : _GEN_27; // @[Patmos.scala 418:20 Patmos.scala 419:37]
  wire  _T_35 = cores_0_io_memInOut_M_Addr[31:16] == 16'he801; // @[Patmos.scala 405:85]
  reg  REG_9; // @[Patmos.scala 414:27]
  wire [31:0] _GEN_35 = REG_9 ? 32'h0 : _GEN_31; // @[Patmos.scala 418:20 Patmos.scala 419:37]
  wire  _T_39 = cores_0_io_memInOut_M_Addr[31:16] == 16'hf008; // @[Patmos.scala 405:85]
  reg  REG_10; // @[Patmos.scala 414:27]
  wire [31:0] _GEN_39 = REG_10 ? UartCmp_io_cores_0_S_Data : _GEN_35; // @[Patmos.scala 418:20 Patmos.scala 419:37]
  wire  _T_45 = ~cores_0_io_memInOut_M_Addr[16]; // @[Patmos.scala 406:32]
  wire  _T_46 = cores_0_io_memInOut_M_Addr[31:28] == 4'h0 & _T_45; // @[Patmos.scala 405:100]
  reg  REG_11; // @[Patmos.scala 414:27]
  wire [31:0] _GEN_43 = REG_11 ? Spm_io_S_Data : _GEN_39; // @[Patmos.scala 418:20 Patmos.scala 419:37]
  wire  _GEN_45 = _T_49 | (_T_46 | (_T_39 | (_T_35 | (_T_31 | (_T_27 | (_T_23 | (_T_19 | (_T_15 | (_T_11 | (_T_7 | _T_3)
    ))))))))); // @[Patmos.scala 410:17 Patmos.scala 412:18]
  reg  REG_12; // @[Patmos.scala 414:27]
  reg [1:0] REG_13; // @[Patmos.scala 439:25]
  wire [1:0] _T_55 = Timer_io_ocp_S_Resp; // @[Patmos.scala 445:122]
  wire [1:0] _T_56 = _T_55 | Deadline_io_ocp_S_Resp; // @[Patmos.scala 445:122]
  wire [1:0] _T_57 = _T_56 | Leds_io_ocp_S_Resp; // @[Patmos.scala 445:122]
  wire [1:0] _T_58 = _T_57 | Gpio_io_ocp_S_Resp; // @[Patmos.scala 445:122]
  wire [1:0] _T_59 = _T_58 | Gpio_1_io_ocp_S_Resp; // @[Patmos.scala 445:122]
  wire [1:0] _T_60 = _T_59 | Gpio_2_io_ocp_S_Resp; // @[Patmos.scala 445:122]
  wire [1:0] _T_61 = _T_60 | CpuInfo_io_ocp_S_Resp; // @[Patmos.scala 445:122]
  wire [1:0] _T_62 = _T_61 | cores_0_io_excInOut_S_Resp; // @[Patmos.scala 445:122]
  wire [1:0] _T_63 = _T_62 | HardlockOCPWrapper_io_cores_0_S_Resp; // @[Patmos.scala 445:122]
  wire [1:0] _T_64 = _T_63 | UartCmp_io_cores_0_S_Resp; // @[Patmos.scala 445:122]
  wire [1:0] _T_65 = _T_64 | Spm_io_S_Resp; // @[Patmos.scala 445:122]
  wire [1:0] _T_66 = _T_65 | REG; // @[Patmos.scala 445:122]
  PatmosCore cores_0 ( // @[Patmos.scala 229:48]
    .clock(cores_0_clock),
    .reset(cores_0_reset),
    .io_interrupts_0(cores_0_io_interrupts_0),
    .io_interrupts_1(cores_0_io_interrupts_1),
    .io_memPort_M_Cmd(cores_0_io_memPort_M_Cmd),
    .io_memPort_M_Addr(cores_0_io_memPort_M_Addr),
    .io_memPort_M_Data(cores_0_io_memPort_M_Data),
    .io_memPort_M_DataValid(cores_0_io_memPort_M_DataValid),
    .io_memPort_M_DataByteEn(cores_0_io_memPort_M_DataByteEn),
    .io_memPort_S_Resp(cores_0_io_memPort_S_Resp),
    .io_memPort_S_Data(cores_0_io_memPort_S_Data),
    .io_memPort_S_CmdAccept(cores_0_io_memPort_S_CmdAccept),
    .io_memPort_S_DataAccept(cores_0_io_memPort_S_DataAccept),
    .io_memInOut_M_Cmd(cores_0_io_memInOut_M_Cmd),
    .io_memInOut_M_Addr(cores_0_io_memInOut_M_Addr),
    .io_memInOut_M_Data(cores_0_io_memInOut_M_Data),
    .io_memInOut_M_ByteEn(cores_0_io_memInOut_M_ByteEn),
    .io_memInOut_S_Resp(cores_0_io_memInOut_S_Resp),
    .io_memInOut_S_Data(cores_0_io_memInOut_S_Data),
    .io_excInOut_M_Cmd(cores_0_io_excInOut_M_Cmd),
    .io_excInOut_M_Addr(cores_0_io_excInOut_M_Addr),
    .io_excInOut_M_Data(cores_0_io_excInOut_M_Data),
    .io_excInOut_S_Resp(cores_0_io_excInOut_S_Resp),
    .io_excInOut_S_Data(cores_0_io_excInOut_S_Data),
    .io_boot_pc_stall(cores_0_io_boot_pc_stall),
    .io_boot_pc_bootAddr(cores_0_io_boot_pc_bootAddr),
    .io_boot_bootMemWr_enaEven(cores_0_io_boot_bootMemWr_enaEven),
    .io_boot_bootMemWr_addrEven(cores_0_io_boot_bootMemWr_addrEven),
    .io_boot_bootMemWr_dataEven(cores_0_io_boot_bootMemWr_dataEven),
    .io_boot_bootMemWr_enaOdd(cores_0_io_boot_bootMemWr_enaOdd),
    .io_boot_bootMemWr_addrOdd(cores_0_io_boot_bootMemWr_addrOdd),
    .io_boot_bootMemWr_dataOdd(cores_0_io_boot_bootMemWr_dataOdd)
  );
  HardlockOCPWrapper HardlockOCPWrapper ( // @[Patmos.scala 264:63]
    .clock(HardlockOCPWrapper_clock),
    .reset(HardlockOCPWrapper_reset),
    .io_cores_0_M_Cmd(HardlockOCPWrapper_io_cores_0_M_Cmd),
    .io_cores_0_S_Resp(HardlockOCPWrapper_io_cores_0_S_Resp)
  );
  UartCmp UartCmp ( // @[Patmos.scala 273:62]
    .clock(UartCmp_clock),
    .reset(UartCmp_reset),
    .io_cores_0_M_Cmd(UartCmp_io_cores_0_M_Cmd),
    .io_cores_0_M_Addr(UartCmp_io_cores_0_M_Addr),
    .io_cores_0_M_Data(UartCmp_io_cores_0_M_Data),
    .io_cores_0_S_Resp(UartCmp_io_cores_0_S_Resp),
    .io_cores_0_S_Data(UartCmp_io_cores_0_S_Data),
    .io_pins_tx(UartCmp_io_pins_tx),
    .io_pins_rx(UartCmp_io_pins_rx)
  );
  CpuInfo CpuInfo ( // @[Patmos.scala 301:25]
    .clock(CpuInfo_clock),
    .io_ocp_M_Cmd(CpuInfo_io_ocp_M_Cmd),
    .io_ocp_M_Addr(CpuInfo_io_ocp_M_Addr),
    .io_ocp_S_Resp(CpuInfo_io_ocp_S_Resp),
    .io_ocp_S_Data(CpuInfo_io_ocp_S_Data)
  );
  Timer Timer ( // @[Timer.scala 22:11]
    .clock(Timer_clock),
    .reset(Timer_reset),
    .io_ocp_M_Cmd(Timer_io_ocp_M_Cmd),
    .io_ocp_M_Addr(Timer_io_ocp_M_Addr),
    .io_ocp_M_Data(Timer_io_ocp_M_Data),
    .io_ocp_S_Resp(Timer_io_ocp_S_Resp),
    .io_ocp_S_Data(Timer_io_ocp_S_Data),
    .io_interrupts_0(Timer_io_interrupts_0),
    .io_interrupts_1(Timer_io_interrupts_1)
  );
  Deadline Deadline ( // @[Deadline.scala 53:61]
    .clock(Deadline_clock),
    .reset(Deadline_reset),
    .io_ocp_M_Cmd(Deadline_io_ocp_M_Cmd),
    .io_ocp_M_Data(Deadline_io_ocp_M_Data),
    .io_ocp_S_Resp(Deadline_io_ocp_S_Resp),
    .io_ocp_S_Data(Deadline_io_ocp_S_Data)
  );
  Leds Leds ( // @[Leds.scala 22:11]
    .clock(Leds_clock),
    .reset(Leds_reset),
    .io_ocp_M_Cmd(Leds_io_ocp_M_Cmd),
    .io_ocp_M_Data(Leds_io_ocp_M_Data),
    .io_ocp_S_Resp(Leds_io_ocp_S_Resp),
    .io_ocp_S_Data(Leds_io_ocp_S_Data),
    .io_pins_led(Leds_io_pins_led)
  );
  Gpio Gpio ( // @[Gpio.scala 41:11]
    .clock(Gpio_clock),
    .reset(Gpio_reset),
    .io_ocp_M_Cmd(Gpio_io_ocp_M_Cmd),
    .io_ocp_M_Addr(Gpio_io_ocp_M_Addr),
    .io_ocp_S_Resp(Gpio_io_ocp_S_Resp),
    .io_ocp_S_Data(Gpio_io_ocp_S_Data),
    .io_pins_gpios_0(Gpio_io_pins_gpios_0)
  );
  Gpio_1 Gpio_1 ( // @[Gpio.scala 41:11]
    .clock(Gpio_1_clock),
    .reset(Gpio_1_reset),
    .io_ocp_M_Cmd(Gpio_1_io_ocp_M_Cmd),
    .io_ocp_M_Addr(Gpio_1_io_ocp_M_Addr),
    .io_ocp_M_Data(Gpio_1_io_ocp_M_Data),
    .io_ocp_S_Resp(Gpio_1_io_ocp_S_Resp),
    .io_ocp_S_Data(Gpio_1_io_ocp_S_Data),
    .io_pins_gpios_0(Gpio_1_io_pins_gpios_0)
  );
  Gpio_1 Gpio_2 ( // @[Gpio.scala 41:11]
    .clock(Gpio_2_clock),
    .reset(Gpio_2_reset),
    .io_ocp_M_Cmd(Gpio_2_io_ocp_M_Cmd),
    .io_ocp_M_Addr(Gpio_2_io_ocp_M_Addr),
    .io_ocp_M_Data(Gpio_2_io_ocp_M_Data),
    .io_ocp_S_Resp(Gpio_2_io_ocp_S_Resp),
    .io_ocp_S_Data(Gpio_2_io_ocp_S_Data),
    .io_pins_gpios_0(Gpio_2_io_pins_gpios_0)
  );
  Spm Spm ( // @[Patmos.scala 355:21]
    .clock(Spm_clock),
    .io_M_Cmd(Spm_io_M_Cmd),
    .io_M_Addr(Spm_io_M_Addr),
    .io_M_Data(Spm_io_M_Data),
    .io_M_ByteEn(Spm_io_M_ByteEn),
    .io_S_Resp(Spm_io_S_Resp),
    .io_S_Data(Spm_io_S_Data)
  );
  OCPburst_SPI_memory ramCtrl ( // @[OCPburst_SPI_memory.scala 14:11]
    .clock(ramCtrl_clock),
    .reset(ramCtrl_reset),
    .io_ocp_M_Cmd(ramCtrl_io_ocp_M_Cmd),
    .io_ocp_M_Addr(ramCtrl_io_ocp_M_Addr),
    .io_ocp_M_Data(ramCtrl_io_ocp_M_Data),
    .io_ocp_M_DataValid(ramCtrl_io_ocp_M_DataValid),
    .io_ocp_M_DataByteEn(ramCtrl_io_ocp_M_DataByteEn),
    .io_ocp_S_Resp(ramCtrl_io_ocp_S_Resp),
    .io_ocp_S_Data(ramCtrl_io_ocp_S_Data),
    .io_ocp_S_CmdAccept(ramCtrl_io_ocp_S_CmdAccept),
    .io_ocp_S_DataAccept(ramCtrl_io_ocp_S_DataAccept),
    .io_pins_spiOut_CE(ramCtrl_io_pins_spiOut_CE),
    .io_pins_spiOut_MOSI(ramCtrl_io_pins_spiOut_MOSI),
    .io_pins_spiOut_S_CLK(ramCtrl_io_pins_spiOut_S_CLK),
    .io_pins_spiIn_MISO(ramCtrl_io_pins_spiIn_MISO)
  );
  assign io_Gpio_oe_gpios_0 = Gpio_2_io_pins_gpios_0; // @[Patmos.scala 542:36]
  assign io_UartCmp_tx = UartCmp_io_pins_tx; // @[Patmos.scala 542:36]
  assign io_Leds_led = Leds_io_pins_led; // @[Patmos.scala 542:36]
  assign io_Gpio_out_gpios_0 = Gpio_1_io_pins_gpios_0; // @[Patmos.scala 542:36]
  assign io_OCPburst_SPI_memory_spiOut_CE = ramCtrl_io_pins_spiOut_CE; // @[Patmos.scala 542:36]
  assign io_OCPburst_SPI_memory_spiOut_MOSI = ramCtrl_io_pins_spiOut_MOSI; // @[Patmos.scala 542:36]
  assign io_OCPburst_SPI_memory_spiOut_S_CLK = ramCtrl_io_pins_spiOut_S_CLK; // @[Patmos.scala 542:36]
  assign cores_0_clock = clock;
  assign cores_0_reset = reset;
  assign cores_0_io_interrupts_0 = Timer_io_interrupts_0; // @[Patmos.scala 324:53]
  assign cores_0_io_interrupts_1 = Timer_io_interrupts_1; // @[Patmos.scala 324:53]
  assign cores_0_io_memPort_S_Resp = ramCtrl_io_ocp_S_Resp; // @[Patmos.scala 484:27]
  assign cores_0_io_memPort_S_Data = ramCtrl_io_ocp_S_Data; // @[Patmos.scala 484:27]
  assign cores_0_io_memPort_S_CmdAccept = ramCtrl_io_ocp_S_CmdAccept; // @[Patmos.scala 484:27]
  assign cores_0_io_memPort_S_DataAccept = ramCtrl_io_ocp_S_DataAccept; // @[Patmos.scala 484:27]
  assign cores_0_io_memInOut_S_Resp = REG_13 | _T_66; // @[Patmos.scala 445:47]
  assign cores_0_io_memInOut_S_Data = REG_12 ? 32'h0 : _GEN_43; // @[Patmos.scala 418:20 Patmos.scala 419:37]
  assign cores_0_io_excInOut_M_Cmd = _T_31 ? cores_0_io_memInOut_M_Cmd : 3'h0; // @[Patmos.scala 410:17 Patmos.scala 411:19 Patmos.scala 409:17]
  assign cores_0_io_excInOut_M_Addr = cores_0_io_memInOut_M_Addr; // @[Patmos.scala 408:13]
  assign cores_0_io_excInOut_M_Data = cores_0_io_memInOut_M_Data; // @[Patmos.scala 408:13]
  assign cores_0_io_boot_pc_stall = io_boot_pc_stall; // @[Patmos.scala 541:35]
  assign cores_0_io_boot_pc_bootAddr = io_boot_pc_bootAddr; // @[Patmos.scala 541:35]
  assign cores_0_io_boot_bootMemWr_enaEven = io_boot_bootMemWr_enaEven; // @[Patmos.scala 541:35]
  assign cores_0_io_boot_bootMemWr_addrEven = io_boot_bootMemWr_addrEven; // @[Patmos.scala 541:35]
  assign cores_0_io_boot_bootMemWr_dataEven = io_boot_bootMemWr_dataEven; // @[Patmos.scala 541:35]
  assign cores_0_io_boot_bootMemWr_enaOdd = io_boot_bootMemWr_enaOdd; // @[Patmos.scala 541:35]
  assign cores_0_io_boot_bootMemWr_addrOdd = io_boot_bootMemWr_addrOdd; // @[Patmos.scala 541:35]
  assign cores_0_io_boot_bootMemWr_dataOdd = io_boot_bootMemWr_dataOdd; // @[Patmos.scala 541:35]
  assign HardlockOCPWrapper_clock = clock;
  assign HardlockOCPWrapper_reset = reset;
  assign HardlockOCPWrapper_io_cores_0_M_Cmd = _T_35 ? cores_0_io_memInOut_M_Cmd : 3'h0; // @[Patmos.scala 410:17 Patmos.scala 411:19 Patmos.scala 409:17]
  assign UartCmp_clock = clock;
  assign UartCmp_reset = reset;
  assign UartCmp_io_cores_0_M_Cmd = _T_39 ? cores_0_io_memInOut_M_Cmd : 3'h0; // @[Patmos.scala 410:17 Patmos.scala 411:19 Patmos.scala 409:17]
  assign UartCmp_io_cores_0_M_Addr = cores_0_io_memInOut_M_Addr; // @[Patmos.scala 408:13]
  assign UartCmp_io_cores_0_M_Data = cores_0_io_memInOut_M_Data; // @[Patmos.scala 408:13]
  assign UartCmp_io_pins_rx = io_UartCmp_rx; // @[Patmos.scala 541:35]
  assign CpuInfo_clock = clock;
  assign CpuInfo_io_ocp_M_Cmd = _T_27 ? cores_0_io_memInOut_M_Cmd : 3'h0; // @[Patmos.scala 410:17 Patmos.scala 411:19 Patmos.scala 409:17]
  assign CpuInfo_io_ocp_M_Addr = cores_0_io_memInOut_M_Addr; // @[Patmos.scala 408:13]
  assign Timer_clock = clock;
  assign Timer_reset = reset;
  assign Timer_io_ocp_M_Cmd = _T_3 ? cores_0_io_memInOut_M_Cmd : 3'h0; // @[Patmos.scala 410:17 Patmos.scala 411:19 Patmos.scala 409:17]
  assign Timer_io_ocp_M_Addr = cores_0_io_memInOut_M_Addr; // @[Patmos.scala 408:13]
  assign Timer_io_ocp_M_Data = cores_0_io_memInOut_M_Data; // @[Patmos.scala 408:13]
  assign Deadline_clock = clock;
  assign Deadline_reset = reset;
  assign Deadline_io_ocp_M_Cmd = _T_7 ? cores_0_io_memInOut_M_Cmd : 3'h0; // @[Patmos.scala 410:17 Patmos.scala 411:19 Patmos.scala 409:17]
  assign Deadline_io_ocp_M_Data = cores_0_io_memInOut_M_Data; // @[Patmos.scala 408:13]
  assign Leds_clock = clock;
  assign Leds_reset = reset;
  assign Leds_io_ocp_M_Cmd = _T_11 ? cores_0_io_memInOut_M_Cmd : 3'h0; // @[Patmos.scala 410:17 Patmos.scala 411:19 Patmos.scala 409:17]
  assign Leds_io_ocp_M_Data = cores_0_io_memInOut_M_Data; // @[Patmos.scala 408:13]
  assign Gpio_clock = clock;
  assign Gpio_reset = reset;
  assign Gpio_io_ocp_M_Cmd = _T_15 ? cores_0_io_memInOut_M_Cmd : 3'h0; // @[Patmos.scala 410:17 Patmos.scala 411:19 Patmos.scala 409:17]
  assign Gpio_io_ocp_M_Addr = cores_0_io_memInOut_M_Addr; // @[Patmos.scala 408:13]
  assign Gpio_io_pins_gpios_0 = io_Gpio_in_gpios_0; // @[Patmos.scala 541:35]
  assign Gpio_1_clock = clock;
  assign Gpio_1_reset = reset;
  assign Gpio_1_io_ocp_M_Cmd = _T_19 ? cores_0_io_memInOut_M_Cmd : 3'h0; // @[Patmos.scala 410:17 Patmos.scala 411:19 Patmos.scala 409:17]
  assign Gpio_1_io_ocp_M_Addr = cores_0_io_memInOut_M_Addr; // @[Patmos.scala 408:13]
  assign Gpio_1_io_ocp_M_Data = cores_0_io_memInOut_M_Data; // @[Patmos.scala 408:13]
  assign Gpio_2_clock = clock;
  assign Gpio_2_reset = reset;
  assign Gpio_2_io_ocp_M_Cmd = _T_23 ? cores_0_io_memInOut_M_Cmd : 3'h0; // @[Patmos.scala 410:17 Patmos.scala 411:19 Patmos.scala 409:17]
  assign Gpio_2_io_ocp_M_Addr = cores_0_io_memInOut_M_Addr; // @[Patmos.scala 408:13]
  assign Gpio_2_io_ocp_M_Data = cores_0_io_memInOut_M_Data; // @[Patmos.scala 408:13]
  assign Spm_clock = clock;
  assign Spm_io_M_Cmd = _T_46 ? cores_0_io_memInOut_M_Cmd : 3'h0; // @[Patmos.scala 410:17 Patmos.scala 411:19 Patmos.scala 409:17]
  assign Spm_io_M_Addr = cores_0_io_memInOut_M_Addr[9:0]; // @[Patmos.scala 408:13]
  assign Spm_io_M_Data = cores_0_io_memInOut_M_Data; // @[Patmos.scala 408:13]
  assign Spm_io_M_ByteEn = cores_0_io_memInOut_M_ByteEn; // @[Patmos.scala 408:13]
  assign ramCtrl_clock = clock;
  assign ramCtrl_reset = reset;
  assign ramCtrl_io_ocp_M_Cmd = cores_0_io_memPort_M_Cmd; // @[Patmos.scala 483:22]
  assign ramCtrl_io_ocp_M_Addr = cores_0_io_memPort_M_Addr; // @[Patmos.scala 483:22]
  assign ramCtrl_io_ocp_M_Data = cores_0_io_memPort_M_Data; // @[Patmos.scala 483:22]
  assign ramCtrl_io_ocp_M_DataValid = cores_0_io_memPort_M_DataValid; // @[Patmos.scala 483:22]
  assign ramCtrl_io_ocp_M_DataByteEn = cores_0_io_memPort_M_DataByteEn; // @[Patmos.scala 483:22]
  assign ramCtrl_io_pins_spiIn_MISO = io_OCPburst_SPI_memory_spiIn_MISO; // @[Patmos.scala 541:35]
  always @(posedge clock) begin
    if (_GEN_44 == 3'h0) begin // @[Patmos.scala 360:33]
      REG <= 2'h0;
    end else begin
      REG <= 2'h1;
    end
    if (reset) begin // @[Patmos.scala 414:27]
      REG_1 <= 1'h0; // @[Patmos.scala 414:27]
    end else if (cores_0_io_memInOut_M_Cmd != 3'h0) begin // @[Patmos.scala 415:56]
      REG_1 <= _T_3; // @[Patmos.scala 416:16]
    end
    if (reset) begin // @[Patmos.scala 414:27]
      REG_2 <= 1'h0; // @[Patmos.scala 414:27]
    end else if (cores_0_io_memInOut_M_Cmd != 3'h0) begin // @[Patmos.scala 415:56]
      REG_2 <= _T_7; // @[Patmos.scala 416:16]
    end
    if (reset) begin // @[Patmos.scala 414:27]
      REG_3 <= 1'h0; // @[Patmos.scala 414:27]
    end else if (cores_0_io_memInOut_M_Cmd != 3'h0) begin // @[Patmos.scala 415:56]
      REG_3 <= _T_11; // @[Patmos.scala 416:16]
    end
    if (reset) begin // @[Patmos.scala 414:27]
      REG_4 <= 1'h0; // @[Patmos.scala 414:27]
    end else if (cores_0_io_memInOut_M_Cmd != 3'h0) begin // @[Patmos.scala 415:56]
      REG_4 <= _T_15; // @[Patmos.scala 416:16]
    end
    if (reset) begin // @[Patmos.scala 414:27]
      REG_5 <= 1'h0; // @[Patmos.scala 414:27]
    end else if (cores_0_io_memInOut_M_Cmd != 3'h0) begin // @[Patmos.scala 415:56]
      REG_5 <= _T_19; // @[Patmos.scala 416:16]
    end
    if (reset) begin // @[Patmos.scala 414:27]
      REG_6 <= 1'h0; // @[Patmos.scala 414:27]
    end else if (cores_0_io_memInOut_M_Cmd != 3'h0) begin // @[Patmos.scala 415:56]
      REG_6 <= _T_23; // @[Patmos.scala 416:16]
    end
    if (reset) begin // @[Patmos.scala 414:27]
      REG_7 <= 1'h0; // @[Patmos.scala 414:27]
    end else if (cores_0_io_memInOut_M_Cmd != 3'h0) begin // @[Patmos.scala 415:56]
      REG_7 <= _T_27; // @[Patmos.scala 416:16]
    end
    if (reset) begin // @[Patmos.scala 414:27]
      REG_8 <= 1'h0; // @[Patmos.scala 414:27]
    end else if (cores_0_io_memInOut_M_Cmd != 3'h0) begin // @[Patmos.scala 415:56]
      REG_8 <= _T_31; // @[Patmos.scala 416:16]
    end
    if (reset) begin // @[Patmos.scala 414:27]
      REG_9 <= 1'h0; // @[Patmos.scala 414:27]
    end else if (cores_0_io_memInOut_M_Cmd != 3'h0) begin // @[Patmos.scala 415:56]
      REG_9 <= _T_35; // @[Patmos.scala 416:16]
    end
    if (reset) begin // @[Patmos.scala 414:27]
      REG_10 <= 1'h0; // @[Patmos.scala 414:27]
    end else if (cores_0_io_memInOut_M_Cmd != 3'h0) begin // @[Patmos.scala 415:56]
      REG_10 <= _T_39; // @[Patmos.scala 416:16]
    end
    if (reset) begin // @[Patmos.scala 414:27]
      REG_11 <= 1'h0; // @[Patmos.scala 414:27]
    end else if (cores_0_io_memInOut_M_Cmd != 3'h0) begin // @[Patmos.scala 415:56]
      REG_11 <= _T_46; // @[Patmos.scala 416:16]
    end
    if (reset) begin // @[Patmos.scala 414:27]
      REG_12 <= 1'h0; // @[Patmos.scala 414:27]
    end else if (cores_0_io_memInOut_M_Cmd != 3'h0) begin // @[Patmos.scala 415:56]
      REG_12 <= _T_49; // @[Patmos.scala 416:16]
    end
    if (reset) begin // @[Patmos.scala 439:25]
      REG_13 <= 2'h0; // @[Patmos.scala 439:25]
    end else if (_T_5 & ~_GEN_45) begin // @[Patmos.scala 440:67]
      REG_13 <= 2'h3; // @[Patmos.scala 441:18]
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
  REG = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  REG_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  REG_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  REG_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  REG_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  REG_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  REG_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  REG_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  REG_8 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  REG_9 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  REG_10 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  REG_11 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  REG_12 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  REG_13 = _RAND_13[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module WishboneSlave(
  input         clock,
  input         reset,
  input         io_wb_stb,
  input         io_wb_cyc,
  input         io_wb_we,
  input  [31:0] io_wb_din,
  input  [31:0] io_wb_addr,
  output        io_wb_ack,
  output [31:0] io_wb_dout,
  output        io_patmos_boot_pc_stall,
  output        io_patmos_boot_pc_reset,
  output [29:0] io_patmos_boot_pc_bootAddr,
  output        io_patmos_boot_bootMemWr_enaEven,
  output [8:0]  io_patmos_boot_bootMemWr_addrEven,
  output [31:0] io_patmos_boot_bootMemWr_dataEven,
  output        io_patmos_boot_bootMemWr_enaOdd,
  output [8:0]  io_patmos_boot_bootMemWr_addrOdd,
  output [31:0] io_patmos_boot_bootMemWr_dataOdd
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
`endif // RANDOMIZE_REG_INIT
  reg  WBReg_0_stall; // @[WishboneSlave.scala 28:26]
  reg  WBReg_0_reset; // @[WishboneSlave.scala 28:26]
  reg [29:0] WBReg_0_bootAddr; // @[WishboneSlave.scala 28:26]
  reg  WBReg_1_enaEven; // @[WishboneSlave.scala 28:62]
  reg [8:0] WBReg_1_addrEven; // @[WishboneSlave.scala 28:62]
  reg [31:0] WBReg_1_dataEven; // @[WishboneSlave.scala 28:62]
  reg  WBReg_1_enaOdd; // @[WishboneSlave.scala 28:62]
  reg [8:0] WBReg_1_addrOdd; // @[WishboneSlave.scala 28:62]
  reg [31:0] WBReg_1_dataOdd; // @[WishboneSlave.scala 28:62]
  wire  validAddr = io_wb_addr == 32'h30000020 | (io_wb_addr == 32'h3000001c | (io_wb_addr == 32'h30000018 | (io_wb_addr
     == 32'h30000014 | (io_wb_addr == 32'h30000010 | (io_wb_addr == 32'h3000000c | (io_wb_addr == 32'h30000008 | (
    io_wb_addr == 32'h30000004 | io_wb_addr == 32'h30000000))))))); // @[WishboneSlave.scala 40:53 WishboneSlave.scala 41:19]
  reg  REG; // @[WishboneSlave.scala 35:23]
  wire  _T_5 = io_wb_stb & io_wb_cyc; // @[WishboneSlave.scala 36:24]
  wire  read = io_wb_stb & io_wb_cyc & ~io_wb_we; // @[WishboneSlave.scala 36:36]
  wire  write = _T_5 & io_wb_we; // @[WishboneSlave.scala 37:37]
  wire [29:0] _GEN_0 = read ? WBReg_0_bootAddr : 30'h0; // @[WishboneSlave.scala 45:29 WishboneSlave.scala 46:24 WishboneSlave.scala 32:14]
  wire [31:0] _GEN_1 = write ? io_wb_din : {{2'd0}, WBReg_0_bootAddr}; // @[WishboneSlave.scala 43:22 WishboneSlave.scala 44:17 WishboneSlave.scala 28:26]
  wire [29:0] _GEN_2 = write ? 30'h0 : _GEN_0; // @[WishboneSlave.scala 43:22 WishboneSlave.scala 32:14]
  wire [31:0] _GEN_3 = io_wb_ack ? _GEN_1 : {{2'd0}, WBReg_0_bootAddr}; // @[WishboneSlave.scala 42:24 WishboneSlave.scala 28:26]
  wire [29:0] _GEN_4 = io_wb_ack ? _GEN_2 : 30'h0; // @[WishboneSlave.scala 42:24 WishboneSlave.scala 32:14]
  wire [31:0] _GEN_6 = io_wb_addr == 32'h30000000 ? _GEN_3 : {{2'd0}, WBReg_0_bootAddr}; // @[WishboneSlave.scala 40:53 WishboneSlave.scala 28:26]
  wire [29:0] _GEN_7 = io_wb_addr == 32'h30000000 ? _GEN_4 : 30'h0; // @[WishboneSlave.scala 40:53 WishboneSlave.scala 32:14]
  wire [29:0] _GEN_8 = read ? {{29'd0}, WBReg_0_reset} : _GEN_7; // @[WishboneSlave.scala 45:29 WishboneSlave.scala 46:24]
  wire [31:0] _GEN_9 = write ? io_wb_din : {{31'd0}, WBReg_0_reset}; // @[WishboneSlave.scala 43:22 WishboneSlave.scala 44:17 WishboneSlave.scala 28:26]
  wire [29:0] _GEN_10 = write ? _GEN_7 : _GEN_8; // @[WishboneSlave.scala 43:22]
  wire [31:0] _GEN_11 = io_wb_ack ? _GEN_9 : {{31'd0}, WBReg_0_reset}; // @[WishboneSlave.scala 42:24 WishboneSlave.scala 28:26]
  wire [29:0] _GEN_12 = io_wb_ack ? _GEN_10 : _GEN_7; // @[WishboneSlave.scala 42:24]
  wire [31:0] _GEN_14 = io_wb_addr == 32'h30000004 ? _GEN_11 : {{31'd0}, WBReg_0_reset}; // @[WishboneSlave.scala 40:53 WishboneSlave.scala 28:26]
  wire [29:0] _GEN_15 = io_wb_addr == 32'h30000004 ? _GEN_12 : _GEN_7; // @[WishboneSlave.scala 40:53]
  wire [29:0] _GEN_16 = read ? {{29'd0}, WBReg_0_stall} : _GEN_15; // @[WishboneSlave.scala 45:29 WishboneSlave.scala 46:24]
  wire [31:0] _GEN_17 = write ? io_wb_din : {{31'd0}, WBReg_0_stall}; // @[WishboneSlave.scala 43:22 WishboneSlave.scala 44:17 WishboneSlave.scala 28:26]
  wire [29:0] _GEN_18 = write ? _GEN_15 : _GEN_16; // @[WishboneSlave.scala 43:22]
  wire [31:0] _GEN_19 = io_wb_ack ? _GEN_17 : {{31'd0}, WBReg_0_stall}; // @[WishboneSlave.scala 42:24 WishboneSlave.scala 28:26]
  wire [29:0] _GEN_20 = io_wb_ack ? _GEN_18 : _GEN_15; // @[WishboneSlave.scala 42:24]
  wire [31:0] _GEN_22 = io_wb_addr == 32'h30000008 ? _GEN_19 : {{31'd0}, WBReg_0_stall}; // @[WishboneSlave.scala 40:53 WishboneSlave.scala 28:26]
  wire [29:0] _GEN_23 = io_wb_addr == 32'h30000008 ? _GEN_20 : _GEN_15; // @[WishboneSlave.scala 40:53]
  wire [31:0] _GEN_24 = read ? WBReg_1_dataOdd : {{2'd0}, _GEN_23}; // @[WishboneSlave.scala 45:29 WishboneSlave.scala 46:24]
  wire [31:0] _GEN_26 = write ? {{2'd0}, _GEN_23} : _GEN_24; // @[WishboneSlave.scala 43:22]
  wire [31:0] _GEN_28 = io_wb_ack ? _GEN_26 : {{2'd0}, _GEN_23}; // @[WishboneSlave.scala 42:24]
  wire [31:0] _GEN_31 = io_wb_addr == 32'h3000000c ? _GEN_28 : {{2'd0}, _GEN_23}; // @[WishboneSlave.scala 40:53]
  wire [31:0] _GEN_32 = read ? {{23'd0}, WBReg_1_addrOdd} : _GEN_31; // @[WishboneSlave.scala 45:29 WishboneSlave.scala 46:24]
  wire [31:0] _GEN_33 = write ? io_wb_din : {{23'd0}, WBReg_1_addrOdd}; // @[WishboneSlave.scala 43:22 WishboneSlave.scala 44:17 WishboneSlave.scala 28:62]
  wire [31:0] _GEN_34 = write ? _GEN_31 : _GEN_32; // @[WishboneSlave.scala 43:22]
  wire [31:0] _GEN_35 = io_wb_ack ? _GEN_33 : {{23'd0}, WBReg_1_addrOdd}; // @[WishboneSlave.scala 42:24 WishboneSlave.scala 28:62]
  wire [31:0] _GEN_36 = io_wb_ack ? _GEN_34 : _GEN_31; // @[WishboneSlave.scala 42:24]
  wire [31:0] _GEN_38 = io_wb_addr == 32'h30000010 ? _GEN_35 : {{23'd0}, WBReg_1_addrOdd}; // @[WishboneSlave.scala 40:53 WishboneSlave.scala 28:62]
  wire [31:0] _GEN_39 = io_wb_addr == 32'h30000010 ? _GEN_36 : _GEN_31; // @[WishboneSlave.scala 40:53]
  wire [31:0] _GEN_40 = read ? {{31'd0}, WBReg_1_enaOdd} : _GEN_39; // @[WishboneSlave.scala 45:29 WishboneSlave.scala 46:24]
  wire [31:0] _GEN_41 = write ? io_wb_din : {{31'd0}, WBReg_1_enaOdd}; // @[WishboneSlave.scala 43:22 WishboneSlave.scala 44:17 WishboneSlave.scala 28:62]
  wire [31:0] _GEN_42 = write ? _GEN_39 : _GEN_40; // @[WishboneSlave.scala 43:22]
  wire [31:0] _GEN_43 = io_wb_ack ? _GEN_41 : {{31'd0}, WBReg_1_enaOdd}; // @[WishboneSlave.scala 42:24 WishboneSlave.scala 28:62]
  wire [31:0] _GEN_44 = io_wb_ack ? _GEN_42 : _GEN_39; // @[WishboneSlave.scala 42:24]
  wire [31:0] _GEN_46 = io_wb_addr == 32'h30000014 ? _GEN_43 : {{31'd0}, WBReg_1_enaOdd}; // @[WishboneSlave.scala 40:53 WishboneSlave.scala 28:62]
  wire [31:0] _GEN_47 = io_wb_addr == 32'h30000014 ? _GEN_44 : _GEN_39; // @[WishboneSlave.scala 40:53]
  wire [31:0] _GEN_48 = read ? WBReg_1_dataEven : _GEN_47; // @[WishboneSlave.scala 45:29 WishboneSlave.scala 46:24]
  wire [31:0] _GEN_50 = write ? _GEN_47 : _GEN_48; // @[WishboneSlave.scala 43:22]
  wire [31:0] _GEN_52 = io_wb_ack ? _GEN_50 : _GEN_47; // @[WishboneSlave.scala 42:24]
  wire [31:0] _GEN_55 = io_wb_addr == 32'h30000018 ? _GEN_52 : _GEN_47; // @[WishboneSlave.scala 40:53]
  wire [31:0] _GEN_56 = read ? {{23'd0}, WBReg_1_addrEven} : _GEN_55; // @[WishboneSlave.scala 45:29 WishboneSlave.scala 46:24]
  wire [31:0] _GEN_57 = write ? io_wb_din : {{23'd0}, WBReg_1_addrEven}; // @[WishboneSlave.scala 43:22 WishboneSlave.scala 44:17 WishboneSlave.scala 28:62]
  wire [31:0] _GEN_58 = write ? _GEN_55 : _GEN_56; // @[WishboneSlave.scala 43:22]
  wire [31:0] _GEN_59 = io_wb_ack ? _GEN_57 : {{23'd0}, WBReg_1_addrEven}; // @[WishboneSlave.scala 42:24 WishboneSlave.scala 28:62]
  wire [31:0] _GEN_60 = io_wb_ack ? _GEN_58 : _GEN_55; // @[WishboneSlave.scala 42:24]
  wire [31:0] _GEN_62 = io_wb_addr == 32'h3000001c ? _GEN_59 : {{23'd0}, WBReg_1_addrEven}; // @[WishboneSlave.scala 40:53 WishboneSlave.scala 28:62]
  wire [31:0] _GEN_63 = io_wb_addr == 32'h3000001c ? _GEN_60 : _GEN_55; // @[WishboneSlave.scala 40:53]
  wire [31:0] _GEN_64 = read ? {{31'd0}, WBReg_1_enaEven} : _GEN_63; // @[WishboneSlave.scala 45:29 WishboneSlave.scala 46:24]
  wire [31:0] _GEN_65 = write ? io_wb_din : {{31'd0}, WBReg_1_enaEven}; // @[WishboneSlave.scala 43:22 WishboneSlave.scala 44:17 WishboneSlave.scala 28:62]
  wire [31:0] _GEN_66 = write ? _GEN_63 : _GEN_64; // @[WishboneSlave.scala 43:22]
  wire [31:0] _GEN_67 = io_wb_ack ? _GEN_65 : {{31'd0}, WBReg_1_enaEven}; // @[WishboneSlave.scala 42:24 WishboneSlave.scala 28:62]
  wire [31:0] _GEN_68 = io_wb_ack ? _GEN_66 : _GEN_63; // @[WishboneSlave.scala 42:24]
  wire [31:0] _GEN_70 = io_wb_addr == 32'h30000020 ? _GEN_67 : {{31'd0}, WBReg_1_enaEven}; // @[WishboneSlave.scala 40:53 WishboneSlave.scala 28:62]
  assign io_wb_ack = REG; // @[WishboneSlave.scala 35:13]
  assign io_wb_dout = io_wb_addr == 32'h30000020 ? _GEN_68 : _GEN_63; // @[WishboneSlave.scala 40:53]
  assign io_patmos_boot_pc_stall = WBReg_0_stall; // @[WishboneSlave.scala 30:21]
  assign io_patmos_boot_pc_reset = WBReg_0_reset; // @[WishboneSlave.scala 30:21]
  assign io_patmos_boot_pc_bootAddr = WBReg_0_bootAddr; // @[WishboneSlave.scala 30:21]
  assign io_patmos_boot_bootMemWr_enaEven = WBReg_1_enaEven; // @[WishboneSlave.scala 31:28]
  assign io_patmos_boot_bootMemWr_addrEven = WBReg_1_addrEven; // @[WishboneSlave.scala 31:28]
  assign io_patmos_boot_bootMemWr_dataEven = WBReg_1_dataEven; // @[WishboneSlave.scala 31:28]
  assign io_patmos_boot_bootMemWr_enaOdd = WBReg_1_enaOdd; // @[WishboneSlave.scala 31:28]
  assign io_patmos_boot_bootMemWr_addrOdd = WBReg_1_addrOdd; // @[WishboneSlave.scala 31:28]
  assign io_patmos_boot_bootMemWr_dataOdd = WBReg_1_dataOdd; // @[WishboneSlave.scala 31:28]
  always @(posedge clock) begin
    if (reset) begin // @[WishboneSlave.scala 28:26]
      WBReg_0_stall <= 1'h0; // @[WishboneSlave.scala 28:26]
    end else begin
      WBReg_0_stall <= _GEN_22[0];
    end
    WBReg_0_reset <= reset | _GEN_14[0]; // @[WishboneSlave.scala 28:26 WishboneSlave.scala 28:26]
    if (reset) begin // @[WishboneSlave.scala 28:26]
      WBReg_0_bootAddr <= 30'h1; // @[WishboneSlave.scala 28:26]
    end else begin
      WBReg_0_bootAddr <= _GEN_6[29:0];
    end
    if (reset) begin // @[WishboneSlave.scala 28:62]
      WBReg_1_enaEven <= 1'h0; // @[WishboneSlave.scala 28:62]
    end else begin
      WBReg_1_enaEven <= _GEN_70[0];
    end
    if (reset) begin // @[WishboneSlave.scala 28:62]
      WBReg_1_addrEven <= 9'h0; // @[WishboneSlave.scala 28:62]
    end else begin
      WBReg_1_addrEven <= _GEN_62[8:0];
    end
    if (reset) begin // @[WishboneSlave.scala 28:62]
      WBReg_1_dataEven <= 32'h0; // @[WishboneSlave.scala 28:62]
    end else if (io_wb_addr == 32'h30000018) begin // @[WishboneSlave.scala 40:53]
      if (io_wb_ack) begin // @[WishboneSlave.scala 42:24]
        if (write) begin // @[WishboneSlave.scala 43:22]
          WBReg_1_dataEven <= io_wb_din; // @[WishboneSlave.scala 44:17]
        end
      end
    end
    if (reset) begin // @[WishboneSlave.scala 28:62]
      WBReg_1_enaOdd <= 1'h0; // @[WishboneSlave.scala 28:62]
    end else begin
      WBReg_1_enaOdd <= _GEN_46[0];
    end
    if (reset) begin // @[WishboneSlave.scala 28:62]
      WBReg_1_addrOdd <= 9'h0; // @[WishboneSlave.scala 28:62]
    end else begin
      WBReg_1_addrOdd <= _GEN_38[8:0];
    end
    if (reset) begin // @[WishboneSlave.scala 28:62]
      WBReg_1_dataOdd <= 32'h0; // @[WishboneSlave.scala 28:62]
    end else if (io_wb_addr == 32'h3000000c) begin // @[WishboneSlave.scala 40:53]
      if (io_wb_ack) begin // @[WishboneSlave.scala 42:24]
        if (write) begin // @[WishboneSlave.scala 43:22]
          WBReg_1_dataOdd <= io_wb_din; // @[WishboneSlave.scala 44:17]
        end
      end
    end
    REG <= io_wb_stb & validAddr; // @[WishboneSlave.scala 35:34]
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
  WBReg_0_stall = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  WBReg_0_reset = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  WBReg_0_bootAddr = _RAND_2[29:0];
  _RAND_3 = {1{`RANDOM}};
  WBReg_1_enaEven = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  WBReg_1_addrEven = _RAND_4[8:0];
  _RAND_5 = {1{`RANDOM}};
  WBReg_1_dataEven = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  WBReg_1_enaOdd = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  WBReg_1_addrOdd = _RAND_7[8:0];
  _RAND_8 = {1{`RANDOM}};
  WBReg_1_dataOdd = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  REG = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PatmosChip(
  input         clock,
  input         reset,
  input  [7:0]  io_gpio_in_0,
  output        io_led,
  input  [3:0]  io_wishbone_sel,
  output [31:0] io_wishbone_dout,
  input  [31:0] io_wishbone_din,
  input         io_wishbone_stb,
  output [7:0]  io_gpio_out_0,
  input         io_spi_in_MISO,
  output [7:0]  io_gpio_oe_0,
  output        io_uart_tx,
  input         io_wishbone_we,
  output        io_wishbone_ack,
  input  [31:0] io_wishbone_addr,
  input         io_wishbone_cyc,
  input         io_uart_rx,
  output        io_spi_out_CE,
  output        io_spi_out_MOSI,
  output        io_spi_out_S_CLK
);
  wire  patmos_clock; // @[Patmos.scala 583:22]
  wire  patmos_reset; // @[Patmos.scala 583:22]
  wire [7:0] patmos_io_Gpio_oe_gpios_0; // @[Patmos.scala 583:22]
  wire  patmos_io_UartCmp_tx; // @[Patmos.scala 583:22]
  wire  patmos_io_Leds_led; // @[Patmos.scala 583:22]
  wire  patmos_io_OCPburst_SPI_memory_spiIn_MISO; // @[Patmos.scala 583:22]
  wire  patmos_io_boot_pc_stall; // @[Patmos.scala 583:22]
  wire [29:0] patmos_io_boot_pc_bootAddr; // @[Patmos.scala 583:22]
  wire  patmos_io_boot_bootMemWr_enaEven; // @[Patmos.scala 583:22]
  wire [8:0] patmos_io_boot_bootMemWr_addrEven; // @[Patmos.scala 583:22]
  wire [31:0] patmos_io_boot_bootMemWr_dataEven; // @[Patmos.scala 583:22]
  wire  patmos_io_boot_bootMemWr_enaOdd; // @[Patmos.scala 583:22]
  wire [8:0] patmos_io_boot_bootMemWr_addrOdd; // @[Patmos.scala 583:22]
  wire [31:0] patmos_io_boot_bootMemWr_dataOdd; // @[Patmos.scala 583:22]
  wire [7:0] patmos_io_Gpio_out_gpios_0; // @[Patmos.scala 583:22]
  wire  patmos_io_UartCmp_rx; // @[Patmos.scala 583:22]
  wire [7:0] patmos_io_Gpio_in_gpios_0; // @[Patmos.scala 583:22]
  wire  patmos_io_OCPburst_SPI_memory_spiOut_CE; // @[Patmos.scala 583:22]
  wire  patmos_io_OCPburst_SPI_memory_spiOut_MOSI; // @[Patmos.scala 583:22]
  wire  patmos_io_OCPburst_SPI_memory_spiOut_S_CLK; // @[Patmos.scala 583:22]
  wire  wishbone_clock; // @[Patmos.scala 584:24]
  wire  wishbone_reset; // @[Patmos.scala 584:24]
  wire  wishbone_io_wb_stb; // @[Patmos.scala 584:24]
  wire  wishbone_io_wb_cyc; // @[Patmos.scala 584:24]
  wire  wishbone_io_wb_we; // @[Patmos.scala 584:24]
  wire [31:0] wishbone_io_wb_din; // @[Patmos.scala 584:24]
  wire [31:0] wishbone_io_wb_addr; // @[Patmos.scala 584:24]
  wire  wishbone_io_wb_ack; // @[Patmos.scala 584:24]
  wire [31:0] wishbone_io_wb_dout; // @[Patmos.scala 584:24]
  wire  wishbone_io_patmos_boot_pc_stall; // @[Patmos.scala 584:24]
  wire  wishbone_io_patmos_boot_pc_reset; // @[Patmos.scala 584:24]
  wire [29:0] wishbone_io_patmos_boot_pc_bootAddr; // @[Patmos.scala 584:24]
  wire  wishbone_io_patmos_boot_bootMemWr_enaEven; // @[Patmos.scala 584:24]
  wire [8:0] wishbone_io_patmos_boot_bootMemWr_addrEven; // @[Patmos.scala 584:24]
  wire [31:0] wishbone_io_patmos_boot_bootMemWr_dataEven; // @[Patmos.scala 584:24]
  wire  wishbone_io_patmos_boot_bootMemWr_enaOdd; // @[Patmos.scala 584:24]
  wire [8:0] wishbone_io_patmos_boot_bootMemWr_addrOdd; // @[Patmos.scala 584:24]
  wire [31:0] wishbone_io_patmos_boot_bootMemWr_dataOdd; // @[Patmos.scala 584:24]
  Patmos patmos ( // @[Patmos.scala 583:22]
    .clock(patmos_clock),
    .reset(patmos_reset),
    .io_Gpio_oe_gpios_0(patmos_io_Gpio_oe_gpios_0),
    .io_UartCmp_tx(patmos_io_UartCmp_tx),
    .io_Leds_led(patmos_io_Leds_led),
    .io_OCPburst_SPI_memory_spiIn_MISO(patmos_io_OCPburst_SPI_memory_spiIn_MISO),
    .io_boot_pc_stall(patmos_io_boot_pc_stall),
    .io_boot_pc_bootAddr(patmos_io_boot_pc_bootAddr),
    .io_boot_bootMemWr_enaEven(patmos_io_boot_bootMemWr_enaEven),
    .io_boot_bootMemWr_addrEven(patmos_io_boot_bootMemWr_addrEven),
    .io_boot_bootMemWr_dataEven(patmos_io_boot_bootMemWr_dataEven),
    .io_boot_bootMemWr_enaOdd(patmos_io_boot_bootMemWr_enaOdd),
    .io_boot_bootMemWr_addrOdd(patmos_io_boot_bootMemWr_addrOdd),
    .io_boot_bootMemWr_dataOdd(patmos_io_boot_bootMemWr_dataOdd),
    .io_Gpio_out_gpios_0(patmos_io_Gpio_out_gpios_0),
    .io_UartCmp_rx(patmos_io_UartCmp_rx),
    .io_Gpio_in_gpios_0(patmos_io_Gpio_in_gpios_0),
    .io_OCPburst_SPI_memory_spiOut_CE(patmos_io_OCPburst_SPI_memory_spiOut_CE),
    .io_OCPburst_SPI_memory_spiOut_MOSI(patmos_io_OCPburst_SPI_memory_spiOut_MOSI),
    .io_OCPburst_SPI_memory_spiOut_S_CLK(patmos_io_OCPburst_SPI_memory_spiOut_S_CLK)
  );
  WishboneSlave wishbone ( // @[Patmos.scala 584:24]
    .clock(wishbone_clock),
    .reset(wishbone_reset),
    .io_wb_stb(wishbone_io_wb_stb),
    .io_wb_cyc(wishbone_io_wb_cyc),
    .io_wb_we(wishbone_io_wb_we),
    .io_wb_din(wishbone_io_wb_din),
    .io_wb_addr(wishbone_io_wb_addr),
    .io_wb_ack(wishbone_io_wb_ack),
    .io_wb_dout(wishbone_io_wb_dout),
    .io_patmos_boot_pc_stall(wishbone_io_patmos_boot_pc_stall),
    .io_patmos_boot_pc_reset(wishbone_io_patmos_boot_pc_reset),
    .io_patmos_boot_pc_bootAddr(wishbone_io_patmos_boot_pc_bootAddr),
    .io_patmos_boot_bootMemWr_enaEven(wishbone_io_patmos_boot_bootMemWr_enaEven),
    .io_patmos_boot_bootMemWr_addrEven(wishbone_io_patmos_boot_bootMemWr_addrEven),
    .io_patmos_boot_bootMemWr_dataEven(wishbone_io_patmos_boot_bootMemWr_dataEven),
    .io_patmos_boot_bootMemWr_enaOdd(wishbone_io_patmos_boot_bootMemWr_enaOdd),
    .io_patmos_boot_bootMemWr_addrOdd(wishbone_io_patmos_boot_bootMemWr_addrOdd),
    .io_patmos_boot_bootMemWr_dataOdd(wishbone_io_patmos_boot_bootMemWr_dataOdd)
  );
  assign io_led = patmos_io_Leds_led; // @[Patmos.scala 612:36]
  assign io_wishbone_dout = wishbone_io_wb_dout; // @[Patmos.scala 612:36]
  assign io_gpio_out_0 = patmos_io_Gpio_out_gpios_0; // @[Patmos.scala 612:36]
  assign io_gpio_oe_0 = patmos_io_Gpio_oe_gpios_0; // @[Patmos.scala 612:36]
  assign io_uart_tx = patmos_io_UartCmp_tx; // @[Patmos.scala 612:36]
  assign io_wishbone_ack = wishbone_io_wb_ack; // @[Patmos.scala 612:36]
  assign io_spi_out_CE = patmos_io_OCPburst_SPI_memory_spiOut_CE; // @[Patmos.scala 612:36]
  assign io_spi_out_MOSI = patmos_io_OCPburst_SPI_memory_spiOut_MOSI; // @[Patmos.scala 612:36]
  assign io_spi_out_S_CLK = patmos_io_OCPburst_SPI_memory_spiOut_S_CLK; // @[Patmos.scala 612:36]
  assign patmos_clock = clock;
  assign patmos_reset = wishbone_io_patmos_boot_pc_reset; // @[Patmos.scala 586:16]
  assign patmos_io_OCPburst_SPI_memory_spiIn_MISO = io_spi_in_MISO; // @[Patmos.scala 611:35]
  assign patmos_io_boot_pc_stall = wishbone_io_patmos_boot_pc_stall; // @[Patmos.scala 585:30]
  assign patmos_io_boot_pc_bootAddr = wishbone_io_patmos_boot_pc_bootAddr; // @[Patmos.scala 585:30]
  assign patmos_io_boot_bootMemWr_enaEven = wishbone_io_patmos_boot_bootMemWr_enaEven; // @[Patmos.scala 585:30]
  assign patmos_io_boot_bootMemWr_addrEven = wishbone_io_patmos_boot_bootMemWr_addrEven; // @[Patmos.scala 585:30]
  assign patmos_io_boot_bootMemWr_dataEven = wishbone_io_patmos_boot_bootMemWr_dataEven; // @[Patmos.scala 585:30]
  assign patmos_io_boot_bootMemWr_enaOdd = wishbone_io_patmos_boot_bootMemWr_enaOdd; // @[Patmos.scala 585:30]
  assign patmos_io_boot_bootMemWr_addrOdd = wishbone_io_patmos_boot_bootMemWr_addrOdd; // @[Patmos.scala 585:30]
  assign patmos_io_boot_bootMemWr_dataOdd = wishbone_io_patmos_boot_bootMemWr_dataOdd; // @[Patmos.scala 585:30]
  assign patmos_io_UartCmp_rx = io_uart_rx; // @[Patmos.scala 611:35]
  assign patmos_io_Gpio_in_gpios_0 = io_gpio_in_0; // @[Patmos.scala 611:35]
  assign wishbone_clock = clock;
  assign wishbone_reset = reset;
  assign wishbone_io_wb_stb = io_wishbone_stb; // @[Patmos.scala 611:35]
  assign wishbone_io_wb_cyc = io_wishbone_cyc; // @[Patmos.scala 611:35]
  assign wishbone_io_wb_we = io_wishbone_we; // @[Patmos.scala 611:35]
  assign wishbone_io_wb_din = io_wishbone_din; // @[Patmos.scala 611:35]
  assign wishbone_io_wb_addr = io_wishbone_addr; // @[Patmos.scala 611:35]
endmodule
