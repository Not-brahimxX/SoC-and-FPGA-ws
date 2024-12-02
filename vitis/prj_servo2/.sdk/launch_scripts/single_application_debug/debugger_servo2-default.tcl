connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zed 210248764391" && level==0} -index 1
fpga -file C:/Users/PC-CLICK-PLUS/Desktop/Stage_CRTI/vitis/prj_servo2/servo2/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/PC-CLICK-PLUS/Desktop/Stage_CRTI/vitis/prj_servo2/servo/export/servo/hw/design_1_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Users/PC-CLICK-PLUS/Desktop/Stage_CRTI/vitis/prj_servo2/servo2/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/Users/PC-CLICK-PLUS/Desktop/Stage_CRTI/vitis/prj_servo2/servo2/Debug/servo2.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
