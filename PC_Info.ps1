hostname > C:\ComputerInfo.txt
Get-WmiObject win32_bios | Select serialnumber >> C:\ComputerInfo.txt
Get-WmiObject win32_computersystem | Select * >> C:\ComputerInfo.txt
Get-WmiObject win32_product >> C:\ComputerInfo.txt

Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 15 >> C:\ComputerInfo.txt
