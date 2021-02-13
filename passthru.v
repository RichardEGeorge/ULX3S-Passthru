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
