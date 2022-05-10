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

`timescale 1 ns / 1 ps
`include "../SIM_DEFS.v"

module gpio_tb;
	reg clock;
	reg RSTB;
	reg CSB;
	reg power1, power2;
	reg power3, power4;

	wire gpio;
	wire [7:0] patmos_gpio;
	wire [2:0] mprj_io_2_0;
	wire [26:0] mprj_io_37_11;
	wire [37:0] mprj_io = {mprj_io_37_11, patmos_gpio, mprj_io_2_0};
	reg [7:0] patmos_gpio_driver;
	assign patmos_gpio = patmos_gpio_driver;
	parameter max_cnt = 8'd21;

	always #50 clock <= (clock === 1'b0);

	initial begin
		clock = 0;
	end

	integer a;
	initial begin
		$dumpfile("gpio.vcd");
		$dumpvars(0, gpio_tb);
		
		if(`DUMP_STRG) begin
      // Dump contents of BootMemory (writeable)
			for(a = 0; a < 16; a = a + 1) begin
				$dumpvars(0, uut.mprj.patmos.patmos.patmos.cores_0.fetch.bootMem.memWithWrEven.mem[a]);
				$dumpvars(0, uut.mprj.patmos.patmos.patmos.cores_0.fetch.bootMem.memWithWrOdd.mem[a]);
			end
			// Dump register file
		  for(a = 0; a < 32; a = a + 1) begin
        $dumpvars(0, uut.mprj.patmos.patmos.patmos.cores_0.decode.rf.rf[a]);
      end
		end
		

		// Repeat cycles of 1000 clock edges as needed to complete testbench
		repeat (90) begin
			repeat (1000) @(posedge clock);
			// $display("+1000 cycles");
		end
		$display("%c[1;31m",27);
		`ifdef GL
			$display ("Monitor: Timeout, Test 'gpio' (GL) Failed");
		`else
			$display ("Monitor: Timeout, Test 'gpio' (RTL) Failed");
		`endif
		$display("%c[0m",27);
		$finish;
	end
	initial begin
    $display("\nPatmos 'gpio' test");
	end
	integer b;
	initial begin
		patmos_gpio_driver = max_cnt; // Send max count to Patmos
		$display("Driving the gpio pins with value: %d\nWaiting for Patmos to be programmed...", max_cnt);
		wait(mprj_io[37] == 1); // Wait for Patmos to be programmed
		$display("Patmos has been programmed\nWaiting for Patmos to read gpio pins...");
		#1000; // Wait for Patmos reset to be low
		#900; // Wait for Patmos to read the gpio
		$display("Patmos has read the gpio pins\nReading what Patmos is writing on the gpio pins:");
		patmos_gpio_driver = 8'bz; // Drive gpio with high impedance for reading the output
		for(b = max_cnt; b >= 0; b = b - 1) begin
			wait(mprj_io[10:3] == b); // Now we check that Patmos counts down from max_cnt
			$display("Read: %d", mprj_io[10:3]);
		end
		$display("%c[1;32m",27);
		`ifdef GL
	    	$display("Monitor: Test 'gpio' (GL) Passed");
		`else
		    $display("Monitor: Test 'gpio' (RTL) Passed");
		`endif
		$display("%c[0m",27);
	  $finish;
	end

	initial begin
		RSTB <= 1'b0;
		CSB  <= 1'b1;		// Force CSB high
		#2000;
		RSTB <= 1'b1;	    	// Release reset
		#100000;
		CSB = 1'b0;		// CSB can be released
	end

	initial begin		// Power-up sequence
		power1 <= 1'b0;
		power2 <= 1'b0;
		power3 <= 1'b0;
		power4 <= 1'b0;
		#200;
		power1 <= 1'b1;
		#200;
		power2 <= 1'b1;
		#200;
		power3 <= 1'b1;
		#200;
		power4 <= 1'b1;
	end

	wire flash_csb;
	wire flash_clk;
	wire flash_io0;
	wire flash_io1;

	wire VDD3V3 = power1;
	wire VDD1V8 = power2;
	wire USER_VDD3V3 = power3;
	wire USER_VDD1V8 = power4;
	wire VSS = 1'b0;

	caravel uut (
		.vddio	  (VDD3V3),
		.vddio_2  (VDD3V3),
		.vssio	  (VSS),
		.vssio_2  (VSS),
		.vdda	  (VDD3V3),
		.vssa	  (VSS),
		.vccd	  (VDD1V8),
		.vssd	  (VSS),
		.vdda1    (VDD3V3),
		.vdda1_2  (VDD3V3),
		.vdda2    (VDD3V3),
		.vssa1	  (VSS),
		.vssa1_2  (VSS),
		.vssa2	  (VSS),
		.vccd1	  (VDD1V8),
		.vccd2	  (VDD1V8),
		.vssd1	  (VSS),
		.vssd2	  (VSS),
		.clock    (clock),
		.gpio     (gpio),
		.mprj_io  (mprj_io),
		.flash_csb(flash_csb),
		.flash_clk(flash_clk),
		.flash_io0(flash_io0),
		.flash_io1(flash_io1),
		.resetb	  (RSTB)
	);

	spiflash #(
		.FILENAME("gpio.hex")
	) spiflash (
		.csb(flash_csb),
		.clk(flash_clk),
		.io0(flash_io0),
		.io1(flash_io1),
		.io2(),			// not used
		.io3()			// not used
	);

endmodule
`default_nettype wire