set /p port=What's the COM port? 

avr\bin\avrdude "-Cavr/etc/avrdude.conf" -v -V -patmega328p -carduino "-PCOM%port%" -b115200 -D "-Uflash:w:Sputterizer.ino.hex:i"
pause