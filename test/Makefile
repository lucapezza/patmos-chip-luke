#  Extra makefile for running tests.
#  Use this one to convert patmos programs
#  into c code for Caravel to load onto the
#  wishbone bus.

BOOTAPP?=blinking
APP_DIR?=$(PWD)/../patmos_bin/$(BOOTAPP).bin
dv_patterns=$(shell cd ../verilog/dv && find * -maxdepth 0 -type d)
dv-targets-rtl=$(dv_patterns:%=verify-%-rtl)
dv-targets-gl=$(dv_patterns:%=verify-%-gl)

.PHONY: verify
verify:
$(dv-targets-rtl): verify-%-rtl:
	cd .. && cd util && javac RomLoader.java && java RomLoader $(PWD)/../verilog/dv/$*/$*.c $(PWD)/../patmos_bin/$*.bin && rm *.class && cd .. && make verify-$*-rtl
$(dv-targets-gl): verify-%-gl:
	cd .. && cd util && javac RomLoader.java && java RomLoader $(PWD)/../verilog/dv/$*/$*.c $(APP_DIR) && rm *.class && cd .. && make verify-$*-gl
