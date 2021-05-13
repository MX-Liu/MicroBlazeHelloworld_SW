# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: D:\Github\Microblaze\MicroblazeHello_sw\gpio_hello_system\_ide\scripts\systemdebugger_gpio_hello_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source D:\Github\Microblaze\MicroblazeHello_sw\gpio_hello_system\_ide\scripts\systemdebugger_gpio_hello_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Nexys4 210274533163A" && level==0 && jtag_device_ctx=="jsn-Nexys4-210274533163A-13631093-0"}
fpga -file D:/Github/Microblaze/MicroblazeHello_sw/gpio_hello/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
loadhw -hw D:/Github/Microblaze/MicroblazeHello_sw/design_1_wrapper/export/design_1_wrapper/hw/design_1_wrapper.xsa -regs
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow D:/Github/Microblaze/MicroblazeHello_sw/gpio_hello/Debug/gpio_hello.elf
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
con
