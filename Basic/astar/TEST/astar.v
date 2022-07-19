// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 0.9.6 - Revision 891ec3caed502474cab0813cc4a9fc678deabaa5 - Date 2021-02-11T18:02:12
// bambu executed with: bambu -I. --top-fname=astar frst.c 
// 
// Send any bug to: panda-info@polimi.it
// ************************************************************************
// The following text holds for all the components tagged with PANDA_LGPLv3.
// They are all part of the BAMBU/PANDA IP LIBRARY.
// This library is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 3 of the License, or (at your option) any later version.
// 
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public
// License along with the PandA framework; see the files COPYING.LIB
// If not, see <http://www.gnu.org/licenses/>.
// ************************************************************************

`ifdef __ICARUS__
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VERILATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef MODEL_TECH
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VCS
  `define _SIM_HAVE_CLOG2
`endif
`ifdef NCVERILOG
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_SIMULATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_ISIM
  `define _SIM_HAVE_CLOG2
`endif

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module constant_value(out1);
  parameter BITSIZE_out1=1, value=1'b0;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = value;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module register_SE(clock, reset, in1, wenable, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input [BITSIZE_in1-1:0] in1;
  input wenable;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  reg [BITSIZE_out1-1:0] reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock)
    if (wenable)
      reg_out1 <= in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module register_STD(clock, reset, in1, wenable, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input [BITSIZE_in1-1:0] in1;
  input wenable;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  reg [BITSIZE_out1-1:0] reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock)
    reg_out1 <= in1;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ARRAY_1D_STD_DISTRAM_NN_SDS(clock, reset, in1, in2, in3, in4, out1, sel_LOAD, sel_STORE, S_oe_ram, S_we_ram, S_addr_ram, S_Wdata_ram, Sin_Rdata_ram, Sout_Rdata_ram, S_data_ram_size, Sin_DataRdy, Sout_DataRdy, proxy_in1, proxy_in2, proxy_in3, proxy_sel_LOAD, proxy_sel_STORE, proxy_out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2, BITSIZE_in2=1, PORTSIZE_in2=2, BITSIZE_in3=1, PORTSIZE_in3=2, BITSIZE_in4=1, PORTSIZE_in4=2, BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2, BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2, BITSIZE_S_oe_ram=1, PORTSIZE_S_oe_ram=2, BITSIZE_S_we_ram=1, PORTSIZE_S_we_ram=2, BITSIZE_out1=1, PORTSIZE_out1=2, BITSIZE_S_addr_ram=1, PORTSIZE_S_addr_ram=2, BITSIZE_S_Wdata_ram=8, PORTSIZE_S_Wdata_ram=2, BITSIZE_Sin_Rdata_ram=8, PORTSIZE_Sin_Rdata_ram=2, BITSIZE_Sout_Rdata_ram=8, PORTSIZE_Sout_Rdata_ram=2, BITSIZE_S_data_ram_size=1, PORTSIZE_S_data_ram_size=2, BITSIZE_Sin_DataRdy=1, PORTSIZE_Sin_DataRdy=2, BITSIZE_Sout_DataRdy=1, PORTSIZE_Sout_DataRdy=2, MEMORY_INIT_file="array.mem", n_elements=1, data_size=32, address_space_begin=0, address_space_rangesize=4, BUS_PIPELINED=1, BRAM_BITSIZE=32, PRIVATE_MEMORY=0, READ_ONLY_MEMORY=0, USE_SPARSE_MEMORY=1, BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2, BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2, BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2, BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2, BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2, BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input clock;
  input reset;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_S_oe_ram-1:0] S_oe_ram;
  input [PORTSIZE_S_we_ram-1:0] S_we_ram;
  input [(PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1):0] S_addr_ram;
  input [(PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1):0] S_Wdata_ram;
  input [(PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1):0] Sin_Rdata_ram;
  input [(PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1):0] S_data_ram_size;
  input [PORTSIZE_Sin_DataRdy-1:0] Sin_DataRdy;
  input [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  input [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  input [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  input [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  input [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1):0] Sout_Rdata_ram;
  output [PORTSIZE_Sout_DataRdy-1:0] Sout_DataRdy;
  output [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  `ifndef _SIM_HAVE_CLOG2
      function integer log2;
        input integer value;
        integer temp_value;
        begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
        end
      endfunction
  `endif
  parameter n_byte_data = BRAM_BITSIZE/8;
  parameter n_bytes = n_elements*n_byte_data;
  parameter n_byte_on_databus = BRAM_BITSIZE/8;
  parameter n_mem_elements = n_bytes/(n_byte_on_databus) + (n_bytes % (n_byte_on_databus) == 0 ? 0 : 1);
  parameter nbit_addr = BITSIZE_in2 > BITSIZE_proxy_in2 ? BITSIZE_in2 : BITSIZE_proxy_in2;
  `ifdef _SIM_HAVE_CLOG2
    parameter nbit_read_addr = n_mem_elements == 1 ? 1 : $clog2(n_mem_elements);
    parameter nbits_byte_offset = n_byte_on_databus==1 ? 0 : $clog2(n_byte_on_databus);
  `else
    parameter nbit_read_addr = n_mem_elements == 1 ? 1 : log2(n_mem_elements);
    parameter nbits_byte_offset = n_byte_on_databus==1 ? 0 : log2(n_byte_on_databus);
  `endif
  parameter max_n_writes = PORTSIZE_sel_STORE;
  parameter max_n_reads = PORTSIZE_sel_LOAD;
  parameter max_n_rw = max_n_writes > max_n_reads ? max_n_writes : max_n_reads;
  
  wire [max_n_writes-1:0] bram_write;
  
  wire [nbit_read_addr*max_n_rw-1:0] memory_addr_a;
  wire [nbit_read_addr-1:0] memory_addr_a_0;
  wire [nbit_read_addr-1:0] memory_addr_a_1;
  
  wire [data_size*max_n_writes-1:0] din_value_aggregated;
  wire [data_size*max_n_reads-1:0] dout_a;
  wire [nbit_addr*max_n_rw-1:0] tmp_addr;
  wire [nbit_addr*max_n_rw-1:0] relative_addr;
  wire [PORTSIZE_sel_LOAD-1:0] int_sel_LOAD;
  wire [PORTSIZE_sel_STORE-1:0] int_sel_STORE;
  integer index2;
  
  reg [data_size-1:0] memory [0:n_elements-1] /* synthesis syn_ramstyle = "no_rw_check" */;
  
  initial
  begin
    $readmemb(MEMORY_INIT_file, memory, 0, n_elements-1);
  end
  
  generate
  genvar ind2;
  for (ind2=0; ind2<max_n_rw; ind2=ind2+1)
    begin : Lind2
      assign tmp_addr[(ind2+1)*nbit_addr-1:ind2*nbit_addr] = (proxy_sel_LOAD[ind2]||proxy_sel_STORE[ind2]) ? proxy_in2[(ind2+1)*BITSIZE_proxy_in2-1:ind2*BITSIZE_proxy_in2] : in2[(ind2+1)*BITSIZE_in2-1:ind2*BITSIZE_in2];
    end
  endgenerate
  
  generate
  genvar i6;
    for (i6=0; i6<max_n_rw; i6=i6+1)
    begin : L6
      if(USE_SPARSE_MEMORY==1)
        assign relative_addr[(i6)*nbit_addr+nbit_addr-1:i6*nbit_addr] = tmp_addr[(i6)*nbit_addr+nbit_addr-1:i6*nbit_addr];
      else
        assign relative_addr[(i6+1)*nbit_addr-1:i6*nbit_addr] = tmp_addr[(i6+1)*nbit_addr-1:i6*nbit_addr]-address_space_begin;
    end
  endgenerate
  
  generate
  genvar i7;
    for (i7=0; i7<max_n_rw; i7=i7+1)
    begin : L7_A
      if (n_mem_elements==1)
        assign memory_addr_a[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = {nbit_read_addr{1'b0}};
      else
        assign memory_addr_a[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = relative_addr[nbit_read_addr+nbits_byte_offset-1+i7*nbit_addr:nbits_byte_offset+i7*nbit_addr];
    end
  endgenerate
  
  generate
  genvar i14;
    for (i14=0; i14<max_n_writes; i14=i14+1)
    begin : L14
      assign din_value_aggregated[(i14+1)*data_size-1:i14*data_size] = proxy_sel_STORE[i14] ? proxy_in1[(i14+1)*BITSIZE_proxy_in1-1:i14*BITSIZE_proxy_in1] : in1[(i14+1)*BITSIZE_in1-1:i14*BITSIZE_in1];
    end
  endgenerate
  
  generate
  genvar i11;
    for (i11=0; i11<max_n_reads; i11=i11+1)
    begin : asynchronous_read
      assign dout_a[data_size*i11+:data_size] = memory[memory_addr_a[nbit_read_addr*i11+:nbit_read_addr]];
    end
  endgenerate
  
  assign memory_addr_a_0 = memory_addr_a[nbit_read_addr*0+:nbit_read_addr];
  assign memory_addr_a_1 = memory_addr_a[nbit_read_addr*1+:nbit_read_addr];
  
  generate if(READ_ONLY_MEMORY==0)
    always @(posedge clock)
    begin
      if(bram_write[0])
        memory[memory_addr_a_0] <= din_value_aggregated[data_size*0+:data_size];
      if(bram_write[1])
        memory[memory_addr_a_1] <= din_value_aggregated[data_size*1+:data_size];
    end
  endgenerate
  
  generate
  genvar i21;
    for (i21=0; i21<max_n_writes; i21=i21+1)
    begin : L21
        assign bram_write[i21] = int_sel_STORE[i21] || proxy_sel_STORE[i21];
    end
  endgenerate
  
  generate
  genvar i20;
    for (i20=0; i20<max_n_reads; i20=i20+1)
    begin : L20
      assign out1[(i20+1)*BITSIZE_out1-1:i20*BITSIZE_out1] = dout_a[(i20+1)*data_size-1:i20*data_size];
      assign proxy_out1[(i20+1)*BITSIZE_proxy_out1-1:i20*BITSIZE_proxy_out1] = dout_a[(i20+1)*data_size-1:i20*data_size];
    end
  endgenerate
  assign Sout_Rdata_ram =Sin_Rdata_ram;
  assign Sout_DataRdy = Sin_DataRdy;
  assign int_sel_LOAD = sel_LOAD & in4;
  assign int_sel_STORE = sel_STORE & in4;
  
  assign Sout_DataRdy = Sin_DataRdy;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module addr_expr_FU(in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UUdata_converter_FU(in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UIdata_converter_FU(in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module IUdata_converter_FU(in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){in1[BITSIZE_in1-1]}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module read_cond_FU(in1, out1);
  parameter BITSIZE_in1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output out1;
  assign out1 = in1 != {BITSIZE_in1{1'b0}};
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module cond_expr_FU(in1, in2, in3, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_in3=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  input signed [BITSIZE_in3-1:0] in3;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != 0 ? in2 : in3;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ge_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 >= in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module gt_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 > in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ne_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module plus_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_and_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 & in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_cond_expr_FU(in1, in2, in3, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_in3=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != 0 ? in2 : in3;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_eq_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 == in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_pointer_plus_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1, LSB_PARAMETER=-1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  wire [BITSIZE_out1-1:0] in1_tmp;
  wire [BITSIZE_out1-1:0] in2_tmp;
  assign in1_tmp = in1;
  assign in2_tmp = in2;generate if (BITSIZE_out1 > LSB_PARAMETER) assign out1[BITSIZE_out1-1:LSB_PARAMETER] = (in1_tmp[BITSIZE_out1-1:LSB_PARAMETER] + in2_tmp[BITSIZE_out1-1:LSB_PARAMETER]); else assign out1 = 0; endgenerate
  generate if (LSB_PARAMETER != 0 && BITSIZE_out1 > LSB_PARAMETER) assign out1[LSB_PARAMETER-1:0] = 0; endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2013-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module bus_merger(in1, out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2, BITSIZE_out1=1;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  function [BITSIZE_out1-1:0] merge;
    input [BITSIZE_in1*PORTSIZE_in1-1:0] m;
    reg [BITSIZE_out1-1:0] res;
    integer i1;
  begin
    res={BITSIZE_in1{1'b0}};
    for(i1 = 0; i1 < PORTSIZE_in1; i1 = i1 + 1)
    begin
      res = res | m[i1*BITSIZE_in1 +:BITSIZE_in1];
    end
    merge = res;
  end
  endfunction
  
  assign out1 = merge(in1);
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module join_signal(in1, out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2, BITSIZE_out1=1;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  generate
  genvar i1;
  for (i1=0; i1<PORTSIZE_in1; i1=i1+1)
    begin : L1
      assign out1[(i1+1)*(BITSIZE_out1/PORTSIZE_in1)-1:i1*(BITSIZE_out1/PORTSIZE_in1)] = in1[(i1+1)*BITSIZE_in1-1:i1*BITSIZE_in1];
    end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module split_signal(in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1, PORTSIZE_out1=2;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ASSIGN_VECTOR_BOOL_FU(in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module MUX_GATE(sel, in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input sel;
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = sel ? in1 : in2;
endmodule

// Datapath RTL description for astar
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_astar(clock, reset, in_port_size, in_port_a, in_port_goal, S_oe_ram, S_we_ram, S_addr_ram, S_Wdata_ram, S_data_ram_size, Sin_Rdata_ram, Sin_DataRdy, Sout_Rdata_ram, Sout_DataRdy, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_STORE, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_STORE, selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0, selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_1_0_0, selector_MUX_17_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_1_0_0, selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0, selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0, selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0, selector_MUX_70_reg_5_0_0_0, selector_MUX_71_reg_6_0_0_0, selector_MUX_72_reg_7_0_0_0, selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_0, selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_1, selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0, wrenable_reg_0, wrenable_reg_1, wrenable_reg_10, wrenable_reg_11, wrenable_reg_2, wrenable_reg_3, wrenable_reg_4, wrenable_reg_5, wrenable_reg_6, wrenable_reg_7, wrenable_reg_8, wrenable_reg_9, OUT_CONDITION_astar_28877_29314, OUT_CONDITION_astar_28877_29385);
  parameter MEM_var_28861_28877=32, MEM_var_28864_28877=64, MEM_var_28866_28877=96, MEM_var_28867_28877=128, MEM_var_28868_28877=160;
  // IN
  input clock;
  input reset;
  input [7:0] in_port_size;
  input [31:0] in_port_a;
  input [7:0] in_port_goal;
  input [1:0] S_oe_ram;
  input [1:0] S_we_ram;
  input [63:0] S_addr_ram;
  input [15:0] S_Wdata_ram;
  input [7:0] S_data_ram_size;
  input [15:0] Sin_Rdata_ram;
  input [1:0] Sin_DataRdy;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_STORE;
  input selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0;
  input selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_1_0_0;
  input selector_MUX_17_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_1_0_0;
  input selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0;
  input selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0;
  input selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0;
  input selector_MUX_70_reg_5_0_0_0;
  input selector_MUX_71_reg_6_0_0_0;
  input selector_MUX_72_reg_7_0_0_0;
  input selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_0;
  input selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_1;
  input selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_11;
  input wrenable_reg_2;
  input wrenable_reg_3;
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [15:0] Sout_Rdata_ram;
  output [1:0] Sout_DataRdy;
  output OUT_CONDITION_astar_28877_29314;
  output OUT_CONDITION_astar_28877_29385;
  // Component and signal declarations
  wire [7:0] null_out_signal_array_28861_0_out1_1;
  wire [7:0] null_out_signal_array_28861_0_proxy_out1_0;
  wire [7:0] null_out_signal_array_28861_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_28864_0_out1_1;
  wire [7:0] null_out_signal_array_28864_0_proxy_out1_0;
  wire [7:0] null_out_signal_array_28864_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_28866_0_out1_1;
  wire [7:0] null_out_signal_array_28866_0_proxy_out1_0;
  wire [7:0] null_out_signal_array_28866_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_28867_0_proxy_out1_0;
  wire [7:0] null_out_signal_array_28867_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_28868_0_out1_0;
  wire [7:0] null_out_signal_array_28868_0_out1_1;
  wire [7:0] null_out_signal_array_28868_0_proxy_out1_0;
  wire [7:0] null_out_signal_array_28868_0_proxy_out1_1;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_28861_0;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_28864_0;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_array_28866_0;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_array_28867_0;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_array_28867_0;
  wire [7:0] out_IUdata_converter_FU_18_i0_fu_astar_28877_29560;
  wire [7:0] out_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0;
  wire [31:0] out_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_1_0_0;
  wire [31:0] out_MUX_17_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_1_0_0;
  wire [31:0] out_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0;
  wire [7:0] out_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0;
  wire [31:0] out_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0;
  wire [7:0] out_MUX_70_reg_5_0_0_0;
  wire [7:0] out_MUX_71_reg_6_0_0_0;
  wire [7:0] out_MUX_72_reg_7_0_0_0;
  wire [7:0] out_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_0;
  wire [7:0] out_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_1;
  wire [31:0] out_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0;
  wire signed [8:0] out_UIdata_converter_FU_17_i0_fu_astar_28877_29312;
  wire [31:0] out_UUdata_converter_FU_10_i0_fu_astar_28877_29415;
  wire [31:0] out_UUdata_converter_FU_11_i0_fu_astar_28877_29430;
  wire [31:0] out_UUdata_converter_FU_13_i0_fu_astar_28877_29445;
  wire [31:0] out_UUdata_converter_FU_9_i0_fu_astar_28877_29477;
  wire [31:0] out_addr_expr_FU_12_i0_fu_astar_28877_29515;
  wire [31:0] out_addr_expr_FU_14_i0_fu_astar_28877_29459;
  wire [31:0] out_addr_expr_FU_15_i0_fu_astar_28877_29467;
  wire [31:0] out_addr_expr_FU_7_i0_fu_astar_28877_29408;
  wire [31:0] out_addr_expr_FU_8_i0_fu_astar_28877_29521;
  wire signed [7:0] out_cond_expr_FU_8_8_8_8_25_i0_fu_astar_28877_29304;
  wire out_const_0;
  wire [7:0] out_const_1;
  wire [7:0] out_const_10;
  wire [5:0] out_const_11;
  wire [6:0] out_const_12;
  wire [6:0] out_const_13;
  wire [7:0] out_const_2;
  wire [1:0] out_const_3;
  wire [4:0] out_const_4;
  wire [7:0] out_const_5;
  wire out_const_6;
  wire [1:0] out_const_7;
  wire [1:0] out_const_8;
  wire [7:0] out_const_9;
  wire [31:0] out_conv_out_const_10_8_32;
  wire [31:0] out_conv_out_const_11_6_32;
  wire [31:0] out_conv_out_const_12_7_32;
  wire [31:0] out_conv_out_const_13_7_32;
  wire [3:0] out_conv_out_const_4_5_4;
  wire [31:0] out_conv_out_const_9_8_32;
  wire out_ge_expr_FU_8_8_8_26_i0_fu_astar_28877_29308;
  wire out_gt_expr_FU_8_0_8_27_i0_fu_astar_28877_29609;
  wire [7:0] out_iu_conv_conn_obj_1_IUdata_converter_FU_iu_conv_0;
  wire [7:0] out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_1;
  wire [7:0] out_iu_conv_conn_obj_3_IUdata_converter_FU_iu_conv_2;
  wire [7:0] out_iu_conv_conn_obj_5_IUdata_converter_FU_iu_conv_3;
  wire [7:0] out_iu_conv_conn_obj_8_IUdata_converter_FU_iu_conv_4;
  wire out_ne_expr_FU_8_0_8_28_i0_fu_astar_28877_29303;
  wire out_ne_expr_FU_8_0_8_28_i1_fu_astar_28877_29307;
  wire signed [7:0] out_plus_expr_FU_8_0_8_29_i0_fu_astar_28877_29277;
  wire signed [7:0] out_plus_expr_FU_8_0_8_30_i0_fu_astar_28877_29311;
  wire out_read_cond_FU_19_i0_fu_astar_28877_29314;
  wire out_read_cond_FU_24_i0_fu_astar_28877_29385;
  wire [31:0] out_reg_0_reg_0;
  wire out_reg_10_reg_10;
  wire [7:0] out_reg_11_reg_11;
  wire [31:0] out_reg_1_reg_1;
  wire [31:0] out_reg_2_reg_2;
  wire [31:0] out_reg_3_reg_3;
  wire [31:0] out_reg_4_reg_4;
  wire [7:0] out_reg_5_reg_5;
  wire [7:0] out_reg_6_reg_6;
  wire [7:0] out_reg_7_reg_7;
  wire [7:0] out_reg_8_reg_8;
  wire [7:0] out_reg_9_reg_9;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_31_i0_fu_astar_28877_29309;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_32_i0_fu_astar_28877_29305;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_32_i1_fu_astar_28877_29310;
  wire out_ui_eq_expr_FU_8_8_8_33_i0_fu_astar_28877_29607;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_34_i0_fu_astar_28877_29439;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_34_i1_fu_astar_28877_29553;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_35_i0_fu_astar_28877_29505;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_36_i0_fu_astar_28877_29566;
  wire [7:0] out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_5;
  wire [7:0] out_vb_assign_conn_obj_4_ASSIGN_VECTOR_BOOL_FU_vb_assign_6;
  wire [7:0] out_vb_assign_conn_obj_6_ASSIGN_VECTOR_BOOL_FU_vb_assign_7;
  wire [7:0] out_vb_assign_conn_obj_7_ASSIGN_VECTOR_BOOL_FU_vb_assign_8;
  wire [1:0] sig_in_bus_mergerSout_DataRdy0_0;
  wire [1:0] sig_in_bus_mergerSout_DataRdy0_1;
  wire [1:0] sig_in_bus_mergerSout_DataRdy0_2;
  wire [1:0] sig_in_bus_mergerSout_DataRdy0_3;
  wire [1:0] sig_in_bus_mergerSout_DataRdy0_4;
  wire [15:0] sig_in_bus_mergerSout_Rdata_ram1_0;
  wire [15:0] sig_in_bus_mergerSout_Rdata_ram1_1;
  wire [15:0] sig_in_bus_mergerSout_Rdata_ram1_2;
  wire [15:0] sig_in_bus_mergerSout_Rdata_ram1_3;
  wire [15:0] sig_in_bus_mergerSout_Rdata_ram1_4;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy0_0;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy0_1;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy0_2;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy0_3;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy0_4;
  wire [15:0] sig_in_vector_bus_mergerSout_Rdata_ram1_0;
  wire [15:0] sig_in_vector_bus_mergerSout_Rdata_ram1_1;
  wire [15:0] sig_in_vector_bus_mergerSout_Rdata_ram1_2;
  wire [15:0] sig_in_vector_bus_mergerSout_Rdata_ram1_3;
  wire [15:0] sig_in_vector_bus_mergerSout_Rdata_ram1_4;
  wire [1:0] sig_out_bus_mergerSout_DataRdy0_;
  wire [15:0] sig_out_bus_mergerSout_Rdata_ram1_;
  
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(8), .BITSIZE_out1(8)) ASSIGN_VECTOR_BOOL_FU_vb_assign_5 (.out1(out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_5), .in1(out_const_2));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(8), .BITSIZE_out1(8)) ASSIGN_VECTOR_BOOL_FU_vb_assign_6 (.out1(out_vb_assign_conn_obj_4_ASSIGN_VECTOR_BOOL_FU_vb_assign_6), .in1(out_reg_11_reg_11));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(8), .BITSIZE_out1(8)) ASSIGN_VECTOR_BOOL_FU_vb_assign_7 (.out1(out_vb_assign_conn_obj_6_ASSIGN_VECTOR_BOOL_FU_vb_assign_7), .in1(out_reg_7_reg_7));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(8), .BITSIZE_out1(8)) ASSIGN_VECTOR_BOOL_FU_vb_assign_8 (.out1(out_vb_assign_conn_obj_7_ASSIGN_VECTOR_BOOL_FU_vb_assign_8), .in1(out_reg_5_reg_5));
  IUdata_converter_FU #(.BITSIZE_in1(8), .BITSIZE_out1(8)) IUdata_converter_FU_iu_conv_0 (.out1(out_iu_conv_conn_obj_1_IUdata_converter_FU_iu_conv_0), .in1(out_const_1));
  IUdata_converter_FU #(.BITSIZE_in1(8), .BITSIZE_out1(8)) IUdata_converter_FU_iu_conv_1 (.out1(out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_1), .in1(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(8), .BITSIZE_out1(8)) IUdata_converter_FU_iu_conv_2 (.out1(out_iu_conv_conn_obj_3_IUdata_converter_FU_iu_conv_2), .in1(out_reg_6_reg_6));
  IUdata_converter_FU #(.BITSIZE_in1(8), .BITSIZE_out1(8)) IUdata_converter_FU_iu_conv_3 (.out1(out_iu_conv_conn_obj_5_IUdata_converter_FU_iu_conv_3), .in1(out_reg_8_reg_8));
  IUdata_converter_FU #(.BITSIZE_in1(8), .BITSIZE_out1(8)) IUdata_converter_FU_iu_conv_4 (.out1(out_iu_conv_conn_obj_8_IUdata_converter_FU_iu_conv_4), .in1(out_reg_6_reg_6));
  MUX_GATE #(.BITSIZE_in1(8), .BITSIZE_in2(8), .BITSIZE_out1(8)) MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0 (.out1(out_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0), .sel(selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0), .in1(out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_5), .in2(out_vb_assign_conn_obj_6_ASSIGN_VECTOR_BOOL_FU_vb_assign_7));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_1_0_0 (.out1(out_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_1_0_0), .sel(selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_1_0_0), .in1(out_reg_1_reg_1), .in2(out_ui_pointer_plus_expr_FU_32_32_32_36_i0_fu_astar_28877_29566));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_17_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_1_0_0 (.out1(out_MUX_17_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_1_0_0), .sel(selector_MUX_17_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_1_0_0), .in1(out_reg_4_reg_4), .in2(out_UUdata_converter_FU_13_i0_fu_astar_28877_29445));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 (.out1(out_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0), .sel(selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0), .in1(out_reg_0_reg_0), .in2(out_addr_expr_FU_7_i0_fu_astar_28877_29408));
  MUX_GATE #(.BITSIZE_in1(8), .BITSIZE_in2(8), .BITSIZE_out1(8)) MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0 (.out1(out_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0), .sel(selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0), .in1(out_vb_assign_conn_obj_4_ASSIGN_VECTOR_BOOL_FU_vb_assign_6), .in2(out_vb_assign_conn_obj_7_ASSIGN_VECTOR_BOOL_FU_vb_assign_8));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0 (.out1(out_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0), .sel(selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0), .in1(out_reg_3_reg_3), .in2(out_addr_expr_FU_15_i0_fu_astar_28877_29467));
  MUX_GATE #(.BITSIZE_in1(8), .BITSIZE_in2(8), .BITSIZE_out1(8)) MUX_70_reg_5_0_0_0 (.out1(out_MUX_70_reg_5_0_0_0), .sel(selector_MUX_70_reg_5_0_0_0), .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_28864_0), .in2(out_ui_cond_expr_FU_8_8_8_8_32_i1_fu_astar_28877_29310));
  MUX_GATE #(.BITSIZE_in1(8), .BITSIZE_in2(8), .BITSIZE_out1(8)) MUX_71_reg_6_0_0_0 (.out1(out_MUX_71_reg_6_0_0_0), .sel(selector_MUX_71_reg_6_0_0_0), .in1(out_reg_8_reg_8), .in2(out_plus_expr_FU_8_0_8_29_i0_fu_astar_28877_29277));
  MUX_GATE #(.BITSIZE_in1(8), .BITSIZE_in2(8), .BITSIZE_out1(8)) MUX_72_reg_7_0_0_0 (.out1(out_MUX_72_reg_7_0_0_0), .sel(selector_MUX_72_reg_7_0_0_0), .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_28861_0), .in2(in_port_size));
  MUX_GATE #(.BITSIZE_in1(8), .BITSIZE_in2(8), .BITSIZE_out1(8)) MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_0 (.out1(out_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_0), .sel(selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_0), .in1(out_iu_conv_conn_obj_3_IUdata_converter_FU_iu_conv_2), .in2(out_iu_conv_conn_obj_5_IUdata_converter_FU_iu_conv_3));
  MUX_GATE #(.BITSIZE_in1(8), .BITSIZE_in2(8), .BITSIZE_out1(8)) MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_1 (.out1(out_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_1), .sel(selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_1), .in1(out_iu_conv_conn_obj_8_IUdata_converter_FU_iu_conv_4), .in2(out_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0 (.out1(out_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0), .sel(selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0), .in1(out_reg_2_reg_2), .in2(out_addr_expr_FU_14_i0_fu_astar_28877_29459));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(8), .PORTSIZE_in1(2), .BITSIZE_in2(32), .PORTSIZE_in2(2), .BITSIZE_in3(4), .PORTSIZE_in3(2), .BITSIZE_in4(1), .PORTSIZE_in4(2), .BITSIZE_sel_LOAD(1), .PORTSIZE_sel_LOAD(2), .BITSIZE_sel_STORE(1), .PORTSIZE_sel_STORE(2), .BITSIZE_S_oe_ram(1), .PORTSIZE_S_oe_ram(2), .BITSIZE_S_we_ram(1), .PORTSIZE_S_we_ram(2), .BITSIZE_out1(8), .PORTSIZE_out1(2), .BITSIZE_S_addr_ram(32), .PORTSIZE_S_addr_ram(2), .BITSIZE_S_Wdata_ram(8), .PORTSIZE_S_Wdata_ram(2), .BITSIZE_Sin_Rdata_ram(8), .PORTSIZE_Sin_Rdata_ram(2), .BITSIZE_Sout_Rdata_ram(8), .PORTSIZE_Sout_Rdata_ram(2), .BITSIZE_S_data_ram_size(4), .PORTSIZE_S_data_ram_size(2), .BITSIZE_Sin_DataRdy(1), .PORTSIZE_Sin_DataRdy(2), .BITSIZE_Sout_DataRdy(1), .PORTSIZE_Sout_DataRdy(2), .MEMORY_INIT_file("array_ref_28861.mem"), .n_elements(1), .data_size(8), .address_space_begin(MEM_var_28861_28877), .address_space_rangesize(32), .BUS_PIPELINED(1), .BRAM_BITSIZE(8), .PRIVATE_MEMORY(0), .READ_ONLY_MEMORY(0), .USE_SPARSE_MEMORY(1), .BITSIZE_proxy_in1(8), .PORTSIZE_proxy_in1(2), .BITSIZE_proxy_in2(32), .PORTSIZE_proxy_in2(2), .BITSIZE_proxy_in3(4), .PORTSIZE_proxy_in3(2), .BITSIZE_proxy_sel_LOAD(1), .PORTSIZE_proxy_sel_LOAD(2), .BITSIZE_proxy_sel_STORE(1), .PORTSIZE_proxy_sel_STORE(2), .BITSIZE_proxy_out1(8), .PORTSIZE_proxy_out1(2)) array_28861_0 (.out1({null_out_signal_array_28861_0_out1_1, out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_28861_0}), .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram1_0), .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy0_0), .proxy_out1({null_out_signal_array_28861_0_proxy_out1_1, null_out_signal_array_28861_0_proxy_out1_0}), .clock(clock), .reset(reset), .in1({8'b00000000, out_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0}), .in2({32'b00000000000000000000000000000000, out_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0}), .in3({4'b0000, out_conv_out_const_4_5_4}), .in4({1'b0, out_const_6}), .sel_LOAD({1'b0, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD}), .sel_STORE({1'b0, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE}), .S_oe_ram(S_oe_ram), .S_we_ram(S_we_ram), .S_addr_ram(S_addr_ram), .S_Wdata_ram(S_Wdata_ram), .Sin_Rdata_ram(Sin_Rdata_ram), .S_data_ram_size(S_data_ram_size), .Sin_DataRdy(Sin_DataRdy), .proxy_in1({8'b00000000, 8'b00000000}), .proxy_in2({32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000}), .proxy_in3({4'b0000, 4'b0000}), .proxy_sel_LOAD({1'b0, 1'b0}), .proxy_sel_STORE({1'b0, 1'b0}));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(8), .PORTSIZE_in1(2), .BITSIZE_in2(32), .PORTSIZE_in2(2), .BITSIZE_in3(4), .PORTSIZE_in3(2), .BITSIZE_in4(1), .PORTSIZE_in4(2), .BITSIZE_sel_LOAD(1), .PORTSIZE_sel_LOAD(2), .BITSIZE_sel_STORE(1), .PORTSIZE_sel_STORE(2), .BITSIZE_S_oe_ram(1), .PORTSIZE_S_oe_ram(2), .BITSIZE_S_we_ram(1), .PORTSIZE_S_we_ram(2), .BITSIZE_out1(8), .PORTSIZE_out1(2), .BITSIZE_S_addr_ram(32), .PORTSIZE_S_addr_ram(2), .BITSIZE_S_Wdata_ram(8), .PORTSIZE_S_Wdata_ram(2), .BITSIZE_Sin_Rdata_ram(8), .PORTSIZE_Sin_Rdata_ram(2), .BITSIZE_Sout_Rdata_ram(8), .PORTSIZE_Sout_Rdata_ram(2), .BITSIZE_S_data_ram_size(4), .PORTSIZE_S_data_ram_size(2), .BITSIZE_Sin_DataRdy(1), .PORTSIZE_Sin_DataRdy(2), .BITSIZE_Sout_DataRdy(1), .PORTSIZE_Sout_DataRdy(2), .MEMORY_INIT_file("array_ref_28864.mem"), .n_elements(1), .data_size(8), .address_space_begin(MEM_var_28864_28877), .address_space_rangesize(32), .BUS_PIPELINED(1), .BRAM_BITSIZE(8), .PRIVATE_MEMORY(0), .READ_ONLY_MEMORY(0), .USE_SPARSE_MEMORY(1), .BITSIZE_proxy_in1(8), .PORTSIZE_proxy_in1(2), .BITSIZE_proxy_in2(32), .PORTSIZE_proxy_in2(2), .BITSIZE_proxy_in3(4), .PORTSIZE_proxy_in3(2), .BITSIZE_proxy_sel_LOAD(1), .PORTSIZE_proxy_sel_LOAD(2), .BITSIZE_proxy_sel_STORE(1), .PORTSIZE_proxy_sel_STORE(2), .BITSIZE_proxy_out1(8), .PORTSIZE_proxy_out1(2)) array_28864_0 (.out1({null_out_signal_array_28864_0_out1_1, out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_28864_0}), .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram1_1), .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy0_1), .proxy_out1({null_out_signal_array_28864_0_proxy_out1_1, null_out_signal_array_28864_0_proxy_out1_0}), .clock(clock), .reset(reset), .in1({8'b00000000, out_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0}), .in2({32'b00000000000000000000000000000000, out_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0}), .in3({4'b0000, out_conv_out_const_4_5_4}), .in4({1'b0, out_const_6}), .sel_LOAD({1'b0, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD}), .sel_STORE({1'b0, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE}), .S_oe_ram(S_oe_ram), .S_we_ram(S_we_ram), .S_addr_ram(S_addr_ram), .S_Wdata_ram(S_Wdata_ram), .Sin_Rdata_ram(Sin_Rdata_ram), .S_data_ram_size(S_data_ram_size), .Sin_DataRdy(Sin_DataRdy), .proxy_in1({8'b00000000, 8'b00000000}), .proxy_in2({32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000}), .proxy_in3({4'b0000, 4'b0000}), .proxy_sel_LOAD({1'b0, 1'b0}), .proxy_sel_STORE({1'b0, 1'b0}));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(8), .PORTSIZE_in1(2), .BITSIZE_in2(32), .PORTSIZE_in2(2), .BITSIZE_in3(4), .PORTSIZE_in3(2), .BITSIZE_in4(1), .PORTSIZE_in4(2), .BITSIZE_sel_LOAD(1), .PORTSIZE_sel_LOAD(2), .BITSIZE_sel_STORE(1), .PORTSIZE_sel_STORE(2), .BITSIZE_S_oe_ram(1), .PORTSIZE_S_oe_ram(2), .BITSIZE_S_we_ram(1), .PORTSIZE_S_we_ram(2), .BITSIZE_out1(8), .PORTSIZE_out1(2), .BITSIZE_S_addr_ram(32), .PORTSIZE_S_addr_ram(2), .BITSIZE_S_Wdata_ram(8), .PORTSIZE_S_Wdata_ram(2), .BITSIZE_Sin_Rdata_ram(8), .PORTSIZE_Sin_Rdata_ram(2), .BITSIZE_Sout_Rdata_ram(8), .PORTSIZE_Sout_Rdata_ram(2), .BITSIZE_S_data_ram_size(4), .PORTSIZE_S_data_ram_size(2), .BITSIZE_Sin_DataRdy(1), .PORTSIZE_Sin_DataRdy(2), .BITSIZE_Sout_DataRdy(1), .PORTSIZE_Sout_DataRdy(2), .MEMORY_INIT_file("array_ref_28866.mem"), .n_elements(1), .data_size(8), .address_space_begin(MEM_var_28866_28877), .address_space_rangesize(32), .BUS_PIPELINED(1), .BRAM_BITSIZE(8), .PRIVATE_MEMORY(0), .READ_ONLY_MEMORY(0), .USE_SPARSE_MEMORY(1), .BITSIZE_proxy_in1(8), .PORTSIZE_proxy_in1(2), .BITSIZE_proxy_in2(32), .PORTSIZE_proxy_in2(2), .BITSIZE_proxy_in3(4), .PORTSIZE_proxy_in3(2), .BITSIZE_proxy_sel_LOAD(1), .PORTSIZE_proxy_sel_LOAD(2), .BITSIZE_proxy_sel_STORE(1), .PORTSIZE_proxy_sel_STORE(2), .BITSIZE_proxy_out1(8), .PORTSIZE_proxy_out1(2)) array_28866_0 (.out1({null_out_signal_array_28866_0_out1_1, out_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_array_28866_0}), .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram1_2), .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy0_2), .proxy_out1({null_out_signal_array_28866_0_proxy_out1_1, null_out_signal_array_28866_0_proxy_out1_0}), .clock(clock), .reset(reset), .in1({8'b00000000, out_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_1}), .in2({32'b00000000000000000000000000000000, out_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0}), .in3({4'b0000, out_conv_out_const_4_5_4}), .in4({1'b0, out_const_6}), .sel_LOAD({1'b0, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD}), .sel_STORE({1'b0, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE}), .S_oe_ram(S_oe_ram), .S_we_ram(S_we_ram), .S_addr_ram(S_addr_ram), .S_Wdata_ram(S_Wdata_ram), .Sin_Rdata_ram(Sin_Rdata_ram), .S_data_ram_size(S_data_ram_size), .Sin_DataRdy(Sin_DataRdy), .proxy_in1({8'b00000000, 8'b00000000}), .proxy_in2({32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000}), .proxy_in3({4'b0000, 4'b0000}), .proxy_sel_LOAD({1'b0, 1'b0}), .proxy_sel_STORE({1'b0, 1'b0}));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(8), .PORTSIZE_in1(2), .BITSIZE_in2(32), .PORTSIZE_in2(2), .BITSIZE_in3(4), .PORTSIZE_in3(2), .BITSIZE_in4(1), .PORTSIZE_in4(2), .BITSIZE_sel_LOAD(1), .PORTSIZE_sel_LOAD(2), .BITSIZE_sel_STORE(1), .PORTSIZE_sel_STORE(2), .BITSIZE_S_oe_ram(1), .PORTSIZE_S_oe_ram(2), .BITSIZE_S_we_ram(1), .PORTSIZE_S_we_ram(2), .BITSIZE_out1(8), .PORTSIZE_out1(2), .BITSIZE_S_addr_ram(32), .PORTSIZE_S_addr_ram(2), .BITSIZE_S_Wdata_ram(8), .PORTSIZE_S_Wdata_ram(2), .BITSIZE_Sin_Rdata_ram(8), .PORTSIZE_Sin_Rdata_ram(2), .BITSIZE_Sout_Rdata_ram(8), .PORTSIZE_Sout_Rdata_ram(2), .BITSIZE_S_data_ram_size(4), .PORTSIZE_S_data_ram_size(2), .BITSIZE_Sin_DataRdy(1), .PORTSIZE_Sin_DataRdy(2), .BITSIZE_Sout_DataRdy(1), .PORTSIZE_Sout_DataRdy(2), .MEMORY_INIT_file("array_ref_28867.mem"), .n_elements(2), .data_size(8), .address_space_begin(MEM_var_28867_28877), .address_space_rangesize(32), .BUS_PIPELINED(1), .BRAM_BITSIZE(8), .PRIVATE_MEMORY(0), .READ_ONLY_MEMORY(0), .USE_SPARSE_MEMORY(1), .BITSIZE_proxy_in1(8), .PORTSIZE_proxy_in1(2), .BITSIZE_proxy_in2(32), .PORTSIZE_proxy_in2(2), .BITSIZE_proxy_in3(4), .PORTSIZE_proxy_in3(2), .BITSIZE_proxy_sel_LOAD(1), .PORTSIZE_proxy_sel_LOAD(2), .BITSIZE_proxy_sel_STORE(1), .PORTSIZE_proxy_sel_STORE(2), .BITSIZE_proxy_out1(8), .PORTSIZE_proxy_out1(2)) array_28867_0 (.out1({out_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_array_28867_0, out_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_array_28867_0}), .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram1_3), .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy0_3), .proxy_out1({null_out_signal_array_28867_0_proxy_out1_1, null_out_signal_array_28867_0_proxy_out1_0}), .clock(clock), .reset(reset), .in1({out_iu_conv_conn_obj_1_IUdata_converter_FU_iu_conv_0, out_iu_conv_conn_obj_1_IUdata_converter_FU_iu_conv_0}), .in2({out_MUX_17_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_1_0_0, out_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_1_0_0}), .in3({out_conv_out_const_4_5_4, out_conv_out_const_4_5_4}), .in4({out_const_6, out_const_6}), .sel_LOAD({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD}), .sel_STORE({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE}), .S_oe_ram(S_oe_ram), .S_we_ram(S_we_ram), .S_addr_ram(S_addr_ram), .S_Wdata_ram(S_Wdata_ram), .Sin_Rdata_ram(Sin_Rdata_ram), .S_data_ram_size(S_data_ram_size), .Sin_DataRdy(Sin_DataRdy), .proxy_in1({8'b00000000, 8'b00000000}), .proxy_in2({32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000}), .proxy_in3({4'b0000, 4'b0000}), .proxy_sel_LOAD({1'b0, 1'b0}), .proxy_sel_STORE({1'b0, 1'b0}));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(8), .PORTSIZE_in1(2), .BITSIZE_in2(32), .PORTSIZE_in2(2), .BITSIZE_in3(4), .PORTSIZE_in3(2), .BITSIZE_in4(1), .PORTSIZE_in4(2), .BITSIZE_sel_LOAD(1), .PORTSIZE_sel_LOAD(2), .BITSIZE_sel_STORE(1), .PORTSIZE_sel_STORE(2), .BITSIZE_S_oe_ram(1), .PORTSIZE_S_oe_ram(2), .BITSIZE_S_we_ram(1), .PORTSIZE_S_we_ram(2), .BITSIZE_out1(8), .PORTSIZE_out1(2), .BITSIZE_S_addr_ram(32), .PORTSIZE_S_addr_ram(2), .BITSIZE_S_Wdata_ram(8), .PORTSIZE_S_Wdata_ram(2), .BITSIZE_Sin_Rdata_ram(8), .PORTSIZE_Sin_Rdata_ram(2), .BITSIZE_Sout_Rdata_ram(8), .PORTSIZE_Sout_Rdata_ram(2), .BITSIZE_S_data_ram_size(4), .PORTSIZE_S_data_ram_size(2), .BITSIZE_Sin_DataRdy(1), .PORTSIZE_Sin_DataRdy(2), .BITSIZE_Sout_DataRdy(1), .PORTSIZE_Sout_DataRdy(2), .MEMORY_INIT_file("array_ref_28868.mem"), .n_elements(4), .data_size(8), .address_space_begin(MEM_var_28868_28877), .address_space_rangesize(32), .BUS_PIPELINED(1), .BRAM_BITSIZE(8), .PRIVATE_MEMORY(0), .READ_ONLY_MEMORY(0), .USE_SPARSE_MEMORY(1), .BITSIZE_proxy_in1(8), .PORTSIZE_proxy_in1(2), .BITSIZE_proxy_in2(32), .PORTSIZE_proxy_in2(2), .BITSIZE_proxy_in3(4), .PORTSIZE_proxy_in3(2), .BITSIZE_proxy_sel_LOAD(1), .PORTSIZE_proxy_sel_LOAD(2), .BITSIZE_proxy_sel_STORE(1), .PORTSIZE_proxy_sel_STORE(2), .BITSIZE_proxy_out1(8), .PORTSIZE_proxy_out1(2)) array_28868_0 (.out1({null_out_signal_array_28868_0_out1_1, null_out_signal_array_28868_0_out1_0}), .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram1_4), .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy0_4), .proxy_out1({null_out_signal_array_28868_0_proxy_out1_1, null_out_signal_array_28868_0_proxy_out1_0}), .clock(clock), .reset(reset), .in1({out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_1, out_iu_conv_conn_obj_1_IUdata_converter_FU_iu_conv_0}), .in2({out_ui_pointer_plus_expr_FU_32_0_32_34_i0_fu_astar_28877_29439, out_UUdata_converter_FU_10_i0_fu_astar_28877_29415}), .in3({out_conv_out_const_4_5_4, out_conv_out_const_4_5_4}), .in4({out_const_6, out_const_6}), .sel_LOAD({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_LOAD}), .sel_STORE({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_STORE, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_STORE}), .S_oe_ram(S_oe_ram), .S_we_ram(S_we_ram), .S_addr_ram(S_addr_ram), .S_Wdata_ram(S_Wdata_ram), .Sin_Rdata_ram(Sin_Rdata_ram), .S_data_ram_size(S_data_ram_size), .Sin_DataRdy(Sin_DataRdy), .proxy_in1({8'b00000000, 8'b00000000}), .proxy_in2({32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000}), .proxy_in3({4'b0000, 4'b0000}), .proxy_sel_LOAD({1'b0, 1'b0}), .proxy_sel_STORE({1'b0, 1'b0}));
  bus_merger #(.BITSIZE_in1(2), .PORTSIZE_in1(5), .BITSIZE_out1(2)) bus_mergerSout_DataRdy0_ (.out1(sig_out_bus_mergerSout_DataRdy0_), .in1({sig_in_bus_mergerSout_DataRdy0_4, sig_in_bus_mergerSout_DataRdy0_3, sig_in_bus_mergerSout_DataRdy0_2, sig_in_bus_mergerSout_DataRdy0_1, sig_in_bus_mergerSout_DataRdy0_0}));
  bus_merger #(.BITSIZE_in1(16), .PORTSIZE_in1(5), .BITSIZE_out1(16)) bus_mergerSout_Rdata_ram1_ (.out1(sig_out_bus_mergerSout_Rdata_ram1_), .in1({sig_in_bus_mergerSout_Rdata_ram1_4, sig_in_bus_mergerSout_Rdata_ram1_3, sig_in_bus_mergerSout_Rdata_ram1_2, sig_in_bus_mergerSout_Rdata_ram1_1, sig_in_bus_mergerSout_Rdata_ram1_0}));
  constant_value #(.BITSIZE_out1(1), .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(8), .value(8'b00000000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(8), .value(MEM_var_28868_28877)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(6), .value(MEM_var_28861_28877)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(7), .value(MEM_var_28864_28877)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(7), .value(MEM_var_28866_28877)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(8), .value(8'b00000010)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(2), .value(2'b01)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(5), .value(5'b01000)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(8), .value(8'b01111111)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(1), .value(1'b1)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(2), .value(2'b10)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(2), .value(2'b11)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(8), .value(MEM_var_28867_28877)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(8), .BITSIZE_out1(32)) conv_out_const_10_8_32 (.out1(out_conv_out_const_10_8_32), .in1(out_const_10));
  UUdata_converter_FU #(.BITSIZE_in1(6), .BITSIZE_out1(32)) conv_out_const_11_6_32 (.out1(out_conv_out_const_11_6_32), .in1(out_const_11));
  UUdata_converter_FU #(.BITSIZE_in1(7), .BITSIZE_out1(32)) conv_out_const_12_7_32 (.out1(out_conv_out_const_12_7_32), .in1(out_const_12));
  UUdata_converter_FU #(.BITSIZE_in1(7), .BITSIZE_out1(32)) conv_out_const_13_7_32 (.out1(out_conv_out_const_13_7_32), .in1(out_const_13));
  UUdata_converter_FU #(.BITSIZE_in1(5), .BITSIZE_out1(4)) conv_out_const_4_5_4 (.out1(out_conv_out_const_4_5_4), .in1(out_const_4));
  UUdata_converter_FU #(.BITSIZE_in1(8), .BITSIZE_out1(32)) conv_out_const_9_8_32 (.out1(out_conv_out_const_9_8_32), .in1(out_const_9));
  plus_expr_FU #(.BITSIZE_in1(8), .BITSIZE_in2(2), .BITSIZE_out1(8)) fu_astar_28877_29277 (.out1(out_plus_expr_FU_8_0_8_29_i0_fu_astar_28877_29277), .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_array_28866_0), .in2(out_const_3));
  ne_expr_FU #(.BITSIZE_in1(8), .BITSIZE_in2(1), .BITSIZE_out1(1)) fu_astar_28877_29303 (.out1(out_ne_expr_FU_8_0_8_28_i0_fu_astar_28877_29303), .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_array_28867_0), .in2(out_const_0));
  cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(8), .BITSIZE_in3(8), .BITSIZE_out1(8)) fu_astar_28877_29304 (.out1(out_cond_expr_FU_8_8_8_8_25_i0_fu_astar_28877_29304), .in1(out_ne_expr_FU_8_0_8_28_i0_fu_astar_28877_29303), .in2(out_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_array_28867_0), .in3(out_const_5));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(1), .BITSIZE_in3(8), .BITSIZE_out1(8)) fu_astar_28877_29305 (.out1(out_ui_cond_expr_FU_8_8_8_8_32_i0_fu_astar_28877_29305), .in1(out_ne_expr_FU_8_0_8_28_i0_fu_astar_28877_29303), .in2(out_const_0), .in3(out_reg_5_reg_5));
  ne_expr_FU #(.BITSIZE_in1(8), .BITSIZE_in2(1), .BITSIZE_out1(1)) fu_astar_28877_29307 (.out1(out_ne_expr_FU_8_0_8_28_i1_fu_astar_28877_29307), .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_array_28867_0), .in2(out_const_0));
  ge_expr_FU #(.BITSIZE_in1(8), .BITSIZE_in2(8), .BITSIZE_out1(1)) fu_astar_28877_29308 (.out1(out_ge_expr_FU_8_8_8_26_i0_fu_astar_28877_29308), .in1(out_cond_expr_FU_8_8_8_8_25_i0_fu_astar_28877_29304), .in2(out_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_array_28867_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(1), .BITSIZE_out1(1)) fu_astar_28877_29309 (.out1(out_ui_bit_and_expr_FU_1_1_1_31_i0_fu_astar_28877_29309), .in1(out_ge_expr_FU_8_8_8_26_i0_fu_astar_28877_29308), .in2(out_ne_expr_FU_8_0_8_28_i1_fu_astar_28877_29307));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(1), .BITSIZE_in3(8), .BITSIZE_out1(8)) fu_astar_28877_29310 (.out1(out_ui_cond_expr_FU_8_8_8_8_32_i1_fu_astar_28877_29310), .in1(out_reg_10_reg_10), .in2(out_const_6), .in3(out_reg_9_reg_9));
  plus_expr_FU #(.BITSIZE_in1(8), .BITSIZE_in2(2), .BITSIZE_out1(8)) fu_astar_28877_29311 (.out1(out_plus_expr_FU_8_0_8_30_i0_fu_astar_28877_29311), .in1(out_reg_6_reg_6), .in2(out_const_8));
  UIdata_converter_FU #(.BITSIZE_in1(8), .BITSIZE_out1(9)) fu_astar_28877_29312 (.out1(out_UIdata_converter_FU_17_i0_fu_astar_28877_29312), .in1(out_ui_cond_expr_FU_8_8_8_8_32_i1_fu_astar_28877_29310));
  read_cond_FU #(.BITSIZE_in1(1)) fu_astar_28877_29314 (.out1(out_read_cond_FU_19_i0_fu_astar_28877_29314), .in1(out_ui_eq_expr_FU_8_8_8_33_i0_fu_astar_28877_29607));
  read_cond_FU #(.BITSIZE_in1(1)) fu_astar_28877_29385 (.out1(out_read_cond_FU_24_i0_fu_astar_28877_29385), .in1(out_gt_expr_FU_8_0_8_27_i0_fu_astar_28877_29609));
  addr_expr_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) fu_astar_28877_29408 (.out1(out_addr_expr_FU_7_i0_fu_astar_28877_29408), .in1(out_conv_out_const_11_6_32));
  UUdata_converter_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) fu_astar_28877_29415 (.out1(out_UUdata_converter_FU_10_i0_fu_astar_28877_29415), .in1(out_UUdata_converter_FU_9_i0_fu_astar_28877_29477));
  UUdata_converter_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) fu_astar_28877_29430 (.out1(out_UUdata_converter_FU_11_i0_fu_astar_28877_29430), .in1(out_ui_pointer_plus_expr_FU_32_0_32_35_i0_fu_astar_28877_29505));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(1), .BITSIZE_out1(32), .LSB_PARAMETER(0)) fu_astar_28877_29439 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_34_i0_fu_astar_28877_29439), .in1(out_UUdata_converter_FU_11_i0_fu_astar_28877_29430), .in2(out_const_6));
  UUdata_converter_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) fu_astar_28877_29445 (.out1(out_UUdata_converter_FU_13_i0_fu_astar_28877_29445), .in1(out_addr_expr_FU_12_i0_fu_astar_28877_29515));
  addr_expr_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) fu_astar_28877_29459 (.out1(out_addr_expr_FU_14_i0_fu_astar_28877_29459), .in1(out_conv_out_const_13_7_32));
  addr_expr_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) fu_astar_28877_29467 (.out1(out_addr_expr_FU_15_i0_fu_astar_28877_29467), .in1(out_conv_out_const_12_7_32));
  UUdata_converter_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) fu_astar_28877_29477 (.out1(out_UUdata_converter_FU_9_i0_fu_astar_28877_29477), .in1(out_addr_expr_FU_8_i0_fu_astar_28877_29521));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(2), .BITSIZE_out1(32), .LSB_PARAMETER(0)) fu_astar_28877_29505 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_35_i0_fu_astar_28877_29505), .in1(out_UUdata_converter_FU_9_i0_fu_astar_28877_29477), .in2(out_const_7));
  addr_expr_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) fu_astar_28877_29515 (.out1(out_addr_expr_FU_12_i0_fu_astar_28877_29515), .in1(out_conv_out_const_9_8_32));
  addr_expr_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) fu_astar_28877_29521 (.out1(out_addr_expr_FU_8_i0_fu_astar_28877_29521), .in1(out_conv_out_const_10_8_32));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(1), .BITSIZE_out1(32), .LSB_PARAMETER(0)) fu_astar_28877_29553 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_34_i1_fu_astar_28877_29553), .in1(out_UUdata_converter_FU_13_i0_fu_astar_28877_29445), .in2(out_const_6));
  IUdata_converter_FU #(.BITSIZE_in1(9), .BITSIZE_out1(8)) fu_astar_28877_29560 (.out1(out_IUdata_converter_FU_18_i0_fu_astar_28877_29560), .in1(out_UIdata_converter_FU_17_i0_fu_astar_28877_29312));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(8), .BITSIZE_out1(32), .LSB_PARAMETER(0)) fu_astar_28877_29566 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_36_i0_fu_astar_28877_29566), .in1(out_reg_1_reg_1), .in2(out_IUdata_converter_FU_18_i0_fu_astar_28877_29560));
  ui_eq_expr_FU #(.BITSIZE_in1(8), .BITSIZE_in2(8), .BITSIZE_out1(1)) fu_astar_28877_29607 (.out1(out_ui_eq_expr_FU_8_8_8_33_i0_fu_astar_28877_29607), .in1(in_port_goal), .in2(out_ui_cond_expr_FU_8_8_8_8_32_i1_fu_astar_28877_29310));
  gt_expr_FU #(.BITSIZE_in1(8), .BITSIZE_in2(1), .BITSIZE_out1(1)) fu_astar_28877_29609 (.out1(out_gt_expr_FU_8_0_8_27_i0_fu_astar_28877_29609), .in1(out_reg_6_reg_6), .in2(out_const_0));
  join_signal #(.BITSIZE_in1(1), .PORTSIZE_in1(2), .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy0_0 (.out1(sig_in_bus_mergerSout_DataRdy0_0), .in1(sig_in_vector_bus_mergerSout_DataRdy0_0));
  join_signal #(.BITSIZE_in1(1), .PORTSIZE_in1(2), .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy0_1 (.out1(sig_in_bus_mergerSout_DataRdy0_1), .in1(sig_in_vector_bus_mergerSout_DataRdy0_1));
  join_signal #(.BITSIZE_in1(1), .PORTSIZE_in1(2), .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy0_2 (.out1(sig_in_bus_mergerSout_DataRdy0_2), .in1(sig_in_vector_bus_mergerSout_DataRdy0_2));
  join_signal #(.BITSIZE_in1(1), .PORTSIZE_in1(2), .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy0_3 (.out1(sig_in_bus_mergerSout_DataRdy0_3), .in1(sig_in_vector_bus_mergerSout_DataRdy0_3));
  join_signal #(.BITSIZE_in1(1), .PORTSIZE_in1(2), .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy0_4 (.out1(sig_in_bus_mergerSout_DataRdy0_4), .in1(sig_in_vector_bus_mergerSout_DataRdy0_4));
  join_signal #(.BITSIZE_in1(8), .PORTSIZE_in1(2), .BITSIZE_out1(16)) join_signalbus_mergerSout_Rdata_ram1_0 (.out1(sig_in_bus_mergerSout_Rdata_ram1_0), .in1(sig_in_vector_bus_mergerSout_Rdata_ram1_0));
  join_signal #(.BITSIZE_in1(8), .PORTSIZE_in1(2), .BITSIZE_out1(16)) join_signalbus_mergerSout_Rdata_ram1_1 (.out1(sig_in_bus_mergerSout_Rdata_ram1_1), .in1(sig_in_vector_bus_mergerSout_Rdata_ram1_1));
  join_signal #(.BITSIZE_in1(8), .PORTSIZE_in1(2), .BITSIZE_out1(16)) join_signalbus_mergerSout_Rdata_ram1_2 (.out1(sig_in_bus_mergerSout_Rdata_ram1_2), .in1(sig_in_vector_bus_mergerSout_Rdata_ram1_2));
  join_signal #(.BITSIZE_in1(8), .PORTSIZE_in1(2), .BITSIZE_out1(16)) join_signalbus_mergerSout_Rdata_ram1_3 (.out1(sig_in_bus_mergerSout_Rdata_ram1_3), .in1(sig_in_vector_bus_mergerSout_Rdata_ram1_3));
  join_signal #(.BITSIZE_in1(8), .PORTSIZE_in1(2), .BITSIZE_out1(16)) join_signalbus_mergerSout_Rdata_ram1_4 (.out1(sig_in_bus_mergerSout_Rdata_ram1_4), .in1(sig_in_vector_bus_mergerSout_Rdata_ram1_4));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0), .clock(clock), .reset(reset), .in1(out_addr_expr_FU_7_i0_fu_astar_28877_29408), .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1), .clock(clock), .reset(reset), .in1(out_UUdata_converter_FU_13_i0_fu_astar_28877_29445), .wenable(wrenable_reg_1));
  register_STD #(.BITSIZE_in1(1), .BITSIZE_out1(1)) reg_10 (.out1(out_reg_10_reg_10), .clock(clock), .reset(reset), .in1(out_ui_bit_and_expr_FU_1_1_1_31_i0_fu_astar_28877_29309), .wenable(wrenable_reg_10));
  register_STD #(.BITSIZE_in1(8), .BITSIZE_out1(8)) reg_11 (.out1(out_reg_11_reg_11), .clock(clock), .reset(reset), .in1(out_ui_cond_expr_FU_8_8_8_8_32_i1_fu_astar_28877_29310), .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2), .clock(clock), .reset(reset), .in1(out_addr_expr_FU_14_i0_fu_astar_28877_29459), .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3), .clock(clock), .reset(reset), .in1(out_addr_expr_FU_15_i0_fu_astar_28877_29467), .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4), .clock(clock), .reset(reset), .in1(out_ui_pointer_plus_expr_FU_32_0_32_34_i1_fu_astar_28877_29553), .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(8), .BITSIZE_out1(8)) reg_5 (.out1(out_reg_5_reg_5), .clock(clock), .reset(reset), .in1(out_MUX_70_reg_5_0_0_0), .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(8), .BITSIZE_out1(8)) reg_6 (.out1(out_reg_6_reg_6), .clock(clock), .reset(reset), .in1(out_MUX_71_reg_6_0_0_0), .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(8), .BITSIZE_out1(8)) reg_7 (.out1(out_reg_7_reg_7), .clock(clock), .reset(reset), .in1(out_MUX_72_reg_7_0_0_0), .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(8), .BITSIZE_out1(8)) reg_8 (.out1(out_reg_8_reg_8), .clock(clock), .reset(reset), .in1(out_plus_expr_FU_8_0_8_30_i0_fu_astar_28877_29311), .wenable(wrenable_reg_8));
  register_STD #(.BITSIZE_in1(8), .BITSIZE_out1(8)) reg_9 (.out1(out_reg_9_reg_9), .clock(clock), .reset(reset), .in1(out_ui_cond_expr_FU_8_8_8_8_32_i0_fu_astar_28877_29305), .wenable(wrenable_reg_9));
  split_signal #(.BITSIZE_in1(2), .BITSIZE_out1(1), .PORTSIZE_out1(2)) split_signalbus_mergerSout_DataRdy0_ (.out1(Sout_DataRdy), .in1(sig_out_bus_mergerSout_DataRdy0_));
  split_signal #(.BITSIZE_in1(16), .BITSIZE_out1(8), .PORTSIZE_out1(2)) split_signalbus_mergerSout_Rdata_ram1_ (.out1(Sout_Rdata_ram), .in1(sig_out_bus_mergerSout_Rdata_ram1_));
  // io-signal post fix
  assign OUT_CONDITION_astar_28877_29314 = out_read_cond_FU_19_i0_fu_astar_28877_29314;
  assign OUT_CONDITION_astar_28877_29385 = out_read_cond_FU_24_i0_fu_astar_28877_29385;

endmodule

// FSM based controller description for astar
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_astar(done_port, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_STORE, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_STORE, selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0, selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_1_0_0, selector_MUX_17_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_1_0_0, selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0, selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0, selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0, selector_MUX_70_reg_5_0_0_0, selector_MUX_71_reg_6_0_0_0, selector_MUX_72_reg_7_0_0_0, selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_0, selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_1, selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0, wrenable_reg_0, wrenable_reg_1, wrenable_reg_10, wrenable_reg_11, wrenable_reg_2, wrenable_reg_3, wrenable_reg_4, wrenable_reg_5, wrenable_reg_6, wrenable_reg_7, wrenable_reg_8, wrenable_reg_9, OUT_CONDITION_astar_28877_29314, OUT_CONDITION_astar_28877_29385, clock, reset, start_port);
  // IN
  input OUT_CONDITION_astar_28877_29314;
  input OUT_CONDITION_astar_28877_29385;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_STORE;
  output selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0;
  output selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_1_0_0;
  output selector_MUX_17_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_1_0_0;
  output selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0;
  output selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0;
  output selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0;
  output selector_MUX_70_reg_5_0_0_0;
  output selector_MUX_71_reg_6_0_0_0;
  output selector_MUX_72_reg_7_0_0_0;
  output selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_0;
  output selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_1;
  output selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_11;
  output wrenable_reg_2;
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [8:0] S_0 = 9'b000000001,
    S_1 = 9'b000000010,
    S_6 = 9'b001000000,
    S_7 = 9'b010000000,
    S_8 = 9'b100000000,
    S_2 = 9'b000000100,
    S_3 = 9'b000001000,
    S_4 = 9'b000010000,
    S_5 = 9'b000100000;
  reg [8:0] _present_state, _next_state;
  reg done_port;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_STORE;
  reg selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0;
  reg selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_1_0_0;
  reg selector_MUX_17_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_1_0_0;
  reg selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0;
  reg selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0;
  reg selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0;
  reg selector_MUX_70_reg_5_0_0_0;
  reg selector_MUX_71_reg_6_0_0_0;
  reg selector_MUX_72_reg_7_0_0_0;
  reg selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_0;
  reg selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_1;
  reg selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_11;
  reg wrenable_reg_2;
  reg wrenable_reg_3;
  reg wrenable_reg_4;
  reg wrenable_reg_5;
  reg wrenable_reg_6;
  reg wrenable_reg_7;
  reg wrenable_reg_8;
  reg wrenable_reg_9;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_STORE = 1'b0;
    selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0 = 1'b0;
    selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_1_0_0 = 1'b0;
    selector_MUX_17_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_1_0_0 = 1'b0;
    selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 = 1'b0;
    selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0 = 1'b0;
    selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0 = 1'b0;
    selector_MUX_70_reg_5_0_0_0 = 1'b0;
    selector_MUX_71_reg_6_0_0_0 = 1'b0;
    selector_MUX_72_reg_7_0_0_0 = 1'b0;
    selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_0 = 1'b0;
    selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_1 = 1'b0;
    selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_11 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_STORE = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_STORE = 1'b1;
          selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0 = 1'b1;
          selector_MUX_70_reg_5_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          _next_state = S_1;
        end
        else
        begin
          selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0 = 1'bX;
          selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_1_0_0 = 1'bX;
          selector_MUX_17_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_1_0_0 = 1'bX;
          selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 = 1'bX;
          selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0 = 1'bX;
          selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0 = 1'bX;
          selector_MUX_70_reg_5_0_0_0 = 1'bX;
          selector_MUX_71_reg_6_0_0_0 = 1'bX;
          selector_MUX_72_reg_7_0_0_0 = 1'bX;
          selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_0 = 1'bX;
          selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_1 = 1'bX;
          selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0 = 1'bX;
          wrenable_reg_0 = 1'bX;
          wrenable_reg_1 = 1'bX;
          wrenable_reg_10 = 1'bX;
          wrenable_reg_11 = 1'bX;
          wrenable_reg_2 = 1'bX;
          wrenable_reg_3 = 1'bX;
          wrenable_reg_4 = 1'bX;
          wrenable_reg_5 = 1'bX;
          wrenable_reg_6 = 1'bX;
          wrenable_reg_7 = 1'bX;
          wrenable_reg_8 = 1'bX;
          wrenable_reg_9 = 1'bX;
          _next_state = S_0;
        end
      S_1 :
        begin
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE = 1'b1;
          selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 = 1'b1;
          selector_MUX_72_reg_7_0_0_0 = 1'b1;
          selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_0 = 1'b1;
          selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0 = 1'b1;
          wrenable_reg_7 = 1'b1;
          _next_state = S_6;
        end
      S_6 :
        begin
          wrenable_reg_8 = 1'b1;
          if (OUT_CONDITION_astar_28877_29385 == 1'b1)
            begin
              _next_state = S_2;
            end
          else
            begin
              _next_state = S_7;
              wrenable_reg_8 = 1'b0;
            end
        end
      S_7 :
        begin
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE = 1'b1;
          selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 = 1'b1;
          selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0 = 1'b1;
          selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_1 = 1'b1;
          selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0 = 1'b1;
          _next_state = S_8;
          done_port = 1'b1;
        end
      S_8 :
        begin
          _next_state = S_0;
        end
      S_2 :
        begin
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD = 1'b1;
          selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_1_0_0 = 1'b1;
          selector_MUX_17_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_1_0_0 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE = 1'b1;
          selector_MUX_71_reg_6_0_0_0 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          if (OUT_CONDITION_astar_28877_29314 == 1'b1)
            begin
              _next_state = S_4;
              selector_MUX_71_reg_6_0_0_0 = 1'b0;
              wrenable_reg_5 = 1'b0;
              wrenable_reg_6 = 1'b0;
              wrenable_reg_7 = 1'b0;
            end
          else
            begin
              _next_state = S_6;
              wrenable_reg_11 = 1'b0;
            end
        end
      S_4 :
        begin
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE = 1'b1;
          selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0 = 1'b1;
          selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 = 1'b1;
          selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0 = 1'b1;
          selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0 = 1'b1;
          selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0 = 1'b1;
          _next_state = S_5;
          done_port = 1'b1;
        end
      S_5 :
        begin
          _next_state = S_0;
        end
      default :
        begin
          _next_state = S_0;
          selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0 = 1'bX;
          selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_1_0_0 = 1'bX;
          selector_MUX_17_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_1_0_0 = 1'bX;
          selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 = 1'bX;
          selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0 = 1'bX;
          selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0 = 1'bX;
          selector_MUX_70_reg_5_0_0_0 = 1'bX;
          selector_MUX_71_reg_6_0_0_0 = 1'bX;
          selector_MUX_72_reg_7_0_0_0 = 1'bX;
          selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_0 = 1'bX;
          selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_1 = 1'bX;
          selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0 = 1'bX;
          wrenable_reg_0 = 1'bX;
          wrenable_reg_1 = 1'bX;
          wrenable_reg_10 = 1'bX;
          wrenable_reg_11 = 1'bX;
          wrenable_reg_2 = 1'bX;
          wrenable_reg_3 = 1'bX;
          wrenable_reg_4 = 1'bX;
          wrenable_reg_5 = 1'bX;
          wrenable_reg_6 = 1'bX;
          wrenable_reg_7 = 1'bX;
          wrenable_reg_8 = 1'bX;
          wrenable_reg_9 = 1'bX;
        end
    endcase
  end
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Marco Lattuada <marco.lattuada@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module flipflop_AR(clock, reset, in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input in1;
  // OUT
  output out1;
  
  reg reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock )
    if (reset == 1'b0)
      reg_out1 <= {BITSIZE_out1{1'b0}};
    else
      reg_out1 <= in1;
endmodule

// Top component for astar
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _astar(clock, reset, start_port, done_port, size, a, goal, S_oe_ram, S_we_ram, S_addr_ram, S_Wdata_ram, S_data_ram_size, Sin_Rdata_ram, Sin_DataRdy, Sout_Rdata_ram, Sout_DataRdy);
  parameter MEM_var_28861_28877=32, MEM_var_28864_28877=64, MEM_var_28866_28877=96, MEM_var_28867_28877=128, MEM_var_28868_28877=160;
  // IN
  input clock;
  input reset;
  input start_port;
  input [7:0] size;
  input [31:0] a;
  input [7:0] goal;
  input [1:0] S_oe_ram;
  input [1:0] S_we_ram;
  input [63:0] S_addr_ram;
  input [15:0] S_Wdata_ram;
  input [7:0] S_data_ram_size;
  input [15:0] Sin_Rdata_ram;
  input [1:0] Sin_DataRdy;
  // OUT
  output done_port;
  output [15:0] Sout_Rdata_ram;
  output [1:0] Sout_DataRdy;
  // Component and signal declarations
  wire OUT_CONDITION_astar_28877_29314;
  wire OUT_CONDITION_astar_28877_29385;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_STORE;
  wire selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0;
  wire selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_1_0_0;
  wire selector_MUX_17_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_1_0_0;
  wire selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0;
  wire selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0;
  wire selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0;
  wire selector_MUX_70_reg_5_0_0_0;
  wire selector_MUX_71_reg_6_0_0_0;
  wire selector_MUX_72_reg_7_0_0_0;
  wire selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_0;
  wire selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_1;
  wire selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_11;
  wire wrenable_reg_2;
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller_astar Controller_i (.done_port(done_delayed_REG_signal_in), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_LOAD), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_STORE), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_LOAD), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_STORE), .selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0(selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0), .selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_1_0_0(selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_1_0_0), .selector_MUX_17_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_1_0_0(selector_MUX_17_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_1_0_0), .selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0(selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0), .selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0(selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0), .selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0(selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0), .selector_MUX_70_reg_5_0_0_0(selector_MUX_70_reg_5_0_0_0), .selector_MUX_71_reg_6_0_0_0(selector_MUX_71_reg_6_0_0_0), .selector_MUX_72_reg_7_0_0_0(selector_MUX_72_reg_7_0_0_0), .selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_0(selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_0), .selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_1(selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_1), .selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0(selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0), .wrenable_reg_0(wrenable_reg_0), .wrenable_reg_1(wrenable_reg_1), .wrenable_reg_10(wrenable_reg_10), .wrenable_reg_11(wrenable_reg_11), .wrenable_reg_2(wrenable_reg_2), .wrenable_reg_3(wrenable_reg_3), .wrenable_reg_4(wrenable_reg_4), .wrenable_reg_5(wrenable_reg_5), .wrenable_reg_6(wrenable_reg_6), .wrenable_reg_7(wrenable_reg_7), .wrenable_reg_8(wrenable_reg_8), .wrenable_reg_9(wrenable_reg_9), .OUT_CONDITION_astar_28877_29314(OUT_CONDITION_astar_28877_29314), .OUT_CONDITION_astar_28877_29385(OUT_CONDITION_astar_28877_29385), .clock(clock), .reset(reset), .start_port(start_port));
  datapath_astar #(.MEM_var_28861_28877(MEM_var_28861_28877), .MEM_var_28864_28877(MEM_var_28864_28877), .MEM_var_28866_28877(MEM_var_28866_28877), .MEM_var_28867_28877(MEM_var_28867_28877), .MEM_var_28868_28877(MEM_var_28868_28877)) Datapath_i (.Sout_Rdata_ram(Sout_Rdata_ram), .Sout_DataRdy(Sout_DataRdy), .OUT_CONDITION_astar_28877_29314(OUT_CONDITION_astar_28877_29314), .OUT_CONDITION_astar_28877_29385(OUT_CONDITION_astar_28877_29385), .clock(clock), .reset(reset), .in_port_size(size), .in_port_a(a), .in_port_goal(goal), .S_oe_ram(S_oe_ram), .S_we_ram(S_we_ram), .S_addr_ram(S_addr_ram), .S_Wdata_ram(S_Wdata_ram), .S_data_ram_size(S_data_ram_size), .Sin_Rdata_ram(Sin_Rdata_ram), .Sin_DataRdy(Sin_DataRdy), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_LOAD), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i0_STORE), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_LOAD), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_4_i1_STORE), .selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0(selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0), .selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_1_0_0(selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_1_0_0), .selector_MUX_17_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_1_0_0(selector_MUX_17_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_1_0_0), .selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0(selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0), .selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0(selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0), .selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0(selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0), .selector_MUX_70_reg_5_0_0_0(selector_MUX_70_reg_5_0_0_0), .selector_MUX_71_reg_6_0_0_0(selector_MUX_71_reg_6_0_0_0), .selector_MUX_72_reg_7_0_0_0(selector_MUX_72_reg_7_0_0_0), .selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_0(selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_0), .selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_1(selector_MUX_8_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_0_0_1), .selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0(selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0), .wrenable_reg_0(wrenable_reg_0), .wrenable_reg_1(wrenable_reg_1), .wrenable_reg_10(wrenable_reg_10), .wrenable_reg_11(wrenable_reg_11), .wrenable_reg_2(wrenable_reg_2), .wrenable_reg_3(wrenable_reg_3), .wrenable_reg_4(wrenable_reg_4), .wrenable_reg_5(wrenable_reg_5), .wrenable_reg_6(wrenable_reg_6), .wrenable_reg_7(wrenable_reg_7), .wrenable_reg_8(wrenable_reg_8), .wrenable_reg_9(wrenable_reg_9));
  flipflop_AR #(.BITSIZE_in1(1), .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out), .clock(clock), .reset(reset), .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

endmodule

// Minimal interface for function: astar
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module astar(clock, reset, start_port, size, a, goal, S_oe_ram, S_we_ram, S_addr_ram, S_Wdata_ram, S_data_ram_size, done_port, Sout_Rdata_ram, Sout_DataRdy);
  parameter MEM_var_28861_28877=32, MEM_var_28864_28877=64, MEM_var_28866_28877=96, MEM_var_28867_28877=128, MEM_var_28868_28877=160;
  // IN
  input clock;
  input reset;
  input start_port;
  input [7:0] size;
  input [31:0] a;
  input [7:0] goal;
  input [1:0] S_oe_ram;
  input [1:0] S_we_ram;
  input [63:0] S_addr_ram;
  input [15:0] S_Wdata_ram;
  input [7:0] S_data_ram_size;
  // OUT
  output done_port;
  output [15:0] Sout_Rdata_ram;
  output [1:0] Sout_DataRdy;
  // Component and signal declarations
  
  _astar #(.MEM_var_28861_28877(MEM_var_28861_28877), .MEM_var_28864_28877(MEM_var_28864_28877), .MEM_var_28866_28877(MEM_var_28866_28877), .MEM_var_28867_28877(MEM_var_28867_28877), .MEM_var_28868_28877(MEM_var_28868_28877)) _astar_i0 (.done_port(done_port), .Sout_Rdata_ram(Sout_Rdata_ram), .Sout_DataRdy(Sout_DataRdy), .clock(clock), .reset(reset), .start_port(start_port), .size(size), .a(a), .goal(goal), .S_oe_ram(S_oe_ram), .S_we_ram(S_we_ram), .S_addr_ram(S_addr_ram), .S_Wdata_ram(S_Wdata_ram), .S_data_ram_size(S_data_ram_size), .Sin_Rdata_ram({8'b00000000, 8'b00000000}), .Sin_DataRdy({1'b0, 1'b0}));

endmodule


