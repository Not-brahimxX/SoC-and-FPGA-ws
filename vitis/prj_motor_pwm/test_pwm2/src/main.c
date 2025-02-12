#include "xgpio.h"
#include "sleep.h"

#define GPIO_DEVICE_ID XPAR_GPIO_0_DEVICE_ID  // Update with your GPIO device ID
#define L1_PIN 0x01
#define L2_PIN 0x02
#define PWM_PIN 0x04

XGpio Gpio;  // GPIO instance

void generate_pwm(u32 duty_cycle, u32 frequency, u32 direction) {
    u32 period = 1000000 / frequency;  // Period in microseconds
    u32 high_time = (period * duty_cycle) / 100;  // Time the signal stays high
    u32 low_time = period - high_time;  // Time the signal stays low
    u32 gpio_output;

    // Set motor direction based on the "direction" parameter
    if (direction == 1) {
        gpio_output = L1_PIN;  // Set L1 high, L2 low for forward direction
    } else {
        gpio_output = L2_PIN;  // Set L2 high, L1 low for reverse direction
    }

    while (1) {
        // Set GPIO high (PWM + direction)
        XGpio_DiscreteWrite(&Gpio, 1, gpio_output | PWM_PIN);
        usleep(high_time);

        // Set GPIO low (only direction, no PWM)
        XGpio_DiscreteWrite(&Gpio, 1, gpio_output);
        usleep(low_time);
    }
}

int main() {
    int status;

    // Initialize the GPIO driver
    status = XGpio_Initialize(&Gpio, GPIO_DEVICE_ID);
    if (status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    // Set the GPIO direction to output for channel 1 (3 output pins: L1, L2, PWM)
    XGpio_SetDataDirection(&Gpio, 1, 0x00);  // Set all 3 pins as output

    // Generate a PWM signal with a 50% duty cycle and 1 kHz frequency, moving forward
    generate_pwm(100, 5000, 1);  // Use '1' for forward, '0' for reverse

    return 0;
}
