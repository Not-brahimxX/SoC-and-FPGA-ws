################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/deWebIOServer/HTMLGetPins.cpp \
../src/deWebIOServer/deWebIOServerSrc.cpp 

OBJS += \
./src/deWebIOServer/HTMLGetPins.o \
./src/deWebIOServer/deWebIOServerSrc.o 

CPP_DEPS += \
./src/deWebIOServer/HTMLGetPins.d \
./src/deWebIOServer/deWebIOServerSrc.d 


# Each subdirectory must supply rules for building sources it contributes
src/deWebIOServer/%.o: ../src/deWebIOServer/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -IC:/Users/PC-CLICK-PLUS/Desktop/Stage_CRTI/vitis/prj_wifi/wifi_platforme2/export/wifi_platforme2/sw/wifi_platforme2/standalone_domain/bspinclude/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


