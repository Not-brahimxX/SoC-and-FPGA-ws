#
# This file was created by Xilinx Vitis tool.
#


#
# tools
#

RM = rm -f
RMDIR = rm -rf

#
# variables
#

SDCARD_GEN = sdcard_gen
GENERATE_BIF = ::scw::generate_bif

XPFM_PATH = C:/Users/PC-CLICK-PLUS/Desktop/Stage_CRTI/vitis/prj_jstk2_servo/jtsk2_servo_platforme/export/jtsk2_servo_platforme/jtsk2_servo_platforme.xpfm
SYS_CONFIG = jtsk2_servo_platforme
DOMAINS = standalone_domain
BIF_PATH = C:/Users/PC-CLICK-PLUS/Desktop/Stage_CRTI/vitis/prj_jstk2_servo/jstk_servo_system/Debug/system.bif

BITSTREAM_PATH = C:/Users/PC-CLICK-PLUS/Desktop/Stage_CRTI/vitis/prj_jstk2_servo/jstk_servo/_ide/bitstream/design_1_wrapper.bit
SD_FILES = --elf C:/Users/PC-CLICK-PLUS/Desktop/Stage_CRTI/vitis/prj_jstk2_servo/jstk_servo/Debug/jstk_servo.elf,ps7_cortexa9_0

#
# primary build targets
#

all: sd_card

sd_card:
	-@echo Generating bif file for the system project
	generate_system_bif.bat 55485 ${XPFM_PATH} ${DOMAINS} ${BIF_PATH}
	${SDCARD_GEN} --xpfm ${XPFM_PATH} --sys_config ${SYS_CONFIG} --bif ${BIF_PATH} --bitstream ${BITSTREAM_PATH} ${SD_FILES}

clean:
	$(RMDIR) ./_sds
	${RMDIR} sd_card
	${RM} system.bif

.PHONY: all sd_card clean


