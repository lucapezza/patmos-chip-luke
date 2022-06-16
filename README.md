# Caravel Patmos Project

This project is the result of a 13 week course of 12 students at DTU. It contains the time-predictable processor Patmos. See also following article: https://www.compute.dtu.dk/english/news/nyhed?id=ed010284-154f-43a3-a352-6dce97eaf72c

The original source is available at: https://github.com/t-crest/patmos

For this project we added SPI based memory in following fork: https://github.com/os-chip-design/patmos

More documentation on this project can be found at: https://github.com/os-chip-design/os-chip-design

## Fixing: Klayout Metal Minimum Clear Area Density

This is done in klayout on the gds after the user_project_wrapper is hardened!

1. Open klayout in edit mode and load the user_project_wrapper.gds 
2. Delete the contents of ```sky130_fd_sc_hd__decap_12``` (select the cell in Display->Select cell)
3. Open the sky130_fd_sc_hd library found at ```$PDK_ROOT/sky130A/libs.ref/sky130_fd_sc_hd/gds/sky130_fd_sc_hd.gds```
4. Select the ```sky130_ef_sc_hd__decap_12``` cell and copy the contents and paste into the ```sky130_fd_sc_hd__decap_12``` cell in user_project_wrapper.gds
