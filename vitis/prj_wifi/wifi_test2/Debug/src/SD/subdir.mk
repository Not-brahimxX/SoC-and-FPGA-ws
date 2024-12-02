################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/SD/DFATFS.cpp \
../src/SD/DSDIOVOL.cpp \
../src/SD/fs_diskio.cpp 

OBJS += \
./src/SD/DFATFS.o \
./src/SD/DSDIOVOL.o \
./src/SD/fs_diskio.o 

CPP_DEPS += \
./src/SD/DFATFS.d \
./src/SD/DSDIOVOL.d \
./src/SD/fs_diskio.d 


# Each subdirectory must supply rules for building sources it contributes
src/SD/%.o: ../src/SD/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -IC:/Users/PC-CLICK-PLUS/Desktop/Stage_CRTI/vitis/prj_wifi/wifi_platforme2/export/wifi_platforme2/sw/wifi_platforme2/standalone_domain/bspinclude/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


