connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Xilinx TUL 1234-tulA" && level==0} -index 1
fpga -file C:/Users/PC-CLICK-PLUS/Desktop/Stage_CRTI/vitis/prj_motor_pwm/test_pwm/_ide/bitstream/design_2_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/PC-CLICK-PLUS/Desktop/Stage_CRTI/vitis/prj_motor_pwm/motor_pwm_plztforme/export/motor_pwm_plztforme/hw/design_2_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Users/PC-CLICK-PLUS/Desktop/Stage_CRTI/vitis/prj_motor_pwm/test_pwm/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/Users/PC-CLICK-PLUS/Desktop/Stage_CRTI/vitis/prj_motor_pwm/test_pwm/Debug/test_pwm.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
