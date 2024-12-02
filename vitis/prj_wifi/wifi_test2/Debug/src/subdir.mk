################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

CC_SRCS += \
../src/main.cc 

CPP_SRCS += \
../src/HTMLReboot.cpp \
../src/HTMLRestart.cpp \
../src/HTMLSDPage.cpp \
../src/HTMLTerminate.cpp \
../src/HTTPHelpers.cpp \
../src/Helper.cpp \
../src/ProcessClient.cpp \
../src/ProcessServer.cpp 

CC_DEPS += \
./src/main.d 

OBJS += \
./src/HTMLReboot.o \
./src/HTMLRestart.o \
./src/HTMLSDPage.o \
./src/HTMLTerminate.o \
./src/HTTPHelpers.o \
./src/Helper.o \
./src/ProcessClient.o \
./src/ProcessServer.o \
./src/main.o 

CPP_DEPS += \
./src/HTMLReboot.d \
./src/HTMLRestart.d \
./src/HTMLSDPage.d \
./src/HTMLTerminate.d \
./src/HTTPHelpers.d \
./src/Helper.d \
./src/ProcessClient.d \
./src/ProcessServer.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -IC:/Users/PC-CLICK-PLUS/Desktop/Stage_CRTI/vitis/prj_wifi/wifi_platforme2/export/wifi_platforme2/sw/wifi_platforme2/standalone_domain/bspinclude/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -IC:/Users/PC-CLICK-PLUS/Desktop/Stage_CRTI/vitis/prj_wifi/wifi_platforme2/export/wifi_platforme2/sw/wifi_platforme2/standalone_domain/bspinclude/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


