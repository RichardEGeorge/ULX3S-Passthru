# ULX3S Pass-Through

This is about the simplest project possible for the ULX3S board. This code reads the six buttons and copies their values to the first six LEDs. The seventh LED is kept turned off and the Wifi is disabled.  This code is based on the [blinky](https://github.com/DoctorWkt/blinky) example by [DoctorWkt](https://github.com/DoctorWkt). The source code is as below:

```verilog
module top(input [6:0] btn,
           output [7:0] led,
           output wifi_gpio0);
           
   // Set the Wifi GPIO 0 to logic high, to prevent resets
   assign wifi_gpio0 = 1'b1;
           
   // Pass through the input values on the buttons to the output LEDs
   assign led[6:0] = btn[6:0];
           
   // We have one more LED than button, so set that final LED to off
   assign led[7] = 1'b0;

endmodule
```

## Requirements

Compiling and executing this example requires working copies of `ecppack`, `nextpnr`, `yosys`, and `fugprog`.

## Building

The Makefile is configured to target a ULX3S-85F board, running `make prog` will program the board using the fujprog programmer.