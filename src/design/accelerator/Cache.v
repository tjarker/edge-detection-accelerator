module Cache(
  input         clock,
  input         reset,
  input  [8:0]  write_x,
  input  [1:0]  write_y,
  input  [31:0] write_data,
  input         write_enable,
  input  [8:0]  in_x,
  input  [8:0]  in_y,
  input         in_valid,
  output [7:0]  out_window_0_0,
  output [7:0]  out_window_0_1,
  output [7:0]  out_window_0_2,
  output [7:0]  out_window_1_0,
  output [7:0]  out_window_1_1,
  output [7:0]  out_window_1_2,
  output [7:0]  out_window_2_0,
  output [7:0]  out_window_2_1,
  output [7:0]  out_window_2_2,
  output [7:0]  out_window_3_0,
  output [7:0]  out_window_3_1,
  output [7:0]  out_window_3_2,
  output        out_valid
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_29;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_28;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem_0_0 [0:43]; // @[Cache.scala 25:36]
  wire  mem_0_0_memOut_MPORT_en; // @[Cache.scala 25:36]
  wire [5:0] mem_0_0_memOut_MPORT_addr; // @[Cache.scala 25:36]
  wire [31:0] mem_0_0_memOut_MPORT_data; // @[Cache.scala 25:36]
  wire [31:0] mem_0_0_MPORT_1_data; // @[Cache.scala 25:36]
  wire [5:0] mem_0_0_MPORT_1_addr; // @[Cache.scala 25:36]
  wire  mem_0_0_MPORT_1_mask; // @[Cache.scala 25:36]
  wire  mem_0_0_MPORT_1_en; // @[Cache.scala 25:36]
  reg  mem_0_0_memOut_MPORT_en_pipe_0;
  reg [5:0] mem_0_0_memOut_MPORT_addr_pipe_0;
  reg [31:0] mem_0_1 [0:43]; // @[Cache.scala 25:36]
  wire  mem_0_1_memOut_MPORT_en; // @[Cache.scala 25:36]
  wire [5:0] mem_0_1_memOut_MPORT_addr; // @[Cache.scala 25:36]
  wire [31:0] mem_0_1_memOut_MPORT_data; // @[Cache.scala 25:36]
  wire [31:0] mem_0_1_MPORT_1_data; // @[Cache.scala 25:36]
  wire [5:0] mem_0_1_MPORT_1_addr; // @[Cache.scala 25:36]
  wire  mem_0_1_MPORT_1_mask; // @[Cache.scala 25:36]
  wire  mem_0_1_MPORT_1_en; // @[Cache.scala 25:36]
  reg  mem_0_1_memOut_MPORT_en_pipe_0;
  reg [5:0] mem_0_1_memOut_MPORT_addr_pipe_0;
  reg [31:0] mem_0_2 [0:43]; // @[Cache.scala 25:36]
  wire  mem_0_2_memOut_MPORT_en; // @[Cache.scala 25:36]
  wire [5:0] mem_0_2_memOut_MPORT_addr; // @[Cache.scala 25:36]
  wire [31:0] mem_0_2_memOut_MPORT_data; // @[Cache.scala 25:36]
  wire [31:0] mem_0_2_MPORT_1_data; // @[Cache.scala 25:36]
  wire [5:0] mem_0_2_MPORT_1_addr; // @[Cache.scala 25:36]
  wire  mem_0_2_MPORT_1_mask; // @[Cache.scala 25:36]
  wire  mem_0_2_MPORT_1_en; // @[Cache.scala 25:36]
  reg  mem_0_2_memOut_MPORT_en_pipe_0;
  reg [5:0] mem_0_2_memOut_MPORT_addr_pipe_0;
  reg [31:0] mem_0_3 [0:43]; // @[Cache.scala 25:36]
  wire  mem_0_3_memOut_MPORT_en; // @[Cache.scala 25:36]
  wire [5:0] mem_0_3_memOut_MPORT_addr; // @[Cache.scala 25:36]
  wire [31:0] mem_0_3_memOut_MPORT_data; // @[Cache.scala 25:36]
  wire [31:0] mem_0_3_MPORT_1_data; // @[Cache.scala 25:36]
  wire [5:0] mem_0_3_MPORT_1_addr; // @[Cache.scala 25:36]
  wire  mem_0_3_MPORT_1_mask; // @[Cache.scala 25:36]
  wire  mem_0_3_MPORT_1_en; // @[Cache.scala 25:36]
  reg  mem_0_3_memOut_MPORT_en_pipe_0;
  reg [5:0] mem_0_3_memOut_MPORT_addr_pipe_0;
  reg [31:0] mem_1_0 [0:43]; // @[Cache.scala 25:36]
  wire  mem_1_0_memOut_MPORT_1_en; // @[Cache.scala 25:36]
  wire [5:0] mem_1_0_memOut_MPORT_1_addr; // @[Cache.scala 25:36]
  wire [31:0] mem_1_0_memOut_MPORT_1_data; // @[Cache.scala 25:36]
  wire [31:0] mem_1_0_MPORT_data; // @[Cache.scala 25:36]
  wire [5:0] mem_1_0_MPORT_addr; // @[Cache.scala 25:36]
  wire  mem_1_0_MPORT_mask; // @[Cache.scala 25:36]
  wire  mem_1_0_MPORT_en; // @[Cache.scala 25:36]
  reg  mem_1_0_memOut_MPORT_1_en_pipe_0;
  reg [5:0] mem_1_0_memOut_MPORT_1_addr_pipe_0;
  reg [31:0] mem_1_1 [0:43]; // @[Cache.scala 25:36]
  wire  mem_1_1_memOut_MPORT_1_en; // @[Cache.scala 25:36]
  wire [5:0] mem_1_1_memOut_MPORT_1_addr; // @[Cache.scala 25:36]
  wire [31:0] mem_1_1_memOut_MPORT_1_data; // @[Cache.scala 25:36]
  wire [31:0] mem_1_1_MPORT_data; // @[Cache.scala 25:36]
  wire [5:0] mem_1_1_MPORT_addr; // @[Cache.scala 25:36]
  wire  mem_1_1_MPORT_mask; // @[Cache.scala 25:36]
  wire  mem_1_1_MPORT_en; // @[Cache.scala 25:36]
  reg  mem_1_1_memOut_MPORT_1_en_pipe_0;
  reg [5:0] mem_1_1_memOut_MPORT_1_addr_pipe_0;
  reg [31:0] mem_1_2 [0:43]; // @[Cache.scala 25:36]
  wire  mem_1_2_memOut_MPORT_1_en; // @[Cache.scala 25:36]
  wire [5:0] mem_1_2_memOut_MPORT_1_addr; // @[Cache.scala 25:36]
  wire [31:0] mem_1_2_memOut_MPORT_1_data; // @[Cache.scala 25:36]
  wire [31:0] mem_1_2_MPORT_data; // @[Cache.scala 25:36]
  wire [5:0] mem_1_2_MPORT_addr; // @[Cache.scala 25:36]
  wire  mem_1_2_MPORT_mask; // @[Cache.scala 25:36]
  wire  mem_1_2_MPORT_en; // @[Cache.scala 25:36]
  reg  mem_1_2_memOut_MPORT_1_en_pipe_0;
  reg [5:0] mem_1_2_memOut_MPORT_1_addr_pipe_0;
  reg [31:0] mem_1_3 [0:43]; // @[Cache.scala 25:36]
  wire  mem_1_3_memOut_MPORT_1_en; // @[Cache.scala 25:36]
  wire [5:0] mem_1_3_memOut_MPORT_1_addr; // @[Cache.scala 25:36]
  wire [31:0] mem_1_3_memOut_MPORT_1_data; // @[Cache.scala 25:36]
  wire [31:0] mem_1_3_MPORT_data; // @[Cache.scala 25:36]
  wire [5:0] mem_1_3_MPORT_addr; // @[Cache.scala 25:36]
  wire  mem_1_3_MPORT_mask; // @[Cache.scala 25:36]
  wire  mem_1_3_MPORT_en; // @[Cache.scala 25:36]
  reg  mem_1_3_memOut_MPORT_1_en_pipe_0;
  reg [5:0] mem_1_3_memOut_MPORT_1_addr_pipe_0;
  wire  bank = write_x[2]; // @[Cache.scala 28:23]
  wire [3:0] _T = 4'h1 << write_y; // @[OneHot.scala 57:35]
  wire  _GEN_29 = bank ? 1'h0 : 1'h1; // @[Cache.scala 31:16 25:36]
  wire  evenBankIsToTheRight = in_x[2] & (in_x[1] | in_x[0]); // @[Cache.scala 47:38]
  wire  oddBankIsToTheLeft = in_x[2:0] == 3'h0; // @[Cache.scala 48:38]
  wire [5:0] _memOut_T_2 = in_x[8:3] + 6'h1; // @[Cache.scala 50:53]
  wire [5:0] _memOut_T_9 = in_x[8:3] - 6'h1; // @[Cache.scala 50:120]
  reg  shuffledLines_REG; // @[Cache.scala 54:58]
  wire [31:0] memOut_3 = mem_0_3_memOut_MPORT_data; // @[Cache.scala 49:{35,35}]
  wire [31:0] memOut_1 = mem_0_1_memOut_MPORT_data; // @[Cache.scala 49:{35,35}]
  wire [31:0] _GEN_67 = shuffledLines_REG ? memOut_1 : memOut_3; // @[Helpers.scala 19:{33,33}]
  wire [7:0] shuffledLinesBytes_0_0_0 = {_GEN_67[7],_GEN_67[6],_GEN_67[5],_GEN_67[4],_GEN_67[3],_GEN_67[2],_GEN_67[1],
    _GEN_67[0]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_0_0_1 = {_GEN_67[15],_GEN_67[14],_GEN_67[13],_GEN_67[12],_GEN_67[11],_GEN_67[10],_GEN_67
    [9],_GEN_67[8]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_0_0_2 = {_GEN_67[23],_GEN_67[22],_GEN_67[21],_GEN_67[20],_GEN_67[19],_GEN_67[18],_GEN_67
    [17],_GEN_67[16]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_0_0_3 = {_GEN_67[31],_GEN_67[30],_GEN_67[29],_GEN_67[28],_GEN_67[27],_GEN_67[26],_GEN_67
    [25],_GEN_67[24]}; // @[Helpers.scala 19:78]
  wire [31:0] memOut_0 = mem_0_0_memOut_MPORT_data; // @[Cache.scala 49:{35,35}]
  wire [31:0] memOut_2 = mem_0_2_memOut_MPORT_data; // @[Cache.scala 49:{35,35}]
  wire [31:0] _GEN_69 = shuffledLines_REG ? memOut_2 : memOut_0; // @[Helpers.scala 19:{33,33}]
  wire [7:0] shuffledLinesBytes_0_1_0 = {_GEN_69[7],_GEN_69[6],_GEN_69[5],_GEN_69[4],_GEN_69[3],_GEN_69[2],_GEN_69[1],
    _GEN_69[0]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_0_1_1 = {_GEN_69[15],_GEN_69[14],_GEN_69[13],_GEN_69[12],_GEN_69[11],_GEN_69[10],_GEN_69
    [9],_GEN_69[8]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_0_1_2 = {_GEN_69[23],_GEN_69[22],_GEN_69[21],_GEN_69[20],_GEN_69[19],_GEN_69[18],_GEN_69
    [17],_GEN_69[16]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_0_1_3 = {_GEN_69[31],_GEN_69[30],_GEN_69[29],_GEN_69[28],_GEN_69[27],_GEN_69[26],_GEN_69
    [25],_GEN_69[24]}; // @[Helpers.scala 19:78]
  wire [31:0] _GEN_71 = shuffledLines_REG ? memOut_3 : memOut_1; // @[Helpers.scala 19:{33,33}]
  wire [7:0] shuffledLinesBytes_0_2_0 = {_GEN_71[7],_GEN_71[6],_GEN_71[5],_GEN_71[4],_GEN_71[3],_GEN_71[2],_GEN_71[1],
    _GEN_71[0]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_0_2_1 = {_GEN_71[15],_GEN_71[14],_GEN_71[13],_GEN_71[12],_GEN_71[11],_GEN_71[10],_GEN_71
    [9],_GEN_71[8]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_0_2_2 = {_GEN_71[23],_GEN_71[22],_GEN_71[21],_GEN_71[20],_GEN_71[19],_GEN_71[18],_GEN_71
    [17],_GEN_71[16]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_0_2_3 = {_GEN_71[31],_GEN_71[30],_GEN_71[29],_GEN_71[28],_GEN_71[27],_GEN_71[26],_GEN_71
    [25],_GEN_71[24]}; // @[Helpers.scala 19:78]
  wire [31:0] _GEN_73 = shuffledLines_REG ? memOut_0 : memOut_2; // @[Helpers.scala 19:{33,33}]
  wire [7:0] shuffledLinesBytes_0_3_0 = {_GEN_73[7],_GEN_73[6],_GEN_73[5],_GEN_73[4],_GEN_73[3],_GEN_73[2],_GEN_73[1],
    _GEN_73[0]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_0_3_1 = {_GEN_73[15],_GEN_73[14],_GEN_73[13],_GEN_73[12],_GEN_73[11],_GEN_73[10],_GEN_73
    [9],_GEN_73[8]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_0_3_2 = {_GEN_73[23],_GEN_73[22],_GEN_73[21],_GEN_73[20],_GEN_73[19],_GEN_73[18],_GEN_73
    [17],_GEN_73[16]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_0_3_3 = {_GEN_73[31],_GEN_73[30],_GEN_73[29],_GEN_73[28],_GEN_73[27],_GEN_73[26],_GEN_73
    [25],_GEN_73[24]}; // @[Helpers.scala 19:78]
  reg [2:0] columnSelects_1; // @[Cache.scala 57:21]
  wire [2:0] columnSelects_0 = columnSelects_1 - 3'h1; // @[Cache.scala 58:32]
  wire [2:0] columnSelects_2 = columnSelects_1 + 3'h1; // @[Cache.scala 58:50]
  wire [7:0] _GEN_75 = 2'h1 == columnSelects_0[1:0] ? shuffledLinesBytes_0_0_1 : shuffledLinesBytes_0_0_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_76 = 2'h2 == columnSelects_0[1:0] ? shuffledLinesBytes_0_0_2 : _GEN_75; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_77 = 2'h3 == columnSelects_0[1:0] ? shuffledLinesBytes_0_0_3 : _GEN_76; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_79 = 2'h1 == columnSelects_0[1:0] ? shuffledLinesBytes_0_1_1 : shuffledLinesBytes_0_1_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_80 = 2'h2 == columnSelects_0[1:0] ? shuffledLinesBytes_0_1_2 : _GEN_79; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_81 = 2'h3 == columnSelects_0[1:0] ? shuffledLinesBytes_0_1_3 : _GEN_80; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_83 = 2'h1 == columnSelects_0[1:0] ? shuffledLinesBytes_0_2_1 : shuffledLinesBytes_0_2_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_84 = 2'h2 == columnSelects_0[1:0] ? shuffledLinesBytes_0_2_2 : _GEN_83; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_85 = 2'h3 == columnSelects_0[1:0] ? shuffledLinesBytes_0_2_3 : _GEN_84; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_87 = 2'h1 == columnSelects_0[1:0] ? shuffledLinesBytes_0_3_1 : shuffledLinesBytes_0_3_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_88 = 2'h2 == columnSelects_0[1:0] ? shuffledLinesBytes_0_3_2 : _GEN_87; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_89 = 2'h3 == columnSelects_0[1:0] ? shuffledLinesBytes_0_3_3 : _GEN_88; // @[Helpers.scala 8:{53,53}]
  wire [31:0] memOut_7 = mem_1_3_memOut_MPORT_1_data; // @[Cache.scala 49:{35,35}]
  wire [31:0] memOut_5 = mem_1_1_memOut_MPORT_1_data; // @[Cache.scala 49:{35,35}]
  wire [31:0] _GEN_91 = shuffledLines_REG ? memOut_5 : memOut_7; // @[Helpers.scala 19:{33,33}]
  wire [7:0] shuffledLinesBytes_1_0_0 = {_GEN_91[7],_GEN_91[6],_GEN_91[5],_GEN_91[4],_GEN_91[3],_GEN_91[2],_GEN_91[1],
    _GEN_91[0]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_1_0_1 = {_GEN_91[15],_GEN_91[14],_GEN_91[13],_GEN_91[12],_GEN_91[11],_GEN_91[10],_GEN_91
    [9],_GEN_91[8]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_1_0_2 = {_GEN_91[23],_GEN_91[22],_GEN_91[21],_GEN_91[20],_GEN_91[19],_GEN_91[18],_GEN_91
    [17],_GEN_91[16]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_1_0_3 = {_GEN_91[31],_GEN_91[30],_GEN_91[29],_GEN_91[28],_GEN_91[27],_GEN_91[26],_GEN_91
    [25],_GEN_91[24]}; // @[Helpers.scala 19:78]
  wire [31:0] memOut_4 = mem_1_0_memOut_MPORT_1_data; // @[Cache.scala 49:{35,35}]
  wire [31:0] memOut_6 = mem_1_2_memOut_MPORT_1_data; // @[Cache.scala 49:{35,35}]
  wire [31:0] _GEN_93 = shuffledLines_REG ? memOut_6 : memOut_4; // @[Helpers.scala 19:{33,33}]
  wire [7:0] shuffledLinesBytes_1_1_0 = {_GEN_93[7],_GEN_93[6],_GEN_93[5],_GEN_93[4],_GEN_93[3],_GEN_93[2],_GEN_93[1],
    _GEN_93[0]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_1_1_1 = {_GEN_93[15],_GEN_93[14],_GEN_93[13],_GEN_93[12],_GEN_93[11],_GEN_93[10],_GEN_93
    [9],_GEN_93[8]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_1_1_2 = {_GEN_93[23],_GEN_93[22],_GEN_93[21],_GEN_93[20],_GEN_93[19],_GEN_93[18],_GEN_93
    [17],_GEN_93[16]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_1_1_3 = {_GEN_93[31],_GEN_93[30],_GEN_93[29],_GEN_93[28],_GEN_93[27],_GEN_93[26],_GEN_93
    [25],_GEN_93[24]}; // @[Helpers.scala 19:78]
  wire [31:0] _GEN_95 = shuffledLines_REG ? memOut_7 : memOut_5; // @[Helpers.scala 19:{33,33}]
  wire [7:0] shuffledLinesBytes_1_2_0 = {_GEN_95[7],_GEN_95[6],_GEN_95[5],_GEN_95[4],_GEN_95[3],_GEN_95[2],_GEN_95[1],
    _GEN_95[0]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_1_2_1 = {_GEN_95[15],_GEN_95[14],_GEN_95[13],_GEN_95[12],_GEN_95[11],_GEN_95[10],_GEN_95
    [9],_GEN_95[8]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_1_2_2 = {_GEN_95[23],_GEN_95[22],_GEN_95[21],_GEN_95[20],_GEN_95[19],_GEN_95[18],_GEN_95
    [17],_GEN_95[16]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_1_2_3 = {_GEN_95[31],_GEN_95[30],_GEN_95[29],_GEN_95[28],_GEN_95[27],_GEN_95[26],_GEN_95
    [25],_GEN_95[24]}; // @[Helpers.scala 19:78]
  wire [31:0] _GEN_97 = shuffledLines_REG ? memOut_4 : memOut_6; // @[Helpers.scala 19:{33,33}]
  wire [7:0] shuffledLinesBytes_1_3_0 = {_GEN_97[7],_GEN_97[6],_GEN_97[5],_GEN_97[4],_GEN_97[3],_GEN_97[2],_GEN_97[1],
    _GEN_97[0]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_1_3_1 = {_GEN_97[15],_GEN_97[14],_GEN_97[13],_GEN_97[12],_GEN_97[11],_GEN_97[10],_GEN_97
    [9],_GEN_97[8]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_1_3_2 = {_GEN_97[23],_GEN_97[22],_GEN_97[21],_GEN_97[20],_GEN_97[19],_GEN_97[18],_GEN_97
    [17],_GEN_97[16]}; // @[Helpers.scala 19:78]
  wire [7:0] shuffledLinesBytes_1_3_3 = {_GEN_97[31],_GEN_97[30],_GEN_97[29],_GEN_97[28],_GEN_97[27],_GEN_97[26],_GEN_97
    [25],_GEN_97[24]}; // @[Helpers.scala 19:78]
  wire [7:0] _GEN_99 = 2'h1 == columnSelects_0[1:0] ? shuffledLinesBytes_1_0_1 : shuffledLinesBytes_1_0_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_100 = 2'h2 == columnSelects_0[1:0] ? shuffledLinesBytes_1_0_2 : _GEN_99; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_101 = 2'h3 == columnSelects_0[1:0] ? shuffledLinesBytes_1_0_3 : _GEN_100; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_103 = 2'h1 == columnSelects_0[1:0] ? shuffledLinesBytes_1_1_1 : shuffledLinesBytes_1_1_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_104 = 2'h2 == columnSelects_0[1:0] ? shuffledLinesBytes_1_1_2 : _GEN_103; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_105 = 2'h3 == columnSelects_0[1:0] ? shuffledLinesBytes_1_1_3 : _GEN_104; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_107 = 2'h1 == columnSelects_0[1:0] ? shuffledLinesBytes_1_2_1 : shuffledLinesBytes_1_2_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_108 = 2'h2 == columnSelects_0[1:0] ? shuffledLinesBytes_1_2_2 : _GEN_107; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_109 = 2'h3 == columnSelects_0[1:0] ? shuffledLinesBytes_1_2_3 : _GEN_108; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_111 = 2'h1 == columnSelects_0[1:0] ? shuffledLinesBytes_1_3_1 : shuffledLinesBytes_1_3_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_112 = 2'h2 == columnSelects_0[1:0] ? shuffledLinesBytes_1_3_2 : _GEN_111; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_113 = 2'h3 == columnSelects_0[1:0] ? shuffledLinesBytes_1_3_3 : _GEN_112; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_115 = 2'h1 == columnSelects_1[1:0] ? shuffledLinesBytes_0_0_1 : shuffledLinesBytes_0_0_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_116 = 2'h2 == columnSelects_1[1:0] ? shuffledLinesBytes_0_0_2 : _GEN_115; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_117 = 2'h3 == columnSelects_1[1:0] ? shuffledLinesBytes_0_0_3 : _GEN_116; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_119 = 2'h1 == columnSelects_1[1:0] ? shuffledLinesBytes_0_1_1 : shuffledLinesBytes_0_1_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_120 = 2'h2 == columnSelects_1[1:0] ? shuffledLinesBytes_0_1_2 : _GEN_119; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_121 = 2'h3 == columnSelects_1[1:0] ? shuffledLinesBytes_0_1_3 : _GEN_120; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_123 = 2'h1 == columnSelects_1[1:0] ? shuffledLinesBytes_0_2_1 : shuffledLinesBytes_0_2_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_124 = 2'h2 == columnSelects_1[1:0] ? shuffledLinesBytes_0_2_2 : _GEN_123; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_125 = 2'h3 == columnSelects_1[1:0] ? shuffledLinesBytes_0_2_3 : _GEN_124; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_127 = 2'h1 == columnSelects_1[1:0] ? shuffledLinesBytes_0_3_1 : shuffledLinesBytes_0_3_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_128 = 2'h2 == columnSelects_1[1:0] ? shuffledLinesBytes_0_3_2 : _GEN_127; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_129 = 2'h3 == columnSelects_1[1:0] ? shuffledLinesBytes_0_3_3 : _GEN_128; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_131 = 2'h1 == columnSelects_1[1:0] ? shuffledLinesBytes_1_0_1 : shuffledLinesBytes_1_0_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_132 = 2'h2 == columnSelects_1[1:0] ? shuffledLinesBytes_1_0_2 : _GEN_131; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_133 = 2'h3 == columnSelects_1[1:0] ? shuffledLinesBytes_1_0_3 : _GEN_132; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_135 = 2'h1 == columnSelects_1[1:0] ? shuffledLinesBytes_1_1_1 : shuffledLinesBytes_1_1_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_136 = 2'h2 == columnSelects_1[1:0] ? shuffledLinesBytes_1_1_2 : _GEN_135; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_137 = 2'h3 == columnSelects_1[1:0] ? shuffledLinesBytes_1_1_3 : _GEN_136; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_139 = 2'h1 == columnSelects_1[1:0] ? shuffledLinesBytes_1_2_1 : shuffledLinesBytes_1_2_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_140 = 2'h2 == columnSelects_1[1:0] ? shuffledLinesBytes_1_2_2 : _GEN_139; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_141 = 2'h3 == columnSelects_1[1:0] ? shuffledLinesBytes_1_2_3 : _GEN_140; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_143 = 2'h1 == columnSelects_1[1:0] ? shuffledLinesBytes_1_3_1 : shuffledLinesBytes_1_3_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_144 = 2'h2 == columnSelects_1[1:0] ? shuffledLinesBytes_1_3_2 : _GEN_143; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_145 = 2'h3 == columnSelects_1[1:0] ? shuffledLinesBytes_1_3_3 : _GEN_144; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_147 = 2'h1 == columnSelects_2[1:0] ? shuffledLinesBytes_0_0_1 : shuffledLinesBytes_0_0_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_148 = 2'h2 == columnSelects_2[1:0] ? shuffledLinesBytes_0_0_2 : _GEN_147; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_149 = 2'h3 == columnSelects_2[1:0] ? shuffledLinesBytes_0_0_3 : _GEN_148; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_151 = 2'h1 == columnSelects_2[1:0] ? shuffledLinesBytes_0_1_1 : shuffledLinesBytes_0_1_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_152 = 2'h2 == columnSelects_2[1:0] ? shuffledLinesBytes_0_1_2 : _GEN_151; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_153 = 2'h3 == columnSelects_2[1:0] ? shuffledLinesBytes_0_1_3 : _GEN_152; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_155 = 2'h1 == columnSelects_2[1:0] ? shuffledLinesBytes_0_2_1 : shuffledLinesBytes_0_2_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_156 = 2'h2 == columnSelects_2[1:0] ? shuffledLinesBytes_0_2_2 : _GEN_155; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_157 = 2'h3 == columnSelects_2[1:0] ? shuffledLinesBytes_0_2_3 : _GEN_156; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_159 = 2'h1 == columnSelects_2[1:0] ? shuffledLinesBytes_0_3_1 : shuffledLinesBytes_0_3_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_160 = 2'h2 == columnSelects_2[1:0] ? shuffledLinesBytes_0_3_2 : _GEN_159; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_161 = 2'h3 == columnSelects_2[1:0] ? shuffledLinesBytes_0_3_3 : _GEN_160; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_163 = 2'h1 == columnSelects_2[1:0] ? shuffledLinesBytes_1_0_1 : shuffledLinesBytes_1_0_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_164 = 2'h2 == columnSelects_2[1:0] ? shuffledLinesBytes_1_0_2 : _GEN_163; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_165 = 2'h3 == columnSelects_2[1:0] ? shuffledLinesBytes_1_0_3 : _GEN_164; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_167 = 2'h1 == columnSelects_2[1:0] ? shuffledLinesBytes_1_1_1 : shuffledLinesBytes_1_1_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_168 = 2'h2 == columnSelects_2[1:0] ? shuffledLinesBytes_1_1_2 : _GEN_167; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_169 = 2'h3 == columnSelects_2[1:0] ? shuffledLinesBytes_1_1_3 : _GEN_168; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_171 = 2'h1 == columnSelects_2[1:0] ? shuffledLinesBytes_1_2_1 : shuffledLinesBytes_1_2_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_172 = 2'h2 == columnSelects_2[1:0] ? shuffledLinesBytes_1_2_2 : _GEN_171; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_173 = 2'h3 == columnSelects_2[1:0] ? shuffledLinesBytes_1_2_3 : _GEN_172; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_175 = 2'h1 == columnSelects_2[1:0] ? shuffledLinesBytes_1_3_1 : shuffledLinesBytes_1_3_0; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_176 = 2'h2 == columnSelects_2[1:0] ? shuffledLinesBytes_1_3_2 : _GEN_175; // @[Helpers.scala 8:{53,53}]
  wire [7:0] _GEN_177 = 2'h3 == columnSelects_2[1:0] ? shuffledLinesBytes_1_3_3 : _GEN_176; // @[Helpers.scala 8:{53,53}]
  wire [7:0] window_0_0 = columnSelects_0[2] ? _GEN_101 : _GEN_77; // @[Helpers.scala 8:{53,53}]
  wire [7:0] window_0_1 = columnSelects_1[2] ? _GEN_133 : _GEN_117; // @[Helpers.scala 8:{53,53}]
  wire [7:0] window_0_2 = columnSelects_2[2] ? _GEN_165 : _GEN_149; // @[Helpers.scala 8:{53,53}]
  wire [7:0] window_1_0 = columnSelects_0[2] ? _GEN_105 : _GEN_81; // @[Helpers.scala 8:{53,53}]
  wire [7:0] window_1_1 = columnSelects_1[2] ? _GEN_137 : _GEN_121; // @[Helpers.scala 8:{53,53}]
  wire [7:0] window_1_2 = columnSelects_2[2] ? _GEN_169 : _GEN_153; // @[Helpers.scala 8:{53,53}]
  wire [7:0] window_2_0 = columnSelects_0[2] ? _GEN_109 : _GEN_85; // @[Helpers.scala 8:{53,53}]
  wire [7:0] window_2_1 = columnSelects_1[2] ? _GEN_141 : _GEN_125; // @[Helpers.scala 8:{53,53}]
  wire [7:0] window_2_2 = columnSelects_2[2] ? _GEN_173 : _GEN_157; // @[Helpers.scala 8:{53,53}]
  wire [7:0] window_3_0 = columnSelects_0[2] ? _GEN_113 : _GEN_89; // @[Helpers.scala 8:{53,53}]
  wire [7:0] window_3_1 = columnSelects_1[2] ? _GEN_145 : _GEN_129; // @[Helpers.scala 8:{53,53}]
  wire [7:0] window_3_2 = columnSelects_2[2] ? _GEN_177 : _GEN_161; // @[Helpers.scala 8:{53,53}]
  wire  topEdge = in_y == 9'h0; // @[Cache.scala 63:22]
  wire  bottomEdge = in_y == 9'h11f; // @[Cache.scala 64:25]
  wire  leftEdge = in_x == 9'h0; // @[Cache.scala 65:23]
  wire  rightEdge = in_x == 9'h15f; // @[Cache.scala 66:24]
  wire  _T_10 = topEdge & leftEdge; // @[Cache.scala 70:20]
  wire  _T_11 = topEdge & rightEdge; // @[Cache.scala 72:20]
  wire  _T_12 = bottomEdge & leftEdge; // @[Cache.scala 85:23]
  wire  _T_13 = bottomEdge & rightEdge; // @[Cache.scala 87:23]
  wire [7:0] _T_14 = leftEdge ? window_0_1 : window_0_0; // @[Mux.scala 101:16]
  wire [7:0] _T_15 = topEdge ? window_1_0 : _T_14; // @[Mux.scala 101:16]
  wire [7:0] _T_18 = rightEdge ? window_0_1 : window_0_2; // @[Mux.scala 101:16]
  wire [7:0] _T_19 = topEdge ? window_1_2 : _T_18; // @[Mux.scala 101:16]
  wire [7:0] _T_25 = leftEdge ? window_3_1 : window_3_0; // @[Mux.scala 101:16]
  wire [7:0] _T_26 = bottomEdge ? window_2_0 : _T_25; // @[Mux.scala 101:16]
  wire [7:0] _T_29 = rightEdge ? window_3_1 : window_3_2; // @[Mux.scala 101:16]
  wire [7:0] _T_30 = bottomEdge ? window_2_2 : _T_29; // @[Mux.scala 101:16]
  reg  out_valid_REG; // @[Cache.scala 92:23]
  assign mem_0_0_memOut_MPORT_en = mem_0_0_memOut_MPORT_en_pipe_0;
  assign mem_0_0_memOut_MPORT_addr = mem_0_0_memOut_MPORT_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_0_0_memOut_MPORT_data = mem_0_0[mem_0_0_memOut_MPORT_addr]; // @[Cache.scala 25:36]
  `else
  assign mem_0_0_memOut_MPORT_data = mem_0_0_memOut_MPORT_addr >= 6'h2c ? _RAND_1[31:0] :
    mem_0_0[mem_0_0_memOut_MPORT_addr]; // @[Cache.scala 25:36]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem_0_0_MPORT_1_data = write_data;
  assign mem_0_0_MPORT_1_addr = write_x[8:3];
  assign mem_0_0_MPORT_1_mask = _T[0];
  assign mem_0_0_MPORT_1_en = write_enable & _GEN_29;
  assign mem_0_1_memOut_MPORT_en = mem_0_1_memOut_MPORT_en_pipe_0;
  assign mem_0_1_memOut_MPORT_addr = mem_0_1_memOut_MPORT_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_0_1_memOut_MPORT_data = mem_0_1[mem_0_1_memOut_MPORT_addr]; // @[Cache.scala 25:36]
  `else
  assign mem_0_1_memOut_MPORT_data = mem_0_1_memOut_MPORT_addr >= 6'h2c ? _RAND_5[31:0] :
    mem_0_1[mem_0_1_memOut_MPORT_addr]; // @[Cache.scala 25:36]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem_0_1_MPORT_1_data = write_data;
  assign mem_0_1_MPORT_1_addr = write_x[8:3];
  assign mem_0_1_MPORT_1_mask = _T[1];
  assign mem_0_1_MPORT_1_en = write_enable & _GEN_29;
  assign mem_0_2_memOut_MPORT_en = mem_0_2_memOut_MPORT_en_pipe_0;
  assign mem_0_2_memOut_MPORT_addr = mem_0_2_memOut_MPORT_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_0_2_memOut_MPORT_data = mem_0_2[mem_0_2_memOut_MPORT_addr]; // @[Cache.scala 25:36]
  `else
  assign mem_0_2_memOut_MPORT_data = mem_0_2_memOut_MPORT_addr >= 6'h2c ? _RAND_9[31:0] :
    mem_0_2[mem_0_2_memOut_MPORT_addr]; // @[Cache.scala 25:36]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem_0_2_MPORT_1_data = write_data;
  assign mem_0_2_MPORT_1_addr = write_x[8:3];
  assign mem_0_2_MPORT_1_mask = _T[2];
  assign mem_0_2_MPORT_1_en = write_enable & _GEN_29;
  assign mem_0_3_memOut_MPORT_en = mem_0_3_memOut_MPORT_en_pipe_0;
  assign mem_0_3_memOut_MPORT_addr = mem_0_3_memOut_MPORT_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_0_3_memOut_MPORT_data = mem_0_3[mem_0_3_memOut_MPORT_addr]; // @[Cache.scala 25:36]
  `else
  assign mem_0_3_memOut_MPORT_data = mem_0_3_memOut_MPORT_addr >= 6'h2c ? _RAND_13[31:0] :
    mem_0_3[mem_0_3_memOut_MPORT_addr]; // @[Cache.scala 25:36]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem_0_3_MPORT_1_data = write_data;
  assign mem_0_3_MPORT_1_addr = write_x[8:3];
  assign mem_0_3_MPORT_1_mask = _T[3];
  assign mem_0_3_MPORT_1_en = write_enable & _GEN_29;
  assign mem_1_0_memOut_MPORT_1_en = mem_1_0_memOut_MPORT_1_en_pipe_0;
  assign mem_1_0_memOut_MPORT_1_addr = mem_1_0_memOut_MPORT_1_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_1_0_memOut_MPORT_1_data = mem_1_0[mem_1_0_memOut_MPORT_1_addr]; // @[Cache.scala 25:36]
  `else
  assign mem_1_0_memOut_MPORT_1_data = mem_1_0_memOut_MPORT_1_addr >= 6'h2c ? _RAND_17[31:0] :
    mem_1_0[mem_1_0_memOut_MPORT_1_addr]; // @[Cache.scala 25:36]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem_1_0_MPORT_data = write_data;
  assign mem_1_0_MPORT_addr = write_x[8:3];
  assign mem_1_0_MPORT_mask = _T[0];
  assign mem_1_0_MPORT_en = write_enable & bank;
  assign mem_1_1_memOut_MPORT_1_en = mem_1_1_memOut_MPORT_1_en_pipe_0;
  assign mem_1_1_memOut_MPORT_1_addr = mem_1_1_memOut_MPORT_1_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_1_1_memOut_MPORT_1_data = mem_1_1[mem_1_1_memOut_MPORT_1_addr]; // @[Cache.scala 25:36]
  `else
  assign mem_1_1_memOut_MPORT_1_data = mem_1_1_memOut_MPORT_1_addr >= 6'h2c ? _RAND_21[31:0] :
    mem_1_1[mem_1_1_memOut_MPORT_1_addr]; // @[Cache.scala 25:36]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem_1_1_MPORT_data = write_data;
  assign mem_1_1_MPORT_addr = write_x[8:3];
  assign mem_1_1_MPORT_mask = _T[1];
  assign mem_1_1_MPORT_en = write_enable & bank;
  assign mem_1_2_memOut_MPORT_1_en = mem_1_2_memOut_MPORT_1_en_pipe_0;
  assign mem_1_2_memOut_MPORT_1_addr = mem_1_2_memOut_MPORT_1_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_1_2_memOut_MPORT_1_data = mem_1_2[mem_1_2_memOut_MPORT_1_addr]; // @[Cache.scala 25:36]
  `else
  assign mem_1_2_memOut_MPORT_1_data = mem_1_2_memOut_MPORT_1_addr >= 6'h2c ? _RAND_25[31:0] :
    mem_1_2[mem_1_2_memOut_MPORT_1_addr]; // @[Cache.scala 25:36]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem_1_2_MPORT_data = write_data;
  assign mem_1_2_MPORT_addr = write_x[8:3];
  assign mem_1_2_MPORT_mask = _T[2];
  assign mem_1_2_MPORT_en = write_enable & bank;
  assign mem_1_3_memOut_MPORT_1_en = mem_1_3_memOut_MPORT_1_en_pipe_0;
  assign mem_1_3_memOut_MPORT_1_addr = mem_1_3_memOut_MPORT_1_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_1_3_memOut_MPORT_1_data = mem_1_3[mem_1_3_memOut_MPORT_1_addr]; // @[Cache.scala 25:36]
  `else
  assign mem_1_3_memOut_MPORT_1_data = mem_1_3_memOut_MPORT_1_addr >= 6'h2c ? _RAND_29[31:0] :
    mem_1_3[mem_1_3_memOut_MPORT_1_addr]; // @[Cache.scala 25:36]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem_1_3_MPORT_data = write_data;
  assign mem_1_3_MPORT_addr = write_x[8:3];
  assign mem_1_3_MPORT_mask = _T[3];
  assign mem_1_3_MPORT_en = write_enable & bank;
  assign out_window_0_0 = _T_10 ? window_1_1 : _T_15; // @[Mux.scala 101:16]
  assign out_window_0_1 = topEdge ? window_1_1 : window_0_1; // @[Mux.scala 101:16]
  assign out_window_0_2 = _T_11 ? window_1_1 : _T_19; // @[Mux.scala 101:16]
  assign out_window_1_0 = leftEdge ? window_1_1 : window_1_0; // @[Mux.scala 101:16]
  assign out_window_1_1 = columnSelects_1[2] ? _GEN_137 : _GEN_121; // @[Helpers.scala 8:{53,53}]
  assign out_window_1_2 = rightEdge ? window_1_1 : window_1_2; // @[Mux.scala 101:16]
  assign out_window_2_0 = leftEdge ? window_2_1 : window_2_0; // @[Mux.scala 101:16]
  assign out_window_2_1 = columnSelects_1[2] ? _GEN_141 : _GEN_125; // @[Helpers.scala 8:{53,53}]
  assign out_window_2_2 = rightEdge ? window_2_1 : window_2_2; // @[Mux.scala 101:16]
  assign out_window_3_0 = _T_12 ? window_2_1 : _T_26; // @[Mux.scala 101:16]
  assign out_window_3_1 = bottomEdge ? window_2_1 : window_3_1; // @[Mux.scala 101:16]
  assign out_window_3_2 = _T_13 ? window_2_1 : _T_30; // @[Mux.scala 101:16]
  assign out_valid = out_valid_REG; // @[Cache.scala 92:13]
  always @(posedge clock) begin
    if (mem_0_0_MPORT_1_en & mem_0_0_MPORT_1_mask) begin
      mem_0_0[mem_0_0_MPORT_1_addr] <= mem_0_0_MPORT_1_data; // @[Cache.scala 25:36]
    end
    mem_0_0_memOut_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      if (evenBankIsToTheRight) begin
        mem_0_0_memOut_MPORT_addr_pipe_0 <= _memOut_T_2;
      end else begin
        mem_0_0_memOut_MPORT_addr_pipe_0 <= in_x[8:3];
      end
    end
    if (mem_0_1_MPORT_1_en & mem_0_1_MPORT_1_mask) begin
      mem_0_1[mem_0_1_MPORT_1_addr] <= mem_0_1_MPORT_1_data; // @[Cache.scala 25:36]
    end
    mem_0_1_memOut_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      if (evenBankIsToTheRight) begin
        mem_0_1_memOut_MPORT_addr_pipe_0 <= _memOut_T_2;
      end else begin
        mem_0_1_memOut_MPORT_addr_pipe_0 <= in_x[8:3];
      end
    end
    if (mem_0_2_MPORT_1_en & mem_0_2_MPORT_1_mask) begin
      mem_0_2[mem_0_2_MPORT_1_addr] <= mem_0_2_MPORT_1_data; // @[Cache.scala 25:36]
    end
    mem_0_2_memOut_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      if (evenBankIsToTheRight) begin
        mem_0_2_memOut_MPORT_addr_pipe_0 <= _memOut_T_2;
      end else begin
        mem_0_2_memOut_MPORT_addr_pipe_0 <= in_x[8:3];
      end
    end
    if (mem_0_3_MPORT_1_en & mem_0_3_MPORT_1_mask) begin
      mem_0_3[mem_0_3_MPORT_1_addr] <= mem_0_3_MPORT_1_data; // @[Cache.scala 25:36]
    end
    mem_0_3_memOut_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      if (evenBankIsToTheRight) begin
        mem_0_3_memOut_MPORT_addr_pipe_0 <= _memOut_T_2;
      end else begin
        mem_0_3_memOut_MPORT_addr_pipe_0 <= in_x[8:3];
      end
    end
    if (mem_1_0_MPORT_en & mem_1_0_MPORT_mask) begin
      mem_1_0[mem_1_0_MPORT_addr] <= mem_1_0_MPORT_data; // @[Cache.scala 25:36]
    end
    mem_1_0_memOut_MPORT_1_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      if (oddBankIsToTheLeft) begin
        mem_1_0_memOut_MPORT_1_addr_pipe_0 <= _memOut_T_9;
      end else begin
        mem_1_0_memOut_MPORT_1_addr_pipe_0 <= in_x[8:3];
      end
    end
    if (mem_1_1_MPORT_en & mem_1_1_MPORT_mask) begin
      mem_1_1[mem_1_1_MPORT_addr] <= mem_1_1_MPORT_data; // @[Cache.scala 25:36]
    end
    mem_1_1_memOut_MPORT_1_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      if (oddBankIsToTheLeft) begin
        mem_1_1_memOut_MPORT_1_addr_pipe_0 <= _memOut_T_9;
      end else begin
        mem_1_1_memOut_MPORT_1_addr_pipe_0 <= in_x[8:3];
      end
    end
    if (mem_1_2_MPORT_en & mem_1_2_MPORT_mask) begin
      mem_1_2[mem_1_2_MPORT_addr] <= mem_1_2_MPORT_data; // @[Cache.scala 25:36]
    end
    mem_1_2_memOut_MPORT_1_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      if (oddBankIsToTheLeft) begin
        mem_1_2_memOut_MPORT_1_addr_pipe_0 <= _memOut_T_9;
      end else begin
        mem_1_2_memOut_MPORT_1_addr_pipe_0 <= in_x[8:3];
      end
    end
    if (mem_1_3_MPORT_en & mem_1_3_MPORT_mask) begin
      mem_1_3[mem_1_3_MPORT_addr] <= mem_1_3_MPORT_data; // @[Cache.scala 25:36]
    end
    mem_1_3_memOut_MPORT_1_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      if (oddBankIsToTheLeft) begin
        mem_1_3_memOut_MPORT_1_addr_pipe_0 <= _memOut_T_9;
      end else begin
        mem_1_3_memOut_MPORT_1_addr_pipe_0 <= in_x[8:3];
      end
    end
    if (reset) begin // @[Cache.scala 54:58]
      shuffledLines_REG <= 1'h0; // @[Cache.scala 54:58]
    end else begin
      shuffledLines_REG <= in_y[1]; // @[Cache.scala 54:58]
    end
    if (reset) begin // @[Cache.scala 57:21]
      columnSelects_1 <= 3'h0; // @[Cache.scala 57:21]
    end else begin
      columnSelects_1 <= in_x[2:0]; // @[Cache.scala 57:21]
    end
    if (reset) begin // @[Cache.scala 92:23]
      out_valid_REG <= 1'h0; // @[Cache.scala 92:23]
    end else begin
      out_valid_REG <= in_valid; // @[Cache.scala 92:23]
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {1{`RANDOM}};
  _RAND_5 = {1{`RANDOM}};
  _RAND_9 = {1{`RANDOM}};
  _RAND_13 = {1{`RANDOM}};
  _RAND_17 = {1{`RANDOM}};
  _RAND_21 = {1{`RANDOM}};
  _RAND_25 = {1{`RANDOM}};
  _RAND_29 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 44; initvar = initvar+1)
    mem_0_0[initvar] = _RAND_0[31:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 44; initvar = initvar+1)
    mem_0_1[initvar] = _RAND_4[31:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 44; initvar = initvar+1)
    mem_0_2[initvar] = _RAND_8[31:0];
  _RAND_12 = {1{`RANDOM}};
  for (initvar = 0; initvar < 44; initvar = initvar+1)
    mem_0_3[initvar] = _RAND_12[31:0];
  _RAND_16 = {1{`RANDOM}};
  for (initvar = 0; initvar < 44; initvar = initvar+1)
    mem_1_0[initvar] = _RAND_16[31:0];
  _RAND_20 = {1{`RANDOM}};
  for (initvar = 0; initvar < 44; initvar = initvar+1)
    mem_1_1[initvar] = _RAND_20[31:0];
  _RAND_24 = {1{`RANDOM}};
  for (initvar = 0; initvar < 44; initvar = initvar+1)
    mem_1_2[initvar] = _RAND_24[31:0];
  _RAND_28 = {1{`RANDOM}};
  for (initvar = 0; initvar < 44; initvar = initvar+1)
    mem_1_3[initvar] = _RAND_28[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  mem_0_0_memOut_MPORT_en_pipe_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  mem_0_0_memOut_MPORT_addr_pipe_0 = _RAND_3[5:0];
  _RAND_6 = {1{`RANDOM}};
  mem_0_1_memOut_MPORT_en_pipe_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  mem_0_1_memOut_MPORT_addr_pipe_0 = _RAND_7[5:0];
  _RAND_10 = {1{`RANDOM}};
  mem_0_2_memOut_MPORT_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  mem_0_2_memOut_MPORT_addr_pipe_0 = _RAND_11[5:0];
  _RAND_14 = {1{`RANDOM}};
  mem_0_3_memOut_MPORT_en_pipe_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  mem_0_3_memOut_MPORT_addr_pipe_0 = _RAND_15[5:0];
  _RAND_18 = {1{`RANDOM}};
  mem_1_0_memOut_MPORT_1_en_pipe_0 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  mem_1_0_memOut_MPORT_1_addr_pipe_0 = _RAND_19[5:0];
  _RAND_22 = {1{`RANDOM}};
  mem_1_1_memOut_MPORT_1_en_pipe_0 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  mem_1_1_memOut_MPORT_1_addr_pipe_0 = _RAND_23[5:0];
  _RAND_26 = {1{`RANDOM}};
  mem_1_2_memOut_MPORT_1_en_pipe_0 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  mem_1_2_memOut_MPORT_1_addr_pipe_0 = _RAND_27[5:0];
  _RAND_30 = {1{`RANDOM}};
  mem_1_3_memOut_MPORT_1_en_pipe_0 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  mem_1_3_memOut_MPORT_1_addr_pipe_0 = _RAND_31[5:0];
  _RAND_32 = {1{`RANDOM}};
  shuffledLines_REG = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  columnSelects_1 = _RAND_33[2:0];
  _RAND_34 = {1{`RANDOM}};
  out_valid_REG = _RAND_34[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
