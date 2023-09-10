# How ro run ADB commands on a specific device from a list of connected devices

### 1.List the connected devices to get their serial numbers or IDs:
adb devices

### 2.Run ADB commands for the specific device using its serial number. Replace <serial_number> with the actual serial number of the device:
adb -s <serial_number> <your_command>

### For example:
adb -s XXXXXXXX install example.apk

adb -s 4c5aceef0405 shell input swipe 500 1500 500 500


