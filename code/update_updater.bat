@echo off
copy build\Sputterizer.ino.hex updater

"C:\Program Files\7-Zip\7z.exe" a -r updater.zip updater 

pause