# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

# Base Configurations. Don't Touch
# section begin

set ::env(PDK) "sky130A"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

# YOU ARE NOT ALLOWED TO CHANGE ANY VARIABLES DEFINED IN THE FIXED WRAPPER CFGS 
source $::env(CARAVEL_ROOT)/openlane/user_project_wrapper/fixed_wrapper_cfgs.tcl

# YOU CAN CHANGE ANY VARIABLES DEFINED IN THE DEFAULT WRAPPER CFGS BY OVERRIDING THEM IN THIS CONFIG.TCL
source $::env(CARAVEL_ROOT)/openlane/user_project_wrapper/default_wrapper_cfgs.tcl

set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) user_project_wrapper
#section end

# User Configurations

## Source Verilog Files
set ::env(VERILOG_FILES) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/PatmosChip.v \
	$script_dir/../../verilog/rtl/BlackBoxRom.v \
	$script_dir/../../verilog/rtl/user_project_wrapper.v \
	$script_dir/../../verilog/rtl/HelloMorse.v"

### Black-box verilog and views
set ::env(VERILOG_FILES_BLACKBOX) "\
        $::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
        $::env(PDK_ROOT)/sky130A/libs.ref/sky130_sram_macros/verilog/sky130_sram_1kbyte_1rw1r_32x256_8.v"

set ::env(EXTRA_LEFS) "\
        $::env(PDK_ROOT)/sky130A/libs.ref/sky130_sram_macros/lef/sky130_sram_1kbyte_1rw1r_32x256_8.lef"

set ::env(EXTRA_GDS_FILES) "\
        $::env(PDK_ROOT)/sky130A/libs.ref/sky130_sram_macros/gds/sky130_sram_1kbyte_1rw1r_32x256_8.gds"

set ::env(EXTRA_LIBS) "\
  $::env(PDK_ROOT)/sky130A/libs.ref/sky130_sram_macros/lib/sky130_sram_1kbyte_1rw1r_32x256_8_TT_1p8V_25C.lib"


## Clock configurations
set ::env(CLOCK_PORT) "wb_clk_i"
set ::env(CLOCK_NET) "patmos.clock morse.clock"

set ::env(CLOCK_PERIOD) "100"

set ::env(DESIGN_IS_CORE) 1

set ::env(GLB_RESIZER_HOLD_SLACK_MARGIN) "1.4ns"
set ::env(PL_RESIZER_HOLD_SLACK_MARGIN) "1.4ns"
set ::env(GLB_RESIZER_MAX_SLEW_MARGIN) 30
set ::env(GLB_RESIZER_MAX_CAP_MARGIN) 30

set ::env(FP_PDN_MACRO_HOOKS) "patmos.patmos.Spm.sky130_sram_1kbyte_1rw1r_32x256_8 vccd1 vssd1 \
 patmos.patmos.cores_0.fetch.bootMem.memWithWrEven vccd1 vssd1 \
 patmos.patmos.cores_0.fetch.bootMem.memWithWrOdd vccd1 vssd1"

### Macro Placement
set ::env(MACRO_PLACEMENT_CFG) $script_dir/macro.cfg


#set ::env(PL_OPENPHYSYN_OPTIMIZATIONS) 0
#set ::env(PL_DIAMOND_SEARCH_HEIGHT) 500 

#set ::env(PL_BASIC_PLACEMENT) 0
#set ::env(PL_ROUTABILITY_DRIVEN) 1

set ::env(PL_TARGET_DENSITY) 0.25

#set ::env(MACRO_PLACE_HALO) "50 50"
#set ::env(MACRO_PLACE_CHANNEL) "50 50"


# set ::env(GLB_RT_MAXLAYER) 5
set ::env(RT_MAX_LAYER) {met4}

# disable pdn check nodes becuase it hangs with multiple power domains.
# any issue with pdn connections will be flagged with LVS so it is not a critical check.
set ::env(FP_PDN_CHECK_NODES) 0



#set ::env(FP_PDN_CORE_RING) 0
set ::env(FP_PDN_ENABLE_RAILS) 0



set ::env(DIODE_INSERTION_STRATEGY) 4 


set ::env(ROUTING_CORES) 4

set ::env(FP_CORE_UTIL) 30
set ::env(CELL_PAD) 2
set ::env(PL_ROUTABILITY_DRIVEN) 1
set ::env(PL_BASIC_PLACEMENT) 0

set ::env(MACRO_PLACE_HALO) "50 50"
set ::env(MACRO_PLACE_CHANNEL) "50 50"



set ::env(LVS_CONNECT_BY_LABEL) 1
#set ::env(FP_PDN_ENABLE_MACROS_GRID) 0

set ::env(RUN_MAGIC_DRC) 0
set ::env(RUN_KLAYOUT_DRC) 0
set ::env(MAGIC_DRC_USE_GDS) 0
set ::env(RUN_KLAYOUT_DRC) 0
set ::env(RUN_KLAYOUT_XOR) 0

set ::env(QUIT_ON_LVS_ERROR) "0"
set ::env(QUIT_ON_MAGIC_DRC) "0"
set ::env(QUIT_ON_NEGATIVE_WNS) "0"
set ::env(QUIT_ON_SLEW_VIOLATIONS) "0"
set ::env(QUIT_ON_TIMING_VIOLATIONS) "0"




set ::env(GLB_RT_OBS) " \
    met1  900.00  1500.00  1379.78  1897.5,
    met2  900.00  1500.00  1379.78  1897.5,
    met3  900.00  1500.00  1379.78  1897.5,
    met4  900.00  1500.00  1379.78  1897.5,
    met1  1800.00  1200.00  2279.78 1597.5,
    met2  1800.00  1200.00  2279.78 1597.5,
    met3  1800.00  1200.00  2279.78 1597.5,
    met4  1800.00  1200.00  2279.78 1597.5,
    met1  1800.00 1800.00  2279.78 2197.5,
    met2  1800.00 1800.00  2279.78 2197.5,
    met3  1800.00 1800.00  2279.78 2197.5,
    met4  1800.00 1800.00  2279.78 2197.5"

