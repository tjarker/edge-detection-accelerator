module Cache(
  input         clock,
  input         reset,
  input  [8:0]  write_x,
  input  [1:0]  write_y,
  input  [31:0] write_data,
  input         write_enable,
  input  [8:0]  read_x,
  input  [1:0]  read_y,
  output [7:0]  read_window_0_0,
  output [7:0]  read_window_0_1,
  output [7:0]  read_window_0_2,
  output [7:0]  read_window_1_0,
  output [7:0]  read_window_1_1,
  output [7:0]  read_window_1_2,
  output [7:0]  read_window_2_0,
  output [7:0]  read_window_2_1,
  output [7:0]  read_window_2_2,
  output [7:0]  read_window_3_0,
  output [7:0]  read_window_3_1,
  output [7:0]  read_window_3_2
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
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem_0 [0:43]; // @[Cache.scala 21:24]
  wire  mem_0_memOut_en; // @[Cache.scala 21:24]
  wire [5:0] mem_0_memOut_addr; // @[Cache.scala 21:24]
  wire [31:0] mem_0_memOut_data; // @[Cache.scala 21:24]
  wire [31:0] mem_0_MPORT_data; // @[Cache.scala 21:24]
  wire [5:0] mem_0_MPORT_addr; // @[Cache.scala 21:24]
  wire  mem_0_MPORT_mask; // @[Cache.scala 21:24]
  wire  mem_0_MPORT_en; // @[Cache.scala 21:24]
  reg  mem_0_memOut_en_pipe_0;
  reg [5:0] mem_0_memOut_addr_pipe_0;
  reg [31:0] mem_1 [0:43]; // @[Cache.scala 21:24]
  wire  mem_1_memOut_en; // @[Cache.scala 21:24]
  wire [5:0] mem_1_memOut_addr; // @[Cache.scala 21:24]
  wire [31:0] mem_1_memOut_data; // @[Cache.scala 21:24]
  wire [31:0] mem_1_MPORT_data; // @[Cache.scala 21:24]
  wire [5:0] mem_1_MPORT_addr; // @[Cache.scala 21:24]
  wire  mem_1_MPORT_mask; // @[Cache.scala 21:24]
  wire  mem_1_MPORT_en; // @[Cache.scala 21:24]
  reg  mem_1_memOut_en_pipe_0;
  reg [5:0] mem_1_memOut_addr_pipe_0;
  reg [31:0] mem_2 [0:43]; // @[Cache.scala 21:24]
  wire  mem_2_memOut_en; // @[Cache.scala 21:24]
  wire [5:0] mem_2_memOut_addr; // @[Cache.scala 21:24]
  wire [31:0] mem_2_memOut_data; // @[Cache.scala 21:24]
  wire [31:0] mem_2_MPORT_data; // @[Cache.scala 21:24]
  wire [5:0] mem_2_MPORT_addr; // @[Cache.scala 21:24]
  wire  mem_2_MPORT_mask; // @[Cache.scala 21:24]
  wire  mem_2_MPORT_en; // @[Cache.scala 21:24]
  reg  mem_2_memOut_en_pipe_0;
  reg [5:0] mem_2_memOut_addr_pipe_0;
  reg [31:0] mem_3 [0:43]; // @[Cache.scala 21:24]
  wire  mem_3_memOut_en; // @[Cache.scala 21:24]
  wire [5:0] mem_3_memOut_addr; // @[Cache.scala 21:24]
  wire [31:0] mem_3_memOut_data; // @[Cache.scala 21:24]
  wire [31:0] mem_3_MPORT_data; // @[Cache.scala 21:24]
  wire [5:0] mem_3_MPORT_addr; // @[Cache.scala 21:24]
  wire  mem_3_MPORT_mask; // @[Cache.scala 21:24]
  wire  mem_3_MPORT_en; // @[Cache.scala 21:24]
  reg  mem_3_memOut_en_pipe_0;
  reg [5:0] mem_3_memOut_addr_pipe_0;
  reg [31:0] mem_4 [0:43]; // @[Cache.scala 21:24]
  wire  mem_4_memOut_en; // @[Cache.scala 21:24]
  wire [5:0] mem_4_memOut_addr; // @[Cache.scala 21:24]
  wire [31:0] mem_4_memOut_data; // @[Cache.scala 21:24]
  wire [31:0] mem_4_MPORT_data; // @[Cache.scala 21:24]
  wire [5:0] mem_4_MPORT_addr; // @[Cache.scala 21:24]
  wire  mem_4_MPORT_mask; // @[Cache.scala 21:24]
  wire  mem_4_MPORT_en; // @[Cache.scala 21:24]
  reg  mem_4_memOut_en_pipe_0;
  reg [5:0] mem_4_memOut_addr_pipe_0;
  reg [31:0] mem_5 [0:43]; // @[Cache.scala 21:24]
  wire  mem_5_memOut_en; // @[Cache.scala 21:24]
  wire [5:0] mem_5_memOut_addr; // @[Cache.scala 21:24]
  wire [31:0] mem_5_memOut_data; // @[Cache.scala 21:24]
  wire [31:0] mem_5_MPORT_data; // @[Cache.scala 21:24]
  wire [5:0] mem_5_MPORT_addr; // @[Cache.scala 21:24]
  wire  mem_5_MPORT_mask; // @[Cache.scala 21:24]
  wire  mem_5_MPORT_en; // @[Cache.scala 21:24]
  reg  mem_5_memOut_en_pipe_0;
  reg [5:0] mem_5_memOut_addr_pipe_0;
  reg [31:0] mem_6 [0:43]; // @[Cache.scala 21:24]
  wire  mem_6_memOut_en; // @[Cache.scala 21:24]
  wire [5:0] mem_6_memOut_addr; // @[Cache.scala 21:24]
  wire [31:0] mem_6_memOut_data; // @[Cache.scala 21:24]
  wire [31:0] mem_6_MPORT_data; // @[Cache.scala 21:24]
  wire [5:0] mem_6_MPORT_addr; // @[Cache.scala 21:24]
  wire  mem_6_MPORT_mask; // @[Cache.scala 21:24]
  wire  mem_6_MPORT_en; // @[Cache.scala 21:24]
  reg  mem_6_memOut_en_pipe_0;
  reg [5:0] mem_6_memOut_addr_pipe_0;
  reg [31:0] mem_7 [0:43]; // @[Cache.scala 21:24]
  wire  mem_7_memOut_en; // @[Cache.scala 21:24]
  wire [5:0] mem_7_memOut_addr; // @[Cache.scala 21:24]
  wire [31:0] mem_7_memOut_data; // @[Cache.scala 21:24]
  wire [31:0] mem_7_MPORT_data; // @[Cache.scala 21:24]
  wire [5:0] mem_7_MPORT_addr; // @[Cache.scala 21:24]
  wire  mem_7_MPORT_mask; // @[Cache.scala 21:24]
  wire  mem_7_MPORT_en; // @[Cache.scala 21:24]
  reg  mem_7_memOut_en_pipe_0;
  reg [5:0] mem_7_memOut_addr_pipe_0;
  wire  bank = write_x[2]; // @[Cache.scala 24:23]
  wire [2:0] _T = {bank,write_y}; // @[Cache.scala 30:21]
  wire [7:0] _T_1 = 8'h1 << _T; // @[OneHot.scala 57:35]
  wire [31:0] _shuffledLines_bundles_WIRE__0 = mem_0_memOut_data; // @[Cache.scala 137:{53,53}]
  wire [31:0] _shuffledLines_bundles_WIRE_1_0 = mem_2_memOut_data; // @[Cache.scala 137:{53,53}]
  wire [31:0] _GEN_40 = read_y[1] ? _shuffledLines_bundles_WIRE_1_0 : _shuffledLines_bundles_WIRE__0; // @[Cache.scala 148:{33,33}]
  wire [7:0] shuffledLinesBytes_0_0_0 = {_GEN_40[7],_GEN_40[6],_GEN_40[5],_GEN_40[4],_GEN_40[3],_GEN_40[2],_GEN_40[1],
    _GEN_40[0]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_0_0_1 = {_GEN_40[15],_GEN_40[14],_GEN_40[13],_GEN_40[12],_GEN_40[11],_GEN_40[10],_GEN_40
    [9],_GEN_40[8]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_0_0_2 = {_GEN_40[23],_GEN_40[22],_GEN_40[21],_GEN_40[20],_GEN_40[19],_GEN_40[18],_GEN_40
    [17],_GEN_40[16]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_0_0_3 = {_GEN_40[31],_GEN_40[30],_GEN_40[29],_GEN_40[28],_GEN_40[27],_GEN_40[26],_GEN_40
    [25],_GEN_40[24]}; // @[Cache.scala 148:78]
  wire [31:0] _shuffledLines_bundles_WIRE__1 = mem_1_memOut_data; // @[Cache.scala 137:{53,53}]
  wire [31:0] _shuffledLines_bundles_WIRE_1_1 = mem_3_memOut_data; // @[Cache.scala 137:{53,53}]
  wire [31:0] _GEN_42 = read_y[1] ? _shuffledLines_bundles_WIRE_1_1 : _shuffledLines_bundles_WIRE__1; // @[Cache.scala 148:{33,33}]
  wire [7:0] shuffledLinesBytes_0_1_0 = {_GEN_42[7],_GEN_42[6],_GEN_42[5],_GEN_42[4],_GEN_42[3],_GEN_42[2],_GEN_42[1],
    _GEN_42[0]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_0_1_1 = {_GEN_42[15],_GEN_42[14],_GEN_42[13],_GEN_42[12],_GEN_42[11],_GEN_42[10],_GEN_42
    [9],_GEN_42[8]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_0_1_2 = {_GEN_42[23],_GEN_42[22],_GEN_42[21],_GEN_42[20],_GEN_42[19],_GEN_42[18],_GEN_42
    [17],_GEN_42[16]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_0_1_3 = {_GEN_42[31],_GEN_42[30],_GEN_42[29],_GEN_42[28],_GEN_42[27],_GEN_42[26],_GEN_42
    [25],_GEN_42[24]}; // @[Cache.scala 148:78]
  wire [31:0] _GEN_44 = read_y[1] ? _shuffledLines_bundles_WIRE__0 : _shuffledLines_bundles_WIRE_1_0; // @[Cache.scala 148:{33,33}]
  wire [7:0] shuffledLinesBytes_0_2_0 = {_GEN_44[7],_GEN_44[6],_GEN_44[5],_GEN_44[4],_GEN_44[3],_GEN_44[2],_GEN_44[1],
    _GEN_44[0]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_0_2_1 = {_GEN_44[15],_GEN_44[14],_GEN_44[13],_GEN_44[12],_GEN_44[11],_GEN_44[10],_GEN_44
    [9],_GEN_44[8]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_0_2_2 = {_GEN_44[23],_GEN_44[22],_GEN_44[21],_GEN_44[20],_GEN_44[19],_GEN_44[18],_GEN_44
    [17],_GEN_44[16]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_0_2_3 = {_GEN_44[31],_GEN_44[30],_GEN_44[29],_GEN_44[28],_GEN_44[27],_GEN_44[26],_GEN_44
    [25],_GEN_44[24]}; // @[Cache.scala 148:78]
  wire [31:0] _GEN_46 = read_y[1] ? _shuffledLines_bundles_WIRE__1 : _shuffledLines_bundles_WIRE_1_1; // @[Cache.scala 148:{33,33}]
  wire [7:0] shuffledLinesBytes_0_3_0 = {_GEN_46[7],_GEN_46[6],_GEN_46[5],_GEN_46[4],_GEN_46[3],_GEN_46[2],_GEN_46[1],
    _GEN_46[0]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_0_3_1 = {_GEN_46[15],_GEN_46[14],_GEN_46[13],_GEN_46[12],_GEN_46[11],_GEN_46[10],_GEN_46
    [9],_GEN_46[8]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_0_3_2 = {_GEN_46[23],_GEN_46[22],_GEN_46[21],_GEN_46[20],_GEN_46[19],_GEN_46[18],_GEN_46
    [17],_GEN_46[16]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_0_3_3 = {_GEN_46[31],_GEN_46[30],_GEN_46[29],_GEN_46[28],_GEN_46[27],_GEN_46[26],_GEN_46
    [25],_GEN_46[24]}; // @[Cache.scala 148:78]
  wire [2:0] columnSelects_0 = read_x[2:0] - 3'h1; // @[Cache.scala 40:39]
  wire [2:0] columnSelects_2 = read_x[2:0] + 3'h1; // @[Cache.scala 40:71]
  wire [7:0] _GEN_48 = 2'h1 == columnSelects_0[1:0] ? shuffledLinesBytes_0_0_1 : shuffledLinesBytes_0_0_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_49 = 2'h2 == columnSelects_0[1:0] ? shuffledLinesBytes_0_0_2 : _GEN_48; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_50 = 2'h3 == columnSelects_0[1:0] ? shuffledLinesBytes_0_0_3 : _GEN_49; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_52 = 2'h1 == columnSelects_0[1:0] ? shuffledLinesBytes_0_1_1 : shuffledLinesBytes_0_1_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_53 = 2'h2 == columnSelects_0[1:0] ? shuffledLinesBytes_0_1_2 : _GEN_52; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_54 = 2'h3 == columnSelects_0[1:0] ? shuffledLinesBytes_0_1_3 : _GEN_53; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_56 = 2'h1 == columnSelects_0[1:0] ? shuffledLinesBytes_0_2_1 : shuffledLinesBytes_0_2_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_57 = 2'h2 == columnSelects_0[1:0] ? shuffledLinesBytes_0_2_2 : _GEN_56; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_58 = 2'h3 == columnSelects_0[1:0] ? shuffledLinesBytes_0_2_3 : _GEN_57; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_60 = 2'h1 == columnSelects_0[1:0] ? shuffledLinesBytes_0_3_1 : shuffledLinesBytes_0_3_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_61 = 2'h2 == columnSelects_0[1:0] ? shuffledLinesBytes_0_3_2 : _GEN_60; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_62 = 2'h3 == columnSelects_0[1:0] ? shuffledLinesBytes_0_3_3 : _GEN_61; // @[Cache.scala 137:{53,53}]
  wire [31:0] _window_bundles_WIRE__0 = mem_4_memOut_data; // @[Cache.scala 137:{53,53}]
  wire [31:0] _window_bundles_WIRE_1_0 = mem_6_memOut_data; // @[Cache.scala 137:{53,53}]
  wire [31:0] _GEN_64 = read_y[1] ? _window_bundles_WIRE_1_0 : _window_bundles_WIRE__0; // @[Cache.scala 148:{33,33}]
  wire [7:0] shuffledLinesBytes_1_0_0 = {_GEN_64[7],_GEN_64[6],_GEN_64[5],_GEN_64[4],_GEN_64[3],_GEN_64[2],_GEN_64[1],
    _GEN_64[0]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_1_0_1 = {_GEN_64[15],_GEN_64[14],_GEN_64[13],_GEN_64[12],_GEN_64[11],_GEN_64[10],_GEN_64
    [9],_GEN_64[8]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_1_0_2 = {_GEN_64[23],_GEN_64[22],_GEN_64[21],_GEN_64[20],_GEN_64[19],_GEN_64[18],_GEN_64
    [17],_GEN_64[16]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_1_0_3 = {_GEN_64[31],_GEN_64[30],_GEN_64[29],_GEN_64[28],_GEN_64[27],_GEN_64[26],_GEN_64
    [25],_GEN_64[24]}; // @[Cache.scala 148:78]
  wire [31:0] _window_bundles_WIRE__1 = mem_5_memOut_data; // @[Cache.scala 137:{53,53}]
  wire [31:0] _window_bundles_WIRE_1_1 = mem_7_memOut_data; // @[Cache.scala 137:{53,53}]
  wire [31:0] _GEN_66 = read_y[1] ? _window_bundles_WIRE_1_1 : _window_bundles_WIRE__1; // @[Cache.scala 148:{33,33}]
  wire [7:0] shuffledLinesBytes_1_1_0 = {_GEN_66[7],_GEN_66[6],_GEN_66[5],_GEN_66[4],_GEN_66[3],_GEN_66[2],_GEN_66[1],
    _GEN_66[0]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_1_1_1 = {_GEN_66[15],_GEN_66[14],_GEN_66[13],_GEN_66[12],_GEN_66[11],_GEN_66[10],_GEN_66
    [9],_GEN_66[8]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_1_1_2 = {_GEN_66[23],_GEN_66[22],_GEN_66[21],_GEN_66[20],_GEN_66[19],_GEN_66[18],_GEN_66
    [17],_GEN_66[16]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_1_1_3 = {_GEN_66[31],_GEN_66[30],_GEN_66[29],_GEN_66[28],_GEN_66[27],_GEN_66[26],_GEN_66
    [25],_GEN_66[24]}; // @[Cache.scala 148:78]
  wire [31:0] _GEN_68 = read_y[1] ? _window_bundles_WIRE__0 : _window_bundles_WIRE_1_0; // @[Cache.scala 148:{33,33}]
  wire [7:0] shuffledLinesBytes_1_2_0 = {_GEN_68[7],_GEN_68[6],_GEN_68[5],_GEN_68[4],_GEN_68[3],_GEN_68[2],_GEN_68[1],
    _GEN_68[0]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_1_2_1 = {_GEN_68[15],_GEN_68[14],_GEN_68[13],_GEN_68[12],_GEN_68[11],_GEN_68[10],_GEN_68
    [9],_GEN_68[8]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_1_2_2 = {_GEN_68[23],_GEN_68[22],_GEN_68[21],_GEN_68[20],_GEN_68[19],_GEN_68[18],_GEN_68
    [17],_GEN_68[16]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_1_2_3 = {_GEN_68[31],_GEN_68[30],_GEN_68[29],_GEN_68[28],_GEN_68[27],_GEN_68[26],_GEN_68
    [25],_GEN_68[24]}; // @[Cache.scala 148:78]
  wire [31:0] _GEN_70 = read_y[1] ? _window_bundles_WIRE__1 : _window_bundles_WIRE_1_1; // @[Cache.scala 148:{33,33}]
  wire [7:0] shuffledLinesBytes_1_3_0 = {_GEN_70[7],_GEN_70[6],_GEN_70[5],_GEN_70[4],_GEN_70[3],_GEN_70[2],_GEN_70[1],
    _GEN_70[0]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_1_3_1 = {_GEN_70[15],_GEN_70[14],_GEN_70[13],_GEN_70[12],_GEN_70[11],_GEN_70[10],_GEN_70
    [9],_GEN_70[8]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_1_3_2 = {_GEN_70[23],_GEN_70[22],_GEN_70[21],_GEN_70[20],_GEN_70[19],_GEN_70[18],_GEN_70
    [17],_GEN_70[16]}; // @[Cache.scala 148:78]
  wire [7:0] shuffledLinesBytes_1_3_3 = {_GEN_70[31],_GEN_70[30],_GEN_70[29],_GEN_70[28],_GEN_70[27],_GEN_70[26],_GEN_70
    [25],_GEN_70[24]}; // @[Cache.scala 148:78]
  wire [7:0] _GEN_72 = 2'h1 == columnSelects_0[1:0] ? shuffledLinesBytes_1_0_1 : shuffledLinesBytes_1_0_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_73 = 2'h2 == columnSelects_0[1:0] ? shuffledLinesBytes_1_0_2 : _GEN_72; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_74 = 2'h3 == columnSelects_0[1:0] ? shuffledLinesBytes_1_0_3 : _GEN_73; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_76 = 2'h1 == columnSelects_0[1:0] ? shuffledLinesBytes_1_1_1 : shuffledLinesBytes_1_1_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_77 = 2'h2 == columnSelects_0[1:0] ? shuffledLinesBytes_1_1_2 : _GEN_76; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_78 = 2'h3 == columnSelects_0[1:0] ? shuffledLinesBytes_1_1_3 : _GEN_77; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_80 = 2'h1 == columnSelects_0[1:0] ? shuffledLinesBytes_1_2_1 : shuffledLinesBytes_1_2_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_81 = 2'h2 == columnSelects_0[1:0] ? shuffledLinesBytes_1_2_2 : _GEN_80; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_82 = 2'h3 == columnSelects_0[1:0] ? shuffledLinesBytes_1_2_3 : _GEN_81; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_84 = 2'h1 == columnSelects_0[1:0] ? shuffledLinesBytes_1_3_1 : shuffledLinesBytes_1_3_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_85 = 2'h2 == columnSelects_0[1:0] ? shuffledLinesBytes_1_3_2 : _GEN_84; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_86 = 2'h3 == columnSelects_0[1:0] ? shuffledLinesBytes_1_3_3 : _GEN_85; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_88 = 2'h1 == read_x[1:0] ? shuffledLinesBytes_0_0_1 : shuffledLinesBytes_0_0_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_89 = 2'h2 == read_x[1:0] ? shuffledLinesBytes_0_0_2 : _GEN_88; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_90 = 2'h3 == read_x[1:0] ? shuffledLinesBytes_0_0_3 : _GEN_89; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_92 = 2'h1 == read_x[1:0] ? shuffledLinesBytes_0_1_1 : shuffledLinesBytes_0_1_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_93 = 2'h2 == read_x[1:0] ? shuffledLinesBytes_0_1_2 : _GEN_92; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_94 = 2'h3 == read_x[1:0] ? shuffledLinesBytes_0_1_3 : _GEN_93; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_96 = 2'h1 == read_x[1:0] ? shuffledLinesBytes_0_2_1 : shuffledLinesBytes_0_2_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_97 = 2'h2 == read_x[1:0] ? shuffledLinesBytes_0_2_2 : _GEN_96; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_98 = 2'h3 == read_x[1:0] ? shuffledLinesBytes_0_2_3 : _GEN_97; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_100 = 2'h1 == read_x[1:0] ? shuffledLinesBytes_0_3_1 : shuffledLinesBytes_0_3_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_101 = 2'h2 == read_x[1:0] ? shuffledLinesBytes_0_3_2 : _GEN_100; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_102 = 2'h3 == read_x[1:0] ? shuffledLinesBytes_0_3_3 : _GEN_101; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_104 = 2'h1 == read_x[1:0] ? shuffledLinesBytes_1_0_1 : shuffledLinesBytes_1_0_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_105 = 2'h2 == read_x[1:0] ? shuffledLinesBytes_1_0_2 : _GEN_104; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_106 = 2'h3 == read_x[1:0] ? shuffledLinesBytes_1_0_3 : _GEN_105; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_108 = 2'h1 == read_x[1:0] ? shuffledLinesBytes_1_1_1 : shuffledLinesBytes_1_1_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_109 = 2'h2 == read_x[1:0] ? shuffledLinesBytes_1_1_2 : _GEN_108; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_110 = 2'h3 == read_x[1:0] ? shuffledLinesBytes_1_1_3 : _GEN_109; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_112 = 2'h1 == read_x[1:0] ? shuffledLinesBytes_1_2_1 : shuffledLinesBytes_1_2_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_113 = 2'h2 == read_x[1:0] ? shuffledLinesBytes_1_2_2 : _GEN_112; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_114 = 2'h3 == read_x[1:0] ? shuffledLinesBytes_1_2_3 : _GEN_113; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_116 = 2'h1 == read_x[1:0] ? shuffledLinesBytes_1_3_1 : shuffledLinesBytes_1_3_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_117 = 2'h2 == read_x[1:0] ? shuffledLinesBytes_1_3_2 : _GEN_116; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_118 = 2'h3 == read_x[1:0] ? shuffledLinesBytes_1_3_3 : _GEN_117; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_120 = 2'h1 == columnSelects_2[1:0] ? shuffledLinesBytes_0_0_1 : shuffledLinesBytes_0_0_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_121 = 2'h2 == columnSelects_2[1:0] ? shuffledLinesBytes_0_0_2 : _GEN_120; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_122 = 2'h3 == columnSelects_2[1:0] ? shuffledLinesBytes_0_0_3 : _GEN_121; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_124 = 2'h1 == columnSelects_2[1:0] ? shuffledLinesBytes_0_1_1 : shuffledLinesBytes_0_1_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_125 = 2'h2 == columnSelects_2[1:0] ? shuffledLinesBytes_0_1_2 : _GEN_124; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_126 = 2'h3 == columnSelects_2[1:0] ? shuffledLinesBytes_0_1_3 : _GEN_125; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_128 = 2'h1 == columnSelects_2[1:0] ? shuffledLinesBytes_0_2_1 : shuffledLinesBytes_0_2_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_129 = 2'h2 == columnSelects_2[1:0] ? shuffledLinesBytes_0_2_2 : _GEN_128; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_130 = 2'h3 == columnSelects_2[1:0] ? shuffledLinesBytes_0_2_3 : _GEN_129; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_132 = 2'h1 == columnSelects_2[1:0] ? shuffledLinesBytes_0_3_1 : shuffledLinesBytes_0_3_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_133 = 2'h2 == columnSelects_2[1:0] ? shuffledLinesBytes_0_3_2 : _GEN_132; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_134 = 2'h3 == columnSelects_2[1:0] ? shuffledLinesBytes_0_3_3 : _GEN_133; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_136 = 2'h1 == columnSelects_2[1:0] ? shuffledLinesBytes_1_0_1 : shuffledLinesBytes_1_0_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_137 = 2'h2 == columnSelects_2[1:0] ? shuffledLinesBytes_1_0_2 : _GEN_136; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_138 = 2'h3 == columnSelects_2[1:0] ? shuffledLinesBytes_1_0_3 : _GEN_137; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_140 = 2'h1 == columnSelects_2[1:0] ? shuffledLinesBytes_1_1_1 : shuffledLinesBytes_1_1_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_141 = 2'h2 == columnSelects_2[1:0] ? shuffledLinesBytes_1_1_2 : _GEN_140; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_142 = 2'h3 == columnSelects_2[1:0] ? shuffledLinesBytes_1_1_3 : _GEN_141; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_144 = 2'h1 == columnSelects_2[1:0] ? shuffledLinesBytes_1_2_1 : shuffledLinesBytes_1_2_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_145 = 2'h2 == columnSelects_2[1:0] ? shuffledLinesBytes_1_2_2 : _GEN_144; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_146 = 2'h3 == columnSelects_2[1:0] ? shuffledLinesBytes_1_2_3 : _GEN_145; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_148 = 2'h1 == columnSelects_2[1:0] ? shuffledLinesBytes_1_3_1 : shuffledLinesBytes_1_3_0; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_149 = 2'h2 == columnSelects_2[1:0] ? shuffledLinesBytes_1_3_2 : _GEN_148; // @[Cache.scala 137:{53,53}]
  wire [7:0] _GEN_150 = 2'h3 == columnSelects_2[1:0] ? shuffledLinesBytes_1_3_3 : _GEN_149; // @[Cache.scala 137:{53,53}]
  wire  topEdge = read_y == 2'h0; // @[Cache.scala 45:24]
  wire [8:0] _GEN_175 = {{7'd0}, read_y}; // @[Cache.scala 46:27]
  wire  bottomEdge = _GEN_175 == 9'h11f; // @[Cache.scala 46:27]
  wire  leftEdge = read_x == 9'h0; // @[Cache.scala 47:25]
  wire  rightEdge = read_x == 9'h15f; // @[Cache.scala 48:26]
  wire  _T_10 = topEdge & leftEdge; // @[Cache.scala 52:20]
  wire  _T_11 = topEdge & rightEdge; // @[Cache.scala 54:20]
  wire  _T_12 = bottomEdge & leftEdge; // @[Cache.scala 67:23]
  wire  _T_13 = bottomEdge & rightEdge; // @[Cache.scala 69:23]
  wire [7:0] _GEN_152 = read_x[2] ? _GEN_106 : _GEN_90; // @[Mux.scala 101:{16,16}]
  wire [7:0] _GEN_154 = columnSelects_0[2] ? _GEN_74 : _GEN_50; // @[Mux.scala 101:{16,16}]
  wire [7:0] _T_14 = leftEdge ? _GEN_152 : _GEN_154; // @[Mux.scala 101:16]
  wire [7:0] _GEN_156 = columnSelects_0[2] ? _GEN_78 : _GEN_54; // @[Mux.scala 101:{16,16}]
  wire [7:0] _T_15 = topEdge ? _GEN_156 : _T_14; // @[Mux.scala 101:16]
  wire [7:0] _GEN_158 = read_x[2] ? _GEN_110 : _GEN_94; // @[Mux.scala 101:{16,16}]
  wire [7:0] _GEN_160 = columnSelects_2[2] ? _GEN_138 : _GEN_122; // @[Mux.scala 101:{16,16}]
  wire [7:0] _T_18 = rightEdge ? _GEN_152 : _GEN_160; // @[Mux.scala 101:16]
  wire [7:0] _GEN_162 = columnSelects_2[2] ? _GEN_142 : _GEN_126; // @[Mux.scala 101:{16,16}]
  wire [7:0] _T_19 = topEdge ? _GEN_162 : _T_18; // @[Mux.scala 101:16]
  wire [7:0] _GEN_164 = columnSelects_0[2] ? _GEN_82 : _GEN_58; // @[Mux.scala 101:{16,16}]
  wire [7:0] _GEN_166 = columnSelects_2[2] ? _GEN_146 : _GEN_130; // @[Mux.scala 101:{16,16}]
  wire [7:0] _GEN_168 = read_x[2] ? _GEN_118 : _GEN_102; // @[Mux.scala 101:{16,16}]
  wire [7:0] _GEN_170 = columnSelects_0[2] ? _GEN_86 : _GEN_62; // @[Mux.scala 101:{16,16}]
  wire [7:0] _T_25 = leftEdge ? _GEN_168 : _GEN_170; // @[Mux.scala 101:16]
  wire [7:0] _T_26 = bottomEdge ? _GEN_164 : _T_25; // @[Mux.scala 101:16]
  wire [7:0] _GEN_172 = read_x[2] ? _GEN_114 : _GEN_98; // @[Mux.scala 101:{16,16}]
  wire [7:0] _GEN_174 = columnSelects_2[2] ? _GEN_150 : _GEN_134; // @[Mux.scala 101:{16,16}]
  wire [7:0] _T_29 = rightEdge ? _GEN_168 : _GEN_174; // @[Mux.scala 101:16]
  wire [7:0] _T_30 = bottomEdge ? _GEN_166 : _T_29; // @[Mux.scala 101:16]
  assign mem_0_memOut_en = mem_0_memOut_en_pipe_0;
  assign mem_0_memOut_addr = mem_0_memOut_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_0_memOut_data = mem_0[mem_0_memOut_addr]; // @[Cache.scala 21:24]
  `else
  assign mem_0_memOut_data = mem_0_memOut_addr >= 6'h2c ? _RAND_1[31:0] : mem_0[mem_0_memOut_addr]; // @[Cache.scala 21:24]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem_0_MPORT_data = write_data;
  assign mem_0_MPORT_addr = write_x[8:3];
  assign mem_0_MPORT_mask = _T_1[0];
  assign mem_0_MPORT_en = write_enable;
  assign mem_1_memOut_en = mem_1_memOut_en_pipe_0;
  assign mem_1_memOut_addr = mem_1_memOut_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_1_memOut_data = mem_1[mem_1_memOut_addr]; // @[Cache.scala 21:24]
  `else
  assign mem_1_memOut_data = mem_1_memOut_addr >= 6'h2c ? _RAND_5[31:0] : mem_1[mem_1_memOut_addr]; // @[Cache.scala 21:24]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem_1_MPORT_data = write_data;
  assign mem_1_MPORT_addr = write_x[8:3];
  assign mem_1_MPORT_mask = _T_1[1];
  assign mem_1_MPORT_en = write_enable;
  assign mem_2_memOut_en = mem_2_memOut_en_pipe_0;
  assign mem_2_memOut_addr = mem_2_memOut_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_2_memOut_data = mem_2[mem_2_memOut_addr]; // @[Cache.scala 21:24]
  `else
  assign mem_2_memOut_data = mem_2_memOut_addr >= 6'h2c ? _RAND_9[31:0] : mem_2[mem_2_memOut_addr]; // @[Cache.scala 21:24]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem_2_MPORT_data = write_data;
  assign mem_2_MPORT_addr = write_x[8:3];
  assign mem_2_MPORT_mask = _T_1[2];
  assign mem_2_MPORT_en = write_enable;
  assign mem_3_memOut_en = mem_3_memOut_en_pipe_0;
  assign mem_3_memOut_addr = mem_3_memOut_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_3_memOut_data = mem_3[mem_3_memOut_addr]; // @[Cache.scala 21:24]
  `else
  assign mem_3_memOut_data = mem_3_memOut_addr >= 6'h2c ? _RAND_13[31:0] : mem_3[mem_3_memOut_addr]; // @[Cache.scala 21:24]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem_3_MPORT_data = write_data;
  assign mem_3_MPORT_addr = write_x[8:3];
  assign mem_3_MPORT_mask = _T_1[3];
  assign mem_3_MPORT_en = write_enable;
  assign mem_4_memOut_en = mem_4_memOut_en_pipe_0;
  assign mem_4_memOut_addr = mem_4_memOut_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_4_memOut_data = mem_4[mem_4_memOut_addr]; // @[Cache.scala 21:24]
  `else
  assign mem_4_memOut_data = mem_4_memOut_addr >= 6'h2c ? _RAND_17[31:0] : mem_4[mem_4_memOut_addr]; // @[Cache.scala 21:24]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem_4_MPORT_data = write_data;
  assign mem_4_MPORT_addr = write_x[8:3];
  assign mem_4_MPORT_mask = _T_1[4];
  assign mem_4_MPORT_en = write_enable;
  assign mem_5_memOut_en = mem_5_memOut_en_pipe_0;
  assign mem_5_memOut_addr = mem_5_memOut_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_5_memOut_data = mem_5[mem_5_memOut_addr]; // @[Cache.scala 21:24]
  `else
  assign mem_5_memOut_data = mem_5_memOut_addr >= 6'h2c ? _RAND_21[31:0] : mem_5[mem_5_memOut_addr]; // @[Cache.scala 21:24]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem_5_MPORT_data = write_data;
  assign mem_5_MPORT_addr = write_x[8:3];
  assign mem_5_MPORT_mask = _T_1[5];
  assign mem_5_MPORT_en = write_enable;
  assign mem_6_memOut_en = mem_6_memOut_en_pipe_0;
  assign mem_6_memOut_addr = mem_6_memOut_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_6_memOut_data = mem_6[mem_6_memOut_addr]; // @[Cache.scala 21:24]
  `else
  assign mem_6_memOut_data = mem_6_memOut_addr >= 6'h2c ? _RAND_25[31:0] : mem_6[mem_6_memOut_addr]; // @[Cache.scala 21:24]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem_6_MPORT_data = write_data;
  assign mem_6_MPORT_addr = write_x[8:3];
  assign mem_6_MPORT_mask = _T_1[6];
  assign mem_6_MPORT_en = write_enable;
  assign mem_7_memOut_en = mem_7_memOut_en_pipe_0;
  assign mem_7_memOut_addr = mem_7_memOut_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_7_memOut_data = mem_7[mem_7_memOut_addr]; // @[Cache.scala 21:24]
  `else
  assign mem_7_memOut_data = mem_7_memOut_addr >= 6'h2c ? _RAND_29[31:0] : mem_7[mem_7_memOut_addr]; // @[Cache.scala 21:24]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem_7_MPORT_data = write_data;
  assign mem_7_MPORT_addr = write_x[8:3];
  assign mem_7_MPORT_mask = _T_1[7];
  assign mem_7_MPORT_en = write_enable;
  assign read_window_0_0 = _T_10 ? _GEN_158 : _T_15; // @[Mux.scala 101:16]
  assign read_window_0_1 = topEdge ? _GEN_158 : _GEN_152; // @[Mux.scala 101:16]
  assign read_window_0_2 = _T_11 ? _GEN_158 : _T_19; // @[Mux.scala 101:16]
  assign read_window_1_0 = leftEdge ? _GEN_158 : _GEN_156; // @[Mux.scala 101:16]
  assign read_window_1_1 = read_x[2] ? _GEN_110 : _GEN_94; // @[Mux.scala 101:{16,16}]
  assign read_window_1_2 = rightEdge ? _GEN_158 : _GEN_162; // @[Mux.scala 101:16]
  assign read_window_2_0 = leftEdge ? _GEN_158 : _GEN_164; // @[Mux.scala 101:16]
  assign read_window_2_1 = read_x[2] ? _GEN_114 : _GEN_98; // @[Mux.scala 101:{16,16}]
  assign read_window_2_2 = rightEdge ? _GEN_158 : _GEN_166; // @[Mux.scala 101:16]
  assign read_window_3_0 = _T_12 ? _GEN_172 : _T_26; // @[Mux.scala 101:16]
  assign read_window_3_1 = bottomEdge ? _GEN_172 : _GEN_168; // @[Mux.scala 101:16]
  assign read_window_3_2 = _T_13 ? _GEN_172 : _T_30; // @[Mux.scala 101:16]
  always @(posedge clock) begin
    if (mem_0_MPORT_en & mem_0_MPORT_mask) begin
      mem_0[mem_0_MPORT_addr] <= mem_0_MPORT_data; // @[Cache.scala 21:24]
    end
    mem_0_memOut_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_0_memOut_addr_pipe_0 <= read_x[8:3];
    end
    if (mem_1_MPORT_en & mem_1_MPORT_mask) begin
      mem_1[mem_1_MPORT_addr] <= mem_1_MPORT_data; // @[Cache.scala 21:24]
    end
    mem_1_memOut_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_1_memOut_addr_pipe_0 <= read_x[8:3];
    end
    if (mem_2_MPORT_en & mem_2_MPORT_mask) begin
      mem_2[mem_2_MPORT_addr] <= mem_2_MPORT_data; // @[Cache.scala 21:24]
    end
    mem_2_memOut_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_2_memOut_addr_pipe_0 <= read_x[8:3];
    end
    if (mem_3_MPORT_en & mem_3_MPORT_mask) begin
      mem_3[mem_3_MPORT_addr] <= mem_3_MPORT_data; // @[Cache.scala 21:24]
    end
    mem_3_memOut_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_3_memOut_addr_pipe_0 <= read_x[8:3];
    end
    if (mem_4_MPORT_en & mem_4_MPORT_mask) begin
      mem_4[mem_4_MPORT_addr] <= mem_4_MPORT_data; // @[Cache.scala 21:24]
    end
    mem_4_memOut_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_4_memOut_addr_pipe_0 <= read_x[8:3];
    end
    if (mem_5_MPORT_en & mem_5_MPORT_mask) begin
      mem_5[mem_5_MPORT_addr] <= mem_5_MPORT_data; // @[Cache.scala 21:24]
    end
    mem_5_memOut_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_5_memOut_addr_pipe_0 <= read_x[8:3];
    end
    if (mem_6_MPORT_en & mem_6_MPORT_mask) begin
      mem_6[mem_6_MPORT_addr] <= mem_6_MPORT_data; // @[Cache.scala 21:24]
    end
    mem_6_memOut_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_6_memOut_addr_pipe_0 <= read_x[8:3];
    end
    if (mem_7_MPORT_en & mem_7_MPORT_mask) begin
      mem_7[mem_7_MPORT_addr] <= mem_7_MPORT_data; // @[Cache.scala 21:24]
    end
    mem_7_memOut_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_7_memOut_addr_pipe_0 <= read_x[8:3];
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
    mem_0[initvar] = _RAND_0[31:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 44; initvar = initvar+1)
    mem_1[initvar] = _RAND_4[31:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 44; initvar = initvar+1)
    mem_2[initvar] = _RAND_8[31:0];
  _RAND_12 = {1{`RANDOM}};
  for (initvar = 0; initvar < 44; initvar = initvar+1)
    mem_3[initvar] = _RAND_12[31:0];
  _RAND_16 = {1{`RANDOM}};
  for (initvar = 0; initvar < 44; initvar = initvar+1)
    mem_4[initvar] = _RAND_16[31:0];
  _RAND_20 = {1{`RANDOM}};
  for (initvar = 0; initvar < 44; initvar = initvar+1)
    mem_5[initvar] = _RAND_20[31:0];
  _RAND_24 = {1{`RANDOM}};
  for (initvar = 0; initvar < 44; initvar = initvar+1)
    mem_6[initvar] = _RAND_24[31:0];
  _RAND_28 = {1{`RANDOM}};
  for (initvar = 0; initvar < 44; initvar = initvar+1)
    mem_7[initvar] = _RAND_28[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  mem_0_memOut_en_pipe_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  mem_0_memOut_addr_pipe_0 = _RAND_3[5:0];
  _RAND_6 = {1{`RANDOM}};
  mem_1_memOut_en_pipe_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  mem_1_memOut_addr_pipe_0 = _RAND_7[5:0];
  _RAND_10 = {1{`RANDOM}};
  mem_2_memOut_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  mem_2_memOut_addr_pipe_0 = _RAND_11[5:0];
  _RAND_14 = {1{`RANDOM}};
  mem_3_memOut_en_pipe_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  mem_3_memOut_addr_pipe_0 = _RAND_15[5:0];
  _RAND_18 = {1{`RANDOM}};
  mem_4_memOut_en_pipe_0 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  mem_4_memOut_addr_pipe_0 = _RAND_19[5:0];
  _RAND_22 = {1{`RANDOM}};
  mem_5_memOut_en_pipe_0 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  mem_5_memOut_addr_pipe_0 = _RAND_23[5:0];
  _RAND_26 = {1{`RANDOM}};
  mem_6_memOut_en_pipe_0 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  mem_6_memOut_addr_pipe_0 = _RAND_27[5:0];
  _RAND_30 = {1{`RANDOM}};
  mem_7_memOut_en_pipe_0 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  mem_7_memOut_addr_pipe_0 = _RAND_31[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
