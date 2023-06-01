hostname > C:\ComputerInfo.txt
Get-WmiObject win32bios | Select serialnumber >> C:\ComputerInfo.txt
Get-WmiObject win32computersystem | Select * >> C:\ComputerInfo.txt
Get-WmiObject win32_product > C:\ComputerInfo.txt
