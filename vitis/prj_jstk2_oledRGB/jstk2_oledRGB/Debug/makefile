################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
jstk2_oledRGB.elf.size \


# All Target
all:
	$(MAKE) --no-print-directory pre-build
	$(MAKE) --no-print-directory main-build

# Main-build Target
main-build: jstk2_oledRGB.elf secondary-outputs

# Tool invocations
jstk2_oledRGB.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: ARM v7 gcc linker'
	arm-none-eabi-gcc -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -Wl,-build-id=none -specs=Xilinx.spec -Wl,-T -Wl,../src/lscript.ld -LC:/Users/PC-CLICK-PLUS/Desktop/Stage_CRTI/vitis/prj_jstk2_oledRGB/jstk2_oledRGB_platforme/export/jstk2_oledRGB_platforme/sw/jstk2_oledRGB_platforme/standalone_domain/bsplib/lib -o "jstk2_oledRGB.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

jstk2_oledRGB.elf.size: jstk2_oledRGB.elf
	@echo 'Invoking: ARM v7 Print Size'
	arm-none-eabi-size jstk2_oledRGB.elf  |tee "jstk2_oledRGB.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(S_UPPER_DEPS)$(C_DEPS)$(ELFSIZE) jstk2_oledRGB.elf
	-@echo ' '

pre-build:
	-a9-linaro-pre-build-step
	-@echo ' '

secondary-outputs: $(ELFSIZE)

.PHONY: all clean dependents main-build pre-build

-include ../makefile.targets
