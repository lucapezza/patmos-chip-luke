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


module uart_tb;
	reg clock;
	reg RSTB;
	reg CSB;
	reg power1, power2;
	reg power3, power4;

	wire gpio;
	wire [37:0] mprj_io;
	reg [3:0] ticks = 0;
	wire [23:0] rx_string;
	wire [23:0] tx_string = 24'h686921;
	wire rx_done;
	wire tx_done;
	reg send = 0;

	always #50 clock <= (clock === 1'b0);

	initial begin
		clock = 0;
	end

	integer a;
	initial begin
		$dumpfile("uart.vcd");
		$dumpvars(0, uart_tb);
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
		repeat (150) begin
			repeat (1000) @(posedge clock);
			// $display("+1000 cycles");
		end
		$display("%c[1;31m",27);
		`ifdef GL
			$display ("Monitor: Timeout, Test 'uart' (GL) Failed");
		`else
			$display ("Monitor: Timeout, Test 'uart' (RTL) Failed");
		`endif
		$display("%c[0m",27);
		$finish;
	end

	initial begin
    $display("\nPatmos 'uart' test:");
		$display("Waiting for Patmos to be programmed");
		$display("...");
		wait(mprj_io[37] == 1); 
		$display("Patmos is running and should be looking for UART input\n");
		send <= 1;
		#200;
		send <= 0;
		$display("Transmitting message: \" %s \" to Patmos", tx_string);
		$display("...");
		wait(rx_done && rx_string == tx_string);
		$display("Recieved message: \" %s \" from Patmos", rx_string);
		$display("%c[1;32m",27);
		`ifdef GL
	    	$display("Monitor: Test 'uart' (GL) Passed");
		`else
		    $display("Monitor: Test 'uart' (RTL) Passed");
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
  uartrx reciever(
    .rst(~RSTB),
		.clk(clock),
		.rx(mprj_io[1]),
		.string(rx_string),
		.done(rx_done)
	);
	uarttx transmitter(
		.rst(~RSTB),
		.clk(clock),
		.tx(mprj_io[0]),
		.string(tx_string),
		.send(send),
		.done(tx_done)
	);
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
		.FILENAME("uart.hex")
	) spiflash (
		.csb(flash_csb),
		.clk(flash_clk),
		.io0(flash_io0),
		.io1(flash_io1),
		.io2(),			// not used
		.io3()			// not used
	);

endmodule
module uartrx(
        input rx,
				input rst,
				input clk,
				output reg [23:0] string,
				output done
    );
    reg [7:0] char;
		reg [10:0] cnt_clk;
		reg [3:0] cnt_bits;
		reg [2:0] cnt_char;
		assign done = cnt_char == 3;
    always @(posedge clk)
		begin
      if(rst)
			begin
			  char <= 0;
				cnt_clk <= 0;
				cnt_bits <= 0;
        string <= 0;
				cnt_char <= 0;
			end
      else
			begin
				if(cnt_bits == 0)
				begin
					if(!rx)
					begin
						cnt_clk <= cnt_clk + 1'b1;
						if(cnt_clk == `CPB/2)
						begin
							cnt_bits <= 1;
							cnt_clk <= 0;
						end
					end
				end
				else
				begin
					cnt_clk <= cnt_clk + 1'b1;
					if(cnt_clk == `CPB)
					begin
            cnt_clk <= 0;
						char <= {rx,char[7:1]};
            cnt_bits <= cnt_bits + 1'b1;
						if(cnt_bits == 9) begin
          		string <= {char, string[23: 8]};
              cnt_bits <= 0;
							if(rx)
							  cnt_char <= cnt_char + 1;
							else
							  cnt_char <= 0; // Patmos messed up the transmission -didn't supply the stop bit
						end
					end
				end
			end
		end
endmodule
module uarttx(
        output reg tx,
				input rst,
				input clk,
				input [23:0] string,
				input send,
				output done
    );
		reg [10:0] cnt_clk;
		reg [3:0] cnt_bits;
		reg [2:0] cnt_char;
		reg [23:0] msg;
		assign done = cnt_char == 3;
    always @(posedge clk)
		begin
      if(rst == 1)
			begin
				cnt_clk <= 0;
				cnt_bits <= 0;
				cnt_char <= 3;
				msg <= string;
				tx <= 1;
			end
			else if(send == 1)
			begin
				cnt_char <= 0;
				msg <= string;
			end
			else if(cnt_char != 3)
			begin
				if(cnt_bits == 0) // Send start bit
				begin
					tx <= 0;
					cnt_clk <= cnt_clk + 1; 
					if(cnt_clk == `CPB)
					begin
						cnt_clk <= 0;
						cnt_bits <= 1;
					end
				end
				else if(cnt_bits == 9) // Send stop bit
				begin
					tx <= 1;
					cnt_clk <= cnt_clk + 1; 
					if(cnt_clk == `CPB)
					begin
						cnt_clk <= 0;
						cnt_bits <= 0;
						cnt_char <= cnt_char + 1;
					end
				end
				else // Send data bits
				begin
					tx <= msg[0];
					cnt_clk <= cnt_clk + 1; 
					if(cnt_clk == `CPB)
					begin
						cnt_clk <= 0;
						cnt_bits <= cnt_bits + 1;
						msg <= {1'b0, msg[23:1]};
					end
				end
			end
		end
endmodule
`default_nettype wire