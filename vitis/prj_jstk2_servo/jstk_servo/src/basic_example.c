/******************************************************************************/
/*                                                                            */
/* basic_example.c -- Demo project for the PmodJSTK2 IP                       */
/*                                                                            */
/******************************************************************************/
/*                                                                            */
/* Author: Samuel Lowe`                                                       */
/* Copyright 2016, Digilent Inc.                                              */
/*                                                                            */
/******************************************************************************/
/* File Description:                                                          */
/*                                                                            */
/* This demo reads the calibrated data from the PmodJSTK2 and prints the X    */
/* and Y values while mapping the axis to the LED. If the buttons on the      */
/* JSTK2 are pressed, the LED will turn green                                 */
/*                                                                            */
/* Data can be received with a serial terminal application connected to your  */
/* board and configured to use the appropriate baud rate below.               */
/*                                                                            */
/******************************************************************************/
/* Revision History:                                                          */
/*                                                                            */
/*    06/27/2016(SamL):     Created                                           */
/*    11/01/2017(atangzwj): Validated for Vivado 2016.4                       */
/*    01/13/2018(atangzwj): Validated for Vivado 2017.4                       */
/*                                                                            */
/******************************************************************************/
/* Baud Rates:                                                                */
/*                                                                            */
/* Microblaze: 9600 or what was specified in UARTlite core                    */
/* Zynq: 115200                                                               */
/*                                                                            */
/******************************************************************************/

#include "PmodJSTK2.h"
#include "sleep.h"
#include "xil_cache.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xgpio.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xil_printf.h"
#include <sleep.h>
#include "xstatus.h"

#ifdef __MICROBLAZE__
#define CPU_CLOCK_FREQ_HZ (XPAR_CPU_CORE_CLOCK_FREQ_HZ)
#else
#define CPU_CLOCK_FREQ_HZ (XPAR_PS7_CORTEXA9_0_CPU_CLK_FREQ_HZ)
#endif

#define Servo_ID 		     XPAR_AXI_GPIO_0_DEVICE_ID
#define Servo_CHANNEL 	     1
XGpio Gpio;
int Initialize_GPIO(void);
static int IntcInitFunction(u16 DeviceId, XGpio *GpioInstancePtr);

PmodJSTK2 joystick;

void DemoInitialize();
void DemoRun();
void DemoCleanup();
void EnableCaches();
void DisableCaches();

int main() {
   DemoInitialize();
   Initialize_GPIO();
   // Initialise Push Buttons

   DemoRun();
   DemoCleanup();
   return 0;
}

void DemoInitialize() {
   EnableCaches();

   // Initialize the joystick device
   JSTK2_begin(
      &joystick,
      XPAR_PMODJSTK2_0_AXI_LITE_SPI_BASEADDR,
      XPAR_PMODJSTK2_0_AXI_LITE_GPIO_BASEADDR
   );

   // Set inversion register to invert only the Y axis
   JSTK2_setInversion(&joystick, 0, 1);
}

void DemoRun() {
   JSTK2_Position position;
   JSTK2_DataPacket rawdata;

   xil_printf("\r\nJoystick Demo\r\n");

   while (1) {
      // Get joystick x and y coordinate values
      position = JSTK2_getPosition(&joystick);
      // Get button states
      rawdata = JSTK2_getDataPacket(&joystick);

      xil_printf(
         "X:%d\tY:%d%s%s\r\n",
         position.XData,
         position.YData,
         (rawdata.Jstk != 0) ? "\tJoystick pressed" : "",
         (rawdata.Trigger != 0) ? "\tTrigger pressed" : ""
      );
      usleep(50000);

      // Set led from btns and axis
      if (rawdata.Jstk != 0 || rawdata.Trigger != 0) {
         JSTK2_setLedRGB(&joystick, 0, 255, 0);
      } else {
         JSTK2_setLedRGB(&joystick, position.XData, 0, position.YData);
      }

      if(position.XData == 0)
      	{
          	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 1);
          	usleep(1000);
          	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 0);
          	usleep(19000);

          	//usleep(2000000);
      	}

      	else if (position.XData == 192)
      	{
          	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 1);
          	usleep(1500);
          	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 0);
          	usleep(18500);
          	//usleep(2000000);

      	}

    	else if (position.XData == 255)
    	{
        	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 1);
        	usleep(2000);
        	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 0);
        	usleep(18000);
        	//usleep(2000000);

    	}


   }
}

void DemoCleanup() {
   DisableCaches();
}

void EnableCaches() {
#ifdef __MICROBLAZE__
#ifdef XPAR_MICROBLAZE_USE_ICACHE
   Xil_ICacheEnable();
#endif
#ifdef XPAR_MICROBLAZE_USE_DCACHE
   Xil_DCacheEnable();
#endif
#endif
}

void DisableCaches() {
#ifdef __MICROBLAZE__
#ifdef XPAR_MICROBLAZE_USE_DCACHE
   Xil_DCacheDisable();
#endif
#ifdef XPAR_MICROBLAZE_USE_ICACHE
   Xil_ICacheDisable();
#endif
#endif
}

int Initialize_GPIO(){

			int Status;


			Status = XGpio_Initialize(&Gpio, Servo_ID);
						if(Status != XST_SUCCESS) return XST_FAILURE;

			XGpio_SetDataDirection(&Gpio, Servo_CHANNEL,0x00);



		return Status;
}
