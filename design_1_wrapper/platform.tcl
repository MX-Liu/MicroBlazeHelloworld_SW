# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct D:\Github\Microblaze\MicroblazeHello_sw\design_1_wrapper\platform.tcl
# 
# OR launch xsct and run below command.
# source D:\Github\Microblaze\MicroblazeHello_sw\design_1_wrapper\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {design_1_wrapper}\
-hw {D:\Github\Microblaze\Microblaze_helloword\design_1_wrapper.xsa}\
-fsbl-target {psu_cortexa53_0} -out {D:/Github/Microblaze/MicroblazeHello_sw}

platform write
domain create -name {standalone_microblaze_0} -display-name {standalone_microblaze_0} -os {standalone} -proc {microblaze_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {design_1_wrapper}
platform generate -quick
platform generate
