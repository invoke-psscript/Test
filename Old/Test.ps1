Get-WmiObject win32_bios | select serialnumber > C:\SerialNumber.txt

Get-WmiObject win32_diskdrive | select firmwarerevision, caption > C:\Firmware.txt
