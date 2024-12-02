#include <xparameters.h>
#include "xstatus.h"
#include "xgpio.h"
#include "xil_printf.h"
#include <sleep.h>

#define Servo_ID 		     XPAR_AXI_GPIO_0_DEVICE_ID
#define Servo_CHANNEL 	     1

XGpio Gpio;

int Initialize_GPIO(void);

int main (){

	Initialize_GPIO();
    while(1){

    	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 1);
    	usleep(1000);
    	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 0);
    	usleep(19000);

    	usleep(2000000);

    	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 1);
    	usleep(1500);
    	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 0);
    	usleep(18500);

    	usleep(2000000);

    	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 1);
    	usleep(2000);
    	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 0);
    	usleep(18000);
    	usleep(2000000);


    }


}





		int Initialize_GPIO(){

					int Status;


					Status = XGpio_Initialize(&Gpio, Servo_ID);
								if(Status != XST_SUCCESS) return XST_FAILURE;

					XGpio_SetDataDirection(&Gpio, Servo_CHANNEL,0x00);



				return Status;
		}
