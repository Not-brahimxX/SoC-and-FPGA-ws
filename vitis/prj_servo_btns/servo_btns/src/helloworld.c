#include "xparameters.h"
#include "xgpio.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xil_printf.h"
#include <sleep.h>
#include "xstatus.h"

// Parameter definitions
#define INTC_DEVICE_ID 		XPAR_PS7_SCUGIC_0_DEVICE_ID
#define BTNS_DEVICE_ID		XPAR_AXI_GPIO_0_DEVICE_ID
#define INTC_GPIO_INTERRUPT_ID   XPAR_FABRIC_AXI_GPIO_0_IP2INTC_IRPT_INTR

#define Servo_ID 		     XPAR_AXI_GPIO_1_DEVICE_ID
#define Servo_CHANNEL 	     1
XGpio Gpio;

int Initialize_GPIO(void);

#define BTN_INT 			XGPIO_IR_CH1_MASK

XGpio BTNInst;
XScuGic INTCInst;
static int btn_value;

//----------------------------------------------------
// PROTOTYPE FUNCTIONS
//----------------------------------------------------
static void BTN_Intr_Handler(void *baseaddr_p);
static int InterruptSystemSetup(XScuGic *XScuGicInstancePtr);
static int IntcInitFunction(u16 DeviceId, XGpio *GpioInstancePtr);

//----------------------------------------------------
// INTERRUPT HANDLER FUNCTIONS
// - called by the timer, button interrupt, performs
// - LED flashing
//----------------------------------------------------

void BTN_Intr_Handler(void *InstancePtr)
{
	volatile int Delay;
	// Disable GPIO interrupts
	XGpio_InterruptDisable(&BTNInst, BTN_INT);
	// Ignore additional button presses
	if ((XGpio_InterruptGetStatus(&BTNInst) & BTN_INT) !=
			BTN_INT) {
			return;
		}
	btn_value = XGpio_DiscreteRead(&BTNInst, 1);
	// Increment counter based on button value
	// Reset if centre button pressed
	if(btn_value == 2)
	{
    	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 1);
    	usleep(1000);
    	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 0);
    	usleep(19000);

    	usleep(2000000);
	}

	else if (btn_value == 4)
	{
    	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 1);
    	usleep(1500);
    	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 0);
    	usleep(18500);
    	usleep(2000000);

	}
	else if (btn_value == 8)
	{
    	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 1);
    	usleep(2000);
    	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 0);
    	usleep(18000);
    	usleep(2000000);

	}
	else if (btn_value == 16)
	{
        do
		{
    	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 1);
    	usleep(1000);
    	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 0);
    	usleep(19000);
    	usleep(2000000);
    	btn_value = XGpio_DiscreteRead(&BTNInst, 1);

    	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 1);
    	usleep(1500);
    	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 0);
    	usleep(18500);
    	usleep(2000000);
    	btn_value = XGpio_DiscreteRead(&BTNInst, 1);

    	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 1);
    	usleep(2000);
    	XGpio_DiscreteWrite(&Gpio,Servo_CHANNEL , 0);
    	usleep(18000);
    	usleep(2000000);
    	btn_value = XGpio_DiscreteRead(&BTNInst, 1);
		}while(btn_value !=  1);
	}


    (void)XGpio_InterruptClear(&BTNInst, BTN_INT);
    // Enable GPIO interrupts
    XGpio_InterruptEnable(&BTNInst, BTN_INT);
}

//----------------------------------------------------
// MAIN FUNCTION
//----------------------------------------------------
int main (void) {

  int status;
  //----------------------------------------------------
  // INITIALIZE THE PERIPHERALS & SET DIRECTIONS OF GPIO
  //----------------------------------------------------
  // Initialise GPIO
  Initialize_GPIO();
  // Initialise Push Buttons
  status = XGpio_Initialize(&BTNInst, BTNS_DEVICE_ID);
  if(status != XST_SUCCESS) return XST_FAILURE;
  // Set LEDs direction to outputs

  // Set all buttons direction to inputs
  XGpio_SetDataDirection(&BTNInst, 1, 0xFF);

  // Initialize interrupt controller
  status = IntcInitFunction(INTC_DEVICE_ID, &BTNInst);
  if(status != XST_SUCCESS) return XST_FAILURE;




  while(1);

  return 0;
}

//----------------------------------------------------
// INITIAL SETUP FUNCTIONS
//----------------------------------------------------

int InterruptSystemSetup(XScuGic *XScuGicInstancePtr)
{
	// Enable interrupt
	XGpio_InterruptEnable(&BTNInst, BTN_INT);
	XGpio_InterruptGlobalEnable(&BTNInst);

	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			 	 	 	 	 	 (Xil_ExceptionHandler)XScuGic_InterruptHandler,
			 	 	 	 	 	 XScuGicInstancePtr);
	Xil_ExceptionEnable();


	return XST_SUCCESS;

}

int IntcInitFunction(u16 DeviceId, XGpio *GpioInstancePtr)
{
	XScuGic_Config *IntcConfig;
	int status;

	// Interrupt controller initialisation
	IntcConfig = XScuGic_LookupConfig(DeviceId);
	status = XScuGic_CfgInitialize(&INTCInst, IntcConfig, IntcConfig->CpuBaseAddress);
	if(status != XST_SUCCESS) return XST_FAILURE;

	// Call to interrupt setup
	status = InterruptSystemSetup(&INTCInst);
	if(status != XST_SUCCESS) return XST_FAILURE;

	// Connect GPIO interrupt to handler
	status = XScuGic_Connect(&INTCInst,
					  	  	 INTC_GPIO_INTERRUPT_ID,
					  	  	 (Xil_ExceptionHandler)BTN_Intr_Handler,
					  	  	 (void *)GpioInstancePtr);
	if(status != XST_SUCCESS) return XST_FAILURE;

	// Enable GPIO interrupts interrupt
	XGpio_InterruptEnable(GpioInstancePtr, 1);
	XGpio_InterruptGlobalEnable(GpioInstancePtr);

	// Enable GPIO and timer interrupts in the controller
	XScuGic_Enable(&INTCInst, INTC_GPIO_INTERRUPT_ID);

	return XST_SUCCESS;
}



int Initialize_GPIO(){

			int Status;


			Status = XGpio_Initialize(&Gpio, Servo_ID);
						if(Status != XST_SUCCESS) return XST_FAILURE;

			XGpio_SetDataDirection(&Gpio, Servo_CHANNEL,0x00);



		return Status;
}

