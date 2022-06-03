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

`default_nettype none

/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS = 32
) (
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/
wire [7:0] patmos_oe;
// UART
assign io_oeb[0] = 1'b1;
assign io_oeb[1] = 1'b0;

// Leds
assign io_oeb[2] = 1'b0;


// GPIO
assign io_oeb[3] = ~patmos_oe[0]; 
assign io_oeb[4] = ~patmos_oe[1];
assign io_oeb[5] = ~patmos_oe[2];
assign io_oeb[6] = ~patmos_oe[3];
assign io_oeb[7] = ~patmos_oe[4];
assign io_oeb[8] = ~patmos_oe[5];
assign io_oeb[9] = ~patmos_oe[6];
assign io_oeb[10] = ~patmos_oe[7];

// Blinking Morse
assign io_oeb[11] = 1'b0;
assign io_oeb[12] = 1'b0;

// SPI
assign io_oeb[13] = 1'b0;
assign io_oeb[14] = 1'b0;
assign io_oeb[15] = 1'b0;
assign io_oeb[16] = 1'b1;

// Dummy assignments
assign la_data_out = 128'h70757373796164646963740000000000;
assign user_irq = 3'b000;
assign io_oeb[17] = 1'b1;
assign io_oeb[18] = 1'b1;
assign io_oeb[19] = 1'b1;
assign io_oeb[20] = 1'b1;
assign io_oeb[21] = 1'b1;
assign io_oeb[22] = 1'b1;
assign io_oeb[23] = 1'b1;
assign io_oeb[24] = 1'b1;
assign io_oeb[25] = 1'b1;
assign io_oeb[26] = 1'b1;
assign io_oeb[27] = 1'b1;
assign io_oeb[28] = 1'b1;
assign io_oeb[29] = 1'b1;
assign io_oeb[30] = 1'b1;
assign io_oeb[31] = 1'b1;
assign io_oeb[32] = 1'b1;
assign io_oeb[33] = 1'b1;
assign io_oeb[34] = 1'b1;
assign io_oeb[35] = 1'b1;
assign io_oeb[36] = 1'b1;
assign io_oeb[37] = 1'b1;


PatmosChip patmos(
  .clock(wb_clk_i),
  .reset(wb_rst_i),
  .io_led(io_out[2]),
  .io_uart_rx(io_in[0]),
  .io_uart_tx(io_out[1]),
  .io_wishbone_sel(wbs_sel_i),
  .io_wishbone_dout(wbs_dat_o),
  .io_wishbone_din(wbs_dat_i),
  .io_wishbone_stb(wbs_stb_i),
  .io_wishbone_we(wbs_we_i),
  .io_wishbone_ack(wbs_ack_o),
  .io_wishbone_addr(wbs_adr_i),
  .io_wishbone_cyc(wbs_cyc_i),
  .io_gpio_oe_0(patmos_oe),
  .io_gpio_in_0(
    {io_in[10],
     io_in[9],
     io_in[8],
     io_in[7],
     io_in[6],
     io_in[5],
     io_in[4],
     io_in[3]
    }
  ),
  .io_gpio_out_0(
    {io_out[10],
     io_out[9],
     io_out[8],
     io_out[7],
     io_out[6],
     io_out[5],
     io_out[4],
     io_out[3]
    }
  ),
  .io_spi_out_CE(io_out[13]),
  .io_spi_out_MOSI(io_out[14]),
  .io_spi_out_S_CLK(io_out[15]),
  .io_spi_in_MISO(io_in[16])
);

HelloMorse morse(
  .clock(wb_clk_i),
  .reset(wb_rst_i),
  .io_led(io_out[11]),
  .io_audio(io_out[12])
  // output  io_gain,
  // output  io_nshutdown
);

endmodule	// user_project_wrapper

`default_nettype wire
