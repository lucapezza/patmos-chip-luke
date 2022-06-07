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

## Clock configurations
set ::env(CLOCK_PORT) "wb_clk_i"
set ::env(CLOCK_NET) "patmos.clock morse.clock"

set ::env(CLOCK_PERIOD) "100"

set ::env(DESIGN_IS_CORE) 1

set ::env(GLB_RESIZER_HOLD_SLACK_MARGIN) 2ns
set ::env(GLB_RESIZER_MAX_SLEW_MARGIN) 20
set ::env(GLB_RESIZER_MAX_CAP_MARGIN) 20

## Internal Macros
### Macro PDN Connections
set ::env(FP_PDN_CHECK_NODES) 0
set ::env(FP_SIZING) absolute
set ::env(FP_PDN_MACRO_HOOKS) "patmos.patmos.Spm.sky130_sram_1kbyte_1rw1r_32x256_8 vccd1 vssd1 \
 patmos.patmos.cores_0.fetch.bootMem.memWithWrEven vccd1 vssd1 \
 patmos.patmos.cores_0.fetch.bootMem.memWithWrOdd vccd1 vssd1"

### Macro Placement
set ::env(MACRO_PLACEMENT_CFG) $script_dir/macro.cfg

### Black-box verilog and views
set ::env(VERILOG_FILES_BLACKBOX) "\
        $::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
        $script_dir/../../verilog/rtl/sky130_sram_1kbyte_1rw1r_32x256_8.v"

set ::env(EXTRA_LEFS) "\
        $script_dir/../../lef/sky130_sram_1kbyte_1rw1r_32x256_8.lef"

set ::env(EXTRA_GDS_FILES) "\
        $script_dir/../../gds/sky130_sram_1kbyte_1rw1r_32x256_8.gds"

set ::env(PL_OPENPHYSYN_OPTIMIZATIONS) 0
set ::env(PL_DIAMOND_SEARCH_HEIGHT) 500 

set ::env(PL_BASIC_PLACEMENT) 0
set ::env(PL_ROUTABILITY_DRIVEN) 1

set ::env(PL_TARGET_DENSITY) 0.25

set ::env(MACRO_PLACE_HALO) "50 50"
set ::env(MACRO_PLACE_CHANNEL) "50 50"

set ::env(SYNTH_USE_PG_PINS_DEFINES) "USE_POWER_PINS"

set ::env(RUN_MAGIC_DRC) 0
set ::env(RUN_KLAYOUT_DRC) 0
set ::env(MAGIC_DRC_USE_GDS) 0
set ::env(RUN_KLAYOUT_DRC) 0
set ::env(RUN_KLAYOUT_XOR) 0
# If you're going to use multiple power domains, then disable cvc run.
set ::env(RUN_CVC) 1

# set ::env(GLB_RT_MAXLAYER) 5
set ::env(RT_MAX_LAYER) {met4}

# disable pdn check nodes becuase it hangs with multiple power domains.
# any issue with pdn connections will be flagged with LVS so it is not a critical check.
set ::env(FP_PDN_CHECK_NODES) 0

# The following is because there are no std cells in the example wrapper project.
#set ::env(SYNTH_TOP_LEVEL) 0
#set ::env(PL_RANDOM_GLB_PLACEMENT) 1

#set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 0
#set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 0
#set ::env(PL_RESIZER_BUFFER_INPUT_PORTS) 0
#set ::env(PL_RESIZER_BUFFER_OUTPUT_PORTS) 0


set ::env(FP_PDN_CORE_RING) 0
set ::env(FP_PDN_ENABLE_RAILS) 1


# You can draw more power domains if you need to 
set ::env(VDD_NETS) {vccd1 vccd2 vdda1 vdda2}
set ::env(GND_NETS) {vssd1 vssd2 vssa1 vssa2}
#
set ::env(VDD_PIN) {vccd1}
set ::env(GND_PIN) {vssd1}


set ::env(DIODE_INSERTION_STRATEGY) 4 


set ::env(ROUTING_CORES) 4



set ::env(LVS_CONNECT_BY_LABEL) 1


set ::env(FP_PDN_ENABLE_MACROS_GRID) 1
set ::env(FP_PDN_VOFFSET) 8.16
set ::env(FP_PDN_HOFFSET) 8.32
set ::env(FP_PDN_AUTO_ADJUST) 0

set ::env(QUIT_ON_LVS_ERROR) "0"
set ::env(QUIT_ON_MAGIC_DRC) "0"
set ::env(QUIT_ON_NEGATIVE_WNS) "0"
set ::env(QUIT_ON_SLEW_VIOLATIONS) "0"
set ::env(QUIT_ON_TIMING_VIOLATIONS) "0"




set ::env(FP_PDN_IRDROP) "0"
set ::env(FP_PDN_HORIZONTAL_HALO) "10"
set ::env(FP_PDN_VERTICAL_HALO) "10"

#

set ::env(FP_PDN_CORE_RING_HOFFSET) {12.45}
set ::env(FP_PDN_CORE_RING_HSPACING) {1.7}
set ::env(FP_PDN_CORE_RING_HWIDTH) {3.1}

set ::env(FP_PDN_CORE_RING_VOFFSET) {12.45}
set ::env(FP_PDN_CORE_RING_VSPACING) {1.7}
set ::env(FP_PDN_CORE_RING_VWIDTH) {3.1}


set ::env(FP_PDN_VOFFSET) "5"
set ::env(FP_PDN_VPITCH) "80"
set ::env(FP_PDN_VSPACING) "15.5"
set ::env(FP_PDN_VWIDTH) "3.1"

set ::env(FP_PDN_HOFFSET) "10"
set ::env(FP_PDN_HPITCH) "90"
set ::env(FP_PDN_HSPACING) "10"
set ::env(FP_PDN_HWIDTH) "3.1"