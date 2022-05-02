// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0
#include <defs.h>
#include <stub.c>
#include "../wb-defs.h"
/*
  Basic program to test the wishbone client. Write a value to a register,
  read the register afterwards and output the value on the mprj io pins.
*/

void main()
{
    reg_wb_enable = 1;
    reg_mprj_io_0  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_1  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_2  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_3  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_4  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_5  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_6  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_7  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_8  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_9  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_10  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_11  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_12  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_13  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_14  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_15  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_16  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_17  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_18  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_19  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_20  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_21  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_22  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_23  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_24  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_25  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_26  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_27  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_28  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_29  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_30  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_31  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_32  = GPIO_MODE_MGMT_STD_OUTPUT;

    /* Apply configuration */
    reg_mprj_xfer = 1;
    while (reg_mprj_xfer == 1);
    reg_mprj_datah = 0x1; // Tell tb IO is configured, and we will begin outputting status of wishbone registers  
    reg_wb_bootAddr = 0x123;
    reg_mprj_datal = reg_wb_bootAddr;  
    reg_wb_stall = 0x1;
    reg_mprj_datal = reg_wb_stall;  
    reg_wb_reset = 0x0;  
    reg_mprj_datal = reg_wb_reset;  
    reg_wb_rom_dataOdd = 0x501;
    reg_mprj_datal = reg_wb_rom_dataOdd; 
    reg_wb_rom_addrOdd = 0x44;
    reg_mprj_datal = reg_wb_rom_addrOdd; 
    reg_wb_rom_enOdd = 0x1;
    reg_mprj_datal = reg_wb_rom_enOdd; 
    reg_wb_rom_dataEven = 0x78;
    reg_mprj_datal = reg_wb_rom_dataEven; 
    reg_wb_rom_addrEven = 0x12;
    reg_mprj_datal = reg_wb_rom_addrEven;
    reg_wb_rom_enEven = 0x1;
    reg_mprj_datal = reg_wb_rom_enEven;
}
