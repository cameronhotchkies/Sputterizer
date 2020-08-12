@echo off

set /p port=What's the COM port? 

updater\avr\bin\avrdude "-Cupdater/avr/etc/avrdude.conf" -v -V -patmega328p -carduino "-PCOM%port%" -b115200 -D "-Uflash:w:build\Sputterizer.ino.hex:i"
pause