#include <defs.h>
#include <stub.c>
#include "../wb-defs.h" // User defined wb addresses.
void main()
{
        
    reg_wb_enable = 1;
    // Configure patmos output pins
    reg_mprj_io_2 =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_xfer = 1;
    while (reg_mprj_xfer == 1); // Wait for configuration to become active
    // start program
    reg_wb_rom_dataEven = 0x38;
    reg_wb_rom_addrEven = 0x0;
    reg_wb_rom_enEven = 0x1;
    reg_wb_rom_enEven = 0x0;
    reg_wb_rom_dataOdd = 0x87ce0000;
    reg_wb_rom_addrOdd = 0x0;
    reg_wb_rom_enOdd = 0x1;
    reg_wb_rom_enOdd = 0x0;
    reg_wb_rom_dataEven = 0xf0090000;
    reg_wb_rom_addrEven = 0x1;
    reg_wb_rom_enEven = 0x1;
    reg_wb_rom_enEven = 0x0;
    reg_wb_rom_dataOdd = 0x120000;
    reg_wb_rom_addrOdd = 0x1;
    reg_wb_rom_enOdd = 0x1;
    reg_wb_rom_enOdd = 0x0;
    reg_wb_rom_dataEven = 0x100001;
    reg_wb_rom_addrEven = 0x2;
    reg_wb_rom_enEven = 0x1;
    reg_wb_rom_enEven = 0x0;
    reg_wb_rom_dataOdd = 0x2129402;
    reg_wb_rom_addrOdd = 0x2;
    reg_wb_rom_enOdd = 0x1;
    reg_wb_rom_enOdd = 0x0;
    reg_wb_rom_dataEven = 0x2c27480;
    reg_wb_rom_addrEven = 0x3;
    reg_wb_rom_enEven = 0x1;
    reg_wb_rom_enEven = 0x0;
    reg_wb_rom_dataOdd = 0x20010;
    reg_wb_rom_addrOdd = 0x3;
    reg_wb_rom_enOdd = 0x1;
    reg_wb_rom_enOdd = 0x0;
    reg_wb_rom_dataEven = 0x421001;
    reg_wb_rom_addrEven = 0x4;
    reg_wb_rom_enEven = 0x1;
    reg_wb_rom_enEven = 0x0;
    reg_wb_rom_dataOdd = 0x2021031;
    reg_wb_rom_addrOdd = 0x4;
    reg_wb_rom_enOdd = 0x1;
    reg_wb_rom_enOdd = 0x0;
    reg_wb_rom_dataEven = 0xcfffffe;
    reg_wb_rom_addrEven = 0x5;
    reg_wb_rom_enEven = 0x1;
    reg_wb_rom_enEven = 0x0;
    reg_wb_rom_dataOdd = 0x0;
    reg_wb_rom_addrOdd = 0x5;
    reg_wb_rom_enOdd = 0x1;
    reg_wb_rom_enOdd = 0x0;
    reg_wb_rom_dataEven = 0x0;
    reg_wb_rom_addrEven = 0x6;
    reg_wb_rom_enEven = 0x1;
    reg_wb_rom_enEven = 0x0;
    reg_wb_rom_dataOdd = 0x4fffff8;
    reg_wb_rom_addrOdd = 0x6;
    reg_wb_rom_enOdd = 0x1;
    reg_wb_rom_enOdd = 0x0;
    reg_wb_rom_dataEven = 0x0;
    reg_wb_rom_addrEven = 0x7;
    reg_wb_rom_enEven = 0x1;
    reg_wb_rom_enEven = 0x0;
    reg_wb_rom_dataOdd = 0x0;
    reg_wb_rom_addrOdd = 0x7;
    reg_wb_rom_enOdd = 0x1;
    reg_wb_rom_enOdd = 0x0;
    reg_wb_rom_dataEven = 0x0;
    reg_wb_rom_addrEven = 0x8;
    reg_wb_rom_enEven = 0x1;
    reg_wb_rom_enEven = 0x0;
    reg_wb_rom_dataOdd = 0x0;
    reg_wb_rom_addrOdd = 0x8;
    reg_wb_rom_enOdd = 0x1;
    reg_wb_rom_enOdd = 0x0;
    reg_wb_rom_dataEven = 0x0;
    reg_wb_rom_addrEven = 0x9;
    reg_wb_rom_enEven = 0x1;
    reg_wb_rom_enEven = 0x0;
    // end program
    reg_wb_bootAddr = 4097; // Change pc to match first entry in writeable rom
    reg_wb_reset = 0x0; // Set patmos reset low
}
