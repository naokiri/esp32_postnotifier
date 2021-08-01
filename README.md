Update of https://github.com/naokiri/post_notifier using different chip.
This sketch deep sleeps for long time (hard coded) to reduce power consumption and starts power consuming WiFi module only when needed.

## Target SDK
ESP-IDF v4.2

## Target Hardware
- ESP-WROOM-32
- HC-SR04 (or compatible ultrasonic distance sensor)

## Other used Hardware (not included for this sketch)
- TPS63000 converter (TI)
ESP32 may consume ~800mA on Wifi startup. Using this to give enough current.

## Future plan
Add schematic in this repo when I have time